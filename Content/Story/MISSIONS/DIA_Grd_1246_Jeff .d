// **************************************************
// 						 EXIT 
// **************************************************

//moved to tradersOC

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Jeff_Hello (C_INFO)
{
	npc				= Grd_1246_Jeff;
	nr				= 1;
	condition		= DIA_Jeff_Hello_Condition;
	information		= DIA_Jeff_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witam."; 
};

FUNC INT DIA_Jeff_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Jeff_Hello_Info()
{
	AI_Output (other, self, "DIA_Jeff_Hello_15_01"); //Witam.
	AI_Output (self, other, "DIA_Jeff_Hello_07_02"); //Czego chcesz?
	AI_Output (other, self, "DIA_Jeff_Hello_15_03"); //Pogada�. Czym si� zajmujesz?
	AI_Output (self, other, "DIA_Jeff_Hello_07_04"); //Sprzedaj� to i tamto, obijam te� mordy ciekawskim typkom.
	AI_Output (other, self, "DIA_Jeff_Hello_15_05"); //Zrozumia�em aluzj�.
	
	Log_CreateTopic(GE_TraderOC, LOG_NOTE);
	B_LogEntry(GE_TraderOC,	"Jeff handluje r�nymi rzeczami.");
};

//***************************************

instance DIA_Jeff_KeyTraded (C_INFO)
{
	npc				= Grd_1246_Jeff;
	condition		= DIA_Jeff_KeyTraded_Condition;
	information		= DIA_Jeff_KeyTraded_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_Jeff_KeyTraded_Condition()
{
	if (Npc_HasItems(other,ItKe_Mis_SO_Warehouse2U))
	{
		return 1;
	};
};

func void  DIA_Jeff_KeyTraded_Info()
{
	//this crappy dialog was created by orc
	AI_Output (self,  other,"DIA_Jeff_KeyTraded_Info_07_00"); //Do cholery, nie widzia�e� przypadkiem mojego klucza?	
	AI_Output (other, self,"DIA_Jeff_KeyTraded_Info_15_01"); //Jakiego klucza?
	AI_Output (self, other,"DIA_Jeff_KeyTraded_Info_07_02"); //Niewa�ne...
	
	Npc_RemoveInvItem(other,ItKe_Mis_SO_Warehouse2U);
	CreateInvItem(other,ItKe_Mis_SO_Warehouse2);
	B_LogEntry(CH3_RBL_Weapon, "Idiota pilnuj�cy magazynu, sprzeda� mi do niego klucz. Teraz wystarczy tylko zakra�� si� do sk�adziku.");
	B_StopProcessInfos(self);
};
