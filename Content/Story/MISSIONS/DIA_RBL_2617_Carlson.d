
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Carlson_Exit (C_INFO)
{
	npc			= RBL_2617_Carlson;
	nr			= 999;
	condition	= DIA_Carlson_Exit_Condition;
	information	= DIA_Carlson_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Carlson_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Carlson_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int carlson_y;

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Carlson_Hello (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 1;
	condition		= DIA_Carlson_Hello_Condition;
	information		= DIA_Carlson_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Carlson_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 450)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlson_Hello_Info()
{
	AI_Output (self, other, "DIA_Carlson_Hello_11_01"); //Cholera, nie wygl�dasz jak ork, chocia� mord� te� masz zakazan�.
	AI_Output (other, self, "DIA_Carlson_Hello_15_02"); //Ty za to cuchniesz jak ork.
	AI_Output (self, other, "DIA_Carlson_Hello_11_03"); //Gdyby� sp�dzi� tyle czasu co ja w tych ost�pach, to nawet by� si� nie obejrza�, a mia�by� orkow� �on�!
	AI_Output (self, other, "DIA_Carlson_Hello_11_04"); //Czego tu szukasz?!
	AI_Output (other, self, "DIA_Carlson_Hello_15_05"); //Ekhm... Zbieram grzyby.
	AI_Output (self, other, "DIA_Carlson_Hello_11_06"); //Dobra wystarczy ju� tych grzeczno�ci. Do kt�rego obozu nale�ysz?

	Info_ClearChoices (DIA_Carlson_Hello);
	Info_AddChoice (DIA_Carlson_Hello, "Do Starego Obozu.", DIA_Carlson_Hello_Old);
	Info_AddChoice (DIA_Carlson_Hello, "Do Nowego Obozu.", DIA_Carlson_Hello_New);
	Info_AddChoice (DIA_Carlson_Hello, "Do Obozu Bractwa.", DIA_Carlson_Hello_Sekt);
	Info_AddChoice (DIA_Carlson_Hello, "Do Obozu Rebeliant�w.", DIA_Carlson_Hello_Rbl);
};

// ---------------------------rbl----------------------------------------

FUNC VOID DIA_Carlson_Hello_Rbl()
{
	carlson_y = TRUE;
   
	AI_Output (other, self, "DIA_Carlson_Hello_Rbl_15_01"); //Do Obozu Rebeliant�w.
	AI_Output (self, other, "DIA_Carlson_Hello_Rbl_11_02"); //A co to za ob�z?
	AI_Output (other, self, "DIA_Carlson_Hello_Rbl_15_03"); //Chyba d�ugo tu siedzisz.
	AI_Output (self, other, "DIA_Carlson_Hello_Rbl_11_04"); //No, jaki� czas. 
	AI_Output (other, self, "DIA_Carlson_Hello_Rbl_15_05"); //Rebelianci to zbieranina tych, kt�rzy maj� do�� pozosta�ych oboz�w.
	AI_Output (self, other, "DIA_Carlson_Hello_Rbl_11_06"); //Brzmi ciekawie. Mo�e powinienem si� tam wybra�...
	AI_Output (other, self, "DIA_Carlson_Hello_Rbl_15_07"); //Mog� Ci� tam zaprowadzi�.
	AI_Output (self, other, "DIA_Carlson_Hello_Rbl_11_08"); //Zastanowi� si� nad tym.
   
	Info_ClearChoices (DIA_Carlson_Hello);
};

// ------------------so----------------

FUNC VOID DIA_Carlson_Hello_Old()
{
	AI_Output (other, self, "DIA_Carlson_Hello_Old_15_01"); //Do Starego Obozu.
	AI_Output (self, other, "DIA_Carlson_Hello_Old_11_02"); //Przydupas Gomeza! 
   
	AI_DrawWeapon (self);
   
	AI_Output (self, other, "DIA_Carlson_Hello_Old_11_03"); //Dla takich jak Ty mam tylko jedno powitanie! �ryj stal!
	
   Info_ClearChoices (DIA_Carlson_Hello);
   
   Npc_ExchangeRoutine(self,"FIGHT");//ta_hostileguard �eby zawsze t�uk� dicka
	B_StartAfterDialogFight(self,other,true);
};

// ------------------no----------------

FUNC VOID DIA_Carlson_Hello_New()
{
	AI_Output (other, self, "DIA_Carlson_Hello_New_15_01"); //Do Nowego Obozu.
	AI_Output (self, other, "DIA_Carlson_Hello_New_11_02"); //Dupow�az mag�w wody! 
   
	AI_DrawWeapon (self);
   
	AI_Output (self, other, "DIA_Carlson_Hello_New_11_03"); //Nie przepadam za sprzedajnymi najmitami. Jeste�cie gorsi ni� dziwki!
   
   Info_ClearChoices (DIA_Carlson_Hello);
   
	Npc_ExchangeRoutine	(self,"FIGHT");//ta_hostileguard �eby zawsze t�uk� dicka
	B_StartAfterDialogFight(self,other,true);
};

// ------------------sekt----------------

FUNC VOID DIA_Carlson_Hello_Sekt()
{
	AI_Output (other, self, "DIA_Carlson_Hello_Sekt_15_01"); //Do Obozu Bractwa.
	AI_Output (self, other, "DIA_Carlson_Hello_Sekt_11_02"); //Kolejny �wir z Obozu Sekty! 
   
	AI_DrawWeapon (self);
   
	AI_Output (self, other, "DIA_Carlson_Hello_Sekt_11_03"); //Z przyjemno�ci� pomog� Ci spotka� si� ze �ni�cym!
   
   Info_ClearChoices (DIA_Carlson_Hello);
   
	Npc_ExchangeRoutine	(self,"FIGHT");//ta_hostileguard �eby zawsze t�uk� dicka
	B_StartAfterDialogFight(self,other,true);
};

// **************************************************

INSTANCE DIA_Carlson_CanYouTeachMe (C_INFO)
{
	npc				=  RBL_2617_Carlson;
	nr				= 4;
	condition		= DIA_Carlson_CanYouTeachMe_Condition;
	information		= DIA_Carlson_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Carlson_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Carlson_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Carlson_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Carlson_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
   AI_Output (self, other, "DIA_Carlson_CanYouTeachMe_15_02"); //Tak, mog� ci� nauczy� wykuwa� miecze. Pewnie ci si� to przyda w �yciu...
      
   Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
   B_LogEntry(GE_TeacherOW, "Carlson mo�e mnie nauczy� kowalstwa.");
};

INSTANCE DIA_Carlson_Go (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 2;
	condition		= DIA_Carlson_Go_Condition;
	information		= DIA_Carlson_Go_Info;
	permanent		= 0;
	important		= 0;
	description		= "Idziesz ze mn�?"; 
};

FUNC INT DIA_Carlson_Go_Condition()
{
	if (carlson_y == TRUE)&&(q_y==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlson_Go_Info()
{
	B_GiveXP(100);
	AI_Output (other, self, "DIA_Carlson_Go_15_01"); //Idziesz ze mn�?
	AI_Output (self, other, "DIA_Carlson_Go_11_02"); //Czemu nie. Nic mnie tu nie trzyma pr�cz tych cholernych ork�w.
	AI_Output (other, self, "DIA_Carlson_Go_15_03"); //Orkami si� nie przejmuj. Damy sobie z nimi rad�.
	AI_Output (self, other, "DIA_Carlson_Go_11_04"); //Dobra, niech b�dzie. Rozwalmy kilka orkowych �b�w po drodze.
   
	B_LogEntry		(CH1_Rbl_NewMembers, "Pomog� Carlsonowi doj�� do Obozu Rebeliant�w. Czeka nas przeprawa przez orkowe ziemie.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	B_StopProcessInfos	(self);
	//*****
	Wld_InsertNpc		(MIS_CarlsonOrcElite, "OW_PATH_012");
	Wld_InsertNpc		(OrcScoutGYD, "OW_PATH_012");
	Wld_InsertNpc		(OrcScoutGYD, "OW_PATH_012");
	orc_appear=true;
	B_ExchangeRoutine	(PIR_2600_Angus,"RICKHELP");		
	B_ExchangeRoutine	(PIR_2601_Hank,"RICKHELP");	
	B_ExchangeRoutine	(PIR_2602_rodney,"RICKHELP");	
	//On a way to Rebel Camp:
	self.flags=self.flags|NPC_FLAG_FRIEND;
};

/*****************

doda� aligatora i pirat�w.

******************/

INSTANCE DIA_Carlson_GoOut (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 3;
	condition		= DIA_Carlson_GoOut_Condition;
	information		= DIA_Carlson_GoOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlson_GoOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Carlson_Go))&&((Npc_GetDistToWP (self,"MOVEMENT_TALL_PATH_BANDITOS2") < 550 )||(Npc_GetDistToWP (self,"PATH_OC_NC_11") < 550 )||(Npc_GetDistToWP (self,"HC_WARRIOR16") < 550 ))
	{
		return 1;
	};
};

FUNC VOID DIA_Carlson_GoOut_Info()
{
	carlson_trust = TRUE;
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(250);
   
	AI_Output (other, self,"DIA_Carlson_GoOut_15_01"); //Jeste�my na miejscu. Witaj w Obozie Rebeliant�w.
	AI_Output (self, other,"DIA_Carlson_GoOut_11_02"); //Dzi�ki przyjacielu. Mam u Ciebie d�ug.
	AI_Output (self, other,"DIA_Carlson_GoOut_11_03"); //Rozejrz� si� po tym oboziku... Wygl�da ca�kiem przyjemnie.
	AI_Output (self, other,"DIA_Carlson_GoOut_11_04"); //Aha. We� t� recept�, mi si� ju� na nic nie przyda.
   
	CreateInvItems (self, Recept_ItMw_2H_Sword_01,1); //recepta na lekki miecz 2h
	B_GiveInvItems (self, other, Recept_ItMw_2H_Sword_01, 1);//jw
	B_LogEntry		(CH1_Rbl_NewMembers, "Doprowadzi�em Carlsona do obozu. Nie by�o �atwo, ale jako� poradzili�my sobie z orkami.");
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine	(self,"OR");
	B_ExchangeRoutine	(HUN_859_Aidan,"CarlsonArrived");	
	B_StopProcessInfos	(self);
	Know_Carlson=TRUE;
	
	self.flags=self.flags&~NPC_FLAG_FRIEND;
};

// **************************************************

INSTANCE DIA_RBL_2617_Carlson_Stew (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 12;
	condition		= DIA_RBL_2617_Carlson_Stew_Condition;
	information		= DIA_RBL_2617_Carlson_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zjesz gulasz?"; 
};

FUNC INT DIA_RBL_2617_Carlson_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2617_Carlson_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_RBL_2617_Carlson_Stew_15_01"); //Zjesz gulasz?
	AI_Output (self, other, "DIA_RBL_2617_Carlson_Stew_11_02"); //Jeszcze si� pytasz? Ja ca�y czas jestem g�odny!
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Carlson zjad� gulasz bez wi�kszych j�k�w."); 
}; 

INSTANCE DIA_RBL_2617_Carlson_armor (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 12;
	condition		= DIA_RBL_2617_Carlson_armor_Condition;
	information		= DIA_RBL_2617_Carlson_armor_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mi zrobi� jaki� pancerz z tej sk�ry?"; 
};

FUNC INT DIA_RBL_2617_Carlson_armor_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kira_HuntFinalEnd))&&(NPC_HasItems(other,ItAt_BlackTroSkin)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2617_Carlson_armor_Info()
{
	AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_01"); //Mo�esz mi zrobi� jaki� pancerz z tej sk�ry?
	AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_02"); //Poka� mi j�.
   
   Give_and_remove(ItAt_BlackTroSkin, 1);
   
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_03"); //Ja pierdole, przecie� to sk�ra czarnego trolla! Nie s�dzi�em, �e mo�esz zabi� takiego skurczybyka.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_04"); //Mo�emy przej�� do sedna sprawy?
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_05"); //Ach tak mog� ci wyku� pancerz, ale przys�uga za przys�ug�.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_06"); //�e co!? Znowu mam robi� za jakiego� ch�opca na posy�ki?
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_07"); //Mam ci zrobi� ten pancerz czy nie?
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_08"); //Ech... no dobra, m�w, czego chcesz.
   
   AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
   
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_09"); //To dosy� dziwna historia, a nie chc�, �eby kto� si� o tym dowiedzia�.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_10"); //Dobra, dobra, m�w o co chodzi.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_11"); //Ostatnio podpad�em Cavalornowi i do bia�ego rana kaza� mi wykuwa� bronie dla tych obibok�w.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_12"); //Po jakim� czasie chcia�em zrobi� sobie kr�tk� przerw�, wi�c poszed�em si� och�odzi� w rzece.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_13"); //Nagle, z lasu wybieg� jaki� szaleniec, zdj�� ubranie, wskoczy� do wody i pop�yn�� w moim kierunku.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_14"); //Szczeg��w nie chc� zna�.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_15"); //Tak wi�c, od razu zabi�em tego peda�a, ale niestety mia�em pecha.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_16"); //Ten pijak Leaf wszystko widzia�, wykorzysta� to i mnie teraz prze�laduje.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_17"); //��da co 5 dni ode mnie 800 bry�ek rudy, �eby nie powiedzia� wszystkim, �e si� rucha�em... z m�czyzn�.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_18"); //�e co do cholery?! Dlaczego nie wsadzisz mu top�r prosto w dup�?
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_19"); //Bardzo tego chc�, ale jak ju� m�wi�em podpad�em Cavalornowi i jak jeszcze raz nabroj�...
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_20"); //...to b�d� musia� masowa� Aidanowi �mierdz�ce stopy przez ca�y miesi�c.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_21"); //He, he, a to ci Cavalorn. By� mo�e b�dziesz niez�ym masa�yst�.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_22"); //Przesta� �artowa� i za�atw to jak najszybciej, tym lepiej b�dzie dla mnie, a teraz zostaw mnie samego.
        
   Log_CreateTopic	(CH2_RBL_armor, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_armor, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_armor, "Tego si� nie spodziewa�em, Carlsona dopad� w nocy jaki� peda�, a ten pijak Leaf wszystko widzia� i zacz�� go szanta�owa�. Powiedzia� r�wnie� jaka kara spotka Carlsona, je�li jeszcze raz nabroi. Im d�u�ej znam Koloni� Karn�, tym bardziej chc� si� znale�� od niej jak najdalej st�d. Lecz teraz musz� porozmawia� z Leafem w cztery oczy.");
}; 

// **************************************************
var int Carlson_armor;

INSTANCE DIA_RBL_2617_Carlson_Leaf_agree (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 12;
	condition		= DIA_RBL_2617_Carlson_Leaf_agree_Condition;
	information		= DIA_RBL_2617_Carlson_Leaf_agree_Info;
	permanent		= 0;
	important		= 0;
	description		= "I po sprawie."; 
};

FUNC INT DIA_RBL_2617_Carlson_Leaf_agree_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_armor2))
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2617_Carlson_Leaf_agree_Info()
{
	AI_Output (other, self, "DIA_RBL_2617_Carlson_Leaf_agree_15_01"); //I po sprawie, co z tym pancerzem?
	AI_Output (self, other, "DIA_RBL_2617_Carlson_Leaf_agree_11_02"); //Wielkie dzi�ki, naprawd� nie wiesz, jak bardzo jestem ci wdzi�czny. A co do pancerza przyjd� za kilka dni, wtedy b�dzie gotowy.
   
   Carlson_armor = B_SetDayTolerance()+3;
	
	B_LogEntry(CH2_RBL_armor, "Powinienem przyj�� za kilka dni po pancerz.");
};

//***********************************************
INSTANCE DIA_RBL_2617_Carlson_troll_armor_ready (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 5;
	condition		= DIA_RBL_2617_Carlson_troll_armor_ready_Condition;
	information		= DIA_RBL_2617_Carlson_troll_armor_ready_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RBL_2617_Carlson_troll_armor_ready_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_RBL_2617_Carlson_Leaf_agree)&&(Carlson_armor <= Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2617_Carlson_troll_armor_ready_Info()
{
	AI_Output (self, other, "DIA_RBL_2617_Carlson_troll_armor_ready_11_01"); //Pancerz gotowy. I jak ci si� podoba?
	AI_Output (other, self, "DIA_RBL_2617_Carlson_troll_armor_ready_15_02"); //Nawet niez�y ten pancerz. Dzi�ki, kowalu.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_troll_armor_ready_11_03"); //Nie ma sprawy, Carlson zawsze do us�ug.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_troll_armor_ready_11_04"); //A teraz za�� nowe �achy i pofruwaj sobie w nich po kolonii, he, he.

   CreateInvItem(self, HCG_ARMOR_H);
	B_GiveInvItems(self, other, HCG_ARMOR_H, 1);
	AI_EquipArmor(other, HCG_ARMOR_H);
   
   Log_SetTopicStatus(CH2_RBL_armor, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_armor, "W nagrod� otrzyma�em sw�j wymarzony pancerz z trolla.");
};

INSTANCE DIA_RBL_2617_Carlson_Repair_Axe (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 3;
	condition		= DIA_RBL_2617_Carlson_Repair_Axe_Condition;
	information		= DIA_RBL_2617_Carlson_Repair_Axe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czy m�g�by� podostrzy� mi m�j top�r?"; 
};

FUNC INT DIA_RBL_2617_Carlson_Repair_Axe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Carlson_GoOut)) && (!repaired_axe_Rick) && (NPC_HasItems(other, Rick_Axe_1)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2617_Carlson_Repair_Axe_Info()
{
	repaired_axe_Rick = TRUE; 
   
   B_unequip_current_mweapon_hero(Rick_Axe_1);
   
	AI_Output (other, self, "DIA_RBL_2617_Carlson_Repair_Axe_15_01"); //Czy m�g�by� podostrzy� mi m�j top�r?
	AI_Output (self, other, "DIA_RBL_2617_Carlson_Repair_Axe_11_02"); //Tak, a przy okazji sprawdz� jako�� tutejszej ku�ni. Daj mi sw�j toporek.
   Give_and_remove(Rick_Axe_1, 1);
   Create_and_give(Rick_Axe_2b, 1);
	AI_Output (self, other, "DIA_RBL_2617_Carlson_Repair_Axe_15_03"); //Teraz ma�e poprawki i ju� jest gotowy!
	AI_Output (other, self, "DIA_RBL_2617_Carlson_Repair_Axe_15_04"); //Dzi�ki.
};