// **************************** 
//				EXIT 
// ****************************

instance  Info_Nabil_EXIT (C_INFO)
{
	npc			=	RBL_4124_Nabil;
	nr			=	999;
	condition	=	Info_Nabil_EXIT_Condition;
	information	=	Info_Nabil_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nabil_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nabil_EXIT_Info()
{
	B_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nabil_Hallo (C_INFO)
{
	npc			=	RBL_4124_Nabil;
	nr			=	1;
	condition	=	Info_Nabil_Hallo_Condition;
	information	=	Info_Nabil_Hallo_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co Ty tu robisz?"; 
};                       

FUNC int  Info_Nabil_Hallo_Condition()
{

	return 1;

};

FUNC VOID  Info_Nabil_Hallo_Info()
{
	AI_Output (other, self,"Info_Nabil_Hallo_15_00"); //Co Ty tu robisz?
	AI_Output (self, other,"Info_Nabil_Hallo_04_01"); //Odpoczywam od natr�tnych przyb��d. Wyno� si�!
	B_StopProcessInfos	(self);
};


// ****************************

instance Info_Nabil_Kuva (C_INFO)
{
	npc			=	RBL_4124_Nabil;
	nr			=	2;
	condition	=	Info_Nabil_Kuva_Condition;
	information	=	Info_Nabil_Kuva_Info;
	permanent		= 0;
	important		= 0;
	description		= "To Tw�j wywar?"; 
};                       

FUNC int  Info_Nabil_Kuva_Condition()
{

	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Kuva))&&(NPC_HasItems(other,ItFo_Nabil_Poison)>=1)

	{
		return 1;
	};

};

FUNC VOID  Info_Nabil_Kuva_Info()
{
	var C_NPC kuv; kuv = Hlp_GetNpc(RBL_4123_Kuva);
	Npc_ChangeAttribute	(kuv, ATR_HITPOINTS, -kuv.attribute[ATR_HITPOINTS_MAX]);

	AI_Output (other, self,"Info_Nabil_Kuva_15_00"); //To Tw�j wywar?
	AI_Output (self, other,"Info_Nabil_Kuva_04_01"); //Mo�e i m�j. 
	AI_Output (other, self,"Info_Nabil_Kuva_15_03"); //Dlaczego zamkn��e� Kuv�?
	AI_Output (self, other,"Info_Nabil_Kuva_04_04"); //A dlaczego ogie� parzy?
	AI_Output (other, self,"Info_Nabil_Kuva_15_05"); //Nie odpowiedzia�e� na moje pytanie.
	AI_Output (self, other,"Info_Nabil_Kuva_04_06"); //Wprost przeciwnie. A musia�em mie� jaki� pow�d?
	AI_Output (other, self,"Info_Nabil_Kuva_15_07"); //Ludzie z regu�y robi� co� z jakiego� powodu. Kradn�, zabijaj�, ukrywaj� si�. Wszystkim rz�dz� jakie� regu�y, zasady spo�eczne, kt�rych trzeba przestrzega�.
	AI_Output (self, other,"Info_Nabil_Kuva_04_08"); //Nie ka�dy robi co� z okre�lonego powodu. Niekt�rzy po prostu lubi� jak �wiat p�onie.
	AI_Output (other, self,"Info_Nabil_Kuva_15_09"); //A Ty jeste� jednym z nich?
	AI_Output (self, other,"Info_Nabil_Kuva_04_10"); //Za d�ugo ju� trac� na Ciebie czas. Ale o Kuv� nie musisz si� k�opota�, niedawno go odwiedzi�em.
	AI_Output (other, self,"Info_Nabil_Kuva_15_11"); //I?
	AI_Output (self, other,"Info_Nabil_Kuva_04_12"); //I jemu jest ju� oboj�tne czy wydostanie si� z tej klatki.
	AI_Output (other, self,"Info_Nabil_Kuva_15_13"); //Kawa� z Ciebie skurwiela!
	AI_Output (self, other,"Info_Nabil_Kuva_04_14"); //Nie przymilaj si� i tak Ci� zabij�!

	Log_SetTopicStatus	(CH1_RBL_Cage, LOG_SUCCESS);
	B_LogEntry		(CH1_RBL_Cage, "No i po wszystkim. Kuva nie �yje a ja pozna�em szale�ca-anarchist�. Ta Kolonia to rzeczywi�cie popaprane miejsce.");

	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);
};
