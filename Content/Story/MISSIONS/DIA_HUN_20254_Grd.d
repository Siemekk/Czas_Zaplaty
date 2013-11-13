// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_20254_Grd (C_INFO)
{
	npc			= HUN_20254_Grd;
	nr			= 999;
	condition	= DIA_HUN_20254_Grd_Exit_Condition;
	information	= DIA_HUN_20254_Grd_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_20254_Grd_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_20254_Grd_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_HUN_20254_Grd_Hello (C_INFO)
{
	npc				= HUN_20254_Grd;
	nr				= 2;
	condition		= DIA_HUN_20254_Grd_Hello_Condition;
	information		= DIA_HUN_20254_Grd_Hello_Info;
	permanent		= 1;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_20254_Grd_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(!Npc_KnowsInfo(other,DIA_Abel_SpyKillEnd6))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_20254_Grd_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello_06_01"); //Zgubi�e� si�?
	AI_Output (other, self,"DIA_HUN_20254_Grd_Hello_15_02"); //Co to za miejsce?
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello_06_03"); //Ta cuchn�ca nora, to wej�cie do G��bi.
	AI_Output (other, self,"DIA_HUN_20254_Grd_Hello_15_04"); //G��bia?
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello_06_05"); //Opuszczona kopalnia, z kt�rej nie ma wyj�cia.
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello_06_06"); //Odejd�, nie wpuszczam tu nikogo bez zgody Cavalorna.
	
   B_StopProcessInfos(self);
	AI_GotoWP(other, "OW_PATH_BEACH");
};	
	
INSTANCE DIA_HUN_20254_Grd_Hello1 (C_INFO)
{
	npc				= HUN_20254_Grd;
	nr				= 2;
	condition		= DIA_HUN_20254_Grd_Hello1_Condition;
	information		= DIA_HUN_20254_Grd_Hello1_Info;
	permanent		= 1;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_20254_Grd_Hello1_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(!Npc_KnowsInfo(other,DIA_Abel_SpyKillEnd6))&&(Npc_KnowsInfo(other,DIA_HUN_20254_Grd_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_20254_Grd_Hello1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello1_06_01"); //To znowu Ty.
	AI_Output (other, self,"DIA_HUN_20254_Grd_Hello1_15_02"); //Mo�e jednak zmienisz zdanie? Z ch�ci� zwiedz� kopalni�.
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello1_06_03"); //Lepiej nie ku� losu. Nikt przy zdrowych zmys�ach nie pcha si� tam dobrowolnie.
	AI_Output (other, self,"DIA_HUN_20254_Grd_Hello1_15_04"); //To jak b�dzie?
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello1_06_05"); //Odejd�.
	
   B_StopProcessInfos(self);
	AI_GotoWP(other, "OW_PATH_BEACH");
};	
	
INSTANCE DIA_HUN_20254_Grd_Hello2 (C_INFO)
{
	npc				= HUN_20254_Grd;
	nr				= 2;
	condition		= DIA_HUN_20254_Grd_Hello2_Condition;
	information		= DIA_HUN_20254_Grd_Hello2_Info;
	permanent		= 1;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_20254_Grd_Hello2_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(!Npc_KnowsInfo(other,DIA_Abel_SpyKillEnd6))&&(Npc_KnowsInfo(other,DIA_HUN_20254_Grd_Hello1))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_20254_Grd_Hello2_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello2_06_01"); //Zmiataj st�d!
	
   B_StopProcessInfos(self);
	AI_GotoWP(other, "OW_PATH_BEACH");
};	
	
INSTANCE DIA_HUN_20254_Grd_Hello3 (C_INFO)
{
	npc				= HUN_20254_Grd;
	nr				= 2;
	condition		= DIA_HUN_20254_Grd_Hello3_Condition;
	information		= DIA_HUN_20254_Grd_Hello3_Info;
	permanent		= 0;
	important		= 1;
	description		= "Jak ty stamt�d uciek�e�?"; 
};

FUNC INT DIA_HUN_20254_Grd_Hello3_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(Npc_KnowsInfo(other,DIA_Abel_SpyKillEnd6))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_20254_Grd_Hello3_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello3_06_01"); //Jak ty stamt�d uciek�e�?
	AI_Output (other, self,"DIA_HUN_20254_Grd_Hello3_15_02"); //Powiedzmy, �e mia�em farta.
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello3_06_03"); //Nie wierz� w szcz�cie, ale niech ci b�dzie.
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello3_06_04"); //Bywaj.
	
   B_StopProcessInfos(self);
};	
	