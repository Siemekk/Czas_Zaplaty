
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_RBL_2605_GARRY_Exit (C_INFO)
{
	npc			= RBL_2605_GARRY;
	nr			= 999;
	condition	= DIA_RBL_2605_GARRY_Exit_Condition;
	information	= DIA_RBL_2605_GARRY_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_RBL_2605_GARRY_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_RBL_2605_GARRY_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_RBL_2605_GARRY_Hello (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 1;
	condition		= DIA_RBL_2605_GARRY_Hello_Condition;
	information		= DIA_RBL_2605_GARRY_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ci�ko pracujesz."; 
};

FUNC INT DIA_RBL_2605_GARRY_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_RBL_2605_GARRY_Hello_Info()
{
	AI_Output (other, self, "DIA_RBL_2605_GARRY_Hello_15_01"); //Ci�ko pracujesz.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_Hello_11_02"); //Praca to m�j �ywio�, a kowalstwo sprawia, �e znowu chc� �y�.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_Hello_11_03"); //Nie s�dzi�em, �e to taka radocha. Mog� teraz tworzy� wspania�� bro�!
	AI_Output (self, other, "DIA_RBL_2605_GARRY_Hello_11_04"); //Mog� pie�ci� ka�de ostrze po wykuciu. Nie ma to jak syk stali w wodzie o poranku...
	AI_Output (other, self, "DIA_RBL_2605_GARRY_Hello_15_05"); //Skoro tak twierdzisz.
};


var int garry_fight;

INSTANCE DIA_RBL_2605_GARRY_GoBring (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 2;
	condition		= DIA_RBL_2605_GARRY_GoBring_Condition;
	information		= DIA_RBL_2605_GARRY_GoBring_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie propozycj� nie do odrzucenia."; 
};

FUNC INT DIA_RBL_2605_GARRY_GoBring_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RBL_2605_GARRY_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_GoBring))
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2605_GARRY_GoBring_Info()
{
	Npc_SetAivar(self,AIV_WASDEFEATEDBYSC,  FALSE);		Npc_SetAivar(self,AIV_HASDEFEATEDSC,  FALSE);

	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_01"); //Mam dla Ciebie propozycj� nie do odrzucenia.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_02"); //To znaczy?
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_03"); //Przesta� pastwi� si� nad kowad�em Aidana!
	AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_04"); //Nic z tego. Jestem �wietnym kowalem, a Ty wtr�casz si� w nie swoje sprawy.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_05"); //Zejd� mi z oczu.
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_06"); //Powiem inaczej. 
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_07"); //Masz do wyboru dwie opcje.
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_08"); //Opcja A. Odk�adasz m�otek z w�asnej woli i nie wracasz tu psu� kowad�a.
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_09"); //Opcja B. To du�o mniej przyjemna wersja opcji A z �amaniem ko�czyn i obcinaniem palc�w w��cznie.
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_10"); //Wi�c jak b�dzie? Kt�r� opcj� wybierasz?
	
   var C_NPC Quentin; 	Quentin = Hlp_GetNpc(HUN_858_Quentin);

	if (Npc_KnowsInfo (hero, DIA_HUN_858_Quentin_Hello))&&(Npc_GetAivar(Quentin,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		garry_out = TRUE;
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_11"); //Widzia�em, jak walczy�e� z Quentinem i raczej nie skorzystam z opcji B.
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_12"); //Wiedz jednak, �e z�ama�e� mi serce i zada�e� straszliwy b�l mojej duszy artysty...
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_13"); //Przez Twoje barbarzy�stwo straci te� sztuka kowalstwa!
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_14"); //Id� si� schla�...
		B_GiveXP(250);
		B_LogEntry		(CH1_Rbl_AidanHelp, "Garry widzia� jak za�atwi�em Quentina i zdaje si�, �e to zawa�y�o na jego decyzji. Powiedzia�, �e idzie si� schla�.");

		Npc_ExchangeRoutine	(self,"GarryTavern");
		B_StopProcessInfos	(self); 
	}
	else
	{
		garry_fight = TRUE;
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_15"); //A kim Ty jeste�, �eby m�wi� mi co mam robi�?
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_16"); //Niech b�dzie opcja B, gnojku!
		B_LogEntry		(CH1_Rbl_AidanHelp, "Garry nie rzuci kowalstwa po dobroci. No nic czas skopa� mu rzy�...");
		
      B_SetTimedATT(self,30*events_per_sec,-180,-180,-95);				
		
		B_StopProcessInfos	(self); 
      B_StartAfterDialogFight(self,other,false);	
	};
};

INSTANCE DIA_RBL_2605_GARRY_After (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 3;
	condition		= DIA_RBL_2605_GARRY_After_Condition;
	information		= DIA_RBL_2605_GARRY_After_Info;
	permanent		= 0;
	important		= 0;
	description		= "Idziemy!"; 
};

FUNC INT DIA_RBL_2605_GARRY_After_Condition()
{
	if (garry_fight == TRUE)&&(Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		return 1;
	};
};
FUNC VOID DIA_RBL_2605_GARRY_After_Info()
{
	garry_out = TRUE;
	AI_Output (other, self, "DIA_RBL_2605_GARRY_After_15_01"); //Idziemy!
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After_11_02"); //Uspok�j si�. Z�ama�e� nie tylko mego ducha, ale i serce.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After_11_03"); //Przez twoje barbarzy�stwo straci te� sztuka kowalstwa!
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After_11_04"); //Id� si� schla�...
	B_GiveXP(150);
	B_LogEntry		(CH1_Rbl_AidanHelp, "Solidne lanie pomog�o Garremu podj�� decyzj�. Ju� nie wr�ci do Aidana i poszed� si� schla�.");

	Npc_ExchangeRoutine	(self,"GarryTavern");
	B_StopProcessInfos	(self); 

};


INSTANCE DIA_RBL_2605_GARRY_After1 (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 4;
	condition		= DIA_RBL_2605_GARRY_After1_Condition;
	information		= DIA_RBL_2605_GARRY_After1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Topisz �ale w winie?"; 
};

FUNC INT DIA_RBL_2605_GARRY_After1_Condition()
{
	if (garry_out  == TRUE)&&(Npc_GetDistToWP (self,"GARRY") < 1000 ) //wp w kt�rym siedzi w tawernie
	{
		return 1;
	};
};
FUNC VOID DIA_RBL_2605_GARRY_After1_Info()
{
	AI_Output (other, self, "DIA_RBL_2605_GARRY_After1_15_01"); //Topisz �ale w winie?
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After1_11_02"); //A co Ci� to obchodzi?
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After1_11_03"); //Przez Ciebie nie mam teraz co robi�.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After1_11_04"); //Do cholery, nie mam nawet za co chla�...
};

INSTANCE DIA_RBL_2605_GARRY_After2 (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 5;
	condition		= DIA_RBL_2605_GARRY_After2_Condition;
	information		= DIA_RBL_2605_GARRY_After2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�e to ci� zainteresuje..."; 
};

FUNC INT DIA_RBL_2605_GARRY_After2_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_RBL_2605_GARRY_After1))&&(Npc_KnowsInfo (hero,  DIA_RBL_2613_VAM_GoBring))
	{
		return 1;
	};
};
FUNC VOID DIA_RBL_2605_GARRY_After2_Info()
{
	AI_Output (other, self, "DIA_RBL_2605_GARRY_After2_15_01"); //Mo�e to Ci� zainteresuje...
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After2_11_02"); //Co takiego?
	AI_Output (other, self, "DIA_RBL_2605_GARRY_After2_11_03"); //Drwal Vam szuka pomocnika.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After2_11_04"); //Hmm. Drwal powiadasz?
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After2_11_05"); //�cinanie drzew, obcowanie z matk� natur�, heblowanie desek, g�adzenie delikatnej powierzchni drewna...
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After2_11_06"); //To co� dok�adnie dla mnie!
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After2_11_07"); //Prowad�!

	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	B_StopProcessInfos	(self); 

};

INSTANCE DIA_RBL_2605_GARRY_After3 (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 6;
	condition		= DIA_RBL_2605_GARRY_After3_Condition;
	information		= DIA_RBL_2605_GARRY_After3_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_RBL_2605_GARRY_After3_Condition()
{


	if (Npc_KnowsInfo (hero,  RBL_2613_Vam_Ok))
	{
		return 1;
	};



};
FUNC VOID DIA_RBL_2605_GARRY_After3_Info()
{
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After3_11_01"); //W sumie mo�e i dobrze si� sta�o.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After3_11_02"); //Praca przy drewnie jest spokojniejsza i bardziej... uduchowiona.
	AI_Output (other, self, "DIA_RBL_2605_GARRY_After3_15_03"); //Skoro tak twierdzisz. Mi�ego obcowania z duchami!
	B_StopProcessInfos	( self );
};




INSTANCE DIA_Garry_Stew (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 12;
	condition		= DIA_Garry_Stew_Condition;
	information		= DIA_Garry_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam gulasz Snafa."; 
};

FUNC INT DIA_Garry_Stew_Condition()
{


	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};


};

FUNC VOID DIA_Garry_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_Garry_Stew_15_01"); //Mam gulasz Snafa.
	AI_Output (self, other, "DIA_Garry_Stew_11_02"); //A ja mam wrzody i co z tego?
	AI_Output (other, self, "DIA_Garry_Stew_15_03"); //Bierzesz czy nie?
	AI_Output (self, other, "DIA_Garry_Stew_11_04"); //Pewnie, dawaj.
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Przyda si� Garremu ciep�a strawa na nowej posadce."); 

};



