// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Bern_Exit (C_INFO)
{
	npc			= Grd_4089_Bern;
	nr			= 999;
	condition	= DIA_Bern_Exit_Condition;
	information	= DIA_Bern_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Bern_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bern_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_Bern_First (C_INFO)
{
	npc				= Grd_4089_Bern;
	nr				= 1;
	condition		= DIA_Bern_First_Condition;
	information		= DIA_Bern_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Bern_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Torlof_Fight))
	{
		return 1;
	};
};

FUNC VOID DIA_Bern_First_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Bern_First_11_01"); //Co� Ty za jeden? Wracaj do kopalni!
	AI_Output (other, self, "DIA_Bern_First_15_02"); //Tam trwa rze�nia! Torlof poci�� Jurgena, skaza�cy dobijaj� pozosta�ych stra�nik�w!
	AI_Output (self, other, "DIA_Bern_First_11_03"); //Niemo�liwe... 
	AI_Output (other, self, "DIA_Bern_First_15_04"); //Jak chcesz, mo�esz tam sam sprawdzi�. Ja si� st�d zmywam.
	AI_Output (self, other, "DIA_Bern_First_11_05"); //Rzeczywi�cie s�ycha� odg�osy walki...
	AI_Output (self, other, "DIA_Bern_First_11_06"); //Niech to szlag, musz� powiedzie� o tym Fletcherowi!
	
   if (sword_stolen == TRUE)
	{
		AI_Output (other, self, "DIA_Bern_First_15_07"); //Zaczekaj! Szukam Carlosa. Nie wiesz, gdzie go znajd�?
		AI_Output (self, other, "DIA_Bern_First_11_08"); //Ca�kiem mu odbi�o. Dorwa� jaki� wielki miecz i ruszy� z nim na tereny ork�w. Powiedzia�, �e teraz jest niezniszczalny!
	};
   
	AI_Output (self, other, "DIA_Bern_First_11_09"); //Ja st�d spadam...
	B_LogEntry		(CH4_GRD_RuneSwd, "Carlos uciek� z moim mieczem gdzie� na tereny ork�w. Musz� go, jak najszybciej poszuka�!");
	B_StopProcessInfos	(self);

	/************
	Niech stra�nik odejdzie kawa�ek a potem zmiana rutyny i marsz do Fletchera czy gdzies tam
	**************/

	Npc_ExchangeRoutine(self,"GO");
	
	var C_NPC carl; carl = Hlp_GetNpc(Grd_4087_Carlos);
	Npc_ChangeAttribute(carl, ATR_HITPOINTS, -carl.attribute[ATR_HITPOINTS_MAX]);
};
