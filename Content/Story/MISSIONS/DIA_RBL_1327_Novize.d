INSTANCE DIA_RBL_1327_Novize_Hi(C_INFO)
{
	npc			= RBL_1327_Novize;
	nr			= 1;
	condition	= DIA_RBL_1327_Novize_Hi_Condition;
	information	= DIA_RBL_1327_Novize_Hi_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_RBL_1327_Novize_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_RBL_1327_Novize_Hi_Info()
{
	AI_Output (self, other, "DIA_RBL_1327_Novize_Hi_15_01"); //Nie st�j tak! Dob�d� broni i ruszaj ku chwal� �ni�cego!

   B_StopProcessInfos(self);
   Npc_ExchangeRoutine(self,"Panic");
   Wld_insertNPC(GUR_12030_BaalTondral_Dream, "PANIC2");
};