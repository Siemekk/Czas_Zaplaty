// ***************************** INFOS ****************************************//

instance KDW_605_Riordian_HEALINFO (C_INFO)
{
	npc				= KDW_605_Riordian;
	nr				= 100;
	condition		= KDW_605_Riordian_HEALINFO_Condition;
	information		= KDW_605_Riordian_HEALINFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem ranny. Mo�esz co� na to poradzi�?"; 
};

FUNC int KDW_605_Riordian_HEALINFO_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	{
		return TRUE;
	};
};

FUNC void KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Jestem ranny. Mo�esz co� na to poradzi�?
	AI_Output (self, other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Tymi s�owy przywo�uj� uzdrawiaj�c� si��! Niech Twe cia�o i duch zn�w zaznaj� spokoju!
	
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
	Snd_Play("MFX_Heal_Cast");
	B_StopProcessInfos(self);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE", self, self, 1, 0, DAM_MAGIC, FALSE);	
};  
/*------------------------------------------------------------------------
							GREET									
------------------------------------------------------------------------*/

instance KDW_605_Riordian_GREET (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_GREET_Condition;
	information		= KDW_605_Riordian_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witaj, magu!"; 
};

FUNC int KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};

FUNC void KDW_605_Riordian_GREET_Info()
{
	AI_Output(other, self,"KDW_605_Riordian_GREET_Info_15_01"); //Witaj, magu!
	AI_Output(self, other,"KDW_605_Riordian_GREET_Info_14_02"); //Jestem Riordian, alchemik. Zgaduj�, �e szukasz magicznego napoju?
	
   Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Riordian, jeden z mag�w wody, sprzedaje magiczne wywary. Znajd� go w laboratorium alchemicznym, na g�rnym poziomie.");
};

/*------------------------------------------------------------------------
							Ornamenty								
------------------------------------------------------------------------*/

instance KDW_605_Riordian_All (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_All_Condition;
	information		= KDW_605_Riordian_All_Info;
	important		= 0;
	permanent		= 0;
	description		= "Odnalaz�em wszystkie ornamenty."; 
};

FUNC int KDW_605_Riordian_All_Condition()
{
	return ritual_time_ok;
};

FUNC void KDW_605_Riordian_All_Info()
{
	AI_Output(other, self,"KDW_605_Riordian_All_Info_15_01"); //Odnalaz�em wszystkie ornamenty.
	
   if (ornament_wait >= Wld_GetDay())
	{
		AI_Output(self, other,"KDW_605_Riordian_All_Info_14_02"); //Dokona�e� wielkiego czynu!
		AI_Output(self, other,"KDW_605_Riordian_All_Info_14_03"); //We� w podzi�ce za trud te mikstury.
		
      CreateInvItems (self, ItFo_Potion_Health_01,	5); 
		B_GiveInvItems (self,hero, ItFo_Potion_Health_01,	5);
		CreateInvItems (hero, ItFo_Potion_Mana_01,		5);
		CreateInvItems (hero, ItFo_Potion_Health_02,	3);
		CreateInvItems (hero, ItFo_Potion_Mana_02,		3);
		CreateInvItems (hero, ItFo_Potion_Health_03,	1);
		CreateInvItems (hero, ItFo_Potion_Mana_03,		1);
		CreateInvItems (hero, ItFo_Potion_Haste_02,		2);
      
		AI_Output(other, self,"KDW_605_Riordian_All_Info_15_04"); //Bardzo si� przydadz�, dzi�kuj�. Saturas prosi�, aby� poszed� na dziedziniec.
		AI_Output(self, other,"KDW_605_Riordian_All_Info_14_05"); //Rusz� natychmiast!
		B_LogEntry(CH3_NON_Ornament, "Riordian pr�cz podzi�ki, podarowa� mi te� u�yteczne mikstury, zanim ruszy� na wezwanie.");
		Npc_ExchangeRoutine(self,"RIT");
	}
	else
	{
		AI_Output(self, other,"KDW_605_Riordian_All_Info_14_06"); //Sp�ni�e� si�. Tw�j wysi�ek poszed� na marne...
	};
   
	B_StopProcessInfos(self);
};  
