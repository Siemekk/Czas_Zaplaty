
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jurgen_Exit (C_INFO)
{
	npc			= Grd_4090_Jurgen;
	nr			= 999;
	condition	= DIA_Jurgen_Exit_Condition;
	information	= DIA_Jurgen_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jurgen_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jurgen_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_Jurgen_Hi (C_INFO)
{
	npc				= Grd_4090_Jurgen;
	nr				= 1;
	condition		= DIA_Jurgen_Hi_Condition;
	information		= DIA_Jurgen_Hi_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Jurgen_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_Jurgen_Hi_Info()
{
	//Ork: Powodowa�o Crasha w jednym z wys�anych save'�w o,O
	B_FullStop (hero);

	AI_Output (self, other, "DIA_Jurgen_Hi_11_01"); //Gdzie leziesz. Wracaj do kilofa!
	B_StopProcessInfos(self);

	/********************
	Ten stra�nik stoi przed wyj�ciem z kopalni, ork dodaj tam jeszcze ze 2 stra�nik�w do obstawy
	********************/
};

// **************************************************

INSTANCE DIA_Jurgen_First (C_INFO)
{
	npc				= Grd_4090_Jurgen;
	nr				= 1;
	condition		= DIA_Jurgen_First_Condition;
	information		= DIA_Jurgen_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Jurgen_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Torlof_HlpEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Jurgen_First_Info()
{
	var C_NPC tor; tor = Hlp_GetNpc(Sld_737_Torlof);
	//B_FullStop (hero);
	AI_TurnToNpc(self, tor);
	AI_Output (self, other, "DIA_Jurgen_First_11_01"); //Przed chwil� jeden z moich ludzi policzy� paczki. Zdaje si� Torlof, �e znowu b�dziesz mia� kogo� na sumieniu.

	/************************
	Ork gdzie� w pobli�y wyj�cia z kopalni niech b�dzie jakie� ma�e sk�adowisko z pakami rudy i mo�e niec tam npce czasami chodz�, �e niby sk�aduj� tam urobek - b�dzie to fajnie wygl�da�
	*************************/
	B_StopProcessInfos(self);
};	

INSTANCE DIA_Jurgen_Second (C_INFO)
{
	npc				= Grd_4090_Jurgen;
	nr				= 1;
	condition		= DIA_Jurgen_Second_Condition;
	information		= DIA_Jurgen_Second_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Jurgen_Second_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Torlof_TalkingWithJurgen))
	{
		return 1;
	};
};

FUNC VOID DIA_Jurgen_Second_Info()
{
	var C_NPC sher; sher = Hlp_GetNpc(Non_4088_Sher);
	var C_NPC tor; tor = Hlp_GetNpc(Sld_737_Torlof);
	B_FullStop(hero);
	if(Hlp_IsValidNpc(sher)){
	  B_FullStop(sher);
	};
	AI_TurnToNpc(self, tor);

	AI_Output (self, other, "DIA_Jurgen_Second_11_00"); //Czy�by? Wiesz, jakie s� zasady. Przykro mi Torlof, ale kt�ry� z kopaczy musi zap�aci� krwi� za Twoj� nieudolno��.
	AI_TurnToNpc(self, other);
   
	AI_TurnToNpc(self, hero);	
	
	/*************************
	Ork jest jakas animacja wskazywania r�k� czy co� takiego? jak tak to tu j� odpal
	*************************/

	AI_Output (self, other, "DIA_Jurgen_Second_11_01"); //We�miemy tego!
	AI_Output (other, self, "DIA_Jurgen_Second_15_02"); //To jaka� pomy�ka... Trafi�em tu przez Carlosa!
	AI_Output (self, other, "DIA_Jurgen_Second_11_03"); //To ju� Tw�j problem. Ale nie przejmuj si�, za chwil� nic ju� nie b�dzie Ci zaprz�ta� g�owy.
	B_StopProcessInfos(self);
	AI_GotoWP(sher, "FM_09");
   B_ExchangeRoutine(sher, "Death");
};	

// **************************************************

INSTANCE DIA_Jurgen_Third (C_INFO)
{
	npc				= Grd_4090_Jurgen;
	nr				= 1;
	condition		= DIA_Jurgen_Third_Condition;
	information		= DIA_Jurgen_Third_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Jurgen_Third_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Sher_End))
	{
		return 1;
	};
};

FUNC VOID DIA_Jurgen_Third_Info()
{
	var C_NPC sher; sher = Hlp_GetNpc(Non_4088_Sher);
	B_FullStop (hero);
	AI_TurnToNpc(self, sher);	
	
	/*************************
	Ork jest jakas animacja wskazywania r�k� czy co� takiego? jak tak to tu j� odpal
	*************************/
	AI_Output (self, other, "DIA_Jurgen_Third_11_01"); //Mi tam wszystko jedno komu wypruj� flaki. Zdychaj niewolniku!
	AI_DrawWeapon (self);
	B_LogEntry(CH4_GRD_NewMine, "Sher odda� za mnie �ycie... Nie wiem, co powiedzie�...");	
	B_StopProcessInfos(self);
   B_ChangeAttribute	(sher, ATR_HITPOINTS, -sher.attribute[ATR_HITPOINTS_MAX] + 10);
	B_StartAfterDialogFight(self, sher, false);
   Npc_SetTarget(self, sher); 
	//AI_StartState(self, ZS_ATTACK, 1, "");
};
