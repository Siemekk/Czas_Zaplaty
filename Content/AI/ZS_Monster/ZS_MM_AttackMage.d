func void B_Pupil_ReactToOthAttack() //moved January 03, 2009 
{
	//TODO: \|/
// 	if(HeroHasPupil)&&(Npc_GetDistToPlayer(mywolf) < 3000)//bugfix...CRASHFIX xD
// 	{		
// 	if(!Npc_IsInState(self,ZS_Pupil_Attack))
// 	{
// 		pr/int("leave alone rick! :O");		
// 		Npc_SetTarget 	(mywolf,self);
// 		Npc_ClearAIQueue(mywolf);
// 		AI_StartState 	(mywolf, ZS_Pupil_Attack, 0, "");	
// 	};
// 	};
};

func void ZS_MM_AttackMage ()
{	
	//////PrintDebugNpc		(PD_ZS_FRAME, "ZS_MM_AttackMage" );		
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE,			B_MMM_CombatReactToDamage	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC,			B_AssessMagic				);	
	Npc_PercEnable(Self,PERC_NPCCOMMAND,B_CHECKCOLLIDEDAMAGE_MONSTER);		
    
	Npc_GetTarget		(self);
	B_SelectWeapon		(self,	other);
	if ( Npc_IsPlayer( other ) )
	{
		B_Pupil_ReactToOthAttack();
	};		
};

func int ZS_MM_AttackMage_Loop()
{		
	Npc_GetTarget		(self);
	/* -------- Wenn Gegner Bewu�tlos oder Tod... -------- */
	if ( Npc_IsInState	(other, ZS_Unconscious) || Npc_IsDead(other) || Npc_IsInState(other, ZS_Dead)) // WORKAROUND: es kann vorkommen, da� der SC in Zustand ZS_Dead landet, aber noch bewu�tlos ist!!!
	{
		if ( Npc_IsNextTargetAvailable(self) ) 
		{
			Npc_GetNextTarget	(self);
		}
		else
		{
			return 				LOOP_END;
		};
	};

	if (Npc_GetStateTime(self) >= 3)
	{
		//PRINTGlobals	(PD_MST_DETAIL);
		/* -------- Auswahl/Wechsel der richtigen Waffe -------- */
		Npc_ClearAIQueue(self);					// falls sich FAI-Moves schneller ansammeln, als sie abgearbeitet werden k�nnen.
		B_SelectWeapon	(self,	other);
		Npc_SetStateTime(self, 	0);
	};

	/* -------- eigentliches Anwerfen der FAI -------- */
	AI_Attack			(self);
	AI_Wait				(self, 0.2);
	return				LOOP_CONTINUE;
};

func void ZS_MM_AttackMage_End()
{	
	//////PrintDebugNpc			(PD_ZS_FRAME, "ZS_MM_AttackMage_End" );		
	
	//-------- Waffe wegstecken --------
	B_RemoveWeapon			(self);
};

func void B_MMM_CombatReactToDamage ()
{
	//////PrintDebugNpc				(PD_ZS_FRAME, "B_MMM_CombatReactToDamage");
	Npc_PercEnable(Self,PERC_NPCCOMMAND,B_CHECKCOLLIDEDAMAGE_MONSTER);
	if (Npc_GetAivar(self,AIV_MM_SPECREACTTODAMAGE) != FALSE)
	{
	B_SpecialCombatDamageReaction(self,other);
	};	
	Npc_SetTarget				(self,	other);				// neuen Angreifer aufs Korn nehmen!
};