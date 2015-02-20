// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_818_RATFORD_Exit (C_INFO)
{
	npc			= HUN_818_RATFORD;
	nr			= 999;
	condition	= DIA_HUN_818_RATFORD_Exit_Condition;
	information	= DIA_HUN_818_RATFORD_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_818_RATFORD_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_818_RATFORD_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int ratford_fight;
var int ratford_hunt;

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_HUN_818_RATFORD_Hello (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 1;
	condition		= DIA_HUN_818_RATFORD_Hello_Condition;
	information		= DIA_HUN_818_RATFORD_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "My�liwy?"; 
};

FUNC INT DIA_HUN_818_RATFORD_Hello_Condition()
{
	return 1;
};
FUNC VOID DIA_HUN_818_RATFORD_Hello_Info()
{
	Npc_SetAivar(self,AIV_WASDEFEATEDBYSC,  FALSE); Npc_SetAivar(self,AIV_HASDEFEATEDSC,  FALSE);
   
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_15_01"); //My�liwy?
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_02"); //Jak na to wpad�e�?
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_15_03"); //Dobra, przejd� od razu do rzeczy...
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_04"); //Nie musisz. Ka�dy nowy przychodzi do mnie tylko po to, by udowodni� swoj� warto��.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_05"); //A ja z regu�y robi� najwi�kszy odsiew, bo nie przepadam za pata�achami.
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_15_06"); //Uwa�aj na s�owa. Z�by �uje si� gorzej ni� tyto�.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_07"); //A masz w jajach na tyle ikry by pokry� to co powiedzia�e� czynami?
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_15_08"); //Sprawd� mnie.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_09"); //Niech b�dzie. Masz dwie mo�liwo�ci.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_10"); //Zabij kilka wilk�w i przynie� mi ich k�y. Udowodnisz w ten spos�b, �e wiesz jak oprawia� zwierz�ta, a my�liwych nigdy za wiele.
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_15_11"); //A druga mo�liwo��?
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_12"); //Sprawd� si� w boju ze mn�.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_13"); //Prawdziwi wojownicy staj� naprzeciw siebie na d�ugo�� wyci�gni�tego or�a.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_14"); //To jak b�dzie?
	Info_ClearChoices (DIA_HUN_818_RATFORD_Hello);
	Info_AddChoice (DIA_HUN_818_RATFORD_Hello, "Skrzy�ujmy ostrza.", DIA_HUN_818_RATFORD_Hello_Yes);
	Info_AddChoice (DIA_HUN_818_RATFORD_Hello, "P�jd� na polowanie.", DIA_HUN_818_RATFORD_Hello_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_HUN_818_RATFORD_Hello_Yes()
{
	ratford_fight = TRUE;
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_Yes_15_01"); //Skrzy�ujmy ostrza.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_Yes_07_02"); //No prosz�, jednak masz jaja.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_Yes_07_03"); //No to sprawd�my jak twarde!
	Log_CreateTopic(CH1_Rbl_Wolf, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Wolf, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Wolf, "�eby zdoby� szacunek Ratforda, musz� pokona� go w walce co nie b�dzie �atwe, ale radzi�em ju� sobie w gorszych opresjach.");
	B_SetTimedATT(self,30*events_per_sec,-150,-150,-80);
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ------------------No----------------

FUNC VOID DIA_HUN_818_RATFORD_Hello_No()
{
	ratford_hunt = TRUE;
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_No_15_01"); //P�jd� na polowanie.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_No_07_02"); //Tak my�la�em. Du�o �atwiej ustrzeli� wilka ni� skrzy�owa� miecz z wojownikiem.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_No_07_03"); //Zabij kilka sier�ciuch�w. Powiedzmy, �e pi�� par k��w wystarczy mi na naszyjnik.
	Log_CreateTopic(CH1_Rbl_Wolf, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Wolf, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Wolf, "�eby udowodni� sw� przydatno�� Ratfordowi, musz� ubi� pi�� wilk�w i zdoby� ich k�y. Nie powinno by� z tym wi�kszych problem�w.");
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Ratford_CanYouTeachMe (C_INFO)
{
	npc				=  HUN_818_RATFORD;
	nr				= 4;
	condition		= DIA_Ratford_CanYouTeachMe_Condition;
	information		= DIA_Ratford_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "M�g�by� nauczy� mnie polowa�?"; 
};

FUNC INT DIA_Ratford_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_HUN_818_RATFORD_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Ratford_CanYouTeachMe_Info()
{
   AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //M�g�by� nauczy� mnie polowa�?
   AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Par� sztuczek m�g�bym ci pokaza�, ale to b�dzie kosztowa�.
   AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Wprawny �owca potrafi zdoby� k�y, pazury i sk�r� zwierzyny. Nie jest to �atwe, ale do�� op�acalne.
	AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //W ka�dym razie ka�dy kupiec ch�tnie odkupi od ciebie trofea.
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Ratford mo�e mnie nauczy� polowa�: �ci�gania futer, zdobywania k��w i pazur�w.");
};

INSTANCE DIA_Ratford_Fight (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 2;
	condition		= DIA_Ratford_Fight_Condition;
	information		= DIA_Ratford_Fight_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Ratford_Fight_Condition()
{
	if (ratford_fight == TRUE)
	{
		return 1;
	};
};
FUNC VOID DIA_Ratford_Fight_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Ratford_Fight_15_01"); //To by�a niez�a bitka.
   
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		B_GiveXP(100);
		ratford_hunt = TRUE;
		AI_Output (self, other, "DIA_Ratford_Fight_07_02"); //Mo�e i nie pokona�e� mnie w walce, ale przynajmniej nie ucieka�e� z podkulonym ogonem polowa� na wilki.
		AI_Output (self, other, "DIA_Ratford_Fight_07_03"); //Mam jednak swoje zasady. Przynie� 5 par wilczych k��w i masz moje poparcie, przyjacielu.

		Log_SetTopicStatus(CH1_Rbl_Wolf, LOG_RUNNING);
		B_LogEntry(CH1_Rbl_Wolf, "Wyzwa�em Ratforda na pojedynek, nie zdo�a�em jednak pokona� my�liwego. Mimo to Ratford wstawi si� za mn�, je�eli przynios� mu pi�� par wilczych k��w. Czas ruszy� na polowanie.");
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		ratford_trust = TRUE;	//ORC: Bugfix - mission sucessed
		rebel_camp_trust = rebel_camp_trust + 1; 
		B_GiveXP(400);	
		AI_Output (self, other, "DIA_Ratford_Fight_07_04"); //Tego si� nie spodziewa�em - wygra�e� w uczciwej walce. 
		AI_Output (self, other, "DIA_Ratford_Fight_07_05"); //Brakuje nam takich ludzi. Dobrze, �e jeste� po naszej stronie.
		AI_Output (self, other, "DIA_Ratford_Fight_07_06"); //Zas�u�y�e� na m�j szacunek, przyjacielu. A to nie cz�sto si� zdarza.
		Log_SetTopicStatus(CH1_Rbl_Wolf, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Wolf, "Pokona�em Ratforda w uczciwej walce. Zdoby�em szacunek i poparcie my�liwego. Zaczyna mi si� podoba� w�r�d tych rebeliant�w...");
		B_LogEntry(CH1_Rbl_RebelCampTrust, "Zdoby�em szacunek Ratforda. Musz� przyzna�, �e ten my�liwy troch� mi zaimponowa�.");
	};
};


INSTANCE DIA_Ratford_Hunt (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 3;
	condition		= DIA_Ratford_Hunt_Condition;
	information		= DIA_Ratford_Hunt_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam wilcze k�y."; 
};

FUNC INT DIA_Ratford_Hunt_Condition()
{
	if (NPC_HasItems(other,ItAt_WolfTeeth)>=5)&&(ratford_hunt)
	{
		return 1;
	};
};

FUNC VOID DIA_Ratford_Hunt_Info()
{
	ratford_trust = TRUE;
	rebel_camp_trust = rebel_camp_trust + 1; 
	B_GiveXP(150);	
	AI_Output (other, self, "DIA_Ratford_Hunt_15_01"); //Mam wilcze k�y.
	B_GiveInvItems (other, self, ItAt_WolfTeeth,5);
	Npc_RemoveInvItems(self,ItAt_WolfTeeth,5);
	AI_Output (self, other, "DIA_Ratford_Hunt_07_02"); //Rzeczywi�cie. Jak dla mnie mo�e by�. Najwa�niejsze, �e potrafisz polowa�.
	AI_Output (self, other, "DIA_Ratford_Hunt_07_03"); //Wstawi� si� za Tob� u Cavalorna, przyjacielu.
	Log_SetTopicStatus(CH1_Rbl_Wolf, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Wolf, "Odda�em Ratfordowi wilcze k�y. My�liwy uzna� to za wystarczaj�cy dow�d mojej 'u�yteczno�ci'.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "Udowodni�em Ratfordowi swoj� przydatno��. Nied�ugo droga do obozu stanie przed mn� otworem.");
};

INSTANCE DIA_Ratfordr_Attack (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 11;
	condition		= DIA_Ratfordr_Attack_Condition;
	information		= DIA_Ratfordr_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Ratfordr_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Ratfordr_Attack_Info()
{
	AI_Output (self, other, "DIA_Ratfordr_Attack_07_01"); //Pomyli�em si� co do Ciebie.
	AI_Output (self, other, "DIA_Ratfordr_Attack_07_02"); //Ale mog� to jeszcze nadrobi�...
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_RATFORD_Stew (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 12;
	condition		= DIA_RATFORD_Stew_Condition;
	information		= DIA_RATFORD_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "To ci� rozgrzeje."; 
};

FUNC INT DIA_RATFORD_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_RATFORD_Stew_15_01"); //To ci� rozgrzeje.
	AI_Output (self, other, "DIA_RATFORD_Stew_11_02"); //O ile wcze�niej mnie nie zabije...
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Ratford chyba nie przepada za gulaszem Snafa."); 
};

INSTANCE DIA_RATFORD_Spy (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 13;
	condition		= DIA_RATFORD_Spy_Condition;
	information		= DIA_RATFORD_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zawsze by�e� my�liwym?"; 
};

FUNC INT DIA_RATFORD_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Spy_Info()
{
	spy_count = spy_count + 1;
	AI_Output (other, self, "DIA_RATFORD_Spy_15_01"); //Zawsze by�e� my�liwym?
	AI_Output (self, other, "DIA_RATFORD_Spy_07_02"); //A Ty zawsze by�e� piratem?
	AI_Output (other, self, "DIA_RATFORD_Spy_15_03"); //Nie.
	AI_Output (self, other, "DIA_RATFORD_Spy_07_04"); //Widzisz przyjacielu, czasami stajemy si� tym, kim musimy by�, a nie tym kim by�my chcieli.
	AI_Output (other, self, "DIA_RATFORD_Spy_15_05"); //Widz� w twoich oczach... smug� cienia. Co� si� wydarzy�o, tak?
	AI_Output (self, other, "DIA_RATFORD_Spy_07_06"); //Ka�dy ma swoje tajemnice. Czasami lepiej nie wiedzie� zbyt wiele, d�u�ej si� wtedy �yje.
	B_LogEntry(CH2_Rbl_Spy, "Ratford te� co� ukrywa. W jego oczach wida� pustk� i... zgliszcza. Co mog�o wypali� od �rodka tego twardego m�czyzn�?.");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od Ciebie chcia�.
		B_LogEntry(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_RATFORD_Spy1 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 4;
	condition		= DIA_RATFORD_Spy1_Condition;
	information		= DIA_RATFORD_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia�em... przeprosi�."; 
};

FUNC INT DIA_RATFORD_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Spy1_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Spy1_15_01"); //Chcia�em... przeprosi�.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_02"); //Za co?
	AI_Output (other, self, "DIA_RATFORD_Spy1_15_03"); //Ka�dy z nas straci� kogo�... bliskiego. Nie powinienem tak Ci� nagabywa�.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_04"); //Chyba kto� mia� za d�ugi j�zyk. Takie jest �ycie piracie. To nie cel jest wa�ny, ale droga, kt�ra do niego zmierza.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_05"); //Nasze �cie�ki rozesz�y si�, a gdy znowu si� spotka�y, by�o ju� za p�no.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_06"); //Od tej pory stroni� od ludzi. Nie chc� zn�w patrze� w twarz umieraj�cego przyjaciela.
	AI_Output (other, self, "DIA_RATFORD_Spy1_15_07"); //Rozumiem. Zostawi� Ci� samego...
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_08"); //Zaczekaj. O co chodzi? Szukasz czego�?
	AI_Output (other, self, "DIA_RATFORD_Spy1_15_09"); //Raczej kogo�, kto brata si� ze Starym Obozem.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_10"); //Hmm, te� mia�em takie podejrzenia, stra�nicy za du�o o nas wiedz�.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_11"); //Dam ci dobr� rad� - nie szukaj tego co oczywiste, tylko tego co stwarza pozory prawdy.
	AI_Output (other, self, "DIA_RATFORD_Spy1_15_12"); //Chyba nie zrozumia�em...
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_13"); //Zrozumiesz w swoim czasie.
	B_LogEntry(CH2_Rbl_Spy, "Ratford izoluje si� od ludzi, bo nie chce ponownie prze�y� straty przyjaciela. Powiedzia� mi, abym nie wierzy� pozorom. Chyba chcia� mi powiedzie�, �ebym nie ufa� k�amcom. Jak na razie tylko Tony nie by� ze mn� do ko�ca szczery. R�czka te� co� kr�ci. ");
	tony_spy = tony_spy + 1;

	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta�, nie daj mu czeka�.
		B_LogEntry(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};

	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_RATFORD_IwillBecameHunter(C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 151;
	condition		= DIA_RATFORD_IwillBecameHunter_Condition;
	information		= DIA_RATFORD_IwillBecameHunter_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wkroczy�em na �cie�k� �owcy."; 
};

FUNC INT DIA_RATFORD_IwillBecameHunter_Condition()
{
	//TODO: Wyb�r Mag-�owca Powinien byc wlasnie po powrocie od �T, wiec w tym miejscu nalezy wpisa� "Chcia�bym wkroczy� na sciezke �owcy"(if(!SciezkaMaga)) dodac tez w dialogu z cav po powrocie o tym ze mamy wybrac, wrzucic tez konkretny dialog miltenowi.
	if (CAVALORN_ASK_TRAIL==1)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_IwillBecameHunter_Info()
{
	AI_Output (other, self, "DIA_RATFORD_IwillBecameHunter_15_01"); //Wkroczy�em na �cie�k� �owcy.
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_02"); //Wiem, rozmawia�em o Tobie z Cavalornem.
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_03"); //Nie wierz� w przypadek, ani szcz�cie. To co si� stanie mniej lub bardziej zale�y tylko i wy��cznie od Ciebie i innych ludzi.
	AI_Output (other, self, "DIA_RATFORD_IwillBecameHunter_15_04"); //Po co mi o tym m�wisz?
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_05"); //Najwy�sza pora sprawdzi�, kim naprawd� jeste� i na co Ci� sta�.
	AI_Output (other, self, "DIA_RATFORD_IwillBecameHunter_15_06"); //Co przez to rozumiesz?
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_07"); //Dam Ci zadanie i tylko od Ciebie zale�y, jak� drog� pod��ysz, by je rozwi�za�.
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_08"); //Niedaleko st�d pojawi� si� patrol stra�nik�w. Masz si� ich pozby�, to jak to zrobisz zale�y tylko od Ciebie.
	AI_Output (other, self, "DIA_RATFORD_IwillBecameHunter_15_09"); //Rozumiem. Mo�esz ju� uwa�a� ten problem za rozwi�zany.
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_10"); //Wr��, kiedy tak b�dzie.
	
   Log_CreateTopic(CH2_RBL_GuardCamp, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_GuardCamp, LOG_RUNNING);
	B_LogEntry(CH2_RBL_GuardCamp, "Ratford chce, �ebym zaj�� si� patrolem stra�nik�w w pobli�u obozu. To jak sobie z nim poradz� to moja sprawa. Mam kilka mo�liwo�ci: u�ycie si�y, zaskoczenie lub spryt.");
	B_LogEntry(CH2_RBL_Hunter, "Ratford chce sprawdzi�, jak poradz� sobie z patrolem stra�nik�w w pobli�u obozu. Musz� mu pokaza�, co jestem wart.");
	
	B_StopProcessInfos(self);	

	Wld_InsertNpc (GRD_4061_Guard,"MIS_GRDPATROL1_2");
	Wld_InsertNpc (GRD_4060_Guard,"MIS_GRDPATROL1_2");
	Wld_InsertNpc (GRD_4059_Guard,"MIS_GRDPATROL1_2");
	Wld_InsertNpc (GRD_4058_Guard,"MIS_GRDPATROL1_2");
	Wld_InsertNpc (GRD_4057_Guard,"MIS_GRDPATROL1_2");
	Wld_InsertNpc (GRD_4056_Guard,"MIS_GRDPATROL1_2");		
};
// **************************************************
INSTANCE DIA_RATFORD_Quest1 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 16;
	condition		= DIA_RATFORD_Quest1_Condition;
	information		= DIA_RATFORD_Quest1_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_Quest1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_IwillBecameHunter))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Quest1_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
	AI_Output (self, other, "DIA_RATFORD_Quest1_07_01"); //Aha, dam Ci dobr� rad�. Je�eli masz tu jaki� przyjaci�, to warto z nimi porozmawia�, zanim znajdziesz ten patrol.
	AI_Output (other, self, "DIA_RATFORD_Quest1_15_02"); //Dzi�ki, b�d� o tym pami�ta�.
	AI_Output (self, other, "DIA_RATFORD_Quest1_07_03"); //Szcz�liwych �ow�w.
	B_LogEntry(CH2_RBL_GuardCamp, "Na odchodnym Ratford poradzi� mi, �ebym porozmawia� z przyjaci�mi, kt�rzy mog� mi pom�c w rozprawieniu si� z patrolem stra�y.");
	B_StopProcessInfos(self);
};

var int rat_info;

// **************************************************

INSTANCE DIA_RATFORD_PatrolFinish (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 17;
	condition		= DIA_RATFORD_PatrolFinish_Condition;
	information		= DIA_RATFORD_PatrolFinish_Info;
	permanent		= 1;
	important		= 0;
	description		= "Za�atwi�em spraw� z patrolem."; 
};

FUNC INT DIA_RATFORD_PatrolFinish_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Quest1))&&(rat_info == false)//&&((patrol_trial >= 1))
	{
		return 1;
	};
};
FUNC VOID DIA_RATFORD_PatrolFinish_Info()
{
	AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_01"); //Za�atwi�em spraw� z patrolem.
	AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_02"); //Czy�by...

	if (B_guards_patrol_finished())
	{
		rat_info = true;

		if (dick_patrol_choice == 1)&&(patrol_trial == 2)
		{
			B_GiveXP (500);
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_03"); //Dorwa�em sukinsyn�w i zrobi�em z nimi porz�dek. Pomogli mi piraci.
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_04"); //Ma�o subtelnie, ale skutecznie. Dobrze, �e mnie pos�ucha�e� i znalaz�e� wsparcie.

		} 
		else if (dick_patrol_choice == 2)&&(patrol_trial == 3)
		{
			B_GiveXP (700);
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_05"); //Zwabi�em stra�nik�w w pu�apk�, pomogli mi piraci. Wyr�n�li�my ich co do nogi.
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_06"); //Nie�le to wymy�li�e�. Dobrze, �e mnie pos�ucha�e� i znalaz�e� wsparcie.

		}
		else if (dick_patrol_choice == 3)&&(patrol_trial == 10)
		{
			B_GiveXP (1000);
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_07"); //Przekona�em ich do tego, �eby wr�cili do Starego Obozu i nie wy�ciubiali stamt�d nosa. Piraci czekali w odwodzie, gdyby co� posz�o nie tak.
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_08"); //Zadziwiasz mnie. Wol� nie wiedzie�, jak zdo�a�e� tego dokona�.
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_09"); //Mimo wszystko szkoda, �e ich nie zabi�e�, Gomezowi przyby�o mieczy w Starym Obozie.
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_10"); //Hmm, o tym nie pomy�la�em.
		}
		else if (dick_patrol_choice == 3)&&(patrol_trial == 8)
		{
			B_GiveXP (800);
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_11"); //Spr�bowa�em przekona� ich, �eby wynie�li si� do Starego Obozu, ale nie dali si� nabra�. Wyr�n��em ich z piratami.
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_12"); //Dobrze zrobi�e� - gdyby negocjacje si� uda�y, Gomezowi przyby�oby mieczy w Obozie.
			
		}
		else// if (dick_patrol_choice == 0)&&(patrol_trial == 1)
		{
			B_GiveXP (1250);
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_13"); //Znalaz�em sukinsyn�w i wyr�n��em do nogi bez niczyjej pomocy!
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_14"); //Niesamowite! Nie wygl�dasz na takiego sukinsyna...	
		};
      
		AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_15"); //Dobrze si� sprawi�e�, zas�u�y�e� na nagrod� i chwil� spokoju.
		AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_16"); //Wr�� do mnie, jak b�dziesz got�w.

      CreateInvItems (self, ItMiNugget, 200);
      B_GiveInvItems (self, other, ItMiNugget, 200);

		Log_SetTopicStatus(CH2_RBL_GuardCamp, LOG_SUCCESS);
		B_LogEntry(CH2_RBL_GuardCamp, "Za�atwi�em spraw� z patrolem. Ratford by� zadowolony, ba, pozwoli� mi nawet odpocz�� przed kolejnym zadaniem. Mam si� do niego zg�osi�, jak b�d� got�w.");
	}
	else
	{
		AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_17"); //Zdaje si�, �e widzia�em kt�rego� z tych stra�nik�w, do tego �ywego. Za�atw spraw� jak nale�y.
	};
};

// **************************************************

INSTANCE DIA_RATFORD_Rock (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 18;
	condition		= DIA_RATFORD_Rock_Condition;
	information		= DIA_RATFORD_Rock_Info;
	permanent		= 0;
	important		= 0;
	description		= "W porz�dku, jestem got�w."; 
};

FUNC INT DIA_RATFORD_Rock_Condition()
{
	if (rat_info == true)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Rock_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Rock_15_01"); //W porz�dku, jestem got�w.
	AI_Output (self, other, "DIA_RATFORD_Rock_07_02"); //Bardzo mnie to cieszy. 
	AI_Output (self, other, "DIA_RATFORD_Rock_07_03"); //Udowodni�e�, �e radzisz sobie z r�nymi sytuacjami i robisz to do�� skutecznie. Zadanie, kt�re chc� Ci powierzy� mo�e mie� ogromny wp�yw na przysz�o�� naszego obozu.
	AI_Output (other, self, "DIA_RATFORD_Rock_15_04"); //Brzmi powa�nie.
	AI_Output (self, other, "DIA_RATFORD_Rock_07_05"); //Niestety sam nie wiem za du�o. Nasi magowie wysondowali �r�d�o pot�nej mocy w ruinach staro�ytnej �wi�tyni w dolinie.
	AI_Output (self, other, "DIA_RATFORD_Rock_07_06"); //Chc�, �eby� si� tam wybra� i rozejrza�. Magowie s� przekonani, �e odnajdziemy tam co�, co pomo�e nam w walce z Gomezem.
	AI_Output (other, self, "DIA_RATFORD_Rock_15_07"); //Jak� mam pewno��, �e znajd� tam co� wi�cej ni� kurz?
	AI_Output (self, other, "DIA_RATFORD_Rock_07_08"); //�adn�. Tacy w�a�nie s� magowie, nigdy z nimi nie ma pewno�ci. Ale w naszej sytuacji musimy szuka� pomocy wsz�dzie gdzie to mo�liwe.
	AI_Output (other, self, "DIA_RATFORD_Rock_15_09"); //Rozumiem. Gdzie znajd� ruiny?
	AI_Output (self, other, "DIA_RATFORD_Rock_07_10"); //We� t� map�, magowie zaznaczyli na niej po�o�enie �wi�tyni. 

	CreateInvItems (self, KatarMap_Tomb,1); 
	B_GiveInvItems (self, other, KatarMap_Tomb, 1);
	AI_Output (self, other, "DIA_RATFORD_Rock_07_11"); //B�d� ostro�ny. To pradawna budowla, nie wiadomo, co kryje si� w jej trzewiach.
	AI_Output (other, self, "DIA_RATFORD_Rock_15_12"); //Ostro�no�� to moje drugie imi�, przyjacielu. Bywaj.

	Log_CreateTopic(CH2_RBL_Journey, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Journey, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Journey, "Ratford chce, �ebym rozejrza� si� w ruinach jakiej� �wi�tyni. Podobno magowie wyczuli tam jakie� �r�d�o mocy, kt�re mog�oby nam pom�c w walce z Gomezem. Ratford da� mi map� z zaznaczon� lokacj� tej �wi�tyni. Znowu czeka mnie spacer w�r�d kurzu i zbutwia�ych ko�ci...");
	B_LogEntry(CH2_RBL_Hunter, "Ratford wys�a� mnie do ruin, aby zadowoli� mag�w, szukaj�c jakiego� �r�d�a mocy.");
	//OW_GROBOWIEC_01
};

var int rat_wait;

// **************************************************

INSTANCE DIA_RATFORD_RockEnd (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 19;
	condition		= DIA_RATFORD_RockEnd_Condition;
	information		= DIA_RATFORD_RockEnd_Info;
	permanent		= 0;
	important		= 0;
	description		= "By�em w �wi�tyni."; 
};

FUNC INT DIA_RATFORD_RockEnd_Condition()
{
	if (NPC_HasItems(other,Katrakanat_book)>=1)&&(NPC_HasItems(other,Katrakanat_piece)>=1)&&(Npc_KnowsInfo (hero, DIA_RATFORD_Rock))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_RockEnd_Info()
{
	B_GiveXP (500);
   
	AI_Output (other, self, "DIA_RATFORD_RockEnd_15_01"); //By�em w �wi�tyni.
	AI_Output (self, other, "DIA_RATFORD_RockEnd_07_02"); //Co tam znalaz�e�?
	AI_Output (other, self, "DIA_RATFORD_RockEnd_15_03"); //Mi�dzy innymi ksi�g� i fragment 'czego�'.
	AI_Output (self, other, "DIA_RATFORD_RockEnd_07_04"); //Daj mi to...
	
   B_GiveInvItems (other, self, Katrakanat_book, 1);
	B_GiveInvItems (other, self, Katrakanat_piece, 1);
	Npc_RemoveInvItems(self,Katrakanat_book,1);
	Npc_RemoveInvItems(self,Katrakanat_piece,1);
	
   AI_Output (self, other, "DIA_RATFORD_RockEnd_07_05"); //Ksi�ga niemal�e rozsypuje si� w r�kach. A ten kawa�ek musia� by� cz�ci� czego� wi�kszego.
	AI_Output (self, other, "DIA_RATFORD_RockEnd_07_06"); //To powinno zadowoli� mag�w. Zanios� im Twoj� zdobycz, jak tylko znajd� chwilk�.
	AI_Output (self, other, "DIA_RATFORD_RockEnd_07_07"); //Wr�� jutro, wtedy b�d� wiedzia� co� wi�cej o tych przedmiotach.
	
   rat_wait = B_SetDayTolerance()+1;
	Log_SetTopicStatus(CH2_RBL_Journey, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Journey, "Odda�em Ratfordowi ksi�g� i kawa�ek kamienia, kt�re znalaz�em w �wi�tyni. Powiedzia�, �e zaniesie to magom i kaza� mi przyj�� na drugi dzie�.");
};

// **************************************************

INSTANCE DIA_RATFORD_Book (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 20;
	condition		= DIA_RATFORD_Book_Condition;
	information		= DIA_RATFORD_Book_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_Book_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_RockEnd))&&(rat_wait <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Book_Info()
{
	katar_rytual = TRUE;
   
	AI_Output (self, other, "DIA_RATFORD_Book_07_01"); //Niedawno wr�ci�em od mag�w. Przeprowadzili rytua�, ale wynik�y pewne... komplikacje.
	AI_Output (other, self, "DIA_RATFORD_Book_15_02"); //Co si� sta�o?
	AI_Output (self, other, "DIA_RATFORD_Book_07_03"); //Zakl�cia, kt�rymi ob�o�ono ten almanach s� zbyt pot�ne, aby m�g� je zneutralizowa�, kt�ry� z naszych mag�w.
	AI_Output (self, other, "DIA_RATFORD_Book_07_04"); //Zdo�ali jedynie st�umi� mroczn� aur� ksi�gi.
	AI_Output (other, self, "DIA_RATFORD_Book_15_05"); //To �wietnie, ale jaki to ma zwi�zek ze mn�?
	AI_Output (self, other, "DIA_RATFORD_Book_07_06"); //Magowie twierdz�, �e ksi�gi nie mo�e otworzy� nikt, kto w�ada moc� od jakiegokolwiek boga.
	AI_Output (self, other, "DIA_RATFORD_Book_07_07"); //Powiedzieli, �e musi to by� kto� czysty, nie 'zbrukany' magi�.
	AI_Output (other, self, "DIA_RATFORD_Book_15_08"); //A ty rado�nie pomy�la�e� o mnie?
	AI_Output (self, other, "DIA_RATFORD_Book_07_09"); //Wiem, jak to wygl�da, ale nie mamy wyboru. Potrzebujemy ka�dej pomocy do walki o przetrwanie, a ta ksi�ga ma ogromn� moc.
	AI_Output (self, other, "DIA_RATFORD_Book_07_10"); //Tajemnice, kt�re skrywa mog� uratowa� nas wszystkich...
	AI_Output (other, self, "DIA_RATFORD_Book_15_11"); //Albo zniszczy�.
	AI_Output (self, other, "DIA_RATFORD_Book_07_12"); //Zdaj� sobie z tego spraw�. Musimy zaryzykowa�.
	AI_Output (other, self, "DIA_RATFORD_Book_15_13"); //To �wietnie, ale znajd� sobie innego idiot�. Nie b�d� nara�a� �ycia tylko po to, �eby zadowoli� ego kilku mag�w.
	AI_Output (self, other, "DIA_RATFORD_Book_07_14"); //Nikt pr�cz Ciebie nie mo�e otworzy� ksi�gi.
	AI_Output (other, self, "DIA_RATFORD_Book_15_15"); //To jakie� brednie...
	AI_Output (self, other, "DIA_RATFORD_Book_07_16"); //Ty pierwszy dotkn��e� inkunabu�u. Magowie uwa�aj�, �e ten dotyk zosta�... zapami�tany.
	AI_Output (other, self, "DIA_RATFORD_Book_15_17"); //Cholerny be�kot op�tanych magi� idiot�w! Dobra, daj almanach. Zobaczymy, co si� stanie.
	
   CreateInvItems (self,Katrakanat_book,1);	
	B_GiveInvItems (self, other, Katrakanat_book, 1);
	
   AI_Output (self, other, "DIA_RATFORD_Book_07_18"); //Wierz� w Ciebie, przyjacielu.
	AI_Output (other, self, "DIA_RATFORD_Book_15_19"); //Naiwniak z Ciebie, ale niech b�dzie.
	
   Log_CreateTopic(CH2_RBL_MysteryBook, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_MysteryBook, LOG_RUNNING);
	B_LogEntry(CH2_RBL_MysteryBook, "Magowie przeprowadzili rytua�, jednak nie mog� otworzy� ksi�gi - podobno tylko ja mog� to uczyni�. Po prostu �wietnie...");
	B_StopProcessInfos(self);
};

/**************************************************/

var int book_name;

INSTANCE DIA_RATFORD_BookKnow (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 21;
	condition		= DIA_RATFORD_BookKnow_Condition;
	information		= DIA_RATFORD_BookKnow_Info;
	permanent		= 1;
	important		= 0;
	description		= "Przeczyta�em ksi�g�."; 
};

FUNC INT DIA_RATFORD_BookKnow_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Book))&&(open_kart)&&(!book_name)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_BookKnow_Info()
{
	AI_Output (other, self, "DIA_RATFORD_BookKnow_15_01"); //Przeczyta�em ksi�g�.
	AI_Output (self, other, "DIA_RATFORD_BookKnow_07_02"); //I co?
	AI_Output (other, self, "DIA_RATFORD_BookKnow_15_03"); //I �yj�!
	AI_Output (self, other, "DIA_RATFORD_BookKnow_07_04"); //To widz�, ale co tam by�o napisane?
	AI_Output (other, self, "DIA_RATFORD_BookKnow_15_05"); //Same brednie i jaki� traktat w obcym j�zyku.
	AI_Output (self, other, "DIA_RATFORD_BookKnow_07_06"); //Nic wi�cej?! Powiedz dok�adnie co to za brednie.
	AI_Output (other, self, "DIA_RATFORD_BookKnow_15_07"); //'Ten, kt�ry zechce wyrzec si� �cie�ki mroku i pod��y drog� �wiat�a, pozna prawdziwe �r�d�o pradawnej pot�gi.'
	AI_Output (other, self, "DIA_RATFORD_BookKnow_15_08"); //'Dane mu b�dzie u�y� jej, aby skruszy� �a�cuchy zapomnienia i zg��bi� tajemnic� przekl�tego imienia, z pierwszych znak�w s��w spisanych winem �ycia...'
	AI_Output (self, other, "DIA_RATFORD_BookKnow_07_09"); //Hmm, rzeczywi�cie do�� zawi�a zagadka. Ale co� mi �wita.
	AI_Output (other, self, "DIA_RATFORD_BookKnow_07_10"); //'z pierwszych znak�w s��w spisanych winem �ycia...'
	AI_Output (self, other, "DIA_RATFORD_BookKnow_15_11"); //To musi by� klucz do ksi�gi. Tylko co to mo�e oznacza�?

	Info_ClearChoices (DIA_RATFORD_BookKnow);
	Info_AddChoice (DIA_RATFORD_BookKnow, "Nie mam poj�cia.", DIA_RATFORD_BookKnow_No);
	Info_AddChoice (DIA_RATFORD_BookKnow, "Mo�e trzeba po��czy� pierwsze litery ka�dego wersu?", DIA_RATFORD_BookKnow_Know);
	Info_AddChoice (DIA_RATFORD_BookKnow, "Pewnie trzeba z�o�y� wyraz z pierwszych liter pierwszego zdania.", DIA_RATFORD_BookKnow_Maybe);
	Info_AddChoice (DIA_RATFORD_BookKnow, "Gdyby tak wzi�� pierwszy znak z ka�dego wyrazu w ka�dym zdaniu...", DIA_RATFORD_BookKnow_Hmm);
};

FUNC VOID DIA_RATFORD_BookKnow_No()
{
	AI_Output (other, self, "DIA_RATFORD_BookKnow_No_15_01"); //Nie mam poj�cia.
	AI_Output (self, other, "DIA_RATFORD_BookKnow_No_07_02"); //M�g�by� si� bardziej wysili�.
	Info_ClearChoices (DIA_RATFORD_BookKnow);
};

FUNC VOID DIA_RATFORD_BookKnow_Know()
{
	book_name = TRUE;
	AI_Output (other, self, "DIA_RATFORD_BookKnow_Know_15_01"); //Mo�e trzeba po��czy� pierwsze litery ka�dego wersu?
	AI_Output (self, other, "DIA_RATFORD_BookKnow_Know_07_02"); //Brzmi rozs�dnie. A co z tego powstanie?
	AI_Output (other, self, "DIA_RATFORD_BookKnow_Know_15_03"); //Daj mi chwil�...
	
	/**************************
		Ork da si� zrobi�, �eby przeczyta� ksi�g�?
		***************************/
	B_UseFakeScroll(other);
	AI_Output (other, self, "DIA_RATFORD_BookKnow_Know_15_04"); //K-A-T-R-A-K-A-N-A-T...
	AI_Output (self, other, "DIA_RATFORD_BookKnow_Know_07_05"); //Niech mnie szlag, je�eli wiem o co chodzi.
	AI_Output (self, other, "DIA_RATFORD_BookKnow_Know_07_06"); //Musz� pogada� z magami. Wr�� do mnie jutro...
	//		AI_Output (self, other, "DIA_RATFORD_BookKnow_Know_07_06"); //Udaj si� do mag�w, powiedz o tym co uda�o nam si� odkry� Miltenowi. Wr�� do mnie jak najszybciej.

	rat_wait = B_SetDayTolerance()+1;
	B_LogEntry(CH2_RBL_MysteryBook, "Uda�o nam si� rozwik�a� zagadk� ksi�gi, ukryte s�owo brzmi K-A-T-R-A-K-A-N-A-T. Ratford znowu poszed� pogada� z magami, mam z nim porozmawia� jutro.");
	B_StopProcessInfos(self);
};

FUNC VOID DIA_RATFORD_BookKnow_Maybe()
{
	AI_Output (other, self, "DIA_RATFORD_BookKnow_Maybe_15_01"); //Pewnie trzeba z�o�y� wyraz z pierwszych liter pierwszego zdania.
	AI_Output (self, other, "DIA_RATFORD_BookKnow_Maybe_07_02"); //Mo�liwe, ale to zbyt proste. Nie, to musi by� co� innego.
	Info_ClearChoices (DIA_RATFORD_BookKnow);
};

FUNC VOID DIA_RATFORD_BookKnow_Hmm()
{
	AI_Output (other, self, "DIA_RATFORD_BookKnow_Hmm_15_01"); //Gdyby tak wzi�� pierwszy znak z ka�dego wyrazu w ka�dym zdaniu...
	AI_Output (self, other, "DIA_RATFORD_BookKnow_Hmm_07_02"); //To wysz�oby nam kolejne zdanie, a nie wyraz. To nie to.
	Info_ClearChoices (DIA_RATFORD_BookKnow);
};

// **************************************************

INSTANCE DIA_RATFORD_Search (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 22;
	condition		= DIA_RATFORD_Search_Condition;
	information		= DIA_RATFORD_Search_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_Search_Condition()
{
	if (book_name == TRUE)&&(rat_wait <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Search_Info()
{
	//todo: trigger zmieniajacy nazwe jezeli (rat_wait <= (Wld_GetDay())
	//Katrakanat_book.name = "Katrakanat - pie�� demona";
	AI_Output (self, other, "DIA_RATFORD_Search_07_01"); //Magowie sporo si� dowiedzieli.
	AI_Output (self, other, "DIA_RATFORD_Search_07_02"); //Ksi�ga, kt�r� znalaz�e�, rzeczywi�cie nazywa si� Katrakanat, jednak tajemnice, kt�re skrywa powinny zosta� zapomniane na wieki.
	AI_Output (self, other, "DIA_RATFORD_Search_07_03"); //Przynajmniej ja tak uwa�am. Jednak Cavalorn i magowie maj� odmienne zdanie.
	AI_Output (other, self, "DIA_RATFORD_Search_15_04"); //O czym m�wi ksi�ga?
	AI_Output (self, other, "DIA_RATFORD_Search_07_05"); //Zdradza spos�b na uwolnienie pot�nego demona...
	AI_Output (other, self, "DIA_RATFORD_Search_15_06"); //Co?! A wy chcecie si� nim pos�u�y� w walce z Gomezem? Jeste�cie idiotami. 
	AI_Output (self, other, "DIA_RATFORD_Search_07_07"); //Powiedzia�em to samo. Demon mo�e okaza� si�... nieprzewidywalny. Jak� mamy pewno��, �e nie zabije ka�dej �ywej istoty, kt�r� napotka?
	AI_Output (other, self, "DIA_RATFORD_Search_15_08"); //�adn� i magowie dobrze o tym wiedz�.
	AI_Output (self, other, "DIA_RATFORD_Search_07_09"); //Tak, ale Cavalorn chce zaryzykowa�. Poza tym demon ju� d�ugo by� uwi�ziony, b�dzie bardzo os�abiony i zanim odzyska pe�n� moc, minie sporo czasu.
	AI_Output (other, self, "DIA_RATFORD_Search_15_10"); //No dobra, a co ja mam zrobi�?
	AI_Output (self, other, "DIA_RATFORD_Search_07_11"); //Po tym jak pozna�e� imi� demona, magowie zdo�ali odczyta� fragmenty tekstu.
	AI_Output (self, other, "DIA_RATFORD_Search_07_12"); //Ci, kt�rzy zdo�ali uwi�zi� demona, rozbili na siedem cz�ci kamie�, w kt�rym zakl�li jestestwo istoty.
	AI_Output (self, other, "DIA_RATFORD_Search_07_13"); //Wszystkie kawa�ki s� dobrze ukryte tutaj, w Dolinie G�rniczej. 
	AI_Output (self, other, "DIA_RATFORD_Search_07_14"); //Magowie dotarli te� do fragmentu m�wi�cego o mapie. Dlatego po�wi�cili ca�� noc na okre�lenia miejsc ukrycia kamieni.
	AI_Output (other, self, "DIA_RATFORD_Search_15_15"); //Dlaczego akurat noc?
	AI_Output (self, other, "DIA_RATFORD_Search_07_16"); //Ka�da z pierwszy liter ka�dego z wers�w daje te� pocz�tek nazwom gwiazd. Ci, kt�rzy uwi�zili demona wykorzystali map� nieba do ukrycia kawa�k�w kamienia.
	AI_Output (other, self, "DIA_RATFORD_Search_15_17"); //Nie rozumiem...
	AI_Output (self, other, "DIA_RATFORD_Search_07_18"); //Odbicie nocnego nieba jest map�, a sze�� najwa�niejszych gwiazd wskazuje miejsca ukrycia kawa�k�w Katrakanatu.
	AI_Output (self, other, "DIA_RATFORD_Search_07_19"); //To jest ta mapa, s� na niej zaznaczone wszystkie miejsca, gdzie zosta�y ukryte kawa�ki kamienia. Oczywi�cie o ile magowie si� nie pomylili...
	
   CreateInvItems (self, KatarMap, 1);
	B_GiveInvItems (self, other, KatarMap, 1);
	
   AI_Output (self, other, "DIA_RATFORD_Search_07_20"); //Owocnych poszukiwa� przyjacielu, czeka Ci� d�uga droga.
	AI_Output (other, self, "DIA_RATFORD_Search_15_21"); //Jak zawsze to ja musz� odwala� brudn� robot�...

	B_LogEntry(CH2_RBL_MysteryBook, "Musz� odnale�� pozosta�ych pi�� cz�ci Katrakanat - kamienia demon�w. To co mo�na przywo�a� po z�o�eniu kamienia mo�e pom�c nam w walce z Gomezem... albo nas zabi�. Nie mam jednak wyboru, to nie na mnie spadnie krew niewinnych, je�eli co� p�jdzie nie tak jak powinno.");
	B_LogEntry(CH2_RBL_Hunter, "Tajemniczym �r�d�em z ruin by�a ksi�ga, w kt�rej zapisano miejsca ukrycia pi�ciu cz�ci kamienia Katrakanat.");
	
	Wld_InsertItem(katrakanat_piece2,"FP_KATRAKANAT_1_SPAWN");
	Wld_InsertItem(katrakanat_piece3,"FP_KATRAKANAT_2_SPAWN");
	Wld_InsertItem(katrakanat_piece4,"FP_KATRAKANAT_3_SPAWN");
	Wld_InsertItem(katrakanat_piece5,"FP_KATRAKANAT_4_SPAWN");
	Wld_InsertItem(katrakanat_piece6,"FP_KATRAKANAT_5_SPAWN");
};

// **************************************************

var int Katrakanat_collected;
INSTANCE DIA_RATFORD_SearchEnd (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 24;
	condition		= DIA_RATFORD_SearchEnd_Condition;
	information		= DIA_RATFORD_SearchEnd_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam wszystkie cz�ci Katrakanat."; 
};

FUNC INT DIA_RATFORD_SearchEnd_Condition()
{
	//todo
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Search))&&(!Katrakanat_collected)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_SearchEnd_Info()
{
	AI_Output (other, self, "DIA_RATFORD_SearchEnd_15_21"); //Mam wszystkie cz�ci Katrakanat.
	AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_02"); //Naprawd�?

	if ((NPC_HasItems(other,Katrakanat_piece2)>=1)&&(NPC_HasItems(other,Katrakanat_piece3)>=1)&&(NPC_HasItems(other,Katrakanat_piece4)>=1)&&(NPC_HasItems(other,Katrakanat_piece5)>=1)&&(NPC_HasItems(other,Katrakanat_piece6)>=1))
	{
		Katrakanat_collected=TRUE;
		B_GiveXP (1200);
      
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_03"); //A niech mnie, rzeczywi�cie zdoby�e� sze�� cz�ci.
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_04"); //Magowie dostan� na ten widok �linotoku.
		
		//Sher, popraw dialog jak cos:
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_05"); //Powiedz Miltenowi, �e zdoby�e� Katrakanat, ja przechowam fragmenty do twojego powrotu.
		
      B_GiveInvItems			(other,self,katrakanat_piece2,1);
		B_GiveInvItems			(other,self,katrakanat_piece3,1);
		B_GiveInvItems			(other,self,katrakanat_piece4,1);
		B_GiveInvItems			(other,self,katrakanat_piece5,1);
		B_GiveInvItems			(other,self,katrakanat_piece6,1);
		B_GiveInvItems			(other,self,katrakanat_piece,1);
		
		NPC_RemoveInvItem			(self,katrakanat_piece2);
		NPC_RemoveInvItem			(self,katrakanat_piece3);
		NPC_RemoveInvItem			(self,katrakanat_piece4);
		NPC_RemoveInvItem			(self,katrakanat_piece5);
		NPC_RemoveInvItem			(self,katrakanat_piece6);
		NPC_RemoveInvItem			(self,katrakanat_piece);
		
		//Sher, popraw wpis jak cos:
		B_LogEntry(CH2_RBL_MysteryBook, "Odda�em Ratfordowi sze�� cz�ci Katrakanat, kaza� mi poinformowa� o tym Miltena.");
		//AI_Output (other, self, "DIA_RATFORD_SearchEnd_15_06"); //Nied�ugo wr�c�, poczekaj tu na mnie.

		/*******************************
	Ork tu by si� kamerka przyda�a, �eby dick widzia� jak Ratford idzie do mag�w, ale niech nie pokazuje jak ju� dochodzi i wraca, �eby by�o z�udzenie, �e tam z nimi gada naprawd�, poka� ob�z z lotu ptaka, co tam chcesz
	*******************************/
		//Npc_ExchangeRoutine(self,"mags");
	}
	else if (NPC_HasItems(other,Katrakanat_piece)>=1)&&((NPC_HasItems(other,Katrakanat_piece)>=1)||(NPC_HasItems(other,Katrakanat_piece2)>=1)||(NPC_HasItems(other,Katrakanat_piece3)>=1)||(NPC_HasItems(other,Katrakanat_piece4)>=1)||(NPC_HasItems(other,Katrakanat_piece5)>=1)||(NPC_HasItems(other,Katrakanat_piece6)>=1))
	{
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_07"); //Rzeczywi�cie masz przy sobie kawa�ek Katrakanat, ale poczekam a� odzyskasz wszystko.
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_08"); //Zachowaj to co masz i wr��, jak znajdziesz wszystkie.
	}
	else//no katrakanat pieces
	{
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_09"); //Nie denerwuj mnie, nawet jeszcze nie rozpocz��e� poszukiwa�!
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_10"); //Wr�� z kawa�kami Katrakanat.	
	};
   
   B_StopProcessInfos(self);
};

// **************************************************
INSTANCE DIA_RATFORD_SearchAgain (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 25;
	condition		= DIA_RATFORD_SearchAgain_Condition;
	information		= DIA_RATFORD_SearchAgain_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_RATFORD_SearchAgain_Condition()
{
	if (Katrakanat_collected==3)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_SearchAgain_Info()
{
	//That's crappy dialog has been created by orc /modified

	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_01"); //Jak posz�a rozmowa?
	AI_Output (other, self, "DIA_RATFORD_SearchAgain_15_02"); //Nie mogli uwierzy�, �e zdoby�em Katrakanat. Milten wspomina� co� o odprawieniu rytua�u.
	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_03"); //W takim razie nie b�d� Ci� zatrzymywa�.
	AI_Output (other, self, "DIA_RATFORD_SearchAgain_15_04"); //Bardzo zabawne. Musz� jeszcze znale�� wod� �wi�con� i pos��ek Innosa.
	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_05"); //Dasz sobie rad�.
	AI_Output (other, self, "DIA_RATFORD_SearchAgain_15_10"); //Gdzie ja znajd� w Kolonii Karnej wod� �wiecon� i pos��ek Innosa?
	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_11"); //Powiem szczerze, �e nie mam zielonego poj�cia. Kiedy� na wyspie przebywali paladyni i magowie, mo�e znajdziesz pos��ek w jakim� grobowcu.
	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_12"); //Najlepiej pogadaj z Quentinem, zna �wietnie wysp�, mo�e b�dzie wiedzia� co� wi�cej.
	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_13"); //Co do wody �wi�conej, to kiedy� Piwosz odgra�a� si�, �e zrobi� samogon po�wi�cony samemu Innosowi.
	AI_Output (other, self, "DIA_RATFORD_SearchAgain_15_14"); //Dobra, rozejrz� si� za pos��kiem i samogonem. Ale to ju� ostatni raz kiedy latam po Kolonii jak jaki� ��todzi�b.

	/*******************************
	Ork pos��ek mo�e gdzie� z jakim� skarbem si� da razem, czyli dick musi troch� pokopa�, odpocznie sobie od fabu�y g��wnej - da�em ju� takie zadanie od jacka
	*******************************/

	B_LogEntry(CH2_RBL_MysteryBook, "Quentin mo�e wiedzie�, gdzie znale�� pos��ek, powinieniem si� do niego uda�.");
	B_LogEntry(CH2_RBL_MysteryBook, "Piwosz by� kiedy� w posiadaniu wody �wi�conej.");
};

// **************************************************

INSTANCE DIA_RATFORD_SearchAgain2 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 26;
	condition		= DIA_RATFORD_SearchAgain2_Condition;
	information		= DIA_RATFORD_SearchAgain2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz�em pos��ek i �wi�con�... w�d�."; 
};

FUNC INT DIA_RATFORD_SearchAgain2_Condition()
{
	//TODO /TEMP
	if (Npc_KnowsInfo (hero, DIA_RATFORD_SearchAgain))&& (NPC_HasItems(other,innos_statue)>=1)&& (NPC_HasItems(other,ItFo_Innos_Booz)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_SearchAgain2_Info()
{
	B_GiveXP (600);
	AI_Output (other, self, "DIA_RATFORD_SearchAgain2_15_01"); //Znalaz�em pos��ek i �wi�con�... w�d�.
	AI_Output (self, other, "DIA_RATFORD_SearchAgain2_07_02"); //�wietna robota! Chwila, powiedzia�e� w�d�?
	AI_Output (other, self, "DIA_RATFORD_SearchAgain2_15_03"); //Piwosz zrobi� z wody �wi�conej samogon.
	AI_Output (self, other, "DIA_RATFORD_SearchAgain2_07_04"); //Cholerny idiota, ale to powinno nam wystarczy�.
	AI_Output (self, other, "DIA_RATFORD_SearchAgain2_07_05"); //Teraz musisz wr�ci� do �wi�tyni, tam gdzie znalaz�e� ksi�g� i odprawi� rytua� na o�tarzu po�wi�conym Innosowi.
	AI_Output (other, self, "DIA_RATFORD_SearchAgain2_15_06"); //Co dok�adnie musz� z�o�y� na o�tarzu?
	AI_Output (self, other, "DIA_RATFORD_SearchAgain2_07_07"); //Ustaw na nim pos��ek, po�� dooko�a statuy cz�ci Katranakat, oblej wszystko samogonem i odm�w modlitw� ku chwale Innosa.
	
   B_LogEntry(CH2_RBL_MysteryBook, "Mam ju� pos��ek i �wi�cony bimber Innosa. Musz� przeprowadzi� rytua� na o�tarzu w �wi�tyni Innosa. �eby to zrobi�, musz� ustawi� na o�tarzu pos��ek, dooko�a niego po�o�� wszystkie cz�ci Katrakanat, oblej� o�tarz wod� �wi�con� i zm�wi� modlitw� ku chwale Innosa. A jak b�d� mia� szcz�cie, to mo�e nawet to prze�yj�....");
	
	AI_Output (other, self, "DIA_RATFORD_RytualDo_15_05"); //Cholera, dlaczego kt�ry� z mag�w tego nie zrobi?
	AI_Output (self, other, "DIA_RATFORD_RytualDo_07_06"); //Bo to zbyt... ryzykowne. Nie do ko�ca wiadomo, jak mo�e sko�czy� si� boska interwencja. Mo�e zosta� z Ciebie kupka popio�u, albo tylko postradasz zmys�y...
	AI_Output (other, self, "DIA_RATFORD_RytualDo_15_07"); //Rozumiem, mnie mo�na po�wi�ci�, magowie s� zbyt cenni.
	AI_Output (self, other, "DIA_RATFORD_RytualDo_07_08"); //Nie to chcia�em powiedzie�.
	AI_Output (other, self, "DIA_RATFORD_RytualDo_15_09"); //Dobra, miejmy to ju� za sob�.	
   Wld_InsertNpc(Zombie_Katrakanat,"FP_ROAM_OW_SNAPPER_WOOD05_02");	
	B_StopProcessInfos(self);

	//Npc_ExchangeRoutine(self,"mags");

	B_GiveInvItems(self,other,katrakanat_piece2,1);
	B_GiveInvItems(self,other,katrakanat_piece3,1);
	B_GiveInvItems(self,other,katrakanat_piece4,1);
	B_GiveInvItems(self,other,katrakanat_piece5,1);
	B_GiveInvItems(self,other,katrakanat_piece6,1);
	B_GiveInvItems(self,other,katrakanat_piece,1); 
};

// **************************************************

INSTANCE DIA_RATFORD_RytualEnd (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 28;
	condition		= DIA_RATFORD_RytualEnd_Condition;
	information		= DIA_RATFORD_RytualEnd_Info;
	permanent		= 0;
	important		= 0;
	description		= "To znowu ja."; 
};

FUNC INT DIA_RATFORD_RytualEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_SearchAgain2))&& (NPC_HasItems(other,Katrakanat)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_RytualEnd_Info()
{
	B_GiveXP (400);
	AI_Output (other, self, "DIA_RATFORD_RytualEnd_15_01"); //To znowu ja.
	AI_Output (self, other, "DIA_RATFORD_RytualEnd_07_02"); //Widz�, i to w jednym kawa�ku. Uda�o si�?
	AI_Output (other, self, "DIA_RATFORD_RytualEnd_15_03"); //Tak, kamienie scali�y si�, mam Katrakanat.
	AI_Output (self, other, "DIA_RATFORD_RytualEnd_07_04"); //Wiedzia�em, �e zdo�asz tego dokona�! Daj mi to cholerstwo i wr�� o p�nocy.
   
	B_GiveInvItems (other, self, Katrakanat, 1);
	Npc_RemoveInvItems(self,Katrakanat,1);
   
	AI_Output (self, other, "DIA_RATFORD_RytualEnd_07_05"); //Wtedy magowie odprawi� te swoje gus�a i w ko�cu przekonamy si�, co kryje kamie�.
	AI_Output (other, self, "DIA_RATFORD_RytualEnd_15_06"); //Postaram si� nie zapomnie�.
	B_LogEntry(CH2_RBL_MysteryBook, "Odda�em Katrakanat Ratfordowi. Mam wr�ci� o p�nocy, aby uczestniczy� w ostatecznej pr�bie wyzwolenia pot�gi Katrakanat. W�tpi�, �eby to by� dobry pomys�, ale chyba warto to zobaczy� na w�asne oczy...");
	
	B_StopProcessInfos(self);
	/*****************************
	Ork dor�b im te rutyny niech si� ustawi� od 00 do 02 w jakim� miejscu odpowiednim
	****************************/

	Npc_ExchangeRoutine(leren,"rytual");
	Npc_ExchangeRoutine(cavalorn,"rytual");
	Npc_ExchangeRoutine(self,"rytual");
};

// **************************************************

INSTANCE DIA_RATFORD_RytualFinish (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 29;
	condition		= DIA_RATFORD_RytualFinish_Condition;
	information		= DIA_RATFORD_RytualFinish_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_RATFORD_RytualFinish_Condition()
{
	//todo: remove if
	if (Npc_KnowsInfo (hero, DIA_RATFORD_RytualEnd))&&(Wld_IsTime (23,50,04,30))&&(Npc_GetDistToWP(self,"WP_KAT_DEMON")<1500)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_RytualFinish_Info()
{
	AI_Output (self, other, "DIA_RATFORD_RytualDo_07_01"); //Przyby�e� w sam� por� - zacz�o si�!
	AI_Output (other, self, "DIA_RATFORD_RytualDo_15_02"); //Mam nadziej�, �e nie b�d� tego �a�owa�...
	B_StopProcessInfos(self);
	Ritual_Katrakanat_demon_counter=0;
	Katrakanat_collected=4;	
	Wld_SendTrigger("RITUAL_KATRAKANAT_SCRIPT");
	/****************************
	Ork nie mam zielonego poj�cia jak to chcesz zrobi� wi�c nie b�de nic kombinowa�.
	Ale mo�na by to zrobi� podobnie jak rytua� z okiem innosa w G2 z tym, �e lepiej ;) A to moja propozycja:
	- mag zaczyna rytua�, animacja practice + jakie� obszarowe pfxy
	- nagle eksplozja, jaki� pfx, mag pada na ziemi� jak walni�ty przez kamiennego golema
	- pojawia si� paskudny demon a pod spodem jego tekst [instancje demona sam zr�b]
	D: G�upcy, uwolnili�cie wi�cej ni� ten brudny �wiat mo�e zdier�y�!
	D: Unurzam t� krain� we krwi i ogniu a potem rozszarpi� wszystkie nie�miertelne dusze...
	ustaw zmienn� globaln� demon_appear = TRUE; bo b�dzie potrzebna w dialogu

	- Cavalorn leci za demonem - to jeszcze ty zr�b.
	- [to ju� ja zrobi�em] Dick w ko�cu jest odblokowany, leci z Ratfordem za Cavalornem, znajduj� go rannego, ale przytomnego, m�wi, �e Demon uciek�, ble, ble...

	****************************/

	//Rytual_Katrakanat ();
};

// **************************************************

INSTANCE DIA_RATFORD_Demon (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 30;
	condition		= DIA_RATFORD_Demon_Condition;
	information		= DIA_RATFORD_Demon_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_RATFORD_Demon_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_RytualFinish))&&(Ritual_Katrakanat_demon_counter == 11)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Demon_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_RATFORD_Demon_07_01"); //Ten skurwiel zabije Cavalorna! Biegnij za mn�!
	Party_AddNpc(self);
	B_LogEntry(CH2_RBL_MysteryBook, "Demon si� uwolni�, Leren le�y nieprzytomny, a Cavalorn pobieg� za besti�. Musimy mu pom�c...");
	B_StopProcessInfos(self);

	/*****************
	Dodaj mu rutyn� pod��ania
	*****************/
	Npc_ExchangeRoutine(self,"rytualguide");
};

// **************************************************

INSTANCE DIA_RATFORD_DemonGo (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 5;
	condition		= DIA_RATFORD_DemonGo_Condition;
	information		= DIA_RATFORD_DemonGo_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_RATFORD_DemonGo_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Demon))&&(Npc_GetDistToWP (self,"LOCATION_23_01") < 900 )
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_DemonGo_Info()
{
	B_FullStop (hero);
	B_FullStop (self);
	AI_GotoWP(other,"demon1");
	AI_GotoWP(self,"demon2");
	AI_Output (self, other, "DIA_RATFORD_DemonGo_07_01"); //Sp�nili�my si�...
	AI_Output (other, self, "DIA_RATFORD_DemonGo_15_02"); //Dobrze, �e Cavalorn �yje.
	AI_Output (self, other, "DIA_RATFORD_DemonGo_07_03"); //Pogadaj z nim, ja sprawdz� co z Lerenem.
	Party_RemoveNpc(self);
	B_LogEntry(CH2_RBL_MysteryBook, "Demona nigdzie nie wida� - musz� porozmawia� z Cavalornem.");
   Log_SetTopicStatus(CH2_RBL_MysteryBook, LOG_SUCCESS);
	B_StopProcessInfos(self);

	/*****************
	Dodaj mu rutyn� pod��ania
	*****************/
	Npc_ExchangeRoutine(self,"rytualAfter");
	Npc_ExchangeRoutine(leren,"rytualAfter");
};

// **************************************************

INSTANCE DIA_RATFORD_ExterminatePatrols (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 31;
	condition		= DIA_RATFORD_ExterminatePatrols_Condition;
	information		= DIA_RATFORD_ExterminatePatrols_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak si� czuje mag?"; 
};

FUNC INT DIA_RATFORD_ExterminatePatrols_Condition()
{
	// rytual after - jak juz tam dojdzie, leren powinien byc na tym miejscu a wiec "juz sie zapytal maga jak sie czuje"// OW_PATH_02
	// not sure though require testing
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Demon)) //&& (Npc_GetDistToWP (self,"OW_PATH_02") < 900 )  
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_ExterminatePatrols_Info()
{
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_01"); //Jak si� czuje mag?
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_02"); //Leren? Wy�yje, magowie s� jak koty, zawsze spadaj� na cztery �apy.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_03"); //Cavalorn porozmawia z magami, trzeba odnale�� demona i sko�czy� to, co tak nieopatrznie rozpocz�li�my.
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_04"); //Ano trzeba, ale p�ki co mam dla Ciebie inn� rob�tk�.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_05"); //Znowu? Chcia�em odpocz��...
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_06"); //Odpoczniesz w grobie, przyjacielu.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_07"); //Bardzo zabawne. Dobra, m�w o co chodzi.
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_08"); //Kiedy ugania�e� si� za Katrakanatem, pojawi� si� kolejny problem.
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_09"); //Gomez po niepowodzeniu poprzedniego patrolu postanowi� wys�a� ich wi�cej.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_10"); //Ile?
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_11"); //Du�o wi�cej, mo�e nawet pi��.
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_12"); //Ale te patrole kontroluj� tylko obszar w pobli�u Starego Obozu.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_13"); //To niech sobie patroluj�. Co nam to przeszkadza?
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_14"); //Ano to, �e musimy oczy�ci� drog� do Starego Obozu.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_15"); //Po jak� choler� mam wtyka� kij w gniazdo szerszeni?
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_16"); //Mamy pewne plany co do inwigilacji Starego Obozu, dlatego musimy oczy�ci� drog� z patroli.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_17"); //Wiesz co, zmieni�em zdanie. Wol� nie wiedzie�, co knujecie. 
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_18"); //W porz�dku, 'porozmawiam' ze stra�nikami.
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_19"); //�wietnie. Przynie� mi jaki� dow�d, mog� by� miecze. Poza tym bro� zawsze si� przyda.
	
	CreateInvItem(leren,ItArRuneHeal);	
	Spell_Heal_Npc(leren);
	B_ExchangeRoutine(leren,"start");
	Npc_ExchangeRoutine(self,"start");

	/*************************************
	Ork trzeba zrobi� instancje tych patrolowc�w i wsadzi� ich do �wiata, ale ja nie wiem gdzie to nic nie robi� - my�l�, �e 5 patrloli po 2 stra�nik�w wystarczy

	*************************************/
	Log_CreateTopic(CH2_RBL_Patrols, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Patrols, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Patrols, "Ech, nigdy nie odpoczn�. Musz� pozby� si� patroli naoko�o Starego Obozu. Ratford za��da� mieczy stra�nik�w jako dowod�w.");

	Wld_InsertNpc(GRD_4070_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4071_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4072_Guard,"OC_ROUND_22");
	
	Wld_InsertNpc(GRD_4073_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4074_Guard,"OC_ROUND_22");
	
	Wld_InsertNpc(GRD_4075_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4076_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4077_Guard,"OC_ROUND_22");
	
	Wld_InsertNpc(GRD_4078_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4079_Guard,"OC_ROUND_22");		
};

// **************************************************
var int ratford_patrols_success;

INSTANCE DIA_RATFORD_Patrols (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 32;
	condition		= DIA_RATFORD_Patrols_Condition;
	information		= DIA_RATFORD_Patrols_Info;
	permanent		= 1;
	important		= 0;
	description		= "Pozby�em si� patroli."; 
};

FUNC INT DIA_RATFORD_Patrols_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_ExterminatePatrols))&&(NPC_HasItems(other,GRD_Prl_Swd)) && (!ratford_patrols_success)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Patrols_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Patrols_15_01"); //Pozby�em si� patroli.

	if (NPC_HasItems(other,GRD_Prl_Swd)>=10)
	{
		B_GiveXP (1500);
		ratford_patrols_success = true;
		AI_Output (self, other, "DIA_RATFORD_Patrols_07_02"); //�wietna robota, ci stra�nicy ju� nam nie zaszkodz�.
		AI_Output (self, other, "DIA_RATFORD_Patrols_07_03"); //Daj mi miecze i mo�esz troch� odetchn��. Zajmij si� w�asnymi sprawami.
		AI_Output (self, other, "DIA_RATFORD_Patrols_07_04"); //Wr�� do mnie, jak b�dziesz got�w na kolejne harce.
		
		B_GiveInvItems(other,self,GRD_Prl_Swd,10);
		Npc_RemoveInvItems(self,GRD_Prl_Swd,10);
		Log_SetTopicStatus(CH2_RBL_Patrols, LOG_SUCCESS);
		B_LogEntry(CH2_RBL_Patrols, "Pozby�em si� patroli. Ratford kaza� mi odpocz��, mam z nim pogada� jak nabior� si�.");
	}
	else
	{
		AI_Output (self, other, "DIA_RATFORD_Patrols_07_05"); //Przynie� mi wszystkie miecze.
	};
   
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_RATFORD_Raport (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 33;
	condition		= DIA_RATFORD_Raport_Condition;
	information		= DIA_RATFORD_Raport_Info;
	permanent		= 0;
	important		= 0;
	description		= "To o czym chcia�e� pogada�?"; 
};

FUNC INT DIA_RATFORD_Raport_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_LastThreeFinish1))||(ratford_patrols_success)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Raport_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Raport_15_01"); //To o czym chcia�e� pogada�?
	AI_Output (self, other, "DIA_RATFORD_Raport_07_02"); //Ju� od d�u�szego czasu czekam na raport z Nowego Obozu. Jak pewnie si� domy�lasz, pos�aniec, kt�rego wys�a�em, nie wr�ci�.
	AI_Output (other, self, "DIA_RATFORD_Raport_15_03"); //Mnie te� chcesz si� pozby� w ten sam spos�b?
	AI_Output (self, other, "DIA_RATFORD_Raport_07_04"); //Wprost przeciwnie. Ju� nie raz udowodni�e�, �e radzisz sobie w ka�dej sytuacji.
	AI_Output (self, other, "DIA_RATFORD_Raport_07_05"); //Ruszaj do Nowego Obozu i rozejrzyj si�, mo�e co� Ci wpadnie w oko. Jak wr�cisz, zdasz mi raport.
	AI_Output (other, self, "DIA_RATFORD_Raport_15_06"); //Nic za darmo Ratford. Nie b�d� nara�a� karku za dobre s�owo. 
	AI_Output (self, other, "DIA_RATFORD_Raport_07_07"); //Sam sobie wybierzesz nagrod�, jak wr�cisz. 
	AI_Output (other, self, "DIA_RATFORD_Raport_15_08"); //Niech b�dzie. Bywaj.
	
   Log_CreateTopic(CH2_RBL_Raport, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Raport, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Raport, "Musz� p�j�� do Nowego Obozu i rozejrze� si� w sytuacji. Poprzedni pos�aniec nie wr�ci�, wi�c musz� zachowa� ostro�no��.");
	B_StopProcessInfos(self);
	//spawn gorn
	Wld_InsertNpc(PC_Fighter,"OW_PATH_064");		 //przed bram�!
};

// **************************************************
// **************************************************

INSTANCE DIA_RATFORD_RaportDone (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 34;
	condition		= DIA_RATFORD_RaportDone_Condition;
	information		= DIA_RATFORD_RaportDone_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nowy Ob�z upad�!"; 
};

FUNC INT DIA_RATFORD_RaportDone_Condition()
{
	if (Kapitel==3)&&(Npc_KnowsInfo (hero, DIA_Gorn_First))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_RaportDone_Info()
{
	B_GiveXP (500);
	AI_Output (other, self, "DIA_RATFORD_RaportDone_15_01"); //Nowy Ob�z upad�!
	AI_Output (self, other, "DIA_RATFORD_RaportDone_07_02"); //�e co?!
	AI_Output (other, self, "DIA_RATFORD_RaportDone_15_03"); //Stra�nicy zdobyli Nowy Ob�z. Zaatakowali od frontu dla odwr�cenia uwagi i jednocze�nie uderzyli z ty�u. Chyba znale�li w g�rach ukryte przej�cie.
	AI_Output (self, other, "DIA_RATFORD_RaportDone_07_04"); //Na ow�osione jaja Beliara! No to mamy spory problem.
	AI_Output (other, self, "DIA_RATFORD_RaportDone_15_05"); //A co z moj� nagrod�?
	AI_Output (self, other, "DIA_RATFORD_RaportDone_07_06"); //We� ten pier�cie� i powiedz Cavalornowi, co si� sta�o.
	CreateInvItems (self, Rat_ring,1); 	
	B_GiveInvItems (self, other, Rat_ring, 1);	
	AI_Output (self, other, "DIA_RATFORD_RaportDone_07_07"); //Nie mog� uwierzy�. Nowy Ob�z upad�...

	Log_SetTopicStatus(CH2_RBL_Raport, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Raport, "Powiedzia�em Ratfordowi, �e Nowy Ob�z upad�. Rebeliant nie m�g� w to uwierzy�. Musz� teraz porozmawia� z Cavalornem.");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_RATFORD_OldCampSpy (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 35;
	condition		= DIA_RATFORD_OldCampSpy_Condition;
	information		= DIA_RATFORD_OldCampSpy_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RATFORD_OldCampSpy_Condition()
{
	if ((Npc_KnowsInfo (hero, DIA_AIDAN_Eqquipment))&&(Npc_KnowsInfo (hero, DIA_Fox_Eqquipment)))||(Npc_KnowsInfo (hero, DIA_Leren_Eqqupiment))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OldCampSpy_Info()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_Eqqupiment))//mag
	{
		AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_01"); //S�ysza�em, �e wybra�e� drog� magii. Przyda si� nam kto� rozs�dny w�r�d tych facet�w w kieckach.
		AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_02"); //Mam nadziej�, �e nie b�d� tego �a�owa�.
	}
	else if (Npc_KnowsInfo (hero, DIA_Fox_Eqquipment))//hunter
	{
		AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_03"); //Zosta�e� jednym z �owc�w - �wietny wyb�r! Na pewno nie b�dziesz narzeka� na nud�.
		AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_04"); //W to nie w�tpi�.
	};
   
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_05"); //Cavalorn m�wi�, �ebym si� do Ciebie zg�osi�. O co chodzi?
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_06"); //Tym razem to powa�na sprawa. B�dziesz musia� wykaza� si� subtelno�ci� i sprytem.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_07"); //Chyba o czym� zapomnia�em. Tak! Zostawi�em pieczyste nad ogniskiem, znajd� kogo� innego do tej roboty. 
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_08"); //Nie ma nikogo innego. Musimy zinfiltrowa� Stary Ob�z.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_09"); //To mo�e od razu rzuc� si� na miecz, przynajmniej oszcz�dz� trudu stra�nikom Gomeza.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_10"); //To nie b�dzie potrzebne, wi�cej zdzia�asz �ywy. Mamy w obozie swojego cz�owieka. Nazywa si� Kelvin.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_11"); //Odnajdziesz go, a on wtajemniczy Ci� w nasze plany. Im bardziej zaszkodzimy Gomezowi i im wi�kszy chaos zasiejemy w szeregach wroga, tym lepiej dla nas.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_12"); //A jak niby mam si� dosta� do Starego Obozu?
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_13"); //Pogadaj z Leafem, ta szelma zna spos�b na to jak tam wej��. Przynajmniej tak s�ysza�em od ch�opak�w. Nie mam innego pomys�u.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_14"); //To naprawd� buduj�ce, podnios�e� mnie na duchu. 
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_15"); //No dobra, spr�buj�. A ten Kelvin sk�d b�dzie wiedzia�, �e jestem jednym z Was?
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_16"); //O to si� nie b�j. Przed atakiem na Star� Kopalni� wys�a�em mu wiadomo��, wie kogo ma si� spodziewa�.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_17"); //Sprytne, ju� wtedy wiedzia�e�, �e si� zgodz�. Cholera, mam za mi�kkie serce.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_18"); //Ale masz przy tym tward� dup�, a to rzadko spotykana kombinacja. Poradzisz sobie Rick, nie znam nikogo innego, kto tak uparcie czepi� si� �ycia.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_19"); //Ech, a mog�em zosta� ogrodnikiem, jak chcia�a mamusia...
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_20"); //Aha i za�atw sobie wdzianko stra�nika albo cienia. W pobli�u Starego Obozu kr�ci si� nasz cz�owiek, nazywa si� Urt. Mo�e za�atwi Ci jakie� �achy.
	Wld_InsertNpc(RBL_4062_Urt,"OC1");

	Log_CreateTopic(CH3_RBL_OldCampSpy, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_OldCampSpy, LOG_RUNNING);
	B_LogEntry(CH3_RBL_OldCampSpy, "No to wpad�em w spore g�wno. Zgodzi�em si�, �eby znale�� cz�owieka rebeliant�w w Starym Obozie. Kole� ma na imi� Kelvin i podobno wie kogo si� spodziewa�. Musz� pogada� z Leafem, kt�ry niby zna spos�b na to, jak wej�� do Starego Obozu �ywcem. Musz� te� za�atwi� sobie przebranie stra�nika lub cienia, mo�e mi w tym pom�c Urt - znajd� go gdzie� w pobli�u Starego Obozu.");
};

var int DIA_RATFORD_OldCampSpy1_deal;

// **************************************************

INSTANCE DIA_RATFORD_OldCampSpy1 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 36;
	condition		= DIA_RATFORD_OldCampSpy1_Condition;
	information		= DIA_RATFORD_OldCampSpy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam wie�ci ze Starego Obozu."; 
};

FUNC INT DIA_RATFORD_OldCampSpy1_Condition()
{
	/*****************
	Zmie� klucz jak ten jest z�y, poza tym drzwi s� ju� otwarte wi�c klucz i tak to �ciema
	******************/
	if (Npc_KnowsInfo (hero,DIA_Urt_Kelvin1))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OldCampSpy1_Info()
{
	//Crappy dialog modified by orc
	B_GiveXP(1000);
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_15_01"); //Mam wie�ci ze Starego Obozu.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy1_07_02"); //M�w.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_15_03"); //Przekona�em kopaczy do walki po stronie rebelii. Pzyprowadzi�em Diego do Starego Obozu, Cienie te� przy��cz� si� do naszej sprawy.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_15_04"); //Razem z Urtem zorganizuj� ludzi pod nosem Gomeza.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_15_05"); //Niestety Kelvin nie �yje. Znalaz�em te notatki przy jego ciele.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy1_07_06"); //Szkoda Kelvina... Gomez zap�aci za �mier� ka�dego z moich ludzi po dwakro�!
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_15_07"); //Co teraz?
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy1_07_18"); //Przygotujemy si� do ataku. Odpocznij, jutro mo�e nas czeka� niez�a jatka.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy1_07_19"); //Aha, we� t� rud�. Przyda Ci si�. Wi�cej niestety nie mam.
   
   CreateInvItems (self, ItMiNugget, 400);
	B_GiveInvItems (self, other, ItMiNugget, 400);
   
   AI_Output (self, other, "DIA_RATFORD_OldCampSpy1_12_17"); //Oraz we� t� run�. Dzi�ki niej, b�dziesz m�g� si� szybko i bezpiecznie teleportowa� do obozu.
   Create_and_give(ItArRuneTeleportToHuntersCamp, 1);
   AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_12_18"); //Dzi�ki, przynajmniej nie b�d� musia� tak wiele lata� po kolonii. 
   
	B_GiveInvItems (other,self,kevin_diary,1);
	DIA_RATFORD_OldCampSpy1_deal = B_SetDayTolerance()+1;
	/*****************
	Zmie� klucz jak ten jest z�y, poza tym drzwi s� ju� otwarte wi�c klucz i tak to �ciema
	******************/

	B_GiveInvItems (other, self, ItKe_Secret_CM_Enter,1);
	Npc_RemoveInvItems(self,ItKe_Secret_CM_Enter,1);
	Log_SetTopicStatus(CH3_RBL_OldCampSpy, LOG_SUCCESS);
	B_LogEntry(CH3_RBL_OldCampSpy, "Zda�em Ratfordowi raport. Mam czeka� do jutra, wtedy dowiem si� czego� wi�cej o zamierzeniach rebeliant�w. Chyba zas�u�y�em na odpoczynek...");
	B_StopProcessInfos(self);
   
   Wld_SendUnTrigger("EVT_OC_INNERMAINGATE");
};

// **************************************************

INSTANCE DIA_RATFORD_Contact (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 37;
	condition		= DIA_RATFORD_Contact_Condition;
	information		= DIA_RATFORD_Contact_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RATFORD_Contact_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OldCampSpy1))&&(DIA_RATFORD_OldCampSpy1_deal <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Contact_Info()
{
	AI_Output (self, other, "DIA_RATFORD_Contact_07_01"); //Dobrze, �e jeste�, mamy ma�y problem.
	AI_Output (other, self, "DIA_RATFORD_Contact_15_02"); //Czyli wszystko w normie. Co si� sta�o?
	AI_Output (self, other, "DIA_RATFORD_Contact_07_03"); //By� u mnie Urt, sytuacja si� troch� skomplikowa�a. Musimy wstrzyma� si� z atakiem na Stary Ob�z.
	AI_Output (other, self, "DIA_RATFORD_Contact_15_04"); //To co zrobimy?
	AI_Output (self, other, "DIA_RATFORD_Contact_07_05"); //Urt powiedzia� tylko, �e zorganizowanie Cieni i Kopaczy zajmie wi�cej czasu. Czeka� na wie�ci od Balama dotycz�ce posuni�� magnat�w.
	AI_Output (other, self, "DIA_RATFORD_Contact_15_06"); //Ciekawe co to za nowiny.
	AI_Output (self, other, "DIA_RATFORD_Contact_07_07"); //Dowiesz si� tego jako pierwszy. Urt poprosi�, �eby� to w�a�nie Ty uda� si� na spotkanie z jego wys�annikiem. Musia�e� wywrze� na nim spore wra�enie, bo bardzo na to nalega�.
	AI_Output (other, self, "DIA_RATFORD_Contact_15_08"); //Czuj� si� zaszczycony. No dobra, gdzie i kiedy ma czeka� na mnie ten wys�annik?
	AI_Output (self, other, "DIA_RATFORD_Contact_07_09"); //Wiedzia�em, �e si� zgodzisz! Urt powiedzia�, �eby� poszed� na Plac Wymian. Naszego cz�owieka znajdziesz po drodze, a rozpoznasz go po pancerzu stra�nika.
	AI_Output (self, other, "DIA_RATFORD_Contact_07_10"); //To on ma przekaza� wie�ci od Balama.
	AI_Output (other, self, "DIA_RATFORD_Contact_15_11"); //W porz�dku, nie tra�my wi�cej czasu.

	Wld_InsertNpc(RBL_4064_Info,"OC1");
   
   Rick_meets_informant = false;

	Log_CreateTopic(CH3_RBL_OldCampInfo, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_OldCampInfo, LOG_RUNNING);
	B_LogEntry(CH3_RBL_OldCampInfo, "Mam spotka� si� z wys�annikiem Urta w pobli�u Placu Wymian. Nie wiem, co to za rewelacje ma mi przekaza�, ale Urt bardzo nalega�, �ebym to w�a�nie ja spotka� si� z informatorem. Atak na Stary Ob�z zosta� na razie odwo�any, zorganizowanie cieni i kopaczy zajmie Urtowi i Diego wi�cej czasu, ni� przypuszczali.");
};

//Spotkanie szef�w rebelii - narada + magowie, po tym info o pomocy dla niekt�rych rbl�w i miecz runiczny.

// **************************************************

INSTANCE DIA_RATFORD_OCA (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 38;
	condition		= DIA_RATFORD_OCA_Condition;
	information		= DIA_RATFORD_OCA_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czeka nas walka."; 
};

FUNC INT DIA_RATFORD_OCA_Condition()
{
	if ((Npc_KnowsInfo (hero, DIA_RATFORD_Contact) && (Rick_meets_informant)) || (Npc_KnowsInfo (hero, DIA_NoName_HiAgain)))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OCA_Info()
{
	AI_Output (other, self, "DIA_RATFORD_OCA_15_01"); //Czeka nas walka.
	AI_Output (self, other, "DIA_RATFORD_OCA_07_02"); //Czego si� dowiedzia�e�?
	AI_Output (other, self, "DIA_RATFORD_OCA_15_03"); //Informator Urta powiedzia�, �e stra�nicy szykuj� si� do ataku na nasz ob�z.
	AI_Output (self, other, "DIA_RATFORD_OCA_07_04"); //M�wi� kiedy nast�pi atak?
	AI_Output (other, self, "DIA_RATFORD_OCA_15_05"); //Nie zd��y� powiedzie� nic wi�cej. Zaskoczyli nas stra�nicy, rzuci� si� na nich, �eby da� mi czas na ucieczk�.
	AI_Output (self, other, "DIA_RATFORD_OCA_07_06"); //Kurwa ma�! Musimy natychmiast dzia�a�. Gomez wytr�ci� nam atut zaskoczenia.
	AI_Output (self, other, "DIA_RATFORD_OCA_07_07"); //Spotkamy si� u Cavalorna. Przyjd� tam, jak najszybciej!
	B_LogEntry(CH3_RBL_OldCampAttack, "Ratford musi naradzi� si� z Cavalornem. Spotkanie odb�dzie si� w chacie Cavalorna, mam si� tam, jak najszybciej stawi�.");
	Npc_ExchangeRoutine	(self, "MEETING");
	B_ExchangeRoutine	(cavalorn, "MEETING");
	B_ExchangeRoutine	(milten, "MEETING");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_RATFORD_MEETING (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 39;
	condition		= DIA_RATFORD_MEETING_Condition;
	information		= DIA_RATFORD_MEETING_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RATFORD_MEETING_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OCA))&&(Npc_GetDistToWP(self,"OW_SAWHUT_SLEEP_01") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_MEETING_Info()
{
	var C_NPC cav; cav = Hlp_GetNpc(HUN_336_Cavalorn);

	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_RATFORD_MEETING_07_01"); //W ko�cu przyszed�e�.
	AI_Output (other, self, "DIA_RATFORD_MEETING_15_02"); //Co mam robi�?
	AI_Output (self, other, "DIA_RATFORD_MEETING_07_03"); //Om�wimy nasz� taktyk�. Narada nie potrwa d�ugo. Pracy jest du�o, a czasu jak na lekarstwo.
	AI_TurnToNpc(self, cav);
	AI_TurnToNpc(hero,cav);
	AI_Output (self, other, "DIA_RATFORD_MEETING_07_04"); //Czeka nas walka. Stary Ob�z szykuje si� do ataku. Czasu na przygotowania mamy niewiele, mo�liwe, �e zaledwie kilka dni.
	AI_Output (self, other, "DIA_RATFORD_MEETING_07_05"); //Musimy zgotowa� stra�nikom godne przyj�cie. Jakie� propozycje?
	B_StopProcessInfos(self);
};

// **************************************************
INSTANCE DIA_RATFORD_MEETING_talking (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 40;
	condition		= DIA_RATFORD_MEETING_talking_Condition;
	information		= DIA_RATFORD_MEETING_talking_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RATFORD_MEETING_talking_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Meeting))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

func void DIA_RATFORD_MEETING_talking_Info()
{
   AI_Output (self, other, "DIA_Ratford_Meeting_07_03"); //Mo�esz na mnie liczy�.
   
   B_StopProcessInfos(self);
};

INSTANCE DIA_RATFORD_MEETING1 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 40;
	condition		= DIA_RATFORD_MEETING1_Condition;
	information		= DIA_RATFORD_MEETING1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RATFORD_MEETING1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Meeting3))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_MEETING1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_RATFORD_MEETING1_07_01"); //Poczekaj chwil�. Znowu najwi�cej roboty jest na mojej g�owie.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_07_02"); //Zanim wyruszysz do �owc�w chcia�bym, �eby� mi troch� pom�g� w obozie. Co ty na to?

	Info_ClearChoices (DIA_RATFORD_MEETING1);
	Info_AddChoice (DIA_RATFORD_MEETING1, "M�w, byle szybko.", DIA_RATFORD_MEETING1_Yes);
	Info_AddChoice (DIA_RATFORD_MEETING1, "Nie mam czasu.", DIA_RATFORD_MEETING1_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_RATFORD_MEETING1_Yes()
{
	ratford_help = TRUE;
	AI_Output (other, self, "DIA_RATFORD_MEETING1_Yes_15_01"); //M�w, byle szybko.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_02"); //Wiedzia�em, �e mo�na na Tobie polega�.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_03"); //Sam wszystkiego nie ogarn�. 
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_04"); //Pomo�esz wyku� miecze Aidanowi. Razem zrobicie to du�o szybciej.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_05"); //Rozniesiesz or� rebeliantom. Niekt�rzy z nich musz� dosta� now� bro�. Pogadaj o tym z Foxem.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_06"); //Porozmawiaj te� z Rodneyem i �wistakiem. Jeden i drugi prosi� mnie wcze�niej o przys�ug�.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_07"); //To by�oby na tyle. Dzi�ki za pomoc przyjacielu.
	AI_Output (other, self, "DIA_RATFORD_MEETING1_Yes_15_08"); //Po choler� si� zgodzi�em. Znowu musz� odwali� brudn� robot�.
	
   Log_CreateTopic(CH3_RBL_AidanHelp, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_AidanHelp, LOG_RUNNING);
	B_LogEntry(CH3_RBL_AidanHelp, "Mam pom�c Aidanowi w wykuciu mieczy dla rebeliant�w.");
	Log_CreateTopic(CH3_RBL_DelivWeapon, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_DelivWeapon, LOG_RUNNING);
	B_LogEntry(CH3_RBL_DelivWeapon, "Fox da mi or�, kt�ry musz� roznie�� rebeliantom.");

	B_LogEntry(CH3_RBL_OldCampAttack, "Musz� pom�c w przygotowaniach do obrony. Czeka mnie kucie mieczy z Aidanem i roznoszenie or�a od Foxa. Mam te� dowiedzie� si�, jakie problemy maj� Rodney i �wistak.");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

// ---------------------------No----------------------------------------

FUNC VOID DIA_RATFORD_MEETING1_No()
{
	AI_Output (other, self, "DIA_RATFORD_MEETING1_No_15_01"); //Nie mam czasu. 
	AI_Output (other, self, "DIA_RATFORD_MEETING1_No_15_02"); //Musz�, jak najszybciej wyruszy� do obozu �owc�w.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_No_07_03"); //Rozumiem. Jako� sobie poradz�.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_No_07_04"); //Mam tylko jedn� pro�b�...
	AI_Output (other, self, "DIA_RATFORD_MEETING1_No_15_05"); //No dobra, m�w.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_No_07_06"); //Rodney ma jaki� problem. Pogadaj z nim, w ko�cu to tw�j kumpel.
	AI_Output (other, self, "DIA_RATFORD_MEETING1_No_15_07"); //Zobacz�, co da si� zrobi�.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_No_07_08"); //W porz�dku. Czeka nas pracowity dzionek...

	B_LogEntry(CH3_RBL_OldCampAttack, "Nie zgodzi�em si� pom�c Ratfordowi, sam mam ju� sporo na g�owie. Obieca�em tylko porozmawia� z Rodneyem i dowiedzie� si�, jakie ma problemy.");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

// **************************************************

INSTANCE DIA_RATFORD_OCAttackFinal (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 41;
	condition		= DIA_RATFORD_OCAttackFinal_Condition;
	information		= DIA_RATFORD_OCAttackFinal_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ob�z jest ju� chyba got�w do odparcia ataku."; 
};

FUNC INT DIA_RATFORD_OCAttackFinal_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_KiraAfter))&&(Npc_KnowsInfo (hero, DIA_Rodney_BecomeMagEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OCAttackFinal_Info()
{
	var C_NPC abel; abel = Hlp_GetNpc(HUN_2615_Abel);

	AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_01"); //Ob�z jest ju� chyba got�w do odparcia ataku.
	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_02"); //Jest coraz lepiej, ale nadal czeka nas sporo pracy.

	if (ratford_help == TRUE)&&(others_help == 4)
	{
		B_GiveXP(1000);
		AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_03"); //Naprawd� bardzo mi pomog�e� w przygotowaniach.
		AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_04"); //We� ten amulet. Kiedy� dobrze mi s�u�y�, a teraz niech i Tobie si� na co� przyda.

		CreateInvItems(self, Schutzamulett_Waffen, 1);
      B_GiveInvItems(self, other, Schutzamulett_Waffen, 1);
	};
	
	AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_05"); //Rodney jest ju� magiem. Nie s�dzi�em, �e ma dusz� marzyciela... 
	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_06"); //Hmm, czasem warto pom�c marzeniom w spe�nieniu.
	AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_07"); //W rzeczy samej. 

	if (kira_help == 1)
	{
		AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_08"); //Kira i �owcy wespr� nas.
		AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_09"); //To wspania�a nowina! Naprawd� doda�e� mi otuchy.
	}
	else
	{
		AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_10"); //Niestety Kira i jej ch�opcy nam nie pomog�.
		AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_11"); //Cholera, szkoda, ale jako� sobie poradzimy.
	};
   
	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_12"); //Chod�, rzucimy okiem na palisad�...
	// 	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_13"); //Co to za ha�as?
	// 	AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_14"); //Zacz�o si�...
	// 	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_15"); //Do broni!
	// 	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_16"); //Trzymaj si� blisko mnie, to b�dzie krwawa jatka...
	B_LogEntry(CH3_RBL_OldCampAttack, "Stra�nicy zaatakowali!");

	B_StopProcessInfos(self);
	//	Npc_ExchangeRoutine		(self,"Alarm");
	OR_PREALARM=1;

	OR_ATTACKED=TRUE;
	/*************************
	
	No ork to teraz twoja kolej - atak stra�nik�w na ob�z rbl�w
	Mo�e niech na ko�cu kiedy wszyscy stra�nicy zgin�� zmienna grd_attack_finish = TRUE; to sobie od niej nast�pny dialog zainicjuj�

	grds_attack ();

	To funkcja z pomoca kiry je�eli  (kira_help == 1)
	kira_attack ();
	*******************/
};

// **************************************************

INSTANCE DIA_RATFORD_OCAttackEnd (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 43;
	condition		= DIA_RATFORD_OCAttackEnd_Condition;
	information		= DIA_RATFORD_OCAttackEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_OCAttackEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OCAttackFinal)) && (!GrdsInAttack)
   && (OR_ATTACKED>=76) && (Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OCAttackEnd_Info()
{
	B_GiveXP(2500);
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_01"); //Z�oili�my im sk�ry, �e a� mi�o! Gomez w ko�cu zacznie si� nas ba�.
	AI_Output (other, self, "DIA_RATFORD_OCAttackEnd_15_02"); //Co� mi si� wydaje, �e to dopiero pocz�tek.
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_03"); //Oczywi�cie, ale magnaci dwa razy si� zastanowi�, zanim znowu uderz�.
	AI_Output (other, self, "DIA_RATFORD_OCAttackEnd_15_04"); //Oby� mia� racj�...
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_05"); //Cholera, trzeba obla� takie zwyci�stwo! Obaj zas�u�yli�my na ma�y toa�cik...
   
	CreateInvItems	(self, ItFoBeer, 2);
	AI_TurnToNpc(self,other);
	B_GiveInvItems (self, other,ItFoBeer, 1);
   
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_06"); //Za tych co padli w boju. I na jaja Beliara - na pohybel suczym synom Gomeza. Do dna!
	AI_UseItem (other,ItFobeer);
	AI_UseItem (self,ItFobeer);
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_07"); //Nie ma to jak przep�uka� garde�ko po bitwie. 
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_08"); //A teraz ta mniej przyjemna cz��. Musz� sprawdzi� w jakiej kondycji s� ch�opaki.
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_09"); //Trzeba te� pogrzeba� tych, kt�rzy padli w boju...
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_10"); //Id� si� przespa�, bo wygl�dasz jak dupa Gomeza.
	AI_Output (other, self, "DIA_RATFORD_OCAttackEnd_15_11"); //Tak chyba zrobi�. Bywaj.
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_12"); //Spotkamy si� jutro, Rick.
	
   rat_wait = B_SetDayTolerance()+1;
	Log_SetTopicStatus(CH3_RBL_OldCampAttack, LOG_SUCCESS);
	B_LogEntry(CH3_RBL_OldCampAttack, "Odparli�my atak stra�nik�w! Ju� dawno nie widzia�em tyle krwi... Ciesz� si�, �e jestem w�r�d �ywych. Zas�u�y�em na porz�dny sen...");	 	
	Npc_ExchangeRoutine(self,"start");   

   OR_PREALARM=false;
	OR_ATTACKED=false;
};

// **************************************************

INSTANCE DIA_RATFORD_WhatNext (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 45;
	condition		= DIA_RATFORD_WhatNext_Condition;
	information		= DIA_RATFORD_WhatNext_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_WhatNext_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OCAttackEnd))&& (rat_wait <= Wld_GetDay())&& (Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_WhatNext_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_RATFORD_WhatNext_07_01"); //Posprz�tali�my po stra�nikach. Na razie jako� sobie poradz� bez Ciebie. 
	AI_Output (other, self, "DIA_RATFORD_WhatNext_15_02"); //No prosz�, w ko�cu dosta�em wolne. Cholera, i co ja teraz zrobi�?
	AI_Output (self, other, "DIA_RATFORD_WhatNext_07_03"); //Co� wymy�lisz. Powodzenia na szlaku, Rick.
   AI_Output (self, other, "DIA_RATFORD_WhatNext_07_04"); //A jak naprawd� ci si� nudzi, to id� do Cavalorna. Ma dla ciebie kolejne zadanie.
	AI_Output (other, self, "DIA_RATFORD_WhatNext_15_05"); //Czyli jednak nie mam wolnego... Daj wytchn�� ch�opakom w obozie, zas�u�yli na to.
	AI_Output (self, other, "DIA_RATFORD_WhatNext_07_06"); //Przemy�l� to. Bywaj.
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_RATFORD_OtherHelp(C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 50;
	condition		= DIA_RATFORD_OtherHelp_Condition;
	information		= DIA_RATFORD_OtherHelp_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_OtherHelp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_NCFinish))&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OtherHelp_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_01"); //W ko�cu jeste�!
	AI_Output (other, self, "DIA_RATFORD_OtherHelp_15_02"); //Rozmawia�em ju� z Cavalornem. Podobno si� za mn� st�skni�e�.
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_03"); //Musisz porozmawia� z Kir�. Przyda si� nam ka�dy miecz podczas ataku na Stary Ob�z.
	AI_Output (other, self, "DIA_RATFORD_OtherHelp_15_04"); //A najemnicy?
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_05"); //Po tym co zrobi�e� w Nowym Obozie, Lee stoi za nami murem. Niedawno rozmawia�em z Cordem, najemnicy uderz� razem z nami.
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_06"); //Lee poprowadzi pozorowany atak na zewn�trzny pier�cie�. W ten spos�b �atwiej b�dzie nam niepostrze�enie dosta� si� do �rodka przez ukryty tunel.
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_07"); //Kiedy otworzymy bram�, najemnicy pomog� nam roznie�� stra�nik�w.
	AI_Output (other, self, "DIA_RATFORD_OtherHelp_15_08"); //Brzmi nie�le. Dobra, odwiedz� Kir� i jej ch�opc�w.
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_09"); //To �wietnie. Ten uparty babsztyl nie pos�ucha nikogo z nas. U�yj wszelkich dost�pnych �rodk�w, aby j� przekona�.
	AI_Output (other, self, "DIA_RATFORD_OtherHelp_15_10"); //Zobacz�, co da si� zrobi�.
   
	Log_CreateTopic(CH6_RBL_OtherHelp, LOG_MISSION);
	Log_SetTopicStatus(CH6_RBL_OtherHelp, LOG_RUNNING);
	B_LogEntry(CH6_RBL_OtherHelp, "Ratford chce, abym spotka� si� z Kir�. �owcy przydadz� si� podczas ataku na Stary Ob�z. Dzi�ki nim �atwiej b�dzie osaczy� stra�nik�w. Czas ruszy� w drog�...");
};

// **************************************************

INSTANCE DIA_RATFORD_OtherHelpFinished (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 51;
	condition		= DIA_RATFORD_OtherHelpFinished_Condition;
	information		= DIA_RATFORD_OtherHelpFinished_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wr�ci�em."; 
};

FUNC INT DIA_RATFORD_OtherHelpFinished_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kira_Bring_Cutter))&&(Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OtherHelpFinished_Info()
{
	AI_Output (other, self, "DIA_RATFORD_OtherHelpFinished_15_01"); //Wr�ci�em.
	AI_Output (self, other, "DIA_RATFORD_OtherHelpFinished_07_02"); //Zauwa�y�em. Co z Kir�?
	AI_Output (other, self, "DIA_RATFORD_OtherHelpFinished_15_03"); //Dosta�a to czego chcia�a i we�mie udzia� w ataku.
	AI_Output (self, other, "DIA_RATFORD_OtherHelpFinished_07_04"); //�wietna robota!
	AI_Output (self, other, "DIA_RATFORD_OtherHelpFinished_07_05"); //Wy�l� do niej ��cznika. Na razie nie b�dziesz tu potrzebny. 
	AI_Output (self, other, "DIA_RATFORD_OtherHelpFinished_07_06"); //Musz� dopi�� przygotowania do ataku. Bywaj.
	AI_Output (other, self, "DIA_RATFORD_OtherHelpFinished_15_07"); //Powodzenia, Ratford.

	Log_SetTopicStatus(CH6_RBL_OtherHelp, LOG_SUCCESS);
	B_LogEntry(CH6_RBL_OtherHelp, "Ratford wy�le do Kiry ��cznika, kt�ry ustali z �owcami, gdzie uderz�.");
};

// **************************************************

INSTANCE DIA_RATFORD_Urt (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 52;
	condition		= DIA_RATFORD_Urt_Condition;
	information		= DIA_RATFORD_Urt_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co wiesz o Urcie?"; 
};

FUNC INT DIA_RATFORD_Urt_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cipher_Urt))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Urt_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Urt_15_01"); //Co wiesz o Urcie?
   
	if (!Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelpFinished))
	{
		AI_Output (self, other, "DIA_RATFORD_Urt_07_02"); //Za�atw spraw� z Kir� to pogadamy.
	}
	else
	{
		AI_Output (self, other, "DIA_RATFORD_Urt_07_03"); //Co chcesz wiedzie�?
	};
};

// **************************************************

INSTANCE DIA_RATFORD_UrtKnow (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 53;
	condition		= DIA_RATFORD_UrtKnow_Condition;
	information		= DIA_RATFORD_UrtKnow_Info;
	permanent		= 0;
	important		= 0;
	description		= "Porozmawiajmy o Urcie."; 
};

FUNC INT DIA_RATFORD_UrtKnow_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Urt))&&(Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelpFinished))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_UrtKnow_Info()
{
	AI_Output (other, self, "DIA_RATFORD_UrtKnow_15_01"); //Porozmawiajmy o Urcie.
	AI_Output (self, other, "DIA_RATFORD_UrtKnow_07_02"); //W porz�dku, ale dlaczego pytasz akurat o niego?
	AI_Output (other, self, "DIA_RATFORD_UrtKnow_15_03"); //Co� mi si� w nim nie podoba. Jeste� pewien, �e mo�na mu zaufa�?
	AI_Output (self, other, "DIA_RATFORD_UrtKnow_07_04"); //Zaskoczy�e� mnie. Urta zarekrutowa� Kelvin. Zreszt�, to on zajmowa� si� utworzeniem siatki na terenie Starego Obozu. Ja go praktycznie nie znam.
	AI_Output (other, self, "DIA_RATFORD_UrtKnow_15_05"); //Kelvin nie �yje, a Urt go zast�pi�. W�tpi�, �eby to by� przypadek.
	AI_Output (self, other, "DIA_RATFORD_UrtKnow_07_06"); //Nie chc� nawet my�le� o tym, co mog�oby si� wydarzy�, gdyby Urt okaza� si� zdrajc�. Przecie� to on przygotowa� plan dywersyjny w Starym Obozie!
	AI_Output (other, self, "DIA_RATFORD_UrtKnow_15_07"); //Spr�buj� zdoby� mocniejsze dowody, a na razie zagramy, jak nam rozda.
	AI_Output (self, other, "DIA_RATFORD_UrtKnow_07_08"); //B�d� ostro�ny i za wszelk� cen� uwolnij Diego. Mo�e on wie co� wi�cej...
	AI_Output (other, self, "DIA_RATFORD_UrtKnow_15_09"); //Racja, bywaj.
	B_LogEntry(CH6_RBL_Spy, "Rozgrywka trwa nadal. Nie mam niezbitych dowod�w na to, �e to Urt ala Urthos jest zdrajc�. Mo�e Diego powie co� wi�cej, ale najpierw musz� go uwolni�.");
};

// **************************************************

INSTANCE DIA_RATFORD_DiegoFree (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 54;
	condition		= DIA_RATFORD_DiegoFree_Condition;
	information		= DIA_RATFORD_DiegoFree_Info;
	permanent		= 0;
	important		= 0;
	description		= "Uwolni�em Diego."; 
};

FUNC INT DIA_RATFORD_DiegoFree_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_UrtKnow))&&(Npc_KnowsInfo (hero,Info_Diego_Prison))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_DiegoFree_Info()
{
	AI_Output (other, self, "DIA_RATFORD_DiegoFree_15_01"); //Uwolni�em Diego. To Urt zdradzi�.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree_07_02"); //Zabi�e� sukinsyna?
	AI_Output (other, self, "DIA_RATFORD_DiegoFree_15_03"); //Jeszcze nie, na razie uciek� mi spod miecza.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree_07_04"); //Co si� odwlecze, to nie uciecze...
	AI_Output (other, self, "DIA_RATFORD_DiegoFree_15_05"); //Diego czeka w pobli�u palisady na atak, wtedy do��czy do zabawy i poprowadzi do walki cienie.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree_07_06"); //To chcia�em us�ysze�.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree_07_07"); //Mam sporo na g�owie. Bywaj, Rick.
};

// **************************************************

INSTANCE DIA_RATFORD_DiegoFree2 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 56;
	condition		= DIA_RATFORD_DiegoFree2_Condition;
	information		= DIA_RATFORD_DiegoFree2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Cavalorn powiedzia�, �e nadszed� Czas Zap�aty."; 
};

FUNC INT DIA_RATFORD_DiegoFree2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_OCFinish))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_DiegoFree2_Info()
{
	AI_Output (other, self, "DIA_RATFORD_DiegoFree2_15_01"); //Cavalorn powiedzia�, �e nadszed� Czas Zap�aty.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree2_07_02"); //D�ugo na to czeka�em.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree2_07_03"); //Zanim ruszymy do walki, za�atw wszystkie swoje sprawy, bo p�niej mo�e nie starczy� czasu. Tylko si� pospiesz!
	AI_Output (self, other, "DIA_RATFORD_DiegoFree2_07_04"); //Jak b�dziesz got�w, wr�� do mnie.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree2_07_05"); //Aha. Zaatakujemy po zmierzchu, to da nam wi�ksz� szans� na zaskoczenie.

	Log_CreateTopic(CH6_RBL_PayDay, LOG_MISSION);
	Log_SetTopicStatus(CH6_RBL_PayDay, LOG_RUNNING);
	B_LogEntry	(CH6_RBL_PayDay, "Nadszed� Czas Zap�aty. Ale zanim rusz� na Stary Ob�z, musz� za�atwi� wszystkie niezako�czone sprawy, bo p�niej mo�e nie starczy� czasu. Zaatakujemy po zmierzchu, kiedy b�d� got�w, mam porozmawia� z Ratfordem.");
};

// **************************************************

INSTANCE DIA_RATFORD_PayDay (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 57;
	condition		= DIA_RATFORD_PayDay_Condition;
	information		= DIA_RATFORD_PayDay_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jestem got�w."; 
};

FUNC INT DIA_RATFORD_PayDay_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_DiegoFree))&&(Wld_IsTime (20,00,04,00))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_PayDay_Info()
{
	AI_Output (other, self, "DIA_RATFORD_PayDay_15_01"); //Jestem got�w.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_02"); //Czekali�my ju� tylko na Ciebie.
   
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelpFinished))
	{
		AI_Output (self, other, "DIA_RATFORD_PayDay_07_03"); //Kira ruszy�a pod zachodni� bram�.
	};
   
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_04"); //Lee podzieli� najemnik�w na dwa oddzia�y. Wi�kszy uderzy na po�udniow� bram� pod wodz� Corda.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_05"); //Mniejsza grupa z Gornem na czele zajmie si� zachodni� bram�.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_06"); //My dostaniemy si� przez tunel do wewn�trznego pier�cienia.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_07"); //Diego ju� wyruszy�, razem z cieniami i kopaczami maj� podnie�� kraty.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_08"); //Rebelianci musz� uderzy� ca�� si�� na zamek i magnat�w.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_09"); //Je�eli wszystko p�jdzie zgodnie z planem, to o �wicie b�dziemy ucztowa� na zamku!
	AI_Output (other, self, "DIA_RATFORD_PayDay_15_10"); //Kolonia b�dzie nasza! 
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_11"); //Kobiety Gomeza te�...
	AI_Output (other, self, "DIA_RATFORD_PayDay_15_12"); //He, he, od tej strony Ci� nie zna�em.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_13"); //Ile mo�na po�ci�?
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_14"); //Wystarczy tego gadania. A jak piraci?
   
	if (Npc_KnowsInfo (hero, DIA_Angus_KillGuards))
	{
		AI_Output (other, self, "DIA_RATFORD_PayDay_15_15"); //Rusz� razem ze mn�.
	}
	else
	{
		AI_Output (other, self, "DIA_RATFORD_PayDay_15_16"); //Jeszcze z nimi nie rozmawia�em...
		AI_Output (self, other, "DIA_RATFORD_PayDay_07_17"); //To zr�b to zanim p�jdziesz do Cavalorna!
	};
   
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_18"); //Powodzenia Rick i nie daj si� zabi�!
	AI_Output (other, self, "DIA_RATFORD_PayDay_15_19"); //Przecie� i tak nie b�d� �y� wiecznie.
	AI_Output (other, self, "DIA_RATFORD_PayDay_15_20"); //Id� do Cavalorna, ja ju� mam swoje rozkazy.
   
	B_LogEntry(CH6_RBL_PayDay, "Zacz�o si�. Nasi sojusznicy zaatakuj� zewn�trzne bramy. Diego ruszy� ju� tunelem, �eby skrzykn�� cienie i kopaczy, maj� te� otworzy� bramy. Nam zostali na deser magnaci. Wejdziemy przez tunel i rozp�tamy na zamku prawdziwe piek�o!");

	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"Follow");
	
/***************
Zmiana rutyn najemnik�w i �owc�w - czekaj� pod SO
***************/	
	
	B_OC_Mercenarys_Attack();
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelpFinished))
	{
      B_Kira_Attack();
	};
};

/****************************************
GorHanis quest ch1-2
***************************************/

// **************************************************

INSTANCE DIA_RATFORD_Hanis (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 60;
	condition		= DIA_RATFORD_Hanis_Condition;
	information		= DIA_RATFORD_Hanis_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dlaczego wyrzucili�cie Gor Hanisa z obozu?"; 
};

FUNC INT DIA_RATFORD_Hanis_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_Hanis))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Hanis_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Hanis_15_01"); //Dlaczego wyrzucili�cie Gor Hanisa z obozu?
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_02"); //A dlaczego chwasty odrzuca si� od plew�w?
	AI_Output (other, self, "DIA_RATFORD_Hanis_15_03"); //Czy kto� powie mi w ko�cu prawd�?!
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_04"); //Spokojnie. Nie ma tu nic do ukrycia.
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_05"); //Hanis razem z Kharimem trenowali rekrut�w. Urz�dzali �wiczebne walki, uczyli nowych jak nakopa� stra�nikom.
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_06"); //Podczas jednej z walk z Kharimem, Hanis dosta� po g�owie. Nie wiem, jak to si� sta�o, ale w szale zabi� jednego z rekrut�w.
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_07"); //Quentin widzia� wszystko i zezna�, �e Gor Hanis jest winien. 
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_08"); //Musz� przyzna�, �e te� mnie to zaskoczy�o. Najwidoczniej Hanis wpad� w sza� po tym, jak dosta� przez �eb. 
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_09"); //Musia�em usun�� go z naszych szereg�w. Pozwoli�em mu jednak zosta� w obozie. Szkoda ch�opaka... Tym bardziej teraz z t� g�ow�. Nie mia�em serca wyrzuca� go z obozu.
	AI_Output (other, self, "DIA_RATFORD_Hanis_15_10"); //Z tego co wiem, to Kharim da� przez �eb Hanisowi po tym, jak by�y sekciarz go powali�. W�tpi�, �e od razu si� podni�s� i zabi� rekruta.
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_11"); //Mnie tam nie by�o. Quentin zezna�, �e to Kharim m�wi prawd�. Pogadaj z nim, jak chcesz dowiedzie� si� czego� wi�cej.
	B_LogEntry(CH2_RBL_Mem, "Hanis podobno zabi� w szale jednego z rekrut�w. Nie wydaje mi si�, �e po tym jak dosta� przez �eb, by� zdolny do czegokolwiek. �wiadkiem zdarzenia by� Quentin. Co� mi tu �mierdzi. Kto� tu k�amie i ciekawe, jakie ma motywy.");
};

// **************************************************

INSTANCE DIA_RATFORD_Hanis1 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 61;
	condition		= DIA_RATFORD_Hanis1_Condition;
	information		= DIA_RATFORD_Hanis1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gor Hanis jest niewinny!"; 
};

FUNC INT DIA_RATFORD_Hanis1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_BaalKagan_Hanis))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Hanis1_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Hanis1_15_01"); //Gor Hanis jest niewinny!
	AI_Output (self, other, "DIA_RATFORD_Hanis1_07_02"); //Masz jakie� dowody?
	//TODO: LOL WTF? 
	AI_Output (other, self, "DIA_RATFORD_Hanis1_15_03"); //To d�u�sza historia... (Rick streszcza Ratfordowi to, czego si� dowiedzia�)
	AI_Output (self, other, "DIA_RATFORD_Hanis1_07_04"); //Ale dlaczego Kharim chcia� go pogr��y�?
	AI_Output (other, self, "DIA_RATFORD_Hanis1_15_05"); //Jeszcze tego nie wiem.
	AI_Output (self, other, "DIA_RATFORD_Hanis1_07_06"); //I co ja mam zrobi� z Kharimem? Chyba ode�l� go do Nowego Obozu. Niech tam si� z nim u�eraj�.
	AI_Output (self, other, "DIA_RATFORD_Hanis1_07_07"); //Powiedz Gor Hanisowi, �e znowu jest jednym z nas.
	AI_Output (other, self, "DIA_RATFORD_Hanis1_15_08"); //Z przyjemno�ci�.
	B_ExchangeRoutine(kharim,"banned");
	B_LogEntry(CH2_RBL_Mem, "Ratford mi uwierzy�. Ciekawe, co sk�oni�o Kharima do takiej prowokacji? Musz� powiedzie� Gor Hanisowi, �e znowu jest pe�noprawnym rebeliantem");

	HANIS_TRUST = true;	
};
