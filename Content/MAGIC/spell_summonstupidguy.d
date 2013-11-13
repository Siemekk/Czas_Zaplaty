//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es k�nnen keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgef�hrt, es k�nnen weitere Invest kommen, zB.bei Heal nach jedem P�ppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den n�chsten Level


func int Spell_Logic_Summong�upek(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Summong�upek");
	
	//Handle scroll:

	Correct_ScrollMana(SPL_SENDCAST_SUMMONSKELETON,manaInvested);
		
	if (manaInvested >= SPL_SENDCAST_SUMMONSKELETON) 	
	{ 
		if (Npc_IsPlayer(self))
	    {
		//	Wld_SpawnNpcRange	(self,	VLK_9999_Cz�owiek,	1,	300);
		}
		else
		{
	//		Wld_SpawnNpcRange	(self,	VLK_9999_Cz�owiek,	1,	600);
		};
		
		return SPL_SENDCAST; 
	}
	else
	{
		return SPL_NEXTLEVEL;	
	};
};