instance Non_20252_Smoke (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Uciekinier";
	Npctype =				NPCTYPE_ROGUE;
	guild =					GIL_NONE;      
	level =					13;
	
	voice =					6;
	id =					20252;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184;
	attribute[ATR_HITPOINTS] =		184;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",22,2,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	

	//-------- inventory --------   
    CreateInvItems (self,HEAD3_org,1);	      
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,13);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	EquipItem (self,HUN_MW_03);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_20252;
};

FUNC VOID Rtn_start_20252 ()
{
    TA_Smoke		(13,00,14,00,"LOCATION_23_CAVE_1_IN");	
    TA_Smoke		(14,00,13,00,"LOCATION_23_CAVE_1_IN");
};












