
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Tablor_Exit (C_INFO)
{
	npc			= Non_4020_Tablor;
	nr			= 999;
	condition	= DIA_Tablor_Exit_Condition;
	information	= DIA_Tablor_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Tablor_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Tablor_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Tablor_Hello (C_INFO)
{
	npc				= Non_4020_Tablor;
	nr				= 1;
	condition		= DIA_Tablor_Hello_Condition;
	information		= DIA_Tablor_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj..."; 
};

FUNC INT DIA_Tablor_Hello_Condition()
{
	if(!Npc_KnowsInfo (hero,DIA_Tablor_Talk))
	{
		return 1;
	};
};

FUNC VOID DIA_Tablor_Hello_Info()
{
	B_FullStop			(self);
	B_RemoveWeapon		(self);	
   
	AI_Output (other, self, "DIA_Tablor_Hello_15_01"); //Witaj...
	
   AI_TurnToNpc(self,other);
	Ai_Wait (self,0.5);
   
	AI_Output (other, self, "DIA_Tablor_Hello_15_02"); //Jeste� niemow�?
	
   AI_TurnAway(self,other);
	
   AI_Output (other, self, "DIA_Tablor_Hello_15_03"); //Rozumiem, �e nie chcesz gada� albo nie masz o czym, ale to nie oznacza, �e...
	
   AI_TurnToNpc 	(self,other);
	AI_DrawWeapon (self);
	Ai_Wait (self,0.5);
	
   AI_Output (other, self, "DIA_Tablor_Hello_15_04"); //Dobra, dobra ju� sobie id�.
	
   AI_RemoveWeapon (self);
	
   AI_Output (other, self, "DIA_Tablor_Hello_15_05"); //Cholerny �wir...
	
   B_StopProcessInfos	(self);
};
// **************************************************
INSTANCE DIA_Tablor_Talk (C_INFO)
{
	npc				= Non_4020_Tablor;
	nr				= 2;
	condition		= DIA_Tablor_Talk_Condition;
	information		= DIA_Tablor_Talk_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Tablor_Talk_Condition()
{
	var C_NPC kron; kron = Hlp_GetNpc(Non_4025_Kron);
	if (Npc_KnowsInfo (hero,DIA_Kron_AfterFight))&&(Npc_GetAivar(kron,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Tablor_Talk_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
   
	AI_Output (self, other, "DIA_Tablor_Talk_11_01"); //Pokona�e� Krona, a to nie�atwa sztuka.
	AI_Output (other, self,"DIA_Tablor_Talk_15_02"); //Ty m�wisz!
	AI_Output (self, other, "DIA_Tablor_Talk_11_03"); //Rozmawiam tylko z wojownikami, kt�rzy s� tego warci.
	AI_Output (other, self,"DIA_Tablor_Talk_15_04"); //Walka z jednym orkiem sprawi�a, �e okaza�em si� godny Twojej uwagi?
	AI_Output (self, other, "DIA_Tablor_Talk_11_05"); //Niezupe�nie, ale zaciekawi�e� mnie. �eby zdoby� m�j szacunek musia�by� wykaza� si� naprawd� godnym czynem.
	AI_Output (other, self,"DIA_Tablor_Talk_15_06"); //Wiem, �e pewnie b�d� tego �a�owa�, ale co masz na my�li?
	AI_Output (self, other, "DIA_Tablor_Talk_11_07"); //Pokonaj besti�, a uznam, �e jeste� prawdziwym wojownikiem.
	AI_Output (other, self,"DIA_Tablor_Talk_15_08"); //Jak� besti�?
	AI_Output (self, other, "DIA_Tablor_Talk_11_09"); //Wyb�r nale�y do ciebie, pami�taj jednak, �e im wi�ksza chwa�a tym wi�ksza nagroda.

	Info_ClearChoices (DIA_Tablor_Talk);
	Info_AddChoice (DIA_Tablor_Talk, "Przynios� Ci sk�r�... trolla!", DIA_Tablor_Talk_Trol);
	Info_AddChoice (DIA_Tablor_Talk, "Ukatrupi� cieniostwora!", DIA_Tablor_Talk_Shadow);
	Info_AddChoice (DIA_Tablor_Talk, "Zabij� �cierwojada!", DIA_Tablor_Talk_Scav);
};

// ---------------------------trol----------------------------------------

FUNC VOID DIA_Tablor_Talk_Trol()
{
	tablor_trol = TRUE;
   
	AI_Output (other, self, "DIA_Tablor_Talk_Trol_15_01"); //Przynios� Ci sk�r�... trolla!
	AI_Output (self, other, "DIA_Tablor_Talk_Trol_11_02"); //Hmm, to by�by prawdziwy wyczyn.
	AI_Output (self, other, "DIA_Tablor_Talk_Trol_11_03"); //Niech b�dzie, kiedy to si� stanie udowodnisz, �e jeste� nie tylko odwa�ny, ale i �miertelnie niebezpieczy.
	AI_Output (self, other, "DIA_Tablor_Talk_Trol_11_04"); //Ruszaj wi�c i powodzenia na szlaku.
	
	Log_CreateTopic	(CH2_TRL_Warrior, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Warrior, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Warrior, "Zgodzi�em si� przynie� Tablorowi sk�r� trolla. Nie wiem, co mi strzeli�o do g�owy, ale to jedyny spos�b, �eby uzna� we mnie wojownika.");

	B_StopProcessInfos	(self); 
};

// ------------------shadow----------------

FUNC VOID DIA_Tablor_Talk_Shadow()
{
	tablor_shadow = TRUE;
	AI_Output (other, self, "DIA_Tablor_Talk_Shadow_15_01"); //Ukatrupi� cieniostwora!
	AI_Output (self, other, "DIA_Tablor_Talk_Shadow_11_02"); //Niech i tak b�dzie. Cieniostwory to podst�pne bestie, musisz wykaza� si� nie tylko odwag�, ale i rozwag�.
	AI_Output (self, other, "DIA_Tablor_Talk_Shadow_11_03"); //Przynie� mi sk�r� tej bestii, a uznam, �e� godzien miana wojownika.
	
	Log_CreateTopic	(CH2_TRL_Warrior, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Warrior, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Warrior, "Tablor nazwie mnie wojownikiem, je�eli przynios� mu sk�r� cieniostwora.");

	B_StopProcessInfos	(self); 
};

// ------------------scav----------------

FUNC VOID DIA_Tablor_Talk_Scav()
{

	AI_Output (other, self, "DIA_Tablor_Talk_Scav_15_01"); //Zabij� �cierwojada!
	AI_Output (self, other, "DIA_Tablor_Talk_Scav_11_02"); //Je�eli chcia�e� mnie rozbawi�, to prawie Ci si� to uda�o...
	//Info_ClearChoices (DIA_Tablor_Talk);
};

// **************************************************

INSTANCE DIA_Tablor_Done (C_INFO)
{
	npc				= Non_4020_Tablor;
	nr				= 3;
	condition		= DIA_Tablor_Done_Condition;
	information		= DIA_Tablor_Done_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam sk�r� bestii!"; 
};

FUNC INT DIA_Tablor_Done_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Tablor_Talk)) && (!tablor_beast)
	{
		return 1;
	};
};

FUNC VOID DIA_Tablor_Done_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
   
	AI_Output (other, self,"DIA_Tablor_Done_15_01"); //Mam sk�r� bestii!

	if ((NPC_HasItems(other,ItAt_TrollSkin)>=1)||(NPC_HasItems(other,ItAt_YoTroSkin)>=1))&&(tablor_trol == TRUE)
	{
		tablor_beast = TRUE;
		tablor_trol = 2;
      
		if (NPC_HasItems(other,ItAt_Troll_01)>=1)
		{
			B_GiveXP (500);
			B_GiveInvItems (other, self, ItAt_Troll_01,1);
		}
		else if (NPC_HasItems(other,ItAt_TrollSkin)>=1)
		{
			B_GiveXP (500);
			B_GiveInvItems (other, self, ItAt_TrollSkin,1);
		}
		else if (NPC_HasItems(other,ItAt_YoTroSkin)>=1)
		{
			B_GiveXP (400);
			B_GiveInvItems (other, self, ItAt_YoTroSkin,1);
		};

		TH_trust = TH_trust + 1;
      
		AI_Output (self, other, "DIA_Tablor_Done_11_02"); //W rzeczy samej, udowodni�e�, �e jeste� godzie� miana wojownika.
		AI_Output (self, other, "DIA_Tablor_Done_11_03"); //Kira dowie si�, �e kroczy mi�dzy nami cz�ek odwa�ny i niez�omny. Masz m�j szacunek, a nawet co�... wi�cej.
		AI_Output (other, self,"DIA_Tablor_Done_15_04"); //Co przez to rozumiesz?
		AI_Output (self, other, "DIA_Tablor_Done_11_05"); //W mojej g�owie narodzi�o si� pytanie... Wr��, gdy b�dziesz got�w, by da� mi na nie odpowied�.
		
      Log_SetTopicStatus	(CH2_TRL_Warrior, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Warrior, "Przynios�em Tablorowi sk�r� trolla, by� wyra�nie zdumiony. Zaskarbi�em sobie szacunek tego wojownika i chyba... co� jeszcze. Kira dowie si� na co mnie sta�.");
		B_LogEntry		(CH2_TRL_Quest, "Udowodni�em Tablorowi, �e jestem prawdziwym wojownikiem.");
	}
	else if (NPC_HasItems(other,ItAt_ShadowSkin)>=1)&&(tablor_shadow == TRUE)
	{
		B_GiveXP (400);
		tablor_beast = TRUE;
		B_GiveInvItems (other, self, ItAt_ShadowSkin,1);
		kira_trial = kira_trial + 1;	
      
		AI_Output (self, other, "DIA_Tablor_Done_11_06"); //Rzeczywi�cie to sk�ra cieniostwora. Udowodni�e�, �e nie znasz l�ku ni trwogi.
		AI_Output (self, other, "DIA_Tablor_Done_11_07"); //Masz m�j szacunek, cho� by�em przekonany, �e sta� Ci� na wi�cej.
		AI_Output (other, self,"DIA_Tablor_Done_15_08"); //Co masz na my�li?
		AI_Output (self, other, "DIA_Tablor_Done_11_09"); //Nic, nadal szukam odpowiedzi na pewne pytanie, ale to ju� niewa�ne.
		AI_Output (self, other, "DIA_Tablor_Done_11_10"); //Kira dowie si� co� wart. Bywaj.
		
      Log_SetTopicStatus	(CH2_TRL_Warrior, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Warrior, "Przynios�em Tablorowi sk�r� cieniostwora. Wojownik stwierdzi�, �e sta� mnie na wi�cej, by� jednak wystarczaj�co usatysfakcjonowany. Powie Kirze, co o mnie my�li.");
		B_LogEntry		(CH2_TRL_Quest, "Udowodni�em Tablorowi, �e jestem prawdziwym wojownikiem.");
	}
   else
   {
      AI_Output (self, other, "DIA_Tablor_Done_11_11"); //Nie wydaje mi si�. Odejd� i nie ustawaj w poszukiwaniach.
   };

	B_StopProcessInfos	(self); 
};

var int tablor_challenge;
var int tablor_req;

// **************************************************

INSTANCE DIA_tablor_challenge (C_INFO)
{
	npc				= Non_4020_Tablor;
	nr				= 4;
	condition		= DIA_tablor_challenge_Condition;
	information		= DIA_tablor_challenge_Info;
	permanent		= 1;
	important		= 0;
	description		= "M�wi�e� co� o pytaniu, kt�re ci� dr�czy."; 
};

FUNC INT DIA_tablor_challenge_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Tablor_Done))&&((tablor_trol == 2) ||(tablor_beast)) && (!tablor_challenge)
	{
		return 1;
	};
};

FUNC VOID DIA_tablor_challenge_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};

	if (tablor_req == FALSE)
	{ 
		tablor_req = TRUE;

		AI_Output (other, self,"DIA_tablor_challenge_15_01"); //M�wi�e� co� o pytaniu, kt�re ci� dr�czy.
		AI_Output (self, other, "DIA_tablor_challenge_11_02"); //Tak, mam pewne w�tpliwo�ci.
		AI_Output (other, self,"DIA_tablor_challenge_15_03"); //Jakie w�tpliwo�ci?
		AI_Output (self,other, "DIA_tablor_challenge_11_04"); //Dr�czy mnie niepewno��, nie wiem, kto z nas jest lepszym wojownikiem.
		AI_Output (other, self,"DIA_tablor_challenge_15_05"); //Uwa�aj, bo ta niepewno�� mo�e Ci� zabi�
		AI_Output (self, other, "DIA_tablor_challenge_11_06"); //Bez obaw, jestem got�w podj�� to wyzwanie. A ty?
      
      Log_CreateTopic	(CH2_TRL_Chalange, LOG_MISSION);
      Log_SetTopicStatus	(CH2_TRL_Chalange, LOG_RUNNING);
      B_LogEntry		(CH2_TRL_Chalange, "Tablor rzuci� mi wyzwanie. Ten dumny wojownik chce sprawdzi�, kto z nas jest lepszy.");
	}
   else
   {
      AI_Output (self, other, "DIA_tablor_challenge_11_07"); //Jeste� got�w, aby skrzy�owa� ze mn� or�?
   };
	
   Info_ClearChoices (DIA_tablor_challenge);
	Info_AddChoice (DIA_tablor_challenge, "Jestem got�w.", DIA_tablor_challenge_Yes);
	Info_AddChoice (DIA_tablor_challenge, "Jeszcze nie teraz.", DIA_tablor_challenge_No);
};

// ---------------------------trol----------------------------------------

FUNC VOID DIA_tablor_challenge_Yes()
{
	tablor_challenge = TRUE;
   
	AI_Output (other, self, "DIA_tablor_challenge_Yes_15_01"); //Jestem got�w.
	AI_Output (self, other, "DIA_tablor_challenge_Yes_11_02"); //To dla mnie zaszczyt wojowniku.
	AI_Output (other, self, "DIA_tablor_challenge_Yes_11_03"); //Niech przem�wi stal!
	
   B_LogEntry		(CH2_TRL_Chalange, "Przyj��em wyzwanie Tablora.");	

	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ------------------shadow----------------

FUNC VOID DIA_tablor_challenge_No()
{
	AI_Output (other, self, "DIA_tablor_challenge_No_15_01"); //Jeszcze nie teraz.
	AI_Output (self, other, "DIA_tablor_challenge_No_11_02"); //Droga wojownika, to tak�e droga cierpliwo�ci - poczekam.
	
   B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Tablor_AfterChalange (C_INFO)
{
	npc				= Non_4020_Tablor;
	nr				= 5;
	condition		= DIA_Tablor_AfterChalange_Condition;
	information		= DIA_Tablor_AfterChalange_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Tablor_AfterChalange_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_tablor_challenge))&&(tablor_challenge == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Tablor_AfterChalange_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};

   AI_Output (self, other, "DIA_Tablor_AfterChalange_11_01"); //Droga do doskona�o�ci jest zawsze drog� nauki.
	AI_Output (self, other, "DIA_Tablor_AfterChalange_11_02"); //Jedynym z czego trzeba sobie zda� spraw�, to kto jest uczniem, a kto mistrzem.
      
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		B_GiveXP(200);
		
		AI_Output (other, self,"DIA_Tablor_AfterChalange_15_03"); //Zrozumia�em... t� lekcj�.
		AI_Output (self, other, "DIA_Tablor_AfterChalange_11_04"); //Ja tak�e wiele si� nauczy�em. Dzi�kuj� Ci za to przyjacielu.
		
      Log_SetTopicStatus	(CH2_TRL_Chalange, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Chalange, "Przegra�em, lecz mimo to poczu�em si� jak... wygrany. Zdoby�em te� przyjaciela, a to jest dla mnie najwa�niejsze.");
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		B_GiveXP(500);
		
		AI_Output (other, self, "DIA_Tablor_AfterChalange_11_07"); //A ja zrozumia�em... t� lekcj�.
		AI_Output (self, self,"DIA_Tablor_AfterChalange_15_08"); //Ja tak�e wiele si� nauczy�em, dzi�kuj� Ci za to przyjacielu.
		AI_Output (self, other, "DIA_Tablor_AfterChalange_11_09"); //Zas�u�y�e� na nagrod�. We� to ostrze - zawsze dobrze mi s�u�y�o.
		
      AI_RemoveWeapon(self);
		AI_UnequipWeapons	(self);

		AI_Output (self, other, "DIA_Tablor_AfterChalange_11_10"); //Bardziej ni� ja godzien jeste� je nosi�.
		AI_Output (other, self,"DIA_Tablor_AfterChalange_15_11"); //To zbyt wiele...
		AI_Output (self, other, "DIA_Tablor_AfterChalange_11_12"); //Wystarczy ju� s��w, przyjacielu.
		
      B_GiveInvItems (self, other, ItMw_2H_Axe_Heavy_02,1);//mo�na zmieni� na jaki� s�abszy or�, albo recept� na co� dobrego.
		CreateInvItems (self, ItMw_2H_Axe_Heavy_02,1); 
		AI_EquipBestMeleeWeapon	(self);

		Log_SetTopicStatus	(CH2_TRL_Chalange, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Chalange, "Pokona�em Tablora, ten wspania�y wojownik podarowa� mi w nagrod� sw�j top�r. Znalaz�em dzi� nowego przyjaciela...");
	};
   
   B_StopProcessInfos	(self); 
};