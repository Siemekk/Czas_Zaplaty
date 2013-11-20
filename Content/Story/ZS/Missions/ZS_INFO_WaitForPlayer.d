func void B_TriggerInfoCam()
{
   //    AI_PlayAni (self,"T_HGUARD_2_STAND");	
   //   Npc_ClearAiQueue(self);		
	B_SmartTurnToNpc(self,hero);	
	WLD_SendTrigger("INFO_CAM");
	Global_Cinematic_FORCEANIS=FALSE;
	CinematicReset(2,0);
/*0*/	CinematicDialog(RBL_4064_Info,pc_hero,"W ko�cu jeste�. Urt dobrze ci� opisa�, rzeczywi�cie masz paskudn� mord�...","DIA_Infor_First_13_00.WAV",4);
/*1*/	CinematicDialog(pc_hero,RBL_4064_Info,"Nie przyszed�em tu, �eby pogada� o moim wygl�dzie. M�w, co si� sta�o w obozie.","DIA_Infor_First_15_01.WAV",5);		
/*2*/	CinematicDialog(RBL_4064_Info,pc_hero,"Stra�nicy uderz� na Ob�z Rebeliant�w!","DIA_Infor_First_13_02.WAV",3);		
/*3*/	CinematicDialog(pc_hero,RBL_4064_Info,"O kurwa! Musz� ostrzec Ratforda i reszt�... Co to za ha�as?","DIA_Infor_First_15_03.WAV",4);		
/*4*/	CinematicDialog(RBL_4064_Info,pc_hero,"Stra�nicy! Musieli i�� za mn� od obozu.","DIA_Infor_First_13_04.WAV",2);		
/*5*/	CinematicDialog(RBL_4064_Info,pc_hero,"","",9);		
/*6*/	CinematicDialog(RBL_4064_Info,pc_hero,"Uciekaj, postaram si� ich zatrzyma� jak najd�u�ej...","DIA_Infor_First_13_05.WAV",3);		
/*7*/	CinematicDialog(Nameless_SecondMeet,pc_hero,"Mo�e pomog�.","DIA_Infor_First_13_06.WAV",2);		

   Log_CreateTopic(CH3_RBL_OldCampAttack, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_OldCampAttack, LOG_RUNNING);
	B_LogEntry(CH3_RBL_OldCampAttack, "Gomez zaatakuje Ob�z Rebeliant�w. Wszyscy si� tego spodziewali, ale by�em pewien, �e atak nie nast�pi tak szybko. Musz� ostrzec Ratforda i reszt�.");

	Log_SetTopicStatus(CH3_RBL_OldCampInfo, LOG_SUCCESS);
	B_LogEntry(CH3_RBL_OldCampInfo, "Informator Urta powiedzia� mi, �e stra�nicy uderz� na Ob�z Rebeliant�w. Musz� ostrzec Ratforda!");
   
   Rick_meets_informant = true;
};

func void ZS_INFO_WaitForPlayer()
{	
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	Npc_PercEnable  (self,	PERC_ASSESSTALK, 	B_TriggerInfoCam);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);
	AI_GotoWP		(self, self.wp);
	
	if (Wld_IsFPAvailable(self,"FP_STAND"))
	{																	


	}
	else
	{
	};
	
};

func void ZS_INFO_WaitForPlayer_loop()
{
	var int zufall;
	zufall = Hlp_Random(1000);
	if (Npc_GetDistToNpc(self,hero)<800)
	{
		B_SmartTurnToNpc(self,hero);
	}
	else
	{
		AI_AlignToFP	(self);
		if (zufall >= 600)
    	{
    		AI_PlayAni (self,"T_SEARCH");
    	};
	};
	
    AI_WAIT(self,1);
};

func void ZS_INFO_WaitForPlayer_end()
{
};	


