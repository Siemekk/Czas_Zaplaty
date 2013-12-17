instance STT_300_Alberto (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Alberto";
	npctype		=	npctype_main;
	guild			=	GIL_GRD;
	level 		=	113;
	
	voice		=	12;
	id 			=	300;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	90;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	1196;
	attribute[ATR_HITPOINTS] 		=	1196;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",55,1,STT_ARMOR_M);
        
        B_Scale (self);
        Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill( self,NPC_TALENT_1H,2 );			
	Npc_SetTalentSkill		(self,HACK_NPC_TALENT_SNEAK,1);			
	Npc_SetTalentSkill		(self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 		
	Npc_SetTalentSkill		(self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 		
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);	

	//-------- inventory --------
	
	
	
	
	
	CreateInvItems	(self,ItFoApple,5);
	
	CreateInvItems	(self,ItFoBeer,3);
	
	CreateInvItems  (self,ItFo_Potion_Health_01,5); 
	
	CreateInvItems  (self,ItMinugget,50);
	
	EquipItem	(self,ItMw_1H_Sword_01 );
	EquipItem	(self,ItRw_Bow_Small_02 );

	CreateInvItems	(self,ItAmArrow,100);
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_300;
};

FUNC VOID Rtn_Start_300 ()
{
	TA_Stay	(00,00,18,00,"OM_203");
	TA_Stay (18,03,00,00,"OM_203");

};





