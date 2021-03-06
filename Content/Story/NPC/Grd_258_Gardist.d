instance Grd_258_Gardist (Npc_Default)
{
	//-------- primary data --------
	//Chase Hero
	name 		=	NAME_Gardist;
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice 		=	7;
	id 			=	258;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 105;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",114,1,GRD_ARMOR_M);

	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_03);
	EquipItem	(self,GRD_RW_02);
	CreateInvItems	(self,ItAmBolt,40);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItem	(self,ItFoBeer);
	CreateInvItem	(self,ItFo_mutton_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_258;
};

FUNC VOID Rtn_start_258 ()
{
    TA_MIS_TryToCloseSthGate	(00,30,20,00,"OCR_OUTSIDE_HUT_Z5");	//
    TA_MIS_TryToCloseSthGate	(20,00,07,00,"OCR_OUTSIDE_HUT_Z5"); //
};


FUNC VOID Rtn_DEAD_258 ()
{
	TA_Stay		(05,00,10,00,"INVISIBLE2");
	TA_Stay 	(10,00,05,00,"INVISIBLE2");

};
