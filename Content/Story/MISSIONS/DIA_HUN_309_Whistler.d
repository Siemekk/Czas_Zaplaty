// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_309_Whistler_Exit (C_INFO)
{
	npc			= HUN_309_Whistler;
	nr			= 999;
	condition	= DIA_HUN_309_Whistler_Exit_Condition;
	information	= DIA_HUN_309_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_309_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_309_Whistler_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_HUN_309_Whistler_Hello (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 1;
	condition		= DIA_HUN_309_Whistler_Hello_Condition;
	information		= DIA_HUN_309_Whistler_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_HUN_309_Whistler_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_309_Whistler_Hello_Info()
{
	AI_Output (other, self, "DIA_HUN_309_Whistler_Hello_15_01"); //Witaj.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Hello_11_02"); //O, nowa twarz. Witam w obozie tych, no... rebeliant�w.
};

// **************************************************

INSTANCE DIA_HUN_309_Whistler_Ask (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 2;
	condition		= DIA_HUN_309_Whistler_Ask_Condition;
	information		= DIA_HUN_309_Whistler_Ask_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co my�lisz o rebeliantach?"; 
};

FUNC INT DIA_HUN_309_Whistler_Ask_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_309_Whistler_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_309_Whistler_Ask_Info()
{
	whistler_list = FALSE;
   
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_01"); //Co my�lisz o rebeliantach?
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_02"); //A co mam my�le�? Jak ka�dy w tej cholernej Kolonii chc� prze�y�.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_03"); //Od reszty r�nimy si� tylko tym, �e mniej lub bardziej nie odpowiada nam 'klimat' panuj�cy w pozosta�ych obozach.
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_04"); //Czyli do��czenie do was to dobry wyb�r?
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_05"); //Tak samo dobry jak przy��czenie si� do Gomeza, palenie trawki u sekciarzy, czy w�a�enie w dup� magom wody.
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_06"); //Nie ma innej alternatywy?
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_07"); //Ale� jest. Mo�e jaki� ork pomyli Ci� z samic� w czasie rui, he, he.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_08"); //Podstawowa zasada jest taka - w kupie si�a. Dlatego te� powsta�y obozy.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_09"); //W pojedynk� nikt nie prze�yje w Kolonii zbyt d�ugo.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_10"); //Rozumiem, �e z jakiego� powodu wybra�e� akurat ten ob�z?
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_11"); //Ogl�dnie m�wi�c, tak.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_12"); //Co� Ci� nie kojarz�. Musia�e� niedawno trafi� do Kolonii. Zreszt� niewa�ne...
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_13"); //Skoro chcesz sta� si� jednym z nas, musisz udowodni� lojalno�� i przydatno�� oczywi�cie.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_14"); //Dla mnie s�owo przydatno�� oznacza kogo�, kto pomo�e mi co� zdoby�.
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_15"); //Zamieniam si� w s�uch.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_16"); //Bo widzisz. Kolekcjonuj� miecze.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_17"); //Ale nie wszystkie. Jestem jak to m�wi� magowie - estet�. Lubi� dobr� robot� po��czon� ze sztuk�.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_18"); //Zdoby�em recept� na wspania�y miecz - pawie pi�ro. Nie mam jednak sk�adnik�w potrzebnych do wykucia broni.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_19"); //Przez te cholerne obowi�zki i niebezpiecze�stwo ataku ze strony Gomeza jestem tu udupiony.
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_20"); //Niech zgadn�. Szukasz frajera, kt�ry przyniesie Ci potrzebne sk�adniki.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_21"); //Domy�lny jeste�. To jak b�dzie?
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_22"); //Raczej nie mam wyboru. Co to za sk�adniki?
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_23"); //Tu masz list� i 200 bry�ek rudy na wydatki.
	
   CreateInvItems (self,whistlerlist,1);//lista
	B_GiveInvItems (self, other, whistlerlist, 1);
	CreateInvItems (self,ItMiNugget,200);//ruda
	B_GiveInvItems (self, other, ItMiNugget, 200);
   
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_24"); //Wr�� tak szybko, jak tylko si� da. Nie mog� si� ju� doczeka� tego miecza...
	
   Log_CreateTopic(CH1_Rbl_Sword, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Sword, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Sword, "�wistak wstawi si� za mn�, jak zdob�d� wszystkie sk�adniki niezb�dne do wykucia miecza zwanego pawim pi�rem. Da� mi list� sk�adnik�w i 200 bry�ek na wydatki.");
};

// **************************************************
var int whistler_approve;

INSTANCE DIA_HUN_309_Whistler_List (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 3;
	condition		= DIA_HUN_309_Whistler_List_Condition;
	information		= DIA_HUN_309_Whistler_List_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam pytanie co do listy."; 
};

FUNC INT DIA_HUN_309_Whistler_List_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_309_Whistler_Ask))&&(whistler_list == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_309_Whistler_List_Info()
{
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_15_01"); //Mam pytanie co do listy.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_02"); //A Ty jeszcze tu jeste�? Nie potrafisz czyta�?
	AI_TurnAway(other, self);
	B_UseFakeScroll(other);
   AI_WhirlAround(other, self);
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_15_03"); //Nie mam problem�w z odczytaniem listy, tylko zastanawiam si� po co Ci ser i w�dka do wykucia miecza?
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_04"); //A co Ci� to obchodzi?
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_15_05"); //Obchodzi, skoro mam biega� za tym po ca�ej Kolonii.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_06"); //To pos�uchaj. Ty chcesz do��czy� do rebeliant�w.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_07"); //Ja chc� wyku� wspania�y miecz i przy okazji nape�ni� brzuch bez ruszania si� z miejsca.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_08"); //Czy wyrazi�em si� wystarczaj�co jasno?
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_15_09"); //A� za.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_10"); //To jak b�dzie? Poszukasz sk�adnik�w, czy tylko tracisz m�j czas?

	Info_ClearChoices (DIA_HUN_309_Whistler_List);
	Info_AddChoice (DIA_HUN_309_Whistler_List, "W porz�dku, poszukam sk�adnik�w.", DIA_HUN_309_Whistler_List_Yes);
	Info_AddChoice (DIA_HUN_309_Whistler_List, "Nie jestem idiot�, poszukaj innego frajera.", DIA_HUN_309_Whistler_List_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_HUN_309_Whistler_List_Yes()
{
	whistler_approve = TRUE;
   
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_Yes_15_01"); //W porz�dku, poszukam sk�adnik�w.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_Yes_07_02"); //To co tu jeszcze robisz?
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_Yes_07_03"); //Tylko, �eby �arcie by�o �wie�e!
	
   B_LogEntry(CH1_Rbl_Sword, "Zgodzi�em si� na przyniesienie WSZYSTKICH sk�adnik�w z listy. Odnosz� dziwne wra�enie, �e �wistak wykorzystuje sytuacj�, ale robi� to ostatni raz!");
	B_StopProcessInfos(self); 
};

// ------------------No----------------

FUNC VOID DIA_HUN_309_Whistler_List_No()
{
	whistler_approve = FALSE;
   
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_No_15_01"); //Nie jestem idiot�, poszukaj innego frajera.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_07_02"); //Niech Ci� szlag trafi! Wyno� si� p�kim dobry.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_07_03"); //Mo�esz by� pewien, �e Cavalorn nie us�yszy ode mnie dobrego s�owa na Tw�j temat...
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_07_04"); //A teraz oddaj moj� rud�!
	
	Info_ClearChoices (DIA_HUN_309_Whistler_List);
	Info_AddChoice (DIA_HUN_309_Whistler_List, "Nie mam �adnej rudy.", DIA_HUN_309_Whistler_List_No_NoOre);
	
   if(Npc_HasItems(other,itminugget)>=200)
	{
		Info_AddChoice (DIA_HUN_309_Whistler_List, "Bierz te swoje bry�ki.", DIA_HUN_309_Whistler_List_No_GiveBackOre);
	};

	B_LogSetTopicStatus(CH1_Rbl_Sword, LOG_FAILED);
	B_LogEntry(CH1_Rbl_Sword, "Nie mam zamiaru robi� za ch�opca na posy�ki. Niech �wistak sam sobie poszuka idioty, kt�ry spe�ni jego kulinarne zachcianki.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "No nic, �wistak raczej mnie nie poprze.");
	B_StopProcessInfos(self); 
};

func void DIA_HUN_309_Whistler_List_No_GiveBackOre()
{
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_No_GiveBackOre_15_01"); //Bierz te swoje bry�ki.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_GiveBackOre_07_02"); //Twoje szcz�cie.
	B_GiveInvItems (other, self, ItMiNugget, 200);
};

func void DIA_HUN_309_Whistler_List_No_NoOre()
{
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_No_NoOre_15_01"); //Nie mam tej rudy.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_NoOre_07_02"); //Jak to nie masz?!
	AI_GotoNpc(self,other);
	AI_PlayAni(self,"T_PLUNDER");
   
	if(Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_NoOre_07_03"); //Cholerny k�amca! Upuszcz� Ci za to krwi...
		B_GiveInvItems (other, self, ItMiNugget, 200);
	}
	else
	{
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_NoOre_07_04"); //Ty cholerny z�odzieju. Upuszcz� Ci za to krwi...
	};
	
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);		
};			
// **************************************************

var int whistler_compleated;

INSTANCE DIA_HUN_309_Whistler_List_All (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 5;
	condition		= DIA_HUN_309_Whistler_List_All_Condition;
	information		= DIA_HUN_309_Whistler_List_All_Info;
	permanent		= 1;
	important		= 0;
	description		= "Znalaz�em wszystkie sk�adniki!"; 
};

FUNC INT DIA_HUN_309_Whistler_List_All_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_309_Whistler_List))&&(whistler_approve == TRUE)&&(whistler_compleated == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_309_Whistler_List_All_Info()
{
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_All_15_01"); //Znalaz�em wszystkie sk�adniki z listy!
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_02"); //Czy aby na pewno?
	
   if ((NPC_HasItems(other,ItMa_Iron)>=2)&&(NPC_HasItems(other,ItMa_Steel)>=1)&&(NPC_HasItems(other,ItMa_carbon)>=2)&&(NPC_HasItems(other,ItMa_Goodlumber)>=1)&&(NPC_HasItems(other,ItFoBeer)>=6)&&(NPC_HasItems(other,ItFo_Addon_Grog)>=2)&&(NPC_HasItems(other,ItFoCheese)>=2)&&(NPC_HasItems(other,ItFoMutton)>=6))
	{
		whistler_compleated = TRUE;
		B_GiveXP(500);
      
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_03"); //Rzeczywi�cie, �wietna robota. 
		
      B_GiveInvItems (other, self, ItMa_Iron, 2);
		B_GiveInvItems (other, self, ItMa_Steel, 1);
		B_GiveInvItems (other, self, ItMa_carbon, 2);
		B_GiveInvItems (other, self, ItMa_Goodlumber, 1);
		B_GiveInvItems (other, self, ItFoBeer, 6);
		B_GiveInvItems (other, self, ItFo_Addon_Grog, 2);
		B_GiveInvItems (other, self, ItFoCheese, 2);
		B_GiveInvItems (other, self, ItFoMutton, 6);
		
      AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_04"); //Musz� najpierw sprawdzi� 'jako��' sk�adnik�w...
		
      if (C_BodystateContains(self, BS_SIT))
		{
			AI_StandUp (self);
			AI_TurnToNpc (self, other);
		};
      
		CreateInvItem (self,ItFobeer); 
		
		AI_UseItem (self,ItFobeer); 
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_05"); //Wyborne piwo, zdaje si�, �e korzenne, wyczuwam delikatny posmak moczu cieniostwora!
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_06"); //A wracaj�c do pawiego pi�ra...
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_07"); //Widzisz mam ju� wszystko, pr�cz umiej�tno�ci wytworzenia tego wspania�ego ostrza.
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_08"); //Poczekaj chwil�. Zapakuj� sk�adniki do worka...
		
      B_LogEntry(CH1_Rbl_Sword, "Dostarczy�em �wistakowi wszystkie sk�adniki. Najpierw wypi� piwo, a p�niej powiedzia�, �e i tak nie da rady zrobi� z nich miecza!");

		AI_PlayAni(self, "T_PLUNDER");
		AI_TurnToNpc (self, other); 	
		AI_SetWalkmode (self,NPC_RUN); 	
		AI_GotoNpc (self, other);
	}
	else
	{	
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_09"); //Nie wydaje mi si�. Szukaj dalej... pieseczku.
	};
   
	B_StopProcessInfos(self);
};

INSTANCE DIA_HUN_309_Whistler_GoBring (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 5;
	condition		= DIA_HUN_309_Whistler_GoBring_Condition;
	information		= DIA_HUN_309_Whistler_GoBring_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_HUN_309_Whistler_GoBring_Condition()
{
	if (Npc_RefuseTalk(self)==FALSE) && (whistler_compleated == TRUE)  && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_309_Whistler_GoBring_Info()
{
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_11_01"); //Prosz�, oto pakunek ze wszystkimi sk�adnikami potrzebnymi do wykucia pawiego pi�ra.
	
   CreateInvItems (self,whistler_pack,1);//paczka z cz�ciami
	B_GiveInvItems (self, other, whistler_pack, 1);

	AI_Output (other, self, "DIA_HUN_309_Whistler_GoBring_15_02"); //I co ja niby mam z tym zrobi� do cholery?!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_11_03"); //Jak to co? Znale�� kowala, kt�ry wykuje miecz moich marze�!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_11_04"); //U�atwi� Ci zadanie. Porozmawiaj z Aidanem, on zna moje potrzeby i wie jak wyku� dobre ostrze.
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_11_05"); //To jak b�dzie?

	Info_ClearChoices (DIA_HUN_309_Whistler_GoBring);
	Info_AddChoice (DIA_HUN_309_Whistler_GoBring, "Ale to ju� ostatni raz!", DIA_HUN_309_Whistler_GoBring_Yes);
	Info_AddChoice (DIA_HUN_309_Whistler_GoBring, "Mam tego do��!", DIA_HUN_309_Whistler_GoBring_No);
	
   Npc_ExchangeRoutine(self,"OR");
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_HUN_309_Whistler_GoBring_Yes()
{
	whistler_last_approve = TRUE;
   
	AI_Output (other, self, "DIA_HUN_309_Whistler_GoBring_Yes_15_01"); //Ale to ju� ostatni raz!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_Yes_07_02"); //Podj��e� s�uszn� decyzj�. Sztuka zakl�ta w ch�odnym ostrzu unu�anym we krwi... Czuj� dreszcz podniecenia!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_Yes_07_03"); //A teraz id� ju� po m�j �liczny miecz!
	
   B_LogEntry(CH1_Rbl_Sword, "Znowu robi� za pos�a�ca. Tym razem musz� zanie�� sk�adniki niezb�dne do wykucia miecza Aidanowi. Mam nadziej�, �e �wistak ju� nic wi�cej nie wymy�li.");
	B_StopProcessInfos(self); 
};

// ------------------No----------------

FUNC VOID DIA_HUN_309_Whistler_GoBring_No()
{
	whistler_approve = FALSE;
   
	B_GiveInvItems (other, self, whistler_pack, 1);
	Npc_RemoveInvItems(self,whistler_pack,1);
	
   AI_Output (other, self, "DIA_HUN_309_Whistler_GoBring_No_15_01"); //Mam tego do��!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_No_07_02"); //Nie mo�esz teraz tak mnie zostawi�?! Musisz mi pom�c!
	AI_Output (other, self, "DIA_HUN_309_Whistler_GoBring_No_15_03"); //Nic nie musz�! Rad� sobie sam. A jak masz z tym problem, to mo�emy inaczej porozmawia�!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_No_07_04"); //Nie, nie! Spokojnie. No nic, w takim razie p�jd� do Aidana sam...
	
   Log_SetTopicStatus(CH1_Rbl_Sword, LOG_FAILED);
	whistler_trust = 2;//W sumie to jednak co� by sie za to przyda�o
	B_LogEntry(CH1_Rbl_Sword, "Dotrzyma�em s�owa - nie b�d� po raz kolejny robi� za ch�opca na posy�ki! Mam tylko nadziej�, �e Cavalorn nie we�mie mi tego za z�e.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "Nie b�d� robi� u �wistaka za pos�a�ca. Mam nadziej�, �e Cavalorn nie b�dzie mia� mi tego za z�e.");
	B_StopProcessInfos(self); 
};

INSTANCE DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 6;
	condition		= DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_Condition;
	information		= DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam miecz."; 
};

FUNC INT DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_SwordOk))&&(NPC_HasItems(other,whistler_toy)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_Info()
{
	whistler_trust = TRUE;
	B_GiveXP(500);
	rebel_camp_trust = rebel_camp_trust + 1; 
   
	AI_Output (other, self, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_15_01"); //Mam miecz.
	AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_02"); //To �wietnie, poka� mi to cude�ko!
	
   B_GiveInvItems (other, self, whistler_toy, 1);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self, "T_1HSINSPECT");
	AI_RemoveWeapon(self);
	
   AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_03"); //Wspania�y. Ach, ta delikatna linia, subtelny sztych i kr�g�y jelec...
	AI_Output (other, self, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_15_04"); //Mo�e id� z nim do ��ka...
	AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_05"); //A my�la�e�, �e gdzie go schowam w nocy? Wszystkie moje �licznotki trzymam pod bar�ogiem.
	AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_06"); //Dotyk stali koi mnie i sprawia, �e...
	AI_Output (other, self, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_15_07"); //Nie chc� zna� szczeg��w. Wystarczy, �e poprzesz mnie przed Cavalornem.
	AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_08"); //Masz to za�atwione jak w myrta�skim banku, przyjacielu.
	AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_09"); //Co za cude�ko... Je�eli pozwolisz, chcia�bym teraz zosta� sam z tym dzie�em sztuki.
	AI_Output (other, self, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_15_10"); //Oczywi�cie, nie b�d� przeszkadza� w schadzce.
	
   Log_SetTopicStatus(CH1_Rbl_Sword, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Sword, "�wistak na widok nowej b�yskotki ma�o nie dosta� wzwodu. Najwa�niejsze jednak, �e wstawi si� za mn� u Cavalorna.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "Mam g�os �wistaka - kosztowa�o mnie to sporo biegania, ale takie �ycie.");
};

INSTANCE DIA_Whistler_Attack (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 11;
	condition		= DIA_Whistler_Attack_Condition;
	information		= DIA_Whistler_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Whistler_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Attack_Info()
{
	AI_Output (self, other, "DIA_Whistler_Attack_11_01"); //Zaczekaj ch�optasiu. To Ty naplu�e� Cavalornowi w twarz.
	AI_Output (self, other, "DIA_Whistler_Attack_11_02"); //To by� spory b��d...
	
   B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Whistler_Stew (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 12;
	condition		= DIA_Whistler_Stew_Condition;
	information		= DIA_Whistler_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "�wie�utki gulasz!"; 
};

FUNC INT DIA_Whistler_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_Whistler_Stew_15_01"); //�wie�utki gulasz!
	AI_Output (self, other, "DIA_Whistler_Stew_11_02"); //Z ch�ci� zjem co� gor�cego.
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	AI_Output (other, self, "DIA_Whistler_Stew_15_03"); //Tak, nie musisz dzi�kowa�...
	
   B_LogEntry(CH2_Rbl_Food, "�wistak z ch�ci� zje co� gor�cego."); 
};

INSTANCE DIA_Whistler_Spy (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 13;
	condition		= DIA_Whistler_Spy_Condition;
	information		= DIA_Whistler_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak tu trafi�e�?"; 
};

FUNC INT DIA_Whistler_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Spy_Info()
{
	spy_count = spy_count + 1;
	AI_Output (other, self, "DIA_Whistler_Spy_15_01"); //Jak tu trafi�e�?
	AI_Output (self, other, "DIA_Whistler_Spy_11_02"); //Niewa�ne. Powiedzmy, �e wszed�em w pewien uk�ad, za kt�ry teraz p�ac�.
   
	B_LogEntry(CH2_Rbl_Spy, "�wistak nie by� zbyt rozmowny. Powiedzia� tylko, �e wszed� z kim� w jaki� uk�ad, za kt�ry teraz p�aci.");

	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od Ciebie chcia�.
		B_LogEntry(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_Whistler_Spy1 (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 14;
	condition		= DIA_Whistler_Spy1_Condition;
	information		= DIA_Whistler_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wiem, czym si� naprawd� zajmujesz."; 
};

FUNC INT DIA_Whistler_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Spy1_Info()
{
	AI_Output (other, self, "DIA_Whistler_Spy1_15_01"); //Wiem, czym si� naprawd� zajmujesz.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_02"); //Doprawdy?
	AI_Output (other, self, "DIA_Whistler_Spy1_15_03"); //Twoje oczy i uszy pozosta�y w Starym Obozie...
	AI_Output (self, other, "DIA_Whistler_Spy1_11_04"); //Pssttt!
	
   AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	
   AI_Output (self, other, "DIA_Whistler_Spy1_11_05"); //Chcesz, �eby kto� nas us�ysza�?!
	AI_Output (other, self, "DIA_Whistler_Spy1_15_06"); //Wprost przeciwnie. Szukam pewnej analogii.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_07"); //M�w o co chodzi, tylko si� po�piesz.
	AI_Output (other, self, "DIA_Whistler_Spy1_15_08"); //Szukam dowod�w zdrady w tym obozie, �wistak. Wiesz co� o tym?
	AI_Output (self, other, "DIA_Whistler_Spy1_11_09"); //Nie zadawaj g�upich pyta�. Przecie� to oczywiste.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_10"); //Wiem, �e Gomez podrzuci� nam �mierdz�ce jajo, ale mam tylko podejrzenia.
	AI_Output (other, self, "DIA_Whistler_Spy1_15_11"); //Z przyjemno�ci� ich wys�ucham.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_12"); //Mam trzech kandydat�w na zdrajc�: Aidana, R�czk� i Toniego.
	AI_Output (other, self, "DIA_Whistler_Spy1_15_13"); //Dlaczego akurat oni?
	AI_Output (self, other, "DIA_Whistler_Spy1_11_14"); //Aidan do�� cz�sto znika wieczorami. Nikt nie wie, gdzie chadza i po co. 
	AI_Output (self, other, "DIA_Whistler_Spy1_11_15"); //Co do R�czki, to jego t�umaczenie, �e podpad� Gomezowi, bo popar� jakiego� skaza�ca troch� mi �mierdzi.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_16"); //Znowu Tony jest tu najkr�cej i najmniej go znam. Do tego nied�ugo po tym jak go przygarn�li�my, pojawi�y si� przecieki.
	AI_Output (other, self, "DIA_Whistler_Spy1_15_17"); //Rozumiem. Dobry z Ciebie obserwator.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_18"); //Mam u�atwione zadanie, bo wszyscy uwa�aj� mnie za �wira, dla kt�rego licz� si� tylko �wiecide�ka.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_19"); //Pozory potrafi� zmyli� ka�dego, piracie.
	AI_Output (other, self, "DIA_Whistler_Spy1_15_20"); //Zapami�tam i przemy�l� to, co powiedzia�e�.
	
   tony_spy = tony_spy + 1;
	B_LogEntry(CH2_Rbl_Spy, "�wistak podejrzewa o zdrad� Aidana, R�czk� lub Toniego. Wed�ug niego Aidan znika na ca�e noce, R�czka kr�ci, dlaczego musia� ucieka� ze Starego Obozu, a Toniemu po prostu nie ufa, bo jest tu najkr�cej - do tego to po jego pojawieniu si� w obozie, rozpocz�y si� przecieki.");

	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta�, nie daj mu czeka�.
		B_LogEntry(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_Whistler_Sack (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 15;
	condition		= DIA_Whistler_Sack_Condition;
	information		= DIA_Whistler_Sack_Info;
	permanent		= 0;
	important		= 0;
	description		= "To twoja zguba?"; 
};

FUNC INT DIA_Whistler_Sack_Condition()
{
	if (NPC_HasItems(other,poor_sack)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Sack_Info()
{
	AI_Output (other, self, "DIA_Whistler_Sack_15_01"); //To twoja zguba?
	
   B_GiveInvItems (other, self, poor_sack, 1);
	Npc_RemoveInvItems(self,poor_sack,1);
	
   AI_Output (self, other, "DIA_Whistler_Sack_11_02"); //Sk�d to masz?!
	AI_Output (other, self, "DIA_Whistler_Sack_15_03"); //Znalaz�em przy Kuflu, kiedy spu�ci�em mu �omot.
	AI_Output (self, other, "DIA_Whistler_Sack_11_04"); //Sakiewk� skradziono mi kilka dni temu. Od razu spisa�em j� na straty.
	AI_Output (self, other, "DIA_Whistler_Sack_11_05"); //To dziwne, ale nikomu nie m�wi�em o zgubie...
	AI_Output (other, self, "DIA_Whistler_Sack_15_06"); //Mam nosa do takich spraw.
	AI_Output (self, other, "DIA_Whistler_Sack_11_07"); //Hmm, rozumiem. Jaki� dziwny jeste�, �e mi j� oddajesz. 
	AI_Output (self, other, "DIA_Whistler_Sack_11_08"); //W ka�dym razie dzi�ki za zwr�cenie sakiewki i jej zawarto�ci.
	
   B_LogEntry(CH2_RBL_Tritetra, "Odda�em sakiewk� �wistakowi");
	
	//I dunno if its proper value...
	B_GiveXP(500);
};

// **************************************************

INSTANCE DIA_Whistler_NewBow (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 16;
	condition		= DIA_Whistler_NewBow_Condition;
	information		= DIA_Whistler_NewBow_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno potrzebujesz pilnej pomocy."; 
};

FUNC INT DIA_Whistler_NewBow_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_MEETING))&& (ratford_help == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_NewBow_Info()
{
	AI_Output (other, self, "DIA_Whistler_NewBow_15_01"); //Podobno potrzebujesz pilnej pomocy.
	AI_Output (self, other, "DIA_Whistler_NewBow_11_02"); //O, to Ty! Wiedzia�em, �e Ratford przy�le kogo� kompetentnego.
	AI_Output (other, self, "DIA_Whistler_NewBow_15_03"); //Co si� sta�o?
	AI_Output (self, other, "DIA_Whistler_NewBow_11_04"); //Sta�o si� co� strasznego... Moje �ycie przesta�o l�ni� barwami szcz�cia...
	AI_Output (other, self, "DIA_Whistler_NewBow_15_05"); //Co to za tragedia?!
	AI_Output (self, other, "DIA_Whistler_NewBow_11_06"); //M�j �uk... Jest stary i szary, ca�y porysowany. Nie mog� ju� si� z nim nigdzie pokaza�!
	AI_Output (other, self, "DIA_Whistler_NewBow_15_07"); //Na w�osy na dupsku Beliara i to jest ten problem?!
	AI_Output (self, other, "DIA_Whistler_NewBow_11_08"); //Problem? To koszmar, tragedia, kataklizm...
	AI_Output (other, self, "DIA_Whistler_NewBow_15_09"); //Dobra, ju� dobra. M�w, co mam zrobi� i miejmy t� fars� za sob�.
	AI_Output (self, other, "DIA_Whistler_NewBow_11_10"); //Wiem, kto ma �uk moich marze�!
	AI_Output (self, other, "DIA_Whistler_NewBow_11_11"); //To stra�nik, nazywa si� Paul, prawie ca�y dzie� patroluje Koloni�. Problem w tym, �e nie wiadomo, gdzie si� pojawi.
	AI_Output (self, other, "DIA_Whistler_NewBow_11_12"); //Znajd� tego gnojka i odbierz mu m�j �liczny perlisty podmuch.
	AI_Output (other, self, "DIA_Whistler_NewBow_15_13"); //Perlisty podmuch?
	AI_Output (self, other, "DIA_Whistler_NewBow_11_14"); //Tak nazywa si� to arcydzie�o, prawda, �e romantycznie? Tylko go nie zarysuj!

	Log_CreateTopic(CH3_RBL_PerlBlow, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_PerlBlow, LOG_RUNNING);
	B_LogEntry(CH3_RBL_PerlBlow, "�wistak stwierdzi�, �e jego stary �uk jest ju� niegodzien, aby z nim paradowa�. Musz� znale�� mu �liczny, nowy �uczek, kt�ry podobno ma stra�nik o m�skim imieniu Paul, patroluj�cy teren ca�ej kolonii. Co za farsa!");

	/************ TODO:
	Ork daj temu Paulowi zmienn� rutyn�, czyli �e co 3 dzie� b�dzie si� pojawia� przed wej�ciem na bagna, to troch� doda realizmu i pownerwia graczy ;)
	Daj mu tez w inventory ten �uk BlowPerl
	************/
	WLD_InsertNpc(GRD_4069_Paul,"OC1");
	WLD_InsertNpc(Grd_4129_PaulPatrol,"OC1");
	WLD_InsertNpc(Grd_4130_PaulPatrol,"OC1");
};

// **************************************************

INSTANCE DIA_Whistler_NewBowBack (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 17;
	condition		= DIA_Whistler_NewBowBack_Condition;
	information		= DIA_Whistler_NewBowBack_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam twoje �wiecide�ko."; 
};

FUNC INT DIA_Whistler_NewBowBack_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_NewBow))&&(NPC_HasItems(other,BlowPerl)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_NewBowBack_Info()
{
	others_help = others_help + 1;
	B_GiveXP(500);
	
   AI_Output (other, self, "DIA_Whistler_NewBowBack_15_01"); //Mam twoje �wiecide�ko.
	AI_Output (self, other, "DIA_Whistler_NewBowBack_11_02"); //Cudownie! Oddaj mi ten skarb!
	
   B_GiveInvItems (other, self, BlowPerl, 1);
   Npc_RemoveInvItems(self, BlowPerl, 1);
	
   AI_Output (self, other, "DIA_Whistler_NewBowBack_11_03"); //Pi�kny! L�ni niczym...
	AI_Output (other, self, "DIA_Whistler_NewBowBack_15_04"); //Jaja cieniostwora po deszczu!
	
   Log_SetTopicStatus(CH3_RBL_PerlBlow, LOG_SUCCESS);
	B_LogEntry(CH3_RBL_PerlBlow, "Odnios�em �wistakowi jego cacuszko. Co ja robi�?!");
};

/****************************

SIDE QUESTS

******************************/

// **************************************************

INSTANCE DIA_Whistler_Cristal (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 20;
	condition		= DIA_Whistler_Cristal_Condition;
	information		= DIA_Whistler_Cristal_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co� marnie wygl�dasz..."; 
};

FUNC INT DIA_Whistler_Cristal_Condition()
{
	if (Kapitel>=2)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Cristal_Info()
{
	AI_Output (other, self, "DIA_Whistler_Cristal_15_01"); //Co� marnie wygl�dasz...
	AI_Output (self, other, "DIA_Whistler_Cristal_11_02"); //Bo marnie si� czuj�!
	AI_Output (other, self, "DIA_Whistler_Cristal_15_03"); //M�w co Ci� gn�bi. Jakie� �wiecide�ko si� popsu�o?
	AI_Output (self, other, "DIA_Whistler_Cristal_11_04"); //Nie �artuj z moich... cacuszek! Ale masz racj�...
	AI_Output (self, other, "DIA_Whistler_Cristal_11_05"); //Niedawno kupi�em wspania�y �uk, nie mog� go jednak wypr�bowa�!
	AI_Output (other, self, "DIA_Whistler_Cristal_15_06"); //Dlaczego?
	AI_Output (self, other, "DIA_Whistler_Cristal_11_07"); //Nie mam odpowiedniej amunicji. Ten �uk miota tylko strza�y �ywio��w.
	AI_Output (other, self, "DIA_Whistler_Cristal_15_08"); //�e co?
	AI_Output (self, other, "DIA_Whistler_Cristal_11_09"); //Gdzie� Ty si� chowa�? Ogniste strza�y, lodowe i burzowe, czy jak tam one si� nazywaj�.
	AI_Output (other, self, "DIA_Whistler_Cristal_15_10"); //To dokup odpowiedni� amunicj� i po krzyku.
	AI_Output (self, other, "DIA_Whistler_Cristal_11_11"); //Gdyby to by�o takie proste...
	AI_Output (self, other, "DIA_Whistler_Cristal_11_12"); //Groty do tych strza� musz� zosta� wykonane ze specjalnego metalu, kt�ry mo�na znale�� tylko w meteorytach...
	AI_Output (self, other, "DIA_Whistler_Cristal_11_13"); //Ostatnio nawet jeden przebi� barier� i spad� gdzie� w Kolonii. Podobno Leaf widzia� ten kryszta�...
	AI_Output (other, self, "DIA_Whistler_Cristal_15_14"); //Nie patrz tak na mnie!
	AI_Output (self, other, "DIA_Whistler_Cristal_11_15"); //B�agam! Nie po�a�ujesz! Zap�ac� Ci rud� i dorzuc� co� ekstra.
	AI_Output (other, self, "DIA_Whistler_Cristal_15_16"); //Sam nie wiem... Musz� si� zastanowi�.
};

// **************************************************

INSTANCE DIA_Whistler_CristalOk (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 21;
	condition		= DIA_Whistler_CristalOk_Condition;
	information		= DIA_Whistler_CristalOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, poszukam tego kryszta�u."; 
};

FUNC INT DIA_Whistler_CristalOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_Cristal))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_CristalOk_Info()
{
	AI_Output (other, self, "DIA_Whistler_CristalOk_15_01"); //Dobra, poszukam tego kryszta�u.
	AI_Output (self, other, "DIA_Whistler_CristalOk_11_02"); //To cudownie! Porozmawiaj z Leafem, on wie, gdzie odnale�� kryszta�.
	AI_Output (self, other, "DIA_Whistler_CristalOk_11_03"); //Prosz�, po�piesz si�, chcia�bym, jak najszybciej wypr�bowa� to cude�ko!

	Log_CreateTopic(CH1_RBL_ArrowCristal, LOG_MISSION);
	Log_SetTopicStatus(CH1_RBL_ArrowCristal, LOG_RUNNING);
	B_LogEntry(CH1_RBL_ArrowCristal, "�wistak kupi� �uk miotaj�cy strza�ami �ywio��w. Nie ma jednak odpowiedniej amunicji. Podobno groty do takich strza� mo�na odla� tylko z metalu znajduj�cego si� w meteorytach. Mam porozmawia� z Leafem, on gdzie� widzia� taki kryszta�.");
};

// **************************************************

INSTANCE DIA_Whistler_Leaf (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 22;
	condition		= DIA_Whistler_Leaf_Condition;
	information		= DIA_Whistler_Leaf_Info;
	permanent		= 0;
	important		= 0;
	description		= "Leaf nic mi nie powiedzia�!"; 
};

FUNC INT DIA_Whistler_Leaf_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_CristalPay))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Leaf_Info()
{
	AI_Output (other, self, "DIA_Whistler_Leaf_15_01"); //Leaf nic mi nie powiedzia�!
	AI_Output (self, other, "DIA_Whistler_Leaf_11_02"); //Zdradz� Ci pewien sekret. Do Kolonii trafiaj� raczej Ci �li, wredni i brzydcy...
	AI_Output (self, other, "DIA_Whistler_Leaf_11_03"); //Powiedzia�em tylko, �e Leaf wie co� o krysztale. Nie powiedzia�em, �e co� Ci zdradzi!
	AI_Output (other, self, "DIA_Whistler_Leaf_15_04"); //Niech to szlag, straci�em 50 bry�ek!
	AI_Output (self, other, "DIA_Whistler_Leaf_11_05"); //�adnie Ci� podpu�ci�.
	AI_Output (self, other, "DIA_Whistler_Leaf_11_06"); //Ale mo�e piwo rozwi��e mu j�zyk? Daj mu kilka piw i kto wie...
	
   B_LogEntry(CH1_RBL_ArrowCristal, "�wistak zasugerowa�, �e kilka piw powinno rozwi�za� Leafowi j�zyk. Mo�e warto spr�bowa�?");
};

// **************************************************

INSTANCE DIA_Whistler_LeafBack (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 23;
	condition		= DIA_Whistler_LeafBack_Condition;
	information		= DIA_Whistler_LeafBack_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam kryszta�."; 
};

FUNC INT DIA_Whistler_LeafBack_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_CristalOk))&&(NPC_HasItems(other,arrow_cristal)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_LeafBack_Info()
{
	AI_Output (other, self, "DIA_Whistler_LeafBack_15_01"); //Mam kryszta�.
	AI_Output (self, other, "DIA_Whistler_LeafBack_11_02"); //Daj mi go!
	
   B_GiveInvItems (other, self, arrow_cristal, 1);
	Npc_RemoveInvItems(self,arrow_cristal,1);
	
   AI_Output (self, other, "DIA_Whistler_LeafBack_11_03"); //Zaczekaj tu chwil�...
	AI_Output (other, self, "DIA_Whistler_LeafBack_15_04"); //A nagroda?!
	AI_Output (self, other, "DIA_Whistler_LeafBack_11_05"); //Zaraz wr�c�!

	B_StopProcessInfos(self);

	AI_SetWalkmode (self, NPC_RUN);
	AI_GotoWP (self, "HC_HUTIN_X");
	AI_PlayAni (self,"T_PRACTICEMAGIC2");
	Wld_PlayEffect("spellFX_INCOVATION_BLUE", self, self, 1, 0, DAM_MAGIC, FALSE);	
	AI_GotoNpc (self, other);
};

// **************************************************

INSTANCE DIA_Whistler_CristalCompleated (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 24;
	condition		= DIA_Whistler_CristalCompleated_Condition;
	information		= DIA_Whistler_CristalCompleated_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Whistler_CristalCompleated_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_LeafBack))&&(Npc_GetDistToNpc(self,hero) < 200)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_CristalCompleated_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_01"); //Uda�o si�!
	AI_Output (other, self, "DIA_Whistler_CristalCompleated_15_02"); //To �wietnie, ale co?
	AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_03"); //Prze�y�em! I mam dla Ciebie odpowiedni� nagrod�.
	AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_04"); //We� te strza�y, na pewno Ci si� przydadz�.
	
   CreateInvItems (self,ItAmFireArrow,25);
	B_GiveInvItems (self, other, ItAmFireArrow, 25);
	CreateInvItems (self,ItAmIceArrow,25);
	B_GiveInvItems (self, other, ItAmIceArrow, 25);
	
   AI_Output (other, self, "DIA_Whistler_CristalCompleated_15_05"); //Rzeczywi�cie by�o warto...
	AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_06"); //A to 50 bry�ek, kt�re straci�e� przez Leafa.
   
   CreateInvItems (self,ItMiNugget, 50);//ruda
	B_GiveInvItems (self, other, ItMiNugget, 50);
   
	AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_07"); //Jeszcze raz przyjmij wyrazy mojej wdzi�czno�ci.
	AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_08"); //Gdybym m�g� jeszcze jako� Ci si� odwdzi�czy�...
	AI_Output (other, self, "DIA_Whistler_CristalCompleated_15_09"); //Ekhm... To wystarczy, bywaj.

	Log_SetTopicStatus(CH1_RBL_ArrowCristal, LOG_SUCCESS);
	B_LogEntry(CH1_RBL_ArrowCristal, "Rzeczywi�cie warto by�o ugania� si� za tym kryszta�em. Dosta�em magiczne strza�y i jeszcze zwrot koszt�w. Ale �wistakowi zbyt si� oczy �wiec� na m�j widok, na jaki� czas lepiej omija� go szerokim �ukiem i na Beliara, lepiej nie odwraca� si� do niego ty�em!");
};

// **************************************************

INSTANCE DIA_Whistler_Revange (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 25;
	condition		= DIA_Whistler_Revange_Condition;
	information		= DIA_Whistler_Revange_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Whistler_Revange_Condition()
{
	//Two days after Pacho arrived to OR Camp
	if (Day_PachoJoinsORCamp)&&(Day_PachoJoinsORCamp+2<Wld_GetDay())&&(Npc_KnowsInfo (hero, Info_Drax_Trust))&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Revange_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   AI_Output (self, other, "DIA_Whistler_Revange_11_01"); //Zaczekaj, mo�emy porozmawia�?
	AI_Output (other, self, "DIA_Whistler_Revange_15_02"); //Porozmawia� zawsze mo�na. O co chodzi?
	
   AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	
   AI_Output (self, other, "DIA_Whistler_Revange_11_03"); //Kto� mi zacz�� psu� interes...
	AI_Output (other, self, "DIA_Whistler_Revange_15_04"); //Chwila. Wiem, �e wygl�dam, jak najgorsza szumowina, ale nie b�d� nikogo zabija� na zlecenie!
	AI_Output (self, other, "DIA_Whistler_Revange_11_05"); //Spokojnie, nie musisz nikogo zabija�. Jest prostszy i mniej zab�jczy spos�b.
	AI_Output (other, self, "DIA_Whistler_Revange_15_06"); //No dobra, m�w.
	AI_Output (self, other, "DIA_Whistler_Revange_11_07"); //Drax przesta� u mnie kupowa� sk�ry, odk�d do obozu przypa��ta� si� Pacho.
	AI_Output (self, other, "DIA_Whistler_Revange_11_08"); //Co w tym niezwyk�ego, to normalne prawo konkurencji.
	AI_Output (self, other, "DIA_Whistler_Revange_11_09"); //Ale z Draxem mia�em s�own� umow�, �e b�dzie skupowa� tylko MOJE sk�ry!
	AI_Output (self, other, "DIA_Whistler_Revange_11_10"); //Ja w zamian znalaz�em kilku klient�w na te cholerne konfitury!
	AI_Output (other, self, "DIA_Whistler_Revange_15_11"); //Do czego zmierzasz?
	AI_Output (self, other, "DIA_Whistler_Revange_11_12"); //Podmienisz konfitury w skrzyni Draxa, na te przygotowane przeze mnie.
	AI_Output (other, self, "DIA_Whistler_Revange_15_13"); //Z czego je zrobi�e�? 
	AI_Output (self, other, "DIA_Whistler_Revange_11_14"); //A r�ne takie wn�trzno�ci i odchody. Kiedy Drax sprzeda weki, to klienci go zlinczuj�, he, he.
	AI_Output (other, self, "DIA_Whistler_Revange_15_15"); //Kawa� z Ciebie sukinsyna.
	AI_Output (self, other, "DIA_Whistler_Revange_11_16"); //W ko�cu Kolonia to nie miejsce dla mi�czak�w. Wi�c jak b�dzie?
};

// **************************************************

INSTANCE DIA_Whistler_RevangeOk (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 26;
	condition		= DIA_Whistler_RevangeOk_Condition;
	information		= DIA_Whistler_RevangeOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, daj te 'konfitury'."; 
};

FUNC INT DIA_Whistler_RevangeOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Scorpio_GoOut))&&(Npc_KnowsInfo (hero, DIA_Whistler_Revange))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RevangeOk_Info()
{
	AI_Output (other, self, "DIA_Whistler_RevangeOk_15_01"); //Dobra, daj te 'konfitury'.
	AI_Output (self, other, "DIA_Whistler_RevangeOk_11_02"); //Wiedzia�em, �e mo�na na Ciebie liczy�! We� wszystkie weki.
   
	CreateInvItems (self, konfitury_fake,5); 
	B_GiveInvItems (self, other, konfitury_fake, 5);
   
	AI_Output (self, other, "DIA_Whistler_RevangeOk_11_03"); //Tylko ich nie kosztuj, s� ohydne...
	AI_Output (other, self, "DIA_Whistler_RevangeOk_15_04"); //O to si� nie b�j. Cholera, ale to cuchnie. Miejmy to ju� za sob�.
	AI_Output (self, other, "DIA_Whistler_RevangeOk_11_05"); //Aha. Przynie� mi konfitury ze skrzyni Draxa... 
	AI_Output (self, other, "DIA_Whistler_RevangeOk_11_06"); //G�upio mi o tym m�wi�, ale s� przepyszne!
   
	Log_CreateTopic(CH1_RBL_Revange, LOG_MISSION);
	Log_SetTopicStatus(CH1_RBL_Revange, LOG_RUNNING);
	B_LogEntry(CH1_RBL_Revange, "Pomog� �wistakowi w zem�cie na Draxie. Musz� podmieni� konfitury z kufra Draxa na cuchn�c� podr�bk� �wistaka, a konfitury ze skrzyni mam zanie�� �wistakowi.");
};

// **************************************************

INSTANCE DIA_Whistler_RevangeDone (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 27;
	condition		= DIA_Whistler_RevangeDone_Condition;
	information		= DIA_Whistler_RevangeDone_Info;
	permanent		= 0;
	important		= 0;
	description		= "Za�atwione, we� konfitury."; 
};

FUNC INT DIA_Whistler_RevangeDone_Condition()
{
	if (NPC_HasItems(other,konfitury_chest)>=5)&&(Mob_HasItems ("OR_CHEST_DRAX", konfitury_fake)>=5)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RevangeDone_Info()
{
	AI_Output (other, self, "DIA_Whistler_RevangeDone_15_01"); //Za�atwione, we� konfitury.
   
	B_GiveInvItems (other, self, konfitury_chest, 5);
	Npc_RemoveInvItems(self,konfitury_chest,5);
   
	AI_Output (self, other, "DIA_Whistler_RevangeDone_11_02"); //Ju� nie mog� doczeka� si� miny Draxa, jak sprzeda weki.
	AI_Output (self, other, "DIA_Whistler_RevangeDone_11_03"); //Zas�u�y�e� na t� rud�, przyjacielu.

	CreateInvItems (self, itminugget,50); 
	B_GiveInvItems (self, other, itminugget, 50);
   
	B_LogEntry(CH1_RBL_Revange, "Zarobi�em 50 bry�ek, ale jak pozby� si� smrodu?");
	B_Givexp(150);
};

// **************************************************

INSTANCE DIA_Whistler_RevangeAfter (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 28;
	condition		= DIA_Whistler_RevangeAfter_Condition;
	information		= DIA_Whistler_RevangeAfter_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Whistler_RevangeAfter_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Drax_RevangeDone))&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RevangeAfter_Info()
{
	B_FullStop (hero);
	AI_Output (self, other, "DIA_Whistler_RevangeAfter_11_01"); //Hey, Ty!
	AI_TurnToNpc (other, self);
	AI_Output (other, self, "DIA_Whistler_RevangeAfter_15_02"); //Ja?
	AI_Output (self, other, "DIA_Whistler_RevangeAfter_11_03"); //Tak. Podejd� do mnie.
	AI_GotoNpc(other, self);
	AI_Output (other, self, "DIA_Whistler_RevangeAfter_15_04"); //Znowu co� si� sta�o?
	AI_Output (self, other, "DIA_Whistler_RevangeAfter_11_05"); //Jaki� bezczelny gnojek ukrad� mi ber�o! Nic o tym nie wiesz?
	AI_Output (other, self, "DIA_Whistler_RevangeAfter_15_06"); //Ja nic o niczym nie wiem! Do jasnej cholery, dajcie mi wszyscy spok�j!
	AI_Output (self, other, "DIA_Whistler_RevangeAfter_11_07"); //Spokojnie, tak tylko zapyta�em...

	Log_SetTopicStatus(CH1_RBL_Revange, LOG_SUCCESS);
	B_LogEntry(CH1_RBL_Revange, "Mam ju� do�� pomagania innym!");
};

// **************************************************

INSTANCE DIA_Whistler_Kuva (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 30;
	condition		= DIA_Whistler_Kuva_Condition;
	information		= DIA_Whistler_Kuva_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znasz niejakiego Kuv�?"; 
};

FUNC INT DIA_Whistler_Kuva_Condition()
{
	return Kuva_Help;
};

FUNC VOID DIA_Whistler_Kuva_Info()
{
	AI_Output (other, self, "DIA_Whistler_Kuva_15_01"); //Znasz niejakiego Kuv�?
	AI_Output (self, other, "DIA_Whistler_Kuva_11_02"); //Pewnie, �e znam tego gnoja! Jest mi winien rud�. Albo raczej by�...
	AI_Output (other, self, "DIA_Whistler_Kuva_15_03"); //Jak to by�?
	AI_Output (self, other, "DIA_Whistler_Kuva_11_04"); //Chcia�em si� z nim spotka� kilka dni temu, ale nie przyszed�. Mia�em mu wtedy powiedzie�, �e jego d�ug wykupi� R�czka.
	AI_Output (other, self, "DIA_Whistler_Kuva_15_05"); //A dlaczego R�czka to zrobi�?
	AI_Output (self, other, "DIA_Whistler_Kuva_11_06"); //Nie mam zielonego poj�cia. Dla mnie liczy si� tylko ruda. Odzyska�em sw�j d�ug, a reszta to nie moja sprawa.
	AI_Output (other, self, "DIA_Whistler_Kuva_15_07"); //No to musz� porozmawia� z R�czk�. Bywaj.

	B_LogEntry(CH1_RBL_Cage, "D�ug Kuvy wykupi� R�czka. Ciekawe dlaczego?");
};
