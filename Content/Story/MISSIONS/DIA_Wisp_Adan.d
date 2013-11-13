const int   ID_MIS_ADANWAVE  = 3501;

INSTANCE MIS_AdanWave1	(Mst_Default_Molerat)
{
	name							=	"M�ody kretoszczur";
	level							=	4;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);
	

	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;

	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;

	//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	8;
	protection	[PROT_EDGE]			=	8;

	fight_tactic					= FAI_MONSTER_COWARD;

	Set_Molerat_Visuals();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);

	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItAt_WatMRat, 1);
	B_SetMonsterLevel();
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);			
	start_aistate				= ZS_AdanWave;
	
	
};
INSTANCE MIS_AdanWave2	(Mst_Default_Scavenger)
{
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);

	CreateInvItems (self, ItFoMuttonRaw, 2);
	if(Hlp_Random(2))
	{
		CreateInvItems (self, ItFoScavengerEgg, 1+Hlp_Random(2));	
	};
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
	B_SetMonsterLevel();	
	start_aistate				= ZS_AdanWave;
};
INSTANCE MIS_AdanWave3	(Mst_Default_GreenGobbo)
{
	Set_GreenGobbo_Visuals();
	Npc_SetToFightMode (self, ItMw_1H_Sword_Old_01); //+10
	attribute[ATR_STRENGTH] = attribute	[ATR_STRENGTH] + 10; // da technisch im Faustkampf
	CreateInvItems (self, ItAt_GobKosc, 1);
	B_CreateGobboInv();
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);		
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
	B_SetMonsterLevel();	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave4	(Mst_Default_Bloodfly)
{
	Set_Bloodfly_Visuals();
	Npc_SetToFistMode(self);
	
	B_SetMonsterLevel();	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave5	(Mst_Default_Waran)
{
	Set_Waran_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  15);
	B_SetMonsterLevel();
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave6	(Mst_Default_Wolf)
{
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  16);
	B_SetMonsterLevel();	
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave7	(Mst_Default_OrcBiter)
{
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave8	(Mst_Default_OrcDog)
{
	Set_OrcDog_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave9	(Mst_Default_BlackGobbo)
{
	level							=	15;

	Set_BlackGobbo_Visuals();
	Npc_SetToFightMode (self, ItMw_1H_Mace_01);
	
	attribute	[ATR_STRENGTH]		=	 60+30; //da Gobbos technisch im Faustkampf
	
	attribute	[ATR_HITPOINTS_MAX]	=	105;
	attribute	[ATR_HITPOINTS]		=	105;
	
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	
	name							=	"Goblin wojownik";

	CreateInvItems (self, ItAt_GobKosc, 1);	
	B_CreateGobboInv();
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave10	(Mst_Default_Minecrawler)
{
	Set_Minecrawler_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave11	(Mst_Default_Aligator)
{
	Set_Alligator_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};
//////////////////////////////////////////////////////////////////////////
//	ZS_AdanWave
//	===========
//	Goto Hero + VFX on start
//////////////////////////////////////////////////////////////////////////
func void ZS_AdanWave()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_AdanWave");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_MM_ReactToDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_MM_AssessBody);
	Wld_PlayEffect("spellFX_MassDeath_GROUND", self, self, 1,0 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)	
	AI_StandUp 		(self);
	AI_TurnToNpc	(self, other);
	AI_PlayAni		(self, "T_WARN"); 			
};

func int ZS_AdanWave_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_AdanWave_Loop");
	//PRINTGlobals		(PD_MST_DETAIL);

	//-------- SC-Meister folgen ! --------
	AI_GotoNpc		(self,	hero);
	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};
func void ZS_AdanWave_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPijakB_End");


};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Iskra_Exit (C_INFO)
{
	npc			= Wisp_Adan;
	nr			= 999;
	condition	= DIA_Iskra_Exit_Condition;
	information	= DIA_Iskra_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Iskra_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Iskra_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Iskra_Hello (C_INFO)
{
	npc				= Wisp_Adan;
	nr				= 1;
	condition		= DIA_Iskra_Hello_Condition;
	information		= DIA_Iskra_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Iskra_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Next1))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Iskra_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Iskra_Hello_11_00"); //Wiem, po co przybywasz. M�j Pan odda� mi to, czego szukasz.
	AI_Output (other, self, "DIA_Iskra_Hello_15_01"); //Jak znam �ycie nie dostan� nic za �adne oczy.
	AI_Output (self, other, "DIA_Iskra_Hello_11_02"); //Nie potrzebuj� Twoich oczu...
	AI_Output (other, self, "DIA_Iskra_Hello_15_03"); //To by� �art - niewa�ne. Przyby�em po pos��ek. Czego ��dasz w zamian?
	AI_Output (self, other, "DIA_Iskra_Hello_11_04"); //M�j Pan utrzymuje r�wnowag� pomi�dzy pozosta�ymi bra�mi. 
	AI_Output (self, other, "DIA_Iskra_Hello_11_05"); //Nie b�dziesz musia� udowodni� odwagi czy te� bezwzgl�dno�ci.
	AI_Output (self, other, "DIA_Iskra_Hello_11_06"); //Wystarczy, �e wyka�esz si� sprytem.
	AI_Output (self, other, "DIA_Iskra_Hello_11_07"); //Niedaleko na skale le�y pier�cie�. Nie mo�na si� tam dosta� w naturalny spos�b.
	AI_Output (self, other, "DIA_Iskra_Hello_11_08"); //Daj mi ten pier�cie�, a otrzymasz swoj� nagrod�.
	B_LogEntry		(CH2_RBL_Tritetra, "Aby otrzyma� pos��ek Adanosa, musz� zdoby� pier�cie�, kt�ry le�y w pobli�u ognika, na skale. Bez magii si� raczej nie ob�dzie.");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Iskra_Hello1 (C_INFO)
{
	npc				= Wisp_Adan;
	nr				= 2;
	condition		= DIA_Iskra_Hello1_Condition;
	information		= DIA_Iskra_Hello1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Iskra_Hello1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Iskra_Hello))&&(NPC_HasItems(other,Adan_Ring)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Iskra_Hello1_Info()
{
	B_GiveXP (300);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	B_GiveInvItems (other, self, Adan_Ring, 1);
	Npc_RemoveInvItems(self,Adan_Ring,1);
	AI_Output (self, other, "DIA_Iskra_Hello1_11_00"); //Uda�o Ci si�! Dowiod�e�, �e� godzien otrzyma� m�j dar.

	/*************************
	Przyda�o by si� zrobi� pos��ek beliara
	*************************/

	CreateInvItems (self, tri_adan_statue,1); 	
	B_GiveInvItems (self, other, tri_adan_statue, 1);
	/****************************
	Nie wiem, jaka� zmiana rutyny, pfx, etc.
	****************************/

	AI_Output (other, self, "DIA_Iskra_Hello1_15_01"); //Mi�o by�o pozna�.
	B_LogEntry		(CH2_RBL_Tritetra, "Otrzyma�em pierwszy pos��ek Adanosa.");
};

// **************************************************

INSTANCE DIA_Iskra_Pair (C_INFO)
{
	npc				= Wisp_Adan;
	nr				= 3;
	condition		= DIA_Iskra_Pair_Condition;
	information		= DIA_Iskra_Pair_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Iskra_Pair_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_NextTwo))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Iskra_Pair_Info()
{
	wisp_trial = 1;	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Iskra_Pair_11_00"); //Przyby�e� ponownie. To ja jestem stra�nikiem aspekt�w mojego Pana. 
	AI_Output (other, self, "DIA_Iskra_Pair_15_01"); //Domy�li�em si�, �e nie jeste� jednym ze skaza�c�w.
	AI_Output (self, other, "DIA_Iskra_Pair_11_02"); //�art, tak?
	AI_Output (other, self, "DIA_Iskra_Pair_15_03"); //Szybko si� uczysz ogniku. Czego tym razem musz� dowie��?
	AI_Output (self, other, "DIA_Iskra_Pair_11_04"); //Determinacji. M�j Pan cz�sto wyznacza kr�te �cie�ki, na kt�rych �atwo mo�na zb��dzi�.
	AI_Output (self, other, "DIA_Iskra_Pair_11_05"); //Sprawdz� Tw� wytrwa�o��. Je�eli zdo�asz dowie�� wystarczaj�cej determinacji, oddam Ci pos��ki.
	B_LogEntry		(CH2_RBL_Tritetra, "Tym razem ognik podda mnie pr�bie wytrwa�o�ci cokolwiek by to nie oznacza�o.");
	B_StopProcessInfos	( self );

	B_Story_Mis_AdanWaves_SpawnNextWave();
};

// **************************************************

INSTANCE DIA_Iskra_Pair1 (C_INFO)
{
	npc				= Wisp_Adan;
	nr				= 4;
	condition		= DIA_Iskra_Pair1_Condition;
	information		= DIA_Iskra_Pair1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Iskra_Pair1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Iskra_Pair))&&(wisp_trial == 12)&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Iskra_Pair1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Iskra_Pair1_11_00"); //Dobrze si� sprawi�e� �miertelniku. Zas�u�y�e� na przychylno�� mojego Pana i na nagrod�.
	AI_Output (other, self, "DIA_Iskra_Pair1_15_01"); //To nie by�o takie trudne. Bywaj.

	CreateInvItems (self, tri_adan_statue,2); 	
	B_GiveInvItems (self, other, tri_adan_statue, 2);
	/****************************
	Nie wiem, jaka� zmiana rutyny, pfx, etc.
	****************************/

	B_LogEntry		(CH2_RBL_Tritetra, "Pokona�em potwory i zdoby�em dwa pos��ki Adanosa.");
};

// **************************************************

INSTANCE DIA_Iskra_Three (C_INFO)
{
	npc				= Wisp_Adan;
	nr				= 5;
	condition		= DIA_Iskra_Three_Condition;
	information		= DIA_Iskra_Three_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Iskra_Three_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_LastThree))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Iskra_Three_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Iskra_Three_11_00"); //Widz�, �e nie ustajesz w poszukiwaniach. Wyczuwam konsternacj� bog�w. To ostatnie pos��ki?
	AI_Output (other, self, "DIA_Iskra_Three_15_01"); //Tak, brakuje tylko tych trzech.
	AI_Output (self, other, "DIA_Iskra_Three_11_02"); //Powiedz mi co chcesz uczyni� z Tritetr�?


	Info_ClearChoices (DIA_Iskra_Three);
	Info_AddChoice (DIA_Iskra_Three, "Zaw�adn� ich moc�!", DIA_Iskra_Three_Power);
	Info_AddChoice (DIA_Iskra_Three, "Pozostawi� to przeznaczeniu.", DIA_Iskra_Three_Destiny);
	Info_AddChoice (DIA_Iskra_Three, "Zniszcz� je!", DIA_Iskra_Three_Destroy);
};

// ---------------------------power----------------------------------------

FUNC VOID DIA_Iskra_Three_Power()
{
	AI_Output (other, self, "DIA_Iskra_Three_Power_15_01"); //Zaw�adn� moc� wszystkich pos�g�w i unurzam �wiat w krwi tych, kt�rzy stan�� mi na drodze ku chwale!
	AI_Output (self, other, "DIA_Iskra_Three_Power_11_02"); //To nie jest droga, na kt�r� mog� si� zgodzi�. Nie jeste� godzien aby otrzyma� pos��ki.
	Log_SetTopicStatus	(CH2_RBL_Tritetra, LOG_FAILED);
	B_LogEntry		(CH2_RBL_Tritetra, "Nie zdoby�em ostatnich trzech pos��k�w. Lepiej nie pokazywa� si� teraz Lerenowi.");
	Info_ClearChoices (DIA_Iskra_Three);
	B_StopProcessInfos	( self );
	Npc_ExchangeRoutine(Wisp_Adan,"out");
};

// ---------------------------destroy----------------------------------------

FUNC VOID DIA_Iskra_Three_Destroy()
{
	AI_Output (other, self, "DIA_Iskra_Three_Destroy_15_01"); //Zniszcz� je! Uwolni� �wiat od boskich zabawek.
	AI_Output (self, other, "DIA_Iskra_Three_Destroy_11_02"); //Przeznaczenie Tritetry jeszcze si� nie wype�ni�o. Nie mog� pozwoli� na to aby� zniszczy� dzie�o mojego Pana.
	Log_SetTopicStatus	(CH2_RBL_Tritetra, LOG_FAILED);
	B_LogEntry		(CH2_RBL_Tritetra, "Nie zdoby�em ostatnich trzech pos��k�w. Lepiej nie pokazywa� si� teraz Lerenowi.");
	Info_ClearChoices (DIA_Iskra_Three);
	B_StopProcessInfos	( self );
	Npc_ExchangeRoutine(Wisp_Adan,"out");
};

// ---------------------------destiny----------------------------------------

FUNC VOID DIA_Iskra_Three_Destiny()
{
	B_GiveXP (500);
	AI_Output (other, self, "DIA_Iskra_Three_Destiny_15_01"); //Pozostawi� to przeznaczeniu i woli bog�w.
	AI_Output (self, other, "DIA_Iskra_Three_Destiny_11_02"); //To jedyny s�uszny wyb�r. Pos��ki s� Twoje �miertelniku.
	CreateInvItems (self, tri_adan_statue,1); 	
	B_GiveInvItems (self, other, tri_adan_statue, 1);
	CreateInvItems (self, tri_beliar_statue,1); 	
	B_GiveInvItems (self, other, tri_beliar_statue, 1);
	CreateInvItems (self, tri_innos_statue,1); 	
	B_GiveInvItems (self, other, tri_innos_statue, 1);

	B_LogEntry		(CH2_RBL_Tritetra, "Zdoby�em ostatnie trzy pos��ki. Teraz musz� 'tylko' prze�y� i odda� je Lerenowi.");
	Info_ClearChoices (DIA_Iskra_Three);
	B_StopProcessInfos	( self );
	Npc_ExchangeRoutine(Wisp_Adan,"out");
}; 
