//////////////////////////////////////////////////////////////////////////
//	B_CheckItemAnimalAnimal
//	===========
//	�berpr�ft den Inventoryslot 'slot' in der 'category' und ruft
//	bei Bedarf B_TransferItem() auf.
//	-> ben�tigt 'self' und 'other'
//	-> initialisiert 'item' selbst
//	-> return: 	- FALSE, wenn kein item genommen wurde
//				- TRUE, wenn item genommen wurde
//////////////////////////////////////////////////////////////////////////
func int B_CheckItemAnimal (var int category, var int slot)
{
	//PrintDebugInt		(PD_ZS_CHECK,	"B_CheckItemAnimal");

	var string printText;
	printText = IntToString		(slot);

	if 		(category == INV_WEAPON )	{	printText = ConcatStrings("...found INV_WEAPON_",		printText);	}
	else if	(category == INV_ARMOR	)	{	printText = ConcatStrings("...found INV_ARMOR_",		printText);	}	
	else if (category == INV_RUNE	)	{	printText = ConcatStrings("...found INV_RUNE_",			printText);	}
	//else if (category == INV_POTIONS)	{	printText = ConcatStrings("...found INV_POTIONS_",		printText);	}
	else if (category == INV_FOOD	)	{	printText = ConcatStrings("...found INV_FOOD_",			printText);	}
	else if (category == INV_DOC	)	{	printText = ConcatStrings("...found INV_DOC_",			printText);	}    
	else if (category == INV_MISC	)	{	printText = ConcatStrings("...found INV_MISC_",			printText);	}
	else								{	printText = ConcatStrings("...found unknown category #",printText);	};
	
	var int count;  
	count = Npc_GetInvItemBySlot(other, category,slot);  			// initialisiert 'item' und gibt Anzahl zur�ck
	//PrintDebugInt(PD_ZS_DETAIL, IntToString(count));
	
	if (count > 0)
	{
		//PrintDebugInt(PD_ZS_CHECK, printText);

		// NEU: Nimmt nur Erz und davon nur die H�lfte!
		if (Hlp_IsItem(item, ItMiNugget))
		{
			B_TransferItems(count/2);
			return TRUE;
		};
	
		// CS NEU: Nimmt personalisierte Waffen
		if (Npc_OwnedByNpc(item,self))
		{
			B_TransferItems(1);
			return TRUE;
		};
		
	};
	

	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	B_Plunder
//	=========
//	Durchsucht alle Inventoryslots, �berpr�ft, welche Gegenst�nde er
//	haben will, und nimmt sie sich. Durchsucht werden:
//
//	alt:
//	----
//	-  6 Slots Waffen
//	-  2 Slots R�stungen
//	-  ? Slots Runen & Scrolls
//	-  ? Slots Artefakte
//	- 15 Slots Nahrung
//	- 15 Slots Verschiedenes
//
//	neu:
//	----
//	- Dem Opfer wird die H�lfte des vorhandenen Erzes abgenommen.
//
//	-> Gibt Anzahl der gepl�nderten Gegenst�nde zur�ck.
//////////////////////////////////////////////////////////////////////////
func int B_PlunderNormalAnimal	()
{
	//PrintDebugInt( PD_ZS_CHECK, "B_Plunder" );

	var int	amountPlundered;
	amountPlundered = 0;
	
	//-------- Durchsuchen der WEAPONS ---------
	// Zur�ckgenommene Waffen werden nicht mitangegeben bei amountPlundered, da sich die SVMs dabei nur auf Erz beziehen.
	// Z.Zt. ist INV_MAX_WEAPONS noch auf 6
	
	B_CheckItemAnimal(INV_WEAPON,	1	);
	B_CheckItemAnimal(INV_WEAPON,	2	);
	B_CheckItemAnimal(INV_WEAPON,	3	);
	B_CheckItemAnimal(INV_WEAPON,	4	);
	B_CheckItemAnimal(INV_WEAPON,	5	);
	B_CheckItemAnimal(INV_WEAPON,	6	);

	//-------- Durchsuchen von MISC ---------
	if(	B_CheckItemAnimal(INV_MISC,	1	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	2	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	3	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	4	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	5	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	6	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	7	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	8	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	9	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	10	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	11	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	12	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	13	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	14	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	15	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	16	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	17	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	18	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	19	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	20	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	21	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	22	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	23	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	24	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	25	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	26	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	27	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	28	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_MISC,	29	) )	{ amountPlundered = amountPlundered + 1; };
	//////////////////////////////////
	
	if(	B_CheckItemAnimal(INV_FOOD,	1	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_FOOD,	2	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_FOOD,	3	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItemAnimal(INV_FOOD,	4	) )	{ amountPlundered = amountPlundered + 1; };
	
	//-------- Anzahl gepl�nderter Items ausgeben ---------
	//PrintDebugInt(PD_ZS_CHECK, "...Anzahl gepl�nderter Items: ", amountPlundered);

	//-------- R�ckgabewert ---------
	return amountPlundered;
};
func int B_PlunderAnimal (var C_NPC oth)
{
	
};