// Ork: Tu nekro w Cave.ZEN (1sze spotkanie) + w swojej siedzibie
// **************************************************
// 						 EXIT 
// **************************************************
prototype Necro_Exit (C_INFO)
{
	npc			=  DMB_1700_Necro;
	nr			=  999;
	condition	=  DIA_Necro_Exit_Condition;
	information	=  DIA_Necro_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int DIA_Necro_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_Necro_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_Necro_Exit (Necro_Exit)
{
};      

INSTANCE DIA_NecroInNecroloc_Exit (Necro_Exit)
{
   npc = DMB_1701_NecroInNecroloc;
}; 

INSTANCE DIA_NecroInWorld_Exit (Necro_Exit)
{
   npc = DMB_1703_NecroInWorld;
};                  

INSTANCE DIA_Necro_First (C_INFO)
{
	npc				= DMB_1700_Necro;
	nr				= 1;
	condition		= DIA_Necro_First_Condition;
	information		= DIA_Necro_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necro_First_Condition()
{

	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Leren_RuneSwdBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	//AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Necro_First_11_01"); //Jak �miesz zabija� moje s�ugi?!
	AI_Output (self, other, "DIA_Necro_First_11_02"); //Spr�buj zata�czy� z ogniem!
	//AI_Output (other, self, "DIA_Necro_First_15_02"); //
	B_LogEntry(CH4_Nec_BM, "Znalaz�em nekromant�! Mam nadziej�, �e prze�yj� wystarczaj�co d�ugo, aby z nim porozmawia�.");

	/******************
	Dodaj jakie� szpanerskie efekty xD
	******************/
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, self, 1, 0, DAM_MAGIC, FALSE);
	B_StopProcessInfos(self);
	/*********************
	Ork mo�na to jedn� rutyn� za�atwi� tylko dac tam warunki, czyli jak place_change ==1 to rutyna w tym wp, jak ==2 to w innym, etc.
	***********************/
	place_change = place_change + 1;
	Npc_ExchangeRoutine (self, "next_place");
	/***********************
	Z tego co aragorn pisa� to kole� ma po dialogach znika�, to mo�e tym startstatem lepiej si� to robi bo TP chyba nie dzia�a tak.
	Stw�rz jaki� zs albo zr�b to po swojemu
	Aha w zs te| uwzgl�dnij place_change
	***********************/
	//AI_StartState(self,ZS_NekroTP,1,"");
};

// **************************************************

/*********************
Po ogniach i lawie
*********************/

INSTANCE DIA_Necro_Second(C_INFO)
{
	npc				= DMB_1700_Necro;
	nr				= 2;
	condition		= DIA_Necro_Second_Condition;
	information		= DIA_Necro_Second_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necro_Second_Condition()
{
	// Ork: 3ci warunek powinien zahamowa� nekro przed gadaniem zbyt wiele zanim uciekniemy przed lawa
	// #2 Ta pierwa rozmowa nie zawsze sie uruchamia (u mnie nigdy :P ) dlatego sprawdzmy lepiej zmienna z EventCave.d zamiast Info
	if (Npc_GetDistToNpc(self,hero) < 1000)&& (EvtCave_HeroRunawaySucess) && (Npc_GetDistToWP(self,"ESCAPE_DARKMAGE") < 2000)
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Second_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other, "DIA_Necro_Second_11_01"); //To znowu Ty?!
	AI_Output (self, other, "DIA_Necro_Second_11_02"); //Jak �mia�e� przej�� przez law�?!
	AI_Output (other, self, "DIA_Necro_First_15_03"); //Tak jako� wysz�o.
	AI_Output (self, other, "DIA_Necro_Second_11_04"); //Ty natr�tna gnido. �miesz mi rzuca� wyzwanie?!
	AI_Output (other, self, "DIA_Necro_First_15_05"); //Nie... Panie. Chcia�em tylko... b�aga� o to, aby� zaszczyci� mnie odpowiedzi� na jedno pytanie?
	AI_Output (self, other, "DIA_Necro_Second_11_06"); //Zaszczyci�? Dobrze, dost�pisz tego zaszczytu zanim wypcham Ci� i powiesz� nad kominkiem. Pytaj!

	Info_ClearChoices (DIA_Necro_Second);
	Info_AddChoice (DIA_Necro_Second, "Zechcesz zosta� moim mistrzem?", DIA_Necro_Second_Learn);
	
   if (NPC_HasItems(other, ItMw_2H_RuneSWD_01)>=1)
	{
      Info_AddChoice (DIA_Necro_Second, "Sp�jrz na to ostrze.", DIA_Necro_Second_Swd);
	};
};

// ---------------------------Swd----------------------------------------

FUNC VOID DIA_Necro_Second_Swd()
{
	AI_Output (other, self, "DIA_Necro_Second_Swd_15_01"); //Sp�jrz na to ostrze.
	AI_EquipBestMeleeWeapon	(other);
	AI_ReadyMeleeWeapon		(other);
	AI_PlayAni				(other, "T_1HSINSPECT");
	AI_UnequipWeapons		(other);
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_02"); //Natychmiast oddaj mi miecz!
	AI_Output (other, self, "DIA_Necro_Second_Swd_15_03"); //Prosz�.
   
	B_GiveInvItems(other, self, ItMw_2H_RuneSWD_01, 1);
   
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_04"); //G�upcze ten miecz runiczny to Ostrze Boskiej Tr�jcy!
	AI_Output (other, self, "DIA_Necro_Second_Swd_15_05"); //Wiem o tym...
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_06"); //I odda�e� mi or� z w�asnej woli? Albo jeste� idiot� albo najbardziej naiwnym skaza�cem w ca�ej Kolonii.
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_07"); //Gdy tchn� moc w pradawn� stal b�d� w�ada� nieujarzmion� pot�g� �ywio��w!
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_08"); //Ale ciebie ju� wtedy nie b�dzie w�r�d �ywych.
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_09"); //Spr�buj znowu przej�� przez p�omienie...

	B_StopProcessInfos(self);
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, self, 1, 0, DAM_MAGIC, FALSE);
	/*********************
		Znowu gdzie� spada, ale teraz to ju� nieistotne bo dick i tak umiera
		***********************/
	place_change = place_change + 1;
	Npc_ExchangeRoutine (self, "next_place");
	Rick_death = true;
	//AI_StartState(self,ZS_NekroTP,1,"");
	
	/************************
		Dicka znowu ma zala� lawa ale tym razem nie ma mo�liwo�ci ucieczki.
		***********************/
	//TODO: Przypomniec sobie triggery spisac TP i podnoszenie lavy z starego nekro (DMB NEKRO COSTAM
	//dick_end ();
};

FUNC VOID DIA_Necro_Second_Learn()
{
	AI_Output (other, self, "DIA_Necro_Second_Learn_15_01"); //Zechcesz zosta� moim mistrzem?
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_02"); //Jak �miesz o to pyta�?!
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_03"); //Jestem czarnym magiem, wybranym s�ug� Beliara, w�adam pot�g� nekromancji, s�u�� mi zast�py umar�ych i demon�w. 
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_04"); //Co Ty mi mo�esz zaoferowa� pr�cz swego n�dznego �ywota?
	AI_Output (other, self, "DIA_Necro_Second_Learn_15_05"); //Przynios� Ci g�owy Twych wrog�w, wypal� Twe imi� w trwo�liwych sercach �miertelnik�w, b�d� Twym mieczem i tarcz� po kres swych dni! 
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_06"); //Zapalczywe to s�owa... Hmm. Wyczuwam w Tobie... godny potencja�.
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_07"); //Przyda�by mi si� s�u��cy, narz�dzie gotowe wype�ni� m� wol�.
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_08"); //Dobrze wi�c, uczyni� Ci ten zaszczyt. Ale najpierw musisz przej�� Pr�b� Mroku, aby dowie�� swej warto�ci.
	AI_Output (other, self, "DIA_Necro_Second_Learn_15_09"); //Co to za pr�ba, Panie?
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_10"); //Dowiesz si� w swoim czasie. We� t� run�. Mam nadziej�, �e wiesz, co masz z ni� zrobi�...
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_11"); //A na razie, �egnaj!

	//Ork: To chyba zostaje:
	B_LogEntry(CH4_Nec_BM, "Aby zdoby� zaufanie nekromanty musz� odby� Pr�b� Mroku. Na razie dosta�em run�? Ciekawe, dok�d mnie ona doprowadzi?");
	B_StopProcessInfos(self);
	place_change = place_change + 1; //Ork: NIE WIEM CO TO ZA ZMIENNA? ZOSTAWIAM NARAZIE TUTAJ
	Npc_ExchangeRoutine (self, "next_place");//Ork: Dodaje ju� run� tutaj, ale dialog�w nie tykam :)
	Create_and_give(ItArRuneTeleportToNecroloc, 1);
};

INSTANCE DIA_Necro_GreetInNecroloc(C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;//Ork: zrobione
	nr				= 31;
	condition		= DIA_Necro_GreetInNecroloc_Condition;
	information		= DIA_Necro_GreetInNecroloc_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necro_GreetInNecroloc_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1500)&&(Npc_KnowsInfo (hero, DIA_Necro_Second))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_GreetInNecroloc_Info()
{
	//Ork: Nekro podchodzi do hero
	if(Npc_GetDistToNpc(self,hero) > 400)
	{
		AI_TurnToNpc(self, other);
		AI_SetWalkmode(self,NPC_WALK);
		AI_GotoNpc(self,other);
	};
	AI_Output (self, other, "DIA_Necro_GreetInNecroloc_11_01"); //Na Beliara! Jednak odwa�y�e� si� do mnie teleportowa�!
	AI_Output (other, self, "DIA_Necro_GreetInNecroloc_15_02"); //Bo chc� wszystko robi� ku chwal� Beliara, m�j panie!
	AI_Output (self, other, "DIA_Necro_GreetInNecroloc_11_03"); //Dobrze, bardzo dobrze. Daj zna�, gdy tylko b�dziesz gotowy, aby rozpocz�� pr�b�!
};

INSTANCE DIA_Necro_ReadyForTest(C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;//Ork: zrobione
	nr				= 32;
	condition		= DIA_Necro_ReadyForTest_Condition;
	information		= DIA_Necro_ReadyForTest_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jestem got�w by� podda� mnie pr�bie."; //Ork: Ewentualnie do poprawki 
};

FUNC INT DIA_Necro_ReadyForTest_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_GreetInNecroloc))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_ReadyForTest_Info()
{
	AI_Output (other, self, "DIA_Necro_ReadyForTest_15_01"); //Jestem got�w by� podda� mnie pr�bie.
   AI_Output (other, self, "DIA_Necro_ReadyForTest_11_02"); //Co to za pr�ba, Panie?
	AI_Output (self, other, "DIA_Necro_ReadyForTest_11_03"); //Tylko kto�, kto potrafi zabi� swoje w�asne jestestwo mo�e sta� si� czar� Beliara.
	AI_Output (other, self, "DIA_Necro_ReadyForTest_11_04"); //Jestem got�w.
	AI_Output (self, other, "DIA_Necro_ReadyForTest_11_05"); //Zmierz si� wi�c z samym sob�, ze swoj� si�� i s�abo�ci�, aby sta� si� Dzieckiem Ciemno�ci!
	
   Log_CreateTopic(CH4_Nec_Trial, LOG_MISSION);
	Log_SetTopicStatus(CH4_Nec_Trial, LOG_RUNNING);
	B_LogEntry(CH4_Nec_Trial, "Nekromanta podda� mnie Pr�bie Mroku. Musz� zmierzy� si� z... samym sob�.");
	B_LogEntry(CH4_Nec_BM, "Aby zdoby� zaufanie nekromanty, musz� odby� Pr�b� Mroku.");
	B_StopProcessInfos(self);
   
   /*********************
		Nekro znika i pojawia si� drugi Rick, tylko ma mie� czerwone ga�y. Ork zr�b to jak uwa�asz...
		Opis Aragorna:
		Nawalamy si� z nim, ale po pewnym czasie zdajemy sobie spraw� z tego, �e mamy wa�a.
		Gdy obrywa nasz sobowt�r my tracimy dok�adnie tyle samo hp. - jestem geniuszem :D
		Z otworu w sklepieniu pada struga �wiat�a, gdy uda nam si� w ni� zagna� przeciwnika ten zaczyna p�on��. Wtedy atakuj�c go nie tracimy hp.
		
		Po pokonaniu niech nekro znowy si� pojawia.
		Niech si� zmienna dick_trial ustawi na TRUE jak mu si� uda bo to b�dzie warunek do kolejnego dialogu
		***********************/
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, self, 1, 0, DAM_MAGIC, FALSE);
	Wld_InsertNpc (PC_Hero_AlterEgo, "NECRO_CENTER");
};

/*********************
Po pr�bie
*********************/

INSTANCE DIA_Necro_Trial(C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;//Ork: zrobione
	nr				= 3;
	condition		= DIA_Necro_Trial_Condition;
	information		= DIA_Necro_Trial_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necro_Trial_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Necro_ReadyForTest)) && (Npc_IsDead(PC_Hero_AlterEgo))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Trial_Info()
{
	/*********************
	Ork wsad� Lestera i Bal trombala tam gdzie maj� by�, b�d� ju� gotowi do zadania z jaszczurami

	Wld_InsertNpc (PC_Psionic,"wp");
	Wld_InsertNpc (Gur_1203_BaalTondral,"wp");

	**********************/

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Necro_Trial_11_01"); //�yjesz. Beliar Ci sprzyja�. Dowiod�e�, �e� wart bym uczyni� Ci� swym narz�dziem.
	AI_Output (other, self, "DIA_Necro_Trial_15_02"); //To dla mnie zaszczyt, mistrzu.
	AI_Output (self, other, "DIA_Necro_Trial_11_04"); //Czas rozpocz�� nauk� i lepiej, �eby� mnie nie zawi�d�!

	Log_SetTopicStatus	(CH4_Nec_Trial, LOG_SUCCESS);
	B_LogEntry(CH4_Nec_Trial, "Sta�o si�, zosta�em uczniem nekromanty. Ten arogancki idiota da� si� nabra�, zobaczymy na jak d�ugo.");
	B_LogEntry(CH4_Nec_BM, "Pr�b� Mroku mam ju� za sob�, czas dowiedzie� si� czego� wi�cej o almanachu.");

	Log_CreateTopic	(CH4_Nec_Master, LOG_MISSION);
	Log_SetTopicStatus	(CH4_Nec_Master, LOG_RUNNING);
	B_LogEntry(CH4_Nec_Master, "Zosta�em uczniem nekromanty! Musz� to dobrze wykorzysta�. Powinienem pozna� mo�liwie du�o tajnik�w nekromancji, kto wie czy nie przydadz� mi si� kiedy� w s�usznej sprawie?");
};

// **************************************************

/****************
	Ork dor�b tu kr�gi magi, etc. ja potem dodam teksty
	***************/

INSTANCE DIA_Necro_Learn (C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc; //Ork: Poprawiam na NECROLOC.ZEN
	nr				= 4;
	condition		= DIA_Necro_Learn_Condition;
	information		= DIA_Necro_Learn_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chc� zg��bi� tajemn� wiedz�."; 
};

FUNC INT DIA_Necro_Learn_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_Trial))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Learn_Info()
{
	AI_Output (other, self, "DIA_Necro_Learn_15_01"); //Chc� zg��bi� tajemn� wiedz�.
	AI_Output (self, other, "DIA_Necro_Learn_11_02"); //Uka�� Ci pot�g� Beliara!
};
// **************************************************


/****************
	Ork dor�b tu t� truzicn� ja nie mam poj�cia jak to dzia�a
	***************/

INSTANCE DIA_Necro_Poison (C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc; //Ork: Poprawiam z necro w CAVE.ZEN => NECROLOC.ZEN
	nr				= 5;
	condition		= DIA_Necro_Poison_Condition;
	information		= DIA_Necro_Poison_Info;
	permanent		= 0;
	important		= 0;
	description		= "Naucz mnie przyrz�dza� trucizny."; 
};

FUNC INT DIA_Necro_Poison_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_Trial))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Poison_Info()
{
	AI_Output (other, self, "DIA_Necro_Poison_15_01"); //Naucz mnie przyrz�dza� trucizny.
	AI_Output (self, other, "DIA_Necro_Poison_11_02"); //To nic trudnego, wymaga tylko troch� czasu i sporej ilo�ci kr�lik�w do�wiadczalnych...

	B_LogEntry(CH4_Nec_Master, "M�j mistrz nauczy mnie przyrz�dzania trucizn.");
};

// **************************************************

INSTANCE DIA_Necro_Swd (C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;
	nr				= 6;
	condition		= DIA_Necro_Swd_Condition;
	information		= DIA_Necro_Swd_Info;
	permanent		= 0;
	important		= 0;
	description		= "Opowiedz mi o Ostrzu Boskiej Tr�jcy."; 
};

FUNC INT DIA_Necro_Swd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_Trial))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Swd_Info()
{
	AI_Output (other, self, "DIA_Necro_Swd_15_01"); //Opowiedz mi o Ostrzu Boskiej Tr�jcy.
	AI_Output (self, other, "DIA_Necro_Swd_11_02"); //Sk�d o nim wiesz?! Przecie� jeste� tylko zwyk�ym �mieciem!

	Info_ClearChoices (DIA_Necro_Swd);
   
	if (NPC_HasItems(other, ItMw_2H_RuneSWD_01)>=1)
	{
      Info_AddChoice (DIA_Necro_Swd, "Mam ten miecz przy sobie.", DIA_Necro_Swd_Show);
	};
	Info_AddChoice (DIA_Necro_Swd, "Nale�y do s�ugus�w Innosa.", DIA_Necro_Swd_Tell);
};

// ---------------------------Swd----------------------------------------

FUNC VOID DIA_Necro_Swd_Show()
{
	AI_Output (other, self, "DIA_Necro_Swd_Show_15_01"); //Mam ten miecz przy sobie.
	AI_Output (self, other, "DIA_Necro_Swd_Show_11_02"); //To niemo�liwe - poka� or�!
	AI_Output (other, self, "DIA_Necro_Swd_Show_15_03"); //Oto on.
	
   AI_EquipBestMeleeWeapon	(other);
	AI_ReadyMeleeWeapon		(other);
	AI_PlayAni				(other, "T_1HSINSPECT");
	AI_UnequipWeapons		(other);
	
   AI_Output (self, other, "DIA_Necro_Swd_Show_11_04"); //Natychmiast oddaj mi ten miecz!
	AI_Output (other, self, "DIA_Necro_Swd_Show_15_05"); //Prosz�, mistrzu.
	
   B_GiveInvItems(other, self, ItMw_2H_RuneSWD_01, 1);
	
   AI_Output (self, other, "DIA_Necro_Swd_Show_11_06"); //G�upcze, teraz ju� do niczego nie jeste� mi potrzebny!
	AI_Output (self, other, "DIA_Necro_Swd_Show_11_07"); //Unurzam �wiat w krwi �miertelnik�w ku chwale mego Pana, a zaczn� od Ciebie.
	AI_Output (other, self, "DIA_Necro_Swd_Show_15_08"); //Nie!
	
   B_StopProcessInfos	(self);
	Rick_death = true;
};

// ---------------------------Tell----------------------------------------

FUNC VOID DIA_Necro_Swd_Tell()
{
	AI_Output (other, self, "DIA_Necro_Swd_Tell_15_01"); //Nale�y do s�ugus�w Innosa z Obozu Rebeliant�w.
	AI_Output (self, other, "DIA_Necro_Swd_Tell_11_02"); //Musz� go mie�!
	AI_Output (other, self, "DIA_Necro_Swd_Tell_15_03"); //Rozkazuj, mistrzu. �yj� by Ci s�u�y�.
	AI_Output (self, other, "DIA_Necro_Swd_Tell_11_04"); //Tak, b�dziesz doskona�ym narz�dziem. Przynie� mi ten miecz, tylko ja wiem jak tchn�� w martw� stal pot�g� bog�w.
	AI_Output (self, other, "DIA_Necro_Swd_Tell_11_05"); //Musz� rozejrze� si� w bibliotece za tym cholernym almanachem...
	AI_Output (self, other, "DIA_Necro_Swd_Tell_11_06"); //Na co czekasz! Id� wype�ni� wol� swego Pana.
	AI_Output (other, self, "DIA_Necro_Swd_Tell_15_07"); //Jak rozka�esz, mistrzu.
	
   B_LogEntry(CH4_GRD_RuneSwd, "Nekromanta wspomnia� co� o almanachu w jego bibliotece. Powinienem si� tam rozejrze�.");
	B_LogEntry(CH4_Nec_BM, "Ten Nekromanta to sko�czony dure�! Jak na razie dobrze odegra�em swoj� rol�. Mam mu przynie�� miecz runiczny - to sobie troch� poczeka. Ten stary cap wspomnia� co� o almanachu w swojej bibliotece - chyba powinienem zwiedzi� te cuchn�ce katakumby.");
	B_LogEntry(CH4_Nec_Master, "Mam dostarczy� nekromancie miecz runiczny.");	
	B_StopProcessInfos	(self);
	/************
		Ork s�uchaj trzebaby mu tu da� rytyn� w stylu tej xardasa. Ork trzeba zrobi� tak, �e jak nekro jest w bibliotece to dick nie ma szans co� z niej zwin��.
		Daj mu rutyn� losow� mo�e, �eby graczom troch� �ycie utrudni�, i niech co kilka h na 1h stamt�d wychodzi - tylko wtedy b�dzie mo�na zwin�� almanach		
		************/
   Wld_InsertItem(almanach_res, "LIBRARY_ALMANACH");
	
	Npc_ExchangeRoutine (self, "read");
};

// **************************************************

/*******************
Opcja dla idiot�w xD
********************/

INSTANCE DIA_Necro_GiveSwd(C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;
	nr				= 9;
	condition		= DIA_Necro_GiveSwd_Condition;
	information		= DIA_Necro_Swd_Show;
	permanent		= 0;
	important		= 0;
	description		= "Mam ten miecz przy sobie."; 
};

FUNC INT DIA_Necro_GiveSwd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_Swd))&&(NPC_HasItems(other, ItMw_2H_RuneSWD_01)>=1)
	{
		return 1;
	};
};

// **************************************************

INSTANCE DIA_Necro_Dead(C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;
	nr				= 7;
	condition		= DIA_Necro_Dead_Condition;
	information		= DIA_Necro_Dead_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necro_Dead_Condition()
{
	/**************

	Ork trzeba zrobi� tak, �e jak nekro jest w bibliotece to dick nie ma szans co� z niej zwin��.
	Daj mu rutyn� losow� mo�e, �eby graczom troch� �ycie utrudni�, i niech co kilka h na 1h stamt�d wychodzi - tylko wtedy b�dzie mo�na zwin�� almanach

	Opis aragorna

Idziemy do biblioteki. Gdy zbli�amy si� do wej�cia aktywuje si� kamerka ukazuj�ca nekromant� przeszukuj�cego pierwszy rega�. Necro �azi mi�dzy rega�ami, a naszym zadaniem jest znale�� i zabra� ksi�g� tak �eby nas nie zauwa�y�.

	****************/

	if (Npc_KnowsInfo (hero, DIA_Necro_Swd))&&(Npc_GetDistToWP (self, "LIBRARY_ALMANACH") < 1000 )
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Dead_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Necro_Dead_11_01"); //Czego tu szukasz przyb��do?!
	AI_Output (other, self, "DIA_Necro_Dead_15_02"); //Ekhm... Zgubi�em si�, Mistrzu.
	AI_Output (self, other, "DIA_Necro_Dead_11_03"); //Czy�by? A mi si� wydaje, �e chcia�e� po�o�y� swoje brudne �apska na kt�rym� z moich wolumin�w.
	AI_Output (self, other, "DIA_Necro_Dead_11_04"); //Gi� �a�osna kreaturo!
	AI_Output (other, self, "DIA_Necro_Dead_15_05"); //Nie!
	B_StopProcessInfos	(self);
	AI_PlayAni		(other,	"T_PSI_VICTIM");
	Npc_ChangeAttribute	(other, ATR_HITPOINTS, -other.attribute[ATR_HITPOINTS_MAX]);

};
// **************************************************

INSTANCE DIA_Necro_Thief (C_INFO)
{
	npc				= DMB_1703_NecroInWorld;
	nr				= 8;
	condition		= DIA_Necro_Thief_Condition;
	information		= DIA_Necro_Thief_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Necro_Thief_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lester_FightEnd))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Thief_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);

	AI_Output (self, other, "DIA_Necro_Thief_11_01"); //Zabi�e� Besti�! To ja j� przywo�a�em, by� moim chowa�cem!
	AI_Output (other, self, "DIA_Necro_Thief_15_02"); //Nie wiedzia�em, Mistrzu.
	AI_Output (self, other, "DIA_Necro_Thief_11_03"); //�mier� Bestii prawie rozerwa�a mi dusz�, ty pieprzony hipokryto! Do tego ukrad�e� almanach!
	AI_Output (self, other, "DIA_Necro_Thief_11_04"); //Beliar wybra� na swego pomaza�ca prawdziwego skurwiela. Ale to nie znaczy, �e nie os�dz� Ci� tu i teraz!
	Info_ClearChoices (DIA_Necro_Thief);
	Info_AddChoice (DIA_Necro_Thief, "Wszystko co zrobi�em, uczyni�em ku chwale Beliara!", DIA_Necro_Thief_Beliar);
	Info_AddChoice (DIA_Necro_Thief, "Za malutki jeste�, �eby stan�� mi na drodze.", DIA_Necro_Thief_Chelenge);
   
   Necro_teleport_after_deaths_beast = true;
};

// ---------------------------chg----------------------------------------

FUNC VOID DIA_Necro_Thief_Chelenge()
{
	AI_Output (other, self, "DIA_Necro_Thief_Chelenge_15_01"); //Za malutki jeste�, �eby stan�� mi na drodze.
	AI_Output (self, other, "DIA_Necro_Thief_Chelenge_11_02"); //�miesz rzuca� mi wyzwanie?!
	AI_Output (other, self, "DIA_Necro_Thief_Chelenge_15_03"); //To nie ja wyzywam Ciebie, ale Ty wyzywasz samego Beliara, porywaj�c si� na mnie.
	AI_Output (other, self, "DIA_Necro_Thief_Chelenge_15_04"); //Tw�j Pan wybra� mnie do realizacji swego dzie�a.
	AI_Output (self, other, "DIA_Necro_Thief_Chelenge_11_05"); //Obaj jeste�my tylko narz�dziami, g�upcze!
	AI_Output (other, self, "DIA_Necro_Thief_Chelenge_15_06"); //Ale to nie Tobie ocenia�, kt�ry z nas jest mniej przydatny. O�mielisz si� podwa�y� wol� Beliara?
	AI_Output (self, other, "DIA_Necro_Thief_Chelenge_11_07"); //Nie jestem samob�jc�. Zapami�tam jednak to, co tu us�ysza�em i kiedy nadejdzie Czas Zap�aty, gorzko tego po�a�ujesz.
	AI_Output (self, other, "DIA_Necro_Thief_Chelenge_11_08"); //Twoja dusza b�dzie si� wi� w mackach mojej mocy...
	AI_Output (other, self, "DIA_Necro_Thief_Chelenge_15_09"); //Wybacz, ale spiesz� si�... Mistrzu.
	AI_Output (self, other, "DIA_Necro_Thief_Chelenge_11_10"); //Tym razem pozwol� Ci odej��. Ale b�d� Ci� bacznie obserwowa�, mo�esz by� tego pewien. Ja nigdy nie zapominam potwarzy!

   Info_ClearChoices (DIA_Necro_Thief);
   
	Log_SetTopicStatus	(CH4_Nec_BM, LOG_SUCCESS);
   Log_SetTopicStatus	(CH4_Nec_Master, LOG_SUCCESS);
	B_LogEntry(CH4_Nec_BM, "Postawi�em si� nekromancie. Uwierzy� w bajeczk� o Pomaza�cu Beliara. Na razie mam z nim spok�j, ale jestem pewien, �e jeszcze si� spotkamy.");
	B_LogEntry(CH4_Nec_Master, "M�j mistrz uwa�a, �e jestem Wybra�cem Beliara. Na razie nie b�d� go wyprowadza� z b��du.");
   
   Npc_ExchangeRoutine(self, "HIDE");
};

// ---------------------------Blr----------------------------------------

FUNC VOID DIA_Necro_Thief_Beliar()
{
	AI_Output (other, self, "DIA_Necro_Thief_Beliar_15_01"); //Wszystko co zrobi�em, uczyni�em ku chwale Beliara!
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_02"); //Nie w�tpi�, to najlepsze wyt�umaczenie.
	AI_Output (other, self, "DIA_Necro_Thief_Beliar_15_03"); //Ale� mistrzu, nikt nie zdo�a�by pokona� Bestii, gdyby wola Beliara by�a inna!
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_04"); //Hmm... Pierwszy raz w Twych s�owach dostrzegam przeb�yski m�dro�ci...
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_05"); //Obaj jeste�my tylko narz�dziami. To nasz Pan decyduje o tym, jak wype�nimy nasze przeznaczenie.
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_06"); //Dobrze wi�c. Tym razem wybacz� Ci Twoje uczynki.
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_07"); //Ale b�d� pewien, �e gdy nadejdzie Czas Zap�aty, b�dziesz musia� dowie�� swojej warto�ci, albo zginiesz!
	AI_Output (other, self, "DIA_Necro_Thief_Beliar_15_08"); //Wszystko w r�kach Beliara, Mistrzu.
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_09"); //Odejd� wi�c i ciesz si� namiastk� �ycia, kt�ra jeszcze Ci pozosta�a.

   Info_ClearChoices (DIA_Necro_Thief);
   
	Log_SetTopicStatus	(CH4_Nec_BM, LOG_SUCCESS);
   Log_SetTopicStatus	(CH4_Nec_Master, LOG_SUCCESS);
	B_LogEntry(CH4_Nec_BM, "Przekona�em nekromant�. Uwierzy� w bajeczk� o Pomaza�cu Beliara. Na razie mam z nim spok�j, ale jestem pewien, �e jeszcze si� spotkamy.");
	B_LogEntry			(CH4_Nec_Master, "M�j mistrz uwa�a, �e jestem Wybra�cem Beliara. Na razie nie b�d� go wyprowadza� z b��du.");
   
   Npc_ExchangeRoutine(self, "HIDE");
};

// *************************************************

instance  Info_Nekroman_Ritual (C_INFO)
{
	npc			=	DMB_1701_NecroInNecroloc;
	nr			=	12;
	condition	=	Info_Nekroman_Ritual_Condition;
	information	=	Info_Nekroman_Ritual_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Mistrzu, mam do Ciebie pro�b�."; 
};                       

FUNC int  Info_Nekroman_Ritual_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Leren_Ritual))&&(!xardas_agree)&&(Npc_KnowsInfo(hero, DIA_Necro_Thief ))
	{
		return 1;
	};
};

FUNC VOID  Info_Nekroman_Ritual_Info()
{
	AI_Output(other, self, "Info_Nekroman_Ritual_15_00"); //Mistrzu, mam do Ciebie pro�b�.
	AI_Output(self, other,"Info_Nekroman_Ritual_14_01"); //B�agaj na kolanach, psie!
	AI_PlayAni		(other,	"T_PSI_VICTIM");
	AI_Output(self, other,"Info_Nekroman_Ritual_14_02"); //Tak znacznie lepiej. Czego chcesz?
	AI_Output(other, self, "Info_Nekroman_Ritual_15_03"); //Potrzebuj� Mistrzu Twej m�dro�ci i wiedzy.
	AI_Output(self, other,"Info_Nekroman_Ritual_14_04"); //Do czego?
	AI_Output(other, self, "Info_Nekroman_Ritual_15_05"); //Aby odprawi� rytua�... Chc� przywr�ci� mieczowi runicznemu dawn� moc.
	AI_Output(self, other,"Info_Nekroman_Ritual_14_06"); //Jak �miesz mnie o to prosi�?! Ten miecz do mnie nale�e� powinien!
	//AI_DrawWeapon (self);
	AI_Output(other, self, "Info_Nekroman_Ritual_15_07"); //Ale� Panie nie dla siebie pragn� tego ostrza. Wype�niam tylko wielki plan Beliara. 
	AI_Output(other, self, "Info_Nekroman_Ritual_15_08"); //To on rozkaza� mi zabi� Besti�, odnale�� kryszta�y, omami� mag�w, nam�wi� ich do pomocy i na�adowa� miecz.
	AI_Output(self, other,"Info_Nekroman_Ritual_14_09"); //Zbyt lekce sobie szafujesz imieniem naszego Pana. Dobrze, pomog� Ci w rytuale, ale pod jednym warunkiem.
	AI_Output(other, self, "Info_Nekroman_Ritual_15_10"); //Tak?
	//AI_RemoveWeapon (self);
	AI_Output(self, other,"Info_Nekroman_Ritual_14_11"); //Dusze pozosta�ych mag�w bior�cych udzia� w ceremoniale b�d� nale�e� do mnie! Wypij� krew z ich stygn�cych cia� i nasikam im do garde�!

	Info_ClearChoices (Info_Nekroman_Ritual);
	Info_AddChoice (Info_Nekroman_Ritual, "To za wysoka cena.", Info_Nekroman_Ritual_No);
	Info_AddChoice (Info_Nekroman_Ritual, "Ich �mier� zwie�czy nasze dzie�o!", Info_Nekroman_Ritual_Yes);
};

// ---------------------------No----------------------------------------

FUNC VOID Info_Nekroman_Ritual_No()
{
	AI_Output(other, self, "Info_Nekroman_Ritual_No_15_00"); //To za wysoka cena.
	AI_Output(self, other,"Info_Nekroman_Ritual_No_14_01"); //Wi�c po co zawracasz mi g�ow�, skoro zale�y Ci na �yciu tych miernot? Jeste� za mi�tki.
	AI_Output(self, other,"Info_Nekroman_Ritual_No_14_02"); //Jak Beliar m�g� wybra� kogo� takiego jak Ty! Zejd� mi z oczu.
	B_LogEntry(CH4_RBL_Rirual, "Nie zgodzi�em si� na �mier� mag�w uczestnicz�cych w rytuale. Nekromanta mi nie pomo�e.");
	B_StopProcessInfos(self);
};


// ---------------------------Yes----------------------------------------

FUNC VOID Info_Nekroman_Ritual_Yes()
{
	necromant_agree = TRUE;
	AI_Output(other, self, "Info_Nekroman_Ritual_Yes_15_00"); //Ich �mier� zwie�czy nasze dzie�o!
	AI_Output(self, other,"Info_Nekroman_Ritual_Yes_14_01"); //Beliar ucieszy si� z mojego daru.
	AI_Output(self, other,"Info_Nekroman_Ritual_Yes_14_02"); //Odejd� m�j uczniu, wr�� kiedy wszystko do przeprowadzenia rytua�u b�dzie ju� gotowe.

	B_LogEntry(CH4_RBL_Rirual, "Nekromanta zgodzi� si� uczestniczy� w rytuale. Jednak w zamian za��da� krwi pozosta�ych mag�w.");
	B_StopProcessInfos(self);
};


// *************************************************

instance  Info_Nekroman_RitualBegin (C_INFO)
{
	npc			=	DMB_1701_NecroInNecroloc;
	nr			=	13;
	condition	=	Info_Nekroman_RitualBegin_Condition;
	information	=	Info_Nekroman_RitualBegin_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Czas odprawi� rytua�."; 
};                       

FUNC int  Info_Nekroman_RitualBegin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Ritual))&&(necromant_agree == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Info_Nekroman_RitualBegin_Info()
{
	AI_Output(other, self, "Info_Nekroman_RitualBegin_15_00"); //Nadszed� czas, aby odprawi� rytua�.
	AI_Output(self, other,"Info_Nekroman_RitualBegin_14_01"); //Gdzie?
	AI_Output(other, self, "Info_Nekroman_RitualBegin_15_02"); //Tam gdzie wznosi si� kamienny kr�g na bagnach.
	AI_Output(self, other,"Info_Nekroman_RitualBegin_14_03"); //Niech b�dzie. A p�niej skosztuj� krwi tych durni�w!
	B_LogEntry(CH4_RBL_Rirual, "Nekromanta przyb�dzie do kamiennego kr�gu.");
	//Npc_ExchangeRoutine	(self, "RITUAL");
	B_StopProcessInfos	(self);
   
   Necro_teleport_on_ritual = true;
};

// *************************************************

instance  Info_Nekroman_RitualEnd (C_INFO)
{
	npc			=	DMB_1703_NecroInWorld;
	nr			=	14;
	condition	=	Info_Nekroman_RitualEnd_Condition;
	information	=	Info_Nekroman_RitualEnd_Info;
	permanent	=	0;
	important	=	1;	
	description		= "."; 
};                       

FUNC int  Info_Nekroman_RitualEnd_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Leren_RitualEnd))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID  Info_Nekroman_RitualEnd_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, hero);
	AI_Output (self, other,"Info_Nekroman_RitualEnd_14_01"); //Czuj� Zew Krwi. Za chwil�...
	AI_Output (other, self, "Info_Nekroman_RitualEnd_15_02"); //Wstrzymaj sw�j gniew Mistrzu! Ukaza� mi si� sam Beliar!
	AI_Output (self, other,"Info_Nekroman_RitualEnd_14_03"); //H�? Teraz?
	AI_Output (other, self, "Info_Nekroman_RitualEnd_15_04"); //Tak i nakaza�, �e ci magowie musz� �y�!
	AI_Output (self, other,"Info_Nekroman_RitualEnd_14_05"); //To jaka� bzdura!
	AI_Output (other, self, "Info_Nekroman_RitualEnd_15_06"); //W�tpisz w moje s�owa i wol� naszego Pana?
	AI_Output (self, other,"Info_Nekroman_RitualEnd_14_07"); //Niech to wszystko szlag trafi! Znowu nikogo nie zabij�!
	AI_Output (other, self, "Info_Nekroman_RitualEnd_15_08"); //Beliar chce jeszcze kiedy� wykorzysta� tych mag�w wi�c musz� �y�.
	AI_Output (self, other,"Info_Nekroman_RitualEnd_14_09"); //Krew mnie zalewa... Nic tu po mnie!
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self, "HIDE");

	/****************

Ork nekro ma si� teleportowa� do domciu
****************/
};

// *************************************************

instance  Info_Nekroman_Poison (C_INFO)
{
	npc			=	DMB_1701_NecroInNecroloc;
	nr			=	15;
	condition	=	Info_Nekroman_Poison_Condition;
	information	=	Info_Nekroman_Poison_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Przyby�em, by wype�ni� wol� Beliara."; 
};                       

FUNC int  Info_Nekroman_Poison_Condition()
{
	if (Npc_KnowsInfo(hero, STT_Balam_FeedDiego))
	{
		return 1;
	};
};

FUNC VOID  Info_Nekroman_Poison_Info()
{
	AI_Output (other, self, "Info_Nekroman_Poison_15_01"); //Przyby�em, by wype�ni� wol� Beliara.
	AI_Output (self, other,"Info_Nekroman_Poison_14_02"); //Jak� wol�?
	AI_Output (other, self, "Info_Nekroman_Poison_15_03"); //Nasz Pan wyznaczy� mi zadanie niezwyk�ej wagi. Musz� otru� pewnego wyznawc� Innosa.
	AI_Output (other, self, "Info_Nekroman_Poison_15_04"); //Przyby�em do Ciebie Mistrzu, po trucizn�. 
	AI_Output (self, other,"Info_Nekroman_Poison_14_05"); //M�drze post�pi�e�. We� trupi jad, zabija d�ugo i bole�nie...
	AI_Output (other, self, "Info_Nekroman_Poison_15_06"); //To musi wygl�da� na zawa� serca. Trucizna powinna zadzia�a� b�yskawicznie.
	AI_Output (self, other,"Info_Nekroman_Poison_14_07"); //Hmm. We� wi�c czarn� wdow�. Dzia�a szybko i bezbole�nie. Natychmiast parali�uje uk�ad nerwowy, a serce pi�knie eksploduje.
	CreateInvItems (self,ItFo_Potion_Poison,1);
	B_GiveInvItems (self, other, ItFo_Potion_Poison, 1);
	AI_Output (other, self, "Info_Nekroman_Poison_15_08"); //Ta b�dzie doskona�a, Mistrzu.
	AI_Output (self, other,"Info_Nekroman_Poison_14_09"); //Wype�nij wi�c wol� Beliara. A wkr�tce i ja b�d� mia� dla Ciebie co� ciekawego...
	B_LogEntry(CH6_RBL_Diego, "Zdoby�em trucizn� dla Balama.");
};
