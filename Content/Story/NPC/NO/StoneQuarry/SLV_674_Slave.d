instance SLV_674_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Slave;
	npctype =						npctype_ambient;
	guild =							GIL_SLV;      
	level =							5;
	
	
	voice =							4;
	id =							674;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		55;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",10,2,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self,ItFoRice,1);



	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_674;
};

FUNC VOID Rtn_start_674 ()
{
    TA_PickStoneswall	(0,10,10,10,"OW_QUARRY_TOP_05");
    TA_SlaveRest       	(10,10,16,10,"NC_EN_SLVCAMP_02");
    TA_PickStonesGround	(16,10,0,10,"OW_QUARRY_BOTTOM_01");  
	
};

