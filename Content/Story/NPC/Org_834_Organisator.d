instance Org_834_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Organisator;
	Npctype =						Npctype_Guard;
	guild =							GIL_SLV;       
	level =							5;
	
	voice =							13;
	id =							834;



	//-------- abilities --------

	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,0,"Hum_Head_FatBald",12 ,2,ORG_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
	
	Npc_SetTalentSkill (self,HACK_NPC_TALENT_SNEAK,1);	
	
	//-------- inventory --------                                    

	EquipItem (self,ALL_MW_02);
	CreateInvItems (self,ItKeLockpick,2);		
	CreateInvItems(self,ItMiNugget,14);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,3);
	CreateInvItems (self,ItFo_Potion_Health_01,2);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItAt_Claws_01);
	

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_834;

};

FUNC VOID Rtn_start_834 ()
{
	TA_GuardWheelOpen	(23,30,08,00,"OW_PATH_067_WHEEL");
	TA_GuardWheelOpen	(08,00,23,30,"OW_PATH_067_WHEEL");
};

FUNC VOID Rtn_NC1_834 ()
{
	TA_Guard	(23,30,08,00,"NC_TAVERN_OUT_GUARD2");
	TA_Guard	(08,00,23,30,"NC_TAVERN_OUT_GUARD2");
};


FUNC VOID Rtn_NC2_834 ()
{
	TA_GuardWheelOpen	(23,30,08,00,"OW_PATH_067_WHEEL");
	TA_GuardWheelOpen	(08,00,23,30,"OW_PATH_067_WHEEL");
};







