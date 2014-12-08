
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Hark_Exit (C_INFO)
{
	npc			= RBL_2618_HARK;
	nr			= 999;
	condition	= DIA_Hark_Exit_Condition;
	information	= DIA_Hark_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hark_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Hark_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Hark_Hello (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 1;
	condition		= DIA_Hark_Hello_Condition;
	information		= DIA_Hark_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co porabiasz?"; 
};

FUNC INT DIA_Hark_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Hark_Hello_Info()
{
	AI_Output (other, self, "DIA_Hark_Hello_15_01"); //Co porabiasz?
	AI_Output (self, other, "DIA_Hark_Hello_11_02"); //Pij�. A bo co?
	AI_Output (other, self, "DIA_Hark_Hello_15_03"); //Tak tylko pytam.
	AI_Output (self, other, "DIA_Hark_Hello_11_04"); //Postaw piwo to pogadamy.
	
   Log_CreateTopic(CH1_Rbl_Hark, LOG_MISSION);
	B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Hark, "Miejscowy �ul imieniem Hark powiedzia�, �e jak postawi� mu piwo to b�dzie mia� do mnie spraw�. Jedno piwo w t�, jedno w tam�, chyba nic nie strac�?");
};

var int fight_with_Hark;

INSTANCE DIA_Hark_What (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 2;
	condition		= DIA_Hark_What_Condition;
	information		= DIA_Hark_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Twoje zdrowie."; 
};

FUNC INT DIA_Hark_What_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Hark_Hello))&&((NPC_HasItems(other,ItFobeer)>=1))
	{ 
		return TRUE; 
	};
};

FUNC VOID DIA_Hark_What_Info()
{
	hark_trial = 0;
	Npc_SetAivar(self,AIV_WASDEFEATEDBYSC,  FALSE);	Npc_SetAivar(self,AIV_HASDEFEATEDSC,  FALSE);
	B_GiveXP(50);
   
	AI_Output (other, self, "DIA_Hark_What_15_01"); //Twoje zdrowie.
	AI_Output (self, other, "DIA_Hark_What_11_02"); //Mo�e by� nawet zdrowie Rhobara, ka�da okazja jest dobra, �eby si� napi�...
	
   if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};	
	
   B_GiveInvItems (other,self,ItFobeer,1);
	AI_UseItem (self,ItFobeer);
	
   AI_Output (self, other, "DIA_Hark_What_11_03"); //Od razu lepiej. Piwo to nektar bog�w...
	AI_Output (other, self, "DIA_Hark_What_15_04"); //Co to za sprawa?
	AI_Output (self, other, "DIA_Hark_What_11_05"); //Jaka sprawa?
	AI_Output (other, self, "DIA_Hark_What_15_06"); //M�wi�e�, �e pogadasz ze mn� jak postawi� Ci piwo.
	AI_Output (self, other, "DIA_Hark_What_11_07"); //Przecie� gadamy.
	AI_Output (other, self, "DIA_Hark_What_15_08"); //Cholera straci�em przez Ciebie piwo!
	
   B_LogEntry(CH1_Rbl_Hark, "Przynios�em Harkowi piwo, jak si� okaza�o niepotrzebnie...");
	
   AI_Output (self, other, "DIA_Hark_What_11_00"); //Ale za to zyska�e� przyjaciela.
	AI_Output (other, self, "DIA_Hark_What_15_10"); //Raczej pijaka i z�odzieja.
	AI_Output (self, other, "DIA_Hark_What_11_11"); //Uwa�aj na s�owa ch�opcze! Nie takich jak Ty bra�em na sztych miecza...
	AI_Output (self, other, "DIA_Hark_What_11_12"); //(bekni�cie)

	Info_ClearChoices(DIA_Hark_What);
	Info_AddChoice	 (DIA_Hark_What, "Sam si� prosisz o lanie!" ,DIA_Hark_What_Yes);
	Info_AddChoice	 (DIA_Hark_What, "Nie jestem dzi� w nastroju do bitki." ,DIA_Hark_What_No);
};

func void DIA_Hark_What_Yes()
{
	AI_Output (other, self,"DIA_Hark_What_Yes_15_00"); //Sam si� prosisz o lanie!
	AI_Output (self, other,"DIA_Hark_What_Yes_11_01"); //W ko�cu kto� z jajami...
	
   B_LogEntry(CH1_Rbl_Hark, "Hark a� prosi si� o porz�dne lanie!");
	hark_trial = 5;
   fight_with_Hark = true;
	Info_ClearChoices(DIA_Hark_What);
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

func void DIA_Hark_What_No()
{
	hark_trial = 1;
   
	AI_Output (other, self,"DIA_Hark_What_No_15_00"); //Nie jestem dzi� w nastroju do bitki.
	AI_Output (self, other,"DIA_Hark_What_No_11_01"); //Szkoda. Rozochoci�e� mnie. Przyda�oby si� skopa� czyje� dupsko...
	AI_Output (self, other,"DIA_Hark_What_No_11_02"); //Mam pomys�! 
	AI_Output (self, other,"DIA_Hark_What_No_11_03"); //S�uchaj jest tu jeden kole�, kt�ry dzia�a mi na nerwy. Nazywa si� Kufel.
	AI_Output (self, other,"DIA_Hark_What_No_11_04"); //Z ch�ci� bym go poturbowa�, ale Cavalorn nie lubi jak wszczyna si� burdy.
	AI_Output (self, other,"DIA_Hark_What_No_11_05"); //Mo�e by� mi pom�g�?
	AI_Output (other, self,"DIA_Hark_What_No_15_06"); //Niby jak?
	AI_Output (self, other,"DIA_Hark_What_No_11_07"); //Co� wymy�lisz. Pogadaj z tym frajerem.
	AI_Output (self, other,"DIA_Hark_What_No_11_08"); //Aha. Kufel zawsze by� wra�liwy na punkcie swojej rodziny. Zwyzywaj jego mamu�k� od kurew, to powinno zach�ci� go do bitki.

	B_LogEntry(CH1_Rbl_Hark, "Nie chce mi si� walczy� z Harkiem. Jednak pijak jest wyra�nie rozochocony do bitki. Powiedzia�, �e nie lubi kolesia o imieniu Kufel. Nie mo�e go jednak sam prowokowa�, bo Cavalorn nie toleruje burd. Pogadam z tym Kuflem i zobacz�, co da si� zrobi�.");

	Info_ClearChoices(DIA_Hark_What);	
};

INSTANCE DIA_Hark_Again (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 3;
	condition		= DIA_Hark_Again_Condition;
	information		= DIA_Hark_Again_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kufel powiedzia�, �e Tw�j stary wola� owce."; 
};

FUNC INT DIA_Hark_Again_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Cup_What))&&(hark_trial == 2)
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Hark_Again_Info()
{
	hark_trial = hark_trial  +1;//3
   
	AI_Output (other, self, "DIA_Hark_Again_15_01"); //Kufel powiedzia�, �e Tw�j stary wola� owce.
	AI_Output (self, other, "DIA_Hark_Again_11_02"); //A to parszywy ochlej!
	AI_Output (self, other, "DIA_Hark_Again_11_03"); //Powiedz mu, �e to pewnie po tatusiu �mierdzi i wygl�da jak ork.
	
   B_LogEntry(CH1_Rbl_Hark, "Hark powiedzia�, �e Kufel po tatusiu �mierdzi i wygl�da jak ork.");
};

INSTANCE DIA_Hark_Again1 (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 3;
	condition		= DIA_Hark_Again1_Condition;
	information		= DIA_Hark_Again1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hark_Again1_Condition()
{
	var C_NPC cup; cup = Hlp_GetNpc(RBL_2619_Cup);

	if (Npc_KnowsInfo(other,DIA_Cup_Again)) && (hark_trial == 4) && (Npc_GetAivar(cup, AIV_BEENATTACKED) == TRUE)
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Hark_Again1_Info()
{
	B_GiveXP(150);
	hark_trial = hark_trial  +1;//5
   
	AI_Output (self, other, "DIA_Hark_Again1_11_01"); //Sprowokowanie tego idioty nie by�o takie trudne.
	AI_Output (other, self, "DIA_Hark_Again1_15_02"); //Faktycznie Kufel jest do�� wra�liwy na punkcie rodziny.
	AI_Output (self, other, "DIA_Hark_Again1_11_03"); //A nie m�wi�em?
	AI_Output (self, other, "DIA_Hark_Again1_11_04"); //Dzi�ki za rozrywk� przyjacielu.
	AI_Output (other, self, "DIA_Hark_Again1_15_05"); //Ca�a przyjemno�� po mojej stronie.
	
   B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Hark, "Sprawa z Harkiem i Kuflem za�atwiona. Trzeba przyzna�, �e rozrywkowi ci rebelianci.");
};

INSTANCE DIA_Hark_Again2 (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 3;
	condition		= DIA_Hark_Again2_Condition;
	information		= DIA_Hark_Again2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nie uda�o mi si� sprowokowa� Kufla."; 
};

FUNC INT DIA_Hark_Again2_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Cup_What))&&(hark_trial == 10)
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Hark_Again2_Info()
{
	hark_trial = 5;//Za chuja by to nie dzia�a�o
   
	AI_Output (other, self, "DIA_Hark_Again2_15_01"); //Nie uda�o mi si� sprowokowa� Kufla.
	AI_Output (self, other, "DIA_Hark_Again2_11_02"); //Dupa jeste� i tyle. Nawet Wrz�d by sobie lepiej poradzi�.
	AI_Output (self, other, "DIA_Hark_Again2_11_03"); //No nic, zamiast Kufla mog� st�uc Ciebie. Mi tam zjedno komu spuszcz� �omot.
	
   B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_FAILED);
	B_LogEntry(CH1_Rbl_Hark, "Nie uda�o mi si� sprowokowa� Kufla i Hark si� na mnie rzuci�. Dziwni ci rebelianci...");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
	Npc_ExchangeRoutine	(self,"start");//normal routine outside tavern, too
	Npc_ExchangeRoutine	(cup,"start");//normal routine outside tavern, too
};

INSTANCE DIA_Hark_fight_in_tavern (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 7;
	condition		= DIA_Hark_fight_in_tavern_Condition;
	information		= DIA_Hark_fight_in_tavern_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Hark_fight_in_tavern_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Hark_What) && (fight_with_Hark))
	{ 
		return TRUE; 
	};
};

FUNC VOID DIA_Hark_fight_in_tavern_Info()
{
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Hark_fight_in_tavern_11_00"); //Od razu lepiej. Nie ma to, jak obi� komu� mord�.
		
      B_LogEntry(CH1_Rbl_Hark, "Przegra�em z Harkiem. No c�, zdarza si�...");
      B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_failed);
		B_StopProcessInfos(self); 
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)//pokonany
	{
		B_GiveXP (200);
		
      AI_Output (self, other, "DIA_Hark_fight_in_tavern_11_06"); //Cholera! Pokona�e� mnie!
		AI_Output (self, other, "DIA_Hark_fight_in_tavern_15_07"); //Mo�e co� z ciebie b�dzie. Zobaczymy...
		
      B_LogEntry(CH1_Rbl_Hark, "Pokona�em Harka.");
      B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_SUCCESS);
	};
};
// **************************************************

INSTANCE DIA_Hark_Plant (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 6;
	condition		= DIA_Hark_Plant_Condition;
	information		= DIA_Hark_Plant_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wiesz co to czerwony buk?"; 
};

FUNC INT DIA_Hark_Plant_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Milten_Plantsdb))
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Hark_Plant_Info()
{
	AI_Output (other, self, "DIA_Hark_Plant_15_01"); //Wiesz co to czerwony buk?
	AI_Output (self, other, "DIA_Hark_Plant_11_02"); //W �yciu o czym� takim nie s�ysza�em, a bo co?
	AI_Output (other, self, "DIA_Hark_Plant_15_03"); //Milten twierdzi co� zupe�nie innego. Zarzucasz magowi k�amstwo?
	AI_Output (self, other, "DIA_Hark_Plant_11_04"); //Nic magom do tego co m�wi�. Ani Tobie przyb��do!
	AI_Output (other, self, "DIA_Hark_Plant_15_05"); //Uwa�aj na to co m�wisz ow�osiona ma�po.
	AI_Output (self, other, "DIA_Hark_Plant_11_06"); //A co mi zrobisz? Dasz mi klapsa?

	Info_ClearChoices(DIA_Hark_Plant);
	Info_AddChoice	 (DIA_Hark_Plant, "Znowu prosisz o lanie!" ,DIA_Hark_Plant_Yes);
	Info_AddChoice	 (DIA_Hark_Plant, "Nie jestem w nastroju do bitki." ,DIA_Hark_Plant_No);
};

func void DIA_Hark_Plant_Yes()
{
	AI_Output (other, self,"DIA_Hark_Plant_Yes_15_00"); //Znowu prosisz o lanie!
	AI_Output (self, other,"DIA_Hark_Plant_Yes_11_01"); //Graj muzyczko!
	
   B_LogEntry		(CH2_RBL_Plants, "Znowu musz� spra� Harka, �eby zacz�� m�wi� do rzeczy.");
	Info_ClearChoices(DIA_Hark_What);
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

func void DIA_Hark_Plant_No()
{
	AI_Output (other, self,"DIA_Hark_Plant_No_15_00"); //Nie jestem w nastroju do bitki.
	AI_Output (self, other,"DIA_Hark_Plant_No_11_01"); //To masz pecha, bo ja jestem! Graj muzyczko!
	
   B_LogEntry		(CH2_RBL_Plants, "Znowu musz� spra� Harka, �eby zacz�� m�wi� do rzeczy.");
	Info_ClearChoices(DIA_Hark_What);
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Hark_Plant1 (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 7;
	condition		= DIA_Hark_Plant1_Condition;
	information		= DIA_Hark_Plant1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Hark_Plant1_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Hark_Plant))
	{ 
		return TRUE; 
	};
};

FUNC VOID DIA_Hark_Plant1_Info()
{
	AI_Output (self, other, "DIA_Hark_Plant1_11_01"); //Nie ma to jak ma�a rozr�ba!

	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Hark_Plant1_11_02"); //Nadal jeste� mi�tki i wolny jak ci�arny �cierwojad.
		AI_Output (other, self, "DIA_Hark_Plant1_15_03"); //Do cholery, chcia�em tylko porozmawia� o Czerwonym Buku...
		AI_Output (self, other, "DIA_Hark_Plant1_11_04"); //Przegra�e�, a ja nie mam czasu na przegranych.
		AI_Output (self, other, "DIA_Hark_Plant1_11_05"); //Poszukaj sobie czerwonego buka jak tak Ci� to interesuje. A teraz zejd� mi z oczu!
		
      B_LogEntry		(CH2_RBL_Plants, "Nie dowiedzia�em si� niczego od Harka o czerwonym buku, a przy okazji skopa� mi dup�.");	
		B_StopProcessInfos	(self); 
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)//pokonany
	{
		B_GiveXP (400);
		
      AI_Output (self, other, "DIA_Hark_Plant1_11_06"); //Stwardnia�e� ch�opcze. Zm�nia�e� i nabra�e� pewno�ci siebie, to lubi�.
		AI_Output (other, self, "DIA_Hark_Plant1_15_07"); //Do cholery chcia�em tylko porozmawia� o Czerwonym Buku...
		AI_Output (self, other, "DIA_Hark_Plant1_11_08"); //A co chcesz o nim wiedzie�? To tylko paskudne drzewo.
		AI_Output (other, self, "DIA_Hark_Plant1_15_09"); //Potrzebuj� jednego nasiona.
		AI_Output (self, other, "DIA_Hark_Plant1_11_10"); //Widz�, �e Milten znalaz� sobie nowego ch�opca na posy�ki. Powiem Ci, �e nie cierpi� mag�w.
		AI_Output (self, other, "DIA_Hark_Plant1_11_11"); //Raz przynios�em mu to cholerne nasionko bo potrzebowa�em rudy, a on sobie ubzdura�, �e b�d� robi� u niego za s�u��cego.
		AI_Output (self, other, "DIA_Hark_Plant1_11_12"); //I b�d� tu dobry dla ludzi.
		AI_Output (other, self, "DIA_Hark_Plant1_15_13"); //Nie zamierzam robi� u mag�w za dostawc� ingrediencji, mam wa�ny pow�d, �eby wkupi� si� w ich �aski.
		AI_Output (other, self, "DIA_Hark_Plant1_15_14"); //To jak, pomo�esz mi?
		AI_Output (self, other, "DIA_Hark_Plant1_11_15"); //Komu� z takim ciosem jak Tw�j pomog� za darmo. Twoje zdr�wko przyjacielu. Na pohybel suczym synom co w�adaj� magi� i my�l�, �e s� p�pkiem �wiata!
		
      CreateInvItems	(self, ItFoBeer, 2);
		B_GiveInvItems (self, other,ItFoBeer, 1);
		AI_UseItem (other,ItFobeer);
		AI_UseItem (self,ItFobeer);
		
      AI_Output (self, other, "DIA_Hark_Plant1_11_16"); //We� to ziarno i wsad� je Miltenowi w dup�. Pewnie mu si� to spodoba, he, he.
		CreateInvItems (self, ItFo_Plants_Bloodwood_01, 1);
		B_GiveInvItems (self, other, ItFo_Plants_Bloodwood_01, 1);
		
      AI_Output (other, self, "DIA_Hark_Plant1_15_17"); //Przemy�l� to. Bywaj Hark.
		
      B_LogEntry(CH2_RBL_Plants, "Mam nasienie czerwonego buka. Op�aci�o si� skopa� Harkowi dupsko.");
	};
};

// **************************************************

INSTANCE DIA_RBL_2618_HARK_Stew (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 12;
	condition		= DIA_RBL_2618_HARK_Stew_Condition;
	information		= DIA_RBL_2618_HARK_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gulasz od Snafa."; 
};

FUNC INT DIA_RBL_2618_HARK_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2618_HARK_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_RBL_2618_HARK_Stew_15_01"); //Gulasz od Snafa.
	AI_Output (self, other, "DIA_RBL_2618_HARK_Stew_11_02"); //Akurat by�em g�odny, dzi�ki.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Gulasz zaspokoi� g��d Harka."); 
};


/************************************

SIDE QUEST

************************************/

// **************************************************

INSTANCE DIA_Hark_Tooth (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 10;
	condition		= DIA_Hark_Tooth_Condition;
	information		= DIA_Hark_Tooth_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Hark_Tooth_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Pacho_HuntingFinishedOk))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Hark_Tooth_Info()
{
	AI_Output (self, other, "DIA_Hark_Tooth_11_01"); //Brawo. Pi�kna walka, a teraz oddaj mi kie�.

	Info_ClearChoices(DIA_Hark_Tooth);
	Info_AddChoice	 (DIA_Hark_Tooth, "Nie chc� k�opot�w. Zabieraj kie�." ,DIA_Hark_Tooth_Yes);
	Info_AddChoice	 (DIA_Hark_Tooth, "Obrazi�e� mnie przychodz�c tu w pojedynk�." ,DIA_Hark_Tooth_No);
};

func void DIA_Hark_Tooth_Yes()
{
	AI_Output (other, self,"DIA_Hark_Tooth_Yes_15_00"); //Nie chc� k�opot�w. Zabieraj kie�.
	
   B_GiveInvItems (other, self, ItAt_BlackWolfTeeth, 1);
	
   AI_Output (self, other,"DIA_Hark_Tooth_Yes_11_01"); //Ale z Ciebie mi�czak. Tacy jak Ty sprawiaj�, �e �ycie jest zbyt �atwe.
	AI_Output (self, other,"DIA_Hark_Tooth_Yes_11_02"); //Bywaj, frajerze.
	
   B_LogEntry		(CH2_RBL_WhiteTeeth, "Po walce zaczepi� mnie Hark. Odda�em mu kie�, nie potrzebuj� k�opot�w.");
	pacho_heroservedhark=TRUE;
	Npc_ExchangeRoutine	(self, "START");
	B_StopProcessInfos	(self); 
};

func void DIA_Hark_Tooth_No()
{
	AI_Output (other, self,"DIA_Hark_Tooth_No_15_00"); //Obrazi�e� mnie przychodz�c tu w pojedynk�.
	AI_Output (self, other,"DIA_Hark_Tooth_No_11_01"); //Taki z Ciebie chojrak? Zaraz zobaczymy jaki� twardy!
	
   B_LogEntry(CH2_RBL_WhiteTeeth, "Postawi�em si� Harkowi. Czas obi� mu porz�dnie mord�!");
	Npc_ExchangeRoutine	(self, "START");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
}; 

INSTANCE DIA_Hark_Tooth_after_fight (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 7;
	condition		= DIA_Hark_Tooth_after_fight_Condition;
	information		= DIA_Hark_Tooth_after_fight_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Hark_Tooth_after_fight_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Hark_Tooth) && (!pacho_heroservedhark))
	{ 
		return TRUE; 
	};
};

FUNC VOID DIA_Hark_Tooth_after_fight_Info()
{
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Hark_Tooth_after_fight_11_00"); //Ha, ha, ha!!! Dosta�e� niez�e baty.
      
      B_GiveInvItems (other, self, ItAt_BlackWolfTeeth, 1);
      
		AI_Output (self, other, "DIA_Hark_Tooth_after_fight_11_01"); //Dzi�ki za kie�!
		AI_Output (other, self, "DIA_Hark_Tooth_after_fight_15_02"); //Kiedy� tego po�a�ujesz...
      AI_Output (self, other, "DIA_Hark_Tooth_after_fight_11_03"); //Chyba nie wiesz, co m�wisz. Ha, ha, ha!
		
      B_LogEntry(CH2_RBL_WhiteTeeth, "Hark mnie pokona� i zabra� kie�.");	
		B_StopProcessInfos(self); 
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)//pokonany
	{
		B_GiveXP (200);
		
      AI_Output (self, other, "DIA_Hark_Tooth_after_fight_11_06"); //Cholera! Pokona�e� mnie!
		AI_Output (other, self, "DIA_Hark_Tooth_after_fight_15_07"); //A teraz zje�d�aj, �mieciu!
		AI_Output (self, other, "DIA_Hark_Tooth_after_fight_11_08"); //Dobra, dobra, spokojnie. Ju� mnie tu nie ma.
		
      B_LogEntry(CH2_RBL_WhiteTeeth, "My�l�, �e da�em Harkowi porz�dn� nauczk�.");
	};
};