// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Stern_EXIT(C_INFO)
{
	npc			= EBR_4444_Stern;
	nr			= 999;
	condition	= DIA_Stern_EXIT_Condition;
	information	= DIA_Stern_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Stern_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Stern_EXIT_Info()
{	
	B_StopProcessInfos(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_Stern_Hello (C_INFO)
{
	npc			= EBR_4444_Stern;
	nr			= 3;
	condition	= DIA_Stern_Hello_Condition;
	information	= DIA_Stern_Hello_Info;
	permanent	= 0;
	important 	= 1;
	description = "";
};                       

FUNC INT DIA_Stern_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1500)&&(Npc_KnowsInfo(hero, DIA_Lee_RBLOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Stern_Hello_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_DrawWeapon (self);
	AI_Output (self, other,"DIA_Stern_Hello_13_01"); //Kolejny skurwiel w�szy tam, gdzie nie powinien!
	AI_Output (other, self,"DIA_Stern_Hello_15_02"); //Wyci�gnij �elazo i miejmy to ju� za sob�.
	B_LogEntry(CH5_NC_Passage,	"Znalaz�em Stra�nic�. Dlaczego wszyscy si� na mnie rzucaj�, gdy tylko mnie zobacz�?");
	B_StopProcessInfos	(self);
	B_StartAfterDialogFight(self,other,true);
};

