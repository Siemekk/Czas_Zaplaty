instance Grd_618_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	14;
	voice 		=	6;
	id 			=	618;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 200;
	attribute[ATR_HITPOINTS] 	= 200;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Bald",1,1,GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_04);
	CreateInvItem	(self,ItFoBeer);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,42);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_618;
};

FUNC VOID Rtn_start_618 ()
{
	TA_Stand	(05,00,00,00,"NC_EN_MAINHALL_GATE_GUARD_R");
	TA_Sleep	(00,00,05,00,"NC_EN_BARACK_03");
};



