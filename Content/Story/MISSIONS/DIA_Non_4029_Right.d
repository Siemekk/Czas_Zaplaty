// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Right_Exit (C_INFO)
{
	npc			= Non_4029_Right;
	nr			= 999;
	condition	= DIA_Right_Exit_Condition;
	information	= DIA_Right_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Right_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Right_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Right_Hello (C_INFO)
{
	npc				= Non_4029_Right;
	nr				= 1;
	condition		= DIA_Right_Hello_Condition;
	information		= DIA_Right_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jeste�?"; 
};

FUNC INT DIA_Right_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Right_Hello_Info()
{
	AI_Output (other, self, "DIA_Right_Hello_15_01"); //Kim jeste�?
	AI_Output (self, other, "DIA_Right_Hello_11_02"); //Jestem w�adc� tego miejsca, moi poddani sk�adaj� mi dary i pochylaj� nisko g�owy przed mym majestatem...
	AI_Output (other, self, "DIA_Right_Hello_15_03"); //Cholerne �wiry.
	
   B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Right_Attack (C_INFO)
{
	npc				= Non_4029_Right;
	nr				= 2;
	condition		= DIA_Right_Attack_Condition;
	information		= DIA_Right_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Right_Attack_Condition()
{
	if ((Npc_KnowsInfo (hero, DIA_Right_Hello))||(Npc_KnowsInfo (hero, DIA_Left_Hello)))&&(debt_read == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Right_Attack_Info()
{
	debt_counter = debt_counter + 2;
	B_GiveXP (150);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	var C_NPC left; left = Hlp_GetNpc(Non_4028_Left);
   
	AI_Output (self, other, "DIA_Right_Attack_11_01"); //Intruz! Czego tu chcesz przyb��do?
	AI_Output (other, self, "DIA_Right_Attack_15_02"); //Chc� tylko odebra� to co nale�y do Nikolasa.
	AI_Output (self, other, "DIA_Right_Attack_11_03"); //Z�odziej! Parszywy kolektor!
	AI_Output (self, other, "DIA_Right_Attack_11_04"); //Bracie, zabijmy to �cierwo!
	
   B_LogEntry		(CH2_TRL_Debt, "Rozmowa z Lewym i Prawym nie mia�a sensu, rzucili si� na mnie jak tylko powiedzia�em po co przyszed�em.");
	B_StopProcessInfos	(self); 

	B_StartAfterDialogFight(left,other,true);
	B_StartAfterDialogFight(self,other,true);
};
