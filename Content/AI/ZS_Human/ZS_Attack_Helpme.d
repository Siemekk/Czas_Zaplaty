// Ten ZS jest troche bezSesu ;(
func void ZS_Attack_Helpme ()
{

	if ( Npc_IsPlayer( other ) )
	{
		// add_CollPool(self);	
		DailyHello_HeroAttackersCnt += 1;
		};

	////////////////////////////////////////////////////////////////////////////
	//////PrintDebugNpc		(PD_ZS_FRAME, "ZS_Attack_Helpme" );		
	C_ZSInit			();

	//PRINTGlobals		(PD_ZS_FRAME);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE,			B_CombatReactToDamage	);
	Npc_PercEnable  	(self, 	PERC_ASSESSSURPRISE	,		ZS_AssessSurprise		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC,			B_AssessMagic			);			
	Npc_PercEnable		(self,	PERC_ASSESSREMOVEWEAPON	,	B_CombatRemoveWeapon	);
	Npc_PercEnable		(self,	PERC_ASSESSENTERROOM	,	B_CombatAssessEnterRoom	);
	Npc_PercEnable		(self,	PERC_CATCHTHIEF			,	B_CombatCatchThief		);
	Npc_PercEnable(Self,PERC_NPCCOMMAND,B_CHECKSHEATH);
    
	
	B_WhirlAround		(self,	other);
	B_SelectWeapon		(self,	other);
    AI_SetWalkmode 		(self,	NPC_RUN);				// Walkmode f�r den Zustand
};

func int ZS_Attack_Helpme_Loop()
{
	//////PrintDebugNpc		(PD_ZS_LOOP,	"ZS_Attack_Helpme_Loop");		

	Npc_GetTarget		(self);
	//PRINTGlobals		(PD_ZS_DETAIL);
		
	//-------- Wenn Gegner Bewu�tlos oder Tod... --------
	if (C_NpcIsDown(other) || !Hlp_IsValidNpc(other))
	{
		//////PrintDebugNpc				(PD_ZS_CHECK,	"...Ziel ist kampf-unf�hig oder ung�ltig!");

		Npc_PerceiveAll				(self);		// n�tig, da Npc_GetNextTarget() auf der Liste der zuletzt Wahrgenommenen VOBs beruht
		Npc_SetAivar(self,AIV_LASTTARGET,  Hlp_GetInstanceID(other));
		if (Npc_GetNextTarget(self))			// Vorsicht: l�scht 'other', wenn kein neues Ziel gefunden
		{
			if	(Hlp_IsValidNpc(other)
			&&	!C_NpcIsDown(other)
			&&	Npc_CanSeeNpcFreeLOS(self,other)
			&&	!C_OtherIsToleratedEnemy(self,other))	// sonst ignorierte Feinde nicht in die Auswahl mit aufnehmen
			{
				//PrintDebugString	(PD_ZS_CHECK, "...neues Ziel gefunden: ", other.name);
			}
			else
			{
				//////PrintDebugNpc		(PD_ZS_CHECK, "...kein Neues Ziel vorhanden!");
				return 				LOOP_END;
			};
		}
		else
		{
			//////PrintDebugNpc			(PD_ZS_CHECK, "...KEIN neues Ziel gefunden!");
			return 					LOOP_END;
		};
	};

	if (Npc_GetStateTime(self) > 2)
	{
		//-------- Nahkampfdistanz zu gro� ? --------
		if ((!Npc_IsInFightMode(self, 	FMODE_FAR)	&&	!Npc_IsInFightMode(self,	FMODE_MAGIC))
		&&	(!Npc_IsInFightMode(other,	FMODE_FAR)	&&	!Npc_IsInFightMode(other,	FMODE_MAGIC))	)
		{
			//////PrintDebugNpc		(PD_ZS_CHECK,	"...WEDER NSC noch Gegner f�hren Fernkampfwaffen!" );
		
			if ( (Npc_GetDistToNpc(self, other)>HAI_DIST_ABORT_MELEE) && (Npc_GetAivar(self,AIV_LASTHITBYRANGEDWEAPON) == FALSE) )
			{
				//////PrintDebugNpc			(PD_ZS_CHECK,	"...Gegner au�erhalb Nahkampfreichweite & letzter Treffer nicht durch Fernkampfwaffe!");
					
				B_FullStop 				(self);
				//PRINTGlobals			(PD_ZS_CHECK);
				if (C_NpcIsHuman(other))
				{
					B_AssessAndMemorize (NEWS_DEFEAT,NEWS_SOURCE_WITNESS, self, self, other);
					
					if (Npc_GetPermAttitude (self, other) != ATT_HOSTILE) //MH: sonst kommt SVM p�ntig!
					{
						AI_PointAtNpc		(self,	other);
						B_Say				(self,	other,	"$RUNCOWARD");	
						AI_StopPointAt		(self);
					};
				};
				return 					LOOP_END;
			};
		}
	
		//-------- Fernkampfdistanz zu gro� ? --------
		else
		{	
			//////PrintDebugNpc				(PD_ZS_CHECK,	"...entweder NSC oder Gegner F�HREN Fernkampfwaffen!" );
		
			if (Npc_GetDistToNpc(self, other) > HAI_DIST_ABORT_RANGED)
			{
				//////PrintDebugNpc			(PD_ZS_CHECK,	"...Gegner au�erhalb Fernkampfreichweite!" );
				B_FullStop 				(self);
				return 					LOOP_END;
			};
		};	
		
		//-------- SC-Gegner rennt schon zu lange (davon) ? --------
		var int countPursuitCycles;									// 2. Z�hler neben StateTime f�r Verfolgungsabbruch nach  Zeit
		countPursuitCycles = countPursuitCycles + 1;	
		if (Npc_IsPlayer(other)
		&&	(C_BodyStateContains(other,BS_RUN) || C_BodyStateContains(other,BS_JUMP) || ((CmpNpc(other,hero))&&(C_BodyStateContains(hero,BS_WALK))&&(SprintEnabled)))
		&&	!Npc_IsInFightMode(self,FMODE_FAR)
		&&	!Npc_IsInFightMode(self,FMODE_MAGIC)
		&&	(C_GetAttackReason(self)!=AIV_AR_INTRUDER) )
		{
			if (countPursuitCycles > HAI_TIME_FOLLOW) 				// einige ZS_Attack_Helpme_Loop's lang verfolgen
			{
				//////PrintDebugNpc			(PD_ZS_CHECK, "...Gegner rennt schon zu lange weg!" );
				B_FullStop 				(self);
				if (C_NpcIsHuman(other))
				{
					B_AssessAndMemorize (NEWS_DEFEAT,NEWS_SOURCE_WITNESS, self, self, other);
					
					if (Npc_GetPermAttitude (self, other) != ATT_HOSTILE) //MH: sonst kommt SVM p�ntig!
					{
						AI_PointAtNpc		(self,	other);
						B_Say				(self,	other,	"$RUNCOWARD");	
						AI_StopPointAt		(self);
					};
					
					AI_Wait				(self,	5);
				};
				return					LOOP_END;
			};
		}
		else
		{
			countPursuitCycles = 0;
		};
	
		//-------- Auswahl/Wechsel der richtigen Waffe --------
		//PRINTGlobals					(PD_ZS_DETAIL);
		Npc_ClearAIQueue				(self);						// falls sich FAI-Moves schneller ansammeln, als sie abgearbeitet werden k�nnen.
		B_SelectWeapon					(self,	other);	
		AI_SetWalkmode 					(self,	NPC_RUN);			// falls durch den Waffenwechsel ein AI_Standup() passiert!
		Npc_SetStateTime				(self, 	0);
	};

	/* -------- eigentliches Anwerfen der FAI -------- */
	if (Npc_GetAivar(other,AIV_INVINCIBLE)==FALSE) 					//MH: wird z.B. im Dialog auf True gesetzt, d.h. verfolgter SC kann sich unterhalten, ohne von aNSC angegriffen zu werden
	{
		AI_Attack			(self);
	}
	else
	{
		AI_Wait				(self,	0.5);
	};
			
	//-------- Flucht antreten? --------
	if	((self.npctype==NPCTYPE_AMBIENT)
	||	(self.npctype==NPCTYPE_OW_AMBIENT)
	||	(self.npctype==NPCTYPE_MINE_AMBIENT)
	||	(self.fight_Tactic == FAI_HUMAN_COWARD))&&(C_SlfIsCoward(self))
	{
		if ( (self.fight_Tactic == FAI_HUMAN_COWARD) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2) ) )&&(self.guild!=GIL_TPL)
		{
			//////PrintDebugNpc(PD_ZS_CHECK, "...coward flees!" );
			AI_StartState( self, ZS_Flee, 0, "" );			
		};
		if ( (self.fight_Tactic == FAI_HUMAN_STRONG) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 4 * 3) ) )&&(self.guild!=GIL_TPL)
		{
			//////PrintDebugNpc(PD_ZS_CHECK, "...strong flees!" );
			AI_StartState( self, ZS_Flee, 0, "" );
		};	  
		if ( (self.fight_Tactic == FAI_HUMAN_MAGE) && (self.attribute[ATR_MANA] < (self.attribute[ATR_MANA_MAX] / 5)) )&&(self.guild!=GIL_TPL)
		{
			//////PrintDebugNpc(PD_ZS_CHECK, "...mage flees!" );
			AI_StartState( self, ZS_Flee, 0, "" );
		};
		if ( (self.fight_Tactic == FAI_HUMAN_RANGED) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 3)) )&&(self.guild!=GIL_TPL)
		{
			//////PrintDebugNpc(PD_ZS_CHECK, "...ranged fighter flees!" );
			AI_StartState( self, ZS_Flee, 0, "" );
		};
	};

	return				LOOP_CONTINUE;
};

func void ZS_Attack_Helpme_End()
{	
	//////PrintDebugNpc			(PD_ZS_FRAME, "ZS_Attack_Helpme_End" );		
	
	other = Hlp_GetNpc(Npc_GetAivar(self,AIV_LASTTARGET));			//SN: 'other' wird durch ein erfolgloses Npc_GetNextTarget() manchmal gel�scht!

	//PRINTGlobals			(PD_ZS_CHECK);
	
	/* ---- Ist der Gegner "nur" bewu�tlos...  ---- */
	if ( Npc_IsInState(other, ZS_Unconscious) && (self.fight_tactic != FAI_HUMAN_RANGED))
	{
		//////PrintDebugNpc		(PD_ZS_CHECK, "...Ziel bewu�tlos/magisch schlafend und NSC kein purer Fernk�mpfer!" );

		if (Npc_GetAttitude (self,	other) == ATT_FRIENDLY)
		{
			B_RemoveWeapon	(self);
			B_Say			(self, 	other,	"$LETSFORGETOURLITTLEFIGHT");
			C_StopLookAt	(self);
			AI_StartState	(self,	ZS_HealSelf,	1,	"");
		};

		if ((Npc_GetPermAttitude(self, other) == ATT_HOSTILE)
		||	((C_GetAttackReason(self) == AIV_AR_INTRUDER) && Npc_HasNews(self, NEWS_DEFEAT,self, other)))
		{
		    // ---- ... wird er "gefinished" wenn er ein Feind oder Eindringling ist... ---- 
			//////PrintDebugNpc	(PD_ZS_CHECK, "...Hostile/Intruder wird gefinished" );
			B_FullStop		(self);
			//PRINTGlobals	(PD_ZS_CHECK);
			AI_FinishingMove(self,	other);						
			AI_Wait			(self,	1);
		} 
		else 
		{
			// ---- ... oder ihm geraten es nicht wieder zu versuchen ---- 
			//////PrintDebugNpc	(PD_ZS_CHECK, "...Nicht hostile" );
			B_Say			(self, other, "$NEVERTRYTHATAGAIN" );		
		};		
	};
	
	//-------- Nachbereitungen --------
	B_RemoveWeapon			(self);
	C_StopLookAt			(self);
	B_ResetTempAttitude		(self);
	B_SetAttackReason		(self,	AIV_AR_NONE);
	if (Npc_GetAivar(other,AIV_GUARDPASSAGE_STATUS) == AIV_GPS_PUNISH)
	{
		Npc_SetAivar(other,AIV_GUARDPASSAGE_STATUS,  AIV_GPS_FIRSTWARN);
	};
	
	//-------- Pl�ndern ! --------
	if (!C_NpcIsBoss(self) && C_NpcIsHuman(other) && (Npc_IsInState(other, ZS_Unconscious) || Npc_IsDead(other) || Npc_IsInState(other, ZS_MagicSleep)) ) 
	{
		if (self.fight_tactic != FAI_HUMAN_RANGED)
		{
			//////PrintDebugNpc	(PD_ZS_CHECK,	"...Pl�nderbedingungen er�llt!");
			AI_StartState	(self, ZS_AssessBody, 1, "");
			return;
		};
	};

	//-------- Heilen ! --------
	AI_StartState			(self,	ZS_HealSelf,	1,	"");
	DailyHello_HeroAttackersCnt -= 1;	
};