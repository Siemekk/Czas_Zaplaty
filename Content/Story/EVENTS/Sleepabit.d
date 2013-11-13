//****************************
// 		PC_Sleep
//****************************

func void PC_Sleep (var int t)
{
	AI_StopProcessInfos(self);		// [SK] ->muss hier stehen um das update zu gew�hrleisten
	Npc_SetAivar(self,AIV_INVINCIBLE,FALSE);
// 	if	(Wld_IsTime(00,00,t,00))
// 	{
// 	}
// 	else
// 	{
// 		t = t + 24;
//
// 	};
	SleepFX_HeroSleep	(t);

	//...damit der Spieler dieses Feature nicht zum H�ttepl�ndern ausnutzt!
};

func void SLEEPABIT_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero);
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: ge�ndert, damit kontrollierte NSCs nicht schlafen k�nnen!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) )
	{
		Npc_SetAivar(self,AIV_INVINCIBLE,TRUE);
		MOBSIDIALOG = BEDDIALOG;
		B_ProcessInfos (her);
	};
};

//-------------------- Gar nicht schlafen -------------------------

INSTANCE PC_NoSleep (c_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_NoSleep_Condition;
	information		= PC_NoSleep_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_ENDE;
};

FUNC INT PC_NoSleep_Condition()
{
	if(MOBSIDIALOG != PRODUCTIONDIALOG)&&(MOBSIDIALOG	!=	DUALSWDDIALOG)&&((MOBSIDIALOG > 30)||(MOBSIDIALOG < 21))
	{
		return 1;
	};
};

func VOID PC_NoSleep_Info()
{
	AI_StopProcessInfos (self);
	Npc_SetAivar(self,AIV_INVINCIBLE,FALSE);
	MOBSIDIALOG = NONE;
	I_DisableCinemaScope(); //dodane przez Budzisa 2012-03-10
};

//---------------------- morgens --------------------------------------

INSTANCE PC_SleepTime_Morning (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_SleepTime_Morning_Condition;
	information		= PC_SleepTime_Morning_Info;
	important		= 0;
	permanent		= 1;
	description		= "�pij do poranka";
};

FUNC INT PC_SleepTime_Morning_Condition()
{
	if(MOBSIDIALOG == BEDDIALOG)
	{
		return 1;
	};
};

func void PC_SleepTime_Morning_Info ()
{
	PC_Sleep (8);	// SN: ge�ndert, da um 7 Uhr noch keiner der NSCs wach ist!
};

//--------------------- mittags -----------------------------------------

INSTANCE PC_SleepTime_Noon (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_SleepTime_Noon_Condition;
	information		= PC_SleepTime_Noon_Info;
	important		= 0;
	permanent		= 1;
	description		= "�pij do po�udnia";
};

FUNC INT PC_SleepTime_Noon_Condition()
{
	if(MOBSIDIALOG == BEDDIALOG)
	{
		return 1;
	};
};

func void PC_SleepTime_Noon_Info ()
{
	PC_Sleep (12);
};

//---------------------- abend --------------------------------------

INSTANCE PC_SleepTime_Evening (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_SleepTime_Evening_Condition;
	information		= PC_SleepTime_Evening_Info;
	important		= 0;
	permanent		= 1;
	description		= "�pij do wieczora";
};

FUNC INT PC_SleepTime_Evening_Condition()
{
	if(MOBSIDIALOG == BEDDIALOG)
	{
		return 1;
	};
};

func void PC_SleepTime_Evening_Info ()
{
	PC_Sleep (19);
};

//------------------------ nacht -----------------------------------------

instance PC_SleepTime_Midnight (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_SleepTime_Midnight_Condition;
	information		= PC_SleepTime_Midnight_Info;
	important		= 0;
	permanent		= 1;
	description		= "�pij do p�nocy";
};

FUNC INT PC_SleepTime_Midnight_Condition()
{
	if(MOBSIDIALOG == BEDDIALOG)
	{
		return 1;
	};
};

func VOID PC_SleepTime_Midnight_Info()
{
	PC_Sleep (0);
};


