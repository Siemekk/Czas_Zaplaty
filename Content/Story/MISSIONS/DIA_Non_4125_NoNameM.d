// **************************************************
// 						 EXIT 
// **************************************************


instance  DIA_NoNameM_Exit (C_INFO)
{
	npc			=  Nameless_FourthMeet;
	nr			=  999;
	condition	=  DIA_NoNameM_Exit_Condition;
	information	=  DIA_NoNameM_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_NoNameM_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_NoNameM_Exit_Info()
{
	B_StopProcessInfos	( self );
};



//--------------------------------------------------------------------------
// 					
//--------------------------------------------------------------------------
instance  DIA_NoNameM_Hi (C_INFO)
{
	npc				= Nameless_FourthMeet;
	condition		= DIA_NoNameM_Hi_Condition;
	information		= DIA_NoNameM_Hi_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int  DIA_NoNameM_Hi_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Torlof_Fight))&&(Npc_GetDistToNpc(self,hero) < 2000)

	{
		return TRUE;
	};

};
FUNC void  DIA_NoNameM_Hi_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
	AI_Output (self, other,"DIA_NoNameM_Hi_Info_15_01"); //Jaka ta Kolonia ma�a. Znowu si� spotykamy.
	AI_Output (other, self,"DIA_NoNameM_Hi_Info_15_02"); //Co ty tutaj robisz?
	AI_Output (self, other,"DIA_NoNameM_Hi_Info_15_03"); //Mam tu co� do za�atwienia. Szukam orka-niewolnika, kt�ry mo�e mi pom�c.
	AI_Output (other, self,"DIA_NoNameM_Hi_Info_15_04"); //R�b jak chcesz, ja si� st�d wynosz�.
	AI_Output (self, other,"DIA_NoNameM_Hi_Info_15_05"); //Czyli tradycyjnie ja zajm� si� stra�nikami. Bywaj.
	B_LogEntry		(CH1_Rbl_NoName, "Znowu go spotka�em. Tym razem szuka� czego� w kopalni. Ma�y ten �wiat...");
	B_StopProcessInfos	(self); 

};  

/*************************
Tylko Ork trzebaby po wyj�ciu Dicka z kopalni wywali� st�d tego Bezia te�.
************************/

