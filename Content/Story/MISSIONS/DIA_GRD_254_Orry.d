// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
{
	return 1;
};

FUNC VOID DIA_Orry_PreExit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_Hi (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_Hi_Condition;
	information		= DIA_Orry_Hi_Info;
	permanent		= 0;
	description		= "Czym si� zajmujesz?"; 
};

FUNC INT DIA_Orry_Hi_Condition()
{	
	return 1;
};

FUNC VOID DIA_Orry_Hi_Info()
{
	AI_Output (other, self,"DIA_Orry_Hi1_15_00"); //Czym si� zajmujesz?
	AI_Output (self, other,"DIA_Orry_Hi1_06_01"); //Kiedy� dba�em o to, by nikt nieproszony nie pa��ta� si� w pobli�u Placu Wymiany.
	AI_Output (self, other,"DIA_Orry_Hi1_06_02"); //Teraz gnij� w obozie jak wi�kszo�� stra�nik�w. Czasami zastanawiam si�, czy dobrze zrobi�em do��czaj�c do tej bandy.
};

// **************************************************

INSTANCE DIA_Orry_Eskort (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_Eskort_Condition;
	information		= DIA_Orry_Eskort_Info;
	permanent		= 0;
	description		= "Wygl�dasz na znudzonego."; 
};

FUNC INT DIA_Orry_Eskort_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Orry_Hi))&&(Npc_KnowsInfo (hero, DIA_Orkan_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Eskort_Info()
{
	AI_Output (other, self,"DIA_Orry_Eskort_15_00"); //Wygl�dasz na znudzonego.
	AI_Output (self, other,"DIA_Orry_Eskort_06_01"); //W tym obozie nic si� nie dzieje. W ka�dym razie nic interesuj�cego.
	AI_Output (other, self,"DIA_Orry_Eskort_15_02"); //Nie masz ochoty na ma�� wypraw� poza palisad�?
	AI_Output (self, other,"DIA_Orry_Eskort_06_03"); //Wiem, kim jeste�. Namawiasz stra�nik�w do przy��czenia si�, do tego nieszcz�snego konwoju.
	AI_Output (self, other,"DIA_Orry_Eskort_06_04"); //Z ch�ci� bym pom�g�, ale to zbyt niebezpieczne. Zamierzam do�y� do momentu kiedy, t� cholern� barier� szlag trafi.
	AI_Output (other, self,"DIA_Orry_Eskort_15_05"); //Rozumiem, bywaj.
};

// **************************************************

INSTANCE DIA_Orry_Attack (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Attack_Condition;
	information		= DIA_Orry_Attack_Info;
	permanent		= 0;
	description		= "Nie obawiasz si� rebeliant�w?"; 
};

FUNC INT DIA_Orry_Attack_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Orry_Eskort))&&(CHEST_KNOW == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Attack_Info()
{
	AI_Output (other, self,"DIA_Orry_Attack_15_00"); //Nie obawiasz si� rebeliant�w?
	AI_Output (self, other,"DIA_Orry_Attack_06_01"); //Co ma by� to b�dzie. Zewn�trzny pier�cie� jest dobrze strze�ony, w�tpi�, �e kto� zdo�a si� przebi� dalej ni� do zamkowej bramy.
	AI_Output (other, self,"DIA_Orry_Attack_15_02"); //Ale atak na pier�cie� mocno os�abi�by ob�z.
	AI_Output (self, other,"DIA_Orry_Attack_06_03"); //Niezupe�nie. Gomez wi�kszo�� stra�nik�w wycofa� do zamku, a tam raczej nikt nie dojdzie w jednym kawa�ku.
	AI_Output (other, self,"DIA_Orry_Attack_15_04"); //Chyba, �e kto� podniesie bram�...
	AI_Output (self, other,"DIA_Orry_Attack_06_05"); //Co Ty pieprzysz. To niemo�liwe, nikt nie jest a� takim idiot�.
	AI_Output (self, other,"DIA_Orry_Attack_06_06"); //Poza tym Gomez dodatkowo wzmocni� obstaw� bramy zamkowej i ko�owrotu. Nikt nie zrobi�by tego po cichu.

	/***************
Ork dodaj tam z kilkunastu stra�nik�w, przy samym ko�owrocie ze 4-5, niech to b�dzie mo�liwe, ale ekstremalnie trudne.

*****************/
};
