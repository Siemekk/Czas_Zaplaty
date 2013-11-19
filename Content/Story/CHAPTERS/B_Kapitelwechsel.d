// **************
// Kapitelwechsel
// **************

FUNC VOID B_Kapitelwechsel (VAR INT neues_Kapitel)
{
	Kapitel = neues_Kapitel;
	B_Give_ROOT(Kapitel);
	//***************************************************************************
	//	KAPITEL 1
	//***************************************************************************
	if	(neues_Kapitel == 1)
	{
		//PrintDebugNpc	(PD_MISSION, "---=== DAS ERSTES KAPITEL ===---");
		
		introducechapter ("Rozdzia� 1","Witamy w Kolonii!","chapter1.tga","chapter.wav", 6000);
		//introducechapter ("Chapter 1","Welcome to the colony","chapter1.tga","chapter.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 2
	//***************************************************************************
	else if (neues_Kapitel == 2)
	{
		//PrintDebugNpc	(PD_MISSION, "---=== DAS ZWEITE KAPITEL ===---");

		//-------- H�ndler auff�llen --------
	
		//-------- Oberwelt-Monster nochmal "nachf�llen" --------	
		
		B_DispearNPC(Snf_Molerat1);
		B_DispearNPC(Snf_Molerat2);
		B_DispearNPC(Snf_Molerat3);
		B_DispearNPC(Snf_Molerat4);
		
		Wld_InsertNpc(Fat_Snf_Molerat1,"OW_CAVE2_SNAPPER_MOVEMENT2");
		Wld_InsertNpc(Fat_Snf_Molerat2,"OW_CAVE2_SNAPPER_MOVEMENT2");
		Wld_InsertNpc(Fat_Snf_Molerat3,"OW_CAVE2_SNAPPER_MOVEMENT2");
		Wld_InsertNpc(Fat_Snf_Molerat4,"OW_CAVE2_SNAPPER_MOVEMENT2");
		Wld_InsertNpc(Fat_Snf_Molerat5,"OW_CAVE2_SNAPPER_MOVEMENT2");		
		
		B_ExchangeRoutine(snaf,"SCARED");
		//-------- InExtremo vorbereiten --------
		
		introducechapter ("Rozdzia� 2","Szpieg","chapter2.tga","chapter.wav", 6000);
		//introducechapter ("Chapter 2","The Minecrawler's nest","chapter2.tga","chapter.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 3
	//***************************************************************************
	else if (neues_Kapitel == 3)
	{
		//PrintDebugNpc	(PD_MISSION, "---=== DAS DRITTE KAPITEL ===---");

		introducechapter ("Rozdzia� 3","P�tla si� zaciska","chapter3.tga","chapter.wav", 6000);
		//introducechapter ("Chapter 3","Artifacts of ancient power","chapter3.tga","chapter.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 4
	//***************************************************************************
	else if (neues_Kapitel == 4)
	{
		//PrintDebugNpc	(PD_MISSION, "---=== DAS VIERTE KAPITEL ===---");
		introducechapter ("Rozdzia� 4","Nowy Ob�z","chapter4.tga","chapter.wav", 6000); 
		//introducechapter ("Chapter 4","Xardas","chapter4.tga","chapter.wav", 6000); 
	}
	
	//***************************************************************************
	//	KAPITEL 5
	//***************************************************************************
	else if (neues_Kapitel == 5)
	{
		//PrintDebugNpc	(PD_MISSION, "---=== DAS F�NFTE KAPITEL ===---");
		introducechapter ("Rozdzia� 5","Wysoka stawka","chapter5.tga","chapter.wav", 6000);
		//introducechapter ("Chapter 5","The custodians of the portal","chapter5.tga","chapter.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 6
	//***************************************************************************
	else if (neues_Kapitel == 6)
	{
		//PrintDebugNpc	(PD_MISSION, "---=== DAS SECHSTE KAPITEL ===---");
		introducechapter ("Rozdzia� 6","Czas Zap�aty","chapter6.tga","chapter.wav", 6000);
		//introducechapter ("Chapter 6","The sleeper's halls","chapter6.tga","chapter.wav", 6000);
	};
};

func int C_IsChapter(var int chapter)
{
	if (Kapitel == chapter)
	{
		return TRUE;
	};
};
