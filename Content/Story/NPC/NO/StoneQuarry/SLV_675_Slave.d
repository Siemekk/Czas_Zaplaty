instance SLV_675_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Slave;
	npctype =						npctype_ambient;
	guild =							GIL_SLV;      
	level =							5;
	
	
	voice =							4;
	id =							675;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",101,1,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self,ItFoRice,1);



	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_675;
};

FUNC VOID Rtn_start_675 ()
{
    TA_PickStoneswall	(0,10,10,10,"OW_QUARRY_TOP2_05");
    TA_SlaveRest       	(10,10,16,10,"NC_EN_SLVCAMP_02");
    TA_PickStoneswall	(16,10,0,10,"OW_QUARRY_TOP2_06");  
	
};

