// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Pomroka_Exit (C_INFO)
{
	npc			= Grd_4080_Pomroka;
	nr			= 999;
	condition	= DIA_Pomroka_Exit_Condition;
	information	= DIA_Pomroka_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pomroka_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Pomroka_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int dark_fight;

INSTANCE DIA_Pomroka_First (C_INFO)
{
	npc				= Grd_4080_Pomroka;
	nr				= 1;
	condition		= DIA_Pomroka_First_Condition;
	information		= DIA_Pomroka_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pomroka_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Pomroka_First_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Pomroka_First_11_01"); //�wie�y zrzut...
	AI_Output (self, other, "DIA_Pomroka_First_11_02"); //Witamy w G��bi. A teraz wyskakuj z rudy.

	Info_ClearChoices (DIA_Pomroka_First);
	Info_AddChoice (DIA_Pomroka_First, "Sam j� sobie we�!", DIA_Pomroka_First_No);
	Info_AddChoice (DIA_Pomroka_First, "Nie chc� k�opot�w, bierz rud�.", DIA_Pomroka_First_Yes);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Pomroka_First_Yes()
{
	AI_Output (other, self, "DIA_Pomroka_First_Yes_15_01"); //Nie chc� k�opot�w, bierz rud�.
	AI_Output (self, other, "DIA_Pomroka_First_Yes_11_02"); //Grzeczny pieseczek. Tym razem ryja Ci nie obij�.
   
	B_GiveInvItems (other, self,ItMiNugget,NPC_HasItems(other,ItMiNugget) );
	Npc_RemoveInvItems(self,ItMiNugget,NPC_HasItems(self,ItMiNugget));
	CreateInvItems(self,ItMiNugget, 825);
   
	AI_Output (self, other, "DIA_Pomroka_First_Yes_11_03"); //I zapami�taj sobie, w G��bi rz�dzi Pomroka!
	Log_CreateTopic(CH2_NON_Deep, LOG_MISSION);
	Log_SetTopicStatus(CH2_NON_Deep, LOG_RUNNING);
	B_LogEntry(CH2_NON_Deep, "No to witamy w G��bi. Ju� na pocz�tku jaki� kole� z babskim imieniem - Pomroka, zabra� mi ca�� rud�. Czekaj� mnie trudne chwile...");

	B_StopProcessInfos(self); 
};

// ------------------No----------------

FUNC VOID DIA_Pomroka_First_No()
{
	dark_fight = TRUE;
	AI_Output (other, self, "DIA_Pomroka_First_No_15_01"); //Sam j� sobie we�!
	AI_Output (self, other, "DIA_Pomroka_First_No_11_02"); //Pieseczek pokazuje z�bki.
	AI_DrawWeapon (self);
	AI_Output (self, other, "DIA_Pomroka_First_No_11_03"); //Zaraz kilka profilaktycznie wybijemy...

	Log_CreateTopic(CH2_NON_Deep, LOG_MISSION);
	Log_SetTopicStatus(CH2_NON_Deep, LOG_RUNNING);
	B_LogEntry(CH2_NON_Deep, "No to witamy w G��bi. Ju� na pocz�tku jaki� kole� z babskim imieniem - Pomroka, chcia� mi zabra� ca�� rud�. Ale nie p�jdzie im tak �atwo - co� mi si� wydaje, �e mieszka�c�w G��bi czekaj� trudne chwile!");
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

INSTANCE DIA_Pomroka_After (C_INFO)
{
	npc				= Grd_4080_Pomroka;
	nr				= 2;
	condition		= DIA_Pomroka_After_Condition;
	information		= DIA_Pomroka_After_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Pomroka_After_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pomroka_First ))&&(dark_fight == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pomroka_After_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);

	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Pomroka_After_07_01"); //I po co Ci to by�o �achmyto? W G��bi rz�dzi...
		AI_Output (other, self, "DIA_Pomroka_After_15_02"); //Tak, wiem, Pomroka.
		AI_Output (self, other, "DIA_Pomroka_After_07_03"); //I dobrze, niech Ci si� to wyryje w pustej �epetynie! A teraz dawaj rud� i zejd� mi z oczu.

		B_GiveInvItems (other, self,ItMiNugget,NPC_HasItems(other,ItMiNugget) );
		Npc_RemoveInvItems(self,ItMiNugget,NPC_HasItems(self,ItMiNugget));
		CreateInvItems(self,ItMiNugget, 825);
		B_LogEntry(CH2_NON_Deep, "Pomroka okaza� si� twardym przeciwnikiem, a o rudzie mog� ju� zapomnie�.");
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		B_GiveXP(200);
		AI_Output (self, other, "DIA_Pomroka_After_07_04"); //To niemo�liwe... Nikt si� o tym nie mo�e dowiedzie�...
		AI_Output (other, self, "DIA_Pomroka_After_No_15_05"); //W ko�cu trafi�e� na wredniejszego od siebie, h�? A teraz grzecznie oddaj rud�, albo powt�rzymy mordobicie.
		AI_Output (self, other, "DIA_Pomroka_After_07_06"); //Bierz rud� i... prosz� nie bij mnie ju� wi�cej...
		B_GiveInvItems (self, other, ItMiNugget,NPC_HasItems(self,ItMiNugget) );
		B_LogEntry(CH2_NON_Deep, "Ten Pomroka to jaka� kpina. Zabra�em mu rud�, �eby si� biedaczek nie przed�wign��.");
	};
   
   B_StopProcessInfos(self); 
};

INSTANCE DIA_Pomroka_After1 (C_INFO)
{
	npc				= Grd_4080_Pomroka;
	nr				= 2;
	condition		= DIA_Pomroka_After1_Condition;
	information		= DIA_Pomroka_After1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co powiesz na ma�y wpierdol?"; 
};

FUNC INT DIA_Pomroka_After1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pomroka_First ))&&(dark_fight == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pomroka_After1_Info()
{
	AI_Output (other, self, "DIA_Pomroka_After1_15_01"); //Co powiesz na ma�y wpierdol?
	AI_Output (self, other, "DIA_Pomroka_After1_07_02"); //Spierdalaj!
};