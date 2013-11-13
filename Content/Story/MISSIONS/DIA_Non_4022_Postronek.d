
// **************************************************
// 						 EXIT 
// **************************************************
//TODO: POPRAWIC TEN DIALOG zjechany z Bulko!
INSTANCE DIA_Postronek_Exit (C_INFO)
{
	npc			= Non_4022_Postronek;
	nr			= 999;
	condition	= DIA_Postronek_Exit_Condition;
	information	= DIA_Postronek_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Postronek_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Postronek_Exit_Info()
{
   if (Npc_HasItems(hero, ItMw_2h_Post) == 1)
   {
      Npc_RemoveInvItems(hero, ItMw_2h_Post, 1);
   };
   
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Postronek_Hello (C_INFO)
{
	npc				= Non_4022_Postronek;
	nr				= 1;
	condition		= DIA_Postronek_Hello_Condition;
	information		= DIA_Postronek_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_Postronek_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Postronek_Hello_Info()
{
	AI_Output (other, self, "DIA_Postronek_Hello_15_01"); //Witaj.
	AI_Output (self, other, "DIA_Postronek_Hello_11_02"); //Wygl�dasz jak naw�z.
	AI_Output (other, self, "DIA_Postronek_Hello_15_03"); //Co?!
	AI_Output (self, other, "DIA_Postronek_Hello_11_04"); //M�wi�, �e wygl�dasz jak g�wno i podobnie pachniesz.

	Info_ClearChoices (DIA_Postronek_Hello);
	Info_AddChoice (DIA_Postronek_Hello, "G�wno to Ty masz mi�dzy uszami!", DIA_Postronek_Hello_Yes);
	Info_AddChoice (DIA_Postronek_Hello, "Chyba ju� sobie p�jd�.", DIA_Postronek_Hello_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Postronek_Hello_Yes()
{
	AI_Output (other, self, "DIA_Postronek_Hello_Yes_15_01"); //G�wno to ty masz mi�dzy uszami!
	AI_Output (self, other, "DIA_Postronek_Hello_Yes_07_02"); //He, he, masz jaja, ch�opcze. Podobasz mi si�, a tobie Mary?

	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_Wait				(self, 1);
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);
	AI_EquipBestMeleeWeapon	(self);
	
   AI_Output (self, other, "DIA_Postronek_Hello_Yes_07_03"); //Mary te� Ci� polubi�a. Witaj w obozie, ch�opcze.
	AI_Output (other, self, "DIA_Postronek_Hello_Yes_15_04"); //Rozmawiasz ze swoim... mieczem?
	AI_Output (self, other, "DIA_Postronek_Hello_Yes_07_05"); //To nie tylko miecz ch�opcze, to moja jedyna kochanka.
	AI_Output (other, self, "DIA_Postronek_Hello_Yes_15_06"); //Mi�o by�o... was pozna�. Bywaj �owco.
	B_StopProcessInfos	(self); 
};

// ------------------No----------------

FUNC VOID DIA_Postronek_Hello_No()
{
	AI_Output (other, self, "DIA_Postronek_Hello_No_15_07"); //Chyba ju� sobie p�jd�.
	AI_Output (self, other, "DIA_Postronek_Hello_No_07_08"); //Pieprzony tch�rz. Nie tak szybko m�dralo. Zaraz Mary zasmakujesz krwi tego chuderlaka...
	
   B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Postronek_Hello1 (C_INFO)
{
	npc				= Non_4022_Postronek;
	nr				= 1;
	condition		= DIA_Postronek_Hello1_Condition;
	information		= DIA_Postronek_Hello1_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Postronek_Hello1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Postronek_Hello))&&(TH_trust >= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Postronek_Hello1_Info()
{
	AI_Output (self, other, "DIA_Postronek_Hello1_11_01"); //To znowu Ty? I to w jednym kawa�ku, ca�kiem nie�le, ch�opcze.
	AI_Output (other, self, "DIA_Postronek_Hello1_15_02"); //Radz� sobie jak mog�.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_03"); //W to nie w�tpi�. Kira co� m�wi�a, �e szukasz sojusznik�w. Prawda to?
	AI_Output (other, self, "DIA_Postronek_Hello1_15_04"); //Tak, wys�a� mnie Cavalorn, szef obozu rebeliant�w.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_05"); //Wiem, znam tego �mierdziela Leafa.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_06"); //Czyli musisz udowodni� co� wart i takie tam.
	AI_Output (other, self, "DIA_Postronek_Hello1_15_07"); //Mniej wi�cej.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_08"); //Kira ma racj�, je�eli mamy stan�� po czyjej� stronie, to musimy dobrze wybra�.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_09"); //Dla mnie liczy si� tylko si�a i moja Mary oczywi�cie.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_10"); //Hmm, je�eli dasz rad� unie�� Mary, to powiem Kirze, �e zacny z Ciebie wojak.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_11"); //Mo�emy si� o to za�o�y�. Tak, zak�ad to przednia my�l!
	AI_Output (other, self, "DIA_Postronek_Hello1_15_12"); //Zastanowi� si�...

	Log_CreateTopic	(CH2_TRL_Mary, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Mary, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Mary, "Je�eli chc� zdoby� szacunek Postronka, to musz� sprosta� jego Mary. No nic chyba warto spr�bowa�...");
};

// ************************************************************/
var int Post_WetteGewonnen;

//-------------------------

instance DIA_Post_Wette (C_INFO)
{
	npc			=  Non_4022_Postronek;
	nr			= 5;
	condition	= DIA_Post_Wette_Condition;
	information	= DIA_Post_Wette_Info;
	permanent		= 1;
	important		= 0;
	description	= "Za�o�� si�, �e spokojnie dam sobie rad� z Twoj�... Mary!"; 
};                       

FUNC INT DIA_Post_Wette_Condition()
{
	if (Post_WetteGewonnen == FALSE)
	&& (Npc_KnowsInfo (hero, DIA_Postronek_Hello1))
	{
		return TRUE;	
	};
};

FUNC VOID DIA_Post_Wette_Info()
{	
	AI_Output (other, self, "DIA_Post_Wette_15_00"); //Za�o�� si�, �e spokojnie dam sobie rad� z Twoj�... Mary!
	AI_Output (self, other, "DIA_Post_Wette_06_01"); //Naprawd�? Ile chcesz przegra�?
	AI_Output (self, other, "DIA_Post_Wette_06_02"); //No c�, wygl�dasz raczej na biednego durnia. Powiedzmy - 100 bry�ek! Masz chocia� tyle?
	
	Info_ClearChoices (DIA_Post_Wette);

	if (NPC_HasItems(other,ItMiNugget)>=100)
	{	
		Info_AddChoice (DIA_Post_Wette, "Jasne.", DIA_Post_Wette_Yes);
	}
	else
	{
		Info_AddChoice (DIA_Post_Wette, "Nie.", DIA_Post_Wette_No);
	};
};

func void DIA_Post_Wette_No()
{
	AI_Output (other, self, "DIA_Post_Wette_No_15_03"); //Nie.
	AI_Output (self, other, "DIA_Post_Wette_No_06_04"); //To je zdob�d�.
	
	Info_ClearChoices (DIA_Post_Wette);
};

func void DIA_Post_Wette_Yes()
{
	AI_Output (other, self, "DIA_Post_Wette_Yes_15_05"); //Jasne.
	AI_Output (self, other, "DIA_Post_Wette_Yes_06_06"); //Niech no spojrz�...		
	
   AI_Output (other, self, "DIA_Post_Wette_Yes_15_07"); //Mam rud�!
	AI_Output (self, other, "DIA_Post_Wette_Yes_06_08"); //W porz�dku, zobaczmy, na co Ci� sta�...
	
	B_GiveInvItems (self, other, ItMw_2h_Post, 1);
	
	if (other.attribute[ATR_STRENGTH] >= 60)
	{
      var c_item hero_weapon; hero_weapon = Npc_GetEquippedMeleeWeapon(other);
      
		TH_trust = TH_trust + 1;
		B_GiveXP (250);
      AI_UnequipWeapons(other);
      EquipItem(hero, ItMw_2h_Post);
		AI_EquipBestMeleeWeapon	(other);
		AI_ReadyMeleeWeapon(hero);
						
		AI_Output (other, self, "DIA_Post_Wette_Yes_15_09");//Cho�by na to?!
		AI_Output (self, other, "DIA_Post_Wette_Yes_06_10");//Wygl�da na to, �e wygra�e�.
		AI_Output (self, other, "DIA_Post_Wette_Yes_06_11");//Kto by przypuszcza�. Naprawd� nie wygl�dasz mi na kogo�, kto mia�by tyle krzepy.
		AI_Output (self, other, "DIA_Post_Wette_Yes_06_12");//W�a�nie straci�em 200 bry�ek, s� Twoje.
		
      AI_RemoveWeapon (hero);
      AI_UnequipWeapons	(hero);
      EquipItem(hero, hero_weapon);
      AI_EquipBestMeleeWeapon	(other);
      AI_EquipBestRangedWeapon(other);
   
      CreateInvItems (self, ItMiNugget,100); 
		B_GiveInvItems (self, other, ItMiNugget, 100);
		Post_WetteGewonnen = TRUE;
		Log_SetTopicStatus	(CH2_TRL_Mary, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Mary, "Sprosta�em Mary, Postronek chc�c nie chc�c, musi mnie poprze�. Dodatkowo wygra�em 200 bry�ek.");
	}
	else
	{
		AI_Output (other, self, "DIA_Post_Wette_Yes_15_13"); //Nie ud�wign� tej broni!
		AI_Output (self, other, "DIA_Post_Wette_Yes_06_14");//To w�a�nie pr�buj� Ci u�wiadomi�!
		AI_Output (self, other, "DIA_Post_Wette_Yes_06_15");//Dawaj rud�, dzisiaj szcz�cie Ci nie sprzyja, przyjacielu.
		
      B_GiveInvItems (other, self, ItMiNugget, 100);
		Log_SetTopicStatus	(CH2_TRL_Mary, LOG_FAILED);
		B_LogEntry		(CH2_TRL_Mary, "Cholera jednak si� przeliczy�em i nie sprosta�em Mary.");
	};
	
	AI_Output (self, other, "DIA_Post_Wette_Yes_06_16");//A teraz oddaj miecz i znikaj.
   
	B_GiveInvItems (hero, self, ItMw_2h_Post, 1);	
   AI_EquipBestMeleeWeapon	(self);
   
	Info_ClearChoices (DIA_Post_Wette);
};
