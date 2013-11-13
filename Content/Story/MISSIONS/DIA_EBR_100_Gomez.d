// **************************************
//					EXIT 
// **************************************

instance DIA_Gomez_Exit (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 999;
	condition	= DIA_Gomez_Exit_Condition;
	information	= DIA_Gomez_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gomez_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Gomez_Exit_Info()
{
	B_StopProcessInfos	(self);
};

// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_Gomez_Fault (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Fault_Condition;
	information	= DIA_Gomez_Fault_Info;
	permanent	= 0;
	description	= "Przychodz� zaoferowa� swoje us�ugi.";
};                       

FUNC int DIA_Gomez_Fault_Condition()
{
	return 1;
};

FUNC VOID DIA_Gomez_Fault_Info()
{
	AI_Output (other, self,"DIA_Gomez_Fault_15_00"); //Przychodz� zaoferowa� swoje us�ugi.
	AI_Output (self, other,"DIA_Gomez_Fault_11_01"); //�miesz tak po prostu tutaj wmaszerowa� i zawraca� mi g�ow�? Ty gnido! STRA�!
	
	B_StopProcessInfos	(self);
	B_StartAfterDialogFight(self,other,true);
};


