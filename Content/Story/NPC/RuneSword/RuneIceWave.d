instance RuneSword_IceWave(Npc_Default)
{
/*	var string name;
	var string slot;//vfxname	
	var string spawnPoint;//sfxname
	var int	id;
	var int flags;//chargecost
	var int voice;//damage
	var int npctype;//damagetype
	var int lp;//runetype
	0-NEUTRAL
	1-DARK
	2-FIRE
	3-LIGHT
	4-WATER	
	5-WIND
*/
	name	=	"Lodowa Fala";
	slot	=	"spellFX_Icewave";	
	flags	=	SPL_SENDCAST_ICEWAVE;
	voice	=	SPL_FREEZE_DAMAGE;
	npctype	=	DAM_MAGIC;
	exp	=	RuneID_Icewave;	
	lp	=	4;

};