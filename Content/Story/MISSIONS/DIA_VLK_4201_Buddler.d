// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_Kopaczus_Fault (C_INFO)
{
	npc			= VLK_4201_Buddler;
	nr			= 1;
	condition	= DIA_Kopaczus_Fault_Condition;
	information	= DIA_Kopaczus_Fault_Info;
	permanent	= 0;
	description	= "Mam co� do przekazania.";
};                       

FUNC int DIA_Kopaczus_Fault_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Urt_DiegoJail))
	{
		return 1;
	};
};

FUNC VOID DIA_Kopaczus_Fault_Info()
{
	AI_Output (other, self,"DIA_Kopaczus_Fault_15_00"); //Mam co� do przekazania.
	AI_Output (self, other,"DIA_Kopaczus_Fault_11_01"); //Tak?
	AI_Output (other, self,"DIA_Kopaczus_Fault_15_02"); //Ju� wkr�tce zamkowy dziedziniec sp�ynie krwi� stra�nik�w. Jeste�cie z nami?		
	AI_PlayAni(other,"T_YES");	
   	AI_Output (other, self,"DIA_Kopaczus_Fault_15_03"); //Kiedy zacznie si� jatka przepu�cicie atak na zewn�trzny pier�cie� i otworzycie bramy.
	AI_PlayAni(other,"T_YES");
    AI_Output (other, self,"DIA_Kopaczus_Fault_15_04"); //Ju� nied�ugo g�owa Gomeza b�dzie si� szczerzy� na pi�knie naostrzonym palu!
	AI_Output (self, other,"DIA_Kopaczus_Fault_11_05"); //To by�by wspania�y widok!	
	B_LogEntry		(CH6_RBL_Coordinate, "Kopacze zajm� si� zewn�trznym pier�cieniem i bramami.");
	B_StopProcessInfos	(self);

};


