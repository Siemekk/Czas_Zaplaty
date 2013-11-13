
var int firts_exit;

// ************************ EXIT **************************

instance DIA_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= DIA_Grimes_Exit_Condition;
	information	= DIA_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Grimes_Exit_Info()
{
	if (firts_exit == false)
	{
		firts_exit = TRUE;
		AI_Output (other, self,"DIA_Grimes_Exit_Info_15_01"); //Powodzenia!
		AI_Output (self, other,"DIA_Grimes_Exit_Info_04_02"); //Nawzajem, ch�opcze. Nawzajem.
	};
	B_StopProcessInfos	(self);
};


// ***************** Hi *****************************

instance  DIA_Grimes_Hi (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= DIA_Grimes_Hi_Condition;
	information		= DIA_Grimes_Hi_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co tutaj robisz?"; 
};

FUNC int  DIA_Grimes_Hi_Condition()
{	
	//	if (Npc_KnowsInfo (hero,DIA_Grimes_FIRST))
	//	{
	return 1;
	//	};

};


FUNC void  DIA_Grimes_Hi_Info()
{
	AI_Output (other, self,"DIA_Grimes_Hi_Info_15_01"); //Co tutaj robisz?
	AI_Output (self, other,"DIA_Grimes_Hi_Info_04_02"); //Dogorywam ch�opcze. Sporo ju� widzia�em, m�j czas powoli si� ko�czy.

};



// ***************** Infos *****************************

instance  DIA_Grimes_Hello (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= DIA_Grimes_Hello_Condition;
	information		= DIA_Grimes_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Od dawna tu jeste�?"; 
};

FUNC int  DIA_Grimes_Hello_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Grimes_Hi))&&(Npc_KnowsInfo (hero,DIA_Urt_Packages)) 
	{
		return 1;
	};

};


FUNC void  DIA_Grimes_Hello_Info()
{
	AI_Output (other, self,"DIA_Grimes_Hello_Info_15_01"); //Od dawna tu jeste�?
	AI_Output (self, other,"DIA_Grimes_Hello_Info_04_02"); //Dobre dziesi�� lat. Ale w obozie od niedawna.
	AI_Output (self, other,"DIA_Grimes_Hello_Info_04_03"); //Wi�kszo�� czasu sp�dzi�em w kopalni. By�o ci�ko, ale do wszystkiego mo�na si� przyzwyczai�.
	AI_Output (other, self,"DIA_Grimes_Hello_Info_15_04"); //Nie masz ju� do�� takiego �ycia?
	AI_Output (self, other,"DIA_Grimes_Hello_Info_04_05"); //A czy to wa�ne? Do wszystkiego mo�na si�...
	AI_Output (other, self,"DIA_Grimes_Hello_Info_15_06"); //Wiem, ju� to m�wi�e�. Nie �al Ci towarzyszy, kt�rych zakatowali stra�nicy? Albo innych, kt�rzy zgin�li w kopalni tylko dlatego, �eby nabi� kabz� Gomezowi?
	AI_Output (self, other,"DIA_Grimes_Hello_Info_04_07"); //Do czego zmierzasz ch�opcze?
	AI_Output (other, self,"DIA_Grimes_Hello_Info_15_08"); //Gomez zaszed� za sk�r� wielu ludziom, kt�rzy postanowili powiedzie� - NIE!
	AI_Output (other, self,"DIA_Grimes_Hello_Info_15_09"); //Kopacze tak�e mog� zrzuci� kajdany, ale nikt za was nie podejmie tej decyzji.
	AI_Output (self, other,"DIA_Grimes_Hello_Info_04_10"); //Jestem ju� stary, mam ju� do�� �ycia. Po co mam walczy�?
	Info_ClearChoices (DIA_Grimes_Hello);
	Info_AddChoice (DIA_Grimes_Hello, "Chcia�by� ujrze� zach�d s�o�ca jako wolny cz�owiek?", DIA_Grimes_Hello_Sun);
	Info_AddChoice (DIA_Grimes_Hello, "Dla zemsty.", DIA_Grimes_Hello_Revange);
	Info_AddChoice (DIA_Grimes_Hello, "�eby zrzuci� kajdany niewoli.", DIA_Grimes_Hello_Chains);
};

// ---------------------------sun----------------------------------------

FUNC VOID DIA_Grimes_Hello_Sun()
{
	B_GiveXP(250);
	buddler_join = buddler_join + 1;
	AI_Output (other, self,"DIA_Grimes_Hello_Sun_15_01"); //Chcia�by� ujrze� zach�d s�o�ca jako wolny cz�owiek?
	AI_Output (self, other,"DIA_Grimes_Hello_Sun_04_02"); //Zach�d s�o�ca? Ju� dawno go nie ogl�da�em...
	AI_Output (self, other,"DIA_Grimes_Hello_Sun_04_03"); //Kiedy �yjesz jak szczur zapominasz, �e jeste� cz�owiekiem.
	AI_Output (self, other,"DIA_Grimes_Hello_Sun_04_04"); //Przekonam kopaczy do walki o wolno��.
	AI_Output (other, self,"DIA_Grimes_Hello_Sun_15_05"); //Dzi�kuj�!
	B_LogEntry		(CH3_RBL_Buddler, "Grimes przekona swoich poplecznik�w do walki o wolno��.");
	B_StopProcessInfos	(self);
};

// ---------------------------revange----------------------------------------

FUNC VOID DIA_Grimes_Hello_Revange()
{
	AI_Output (other, self,"DIA_Grimes_Hello_Revange_15_01"); //Dla zemsty.
	AI_Output (self, other,"DIA_Grimes_Hello_Revange_04_02"); //W moim wieku zemsta?
	AI_Output (self, other,"DIA_Grimes_Hello_Revange_04_03"); //Zemsta to g�upota, szkoda na ni� czasu. Poza tym co schorowany starzec mo�e zrobi� stra�nikom?
	Info_ClearChoices (DIA_Grimes_Hello);
};


// ---------------------------chains----------------------------------------

FUNC VOID DIA_Grimes_Hello_Chains()
{
	AI_Output (other, self,"DIA_Grimes_Hello_Chains_15_01"); //�eby zrzuci� kajdany niewoli.
	AI_Output (self, other,"DIA_Grimes_Hello_Chains_04_02"); //Kajdany... Po pewnym czasie cz�owiek przyzwyczaja si� do wszystkiego.
	AI_Output (self, other,"DIA_Grimes_Hello_Chains_04_03"); //Jestem ju� za stary i zbyt zm�czony, �eby walczy�.
	Info_ClearChoices (DIA_Grimes_Hello);
};

