
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scorpio_Exit (C_INFO)
{
	npc			= GRD_205_SCORPIO;
	nr			= 999;
	condition	= DIA_Scorpio_Exit_Condition;
	information	= DIA_Scorpio_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scorpio_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scorpio_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

var int scorpio_food;

INSTANCE DIA_Scorpio_Hello (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 1;
	condition		= DIA_Scorpio_Hello_Condition;
	information		= DIA_Scorpio_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Scorpio_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 450)&&(Npc_KnowsInfo (hero, DIA_Pacho_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Hello_Info()
{
	AI_TurnToNpc (self,other);
   AI_DrawWeapon (hero);
	AI_Output (self, other, "DIA_Scorpio_Hello_11_01"); //Schowaj �elazo, zanim komu� stanie si� krzywda.
	AI_Output (other, self, "DIA_Scorpio_Hello_15_02"); //Tw�j kumpel mnie obrazi�.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_03"); //Cz�owieku on ma pochlastane struny g�osowe. 
	AI_Output (self, other, "DIA_Scorpio_Hello_11_04"); //Pewnie z przyzwyczajenia chcia� zapyta� co� Ty za jeden, ale nie da� rady nic wykrztusi�.
	AI_Output (other, self, "DIA_Scorpio_Hello_15_05"); //Hmm... W porz�dku, pospieszy�em si�.
	AI_RemoveWeapon (hero);
	AI_Output (self, other, "DIA_Scorpio_Hello_11_06"); //Tak ju� lepiej. My�la�em, �e znam wi�kszo�� skaza�c�w, ale ciebie nie kojarz�...
	AI_Output (other, self, "DIA_Scorpio_Hello_15_07"); //Bo jestem na tym zadupiu od niedawna. 
	AI_Output (other, self, "DIA_Scorpio_Hello_15_08"); //Sk�d si� tu wzi��e�?
	AI_Output (self, other, "DIA_Scorpio_Hello_11_09"); //A co Ci� to obchodzi? 
	AI_Output (self, other, "DIA_Scorpio_Hello_11_10"); //Skoro stronimy od innych to zdaje si�, �e mamy ku temu powody.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_11"); //Zreszt�, imiona w Kolonii nic nie znacz�.
	AI_Output (other, self, "DIA_Scorpio_Hello_15_12"); //Nie chcia�em by� w�cibski, ale wygl�dacie, jakby was Beliar wysra�.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_13"); //A Ty co, kap�an Adanosa? Biegasz sobie po Kolonii i ratujesz kogo si� da?
	AI_Output (other, self, "DIA_Scorpio_Hello_15_14"); //Dobra, ju� mnie nie ma, pozdr�wcie cieniostwory i wargi.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_15"); //Zaczekaj!
	
   Log_CreateTopic(CH1_Rbl_Hungry, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Hungry, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Hungry, "Skorpion i Pacho potrzebuj� jedzenia. Twierdz�, �e dobrze zap�ac� wi�c mo�e warto co� im przynie��.");
	
   AI_Output (self, other, "DIA_Scorpio_Hello_11_16"); //Od dw�ch dni nie mieli�my nic w ustach. Pacho ci�gle gor�czkuje po tym, jak topielce pochlasta�y mu szyj� i brzuch.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_17"); //Musz� przy nim siedzie�, �eby nie doko�czy�y tego co zacz�y.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_18"); //Masz co� do zjedzenia?
	
   if ((NPC_HasItems(other,ItAt_Meatbug_01)>=1)||(NPC_HasItems(other,ItFoApple)>=1)||(NPC_HasItems(other,ItFo_wineberrys_01)>=1)||(NPC_HasItems(other,ItMa_Goodlumber)>=1)||(NPC_HasItems(other,ItFoLoaf)>=1)||(NPC_HasItems(other,ItFoMuttonRaw)>=1)||(NPC_HasItems(other,ItFoCheese)>=1)||(NPC_HasItems(other,ItFoMutton)>=1)||(NPC_HasItems(other,ItFoRice)>=1)||(NPC_HasItems(other,ItFoSoup)>=1)||(NPC_HasItems(other,ItFoMeatbugragout)>=1)||(NPC_HasItems(other,ItFoCrawlersoup)>=1)||(NPC_HasItems(other,ItFo_Stew)>=1)||(NPC_HasItems(other,ItFo_Fish)>=1))
	{
		scorpio_food = TRUE;
		AI_Output (other, self, "DIA_Scorpio_Hello_15_19"); //We� to...
		
      if (NPC_HasItems(other,ItAt_Meatbug_01)>=1)
		{
			B_GiveInvItems (other, self, ItAt_Meatbug_01, 1);
		}
		else if (NPC_HasItems(other,ItFoApple)>=1)
		{
			B_GiveInvItems (other, self, ItFoApple, 1);
		}
		else if (NPC_HasItems(other,ItFo_wineberrys_01)>=1)
		{
			B_GiveInvItems (other, self, ItFo_wineberrys_01, 1);
		}
		else if (NPC_HasItems(other,ItFoLoaf)>=1)
		{
			B_GiveInvItems (other, self, ItFoLoaf, 1);
		}
		else if (NPC_HasItems(other,ItFoMuttonRaw)>=1)
		{
			B_GiveInvItems (other, self, ItFoMuttonRaw, 1);
		}
		else if (NPC_HasItems(other,ItFoCheese)>=1)
		{
			B_GiveInvItems (other, self, ItFoCheese, 1);
		}
		else if (NPC_HasItems(other,ItFoMutton)>=1)
		{
			B_GiveInvItems (other, self, ItFoMutton, 1);
		}
		else if (NPC_HasItems(other,ItFoRice)>=1)
		{
			B_GiveInvItems (other, self, ItFoRice, 1);
		}
		else if (NPC_HasItems(other,ItFoSoup)>=1)
		{
			B_GiveInvItems (other, self, ItFoSoup, 1);
		}
		else if (NPC_HasItems(other,ItFoMeatbugragout)>=1)
		{
			B_GiveInvItems (other, self, ItFoMeatbugragout, 1);
		}
		else if (NPC_HasItems(other,ItFoCrawlersoup)>=1)
		{
			B_GiveInvItems (other, self, ItFoCrawlersoup, 1);
		}
		else if (NPC_HasItems(other,ItFo_Stew)>=1)
		{
			B_GiveInvItems (other, self, ItFo_Stew, 1);
		}
		else if (NPC_HasItems(other,ItFo_Fish)>=1)
		{
			B_GiveInvItems (other, self, ItFo_Fish, 1);
		};
      
		B_GiveXP(150);
		AI_Output (self, other, "DIA_Scorpio_Hello_11_20"); //Dzi�ki przyjacielu. To nas postawi na nogi.
		AI_Output (self, other, "DIA_Scorpio_Hello_11_21"); //We� t� rud�, chocia� tak mog� si� odwdzi�czy�.
		AI_Output (other, self, "DIA_Scorpio_Hello_15_22"); //Rudy nigdy zbyt wiele.
		B_GiveInvItems (self, other, ItMiNugget, 50);
		Log_SetTopicStatus(CH1_Rbl_Hungry, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Hungry, "Przynios�em Skorpionowi i Pacho jedzenie. Uczciwie zap�acili rud�.");
	}
	else
	{
		AI_Output (other, self, "DIA_Scorpio_Hello_15_23"); //Raczej nie.
		AI_Output (self, other, "DIA_Scorpio_Hello_11_24"); //Przynie� co� do �arcia, a sowicie Ci� wynagrodz�.
      
      B_StopProcessInfos(self);
	};
   
	NPC_ExchangeRoutine(self, "start");
};


INSTANCE DIA_Scorpio_Food (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 2;
	condition		= DIA_Scorpio_Food_Condition;
	information		= DIA_Scorpio_Food_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam jedzenie."; 
};

FUNC INT DIA_Scorpio_Food_Condition()
{
	if (scorpio_food == FALSE)&&(Npc_KnowsInfo (hero, DIA_Scorpio_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Food_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Food_15_01"); //Mam jedzenie.
	AI_Output (self, other, "DIA_Scorpio_Food_11_02"); //Zobaczmy, z czym przyszed�e�...
   
	if ((NPC_HasItems(other,ItAt_Meatbug_01)>=1)||(NPC_HasItems(other,ItFoApple)>=1)||(NPC_HasItems(other,ItFo_wineberrys_01)>=1)||(NPC_HasItems(other,ItMa_Goodlumber)>=1)||(NPC_HasItems(other,ItFoLoaf)>=1)||(NPC_HasItems(other,ItFoMuttonRaw)>=1)||(NPC_HasItems(other,ItFoCheese)>=1)||(NPC_HasItems(other,ItFoMutton)>=1)||(NPC_HasItems(other,ItFoRice)>=1)||(NPC_HasItems(other,ItFoSoup)>=1)||(NPC_HasItems(other,ItFoMeatbugragout)>=1)||(NPC_HasItems(other,ItFoCrawlersoup)>=1)||(NPC_HasItems(other,ItFo_Stew)>=1)||(NPC_HasItems(other,ItFo_Fish)>=1))
	{
		scorpio_food = TRUE;
		AI_Output (other, self, "DIA_Scorpio_Food_15_03"); //We� to...
		
      if (NPC_HasItems(other,ItAt_Meatbug_01)>=1)
		{
			B_GiveInvItems (other, self, ItAt_Meatbug_01, 1);
		}
		else if (NPC_HasItems(other,ItFoApple)>=1)
		{
			B_GiveInvItems (other, self, ItFoApple, 1);
		}
		else if (NPC_HasItems(other,ItFo_wineberrys_01)>=1)
		{
			B_GiveInvItems (other, self, ItFo_wineberrys_01, 1);
		}
		else if (NPC_HasItems(other,ItMa_Goodlumber)>=1)
		{
			B_GiveInvItems (other, self, ItMa_Goodlumber, 1);
		}
		else if (NPC_HasItems(other,ItFoLoaf)>=1)
		{
			B_GiveInvItems (other, self, ItFoLoaf, 1);
		}
		else if (NPC_HasItems(other,ItFoMuttonRaw)>=1)
		{
			B_GiveInvItems (other, self, ItFoMuttonRaw, 1);
		}
		else if (NPC_HasItems(other,ItFoCheese)>=1)
		{
			B_GiveInvItems (other, self, ItFoCheese, 1);
		}
		else if (NPC_HasItems(other,ItFoMutton)>=1)
		{
			B_GiveInvItems (other, self, ItFoMutton, 1);
		}
		else if (NPC_HasItems(other,ItFoRice)>=1)
		{
			B_GiveInvItems (other, self, ItFoRice, 1);
		}
		else if (NPC_HasItems(other,ItFoSoup)>=1)
		{
			B_GiveInvItems (other, self, ItFoSoup, 1);
		}
		else if (NPC_HasItems(other,ItFoMeatbugragout)>=1)
		{
			B_GiveInvItems (other, self, ItFoMeatbugragout, 1);
		}
		else if (NPC_HasItems(other,ItFoCrawlersoup)>=1)
		{
			B_GiveInvItems (other, self, ItFoCrawlersoup, 1);
		}
		else if (NPC_HasItems(other,ItFo_Stew)>=1)
		{
			B_GiveInvItems (other, self, ItFo_Stew, 1);
		}
		else if (NPC_HasItems(other,ItFo_Fish)>=1)
		{
			B_GiveInvItems (other, self, ItFo_Fish, 1);
		};
      
		B_GiveXP(150);
		AI_Output (self, other, "DIA_Scorpio_Food_11_04"); //Dzi�ki przyjacielu. To nas postawi na nogi.
		AI_Output (self, other, "DIA_Scorpio_Food_11_05"); //We� t� rud�, chocia� tak mog� si� odwdzi�czy�.
		B_GiveInvItems (self, other, ItMiNugget, 50);
		Log_SetTopicStatus(CH1_Rbl_Hungry, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Hungry, "Przynios�em Skorpionowi i Pacho jedzenie. Uczciwie zap�acili rud�.");
	}
   else
   {
      AI_Output (self, other, "DIA_Scorpio_Food_11_07"); //Przecie� Ty nic nie masz. Wr�� z �arciem, a nie po�a�ujesz.
      B_StopProcessInfos(self);
   };
};

var int scorpio_plant;

INSTANCE DIA_Scorpio_Story (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 3;
	condition		= DIA_Scorpio_Story_Condition;
	information		= DIA_Scorpio_Story_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co tutaj robicie?"; 
};

FUNC INT DIA_Scorpio_Story_Condition()
{
	if (scorpio_food == TRUE)&&((Npc_KnowsInfo (hero, DIA_Scorpio_Hello))||(Npc_KnowsInfo (hero, DIA_Scorpio_Story)))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Story_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Story_15_01"); //Co tutaj robicie?
	AI_Output (self, other, "DIA_Scorpio_Story_11_02"); //Uciekli�my ze Starego Obozu. Mieli�my ju� do�� wyzysku i �ycia na �asce magnat�w.
	AI_Output (self, other, "DIA_Scorpio_Story_11_03"); //Moim zdaniem Gomez ca�kiem straci� rozum. Ten cholerny psychopata nie ufa ju� nawet Krukowi.
	AI_Output (self, other, "DIA_Scorpio_Story_11_04"); //Uciekli�my w nocy. Pacho szed� przodem, bo lepiej zna okolice.
	AI_Output (self, other, "DIA_Scorpio_Story_11_05"); //Nagle nie wiadomo sk�d, rzuci�y si� na nas... topielce. Tak, to by�y topielce. 
	AI_Output (self, other, "DIA_Scorpio_Story_11_06"); //Pacho mia� pecha, po�lizgn�� si� i dorwa�y go na ziemi.
	AI_Output (self, other, "DIA_Scorpio_Story_11_07"); //Zanim dobieg�em, by� ju� porz�dnie pochlastany.
	AI_Output (self, other, "DIA_Scorpio_Story_11_08"); //Zdo�a�em zatamowa� krew, ale ch�opak straci� g�os.
	AI_Output (self, other, "DIA_Scorpio_Story_11_09"); //Dobrze gadam, Pacho?
	
   AI_TurnToNpc (self, Pacho);
	
   if (C_BodystateContains(Pacho, BS_SIT))
	{
		AI_StandUp (self);
		AI_TurnToNpc (Pacho, other);
	};
   
	AI_PlayAni(Pacho, "T_YES");
	AI_Waitms(self,500);
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_Scorpio_Story_11_10"); //Sam widzisz, �e nie jest z nim za dobrze.
	AI_Output (self, other, "DIA_Scorpio_Story_11_11"); //Jedyna nadzieja w odchodach trolla.
	AI_Output (other, self, "DIA_Scorpio_Story_15_12"); //�e co?
	AI_Output (self, other, "DIA_Scorpio_Story_11_13"); //Na trollich odchodach ro�nie pewna rzadka ro�lina.
	AI_Output (self, other, "DIA_Scorpio_Story_11_14"); //Wyci�g z jej �odygi mo�e zregenerowa� struny g�osowe i by� mo�e Pacho wr�ci�by g�os.
	AI_Output (other, self, "DIA_Scorpio_Story_15_15"); //To dlaczego nie poszukacie tej ro�liny?
	AI_Output (self, other, "DIA_Scorpio_Story_11_16"); //Pacho jeszcze nie doszed� do siebie. 
	AI_Output (other, self, "DIA_Scorpio_Story_15_17"); //A mo�e odprowadzi� was do Obozu Rebeliant�w?
	AI_Output (self, other, "DIA_Scorpio_Story_11_18"); //Mamy ju� do�� wszelkiej 'zorganizowanej spo�eczno�ci' w tej zawszonej Kolonii. Co nie Pacho?
	
   AI_TurnToNpc (self, Pacho);
	
   if (C_BodystateContains(Pacho, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (Pacho, other);
	};
   
	AI_PlayAni(Pacho,"T_YES");
	AI_Waitms(self,500);
	AI_TurnToNpc (self, other);
	AI_Output (other, self, "DIA_Scorpio_Story_15_19"); //W Obozie Rebeliant�w dostaniecie tyle jedzenia, ile zdo�acie ud�wign��.
	AI_Output (self, other, "DIA_Scorpio_Story_11_20"); //Nie �artuj. S�ysza�em, �e rebelianci to banda szale�c�w i pijak�w.
	AI_Output (other, self, "DIA_Scorpio_Story_15_21"); //W sumie to masz racj�, ale ch�opaki przynajmniej trzymaj� si� razem. A z tego co widz�, to chyba nie macie innej alternatywy.
	AI_Output (self, other, "DIA_Scorpio_Story_11_22"); //Hmm... Co ty na to Pacho?
	
   AI_TurnToNpc (self, Pacho);
	
   if (C_BodystateContains(Pacho, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (Pacho, other);
	};
   
	AI_PlayAni(Pacho,"T_YES");
	AI_Waitms(self,500);
	AI_TurnToNpc (self, other);
   
	AI_Output (self, other, "DIA_Scorpio_Story_11_23"); //Niech b�dzie. Ale pod jednym warunkiem.
	AI_Output (self, other, "DIA_Scorpio_Story_11_24"); //Pogrzebiesz w trollich odchodach i poszukasz tej ro�liny.
	AI_Output (other, self, "DIA_Scorpio_Story_15_25"); //Nie b�d� babra� si� w g�wnie!
	AI_Output (self, other, "DIA_Scorpio_Story_11_26"); //Spokojnie, to ziele ro�nie na ziemi, nie na �ajnie.
	AI_Output (self, other, "DIA_Scorpio_Story_11_27"); //To jak b�dzie?

	Info_ClearChoices (DIA_Scorpio_Story);
	Info_AddChoice (DIA_Scorpio_Story, "No dobra.", DIA_Scorpio_Story_Yes);
	Info_AddChoice (DIA_Scorpio_Story, "Musz� to przemy�le�.", DIA_Scorpio_Story_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Scorpio_Story_Yes()
{
	scorpio_plant = TRUE;
   
	AI_Output (other, self, "DIA_Scorpio_Story_Yes_15_01"); //No dobra. 
	AI_Output (self, other, "DIA_Scorpio_Story_Yes_11_02"); //Wiedzia�em, �e porz�dny z Ciebie ch�op.
	AI_Output (self, other, "DIA_Scorpio_Story_Yes_11_03"); //Wr�� z ro�lin�, to p�jdziemy z Tob� do rebeliant�w.
	Log_CreateTopic(CH1_Rbl_Plant, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Plant, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Plant, "Skorpion i Pacho p�jd� ze mn� do Obozu Rebeliant�w, je�eli poszukam jakiej� ro�liny rosn�cej na odchodach trolla. Czeka mnie babranie w g�wnie...");
	B_LogEntry(CH1_Rbl_NewMembers, "Skorpion i Pacho p�jd� ze mn� do Obozu Rebeliant�w, je�eli znajd� dla nich jaka� ro�lin� wschodz�c� na odchodach trolla.");
   B_StopProcessInfos(self); 
	
	Wld_InsertNpc(MIS_PACHOTROLL,"FP_ROAM_OW_SNAPPER_OW_ORC");
	var C_NPC halfdeadtroll; halfdeadtroll = Hlp_GetNpc(MIS_PACHOTROLL);
	B_ChangeAttribute	(halfdeadtroll, ATR_HITPOINTS, -500);	
	Wld_InsertNpc(GRD_240_Gardist, "FP_ROAM_OW_SNAPPER_OW_ORC"); 
	var C_NPC gieerde; gieerde = Hlp_GetNpc(GRD_240_Gardist);
	B_ChangeAttribute	(gieerde, ATR_HITPOINTS, -gieerde.attribute[ATR_HITPOINTS_MAX]);	    
	Wld_InsertItem	(aloes,"OW_PATH_019");		
};

// ------------------No----------------

FUNC VOID DIA_Scorpio_Story_No()
{
	AI_Output (other, self, "DIA_Scorpio_Story_No_15_01"); //Musz� to przemy�le�.
	AI_Output (self, other, "DIA_Scorpio_Story_No_11_02"); //Rozumiem, w ko�cu z trollami nie ma �art�w.
	AI_Output (self, other, "DIA_Scorpio_Story_No_11_03"); //Jakby� zmieni� zdanie, to wiesz, gdzie nas szuka�.
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Scorpio_CanYouTeachMe (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 4;
	condition		= DIA_Scorpio_CanYouTeachMe_Condition;
	information		= DIA_Scorpio_CanYouTeachMe_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Scorpio_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Scorpio_Hello) && (Scorpio_teacher == false)) 
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_CanYouTeachMe_Info()
{
   if (scorpio_food)
   {
      Scorpio_teacher = true;
      
      AI_Output (other, self, "DIA_Scorpio_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
      AI_Output (self, other, "DIA_Scorpio_CanYouTeachMe_15_02"); //M�g�bym ci pokaza�, jak sprawnie pos�ugiwa� si� kusz�.
      AI_Output (self, other, "DIA_Scorpio_CanYouTeachMe_15_03"); //Daj zna�, jak b�dziesz chcia� potrenowa�.
      
      Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
      B_LogEntry(GE_TeacherOW, "Skorpion mo�e pokaza� mi, jak pos�ugiwa� si� kusz�.");
   }
   else
   {
      AI_Output (other, self, "DIA_Scorpio_CanYouTeachMe_15_04"); //Przynie� �arcie, to pogadamy.
   };
};

INSTANCE DIA_Scorpio_StoryOk (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 4;
	condition		= DIA_Scorpio_StoryOk_Condition;
	information		= DIA_Scorpio_StoryOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Poszukam tej ro�liny."; 
};

FUNC INT DIA_Scorpio_StoryOk_Condition()
{
	if (scorpio_plant == FALSE)&&(Npc_KnowsInfo (hero, DIA_Scorpio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_StoryOk_Info()
{
	scorpio_plant = TRUE;
   
	AI_Output (other, self, "DIA_Scorpio_StoryOk_15_01"); //Poszukam tej ro�liny. 
	AI_Output (self, other, "DIA_Scorpio_StoryOk_11_02"); //Wiedzia�em, �e porz�dny z Ciebie ch�op.
	AI_Output (self, other, "DIA_Scorpio_StoryOk_11_03"); //Wr�� z ro�lin� to p�jdziemy z Tob� do rebeliant�w.
	Log_CreateTopic(CH1_Rbl_Plant, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Plant, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Plant, "Skorpion i Pacho p�jd� ze mn� do Obozu Rebeliant�w, je�eli poszukam jakiej� ro�liny rosn�cej na odchodach trolla. Czeka mnie babranie w g�wnie...");	
	B_LogEntry(CH1_Rbl_NewMembers, "Skorpion i Pacho p�jd� ze mn� do Obozu Rebeliant�w, je�eli znajd� dla nich jaka� ro�lin� wschodz�c� na odchodach trolla.");
	
	Wld_InsertNpc(MIS_PACHOTROLL,"FP_ROAM_OW_SNAPPER_OW_ORC");
	var C_NPC halfdeadtroll; halfdeadtroll = Hlp_GetNpc(MIS_PACHOTROLL);
	B_ChangeAttribute	(halfdeadtroll, ATR_HITPOINTS, -500);	
	Wld_InsertNpc(GRD_240_Gardist, "FP_ROAM_OW_SNAPPER_OW_ORC"); 
	var C_NPC gieerde; gieerde = Hlp_GetNpc(GRD_240_Gardist);
	B_ChangeAttribute	(gieerde, ATR_HITPOINTS, -gieerde.attribute[ATR_HITPOINTS_MAX]);	    
	Wld_InsertItem	(aloes,"FP_MIS_ALOES");	
	
	B_StopProcessInfos	(self); 
};

var int aloes_find;

INSTANCE DIA_Scorpio_Plant (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 5;
	condition		= DIA_Scorpio_Plant_Condition;
	information		= DIA_Scorpio_Plant_Info;
	permanent		= 1;
	important		= 0;
	description		= "Znalaz�em ro�lin�."; 
};

FUNC INT DIA_Scorpio_Plant_Condition()
{
	if (!aloes_find)&&(scorpio_plant)&&((Npc_KnowsInfo (hero, DIA_Scorpio_Story))||(Npc_KnowsInfo (hero, DIA_Scorpio_StoryOk)))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Plant_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Plant_15_01"); //Znalaz�em ro�lin�. 
	AI_Output (self, other, "DIA_Scorpio_Plant_11_02"); //Zobaczmy, co tam masz...
   
	if (NPC_HasItems(other,aloes)>=1)
	{
		aloes_find = TRUE;
		B_GiveXP(250);
		AI_Output (self, other, "DIA_Scorpio_Plant_11_03"); //�wietna robota. Prawda Pacho?
		AI_TurnToNpc (self, Pacho);
      
		if (C_BodystateContains(Pacho, BS_SIT))
		{
			AI_StandUp (self);
			AI_TurnToNpc (Pacho, other);
		};
      
		AI_PlayAni(Pacho,"T_YES");
		AI_Waitms(self,500);
		AI_TurnToNpc (self, other);

		AI_Output (self, other, "DIA_Scorpio_Plant_11_04"); //To teraz musisz tylko zrobi� z niej mikstur� i mo�emy i��.
		AI_Output (other, self, "DIA_Scorpio_Plant_15_05"); //Nie m�wi�e� nic o robieniu mikstur!
		AI_Output (self, other, "DIA_Scorpio_Plant_11_06"); //Naprawd�? Musia�o mi to umkn��. 
		AI_Output (self, other, "DIA_Scorpio_Plant_11_07"); //P�jdziemy za Tob� dopiero, jak Pacho dostanie mikstur�. Dobrze gadam?
		AI_TurnToNpc (self, Pacho);
      
		if (C_BodystateContains(Pacho, BS_SIT))
		{
			AI_StandUp (self);
			AI_TurnToNpc (Pacho, other);
		};
      
		AI_PlayAni(Pacho,"T_YES");
		AI_Waitms(self,500);
		AI_TurnToNpc (self, other);
      
		AI_Output (self, other, "DIA_Scorpio_Plant_11_08"); //Nie przejmuj si�. Poczekamy tu na Ciebie.
		B_LogEntry(CH1_Rbl_Plant, "Skorpion mnie wykorzysta�. Przynios�em ro�lin�, ale by�y stra�nik i jego towarzysz p�jd� za mn� dopiero, jak przynios� im mikstur� sporz�dzon� z ro�liny. Ciekawe co jeszcze wymy�l�?");	
		B_LogEntry(CH1_Rbl_NewMembers, "Skorpion mnie wykorzysta�. Tym razem twierdzi, �e p�jd� za mn� do rebeliant�w, jak sporz�dz� z ro�liny mikstur� dla Pacho.");
	}
	else
	{
		AI_Output (self, other, "DIA_Scorpio_Plant_11_09"); //Nie masz ziela, kt�rego potrzebujemy.
		AI_Output (self, other, "DIA_Scorpio_Plant_11_10"); //Szukaj dalej.
	};
   
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Scorpio_Mixture (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 6;
	condition		= DIA_Scorpio_Mixture_Condition;
	information		= DIA_Scorpio_Mixture_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam esencj� z aloesu."; 
};

FUNC INT DIA_Scorpio_Mixture_Condition()
{
	if (NPC_HasItems(hero,aloes_mixture)>=1)&&(aloes_find)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Mixture_Info()
{
	B_GiveXP(100);

	AI_Output (other, self, "DIA_Scorpio_Mixture_15_01"); //Mam esencj� z aloesu. 
	AI_Output (self, other, "DIA_Scorpio_Mixture_11_02"); //Cholera, nie s�dzi�em, �e tu jeszcze wr�cisz.
	AI_Output (self, other, "DIA_Scorpio_Mixture_11_03"); //Jeste� got�w Pacho?
	AI_TurnToNpc (self, Pacho);
	aloes_find=2;
   
	if (C_BodystateContains(Pacho, BS_SIT))
	{
		AI_StandUp (self);
		AI_TurnToNpc (Pacho, other);
	};
   
	AI_PlayAni(Pacho,"T_YES");
	AI_Waitms(self,500);
	AI_TurnToNpc (self, other);
   
	AI_Output (self, other, "DIA_Scorpio_Mixture_11_04"); //W porz�dku. Daj mikstur� Pacho. Mam nadziej�, �e go to nie zabije.
	AI_Output (self, other, "DIA_Scorpio_Mixture_11_05"); //Do dna przyjacielu!
	B_LogEntry(CH1_Rbl_Plant, "Najwy�szy czas da� mikstur� Pacho i zobaczy�, co si� stanie.");	
	B_LogEntry(CH1_Rbl_NewMembers, "Przynios�em mikstur� Pacho. Zobaczymy, jak zadzia�a.");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Scorpio_Go (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 7;
	condition		= DIA_Scorpio_Go_Condition;
	information		= DIA_Scorpio_Go_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�emy ju� i��?"; 
};

FUNC INT DIA_Scorpio_Go_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pacho_Mixture))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Go_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Go_15_01"); //Mo�emy ju� i��?
	AI_Output (self, other, "DIA_Scorpio_Go_11_02"); //Jak najbardziej. Musz� przyzna�, �e rzadko spotyka si� w Kolonii kogo� takiego jak Ty.
	AI_Output (self, other, "DIA_Scorpio_Go_11_03"); //Jak dojdziemy na miejsce, b�d� mia� do Ciebie pewn� delikatn� spraw�.
	AI_Output (self, other, "DIA_Scorpio_Go_11_04"); //Ale teraz w drog�.
	AI_TurnToNpc (self, Pacho);
	AI_Output (self, other, "DIA_Scorpio_Go_11_05"); //Pacho ruszaj zad, czeka nas ma�y spacerek.
	AI_Output (self, other, "DIA_Scorpio_Go_11_06"); //Tylko tym razem omijaj topielce, he, he...
	B_LogEntry(CH1_Rbl_NewMembers, "Skorpion i Pacho zgodzili si� p�j�� za mn� do Obozu Rebeliant�w.");
	Party_AddNpc(self);
	Party_AddNpc(pacho);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_ExchangeRoutine(GRD_224_PACHO,"FOLLOW");
	B_StopProcessInfos(self); 
	Know_PachoAndScorpio=TRUE;
};

INSTANCE DIA_Scorpio_GoOut (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 8;
	condition		= DIA_Scorpio_GoOut_Condition;
	information		= DIA_Scorpio_GoOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Scorpio_GoOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Scorpio_Go))
   &&((Npc_GetDistToWP (self,"MOVEMENT_TALL_PATH_BANDITOS2") < 550 )||(Npc_GetDistToWP (self,"PATH_OC_NC_11") < 550 )
   ||(Npc_GetDistToWP (self,"HC_WARRIOR16") < 550 ))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_GoOut_Info()
{
   var C_NPC Pacho; Pacho = Hlp_GetNpc(GRD_224_Pacho);
   
	scorpion_trust = TRUE;
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(250);
   
	AI_Output (self, other, "DIA_Scorpio_GoOut_11_01"); //Nie brzydki ten ob�z...
	
   AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
   
	AI_Output (self, other, "DIA_Scorpio_GoOut_11_02"); //Powinno nam tu by� dobrze, Pacho.
	AI_Output (other, self, "DIA_Scorpio_GoOut_15_03"); //Jedzenia na pewno wam nie zabraknie.
	AI_Output (self, other, "DIA_Scorpio_GoOut_11_04"); //W porz�dku, zostajemy.
	AI_Output (self, other, "DIA_Scorpio_GoOut_11_05"); //We� te mikstury, Tobie bardziej si� przydadz�.
   
	CreateInvItems (self, ItFo_Potion_Health_02,5); 
	B_GiveInvItems (self, other,ItFo_Potion_Health_02, 5);
   
	B_LogEntry(CH1_Rbl_NewMembers, "Doprowadzi�em Skorpiona i Pacho do Obozu Rebeliant�w.");
	Party_RemoveNpc(self);
	Party_RemoveNpc(pacho);
	Npc_ExchangeRoutine(self,"OR");
	B_ExchangeRoutine(GRD_224_PACHO,"OR");
	self.flags	= self.flags & ~NPC_FLAG_IMMORTAL;
	pacho.flags	= pacho.flags & ~NPC_FLAG_IMMORTAL;
	AI_Wait(pacho,2);		
	B_StopProcessInfos(self); 
	//For whistler quest:
	Day_PachoJoinsORCamp = B_SetDayTolerance();
};

var int skorpio_map;

INSTANCE DIA_Scorpio_Case (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 9;
	condition		= DIA_Scorpio_Case_Condition;
	information		= DIA_Scorpio_Case_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wspomnia�e� co� wcze�niej..."; 
};

FUNC INT DIA_Scorpio_Case_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_Scorpio_GoOut))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Case_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Case_15_01"); //Wspomnia�e� co� wcze�niej...
	AI_Output (self, other, "DIA_Scorpio_Case_11_02"); //Tak, mam pewien problem, a nie znam za dobrze nikogo w tym obozie.
	AI_Output (other, self, "DIA_Scorpio_Case_15_03"); //Co to za problem?
	AI_Output (self, other, "DIA_Scorpio_Case_11_04"); //Potrzebuj� mapy Kolonii. Nie musi by� bardzo dok�adna. Grunt, �eby by�y na niej zaznaczone najwa�niejsze punkty orientacyjne.
	AI_Output (self, other, "DIA_Scorpio_Case_11_05"); //Mo�e wiesz, kto w obozie mia�by co� takiego na sprzeda�?
	AI_Output (other, self, "DIA_Scorpio_Case_15_06"); //Nie wiem, ale mog� si� rozejrze�. Oczywi�cie nie za darmo.
	AI_Output (self, other, "DIA_Scorpio_Case_11_07"); //To si� rozumie. Dostaniesz... 200 bry�ek rudy.
	AI_Output (other, self, "DIA_Scorpio_Case_15_08"); //Dobra niech b�dzie, ale po�owa p�atna z g�ry. Nazwijmy to kosztami amortyzacji.
	AI_Output (self, other, "DIA_Scorpio_Case_11_09"); //Zdaje si�, �e nie mam wyboru. Oto 100 bry�ek. 
	
   CreateInvItems (self,ItMiNugget,100);
	B_GiveInvItems (self, other, ItMiNugget, 100);
	
   AI_Output (self, other, "DIA_Scorpio_Case_11_10"); //Ale stawiam jeden warunek.
	AI_Output (other, self, "DIA_Scorpio_Case_15_11"); //Jaki?
	AI_Output (self, other, "DIA_Scorpio_Case_11_12"); //Masz dwa dni na przyniesienie mapy.
	AI_Output (other, self, "DIA_Scorpio_Case_15_13"); //Nie ma sprawy, b�dziesz j� mia� du�o wcze�niej.
	
   skorpio_map = B_SetDayTolerance()+2;
	Log_CreateTopic(CH1_Rbl_Map, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Map, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Map, "Skorpion poprosi� mnie o przyniesienie mapy Kolonii. Zap�aci mi za to 200 bry�ek, z czego po�ow� ju� ui�ci�. Ciekawe, po co mu ta mapa?");
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Scorpio_Map (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 10;
	condition		= DIA_Scorpio_Map_Condition;
	information		= DIA_Scorpio_Map_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynosz� map�."; 
};

FUNC INT DIA_Scorpio_Map_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_Scorpio_Case))&&(NPC_HasItems(other,ItWrWorldmap)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Map_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Map_15_01"); //Przynosz� map�.
	
   if (Wld_GetDay() <= skorpio_map)
	{
		B_GiveXP(150);
		AI_Output (self, other, "DIA_Scorpio_Map_11_02"); //�wietnie. Zd��y�e� w dwa dni tak jak prosi�em.
		AI_Output (self, other, "DIA_Scorpio_Map_11_03"); //We� rud�, uczciwie zarobi�e�.
      
		CreateInvItems (self,ItMiNugget,100);
		B_GiveInvItems (self, other, ItMiNugget, 100);
      
		AI_Output (other, self, "DIA_Scorpio_Map_15_04"); //Po co ci ta mapa?
      
		B_GiveInvItems (other, self, ItWrWorldmap, 1);
      
		AI_Output (self, other, "DIA_Scorpio_Map_11_05"); //Nie chc� si� zgubi� w Kolonii, wiesz to bardzo niebezpieczne miejsce...
		AI_Output (other, self, "DIA_Scorpio_Map_15_06"); //A powa�nie?
		AI_Output (self, other, "DIA_Scorpio_Map_11_07"); //A powa�nie to nie Tw�j interes. Bywaj.
      
		Log_SetTopicStatus(CH1_Rbl_Map, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Map, "Przynios�em map� Skorpionowi. Da� mi reszt� rudy, ale nie chcia� zdradzi� po co mu mapa. Ciekawe, mo�e Pacho co� mi powie, w ko�cu to przyjaciele.");
	}
	else
	{
		AI_Output (self, other, "DIA_Scorpio_Map_11_08"); //M�wi�em dwa dni!
		AI_Output (other, self, "DIA_Scorpio_Map_15_09"); //Wyst�pi�y pewne komplikacje...
		AI_Output (self, other, "DIA_Scorpio_Map_11_10"); //G�wno mnie to obchodzi! Dawaj map�.
      
		B_GiveInvItems (other, self, ItWrWorldmap, 1);
      
		AI_Output (other, self, "DIA_Scorpio_Map_15_11"); //A reszta rudy?
		AI_Output (self, other, "DIA_Scorpio_Map_11_12"); //Trzaby�o si� nie sp�ni�!
		AI_Output (other, self, "DIA_Scorpio_Map_15_09"); //Co si� tak w�ciekasz. Po co ci ta mapa?
		AI_Output (self, other, "DIA_Scorpio_Map_11_10"); //A co ci� to obchodzi?! Bywaj.
      
		Log_SetTopicStatus(CH1_Rbl_Map, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Map, "Przynios�em map� Skorpionowi. Sp�ni�em si� i nie dosta�em reszty rudy. By�y stra�nik nie chcia� te� zdradzi�, do czego potrzebuje t� map�. Ciekawe, mo�e Pacho co� mi powie, w ko�cu to przyjaciele.");
	};
   
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Scorpio_Traitor (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 10;
	condition		= DIA_Scorpio_Traitor_Condition;
	information		= DIA_Scorpio_Traitor_Info;
	permanent		= 0;
	important		= 0;
	description		= "Musimy porozmawia� o Pacho."; 
};

FUNC INT DIA_Scorpio_Traitor_Condition()
{
	if (pacho_ore)&&(!Npc_KnowsInfo (hero, DIA_Pacho_JourneyEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Traitor_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Traitor_15_01"); //Musimy porozmawia� o Pacho.
	AI_Output (self, other, "DIA_Scorpio_Traitor_11_02"); //O co chodzi?

	Info_ClearChoices (DIA_Scorpio_Traitor);
	Info_AddChoice (DIA_Scorpio_Traitor, "Pacho z�o�y� mi propozycj�.", DIA_Scorpio_Traitor_Yes);
	Info_AddChoice (DIA_Scorpio_Traitor, "To nic wa�nego.", DIA_Scorpio_Traitor_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Scorpio_Traitor_Yes()
{
	B_GiveXP(200);
	scorpio_traitor = TRUE;
   
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_01"); //Pacho z�o�y� mi propozycj� nie do odrzucenia.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_02"); //M�w ja�niej.
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_03"); //Opowiedzia� mi o rudzie skradzionej pewnemu magnatowi...
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_04"); //Niech to szlag trafi! Zdradziecka menda!
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_05"); //Spokojnie. Mo�emy si� dogada�.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_06"); //Co masz na my�li?
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_07"); //Kiedy Pacho poka�e mi, gdzie zakopa� rud�, rozwal� mu �eb.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_08"); //M�w dalej...
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_09"); //Zanim wyruszymy dam Ci zna�, p�jdziesz za nami.
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_10"); //W odpowiednim momencie pomo�esz mi wykopa� rud� i b�dziesz uwa�a� na t� niby besti�.
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_11"); //I najwa�niejsze. Wezm� trzy czwarte rudy i b�yskotk� Gomeza.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_12"); //Po moim trupie!
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_13"); //To da si� za�atwi�.
	
   AI_DrawWeapon (hero);
	
   AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_14"); //Spokojnie, dogadamy si�...
	
   AI_RemoveWeapon (self);
	
   AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_15"); //Je�eli bajka o tej bestii jest prawd� to mo�e by� gor�co...
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_16"); //Dobra niech b�dzie. Jest tego tyle, �e nawet czwarta cz�� mi wystarczy.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_17"); //Daj mi znak, zanim wyruszycie. Pod��� za wami.
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_18"); //Tylko pami�taj, �e je�eli Pacho Ci� dostrze�e, to nasza umowa jest niewa�na.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_19"); //Bez obaw. Kiedy potrzeba, potrafi� zachowa� dyskrecj�.
   
	B_LogEntry(CH1_Rbl_Ore, "Zdradzi�em Pacho. Powiedzia�em wszystko Skorpionowi. Stra�nik z oporami, ale zgodzi� si� na jedn� czwart� rudy. Jak na m�j gust za szybko przysta� na moje warunki. Musz� mie� go na oku, kiedy ju� wykopiemy rud�.");
	B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Scorpio_Traitor_No()
{
	AI_Output (other, self, "DIA_Scorpio_Traitor_No_15_01"); //To nic wa�nego... Po prostu wydaje mi si�, �e tw�j przyjaciel jeszcze nie odzyska� pe�ni si�.
	AI_Output (self, other, "DIA_Scorpio_Traitor_No_11_02"); //Rany na Pacho goj� si� jak na psie. Szybko do siebie dojdzie.
	AI_Output (self, other, "DIA_Scorpio_Traitor_No_11_03"); //Na pewno tylko to chcia�e� mi powiedzie�?
	AI_Output (other, self, "DIA_Scorpio_Traitor_No_15_04"); //Tak. Bywaj...
	B_StopProcessInfos(self);
};

INSTANCE DIA_Scorpio_AfterDig (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 11;
	condition		= DIA_Scorpio_AfterDig_Condition;
	information		= DIA_Scorpio_AfterDig_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Scorpio_AfterDig_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pacho_OreDig))&&(NPC_HasItems(hero, gomez_mirror)>=1)&&(Npc_GetDistToWP (self,"OW_PATH_MIS_PACHO_TREASURE") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_AfterDig_Info()
{
	AI_Output (self, other, "DIA_Scorpio_AfterDig_11_01"); //Tak, Pacho, ja te� ciesz� si� na Tw�j widok.
	AI_TurnToNpc(other, self);
	AI_Output (other, self, "DIA_Scorpio_AfterDig_15_02"); //Wystarczy ju� tych czu�o�ci. Co do rudy...

	AI_Output (self, other, "DIA_Scorpio_AfterDig_11_03"); //Kto� si� tam czai!
	AI_wait(self, 0.5);		
	AI_Output (other, self, "DIA_Scorpio_AfterDig_15_04"); //Kto to do cholery?!
	B_LogEntry(CH1_Rbl_Ore, "Kto� nas zaskoczy� po wykopaniu rudy...");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Scorpio_AfterDigEnd (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 12;
	condition		= DIA_Scorpio_AfterDigEnd_Condition;
	information		= DIA_Scorpio_AfterDigEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Scorpio_AfterDigEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hrabia_Ore))&&(scorpio_traitor)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_AfterDigEnd_Info()
{
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_01"); //Mieli�my cholernego farta, �e �yjemy.
	AI_Output (other, self, "DIA_Scorpio_AfterDigEnd_15_02"); //Kto to by�?
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_03"); //To by�a sama �mier�, piracie.
	AI_Output (other, self, "DIA_Scorpio_AfterDigEnd_15_04"); //To dlaczego nadal �yjemy?
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_05"); //Pewnie my�la�, �e bestia nas wyko�czy.
	AI_Output (other, self, "DIA_Scorpio_AfterDigEnd_15_06"); //Opowiedz mi o nim co� wi�cej.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_07"); //Nazywa si� Hrabia. Lub raczej tak chce, �eby na niego m�wiono.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_08"); //Nikt nie wie, sk�d wzi�� si� w Kolonii. Niekt�rzy twierdz�, �e by� tam na d�ugo przed barier� i nawet sam� Koloni�.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_09"); //Szkoli�em akurat nowych rekrut�w, kiedy po raz pierwszy stan�� przed bram�.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_10"); //Pami�tam, jak spojrza� na Thorusa, a ten bez s�owa zszed� mu z drogi.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_11"); //Stra�nicy przy bramie zamku okazali si� wi�kszymi idiotami i wyci�gn�li miecze.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_12"); //Padli martwi, zanim zrozumieli, co ich zabi�o.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_13"); //Nie wiem sk�d, ale Hrabia i Kruk dobrze si� znaj�. Widzia�em to w oczach magnata.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_14"); //Kruk wygl�da�, jakby czeka� na przyj�cie Hrabiego.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_15"); //Razem poszli do Gomeza i od tej pory Hrabia wykonuje brudne zlecenia magnat�w.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_16"); //Jestem jednak pewien, �e to tylko przykrywka.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_17"); //Hrabia i Kruk... Oni co� ukrywaj�. 
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_18"); //Hrabia cz�sto znika� na ca�e dni.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_19"); //Gomez kilka razy wysy�a� za nim cienie, ale �aden z nich nie wr�ci�.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_20"); //Mimo, �e Gomez nie ufa� Hrabiemu, Kruk go przekona�, �e to pot�ny i przydatny sojusznik.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_21"); //Od tamtego czasu Hrabia by� pos�a�cem �mierci Gomeza. Wykonywa� najtrudniejsze zlecenia i nigdy nie zawi�d�.
	AI_Output (other, self, "DIA_Scorpio_AfterDigEnd_15_22"); //A� do teraz.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_23"); //W�tpi�. Nie zostawi� nas przy �yciu bez powodu.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_24"); //Ale wiem jedno. Nie rusz� si� ju� z obozu na krok!
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_25"); //Mam gdzie� te cholerne bry�ki. �ycie jest dla mnie cenniejsze.
	AI_Output (other, self, "DIA_Scorpio_AfterDigEnd_15_26"); //A co z rud� Gomeza?
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_27"); //Skoro Hrabia j� zabra�, to ja na Twoim miejscu bym o niej zapomnia�.

	if (hrabia_log == FALSE)
	{
		hrabia_log = TRUE;
		Log_CreateTopic	(CH1_Rbl_Hrabia, LOG_MISSION);
		Log_SetTopicStatus	(CH1_Rbl_Hrabia, LOG_RUNNING);
	};
   
	B_LogEntry(CH1_Rbl_Hrabia, "Skorpion zdradzi� mi, kim by� nieznajomy w zbroi magnat�w, kt�ry ograbi� mnie z uczciwie skradzionej rudy. Nazywa si� Hrabia i podobno zna si� dobrze z Krukiem. Do tego jest kim� od zada� specjalnych w Starym Obozie. Mam z nim rachunki do wyr�wnania...");
	Npc_ExchangeRoutine(self, "OR");		

	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_GRD_205_SCORPIO_Stew (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 12;
	condition		= DIA_GRD_205_SCORPIO_Stew_Condition;
	information		= DIA_GRD_205_SCORPIO_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla ciebie gulasz Snafa."; 
};

FUNC INT DIA_GRD_205_SCORPIO_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_GRD_205_SCORPIO_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_GRD_205_SCORPIO_Stew_15_01"); //Mam dla ciebie gulasz Snafa.
	AI_Output (self, other, "DIA_GRD_205_SCORPIO_Stew_11_02"); //Gulasz Snafa? Na sam� my�l dostaj� rozwolnienia. Daj to paskudztwo.
	AI_Output (other, self, "DIA_GRD_205_SCORPIO_Stew_15_03"); //Tylko poczekaj z jedzeniem, a� odejd�.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Skorpion narzeka� na gulasz, ale jako� upcha�em mu porcj�."); 
};
