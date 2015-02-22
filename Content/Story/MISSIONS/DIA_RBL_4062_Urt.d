var int hero_is_in_kevin_room_ontime;
func int Kevin_Door()
{
	// 	if(hero_is_in_kevin_room_ontime==1)&&(Npc_IsPlayer(self))
	// 	{
	// 		return 0;
	// 	}
	// 	else
	// 	{
	return 1;
	//	};
};
func int Kevin_Touch_Func()
{
	if(hero_is_in_kevin_room_ontime!=2)//&&(Npc_KnowsInfo(hero,DIA_Urt_ShadowSucess))
	{
		hero_is_in_kevin_room_ontime = TRUE;
	};
};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Urt_Exit (C_INFO)
{
	npc			= RBL_4062_Urt;
	nr			= 999;
	condition	= DIA_Urt_Exit_Condition;
	information	= DIA_Urt_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Urt_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Urt_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Urt_Hello (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 1;
	condition		= DIA_Urt_Hello_Condition;
	information		= DIA_Urt_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Urt_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_RATFORD_OldCampSpy))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Hello_Info()
{
	B_GiveXP(250);
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other, "DIA_Urt_Hello_11_00"); //St�j, gdzie leziesz?!
	AI_Output (other, self, "DIA_Urt_Hello_15_01"); //Ty jeste� Urt? Ratford powiedzia�, �e mog� od Ciebie dosta� wdzianko stra�nika.
	AI_Output (self, other, "DIA_Urt_Hello_11_02"); //A po choler� Ci ten pancerz?
	AI_Output (other, self, "DIA_Urt_Hello_15_03"); //Zg�osi�em si� na 'ochotnika', �eby pomyszkowa� w Starym Obozie.
	AI_Output (self, other, "DIA_Urt_Hello_11_04"); //To mi�o by�o Ci� pozna�, bo ju� jeste� trupem.
	AI_Output (other, self, "DIA_Urt_Hello_15_05"); //Nie potrzebuj� wnikliwej analizy sytuacji, tylko zbroi.
	AI_Output (self, other, "DIA_Urt_Hello_11_06"); //W ko�cu to Twoje �ycie. We� t�, �lady krwi ju� prawie zasch�y.
	AI_Output (self, other, "DIA_Urt_Hello_11_07"); //Wyobra� sobie, �e dure�, kt�ry wcze�niej nosi� ten pancerz schla� si� i spad� z palisady. Chyba nawet nikt nie zauwa�y� tej straty.
	AI_Output (other, self, "DIA_Urt_Hello_15_08"); //Dostan� pancerz czy najpierw zagadasz mnie na �mier�?
	AI_Output (self, other, "DIA_Urt_Hello_11_09"); //Bierz �achmany i powodzenia, bo b�dziesz go potrzebowa�.
	
	CreateInvItem(self, GRD_ARMOR_L);
	B_GiveInvItems(self, other, GRD_ARMOR_L, 1);
	AI_EquipArmor(other, GRD_ARMOR_L);
   
	AI_Output (other, self, "DIA_Urt_Hello_15_10"); //Dzi�ki... Ale ta zbroja cuchnie!
	AI_Output (self, other, "DIA_Urt_Hello_11_11"); //Dam Ci dobr� rad�. Staraj si� nie rzuca� w oczy.
	AI_Output (self, other, "DIA_Urt_Hello_11_12"); //Stra�nicy do�� dobrze si� znaj�. 
	AI_Output (self, other, "DIA_Urt_Hello_11_13"); //Z obozu wychodz� tylko ci, kt�rzy wype�niaj� konkretne rozkazy, najcz�ciej wydawane przez Gomeza, albo Kruka.
	AI_Output (self, other, "DIA_Urt_Hello_11_14"); //Skontaktuj si� z naszym cz�owiekiem, tylko tak b�dziesz m�g� wyj�� �ywy z obozu.
	AI_Output (self, other, "DIA_Urt_Hello_11_15"); //By� mo�e jeszcze si� spotkamy...

	B_LogEntry(CH3_RBL_OldCampSpy, "Mam ju� zbroj� stra�nika.");
   B_equipment_to_OC();
   
	B_StopProcessInfos(self);

	/***************************
	Kole� ma i�� do obozu ale najpierw przebra� si� w pancerz no i stra�nicy nie powinno go atakowa�
	****************************/

	Npc_ExchangeRoutine(self,"OC");
	
	Wld_InsertNpc(Grd_214_Torwache,"OC1");//Nordtor			
	Wld_InsertNpc(Grd_215_Torwache,"OC1");//Nordtor 	
	/***********************
	Dick_guild_changer();

	Ork trzebaby tutaj chyba zmieni� jako� gildi� dickowi, czy co�. Znaczy wraz ze zmian� pancerza, �eby stra�nicy go nie t�ukli.
	************************/
};

// **************************************************

INSTANCE DIA_Urt_Again (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 2;
	condition		= DIA_Urt_Again_Condition;
	information		= DIA_Urt_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Urt_Again_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Grd_215_First))&&(Npc_KnowsInfo(hero,DIA_Urt_Hello ))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Again_Info()
{
	B_GiveXP(250);
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	//NOTE: Crappy dialog modified by orc
	AI_Output (self, other, "DIA_Urt_Again_11_00"); //A jednak uda�o Ci si� wej��! Jestem pod wra�eniem!
	AI_Output (other, self, "DIA_Urt_Again_15_01"); //Jak si� tu dosta�e�?
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_Urt_Again_11_02"); //Podobnie jak Ty, udaj� stra�nika. Pr�buj� te� zorganizowa� z Kelvinem niespodziank� dla Gomeza.
	AI_Output (other, self, "DIA_Urt_Again_15_03"); //Co to za niespodzianka?
	AI_Output (self, other, "DIA_Urt_Again_11_04"); //Wszystkiego dowiesz si� w swoim czasie. Teraz mam dla Ciebie co� do zrobienia.
	AI_Output (other, self, "DIA_Urt_Again_15_05"); //Chwileczk�. Ratford wys�a� mnie tylko po to, �ebym spotka� si� z Kelvinem.
	AI_Output (self, other, "DIA_Urt_Again_11_06"); //Wiem, ale Kevin przebywa w zamku, a Ty nie dostaniesz si� tak po prostu do twierdzy.
	AI_Output (other, self, "DIA_Urt_Again_15_07"); //Wi�c pom� mi, na pewno wiesz jak to zrobi�.
	AI_Output (self, other, "DIA_Urt_Again_11_08"); //Jasne, ale zanim ja pomog� Tobie, Ty musisz pom�c mi.
	AI_Output (self, other, "DIA_Urt_Again_11_09"); //I zanim zaczniesz si� wykr�ca�, pami�taj dla kogo oboje pracujemy.
	AI_Output (other, self, "DIA_Urt_Again_15_10"); //M�w o co chodzi.
	AI_Output (self, other, "DIA_Urt_Again_11_11"); //Stra�nicy magazynuj� w obozie zapasy broni. Musimy przej�� te paczki.
	AI_Output (other, self, "DIA_Urt_Again_15_12"); //A jak ja mam niby to zrobi�?!
	AI_Output (self, other, "DIA_Urt_Again_11_13"); //To ju� Twoje zmartwienie. Z tego co wiem cz�� paczek przechowuj� w magazynie nieopodal areny, reszt� chyba gdzie� na targowisku.
	AI_Output (self, other, "DIA_Urt_Again_11_14"); //Przynie� mi wszystko co tam znajdziesz, my�l�, �e powinno by� z dziesi�� paczek.
	AI_Output (self, other, "DIA_Urt_Again_11_15"); //Wtedy dowiesz si� co dalej.
	AI_Output (self, other, "DIA_Urt_Again_11_16"); //Wybacz te podchody, ale najpierw musz� by� pewien, �e podo�asz temu co nas czeka.
	AI_Output (self, other, "DIA_Urt_Again_11_17"); //Kiedy ju� zdob�dziesz paczki, znajdziesz mnie w pobli�u tego miejsca.
	AI_Output (self, other, "DIA_Urt_Again_11_19"); //Powodzenia.
	Log_CreateTopic	(CH3_RBL_Weapon, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_Weapon, LOG_RUNNING);
	B_LogEntry		(CH3_RBL_Weapon, "Musz� zdoby� dla Urta paczki z broni�, kt�r� stra�nicy magazynuj� w obozie. Mo�e ich by� oko�o dziesi�ciu. Z informacji Urta wynika ze paczki znajduj� si� w magazynach przy arenie i targowisku. Kiedy ju� zdob�d� wszystkie paczki, znajd� go w pobli�u miejsca gdzie go spotka�em w obozie.");
	B_LogEntry		(CH3_RBL_OldCampSpy, "Kelvin jest w zamku do kt�rego nie mam wst�pu. Urt, jego wsp�lnik w obozie, pomo�e mi do niego dotrze�. Jednak najpierw musz� pom�c Urtowi.");	
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"OC2");
};

/**************************************************/

INSTANCE DIA_Urt_Packages (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 3;
	condition		= DIA_Urt_Packages_Condition;
	information		= DIA_Urt_Packages_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam wszystkie paczki."; 
};

FUNC INT DIA_Urt_Packages_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Urt_Again ))&&(NPC_HasItems(other,packageOC)>=10)
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Packages_Info()
{
	B_GiveXP(500);
	AI_Output (other, self, "DIA_Urt_Packages_15_01"); //Mam wszystkie paczki.
	AI_Output (self, other, "DIA_Urt_Packages_11_02"); //Wiedzia�em, �e sobie poradzisz. Strata broni os�abi stra�nik�w podw�jnie.
	AI_Output (self, other, "DIA_Urt_Packages_11_03"); //Po pierwsze, cz�� z nich w decyduj�cym momencie b�dzie musia�a walczy� pogrzebaczami. A druga sprawa to morale. Kiedy dowiedz� si�, �e kto� zwin�� bro� z obozu pod ich nosem poczuj� si� mniej pewnie.
	AI_Output (self, other, "DIA_Urt_Packages_11_04"); //Naprawd� �wietna robota.
	B_GiveInvItems (other, self, packageOC, 10);
	Npc_RemoveInvItems(self,packageOC,10);
	//NOTE: Crappy dialog modified by orc
	
	AI_Output (other, self, "DIA_Urt_Packages_15_05"); //Nie wydaje Ci si�, �e jak si� zorientuj�, �e zapasy znikn�y to ich tylko rozsierdzi i za wszelk� cen� b�d� szuka� sprawcy?
	AI_Output (self, other, "DIA_Urt_Packages_11_06"); //I dobrze, ten kto dzia�a w gniewie pope�nia b��dy. Nie znajd� nas, jeste�my na to za cwani.
	AI_Output (self, other, "DIA_Urt_Packages_11_07"); //Da�e� sobie �wietnie rad�, ale to jeszcze nie koniec.
	AI_Output (self, other, "DIA_Urt_Packages_11_08"); //Musimy stworzy� solidne podwaliny rebelii.
	AI_Output (other, self, "DIA_Urt_Packages_15_09"); //Nie masz chyba zamiaru agitowa� stra�nik�w do przej�cia na nasz� stron�?
	AI_Output (self, other, "DIA_Urt_Packages_11_10"); //Nie o stra�nikach m�wi�. S� tutaj inne gildie, kt�rych nie docenia �adna ze stron - cienie i kopacze.
	AI_Output (other, self, "DIA_Urt_Packages_15_11"); //Hmm, to mo�e si� uda�. Ale jak zamierzasz ich przekona� do walki po naszej stronie?
	AI_Output (self, other, "DIA_Urt_Packages_11_12"); //Cienie po odej�ciu Diego i tak s� na bakier ze stra�nikami. W zasadzie wojna wisi na w�osku. Cieniom brak jednak przyw�dcy, kt�ry przekona ich do walki, kogo� komu ufaj�.
	AI_Output (other, self, "DIA_Urt_Packages_15_13"); //A kopacze?
	AI_Output (self, other, "DIA_Urt_Packages_11_14"); //Ci maj� do�� wszystkiego. Ka�dy nimi pomiata. Wystarczy sprawi�, �eby poczuli si� jak ludzie, a zerw� okowy i wbij� kilofy w plecy stra�nik�w.
	AI_Output (self, other, "DIA_Urt_Packages_11_15"); //T� cz�ci� zadania mia� si� zaj�� Kelvin. Ja musz� jeszcze ukry� paczki z broni� i za�atwi� kilka spraw. 
	AI_Output (self, other, "DIA_Urt_Packages_11_16"); //Zaczniesz od przekonania Kopaczy. Porozmawiaj z ich przyw�dcami. Jest ich trzech - Grimes, Guy i Grim.
	AI_Output (self, other, "DIA_Urt_Packages_11_17"); //Je�eli chcemy utopi� Gomeza we krwi, kopacze musz� stan�� po naszej stronie.
	AI_Output (other, self, "DIA_Urt_Packages_15_18"); //Zrobi� co w mojej mocy.	
	
	// 	Log_CreateTopic	(CH3_RBL_Shadows, LOG_MISSION);
	// 	Log_SetTopicStatus	(CH3_RBL_Shadows, LOG_RUNNING);
	//	B_LogEntry		(CH3_RBL_Shadows, "Musz� przekona� Cienie do walki po naszej stronie. Ich obecnym przyw�dc� jest Balam - kucharz Gomeza. Musz� z nim porozmawia�.");
	Log_CreateTopic	(CH3_RBL_Buddler, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_Buddler, LOG_RUNNING);
	B_LogEntry		(CH3_RBL_Buddler, "�eby przekona� kopaczy musz� przekona� ich przyw�dc�w - Grimesa, Guya i Grima. Od tego mo�e zale�e� nie tylko los kopaczy, ale tak�e powodzenie ataku.");

	Log_SetTopicStatus	(CH3_RBL_Weapon, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_Weapon, "Przynios�em Urtowi wszystkie paczki z broni�. Teraz czeka mnie kolejne zadanie.");
	B_LogEntry		(CH3_RBL_OldCampSpy, "Paczki z broni� przydadz� si� naszym sojusznikom w obozie.");
	B_LogEntry		(CH3_RBL_OldCampSpy, "Urt zleci� mi kolejne zadanie. Musz� przekona� kopaczy. Kiedy do cholery dowiem si� wreszcie jak dosta� si� do zamku?");
};

var int urt_go;

/**************************************************/

INSTANCE DIA_Urt_Buddler (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 5;
	condition		= DIA_Urt_Buddler_Condition;
	information		= DIA_Urt_Buddler_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kopaczy mamy z g�owy."; 
};

FUNC INT DIA_Urt_Buddler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Urt_Packages))&&(buddler_join == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Buddler_Info()
{
	//NOTE: Crappy dialog modified by orc

	AI_Output (other, self, "DIA_Urt_Buddler_15_01"); //Kopaczy mamy z g�owy.
	AI_Output (self, other, "DIA_Urt_Buddler_11_02"); //�wietna robota. 
	AI_Output (self, other, "DIA_Urt_Buddler_11_03"); //Nadszed� czas na trudniejsz� przepraw�. Porozmawiaj z Balamem, to kucharz Gomeza. Po odej�ciu Diego to on zosta� nieoficjalnym przyw�dc� cieni.
	AI_Output (self, other, "DIA_Urt_Buddler_11_04"); //Balam jest blisko koryta, wie co si� �wi�ci i zawsze jest dobrze poinformowany.
	//NOTE: Crappy dialog modified by orc
	AI_Output (self, other, "DIA_Urt_Buddler_11_05"); //Od czasu do czasu znajdziesz go poza kasztelem, wtedy by�oby najbezpieczniej z nim porozmawia�.
	//NOTE: Crappy dialog modified by orc
	AI_Output (self, other, "DIA_Urt_Buddler_11_06"); //Ja wracam do swoich zaj��. Powodzenia.

	Log_SetTopicStatus	(CH3_RBL_Buddler, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_Buddler, "Zdoby�em poparcie wszystkich przyw�dc�w kopaczy.");
	B_LogEntry(CH3_RBL_OldCampSpy, "Uda�o si� zdoby� poparcie kopaczy. Teraz czas na zdobycie zaufania cieni.");

	Log_CreateTopic	(CH3_RBL_Shadows, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_Shadows, LOG_RUNNING);
	//NOTE: Crappy dialog modified by orc 	
	B_LogEntry		(CH3_RBL_Shadows, "Musz� przekona� cienie do walki po naszej stronie. Ich obecnym przyw�dc� jest Balam - kucharz Gomeza. Musz� z nim porozmawia�, wieczorem jest widywany na terenie ca�ego zewn�trznego pier�cienia.");
	//NOTE: Crappy dialog modified by orc
};

// ---------------------------go----------------------------------------

/**************************************************/

INSTANCE DIA_Urt_Diego (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 4;
	condition		= DIA_Urt_Diego_Condition;
	information		= DIA_Urt_Diego_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozmawia�em z Diego."; 
};

FUNC INT DIA_Urt_Diego_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Rebel))
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Diego_Info()
{
	//NOTE: Crappy dialog modified by orc 	

	AI_Output (other, self, "DIA_Urt_Diego_15_01"); //Rozmawia�em z Diego.
	AI_Output (self, other, "DIA_Urt_Diego_11_02"); //Nie�le. Czyli cieni mamy ju� z g�owy?
	AI_Output (other, self, "DIA_Urt_Diego_15_03"); //Niezupe�nie. Musz� jeszcze znale�� spos�b na to, �eby sprowadzi� go do obozu.
	AI_Output (self, other, "DIA_Urt_Diego_11_04"); //To na co czekasz? A� Gomez wy�le ci zaproszenie?
	AI_Output (other, self, "DIA_Urt_Diego_15_05"); //Bardzo �mieszne. Id� odwali� za Ciebie czarn� robot�.
};

/**************************************************/

INSTANCE DIA_Urt_ShadowSucess (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 9;
	condition		= DIA_Urt_ShadowSucess_Condition;
	information		= DIA_Urt_ShadowSucess_Info;
	permanent		= 0;
	important		= 1;
	description		= "Cienie stan� po naszej stronie."; 
};

FUNC INT DIA_Urt_ShadowSucess_Condition()
{
	//TODO / FIX TEST
	if (Npc_KnowsInfo (hero,STT_Balam_DiegoCome))
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_ShadowSucess_Info()
{
	B_GiveXP(250);

	//NOTE: Crappy dialog modified by orc 	

	AI_Output (other, self, "DIA_Urt_ShadowSucess_15_00"); //Cienie stan� po naszej stronie.
	AI_Output (self, other, "DIA_Urt_ShadowSucess_11_01"); //�wietna robota. Z reszt� moich zada� dam sobie rad�.
	AI_Output (self, other, "DIA_Urt_ShadowSucess_11_02"); //We� ten list, przedstaw si� jako pos�aniec Fletchera z Nowego Obozu, stra�nicy na pewno to �ykn�.
	AI_Output (self, other, "DIA_Urt_ShadowSucess_11_03"); //Kelvina znajdziesz gdzie� na terenie zamku. 
	AI_Output (self, other, "DIA_Urt_ShadowSucess_11_04"); //Powodzenia. 
	
   CreateInvItem		(self,			ItWr_FletcherFake_Letter_01);
	B_GiveInvItems		(self, other,	ItWr_FletcherFake_Letter_01, 1);	
	Npc_ExchangeRoutine	(self, "KELVIN");
   Wld_InsertNpc(RBL_2400_Kelvin,"OCC_GUARD_ROOM_BACK2");
	var c_npc kevin; kevin = Hlp_GetNpc(RBL_2400_Kelvin);
	kevin.attribute[ATR_HITPOINTS]-=kevin.attribute[ATR_HITPOINTS];
	B_StopProcessInfos(self);
};

/**************************************************/

INSTANCE DIA_Urt_Kelvin (C_INFO)
{
 	npc				= RBL_4062_Urt;
 	nr				= 6;
 	condition		= DIA_Urt_Kelvin_Condition;
 	information		= DIA_Urt_Kelvin_Info;
 	permanent		= 0;
 	important		= 1;
 	description		= "."; 
};

FUNC INT DIA_Urt_Kelvin_Condition()
{
 	if (Npc_GetDistToWP (self,"OCC_GUARD_ROOM_BACK2") < 800 )&&(Npc_KnowsInfo (hero,DIA_Urt_ShadowSucess))
 	{
 		return 1;
 	};
};

FUNC VOID DIA_Urt_Kelvin_Info()
{
 	B_GiveXP (500);
 	B_FullStop (hero);
 	AI_GotoNpc(other,self);
 	AI_TurnToNpc (hero,self);
 	AI_Output(self, other, "DIA_Urt_Kelvin_11_01"); //Niech to szlag, sp�nili�my si�. Kelvin nie �yje.
 	AI_Output(self, other, "DIA_Urt_Kelvin_11_02"); //Te skurwysyny go torturowa�y, ale nie sprawdzili pod podeszw� but�w...	
 	B_LogEntry(CH3_RBL_OldCampSpy, "Sp�nili�my si�, znale�li�my cia�o Kelvina.");

 	B_StopProcessInfos(self);
 	AI_GotoWP(self, "OCC_GUARD_ROOM_BACK2");
 	AI_AlignToWP(self);
 	AI_PlayAni(self, "T_PLUNDER");
};

/**************************************************/

INSTANCE DIA_Urt_Kelvin1 (C_INFO)
{
 	npc				= RBL_4062_Urt;
 	nr				= 7;
 	condition		= DIA_Urt_Kelvin1_Condition;
 	information		= DIA_Urt_Kelvin1_Info;
 	permanent		= 0;
 	important		= 1;
 	description		= "."; 
};

FUNC INT DIA_Urt_Kelvin1_Condition()
{
 	if (Npc_KnowsInfo (hero,DIA_Urt_Kelvin))
 	{
 		return 1;
 	};
};

FUNC VOID DIA_Urt_Kelvin1_Info()
{
 	AI_StandUp (self);
 	AI_TurnToNpc (self, hero);
 	AI_Output (self, other, "DIA_Urt_Kelvin1_11_01"); //Znalaz�em przy Kelvinie map�.
 	B_UseFakeScroll(self);
 	AI_Output (self, other, "DIA_Urt_Kelvin1_11_02"); //A niech mnie, ten cwany skurczybyk znalaz� tajemne wej�cie do Starego Obozu!
 	AI_Output (self, other, "DIA_Urt_Kelvin1_11_03"); //Kelvin nawet zza grobu potrafi dokopa� Gomezowi.
 	AI_Output (other, self, "DIA_Urt_Kelvin1_15_04"); //�a�uj�, �e go nie zna�em. To musia� by� niez�y...
 	AI_Output (self, other, "DIA_Urt_Kelvin1_11_05"); //Stra�nicy! Id� tutaj. Biegnij, uciekaj najszybciej jak tylko potrafisz.
 	AI_Output (self, other, "DIA_Urt_Kelvin1_11_06"); //Ja ich zatrzymam tak d�ugo jak si� da.
 	AI_Output (other, self, "DIA_Urt_Kelvin1_15_07"); //Zginiesz!
	AI_Output (self, other, "DIA_Urt_Kelvin1_11_08"); //Dam sobie rad�, uciekaj do loch�w pod zamkiem, tam znajdziesz tajne przej�cie! 	
	
 	B_LogEntry		(CH3_RBL_OldCampSpy, "Urt znalaz� przy ciele Kelvina klucz i map� z lokalizacj� tajnego wej�cie do obozu. Musz� zd��y� tam przed stra�nikami.");
 	/*********************
 	Jaka� funkcja z wnerwinymi stra�nikami + zmiana dickowi i urtowi na super szybkie bieganie. AHa i Urt ma klucz do zamkni�tych drzwi, przez kt�re musz� przej�c, mo�na tak?
 	*********************/

   //guard_aler ();

   Npc_ExchangeRoutine	(self, "HIDE");
 	B_StopProcessInfos	(self);
};

/**************************************************

INSTANCE DIA_Urt_Escape (C_INFO)
{
 	npc				= RBL_4062_Urt;
 	nr				= 8;
 	condition		= DIA_Urt_Escape_Condition;
 	information		= DIA_Urt_Escape_Info;
 	permanent		= 0;
 	important		= 1;
 	description		= "."; 
};

FUNC INT DIA_Urt_Escape_Condition()
{

 	if (Npc_GetDistToWP (self,"KELVIN_OUT") < 800 )&&(Npc_KnowsInfo (hero,DIA_Urt_Kelvin1)) //Wyj�cie poza stary ob�z
 	{
 		return 1;
 	};


};

FUNC VOID DIA_Urt_Escape_Info()
{
 	B_GiveXP(1000);
 	B_FullStop (hero);
 	AI_GotoNpc(other,self);
 	AI_TurnToNpc (hero,self);
 	AI_Output (self, other, "DIA_Urt_Escape_11_01"); //Uda�o si�! Zapadli�my si� pod ziemi�, pod samym nosem stra�nik�w.
 	AI_Output (other, self, "DIA_Urt_Escape_15_02"); //Podziemny tunel... Kto by pomy�la�. Ciekawe kto jeszcze o nim wie?
 	AI_Output (self, other, "DIA_Urt_Escape_11_03"); //Mo�e nikt. We� ten klucz, wiesz kt�re drzwi otwiera.

 	B_GiveInvItems (self, other, ItKe_Secret_CM_Enter,1); //Ork, kt�ry klucz otwiera te drzwi? mo�e ten ItKe_Secret_CM_Enter - jak nie to zmie� na w�a�ciwy
 	AI_Output (self, other, "DIA_Urt_Escape_11_04"); //Ja zniszcz� map�, �eby nie wpad�a w niepowo�ane r�ce.
 	AI_Output (self, other, "DIA_Urt_Escape_11_05"); //Aha, zanim pogadasz z Ratfordem przyprowad� do obozu Diego. W ten spos�b zyskamy te� wsparcie Cieni.
 	AI_Output (other, self, "DIA_Urt_Escape_15_06"); //O to si� nie b�j, nied�ugo zata�czymy nad cia�em Gomeza.
 	AI_Output (self, other, "DIA_Urt_Escape_11_07"); //I nasikamy mu do gard�a, he, he. Bywaj przyjacielu, ciesz� si�, �e nale�y do nas kto� tak zaradny jak Ty.
 	AI_Output (other, self, "DIA_Urt_Escape_15_08"); //Wzajemnie Urt, nie daj si� zabi�.
 	AI_Output (self, other, "DIA_Urt_Escape_11_09"); //Bez obaw, nie b�d� si� wychyla�. Poczekam na Diego. Razem wykoncypujemy strategi� walki Cieni i Kopaczy.
 	AI_Output (self, other, "DIA_Urt_Escape_11_10"); //Reszta zale�y ju� tylko od Cavalorna i Ratforda. 
 	AI_Output (self, other, "DIA_Urt_Escape_11_11"); //My b�dziemy czeka� na znak.
 	AI_Output (other, self, "DIA_Urt_Escape_15_12"); //Bywaj.
 	B_LogEntry		(CH3_RBL_Diego, "Wiem jak mo�na dosta� sie po kryjomu do Starego Obozu! Teraz Diego b�dzie m�g� bezpiecznie porozmawia� z Cieniami i przekona� ich do walki po stronie rebelii.");
 	B_LogEntry		(CH3_RBL_OldCampSpy, "Mam klucz do piwnic magnat�w. Musz� powiedzie� o tym Ratfordowie, ale najpierw powinienem wprowadzi� do obozu Diego przez tajne wej�cie.");

   Npc_SetAivar(self,AIV_PARTYMEMBER, 	FALSE);
 	Npc_ExchangeRoutine	(self, "HIDE"); // wraca do piwnicy magnat�w i czeka tam na Diego
};

**************************************************/

INSTANCE DIA_Urt_DiegoJail (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 10;
	condition		= DIA_Urt_DiegoJail_Condition;
	information		= DIA_Urt_DiegoJail_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Urt_DiegoJail_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo(hero,DIA_Cavalorn_NCFinish))
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_DiegoJail_Info()
{	
	B_FullStop (hero);
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_01"); //Kto idzie?!
	AI_DrawWeapon (self);
	AI_GotoNpc(hero,self);
	AI_TurnToNpc (self, hero);
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_02"); //Co Ty tu robisz?!
	AI_RemoveWeapon (self);
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_03"); //Mam randk� z Gomezem.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_04"); //Do cholery, nie czas na g�upie �arty!
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_05"); //A po co mia�bym z w�asnej woli pakowa� si� do tego obozu?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_06"); //Wybacz... Mam nerwy w strz�pach.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_07"); //Cavalorn czeka na wiadomo�ci od Was. Co si� dzieje?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_08"); //Dorwali Diego.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_09"); //Jak to si� sta�o?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_10"); //Stra�nicy przydybali go podczas spotkania z dow�dcami Cieni i Kopaczy. Dorwali ich wszystkich.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_11"); //Cieni i Kopaczy stracili od razu, �eby zastraszy� pozosta�ych.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_12"); //Diego zostawili na deser.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_13"); //Gdzie go przetrzymuj�?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_14"); //W zamkowych lochach. Jest dobrze strze�ony, a ja jestem spalony. Szukaj� mnie od kilku dni. Na szcz�cie nikomu nie przysz�o na my�l, �eby tu zajrze�.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_15"); //Sk�d stra�nicy dowiedzieli si� o spotkaniu Diego z Cieniami i Kopaczami?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_16"); //To musia� by� kto� z nas, kto� kto wiedzia� o powrocie Diego i planowanej rebelii.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_17"); //Z kim pr�cz mnie rozmawia�e� o Diego?
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_18"); //Z nikim... Hmm, chocia�... 
	
   if (Npc_KnowsInfo(hero,STT_Balam_Again))
	{
		AI_Output (other, self, "DIA_Urt_DiegoJail_15_19"); //Balam powiedzia� mi, �e bez Diego cienie nie p�jd� do walki.
	};
	if (Npc_KnowsInfo(hero,STT_Balam_Diego))||(Npc_KnowsInfo(hero,STT_Balam_DiegoCome))
	{
		AI_Output (other, self, "DIA_Urt_DiegoJail_15_20"); //P�niej wypytywa� o powr�t Diego. Ale wydawa�o mi si� to naturalne.
	};
   
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_21"); //By� mo�e by�o. Ale na razie to jedyny podejrzany.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_22"); //Pod warunkiem, �e wykluczymy Ciebie.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_23"); //Masz racj�. Dlatego b�d� tu siedzia�, a Ty zajmiesz si� wykryciem sprawcy i moimi obowi�zkami.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_24"); //�eby by�a jasno��.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_25"); //Nie trafi�em do Kolonii, �eby czyni� dobro, ratowa� czyje� dupsko z opresji, czy udawa� kap�ana Adanosa.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_26"); //Mamy wsp�lne cele i tylko dlatego pomagam Wam, a nie Gomezowi. Czy to jasne?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_27"); //Zrozumia�em. My�lisz, �e ja jestem urodzonym anarchist�? Jak powiedzia�e�, mamy ten sam cel i w tej chwili tylko to si� liczy.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_28"); //Dobra, dowiem si� komu trzeba uci�� j�zor. O co chodzi z tymi obowi�zkami?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_29"); //Musisz przygotowa� cieni i kopaczy do ataku. Rozejrzyj si� po obozie i wybierz miejsca gdzie i w jaki spos�b powinni uderzy�.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_30"); //Tylko tyle?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_31"); //To nie takie proste. Od twoich decyzji b�dzie zale�a�a skuteczno�� ataku, a tak�e to jakie straty ponios� rebelianci.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_32"); //Dlaczego sam im tego wcze�niej nie powiedzia�e�?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_33"); //Jakby� nie zauwa�y� siedz� tu zamkni�ty od kilku dni. Nie mam poj�cia jak wygl�da aktualna sytuacja.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_34"); //Ty mo�esz swobodnie rozejrze� si� po obozie, to wystarczy w zupe�no�ci do realnej oceny sytuacji.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_35"); //Dlaczego ka�dy chce si� wys�ugiwa� takim biednym piratem jak ja?
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_36"); //Dobra rozejrz� si� w po obozie.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_37"); //Jak mam porozumie� si� z cieniami i kopaczami?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_38"); //Spotkasz si� z ich kontaktami o ile jeszcze �yj�.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_39"); //W pobli�u szafotu b�dzie czeka� wys�annik cieni.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_40"); //Cz�owiek kopaczy b�dzie si� kr�ci� przy bocznej bramie.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_41"); //W porz�dku.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_42"); //Mamy ma�o czasu. Jak najszybciej rozejrzyj si� w sytuacji i odnajd� Diego.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_43"); //Wr�c� jak dowiem si� czego� wi�cej.

	/*******************
Ork to jest zmienna od skrzyni, teraz Dick mo�e monologowa� ze skrzyni�

	CHEST_KNOW = TRUE;

**********************/
	Log_CreateTopic	(CH6_RBL_Spy, LOG_MISSION);
	Log_SetTopicStatus	(CH6_RBL_Spy, LOG_RUNNING);
	B_LogEntry		(CH6_RBL_Spy, "Kto� zdradzi� w szeregach cieni i kopaczy. To przez tego szczura Diego trafi� w �apska stra�nik�w. Musz� odnale�� sukinsyna i podzi�kowa� mu za wsp�prac�. Powinienem zacz�� od Balama, tylko on pr�cz Urta wiedzia� o powrocie Diego.");

	Log_CreateTopic	(CH6_RBL_Diego, LOG_MISSION);
	Log_SetTopicStatus	(CH6_RBL_Diego, LOG_RUNNING);
	B_LogEntry		(CH6_RBL_Diego, "Stra�nicy dorwali Diego. Urt twierdzi, �e trzymaj� go pod stra�� w zamkowym lochu. Musz� uwolni� tego starego capa bo inaczej cienie i kopacze nie rusz� do walki.");

	Log_CreateTopic	(CH6_RBL_Coordinate, LOG_MISSION);
	Log_SetTopicStatus	(CH6_RBL_Coordinate, LOG_RUNNING);
	B_LogEntry		(CH6_RBL_Coordinate, "Musz� rozejrze� si� w sytuacji i na podstawie wyci�gni�tych wniosk�w ustali� poczynania cieni i kopaczy. Wys�annika Cieni znajd� pod szafotem, cz�owiek kopaczy ma si� kr�ci� w pobli�u bocznej bramy.");
	
	B_LogEntry		(CH6_RBL_Recognise, "Diego w lochu, cienie i kopacze rozproszeni, brak rozeznania sytuacji. Jest gorzej ni� my�la�em. Czas si� za to zabra�.");

	B_StopProcessInfos	(self);

	/*********************
Stra�nik loch�w, stoi przed cel� w kt�rej jest zamkni�ty Diego

********************/
	Wld_InsertNpc				(Grd_4107_Guard,"OCC_CELLAR_HALLWAY_BACK");

/***************
Kontakty cieni i kopaczy
*****************/
	Wld_InsertNpc				(Stt_4200_Schatten,"OCR_CROWD_03");
	Wld_InsertNpc				(VLK_4201_Buddler,"OCR_HUT_Z4");	

};

//**************************************************

INSTANCE DIA_Urt_Chest (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 12;
	condition		= DIA_Urt_Chest_Condition;
	information		= DIA_Urt_Chest_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przekaza�em wytyczne."; 
};

FUNC INT DIA_Urt_Chest_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cienius_Fault))&&(Npc_KnowsInfo(hero,DIA_Kopaczus_Fault))&&(Npc_KnowsInfo(hero,DIA_Urt_DiegoJail))
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Chest_Info()
{
	AI_Output (other, self, "DIA_Urt_Chest_15_01"); //Przekaza�em wytyczne.
	AI_Output (self, other, "DIA_Urt_Chest_11_02"); //�wietna robota, nied�ugo nadejdzie Czas Zap�aty.
	
	Log_SetTopicStatus	(CH6_RBL_Coordinate, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_Coordinate, "Kopacze i cienie wespr� atak na Stary Ob�z.");	

};

//**************************************************

INSTANCE DIA_Urt_Urthos (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 13;
	condition		= DIA_Urt_Urthos_Condition;
	information		= DIA_Urt_Urthos_Info;
	permanent		= 0;
	important		= 0;
	description		= "Urthos!"; 
};

FUNC INT DIA_Urt_Urthos_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_Urt))&&(Npc_KnowsInfo(hero,DIA_Cipher_Urt))
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Urthos_Info()
{
	AI_Output (other, self, "DIA_Urt_Urthos_15_01"); //Urthos!
	AI_Output (self, other, "DIA_Urt_Urthos_11_02"); //Sk�d znasz to imi�?
	AI_Output (other, self, "DIA_Urt_Urthos_15_03"); //Czyli to prawda. Masz mi jeszcze co� do powiedzenia?
	AI_Output (self, other, "DIA_Urt_Urthos_11_04"); //Nic poza to, �e ludzie w takim miejscu jak Kolonia cz�sto si� zmieniaj�.
	AI_Output (other, self, "DIA_Urt_Urthos_15_05"); //Ale czy na lepsze?
	AI_Output (self, other, "DIA_Urt_Urthos_11_06"); //Mo�esz by� tego pewien.
	AI_Output (other, self, "DIA_Urt_Urthos_15_07"); //Balam i Lee twierdz� co� zgo�a odmiennego.
	AI_Output (self, other, "DIA_Urt_Urthos_11_08"); //Przysz�o�� poka�e, kto walczy po w�a�ciwej stronie...
	Npc_ExchangeRoutine	(self, "GONE");
};


