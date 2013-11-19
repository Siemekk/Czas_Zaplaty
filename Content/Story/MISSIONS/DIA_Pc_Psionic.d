// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "Kim jeste�?";
};                       

FUNC int DIA_Lester_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_Lester_Hallo1_05_01"); //Nazywam si� Lester. Co za b�l... Moja g�owa...
	AI_Output (self, other,"DIA_Lester_Hallo1_05_02"); //Wybacz, jestem bardzo zm�czony.
};

// **************************************************

instance DIA_Lester_Beast (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  2;
	condition		=  DIA_Lester_Beast_Condition;
	information		=  DIA_Lester_Beast_Info;
	important		=  0;
	permanent		=  0;
	description		= "Podobno wr�ci�e� z bagien.";
};                       

FUNC int DIA_Lester_Beast_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))&&(Npc_KnowsInfo(hero,DIA_Leren_Beast))
	{
		return 1;
	};
};

FUNC VOID DIA_Lester_Beast_Info()
{
	AI_Output (other, self,"DIA_Lester_Beast_15_00"); //Podobno wr�ci�e� z bagien.
	AI_Output (self, other,"DIA_Lester_Beast_05_01"); //Tak, to nie by�a przyjemna wyprawa.
	AI_Output (other, self,"DIA_Lester_Beast_15_02"); //Co tam si� dzieje?
	AI_Output (self, other,"DIA_Lester_Beast_05_03"); //To prawdziwy koszmar, nie spos�b tego opisa� s�owami.
	AI_Output (self, other,"DIA_Lester_Beast_05_04"); //Kiedy wr�ci�em z wyprawy poszukuj�cej Cor Kaloma, nie uwierzy�em w�asnym oczom...
	AI_Output (self, other,"DIA_Lester_Beast_05_05"); //Moi przyjaciele, ludzie, kt�rych zna�em od lat zamienili si� w nieumar�e istoty. Ca�e bagno zamieni�o si� w koszmarn� nekropoli�.
	AI_Output (self, other,"DIA_Lester_Beast_05_06"); //Jednak to co spotka�em w g��bi moczar�w...
	AI_Output (self, other,"DIA_Lester_Beast_05_07"); //Do tej pory czuj� zimny dreszcz na plecach... Te oczy... Zdawa�o si�, �e samym spojrzeniem wydziera mi dusz� z trzewi!
	AI_Output (self, other,"DIA_Lester_Beast_05_08"); //Nigdy w �yciu tak szybko nie ucieka�em jak wtedy. I nikomu przy zdrowych zmys�ach nie radzi�bym zapuszcza� si� na bagna.
	AI_Output (other, self,"DIA_Lester_Beast_15_09"); //Nie mam wyboru, musz� zg�adzi� besti� i wyrwa� jej serce.
	AI_Output (self, other,"DIA_Lester_Beast_05_10"); //Czy� Ty oszala�? Jeste� jakim�... sekciarzem?!
	AI_Output (other, self,"DIA_Lester_Beast_15_11"); //I kto to m�wi? Ja przynajmniej nie wyznaj� �ni�cego.
	AI_Output (self, other,"DIA_Lester_Beast_05_12"); //To Tw�j wyb�r, nie m�j. Jak chcesz do��czy� do armii zombie, to prosz� bardzo, droga wolna.
	AI_Output (other, self,"DIA_Lester_Beast_15_13"); //S�k w tym, �e w�a�nie nie mam zamiaru nigdzie do��cza�. A ju� na pewno nie do zgrai nieumar�ych sekciarzy. Oczywi�cie bez obrazy...
	AI_Output (self, other,"DIA_Lester_Beast_05_14"); //W porz�dku. Jestem troch� zm�czony...
	AI_Output (self, other,"DIA_Lester_Beast_05_15"); //Mo�e �mier� Bestii uwolni um�czone dusze moich braci?
	AI_Output (self, other,"DIA_Lester_Beast_05_16"); //Hmm. By� mo�e mamy wsp�lny cel. Ale �eby zabi� besti� najpierw musimy pozna� jej s�aby punkt.
	AI_Output (other, self,"DIA_Lester_Beast_15_17"); //Co masz na my�li?
	AI_Output (self, other,"DIA_Lester_Beast_05_18"); //Wypal ten... dar. To niezwykle mocny, halucynogenny narkotyk. Ziele pomo�e Ci ujrze� prawdziw� natur� Bestii i by� mo�e uka�e Ci s�aby punkt potwora.
	AI_Output (other, self,"DIA_Lester_Beast_15_19"); //Sam sobie wypal to paskudztwo!
	AI_Output (self, other,"DIA_Lester_Beast_05_20"); //Zrobi�bym to, ale na mnie narkotyk ju� nie dzia�a. Zbyt cz�sto u�ywa�em go w przesz�o�ci.
	AI_Output (self, other,"DIA_Lester_Beast_05_21"); //Oto ziele. Do Ciebie nale�y wyb�r. Wr�� do mnie, jak dowiesz si� czego� wi�cej.

	CreateInvItems (self,ItMiJoint_Lester,1);
	B_GiveInvItems (self, other, ItMiJoint_Lester, 1);

	B_LogEntry(CH4_RBL_Beast, "Lester powiedzia� mi, �e dopiero po jego powrocie bagno przerodzi�o si� w koszmarn� nekropoli�. Lester twierdzi, �e narkotyk, kt�ry mi podarowa� pozwoli mi pozna� prawd� o Bestii. No nic, wyb�r nale�y do mnie. Musz� spr�bowa�...");
};

// **************************************************

instance DIA_Lester_Joint (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  3;
	condition		=  DIA_Lester_Joint_Condition;
	information		=  DIA_Lester_Joint_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int DIA_Lester_Joint_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_Beast))&&(Dream_finished)&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Lester_Joint_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Lester_Joint_05_01"); //M�tne spojrzenie... Przykurcz twarzy... Wypali�e� ziele!
	AI_Output (other, self,"DIA_Lester_Joint_15_02"); //Tak jako� wysz�o.
	AI_Output (self, other,"DIA_Lester_Joint_05_03"); //Nie s�dzi�em, �e si� na to odwa�ysz. Nikt jeszcze tego nie prze�y�... A przynajmniej nikt kogo zna�em.
	AI_Output (other, self,"DIA_Lester_Joint_15_04"); //Co?!
	AI_Output (self, other,"DIA_Lester_Joint_05_05"); //To by�o jedyne wyj�cie. Narkotyk jest bardzo silny i naprawd� ukazuje to jak zaradzi� z�u. Ale jako� jeszcze nikt nie zdo�a� o tym opowiedzie�.
	AI_Output (other, self,"DIA_Lester_Joint_15_06"); //Mog�em przez Ciebie zgin��!
	AI_Output (self, other,"DIA_Lester_Joint_05_07"); //Wiem, ale got�w by�em na takie po�wi�cenie. Dzi�ki Tobie Bestia zostanie zniszczona!
	AI_Output (other, self,"DIA_Lester_Joint_15_08"); //A co gdybym nie prze�y�? Jakby� si� wtedy dowiedzia�, co nale�y uczyni�, aby zabi� potwora z bagien?
	AI_Output (self, other,"DIA_Lester_Joint_05_09"); //Poszuka�bym innego... ochotnika.
	AI_Output (other, self,"DIA_Lester_Joint_15_10"); //Niech Ci� szlag, Lester!
	AI_Output (self, other,"DIA_Lester_Joint_05_11"); //Zostawmy przesz�o�� za sob�, nie ma sensu rozgrzebywa� zasz�o�ci.
	AI_Output (self, other,"DIA_Lester_Joint_05_12"); //Co zobaczy�e�?
	AI_Output (other, self,"DIA_Lester_Joint_15_13"); //To akurat zachowam dla siebie.
	AI_Output (self, other,"DIA_Lester_Joint_05_14"); //Nie mo�esz...
	AI_Output (other, self,"DIA_Lester_Joint_15_15"); //Ale� mog�. Ty tak lekce szafowa�e� moim �yciem, to ja teraz wystawi� na pr�b� Twoj� ciekawo��. To i tak niska cena, powinienem jeszcze co� Ci obci�� w ramach rekompensaty.
	AI_Output (self, other,"DIA_Lester_Joint_05_16"); //Dobra ju�, dobra. Nie chowam urazy. Porozmawiamy kiedy... och�oniesz.
	B_LogEntry(CH4_RBL_Beast, "Okaza�o si�, �e jak zwykle mia�em wi�cej szcz�cia ni� rozumu. Jeszcze nikt nie prze�y� wypalenia tego narkotyku. Musz� zacz�� wystrzega� si� skaza�c�w nios�cych dary...");
};

// **************************************************

instance DIA_Lester_Join(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  3;
	condition		=  DIA_Lester_Join_Condition;
	information		=  DIA_Lester_Join_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int DIA_Lester_Join_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_FanaticTeacher))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Join_Info()
{
	var C_NPC bal; bal = Hlp_GetNpc(Gur_1203_BaalTondral);
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Lester_Join_05_01"); //Nie tak szybko! Id� z wami. Chc� na w�asne oczy zobaczy�, jak Bestia ginie.
	AI_Output (other, self,"DIA_Lester_Join_15_02"); //Ja na Twoim miejscu wybra�bym inny rodzaj samob�jstwa, ale jak tam sobie chcesz. Ruszamy!
	AI_TurnToNpc(other, bal);
	AI_Output (other, self,"DIA_Lester_Join_15_03"); //Prowad�, Baalu!
	AI_PlayAni(bal,"T_YES");
	B_LogEntry		(CH4_RBL_Beast, "Do wyprawy na Besti� do��czy� Lester.");
	B_StopProcessInfos	(self);

	/********************
Ork bal prowadzi, lester pod��a za dickiem. To fallow niech b�zie a� do �wi�tyni gdzie jest Bestia

********************************/

	Party_AddNpc(bal);
	Npc_ExchangeRoutine	(bal, "Guide");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self, "Follow");
};

// **************************************************

instance  DIA_Lester_Comment(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  4;
	condition		=  DIA_Lester_Comment_Condition;
	information		=  DIA_Lester_Comment_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int  DIA_Lester_Comment_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_Swamp))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Comment_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Lester_Comment_05_01"); //Nie s�dzi�em, �e jakiegokolwiek Baala sta� na takie po�wi�cenie.
	AI_Output (other, self,"DIA_Lester_Comment_15_02"); //S�abo znasz si� na ludziach, Lester.
	AI_Output (self, other,"DIA_Lester_Comment_05_03"); //By� mo�e, ale Tondral wydaje si� nieobecny duchem... Powinni�my pozwoli� mu p�j�� przodem, skoro i tak szuka �mierci.
	AI_Output (other, self,"DIA_Lester_Comment_15_04"); //To ostro�no�� czy tch�rzostwo przez Ciebie przemawia?
	AI_Output (self, other,"DIA_Lester_Comment_05_05"); //Jedno i drugie. Nie b�d� idiot�. Nie chc� zosta� bohaterem, bo oni najcz�ciej ko�cz� w paszczach koszmarnych Bestii.
	AI_Output (self, other,"DIA_Lester_Comment_05_06"); //A to zdaje si� Twoja rola w tym dramacie.
	AI_Output (other, self,"DIA_Lester_Comment_15_07"); //Przesta� gada� i zabijmy kilka zombie!
	AI_Output (self, other,"DIA_Lester_Comment_05_08"); //M�wisz o moich przyjacio�ach!
	AI_Output (other, self,"DIA_Lester_Comment_15_09"); //Jakby� nie zauwa�y� oni s� martwi i zdaje si�, �e niezbyt za nami przepadaj�. Idziesz czy zostajesz?
	AI_Output (self, other,"DIA_Lester_Comment_05_10"); //Id�, do cholery!
	AI_Output (other, self,"DIA_Lester_Comment_15_11"); //Wi�c zamknij g�b� i zr�b po�ytek z tego, co masz przy pasie!
	B_LogEntry(CH4_RBL_Beast, "Lester zdecydowanie za du�o gada!");
   
   B_StopProcessInfos	(self);
   Npc_ExchangeRoutine(self, "FollowToTemple");
};

// **************************************************

instance  DIA_Lester_Butcher(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  5;
	condition		=  DIA_Lester_Butcher_Condition;
	information		=  DIA_Lester_Butcher_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int  DIA_Lester_Butcher_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_End))&&(Npc_GetDistToNpc(self,hero) < 1000) && Npc_IsDead(tondral)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Butcher_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Lester_Butcher_05_01"); //Cholerny g�upiec, zgin�� zanim dopad� Besti�. Co teraz zrobimy?
	AI_Output (other, self,"DIA_Lester_Butcher_15_02"); //Musimy sami za�atwi� potwora.
	AI_Output (self, other,"DIA_Lester_Butcher_05_03"); //Hmm. Tondral wypi� ca�� trucizn�. Skoro kr��y�a w jego �y�ach, to musimy wyci�� z niego kawa�ek i nakarmi� nim potwora.
	AI_Output (other, self,"DIA_Lester_Butcher_15_04"); //To makabryczny pomys�, ale chyba nie ma innego rozwi�zania. Wytnij mu serce.
	AI_Output (self, other,"DIA_Lester_Butcher_05_05"); //Dlaczego ja?! Nie jestem rze�nikiem!
	AI_Output (other, self,"DIA_Lester_Butcher_15_06"); //To Tw�j pomys�. Ja tu poczekam.
	AI_Output (self, other,"DIA_Lester_Butcher_05_07"); //Niech Ci� szlag trafi, piracie!
	AI_Output (self, other,"DIA_Lester_Butcher_05_08"); //Dobra, ale karmi� Besti� b�dziesz sam!
	B_StopProcessInfos	(self);
   
   Lester_butcher = true;
	/************************
	Lester podchodzi do martwego Baala pochyla si� i niby wycina serce, a potem czeka na dicka
	************************/
};

// **************************************************

instance  DIA_Lester_Heart(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  6;
	condition		=  DIA_Lester_Heart_Condition;
	information		=  DIA_Lester_Heart_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int  DIA_Lester_Heart_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_Butcher))&&(Npc_GetDistToWP (self,"PSI_TEMPLE_IN_1") < 1500 ) && (!Lester_butcher)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Heart_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Lester_Heart_05_01"); //Zrobione. Teraz Twoja kolej. Wepchnij serce Tondrala w gard�o Bestii!
	CreateInvItems (self,baal_heart,1);
	B_GiveInvItems (self, other, baal_heart, 1);
	B_LogEntry		(CH4_RBL_Beast, "Musz� 'nakarmi�' Besti� sercem Baala. Po prostu �wietnie...");
	B_StopProcessInfos	(self);

	/***********************

Ork:
1. Lester oddaje serce dickowi.
2. Razem wchodz� do �wi�tyni.
3. Dor�b kraty, niech opadn� jak ch�opaki wejd�.
4. Wtedy Bestia zwr�ci si� w ich stron� i zainicjuje si� kolejny dialog.

	************************/
   wld_insertNPC(MonsterOfSwamp, "PSI_TEMPLE_ROOMS_IN_02");
   
	AI_GotoWP(self, "PSI_TEMPLE_IN");
	AI_GotoWP(other, "PSI_TEMPLE_IN");
};

// **************************************************

instance DIA_Lester_HeartThrow(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  7;
	condition		=  DIA_Lester_HeartThrow_Condition;
	information		=  DIA_Lester_HeartThrow_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int DIA_Lester_HeartThrow_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_Heart))&&(Npc_GetDistToWP (self,"PSI_TEMPLE_IN") < 1500 )
   &&(NPC_HasItems(other,baal_heart)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Lester_HeartThrow_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Lester_HeartThrow_05_01"); //Rzucaj do cholery!
	AI_Output (other, self, "DIA_Lester_HeartThrow_15_02"); //O kurwa, co za bydl�!
	AI_Output (self, other,"DIA_Lester_HeartThrow_05_03"); //Rzucaj!

	/****************

Ork jaka� animacja rzucania, mo�e strzelanie z kuszy bez kuszy?
**************************/
   NPC_RemoveInvItem(other, baal_heart);
   
	AI_Output (other, self, "DIA_Lester_HeartThrow_15_04"); //I co teraz?
	AI_Output (self, other,"DIA_Lester_HeartThrow_05_05"); //Uciekamy!
	AI_Output (other, self, "DIA_Lester_HeartThrow_15_06"); //Ale gdzie?
	AI_Output (self, other,"DIA_Lester_HeartThrow_05_07"); //Tam!
	AI_TurnToNpc(self, beast);
	AI_Output (self, other,"DIA_Lester_HeartThrow_05_08"); //Prywatne komnaty Y'Beriona. Musimy do nich dotrze�, zanim Bestia si� na nas rzuci.
	B_StopProcessInfos	(self);

	/***********************

Ork:
Ch�opaki niech wymin� Besti� i niech si� chowaj� w tych komnatach
Zrezygnowa�em z tego manewru z klatk� aragorna bo to troch� naci�gane no i pewnie nie �atwe do zrobienia. Poza tym w �wi�tyni nigdy nie by�o klatek na Cieniostwory xD

ALe jak chcesz mo�esz zrobi� to po aragornowemu, tu masz opis.

- bestia jest oczywi�cie nie�miertelna, szybsza od nas i og�lnie nie mamy �adnych szans, opr�cz jednej rzecz jasna. Tu� obok nas znajduje si� d�wignia zamykaj�ca klatk�. U�ywamy jej po czym wbiegamy pod klatk� wraz z lesterem kt�ry za nami pod��a, bestia pr�buje nas ze�re� ale nie mo�e pokona� przeszkody, po jakim� czasie zaczyna powoli odchodzi�

	************************/

	AI_GotoWP(self, "PSI_TEMPLE_ROOMS_IN_02");
	AI_GotoWP(other, "PSI_TEMPLE_ROOMS_IN_02");
   
   AI_Teleport(MonsterOfSwamp, "PSI_TEMPLE_IN_05");
};

// **************************************************

instance  DIA_Lester_Fight(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  8;
	condition		=  DIA_Lester_Fight_Condition;
	information		=  DIA_Lester_Fight_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int  DIA_Lester_Fight_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_HeartThrow))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Fight_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Lester_Fight_05_01"); //Trucizna chyba ju� zaczyna dzia�a�.
	AI_Output (other, self, "DIA_Lester_Fight_15_02"); //Nie b�d� si� tu wi�cej chowa�, czas nakopa� temu stworowi do nieumar�ego dupska!
	AI_Output (self, other,"DIA_Lester_Fight_05_03"); //Ekhm... B�d� tu� za tob�.
	B_LogEntry		(CH4_RBL_Beast, "Trucizna ju� dzia�a, ale musimy sami zabi� Besti�. Nie mog� zapomnie� o wyci�ciu serca!");
	
   self.flags = NPC_FLAG_IMMORTAL;
	B_ClearImmortal(beast);
   Npc_ChangeAttribute	(beast, ATR_HITPOINTS, -beast.attribute[ATR_HITPOINTS_MAX]/2);

	B_StopProcessInfos	(self);

	/***********************

Ork:
CH�opaki wychodz� i adzia xD
Bestia niech ju� nie b�dzie nie�miertelna i hp tez jej zmniejszy�em musz� sobie poradzi�, ale walka MUSI by� naprawd� trudna.

	************************/

	AI_GotoWP(self, "FIGHT");
	AI_GotoWP(other, "FIGHT");
};

// **************************************************

instance  DIA_Lester_FightEnd(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  9;
	condition		=  DIA_Lester_FightEnd_Condition;
	information		=  DIA_Lester_FightEnd_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int  DIA_Lester_FightEnd_Condition()
{
	if (Npc_IsDead(beast))&&(Npc_KnowsInfo(hero,DIA_Lester_Fight))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(NPC_HasItems(other,beast_heart)>=1)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_FightEnd_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Lester_FightEnd_05_01"); //Bestia nie �yje! Dokonali�my tego.
	AI_Output (other, self, "DIA_Lester_FightEnd_15_02"); //Nie by�o �atwo, ale po�wi�cenie Tondrala nie posz�o na marne.
	AI_Output (self, other,"DIA_Lester_FightEnd_05_03"); //To prawda. 
	AI_Output (self, other,"DIA_Lester_FightEnd_05_04"); //Na razie nasze drogi musz� si� rozej��. Mam sporo do przemy�lenia.
	AI_Output (self, other,"DIA_Lester_FightEnd_05_05"); //Musz� dowiedzie� si� co knuje Cor Kalom. Ale to ju� nie tw�j problem, Rick.
	AI_Output (other, self, "DIA_Lester_FightEnd_15_06"); //Bywaj Lester i powodzenia w tym co zamierzasz.

	/****************

Ork otw�rz bram� w tym dialogu, chyba, �e wolisz po �mierci bestii triggerem.
*****************************/

	Log_SetTopicStatus(CH4_RBL_Beast, LOG_SUCCESS);
	B_LogEntry(CH4_RBL_Beast, "Bestia nie �yje, a ja wyci��em jej serce. Czas znowu porozmawia� z Lerenem.");
	B_LogEntry(CH4_RBL_Rirual, "Zdoby�em serce Bestii. Musz� porozmawia� z Lerenem.");
	B_StopProcessInfos(self);

	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self, "STAY");

	/*******************
Niech Lester tu zostanie i poczyta ksi�gi w komnatach Yberiona
***********************/

	/**************************
Niech si� gdzie� pojawi Nekro w takim miejscu, �eby Dick nie m�g� go omin��.
************************/
   wld_insertNPC(DMB_1703_NecroInWorld, "PSI_TEMPLE_IN_1");
   AI_Teleport(necro_in_world, "PSI_TEMPLE_IN_1");
	B_ExchangeRoutine	(necro_in_world, "AfterDeadsBeast");
	// Ork: Wylaczam motyw walki z bossem
   BOSSFIGHT_CURRENT = BOSSFIGHT_NONE;
};
