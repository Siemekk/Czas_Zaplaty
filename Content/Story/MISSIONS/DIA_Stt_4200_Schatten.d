// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_Cienius_Fault (C_INFO)
{
	npc			= Stt_4200_Schatten;
	nr			= 1;
	condition	= DIA_Cienius_Fault_Condition;
	information	= DIA_Cienius_Fault_Info;
	permanent	= 0;
	description	= "Przysy�a mnie Urt.";
};                       

FUNC int DIA_Cienius_Fault_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Urt_DiegoJail))
	{
		return 1;
	};
};

FUNC VOID DIA_Cienius_Fault_Info()
{
	AI_Output (other, self,"DIA_Cienius_Fault_15_00"); //Przysy�a mnie Urt.
	AI_Output (self, other,"DIA_Cienius_Fault_11_01"); //Ciszej!
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, other,"DIA_Cienius_Fault_11_02"); //M�w!
	AI_Output (other, self,"DIA_Cienius_Fault_15_03"); //Nied�ugo zjawimy si� w Starym Obozie, musicie by� w pogotowiu.
	AI_Output (other, self,"DIA_Cienius_Fault_15_04"); //Kiedy us�yszycie atak uderzycie z ty�u na stra�nik�w i ostrzelacie wartownik�w przy zamkowej bramie.
	AI_Output (self, other,"DIA_Cienius_Fault_11_05"); //A co z Diego?
	AI_Output (other, self,"DIA_Cienius_Fault_15_06"); //Tym si� nie martw to ju� m�j problem. Zrobi� wszystko, �eby to Diego poprowadzi� was do boju.
	AI_Output (self, other,"DIA_Cienius_Fault_11_07"); //Rozumiem. Zrobimy co w naszej mocy.

	B_LogEntry		(CH6_RBL_Coordinate, "Cienie uderz� na stra�nik�w, gdy nadejdzie w�a�ciwy czas.");
	B_StopProcessInfos	(self);

};


