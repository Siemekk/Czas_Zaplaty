// **************************************************
// 			    Dla kretoszczur�w EXIT 
// **************************************************
prototype Snaf_Molerat_Exit (C_INFO)
{
	npc			=  Snf_Molerat1;
	nr			=  999;
	condition	= DIA_Snaf_Exit_Condition;
	information	= DIA_Snaf_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = DIALOG_ENDE;
};

INSTANCE DIA_Snf_Molerat1_Exit (Snaf_Molerat_Exit)
{
	npc			= Snf_Molerat1;
};

INSTANCE DIA_Snf_Molerat2_Exit (Snaf_Molerat_Exit)
{
	npc			= Snf_Molerat2;
};

INSTANCE DIA_Snf_Molerat3_Exit (Snaf_Molerat_Exit)
{
	npc			= Snf_Molerat3;
};

INSTANCE DIA_Snf_Molerat4_Exit (Snaf_Molerat_Exit)
{
	npc			= Snf_Molerat4;
};

var int Mis_Snaf_WolfSpawned;

FUNC VOID Rtn_MolKillerWolf_1050010 ()
{
	TA_FollowPC	(07,15,07,14,"OC_MOAT_18");
};

FUNC VOID MIS_SNAF_WOLFSPAWN_SCRIPT_FUNC()
{
	if(!Mis_Snaf_WolfSpawned)&&(snaf_help)
	{
		Mis_Snaf_WolfSpawned=TRUE;
		Wld_InsertNpc(Snf_MolKiller_Wolf,"OC_MOAT_18");
		Wld_InsertNpc(Snf_MolKiller_Wolf,"OC_MOAT_18");
	};
};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snaf_Exit (Snaf_Molerat_Exit)
{
	npc			= RBL_581_Snaf;
};                       

FUNC INT DIA_Snaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Snaf_Hello (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 1;
	condition		= DIA_Snaf_Hello_Condition;
	information		= DIA_Snaf_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak leci?"; 
};

FUNC INT DIA_Snaf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Nienajgorzej. Cz�owiek, kt�ry umie dobrze gotowa�, ma tutaj wielu przyjaci�.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Chcesz mo�e troch� ry�owej zupy?
	AI_Output (other, self,"DIA_Snaf_Hello_15_07"); //Pewnie!
	AI_Output (self, other,"DIA_Snaf_Hello_01_08");	//M�g�by� co� dla mnie zrobi�...
	
	CreateInvItem (self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
var int snaf_help; 
var int snaf_help_no; 
var int scoop_ok;
// **************************************************

INSTANCE DIA_Snaf_Help (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Help_Condition;
	information		= DIA_Snaf_Help_Info;
	permanent		= 0;
	description		="Co takiego?";
};

FUNC INT DIA_Snaf_Help_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Help_Info()
{
	AI_Output (other, self,"DIA_Snaf_Help_15_00"); //Co takiego?
	AI_Output (self, other,"DIA_Snaf_Help_01_01"); //Wczoraj zaatakowa�y mnie wilki. Jako� je przep�dzi�em, ale sukinsyny poharata�y mi nog�.
	AI_Output (self, other,"DIA_Snaf_Help_01_02"); //Do tego zgubi�em moj� ulubion� warzech�!
	AI_Output (self, other,"DIA_Snaf_Help_01_03"); //Ty jeste� tu nowy, wi�c jak obyczaj nakazuje musisz wkupi� si� w �aski reszty.
	AI_Output (other, self,"DIA_Snaf_Help_15_04"); //Ale co mia�bym zrobi�?	
	AI_Output (self, other,"DIA_Snaf_Help_01_05"); //To proste. Wyprowadzisz na popas moje kretoszczury. 
	AI_Output (other, self,"DIA_Snaf_Help_15_06"); //A gdzie niby mia�bym je zaprowadzi�?
	AI_Output (self, other,"DIA_Snaf_Help_01_07"); //Pastwisko znajdziesz za wschodni� bram�, nieopodal po�udniowego wej�cia do Starego Obozu.
	AI_Output (self, other,"DIA_Snaf_Help_01_08"); //To jak b�dzie?
	Log_CreateTopic(CH1_Rbl_SnafHelp, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_SnafHelp, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_SnafHelp, "Snaf poprosi� mnie, �ebym popasa� jego kretoszczury.");
	Info_ClearChoices(DIA_Snaf_Help);
	Info_AddChoice	 (DIA_Snaf_Help, "W porz�dku." ,DIA_Snaf_Help_Yes);
	Info_AddChoice	 (DIA_Snaf_Help, "Chyba zg�upia�e�!" ,DIA_Snaf_Help_No);
};

func void DIA_Snaf_Help_Yes()
{
	AI_Output (other, self,"DIA_Snaf_Help_Yes_15_00"); //W porz�dku.
	AI_Output (self, other,"DIA_Snaf_Help_Yes_01_01"); //�wietnie.
	AI_TurnToNpc(self, Snf_Molerat1);
	AI_Output (self, other,"DIA_Snaf_Help_Yes_01_02"); //Macie si� s�ucha� i nie �re� piekielnik�w!
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Snaf_Help_Yes_01_03"); //W porz�dku, p�jd� za Tob�. Tylko si� nimi dobrze opiekuj.
	AI_Output (self, other,"DIA_Snaf_Help_Yes_01_04"); //Jak znajdziesz moj� warzech�, to dorzuc� co� ekstra.

	Log_CreateTopic(CH1_Rbl_SnafScoop, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_SnafScoop, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_SnafScoop, "Snaf zgubi� gdzie� swoj� warzech�. M�wi� co� o ataku wilk�w podczas popasu kretoszczur�w wi�c pewnie gdzie� tam powinienem jej poszuka�.");

	snaf_help = TRUE;

	/***************

	//zmiana rutyny tych kretoszczur�w, maj� pod��a� za dickiem
	***************/
	var C_NPC snfmol1; snfmol1	=	Hlp_GetNpc(Snf_Molerat1);	
	var C_NPC snfmol2; snfmol2	=	Hlp_GetNpc(Snf_Molerat2);
	var C_NPC snfmol3; snfmol3	=	Hlp_GetNpc(Snf_Molerat3);
	var C_NPC snfmol4; snfmol4	=	Hlp_GetNpc(Snf_Molerat4);
	snfmol1.start_aistate				= ZS_FollowPC;
	snfmol2.start_aistate				= ZS_FollowPC;
	snfmol3.start_aistate				= ZS_FollowPC;
	snfmol4.start_aistate				= ZS_FollowPC;
	AI_StartState(Snf_Molerat1, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat2, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat3, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat4, ZS_FollowPC, 1, "");
	/****************/

	B_LogEntry(CH1_Rbl_SnafHelp, "Zgodzi�em si�. Mam zabra� te ma�e potworki na pastwisko gdzie� w pobli�u po�udniowego wej�cia do Starego Obozu. Aha, jak znajd� warzech� Snafa, to da mi jak�� specjaln� nagrod�.");
	Info_ClearChoices(DIA_Snaf_Help);
};

func void DIA_Snaf_Help_No()
{
	AI_Output (other, self,"DIA_Snaf_Help_No_15_00"); //Chyba zg�upia�e�.
	AI_Output (self, other,"DIA_Snaf_Help_No_01_01"); //Ale mi�so kretoszczur�w to lubisz �re�, h�?
	AI_Output (self, other,"DIA_Snaf_Help_No_01_02"); //Wr��, jak zmienisz zdanie.
	snaf_help_no = TRUE;
	B_LogEntry(CH1_Rbl_SnafHelp, "Nie b�d� bawi� si� w pastucha!");		
	Info_ClearChoices(DIA_Snaf_Help);	
};

INSTANCE DIA_Snaf_AfterGo (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 3;
	condition		= DIA_Snaf_AfterGo_Condition;
	information		= DIA_Snaf_AfterGo_Info;
	permanent		= 1;
	description		= "Zmieni�em zdanie.";
};

FUNC INT DIA_Snaf_AfterGo_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Snaf_Help)) && (snaf_help_no==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_AfterGo_Info()
{
	AI_Output (other, self,"DIA_Snaf_AfterGo_15_00"); //Zmieni�em zdanie.
	AI_Output (self, other,"DIA_Snaf_AfterGo_01_01"); //�wietnie.
	AI_TurnToNpc(self, Snf_Molerat1);
	AI_Output (self, other,"DIA_Snaf_AfterGo_01_02"); //Macie si� s�ucha� i nie �re� piekielnik�w!
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Snaf_AfterGo_01_03"); //W porz�dku, p�jd� za tob�. Tylko si� nimi dobrze opiekuj.
	AI_Output (self, other,"DIA_Snaf_AfterGo_01_04"); //Aha. Jak znajdziesz moj� warzech�, to dorzuc� co� ekstra.
	snaf_help = TRUE;
	snaf_help_no=false;
	Log_CreateTopic(CH1_Rbl_SnafScoop, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_SnafScoop, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_SnafScoop, "Snaf zgubi� gdzie� swoj� warzech�. M�wi� co� o ataku wilk�w podczas popasu kretoszczur�w wi�c pewnie gdzie� tam powinienem jej poszuka�.");

	/***************

	//zmiana rutyny tych kretoszczur�w, maj� pod��a� za dickiem
	***************/
	var C_NPC snfmol1; snfmol1	=	Hlp_GetNpc(Snf_Molerat1);	
	var C_NPC snfmol2; snfmol2	=	Hlp_GetNpc(Snf_Molerat2);
	var C_NPC snfmol3; snfmol3	=	Hlp_GetNpc(Snf_Molerat3);
	var C_NPC snfmol4; snfmol4	=	Hlp_GetNpc(Snf_Molerat4);
	snfmol1.start_aistate				= ZS_FollowPC;
	snfmol2.start_aistate				= ZS_FollowPC;
	snfmol3.start_aistate				= ZS_FollowPC;
	snfmol4.start_aistate				= ZS_FollowPC;
	AI_StartState(Snf_Molerat1, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat2, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat3, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat4, ZS_FollowPC, 1, "");	
	
	/****************/

	B_LogEntry(CH1_Rbl_SnafHelp, "Zgodzi�em si�. Mam zabra� te ma�e potworki na pastwisko gdzie� w pobli�u po�udniowego wej�cia do Starego Obozu. Aha, jak znajd� warzech� Snafa, to da mi jak�� specjaln� nagrod�.");
};

INSTANCE DIA_Snaf_SUCCESS (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 4;
	condition		= DIA_Snaf_SUCCESS_Condition;
	information		= DIA_Snaf_SUCCESS_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Snaf_SUCCESS_Condition()
{	
	if ((Npc_KnowsInfo(other,DIA_Snaf_Help))||(Npc_KnowsInfo(other,DIA_Snaf_AfterGo)))&& (snaf_help==TRUE)&&(Mis_Snaf_WolfSpawned)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_SUCCESS_Info()
{
	AI_Output (self, other,"DIA_Snaf_SUCCESS_01_01"); //Wr�ci�e�!
	
   if (Npc_IsDead(Snf_Molerat1))||(Npc_IsDead(Snf_Molerat2))||(Npc_IsDead(Snf_Molerat3))||(Npc_IsDead(Snf_Molerat4))
	{
		B_FullStop (self);
		
		AI_PlayAni		(self,	"T_HEADACHE");		
		AI_Output (self, other,"DIA_Snaf_SUCCESS_01_02"); //Jak mog�e� do tego dopu�ci�!
		AI_Output (self, other,"DIA_Snaf_SUCCESS_01_03"); //Moje pieszczoszki...

		AI_StandUp (self);
		AI_TurnToNpc (self, other);
		AI_Output (self, other,"DIA_Snaf_SUCCESS_01_04"); //No nic takie �ycie...
	}
	else
	{
		B_GiveXP(250);
		AI_TurnToNpc(self, Snf_Molerat1);
		AI_Output (self, other,"DIA_Snaf_SUCCESS_01_05"); //Moje male�stwa! Nic wam si� nie sta�o...
		AI_TurnToNpc(self, other);
	};

	rebel_camp_trust = rebel_camp_trust + 1;
	snaf_trust = TRUE;

	AI_Output (other, self,"DIA_Snaf_SUCCESS_15_06"); //To jak b�dzie z Twoim poparciem?
	AI_Output (self, other,"DIA_Snaf_SUCCESS_01_07"); //Je�eli o mnie chodzi, to mo�esz zosta� jednym z nas.
	AI_Output (other, self,"DIA_Snaf_SUCCESS_15_08"); //�wietnie. Mi�o by�o Ci� pozna� Snaf.
	AI_Output (self, other,"DIA_Snaf_SUCCESS_01_09"); //Wzajemnie piracie.
	/***************
	//zmiana rutyny tych kretoszczur�w, maj� si� teraz znowu pa��ta� po obozie
	***************/
	var C_NPC snfmol1; snfmol1	=	Hlp_GetNpc(Snf_Molerat1);	
	var C_NPC snfmol2; snfmol2	=	Hlp_GetNpc(Snf_Molerat2);
	var C_NPC snfmol3; snfmol3	=	Hlp_GetNpc(Snf_Molerat3);
	var C_NPC snfmol4; snfmol4	=	Hlp_GetNpc(Snf_Molerat4);
	snfmol1.start_aistate				= ZS_MM_AllScheduler;
	snfmol2.start_aistate				= ZS_MM_AllScheduler;
	snfmol3.start_aistate				= ZS_MM_AllScheduler;
	snfmol4.start_aistate				= ZS_MM_AllScheduler;
	AI_StartState(Snf_Molerat1, ZS_MM_AllScheduler, 1, "");
	AI_StartState(Snf_Molerat2, ZS_MM_AllScheduler, 1, "");
	AI_StartState(Snf_Molerat3, ZS_MM_AllScheduler, 1, "");
	AI_StartState(Snf_Molerat4, ZS_MM_AllScheduler, 1, "");	

	/****************/
	B_LogSetTopicStatus(CH1_Rbl_SnafHelp, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_SnafHelp, "Ostatni raz bawi�em si� w pastucha. Mam poparcie Snafa.");
	B_LogEntry		(CH1_Rbl_RebelCampTrust, "Zdoby�em poparcie Snafa i jego kretoszczur�w.");
};

INSTANCE DIA_Snaf_Scoop (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 5;
	condition		= DIA_Snaf_Scoop_Condition;
	information		= DIA_Snaf_Scoop_Info;
	permanent		= 1;
	important		= 0;
	description		= "To twoja warzecha?"; 
};

FUNC INT DIA_Snaf_Scoop_Condition()
{	
	if (snaf_help==TRUE)&&(scoop_ok == FALSE)
	&& ( ( NPC_HasItems(other,ItMiScoop) ) || ( NPC_HasItems(other,Snaf_Scoop) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Scoop_Info()
{
	AI_Output (other, self,"DIA_Snaf_Scoop_01_01"); //To twoja warzecha?
	
   if (NPC_HasItems(other,Snaf_Scoop)>=1)
	{
		Scoop_ok=TRUE;
		B_GiveXP(150);
		AI_Output (self, other,"DIA_Snaf_Scoop_01_02"); //Tak, w rzeczy samej. �wietna robota.
		B_GiveInvItems (other, self, Snaf_Scoop, 1);
		AI_Output (self, other,"DIA_Snaf_Scoop_01_03"); //We� te bry�ki za fatyg�.
		
		CreateInvItems (self,ItMiNugget,50);
		B_GiveInvItems (self, other, ItMiNugget, 50);
		Log_SetTopicStatus(CH1_Rbl_SnafScoop, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_SnafScoop, "Zwr�ci�em Snafowi jego warzech�.");
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_Scoop_01_05"); //To nie moje. Szukaj dalej...
	};
};

INSTANCE DIA_Snaf_Spy (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 13;
	condition		= DIA_Snaf_Spy_Condition;
	information		= DIA_Snaf_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam takie pytanie."; 
};

FUNC INT DIA_Snaf_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Spy_Info()
{
	spy_count = spy_count + 1;
	AI_Output (other, self, "DIA_Snaf_Spy_15_01"); //Mam takie pytanie.
	AI_Output (self, other, "DIA_Snaf_Spy_07_02"); //Tak?
	AI_Output (other, self, "DIA_Snaf_Spy_15_03"); //Dlaczego stra�nicy pozbyli si� dobrego kucharza?
	AI_Output (self, other, "DIA_Snaf_Spy_07_04"); //Ich zapytaj, nie mnie. Mo�e zbrzyd�a im moja paskudna morda.
	AI_Output (self, other, "DIA_Snaf_Spy_07_05"); //A mo�e kto� poda� im potrawk� ze szczur�w?
	AI_Output (other, self, "DIA_Snaf_Spy_15_06"); //Mimo wszystko dobry kucharz jest w Kolonii na wag� rudy.
	AI_Output (self, other, "DIA_Snaf_Spy_07_07"); //Mo�liwe. Mo�e mia�em inne powody, �eby stamt�d odej��.
	AI_Output (other, self, "DIA_Snaf_Spy_15_08"); //Mo�e...
	B_LogEntry		(CH2_Rbl_Spy, "Snaf te� nie zdradzi� zbyt wiele. Ale dziwne, �e tak dobry kucharz zosta� wyrzucony ze Starego Obozu.");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od Ciebie chcia�.
		B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_Snaf_Spy1 (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 14;
	condition		= DIA_Snaf_Spy1_Condition;
	information		= DIA_Snaf_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wiem, dlaczego musia�e� ucieka� ze Starego Obozu."; 
};

FUNC INT DIA_Snaf_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_Snaf_Spy1_15_01"); //Wiem, dlaczego musia�e� ucieka� ze Starego Obozu.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_02"); //Nie jestem z tego specjalnie dumny, wi�c daj mi spok�j. By�o, min�o.
	AI_Output (other, self, "DIA_Snaf_Spy1_15_03"); //Ale nie o tym chcia�em rozmawia�.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_04"); //Tak?
	AI_Output (other, self, "DIA_Snaf_Spy1_15_05"); //Interesuje mnie to, co my�lisz o tym obozie. O jego mieszka�cach, o tym komu mo�na ufa�, a komu nie.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_06"); //Hmm. Ob�z jak ob�z, wsz�dzie s� dobrzy ludzie i mendy. Co do zaufania...
	AI_Output (self, other, "DIA_Snaf_Spy1_07_07"); //Nie wiem co dok�adnie masz na my�li.
	AI_Output (other, self, "DIA_Snaf_Spy1_15_08"); //Kogo� kto sympatyzuje z innymi obozami.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_09"); //Rozumiem.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_10"); //Aidan ci�gle gdzie� znika. Chocia� od jakiego� czasu zaprzesta� nocnych wypad�w.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_11"); //No i Tony... W Starym Obozie ci�gle obraca� si� w towarzystwie Szakala i innych przydupas�w Gomeza.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_12"); //Nie jestem pewien, ale chyba kilka dni temu widzia�em jak szed� po zmierzchu chy�kiem w stron� lasu.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_13"); //Pewnie nie zwr�ci�bym na to uwagi, ale ni�s� co� ci�kiego.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_14"); //To chyba wszystko. 
	AI_Output (other, self, "DIA_Snaf_Spy1_15_15"); //Dzi�kuj�, to mi wystarczy.
	B_LogEntry		(CH2_Rbl_Spy, "Snaf twierdzi, ze Aidan ju� nie znika noc� z obozu. Widzia� te� Toniego jak ten wynosi� co� noc� z obozu. Ciekawe co to mog�o by�?");

	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o ciebie pyta�, nie daj mu czeka�.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};

	B_StopProcessInfos	(self);
};

// **************************************************


INSTANCE DIA_RBL_581_Snaf_Stew (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 12;
	condition		= DIA_RBL_581_Snaf_Stew_Condition;
	information		= DIA_RBL_581_Snaf_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "(Daj gulasz) Poznajesz ten aromat?"; 
};

FUNC INT DIA_RBL_581_Snaf_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_581_Snaf_Stew_Info()
{
	AI_Output (other, self, "DIA_RBL_581_Snaf_Stew_15_01"); //Poznajesz ten aromat?
	AI_Output (self, other, "DIA_RBL_581_Snaf_Stew_11_02"); //Cz�owieku przecie� to moje sztandarowe danie!
	AI_Output (other, self, "DIA_RBL_581_Snaf_Stew_15_03"); //Twoja porcja, bierz.
	AI_Output (self, other, "DIA_RBL_581_Snaf_Stew_11_04"); //Nie jestem a� tak g�upi, �eby je�� to co sam ugotuj�. 
	AI_Output (self, other, "DIA_RBL_581_Snaf_Stew_11_05"); //Zanie� to jakiemu� desperatowi.
	
	B_LogEntry		(CH2_Rbl_Food, "Snaf powiedzia� �ebym da� jego porcje komu� innemu."); 
};

// **************************************************

INSTANCE DIA_RBL_581_Snaf_Aloes (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 12;
	condition		= DIA_RBL_581_Snaf_Aloes_Condition;
	information		= DIA_RBL_581_Snaf_Aloes_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrafisz przyrz�dzi� mikstur� z aloesu?"; 
};

FUNC INT DIA_RBL_581_Snaf_Aloes_Condition()
{
	if (NPC_HasItems(other,aloes)>=1)&&(aloes_find)&& (!Npc_KnowsInfo (hero, DIA_rbl_1331_baaltaran_Aloes))
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_581_Snaf_Aloes_Info()
{
	AI_Output (other, self, "DIA_RBL_581_Snaf_Aloes_15_01"); //Potrafisz przyrz�dzi� mikstur� z aloesu?
	AI_Output (self, other, "DIA_RBL_581_Snaf_Aloes_11_02"); //Chyba si� pomyli�e�, jestem KUCHARZEM, nie ALCHEMIKIEM.
	AI_Output (self, other, "DIA_RBL_581_Snaf_Aloes_11_03"); //Radz� porozmawia� z kt�rym� z mag�w, albo by�ymi nowicjuszami z bractwa.
};

/****************************

SIDE QUEST

****************************/

INSTANCE DIA_Snaf_Molerats (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 20;
	condition		= DIA_Snaf_Molerats_Condition;
	information		= DIA_Snaf_Molerats_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Snaf_Molerats_Condition()
{
	if (Kapitel>=2)&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Molerats_Info()
{
	B_FullStop (hero);
   
	AI_Output (self, other, "DIA_Snaf_Molerats_07_01"); //Hej, Rick. Podejd� na chwil�...
	
   AI_GotoNpc(other,self);
	
   AI_Output (other, self, "DIA_Snaf_Molerats_15_02"); //Co� si� sta�o?
	AI_Output (self, other, "DIA_Snaf_Molerats_07_03"); //Tak, ale to do��... osobista sprawa.
	
   AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	
   AI_Output (self, other, "DIA_Snaf_Molerats_07_04"); //Mam problem z kretoszczurami. Bydlaki tak si� spas�y, �e sta�y si� bardziej agresywne no i wielkie!
	AI_Output (other, self, "DIA_Snaf_Molerats_15_05"); //Ale co to ma za mn� wsp�lnego?
	AI_Output (self, other, "DIA_Snaf_Molerats_07_06"); //Wiem, �e lubisz dobrze zje��. A ja potrzebuj� mi�sa i w�troby tych spasionych bydlak�w.
	AI_Output (other, self, "DIA_Snaf_Molerats_15_07"); //To id� do zagrody i je zaszlachtuj.
	AI_Output (self, other, "DIA_Snaf_Molerats_07_08"); //Ekhm... W tym w�a�nie problem. One zrobi�y si� bardzo du�e i wredne.
	AI_Output (other, self, "DIA_Snaf_Molerats_15_09"); //Dobra, dobra. Mam je dla ciebie zabi�, tak?
	AI_Output (self, other, "DIA_Snaf_Molerats_07_10"); //Dok�adnie! W podzi�ce naucz� Ci� jak przyrz�dza� pyszn� potrawk� z kretoszczur�w.
	AI_Output (self, other, "DIA_Snaf_Molerats_07_11"); //Zgadzasz si�?
};

INSTANCE DIA_Snaf_MoleratsOk (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 21;
	condition		= DIA_Snaf_MoleratsOk_Condition;
	information		= DIA_Snaf_MoleratsOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, zabawi� si� w rze�nika."; 
};

FUNC INT DIA_Snaf_MoleratsOk_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Snaf_Molerats))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_MoleratsOk_Info()
{
	AI_Output (other, self, "DIA_Snaf_MoleratsOk_15_01"); //Dobra, zabawi� si� w rze�nika.
	AI_Output (self, other, "DIA_Snaf_MoleratsOk_07_02"); //Innos Ci to w dzieciach wynagrodzi!
	AI_Output (other, self, "DIA_Snaf_MoleratsOk_15_03"); //Oby nie za szybko...
	AI_Output (self, other, "DIA_Snaf_MoleratsOk_07_04"); //Id� do zagrody i zabij te bydlaki. Przynie� mi ich mi�so i w�troby. Bez tego si� nie pokazuj!
	AI_Output (other, self, "DIA_Snaf_MoleratsOk_15_05"); //Zaraz wracam.

	Log_CreateTopic	(CH2_RBL_Molerats, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Molerats, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Molerats, "Snaf ma problem z kretoszczurami. Za bardzo je podkarmi� przez co bydlaki sta�y si� du�e i wredne. Mam je dla niego zaszlachtowa� i przynie�� mu mi�so i w�trob�. To b�dzie kr�tki spacerek...");
};

/*************************
Porobi�em 5 unikatowych kretoszczur�w, �eby gracz zbytnio nie oszukiwa� ;P
Fat_Snf_Molerat1 - Fat_Snf_Molerat5 ale w�trob� i mi�cho maj� jak reszta, wa�ne �eby by�y martwe do zaliczenia zadania

*************************/

INSTANCE DIA_Snaf_MoleratsDone (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 22;
	condition		= DIA_Snaf_MoleratsDone_Condition;
	information		= DIA_Snaf_MoleratsDone_Info;
	permanent		= 0;
	important		= 0;
	description		= "Za�atwione."; 
};

FUNC INT DIA_Snaf_MoleratsDone_Condition()
{
	var C_NPC mr1; mr1 = Hlp_GetNpc(Fat_Snf_Molerat1);
	var C_NPC mr2; mr2 = Hlp_GetNpc(Fat_Snf_Molerat2);
	var C_NPC mr3; mr3 = Hlp_GetNpc(Fat_Snf_Molerat3);
	var C_NPC mr4; mr4 = Hlp_GetNpc(Fat_Snf_Molerat4);
	var C_NPC mr5; mr5 = Hlp_GetNpc(Fat_Snf_Molerat5);

	if (Npc_KnowsInfo(other,DIA_Snaf_MoleratsOk))&&(NPC_HasItems(other,ItAt_WatMRat)>=5)&&(NPC_HasItems(other,ItFoMuttonRaw)>=10)
	&&(Npc_IsDead(mr1))&&(Npc_IsDead(mr2))&&(Npc_IsDead(mr3))&&(Npc_IsDead(mr4))&&(Npc_IsDead(mr5))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_MoleratsDone_Info()
{
	AI_Output (other, self, "DIA_Snaf_MoleratsDone_15_01"); //Za�atwione.
	AI_Output (self, other, "DIA_Snaf_MoleratsDone_07_02"); //To �wietnie, w ko�cu mog� wypr�bowa� nowy przepis na w�tr�bk�.
	B_GiveInvItems (other, self, ItAt_WatMRat, 5);
	Npc_RemoveInvItems(self,ItAt_WatMRat,5);
	B_GiveInvItems (other, self, ItFoMuttonRaw, 10);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,10);
	AI_Output (self, other, "DIA_Snaf_MoleratsDone_07_03"); //To Twoja nagroda. Recepta na pewno si� przyda, to m�j sekretny przepis.

	/************************
Ork niech Snaf da mu jak�� recept� na �arcie

***********************/
	//Todo: another cooking reciepe

	AI_Output (other, self, "DIA_Snaf_MoleratsDone_15_04"); //To si� oka�e jak j� wypr�buj�. Bywaj.

	Log_SetTopicStatus	(CH2_RBL_Molerats, LOG_SUCCESS);
	B_LogEntry		(CH2_RBL_Molerats, "Kretoszczury mam ju� z g�owy. Trzeba wypr�bowa� ten przepis od Snafa.");
	B_GIVEXP(150);
   
   Npc_ExchangeRoutine	(self,"START");
};


//***************************************************

INSTANCE DIA_Snaf_Martin (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 23;
	condition		= DIA_Snaf_Martin_Condition;
	information		= DIA_Snaf_Martin_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kiedy ostatnio widzia�e� Martina?"; 
};

FUNC INT DIA_Snaf_Martin_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_FISK_MartinRing))&&(Help_Martin)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Martin_Info()
{
	AI_Output (other, self, "DIA_Snaf_Martin_15_01"); //Kiedy ostatnio widzia�e� Martina?
	AI_Output (self, other, "DIA_Snaf_Martin_07_02"); //Hmm. Kilka dni temu wychodzi� ze sk�adu.
	AI_Output (other, self, "DIA_Snaf_Martin_15_03"); //By� z nim R�czka?
	AI_Output (self, other, "DIA_Snaf_Martin_07_04"); //Niech pomy�l�...
	AI_Output (self, other, "DIA_Snaf_Martin_07_05"); //Tak! Szed� z przeciwnej strony i chyba potr�ci� Martina.
	AI_Output (other, self, "DIA_Snaf_Martin_15_06"); //To ciekawe. Dzi�ki, Snaf.

	B_LogEntry(CH2_RBL_Feelings, "R�czka potr�ci� Martina, to idealny moment na kradzie�. Musz� pyta� dalej.");

	B_fingers_proofs();
}; 

INSTANCE DIA_Snaf_CanYouTeachMe (C_INFO)
{
	npc				= RBL_581_Snaf;
	condition		= DIA_Snaf_CanYouTeachMe_Condition;
	information		= DIA_Snaf_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Snaf_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Snaf_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Snaf_CanYouTeachMe_12_02"); //Wiem jak wypatroszy� zwierzaka i wyci�� w�trob�. 
	AI_Output (self, other, "DIA_Snaf_CanYouTeachMe_12_03"); //Kiedy� potrafi�em te� strzyc we�n�.	
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Snaf poka�e mi jak wypatroszy� zwierz�ta, wyci�� w�trob� i jak strzyc we�n�.");
	
};