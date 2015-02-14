// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_2615_Abel_Exit (C_INFO)
{
	npc			= HUN_2615_Abel;
	nr			= 999;
	condition	= DIA_HUN_2615_Abel_Exit_Condition;
	information	= DIA_HUN_2615_Abel_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_2615_Abel_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_2615_Abel_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int abel_ok;
var int abel_know;
var int abel_warn;

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_HUN_2615_Abel_Hello (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 2;
	condition		= DIA_HUN_2615_Abel_Hello_Condition;
	information		= DIA_HUN_2615_Abel_Hello_Info;
	permanent		= 1;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_2615_Abel_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(abel_ok==FALSE)&&(Kapitel==1)&&(!Npc_KnowsInfo(other,DIA_HUN_336_Cavalorn_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_2615_Abel_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_01"); //St�j! Czego tu chcesz?
   
	if (Npc_KnowsInfo(other,RBL_2604_Tony_FallowEnd))
	{
		if (abel_know==FALSE)
		{
			abel_know=TRUE;
			AI_DrawWeapon (self);
			AI_Output (other, self,"DIA_HUN_2615_Abel_Hello_15_02"); //Uratowa�em ty�ek Toniego. W zamian przyprowadzi� mnie tutaj.
			AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_03"); //I?
			AI_Output (other, self,"DIA_HUN_2615_Abel_Hello_15_04"); //Powiedzia�...
			AI_RemoveWeapon (self);
			AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_05"); //G�wno mnie obchodzi, co powiedzia�. Chcesz wej��, to musisz udowodni� swoj� przydatno��. Zreszt� jak ka�dy nowy.
			AI_Output (other, self,"DIA_HUN_2615_Abel_Hello_15_06"); //Niech b�dzie. To co mam zrobi�?
			AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_07"); //Niedaleko wa��sa si� patrol czerwonych. Zabij ich dow�dc� - Z�ego. Jako dow�d przynie� mi �eb tego sukinsyna. 
			AI_Output (other, self,"DIA_HUN_2615_Abel_Hello_15_08"); //Tylko tyle? Mo�e jeszcze wypru� flaki Gomezowi i zniszczy� magiczn� barier�?
			AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_09"); //Na razie wystarczy g�owa Z�ego. Wtedy udowodnisz, �e nie cuchniesz Starym Obozem.
			AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_10"); //To jak b�dzie?
		}
		else
		{	
			AI_Output (other, self,"DIA_HUN_2615_Abel_Hello_15_11"); //Zmieni�em zdanie.
			AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_12"); //To jak b�dzie z t� g�ow�?
		};
	}
	else
	{
		if (abel_warn==FALSE)
		{
			abel_warn = TRUE;
			AI_DrawWeapon (self);
			AI_Output (other, self,"DIA_HUN_2615_Abel_Hello_15_13"); //Przechodzi�em i...
			AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_14"); //I pomy�la�e� sobie, �e zagadasz, zapalimy bagienne ziele i takie tam?
			AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_15"); //S�uchaj ch�opcze. Nie znam Ci�, do tego zdajesz si� cuchn�� Starym Obozem.
			AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_16"); //Odejd�, zanim komu� stanie si� krzywda.
		}
		else
		{
			AI_DrawWeapon (self);
			AI_Output (other, self,"DIA_HUN_2615_Abel_Hello_15_17"); //Ja...
			AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_18"); //Won!	
		};
      
		AI_RemoveWeapon (self);
		B_StopProcessInfos(self);
		AI_GotoWP(other, "OW_PATH_OC_NC4");
	};

	Info_ClearChoices (DIA_HUN_2615_Abel_Hello);
	Info_AddChoice (DIA_HUN_2615_Abel_Hello, "Dobra, zrobi� to.", HUN_2615_Abel_Hello_Yes);
	Info_AddChoice (DIA_HUN_2615_Abel_Hello, "Mo�e innym razem.", HUN_2615_Abel_Hello_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID HUN_2615_Abel_Hello_Yes()
{
	abel_ok = TRUE;
   
	AI_Output (other,self,"HUN_2615_Abel_HelloYes_Info_15_01"); //Dobra, zrobi� to.
	AI_Output (self, other,"HUN_2615_Abel_Hello_Yes_Info_06_02"); //To co tu jeszcze robisz?
	AI_Output (self, other,"HUN_2615_Abel_Hello_Yes_Info_06_03"); //Jakby� nie wiedzia�, g�owa to zgrubienie na ko�cu szyi...
	AI_Output (other,self,"HUN_2615_Abel_HelloYes_Info_15_04"); //Wr�c� szybciej, ni� my�lisz.

	Log_CreateTopic(CH1_Rbl_AbelHead, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_AbelHead, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_AbelHead, "Abel, stra�nik Obozu Rebeliant�w, wpu�ci mnie, jak uwolni� �wiat od niejakiego Z�ego. Musz� poszuka� patrolu czerwonych i zabi� Z�ego - dowodem ma by� jego g�owa.");

	Info_ClearChoices(DIA_HUN_2615_Abel_Hello);
	AI_RemoveWeapon (self);
	B_StopProcessInfos(self);
	AI_GotoWP(other, "OW_PATH_OC_NC4");
};

// ------------------No----------------

FUNC VOID HUN_2615_Abel_Hello_No()
{
	AI_Output (other,self,"HUN_2615_Abel_Hello_No_Info_15_01"); //Mo�e innym razem.
	AI_Output (self, other,"HUN_2615_Abel_Hello_No_Info_06_02"); //Wr��, jak zmienisz zdanie, ja si� st�d nie ruszam.
	
   Info_ClearChoices (DIA_HUN_2615_Abel_Hello);
	B_StopProcessInfos	(self);
};

var int head_yes;
var int head_no;

INSTANCE DIA_HUN_2615_Abel_SlyKill (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 3;
	condition		= DIA_HUN_2615_Abel_SlyKill_Condition;
	information		= DIA_HUN_2615_Abel_SlyKill_Info;
	permanent		= 1;
	important		= 1;
	description		= "Zabi�em Z�ego."; 
};

FUNC INT DIA_HUN_2615_Abel_SlyKill_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(abel_ok==TRUE)&&(head_yes==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_2615_Abel_SlyKill_Info()
{
	var C_NPC Sly; 
	Sly = Hlp_GetNpc(STT_315_Sly);
   
	if(Npc_IsDead(Sly))
	{
		Party_RemoveNpc(hank);
		Party_RemoveNpc(rodney);
		Party_RemoveNpc(angus);

		AI_Output (other, self,"DIA_HUN_2615_Abel_SlyKill_15_01"); //Zabi�em Z�ego.
		AI_Output (self, other,"DIA_HUN_2615_Abel_SlyKill_06_02"); //To �wietnie. A gdzie trofeum?
      
		if (Npc_HasItems(other, sly_head) == 1)
		{
			head_yes = TRUE;
			B_GiveXP(250);
         
			AI_Output (other, self,"DIA_HUN_2615_Abel_SlyKill_15_03"); //Prosz� bardzo. Cholera, zachlapa�em sobie spodnie...
			
         B_GiveInvItems (other, self, sly_head,1);
			
         AI_Output (self, other,"DIA_HUN_2615_Abel_SlyKill_06_04"); //Po �mierci wygl�da jeszcze paskudniej.
			AI_Output (self, other,"DIA_HUN_2615_Abel_SlyKill_06_05"); //W porz�dku, zaprowadz� Ci� do Cavalorna. 
			AI_Output (self, other,"DIA_HUN_2615_Abel_SlyKill_06_06"); //Chod� za mn�.
			
         B_StopProcessInfos(self);
		}
		else
		{
			AI_Output (other, self,"DIA_HUN_2615_Abel_SlyKill_15_07"); //Cholera. Wiedzia�em, �e o czym� zapomnia�em!
			AI_Output (self, other,"DIA_HUN_2615_Abel_SlyKill_06_08"); //Nie ma g�owy, nie ma przej�cia.
			
         if (head_no==FALSE)
			{
				head_no = TRUE;
				B_LogEntry(CH1_Rbl_AbelHead, "Zabi�em Z�ego, ale zapomnia�em o g�owie. Mam nadziej�, �e wilki jeszcze co� zostawi�y...");
			};
         
			B_StopProcessInfos(self);
			AI_GotoWP(other, "OW_PATH_OC_NC4");
		};
	}
	else
	{
		AI_DrawWeapon (self);
      
		AI_Output (other, self,"DIA_HUN_2615_Abel_Hello_15_17"); //Ja...
		AI_Output (self, other,"DIA_HUN_2615_Abel_Hello_06_18"); //Won!	
		
      AI_RemoveWeapon (self);
		AI_GotoWP(other, "OW_PATH_OC_NC4");		
		B_StopProcessInfos(self);
	};
};

INSTANCE DIA_HUN_2615_Abel_SlyKill1 (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 4;
	condition		= DIA_HUN_2615_Abel_SlyKill1_Condition;
	information		= DIA_HUN_2615_Abel_SlyKill1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_2615_Abel_SlyKill1_Condition()
{
	if (head_yes==TRUE)&&(Npc_GetDistToWP(self,"PATH_OC_NC_3")<200)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_2615_Abel_SlyKill1_Info()
{
	AI_Output (self, other,"DIA_HUN_2615_Abel_SlyKill1_06_01"); //Tylko pami�taj - Cavalorn lubi konkrety.
	AI_Output (other, self,"DIA_HUN_2615_Abel_SlyKill1_15_02"); //Bez obaw, ja te�.
	AI_Output (self, other,"DIA_HUN_2615_Abel_SlyKill1_06_03"); //Bywaj.

	Log_SetTopicStatus(CH1_Rbl_AbelHead, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_AbelHead, "Przynios�em Ablowi g�ow� Z�ego. Ubabra�em sobie spodnie, ale przynajmniej spotkam si� z Cavalornem.");
	Npc_ExchangeRoutine(self,"start");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Abel_Attack (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 11;
	condition		= DIA_Abel_Attack_Condition;
	information		= DIA_Abel_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Abel_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_Attack_Info()
{
	AI_Output (self, other, "DIA_Abel_Attack_11_01"); //Nigdy Ci nie ufa�em, parszywy piracie!
	AI_Output (self, other, "DIA_Abel_Attack_11_02"); //Spr�buj zata�czy� ze mn�...
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

INSTANCE DIA_Abel_Guard (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 12;
	condition		= DIA_Abel_Guard_Condition;
	information		= DIA_Abel_Guard_Info;
	permanent		= 1;
	important		= 0;
	description		= "Jak tam warta?"; 
};

FUNC INT DIA_Abel_Guard_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_2615_Abel_SlyKill1))
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_Guard_Info()
{
	AI_Output (other, self, "DIA_Abel_Guard_15_01"); //Jak tam warta?
	AI_Output (self, other, "DIA_Abel_Guard_11_02"); //Id� pownerwia� kogo� innego!
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Abel_Spy (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 13;
	condition		= DIA_Abel_Spy_Condition;
	information		= DIA_Abel_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz st�d dobry widok."; 
};

FUNC INT DIA_Abel_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_Spy_Info()
{
	spy_count = spy_count + 1;
	AI_Output (other, self, "DIA_Abel_Spy_15_01"); //Masz st�d dobry widok.
	AI_Output (self, other, "DIA_Abel_Spy_07_02"); //I co z tego?
	AI_Output (other, self, "DIA_Abel_Spy_15_03"); //Nic, tak sobie pomy�la�em...
	AI_Output (self, other, "DIA_Abel_Spy_07_04"); //G�wno mnie obchodzi, co sobie pomy�la�e�.
	AI_Output (self, other, "DIA_Abel_Spy_07_05"); //Nie stoj� tu po to, by wys�uchiwa� Twoich przemy�le�. Zejd� mi z oczu!
   
	B_LogEntry(CH2_Rbl_Spy, "Z Ablem sobie nie pogada�em. Mo�e ma powody, �eby mnie sp�awi�?");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od Ciebie chcia�.
		B_LogEntry(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_Abel_Spy1 (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 14;
	condition		= DIA_Abel_Spy1_Condition;
	information		= DIA_Abel_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dzia�o si� ostatnio co� ciekawego?"; 
};

FUNC INT DIA_Abel_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_Abel_Spy1_15_01"); //Dzia�o si� ostatnio co� ciekawego?
	AI_Output (self, other, "DIA_Abel_Spy1_07_02"); //Pr�cz burdy w knajpie raczej nic.
	AI_Output (self, other, "DIA_Abel_Spy1_07_03"); //Chocia�... Ostatnio Tony chodzi jak ze sraczk� w krzaki. M�wi, �e to przez pomyje Snafa...
	AI_Output (other, self, "DIA_Abel_Spy1_15_04"); //Uwa�aj na siebie.
	AI_Output (self, other, "DIA_Abel_Spy1_07_05"); //Ty te� piracie.
	
   B_LogEntry(CH2_Rbl_Spy, "Abel wspomnia� co� o cz�stych wyj�ciach Toniego w krzaki.");
	
   if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta�, nie daj mu czeka�.
		B_LogEntry(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};
   
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_HUN_2615_Abel_Stew (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 12;
	condition		= DIA_HUN_2615_Abel_Stew_Condition;
	information		= DIA_HUN_2615_Abel_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Powiniene� co� zje��, mam pyszny gulasz."; 
};

FUNC INT DIA_HUN_2615_Abel_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_2615_Abel_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_HUN_2615_Abel_Stew_15_01"); //Powiniene� co� zje��, mam pyszny gulasz.
	AI_Output (self, other, "DIA_HUN_2615_Abel_Stew_11_02"); //Uwielbiam potrawki Snafa! Jakby co� Ci zosta�o, to wiesz, gdzie mnie szuka�.
	AI_Output (other, self, "DIA_HUN_2615_Abel_Stew_15_03"); //Wiem, ale musz� rozda� wszystkie porcje.
	AI_Output (self, other, "DIA_HUN_2615_Abel_Stew_11_04"); //Nie ma sprawy. Pyszka...
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Abel uwielbia potrawki Snafa, c� kwestia gustu, kaza� mi przynie�� dla niego nadwy�k�."); 
};

INSTANCE DIA_HUN_2615_Abel_StewBonus (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 12;
	condition		= DIA_HUN_2615_Abel_StewBonus_Condition;
	information		= DIA_HUN_2615_Abel_StewBonus_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam tu dodatkow� porcj�."; 
};

FUNC INT DIA_HUN_2615_Abel_StewBonus_Condition()
{
	//to do snaf statement
	if (Npc_KnowsInfo (hero, DIA_RBL_581_Snaf_Stew))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	&& (Npc_KnowsInfo (hero, DIA_HUN_2615_Abel_Stew))//Orc:Fix
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_2615_Abel_StewBonus_Info()
{
	B_GiveXP(50);	
	fox_Stew = fox_Stew + 1;
	AI_Output (other, self, "DIA_HUN_2615_Abel_StewBonus_15_01"); //Mam tu dodatkow� porcj�.
	AI_Output (self, other, "DIA_HUN_2615_Abel_StewBonus_11_02"); //Dawaj, a� mi �lina cieknie...
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Porcj� Snafa odda�em Ablowi."); 
};

INSTANCE DIA_Abel_SpyKill (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 15;
	condition		= DIA_Abel_SpyKill_Condition;
	information		= DIA_Abel_SpyKill_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Abel_SpyKill_Condition()
{
	var C_NPC tony; tony = Hlp_GetNpc(RBL_2604_Tony);

	if (tony_spy >= 17)&&(Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_IsDead(tony))
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_SpyKill_Info()
{
	var C_NPC fox; fox = Hlp_GetNpc(RBL_2614_FOX);
	var C_NPC swistak; swistak = Hlp_GetNpc(HUN_309_Whistler);
	var C_NPC qin; qin = Hlp_GetNpc(HUN_858_Quentin);
	var C_NPC fin; fin = Hlp_GetNpc(RBL_331_FINGERS);
	var C_NPC aidan; aidan = Hlp_GetNpc(HUN_859_AIDAN);

	Npc_ExchangeRoutine	(self,"MOURDER");
	Npc_ClearAiQueue(fox);		
	Npc_ExchangeRoutine	(fox,"MOURDER");
	Npc_ClearAiQueue(swistak);		
	Npc_ExchangeRoutine	(swistak,"MOURDER");
	Npc_ClearAiQueue(qin);		
	Npc_ExchangeRoutine	(qin,"MOURDER");
	Npc_ClearAiQueue(fin);		
	Npc_ExchangeRoutine	(fin,"MOURDER");
	Npc_ClearAiQueue(aidan);		
	Npc_ExchangeRoutine	(aidan,"MOURDER");
	
/***************************	
	wp/fp
	
	FIN_M
	FOX_M
	ABEL_M
	QIN_M
	SWISTAK_M
	AIDAN_M
	TONY_M
*************************************/

	tony_spy = tony_spy + 1;//18
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_DrawWeapon (self);

	AI_Output (self, other, "DIA_Abel_SpyKill_07_01"); //Morderca!
	AI_Output (other, self, "DIA_Abel_SpyKill_15_02"); //To nie tak jak my�lisz...
	AI_Output (self, other, "DIA_Abel_SpyKill_07_03"); //Nie jestem idiot�.
	AI_Output (self, other, "DIA_Abel_SpyKill_07_04"); //Alarm! Do mnie!

	B_LogEntry(CH2_Rbl_Spy, "No to mam przechlapane.");

	B_StopProcessInfos(self);

	/***********************
	Niech si� ch�opaki zbior� w jednym miejscu, �eby wyda� wyrok
	************************/

	AI_GotoWP(self, "ABEL_M");
	AI_GotoWP(fox, "FOX_M");
	AI_GotoWP(swistak, "SWISTAK_M");
	AI_GotoWP(qin, "QIN_M");
	AI_GotoWP(fin, "FIN_M");
	AI_GotoWP(aidan, "AIDAN_M");
};

INSTANCE DIA_Abel_SpyKillEnd (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 16;
	condition		= DIA_Abel_SpyKillEnd_Condition;
	information		= DIA_Abel_SpyKillEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Abel_SpyKillEnd_Condition()
{
	if (tony_spy >= 18)&&(Npc_GetDistToNpc(self,hero) < 3000)&&(Npc_KnowsInfo (hero, DIA_Abel_SpyKill))
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_SpyKillEnd_Info()
{
	var C_NPC fox; fox = Hlp_GetNpc(RBL_2614_FOX);

	tony_spy = tony_spy + 1;//19
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc (self, other);
   
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_01"); //Od pocz�tku �mierdzia�e� mi szpiclem stra�nik�w!
	AI_Output (other, self, "DIA_Abel_SpyKillEnd_15_02"); //Co ty pieprzysz? Co si� sta�o?
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_03"); //Jak to co si� sta�o? Zabi�e� Toniego!
	AI_Output (other, self, "DIA_Abel_SpyKillEnd_15_04"); //To jaka� pomy�ka...
	
   if (Npc_KnowsInfo(other,DIA_Tony_SecretsMeet))
	{
		AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_05"); //Aidan widzia�, jak spotka�e� si� z Tonym i zabi�e� go z zimn� krwi�!
	};
   
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_06"); //Wiemy co si� sta�o! Nie wy�gasz si�.
	AI_Output (other, self, "DIA_Abel_SpyKillEnd_15_07"); //Zawo�ajcie Cavalorna, wykonuj� jego rozkazy.
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_08"); //Cavalorna nie ma w obozie. Zdaje si�, �e masz pecha, morderco!
	AI_Output (other, self, "DIA_Abel_SpyKillEnd_15_09"); //Co ze mn� zrobicie?
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_10"); //G��bia! Jaka jest wasza decyzja? Fox?
	AI_TurnToNpc (fox, other);
   
   B_StopProcessInfos(self);
};

INSTANCE DIA_Abel_SpyKillEnd2 (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 16;
	condition		= DIA_Abel_SpyKillEnd2_Condition;
	information		= DIA_Abel_SpyKillEnd2_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Abel_SpyKillEnd2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_SpyKillEnd))&&(Npc_GetDistToNpc(self,hero) < 3000)
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_SpyKillEnd2_Info()
{
	var C_NPC swistak; swistak = Hlp_GetNpc(HUN_309_Whistler);
   
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_12"); //�wistak?
   
	AI_TurnToNpc (self, swistak);
	AI_TurnToNpc (swistak, other);
   B_StopProcessInfos(self);
};

INSTANCE DIA_Whistler_SpyKillEnd (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 16;
	condition		= DIA_Whistler_SpyKillEnd_Condition;
	information		= DIA_Whistler_SpyKillEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Whistler_SpyKillEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Abel_SpyKillEnd2))&&(Npc_GetDistToNpc(self,hero) < 3000)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_SpyKillEnd_Info()
{
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_13"); //Szkoda, ch�opak zna� si� na dobrym or�u. G��bia...
   B_StopProcessInfos	(self);
};
	
INSTANCE DIA_Abel_SpyKillEnd3 (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 16;
	condition		= DIA_Abel_SpyKillEnd3_Condition;
	information		= DIA_Abel_SpyKillEnd3_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Abel_SpyKillEnd3_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_SpyKillEnd))&&(Npc_GetDistToNpc(self,hero) < 4000)
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_SpyKillEnd3_Info()
{
	var C_NPC qin; qin = Hlp_GetNpc(HUN_858_Quentin);
   
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_14"); //Quentin?
   
	AI_TurnToNpc (self, qin);
	AI_TurnToNpc (qin, other);
   B_StopProcessInfos(self);
};
	
INSTANCE DIA_Quentin_SpyKillEnd (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 16;
	condition		= DIA_Quentin_SpyKillEnd_Condition;
	information		= DIA_Quentin_SpyKillEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Quentin_SpyKillEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Abel_SpyKillEnd3))&&(Npc_GetDistToNpc(self,hero) < 4000)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_SpyKillEnd_Info()
{
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_15"); //Poczekajmy na Cavalorna, niech on zadecyduje. Poza tym ch�opak ma jaja, w�tpi�, �e pracuje dla Gomeza. Jestem przeciw.
   B_StopProcessInfos(self);
};

INSTANCE DIA_Abel_SpyKillEnd4 (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 16;
	condition		= DIA_Abel_SpyKillEnd4_Condition;
	information		= DIA_Abel_SpyKillEnd4_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Abel_SpyKillEnd4_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_SpyKillEnd))&&(Npc_GetDistToNpc(self,hero) < 5000)
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_SpyKillEnd4_Info()
{
	var C_NPC fin; fin = Hlp_GetNpc(RBL_331_FINGERS);
   
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_16"); //R�czka?
   
	AI_TurnToNpc (self, fin);	
	AI_TurnToNpc (fin, other);
   B_StopProcessInfos(self);
};

INSTANCE DIA_Fingers_SpyKillEnd (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 16;
	condition		= DIA_Fingers_SpyKillEnd_Condition;
	information		= DIA_Fingers_SpyKillEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Fingers_SpyKillEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Abel_SpyKillEnd4))&&(Npc_GetDistToNpc(self,hero) < 5000)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_SpyKillEnd_Info()
{
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_17"); //Obrazi� mnie! Zniszczy� mi p�ot! G��bia!
   B_StopProcessInfos(self);
};
	
INSTANCE DIA_Abel_SpyKillEnd5 (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 16;
	condition		= DIA_Abel_SpyKillEnd5_Condition;
	information		= DIA_Abel_SpyKillEnd5_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Abel_SpyKillEnd5_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_SpyKillEnd))&&(Npc_GetDistToNpc(self,hero) < 6000)
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_SpyKillEnd5_Info()
{
	var C_NPC aidan; aidan = Hlp_GetNpc(HUN_859_AIDAN);
   
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_18"); //Aidan?
   
	AI_TurnToNpc (self, aidan);
	AI_TurnToNpc (aidan, other);
   B_StopProcessInfos(self);
};
	
INSTANCE DIA_Aidan_SpyKillEnd (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 16;
	condition		= DIA_Aidan_SpyKillEnd_Condition;
	information		= DIA_Aidan_SpyKillEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Aidan_SpyKillEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Abel_SpyKillEnd5))&&(Npc_GetDistToNpc(self,hero) < 6000)
	{
		return 1;
	};
};

FUNC VOID DIA_Aidan_SpyKillEnd_Info()
{
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_19"); //Quentin ma racj�. Ka�dy ma prawo do obrony. Poczekajmy na Cavalorna.
   B_StopProcessInfos(self);
};

INSTANCE DIA_Abel_SpyKillEnd6 (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 16;
	condition		= DIA_Abel_SpyKillEnd6_Condition;
	information		= DIA_Abel_SpyKillEnd6_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Abel_SpyKillEnd6_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Aidan_SpyKillEnd))&&(Npc_GetDistToNpc(self,hero) < 6000)
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_SpyKillEnd6_Info()
{
   var C_NPC fox; fox = Hlp_GetNpc(RBL_2614_FOX);
	var C_NPC swistak; swistak = Hlp_GetNpc(HUN_309_Whistler);
	var C_NPC qin; qin = Hlp_GetNpc(HUN_858_Quentin);
	var C_NPC fin; fin = Hlp_GetNpc(RBL_331_FINGERS);
	var C_NPC aidan; aidan = Hlp_GetNpc(HUN_859_AIDAN);
   
   AI_TurnToNpc (self, hero);
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_20"); //Nie ma sensu czeka�! Jest winien jak jasna cholera! Cztery do dw�ch, czyli mamy wi�kszo��.
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_21"); //Nikt jeszcze nie wyszed� ca�o z G��bi. To b�dzie lepsze ni� stryczek.
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_22"); //Oby szczury si� Tob� ud�awi�y.
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_23"); //Mam nadziej�, �e ju� wi�cej nie zobacz� Twojej mordy.
	AI_Output (other, self, "DIA_Abel_SpyKillEnd_15_24"); //Niech was wszystkich szlag trafi!
	
   Log_SetTopicStatus(CH2_Rbl_Spy, LOG_FAILED);
	B_LogEntry(CH2_Rbl_Spy, "No to �adnie. Czeka mnie podr� w jedn� stron� do G��bi - kopalni rudy w obozie rebeliant�w. Tony nie �yje, wi�c szpiega ju� nie ma, ale nie zdo�a�em spotka� si� z Hrabi�. Akurat teraz Cavalorn musia� znikn��...");
	
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_ExchangeRoutine(fox,"START");
	Npc_ExchangeRoutine(swistak,"START");
	Npc_ExchangeRoutine(qin,"START");
	Npc_ExchangeRoutine(fin,"START");	
	Npc_ExchangeRoutine(aidan,"START");

	AI_GotoWP(hero, "PRISON_GO");
};

INSTANCE DIA_Abel_ReturnFromDeep (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 17;
	condition		= DIA_Abel_ReturnFromDeep_Condition;
	information		= DIA_Abel_ReturnFromDeep_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Abel_ReturnFromDeep_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Abel_SpyKillEnd6))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_ReturnFromDeep_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc (self, other);
	
   AI_Output (self, other, "DIA_Abel_ReturnFromDeep_07_01"); //Co Ty tu robisz?!
	AI_Output (other, self, "DIA_Abel_ReturnFromDeep_15_02"); //Zejd� mi z drogi sukinsynie!
	
   AI_DrawWeapon (self);
	
   AI_Output (self, other, "DIA_Abel_ReturnFromDeep_07_03"); //Nie wejdziesz do obozu, chyba, �e po moim trupie!
	AI_Output (other, self, "DIA_Abel_ReturnFromDeep_15_04"); //To akurat da si� za�atwi�.
	
   AI_DrawWeapon (other);
	
   AI_Output (self, other, "DIA_Abel_ReturnFromDeep_07_05"); //Jak wydosta�e� si� z G��bi?
	AI_Output (other, self, "DIA_Abel_ReturnFromDeep_15_06"); //Nie twoja sprawa. Zejd� mi z drogi, musz� porozmawia� z Cavalornem.
	
   AI_RemoveWeapon (self);
   
	AI_Output (self, other, "DIA_Abel_ReturnFromDeep_07_07"); //Cholera, a jednak to prawda.
	AI_Output (self, other, "DIA_Abel_ReturnFromDeep_07_08"); //Cavalorn wr�ci� nied�ugo po tym, jak Ci�... skazali�my. Zmiesza� nas z b�otem...
	AI_Output (self, other, "DIA_Abel_ReturnFromDeep_07_09"); //Wybacz... �le ci� os�dzi�em. Teraz chcia�em tylko sprawdzi�, czy i Cavalorn m�wi� prawd�.
	AI_Output (other, self, "DIA_Abel_ReturnFromDeep_15_10"); //Cz�owieku, czy ty komu� ufasz na tym �wiecie?!
	AI_Output (self, other, "DIA_Abel_ReturnFromDeep_07_11"); //Tak� ju� mam natur�. Wybaczysz mi?
	
   AI_RemoveWeapon (other);
	
   AI_Output (other, self, "DIA_Abel_ReturnFromDeep_15_12"); //Chyba nie mam wyboru. By�o min�o. Musz� pogada� z Cavalornem.
	AI_Output (self, other, "DIA_Abel_ReturnFromDeep_07_13"); //R�wny z Ciebie ch�op - jak na pirata oczywi�cie.
	AI_Output (self, other, "DIA_Abel_ReturnFromDeep_07_14"); //We� ten pier�cie�, to wszystko co mam.

	CreateInvItems(self, Schutzring_Geschosse1, 1);
	B_GiveInvItems(self, other,Schutzring_Geschosse1, 1);
   
   Log_SetTopicStatus(CH2_NON_Deep, LOG_SUCCESS);
   B_LogEntry(CH2_NON_Deep, "Abel si� zdziwi�, �e wydosta�em si� z G��bi i w ko�cu mi uwierzy�, �e wykonywa�em zlecenie Cavalorna. W przeprosiny da� mi pier�cie�, mam nadziej�, �e podobna sytuacja si� nigdy nie powt�rzy.");

	AI_Output (other, self, "DIA_Abel_ReturnFromDeep_15_15"); //W porz�dku. Bywaj.
	B_StopProcessInfos(self);
};

/*********************************

SIDE QUESTS

***********************************/

INSTANCE DIA_Abel_Martin (C_INFO)
{
	npc				= HUN_2615_Abel;
	nr				= 20;
	condition		= DIA_Abel_Martin_Condition;
	information		= DIA_Abel_Martin_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kiedy ostatnio widzia�e� Martina?"; 
};

FUNC INT DIA_Abel_Martin_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_FISK_MartinRing))&&(Help_Martin == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Abel_Martin_Info()
{
	AI_Output (other, self, "DIA_Abel_Martin_15_01"); //Kiedy ostatnio widzia�e� Martina?
	AI_Output (self, other, "DIA_Abel_Martin_07_02"); //Kilka dni temu przechodzi� przez bram�. Mia� �uk, wi�c pewnie szed� na polowanie.
	AI_Output (other, self, "DIA_Abel_Martin_15_03"); //By� sam?
	AI_Output (self, other, "DIA_Abel_Martin_07_04"); //I tak, i nie.
	AI_Output (other, self, "DIA_Abel_Martin_15_05"); //To znaczy?
	AI_Output (self, other, "DIA_Abel_Martin_07_06"); //Wydaje mi si�, �e szed� za nim R�czka. Udawa�, �e interesuje si� czym� innym, ale ja jestem wyczulony na z�odziei.
	AI_Output (self, other, "DIA_Abel_Martin_07_07"); //Martinowi co� zgin�o?
	AI_Output (other, self, "DIA_Abel_Martin_15_08"); //Nie, nic. Dzi�ki.
	
   B_LogEntry(CH2_RBL_Feelings, "Abel widzia� jak R�czka �ledzi� Martina. To ju� co�.");

	B_fingers_proofs();
};
