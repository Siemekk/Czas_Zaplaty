// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_PIR_2600_Angus_Exit (C_INFO)
{
	npc			= PIR_2600_Angus;
	nr			= 999;
	condition	= DIA_PIR_2600_Angus_Exit_Condition;
	information	= DIA_PIR_2600_Angus_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PIR_2600_Angus_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_PIR_2600_Angus_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_PIR_2600_Angus_Hello (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 2;
	condition		= DIA_PIR_2600_Angus_Hello_Condition;
	information		= DIA_PIR_2600_Angus_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_PIR_2600_Angus_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2602_Rodney_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2600_Angus_Hello_Info()
{
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_01"); //A niech mnie rekin wych�do�y, przecie� to Rick!
	AI_TurnToNpc 			(hero,self);
	AI_GotoNpc(self, other);
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_02"); //Dobrze widzie� Ci� w jednym kawa�ku, Angus.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_03"); //Wiedzia�em, �e jeste� zbyt ko�cisty i cuchn�cy nawet dla rekina.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_04"); //Wybra�e� dobry moment, �eby powr�ci� z martwych. Z Rodneyem ju� powspomina�e� stare czasy.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_05"); //Skoro tak, to pewnie wiesz, w jakie g�wno wdepn�li�my.
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_06"); //Kolonia Karna.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_07"); //Dok�adnie, to miejsce jest, jak czarna dziura w dupie samego Beliara. Do tego ta bariera...
	
   if (Npc_KnowsInfo(hero,DIA_PIR_2601_Hank_WhereAreWe))
	{
		AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_08"); //Hank m�wi�, �e masz jaki� plan, �eby si� st�d wydosta�.
	};
   
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_09"); //Co zamierzasz?
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_10"); //Jak to co? Nie da� si� zabi�, nape�ni� brzuch i czeka� na pomy�lny wiatr.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_11"); //Widzia�e� tych pata�ach�w w czerwonych �achmanach?
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_12"); //Jeszcze nie.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_13"); //Spr�bowali�my negocjacji, ale rzucili si� na nas szybciej, ni� Hank zd��y� opr�ni� butelk� rumu.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_14"); //Trzeba przyzna�, �e odwagi im nie brakowa�o, cho� gorzej z rozumem. Nakarmili�my nimi ryby, �eby �cierwa nie psu�y powietrza na pla�y.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_15"); //Teraz nadszed� czas na bardziej przemy�lane posuni�cie. Zaczniemy od spacerku po okolicy.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_16"); //Poczekamy do zmierzchu, lepiej nie rzuca� si� nikomu w oczy, bo co� strasznie nerwowi ci skaza�cy.
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_17"); //Jak dot�d brzmi rozs�dnie.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_18"); //Znasz mnie, rozs�dek to moje drugie imi�, tym bardziej, �e ten las ma w sobie co� z bestii.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_19"); //Przy zej�ciu na pla�� widzia�em zwiadowc� w czerwonej zbroi. Na razie lepiej go omija�, przynajmniej w pojedynk�. 
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_20"); //Daj zna�, jak b�dziesz chcia� si� troch� rozerwa�. P�jdziemy wyt�umaczy� temu idiocie, �e nie lubimy, jak kto� nas podgl�da.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_21"); //Poza tym przyda Ci si� troch� �wicze�, bo co� marnie wygl�dasz. 
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_22"); //Do tej pory szumi mi w g�owie, ale z ch�ci� skopi� czyje� dupsko.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_23"); //To mi si� podoba przyjacielu, jak zawsze mo�na na Ciebie liczy�.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_24"); //Wr�� do mnie, jak b�dziesz got�w, bo z czerwonym musimy za�atwi� spraw� szybko i czysto.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_25"); //I pogadaj z Rodneyem, da Ci kilka leczniczych mikstur. Wymieszane z grogiem daj� niez�ego kopa...
	
   Log_CreateTopic(CH1_PIR_Colony,LOG_NOTE);
	B_LogEntry(CH1_PIR_Colony, "Na szcz�cie Angus te� prze�y�. Musimy rozejrze� si� po okolicy, mo�e uda si� znale�� jaki� spos�b na wydostanie si� z tego miejsca.");
};

//////////////////////////////////////////////////////////
// RICK WEAPON GET BACK////////////////////////////////
//////////////////////////////////////////////////////////
INSTANCE DIA_PIR_2600_Angus_RickWeap (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 3;
	condition		= DIA_PIR_2600_Angus_RickWeap_Condition;
	information		= DIA_PIR_2600_Angus_RickWeap_Info;
	permanent		= 0;
	description		= "Potrzebuj� dobrego or�a."; 
};

FUNC INT DIA_PIR_2600_Angus_RickWeap_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2600_Angus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2600_Angus_RickWeap_Info()
{
	AI_Output (other, self,"DIA_PIR_2600_Angus_RickWeap_15_01"); //Potrzebuj� jakiego� or�a. Masz dla mnie co� co nie rozsypie si� przy pierwszym uderzeniu?
	AI_TurnToNpc 			(hero,self);
	AI_Output (self, other,"DIA_PIR_2600_Angus_RickWeap_07_02"); //Mam co� lepszego, zgadnij co fale wyrzuci�y na brzeg. By� wbity w kawa�ek masztu.
	
   CreateInvItem(self, Rick_Axe_1);	
	B_GiveInvItems(self,other,Rick_Axe_1,1);
	AI_EquipBestMeleeWeapon(other);
	AI_ReadyMeleeWeapon(other);
	AI_PlayAni(other, "T_1HSINSPECT");
	AI_RemoveWeapon(other);
   
	AI_Output (other, self,"DIA_PIR_2600_Angus_RickWeap_15_03"); //A niech to! M�j stary top�r!
	AI_Output (self, other,"DIA_PIR_2600_Angus_RickWeap_07_04"); //Wyszczerbiony i t�py jak pomy�lunek Hanka, ale nadal mo�esz tym nie�le kogo� pochlasta�.
	AI_Output (other, self,"DIA_PIR_2600_Angus_RickWeap_15_05"); //Dzi�ki, Angus. Dotyk zimnej stali zawsze mnie uspokaja�.
	AI_Output (self, other,"DIA_PIR_2600_Angus_RickWeap_07_06"); //Jak ju� troch� si� tutaj rozejrzymy to poszukaj kowala. Podostrzy Ci ostrze i wywa�y trzonek.
	AI_Output (other, self,"DIA_PIR_2600_Angus_RickWeap_15_07"); //Ale najpierw musz� go na czym� wypr�bowa�!
	AI_Output (self, other,"DIA_PIR_2600_Angus_RickWeap_07_08"); //Stary dobry Rick. Ju� nied�ugo b�dziesz mia� niejedn� okazj�, �eby wypru� komu� flaki, przyjacielu.
};

//-----------------------------------------------------------------
// 
//-----------------------------------------------------------------

var int angus_go;

instance PIR_2600_Angus_READY (C_INFO)
{
	npc				= PIR_2600_Angus;
	condition		= PIR_2600_Angus_READY_Condition;
	information		= PIR_2600_Angus_READY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem ju� got�w skopa� czyje� dupsko!"; 
};

FUNC int  PIR_2600_Angus_READY_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_PIR_2600_Angus_RickWeap))&&(angus_go == FALSE)
	{
		return 1;
	};
};
func void  PIR_2600_Angus_READY_Info()
{
	if (Wld_IsTime (20,00,04,00))
	{
		angus_go = TRUE;
		var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
		var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
		AI_Output (other, self,"PIR_2600_Angus_READY_Info_15_01"); //Jestem ju� got�w skopa� czyje� dupsko!
		AI_Output (self, other,"PIR_2600_Angus_READY_Info_07_02"); //Najwy�sza pora.
		AI_TurnToNpc 			(self,hank);	
		AI_Output (self, NULL,"PIR_2600_Angus_READY_Info_07_03"); //Hej, ch�opaki, ruszcie t�uste zadki. Idziemy na spacerek.
		AI_Output (self, NULL,"PIR_2600_Angus_READY_Info_07_04"); //Na pocz�tek 'porozmawiamy' z podgl�daczem w czerwonej zbroi.
		AI_Output (self, NULL,"PIR_2600_Angus_READY_Info_07_05"); //Ostatni na g�rze stawia wszystkim rum!
		Ai_Wait (self,0.3);	
		AI_TurnToNpc 			(self,rodney);		
		Party_AddNpc(hank);
		Party_AddNpc(rodney);
		Party_AddNpc(self);
		
		Npc_ExchangeRoutine	(self,"check");
		B_ExchangeRoutine(hank,"check");
		B_ExchangeRoutine(rodney,"check");

		B_StandUp(self);		
		B_StandUp(hank);			
		B_StandUp(rodney);			

		// Add tony and guards here:
		Wld_InsertNpc			 	(RBL_2604_Tony,"OW_HUN_SMALLCAMP");
		Wld_InsertNpc			 	(GRD_2599_Guard,"OW_HUN_SMALLCAMP");
		Wld_InsertNpc			 	(GRD_4063_Guard,"OW_HUN_SMALLCAMP");
		
		B_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other,"PIR_2600_Angus_READY_Info_07_06"); //Wyruszymy o zmierzchu, lepiej nie rzuca� si� w oczy miejscowych sukinsyn�w.
		AI_Output (self, other,"PIR_2600_Angus_READY_Info_07_07"); //Wr��, jak zapadnie zmrok.
	};
};

//-----------------------------------------------------------------
// Dusty abfangen
//-----------------------------------------------------------------
instance PIR_2600_Angus_HUNTERS (C_INFO)
{
	npc				= PIR_2600_Angus;
	condition		= PIR_2600_Angus_HUNTERS_Condition;
	information		= PIR_2600_Angus_HUNTERS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PIR_2600_Angus_HUNTERS_Condition()
{	
	// Dialog disabled
	// 	if (Npc_GetDistToWP(self,"OW_PATH_167")<250)
	// 	{
	return false;
	// 	};
};
func void  PIR_2600_Angus_HUNTERS_Info()
{
	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
	var C_NPC tony; tony = Hlp_GetNpc(RBL_2604_Tony);
	//Ai_Wait (rodney,2);	
	//Ai_Wait (hero,9);	
	AI_Output			(self, other,"PIR_2600_Angus_HUNTERS_Info_07_01"); //Widzicie tych cwaniak�w po drugiej stronie mostu przy ognisku?
	AI_GotoNpc		(rodney, other);
	//AI_TurnToNpc 			(rodney,self);	
	AI_Output			(other, self,"PIR_2600_Angus_HUNTERS_Info_15_02"); //Rzeczywi�cie, kto� tam jest...
	AI_Output			(other, other,"PIR_2600_Angus_HUNTERS_Info_09_03"); //Czerwone pancerze.
	//AI_TurnToNpc 			(hero,rodney);	
	//Ai_Wait (rodney,5);
	AI_Output			(self, other,"PIR_2600_Angus_HUNTERS_Info_07_04"); //I bardzo dobrze. Wyprujemy im flaki za Skipa i Dustiego.
	AI_Output			(self, other,"PIR_2600_Angus_HUNTERS_Info_07_05"); //Tym razem dam Ci si� wykaza�.
	AI_Output			(self, other,"PIR_2600_Angus_HUNTERS_Info_09_06"); //Id� pierwszy Rick, tylko zostaw co� dla nas!
	Npc_ExchangeRoutine	(self,"FOLPC2HUN");
	B_ExchangeRoutine(pir_2601_hank,"FOLPC2HUN");
	B_ExchangeRoutine(pir_2602_rodney,"FOLPC2HUN");
	//********************poprawki
	/************************************
//Ork niech nadal maj� party jednak.
//	Npc_SetAivar(self,AIV_PARTYMEMBER,  FALSE);
//	Npc_SetAivar(hank,AIV_PARTYMEMBER,  FALSE);
//	Npc_SetAivar(rodney,AIV_PARTYMEMBER,  FALSE);	
****************************************/
	//************************
	B_StopProcessInfos(self);
};

/***************************
Dodatkowy dialog
***************************/

INSTANCE DIA_Angus_KillSlay (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 22;
	condition		= DIA_Angus_KillSlay_Condition;
	information		= DIA_Angus_KillSlay_Info;
	permanent		= 0;
	important		= 1;
	description		= "?"; 
};

FUNC INT DIA_Angus_KillSlay_Condition()
{
	if (abel_ok)//(Npc_KnowsInfo(hero,HUN_2615_Abel_Hello_Yes)) -pudlo shergar ;P nie tak to sie robi
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_KillSlay_Info()
{
	AI_TurnToNpc 			(hero,self);
	AI_Output (self, other, "DIA_Angus_KillSlay_11_02"); //Na co czekamy? Chod�my wypatroszy� te �winie!
	
   B_LogEntry		(CH1_Rbl_AbelHead, "Piraci pomog� mi za�atwi� wej�ci�wk� do obozu.");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Angus_KillAligator (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 10;
	condition		= DIA_Angus_KillAligator_Condition;
	information		= DIA_Angus_KillAligator_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz ochot� na ma�y spacerek?"; 
};

FUNC INT DIA_Angus_KillAligator_Condition()
{
	if (jack_yes==TRUE)&&(!Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_KillAligator_Info()
{
	B_GiveXP(100);
   
	AI_Output (other, self, "DIA_Angus_KillAligator_15_01"); //Masz ochot� na ma�y spacerek?
	AI_Output (self, other, "DIA_Angus_KillAligator_11_02"); //Mo�e i m�g�bym troch� rozprostowa� ko�ci. O co chodzi?
	AI_Output (other, self, "DIA_Angus_KillAligator_15_03"); //O przys�ug�.
	AI_Output (self, other, "DIA_Angus_KillAligator_11_04"); //Nie ma sprawy Rick. Jeste� jednym z nas. Prowad�.
	
   B_LogEntry		(CH1_Rbl_Aligator, "Angus zgodzi� si� pom�c, nawet nie pytaj�c w czym problem.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self,"FOLLOWALLIGATOR");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Angus_KillAligatorOut (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 11;
	condition		= DIA_Angus_KillAligatorOut_Condition;
	information		= DIA_Angus_KillAligatorOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Angus_KillAligatorOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Angus_KillAligator))&&(Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_KillAligatorOut_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(100);
	AI_Output (self, other,"DIA_Angus_KillAligatorOut_11_02"); //Bestia ju� gryzie ziemi�. Dzi�ki za rozrywk�.
	AI_Output (other, self,"DIA_Angus_KillAligatorOut_15_01"); //Bywaj Angus.
	
   B_LogEntry		(CH1_Rbl_Aligator, "Angus pom�g� mi zabi� Aligatora.");
	B_StopProcessInfos	(self);
   Party_RemoveNpc(self);
	Npc_ExchangeRoutine	(self,"INHC");
};

/************************

Po ataku na ork�w przy que�cie z Carlsonem
************************/

INSTANCE DIA_Angus_KillOrc (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 12;
	condition		= DIA_Angus_KillOrc_Condition;
	information		= DIA_Angus_KillOrc_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Angus_KillOrc_Condition()
{
	if (orc_appear == TRUE)&&(Npc_IsDead(MIS_CarlsonOrcElite))
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_KillOrc_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(200);
	AI_Output (self, other,"DIA_Angus_KillOrc_11_01"); //Przybyli�my w ostatniej chwili!
	AI_Output (other, self,"DIA_Angus_KillOrc_15_02"); //Jak tu trafili�cie?
	AI_Output (self, other,"DIA_Angus_KillOrc_11_03"); //Kaza�em Hankowi mie� na Ciebie oko i jak zwykle mia�em nosa, �e wpakujesz si� w jakie� k�opoty.
	AI_Output (self, other,"DIA_Angus_KillOrc_11_04"); //Kiedy wyruszy�e� na tereny ork�w, stwierdzili�my, �e by�oby szkoda, gdyby� ju� stamt�d nie wr�ci�.
	AI_Output (self, other,"DIA_Angus_KillOrc_11_05"); //Gdzie ja bym znalaz� sternika, kt�ry nie wbije mi no�a w plecy, �eby zgarn�� ca�y �up dla siebie?
	AI_Output (other, self,"DIA_Angus_KillOrc_15_06"); //Dzi�ki, przyjacielu.
	AI_Output (self, other,"DIA_Angus_KillOrc_11_07"); //Bra� zawsze trzyma si� razem, Rick. Nigdy o tym nie zapominaj!
	
   B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "INHC");
	B_ExchangeRoutine(hank, "INHC");
	B_ExchangeRoutine(rodney, "INHC");
};

INSTANCE DIA_Angus_RebelCamp (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 11;
	condition		= DIA_Angus_RebelCamp_Condition;
	information		= DIA_Angus_RebelCamp_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Angus_RebelCamp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))
	{
		return true;
	};
};

FUNC VOID DIA_Angus_RebelCamp_Info()
{
	var c_npc hank; hank = Hlp_GetNpc(pir_2601_hank);
	var C_NPC rodney;  rodney = Hlp_GetNpc(pir_2602_rodney);  

	AI_Output (self, other,"DIA_Angus_RebelCamp_07_01"); //Dotarli�my do Obozu Rebeliant�w. 
	AI_Output (other, self,"DIA_Angus_RebelCamp_15_02"); //To dopiero pocz�tek drogi.
	AI_Output (self, other,"DIA_Angus_RebelCamp_07_03"); //Mo�e dla Ciebie. Czas zarzuci� kotwic� i odsapn��.
	AI_Output (self, other,"DIA_Angus_RebelCamp_07_04"); //Pokr�cimy si� po obozie, jako� si� tutaj urz�dzimy.
	AI_Output (self, other,"DIA_Angus_RebelCamp_07_05"); //Jakby� chcia� pogada�, wypi� z braci�, czy spu�ci� komu� �omot to tu nas znajdziesz.
	AI_Output (self, other,"DIA_Angus_RebelCamp_07_06"); //Poza tym zawsze by�e� wilkiem samotnikiem. Nie b�dziemy wchodzi� Ci w parad�, przyjacielu.
	AI_Output (other, self,"DIA_Angus_RebelCamp_15_07"); //B�dzie mi brakowa� twojego gl�dzenia.
	AI_Output (self, other,"DIA_Angus_RebelCamp_07_08"); //Bywaj Rick, powodzenia na szlaku.

	B_LogSetTopicStatus	(CH1_Pir_RebelCamp, LOG_SUCCESS);
	B_LogEntry		(CH1_Pir_RebelCamp, "Szcz�liwie dotarli�my do Obozu Rebeliant�w. Angus, Hank i Rodney zostan� w obozie i jako� si� tu urz�dz�. Ale dla mnie to dopiero pocz�tek drogi...");
	Party_RemoveNpc(self);
	Party_RemoveNpc(hank);
	Party_RemoveNpc(rodney);
	Npc_ExchangeRoutine	(self,"INHC");
	B_ExchangeRoutine(hank,"INHC");
	B_ExchangeRoutine(rodney,"INHC");

	B_StopProcessInfos	(self);
};

INSTANCE DIA_Angus_Patrol (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 13;
	condition		= DIA_Angus_Patrol_Condition;
	information		= DIA_Angus_Patrol_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl�dasz jakby� si� nudzi�."; 
};

FUNC INT DIA_Angus_Patrol_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Quest1) && (!B_guards_patrol_finished()))
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_Patrol_Info()
{
	AI_Output (other, self,"DIA_Angus_Patrol_15_00"); //Wygl�dasz jakby� si� nudzi�.
	AI_Output (self, other,"DIA_Angus_Patrol_11_01"); //A ty wygl�dasz jakby� potrzebowa� pomocy. Zgad�em?
	AI_Output (other, self,"DIA_Angus_Patrol_15_02"); //W pobli�u obozu kr�ci si� patrol stra�y. Musz� si� go pozby�.
	AI_Output (self, other,"DIA_Angus_Patrol_11_03"); //Na mnie i ch�opak�w mo�esz liczy�. Powiedz tylko kiedy i gdzie.
	AI_Output (self, other,"DIA_Angus_Patrol_11_04"); //Daj zna� jak b�dziesz got�w.
	B_LogEntry		(CH2_RBL_GuardCamp, "Angus i reszta pirat�w pomog� mi w pozbyciu si� stra�nik�w - musz� tylko zdecydowa� jak to zrobimy.");
};

INSTANCE DIA_Angus_Patrol1 (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 14;
	condition		= DIA_Angus_Patrol1_Condition;
	information		= DIA_Angus_Patrol1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ruszamy."; 
};

FUNC INT DIA_Angus_Patrol1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Angus_Patrol))
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_Patrol1_Info()
{
	AI_Output (other, self,"DIA_Angus_Patrol1_15_01"); //Ruszamy.
	AI_Output (self, other,"DIA_Angus_Patrol1_11_02"); //Jak zamierzasz za�atwi� te �winie?

	Info_ClearChoices (DIA_Angus_Patrol1);
	Info_AddChoice (DIA_Angus_Patrol1, "Za�atwimy sukinsyn�w atakiem frontalnym!", DIA_Angus_Patrol1_Fight);
	Info_AddChoice (DIA_Angus_Patrol1, "Urz�dzimy zasadzk�.", DIA_Angus_Patrol1_Trap);
	Info_AddChoice (DIA_Angus_Patrol1, "Pogadam z nimi, wy zaczekacie w odwodzie.", DIA_Angus_Patrol1_Negotiate);
};

// ---------------------------Strength----------------------------------------

FUNC VOID DIA_Angus_Patrol1_Fight()
{
	dick_patrol_choice = 1;
	AI_Output (other, self, "DIA_Angus_Patrol1_Fight_15_03"); //Za�atwimy sukinsyn�w atakiem frontalnym!
	AI_Output (self, other, "DIA_Angus_Patrol1_Fight_11_04"); //Prosto i bezmy�lnie, ale w�a�nie tego mi brakowa�o - porz�dnej rozr�by.
	AI_Output (self, other, "DIA_Angus_Patrol1_Fight_11_05"); //Prowad�, przyjacielu, niech zata�czy stal!
	B_LogEntry(CH2_RBL_GuardCamp, "Wybra�em rozwi�zanie si�owe - za�atwimy stra�nik�w w bezpo�rednim starciu. Sprowokuj� ich podczas rozmowy do walki, wtedy te� uderzy Angus z piratami.");

	B_StopProcessInfos(self); 
	//Use old Routine	
	Npc_ExchangeRoutine(self,"FOLLOWALLIGATOR");
	Npc_ExchangeRoutine(hank,"FOLLOWALLIGATOR");
	Npc_ExchangeRoutine(rodney,"FOLLOWALLIGATOR");
};

// ---------------------------Smart----------------------------------------

FUNC VOID DIA_Angus_Patrol1_Trap()
{
	dick_patrol_choice = 2;
	AI_Output (other, self, "DIA_Angus_Patrol1_Trap_15_06"); //Urz�dzimy zasadzk�.
	AI_Output (self, other, "DIA_Angus_Patrol1_Trap_11_07"); //Hmm, ciekawe. Wygl�dasz jakby� mia� jaki� plan.
	AI_Output (other, self, "DIA_Angus_Patrol1_Trap_15_08"); //Zaczaicie si� niedaleko ich obozu, w jaskini. Ja z nimi pogadam i odwr�c� ich uwag�.
	AI_Output (other, self, "DIA_Angus_Patrol1_Trap_15_09"); //Postaram si� przyprowadzi� barany prosto na rze�.
	AI_Output (self, other, "DIA_Angus_Patrol1_Trap_11_10"); //�wietny pomys�. Ju� nie mog� si� doczeka� kiedy zobacz� ich zaskoczone mordy!
	B_LogEntry(CH2_RBL_GuardCamp, "Urz�dzimy zasadzk�. Pogadam ze stra�nikami, a ch�opaki zaczaj� si� i przygotuj� zasadzk�. Po rozmowie poprowadz� stra�nik�w na rze�.");

	B_StopProcessInfos(self); 
	NPC_ExchangeRoutine(self,"PatrolTrap");
	B_ExchangeRoutine(hank,"PatrolTrap");
	B_ExchangeRoutine(rodney,"PatrolTrap");
};


// ---------------------------Negotiate----------------------------------------

FUNC VOID DIA_Angus_Patrol1_Negotiate()
{
	dick_patrol_choice = 3;
	AI_Output (other, self, "DIA_Angus_Patrol1_Negotiate_15_11"); //Pogadam z nimi, wy zaczekacie w odwodzie.
	AI_Output (self, other, "DIA_Angus_Patrol1_Negotiate_11_12"); //Chcesz rozmawia� z tymi �achudrami? Nie poznaj� Ci� Rick, zmi�k�e�!
	AI_Output (other, self, "DIA_Angus_Patrol1_Negotiate_15_13"); //Nie ma sensu niepotrzebnie nara�a� nikogo z Was. Mo�e uda si� to za�atwi� inaczej.
	AI_Output (other, self, "DIA_Angus_Patrol1_Negotiate_15_14"); //Zaczekacie w pobliskiej jaskini, gdyby co� posz�o nie tak wiesz co robi�.
	AI_Output (self, other, "DIA_Angus_Patrol1_Negotiate_11_15"); //Hmm, mo�e to i nie g�upi pomys�. Dobra, jeste�my z tob�.
	B_LogEntry(CH2_RBL_GuardCamp, "Wybra�em drog� negocjacji - spr�buj� jako� nak�oni� stra�nik�w do opuszczenia naszego s�siedztwa. Angus i piraci b�d� czeka� w jaskini gdyby co� posz�o nie tak jak powinno.");

	B_StopProcessInfos(self); 
	Npc_ExchangeRoutine(self,"PatrolTrap");
	B_ExchangeRoutine(hank,"PatrolTrap");
	B_ExchangeRoutine(rodney,"PatrolTrap");
};

// **************************************************

INSTANCE DIA_PIR_2600_Angus_AfterPatrolKill (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 152;
	condition		= DIA_PIR_2600_Angus_AfterPatrolKill_Condition;
	information		= DIA_PIR_2600_Angus_AfterPatrolKill_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_PIR_2600_Angus_AfterPatrolKill_Condition()
{
	var c_npc duke; duke = Hlp_GetNpc(GRD_4061_Guard);

	if (Npc_KnowsInfo (hero, DIA_Angus_Patrol1))&&(NPC_IsDead(Duke))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2600_Angus_AfterPatrolKill_Info()
{
	AI_Output (self, other, "DIA_PIR_2600_Angus_AfterPatrolKill_11_01"); //Ca�kiem mocne skurczybyki.
	AI_Output (self, other, "DIA_PIR_2600_Angus_AfterPatrolKill_11_02"); //Mi�o by�o rozprostowa� ko�ci, ale czas ju� wraca� do obozu.
	AI_Output (self, other, "DIA_PIR_2600_Angus_AfterPatrolKill_11_03"); //Do zobaczenia, Rick.
	
   B_ExchangeRoutine(rodney,"INHC"); 
	Npc_ExchangeRoutine(self,"INHC"); 
	B_ExchangeRoutine(hank,"INHC"); 	
	
	Party_RemoveNpc(self);
	Party_RemoveNpc(hank);
	Party_RemoveNpc(rodney);
	
	B_LogEntry(CH2_Rbl_Food, "Patrol stra�nik�w nie powinien ju� sprawia� problem�w, musz� poinformowa� o tym Ratforda."); 
};

INSTANCE DIA_PIR_2600_Angus_Stew (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 12;
	condition		= DIA_PIR_2600_Angus_Stew_Condition;
	information		= DIA_PIR_2600_Angus_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz ochot� na gulasz?"; 
};

FUNC INT DIA_PIR_2600_Angus_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2600_Angus_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_PIR_2600_Angus_Stew_15_01"); //Masz ochot� na gulasz?
	AI_Output (self, other, "DIA_PIR_2600_Angus_Stew_11_02"); //Pewnie, strasznie burczy mi w brzuchu.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Potrawka Snafa powinna zaspokoi� g��d Angusa."); 
};


INSTANCE DIA_Angus_KillGuards (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 20;
	condition		= DIA_Angus_KillGuards_Condition;
	information		= DIA_Angus_KillGuards_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Angus_KillGuards_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_OCFinish))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_KillGuards_Info()
{
	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
	var C_NPC rod; rod = Hlp_GetNpc(PIR_2602_Rodney);
	var C_NPC jack; jack = Hlp_GetNpc(PIR_2612_JACKALLIGATOR);

	B_FullStop (hero);
	AI_GotoNpc(self,other);
	AI_Output (self, other,"DIA_Angus_KillGuards_11_01"); //P�dzisz jakby Ci� lewiatan gryz� po zadzie.
	AI_Output (other, self,"DIA_Angus_KillGuards_15_02"); //Zacz�o si�! W ko�cu dobierzemy si� do magnat�w!
	AI_Output (self, other,"DIA_Angus_KillGuards_11_03"); //I do skarbca Gomeza! Chyba nie chcia�e� p�j�� bez nas, h�?
	AI_Output (other, self,"DIA_Angus_KillGuards_15_04"); //Ekhm, nawet mi to przez my�l nie przesz�o.
	AI_Output (self, other,"DIA_Angus_KillGuards_11_05"); //Stary dobry Rick, jakby m�g�, sprzeda�by w�asn� matk�.
	AI_Output (other, self,"DIA_Angus_KillGuards_15_06"); //C�, wszystko ma swoj� cen�.
	AI_Output (self, other,"DIA_Angus_KillGuards_11_07"); //Ju� czuj� zapach z�ota...
	AI_Output (self, other,"DIA_Angus_KillGuards_11_08"); //Zrobimy to jak za starych dobrych czas�w, krwawo i bez pardonu.
	AI_TurnToNpc(self, hank);
	AI_Output (self, other,"DIA_Angus_KillGuards_11_09"); //Co wy na to ch�opaki?
	AI_TurnToNpc(self, other);

	if (!Npc_IsDead(jack))
	{
		AI_Output (self, other,"DIA_Angus_KillGuards_11_10"); //Nawet Stary Jack chce rozprostowa� ko�ci, nie odbierajmy mu tej przyjemno�ci!
		Party_AddNpc(jack);
		B_ExchangeRoutine	(jack,"FOLLOW2");
	};
   
	AI_Output (self, other,"DIA_Angus_KillGuards_11_11"); //Poza tym kto� musi pilnowa�, �eby� nie da� nogi objuczony skarbami.
	AI_Output (other, self,"DIA_Angus_KillGuards_15_12"); //Sk�d ten brak zaufania?
	AI_Output (self, other,"DIA_Angus_KillGuards_11_13"); //Zbyt dobrze Ci� znam.
	AI_TurnToNpc(self, angus);
	AI_Output (self, other,"DIA_Angus_KillGuards_11_14"); //Idziemy z Rickiem i nie bierzemy je�c�w!

	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self,"FOLLOW");

	Party_AddNpc(hank);
	B_ExchangeRoutine	(hank,"FOLLOW");

	Party_AddNpc(rod);
	B_ExchangeRoutine	(rod,"FOLLOW");

	B_StopProcessInfos	(self);
};

