var int Mis_Quentin_HeroAppearOnGraveyard;
var int Mis_Quentin_SentHeroToGYD;

FUNC VOID MIS_QUENTIN_GRAVEYARD_SCRIPT_FUNC()
{
	if(!Mis_Quentin_HeroAppearOnGraveyard)&&(Mis_Quentin_SentHeroToGYD)
	{
		Mis_Quentin_HeroAppearOnGraveyard=TRUE;
		B_LogEntry(CH2_RBL_MysteryBook, "Quentin jednak si� pomyli�, nie znalaz�em pos��ka na cmentarzu. Powinienem jeszcze raz z nim porozmawia�."); 
	};
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_858_Quentin_Exit (C_INFO)
{
	npc			= HUN_858_Quentin;
	nr			= 999;
	condition	= DIA_HUN_858_Quentin_Exit_Condition;
	information	= DIA_HUN_858_Quentin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_858_Quentin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_858_Quentin_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_HUN_858_Quentin_Hello (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 1;
	condition		= DIA_HUN_858_Quentin_Hello_Condition;
	information		= DIA_HUN_858_Quentin_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_HUN_858_Quentin_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_858_Quentin_Hello_Info()
{
	Npc_SetAivar(self,AIV_WASDEFEATEDBYSC,  FALSE); Npc_SetAivar(self,AIV_HASDEFEATEDSC,  FALSE);
   
	AI_Output (other, self, "DIA_HUN_858_Quentin_Hello_15_01"); //Witaj. Widz�, �e lubisz macha� mieczem?
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_07_02"); //Mo�e i lubi�. A co Ci� to obchodzi?
	AI_Output (other, self, "DIA_HUN_858_Quentin_Hello_15_03"); //Chcia�em tylko zagai� rozmow�...
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_07_04"); //Wiesz co? Nie lubi� mi�czak�w miel�cych ozorem.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_07_05"); //Udowodnij, �e� wart mojego czasu, to pogadamy.
	AI_Output (other, self, "DIA_HUN_858_Quentin_Hello_15_06"); //Ale jak mam to zrobi�?
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_07_07"); //To proste. Wyci�gnij �elazo i nie daj si� zabi�...
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_07_08"); //To jak b�dzie ch�opcze? Stajesz jak m�czyzna, czy uciekasz jak zaj�c?

	Info_ClearChoices (DIA_HUN_858_Quentin_Hello);
	Info_AddChoice (DIA_HUN_858_Quentin_Hello, "Czemu nie.", DIA_HUN_858_Quentin_Hello_Yes);
	Info_AddChoice (DIA_HUN_858_Quentin_Hello, "Mo�e innym razem.", DIA_HUN_858_Quentin_Hello_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_HUN_858_Quentin_Hello_Yes()
{
	quentin_fight = TRUE;
   
	AI_Output (other, self, "DIA_HUN_858_Quentin_Hello_Yes_15_01"); //Czemu nie. Troch� ruchu mi nie zaszkodzi.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_Yes_07_02"); //To mi si� podoba.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_Yes_07_03"); //Graj muzyczko!
   
	B_SetTimedATT(self,30*events_per_sec,-250,-250,-80);		
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ------------------No----------------

FUNC VOID DIA_HUN_858_Quentin_Hello_No()
{
	// modificated by orc:
	// react on hero flee
	quentin_fight = -1;//hero don't want to fight, but fight goes on anyway
	AI_Output (other, self, "DIA_HUN_858_Quentin_Hello_No_15_01"); //Raczej innym razem.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_No_07_02"); //Cholerny tch�rz! My�lisz, �e pozwol� Ci tak �atwo odej��?!
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_No_07_03"); //Upuszcz� Ci troch� krwi, mo�e w ko�cu zrozumiesz, gdzie trafi�e�!
   
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
	B_SetTimedATT(self,30*events_per_sec,-250,-250,-60);				
};

INSTANCE DIA_Quentin_CanYouTeachMe (C_INFO)
{
	npc				=  HUN_858_Quentin;
	nr				= 4;
	condition		= DIA_Quentin_CanYouTeachMe_Condition;
	information		= DIA_Quentin_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Quentin_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_HUN_858_Quentin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Quentin_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
   
   if (quentin_fight == TRUE) && (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
   {
      AI_Output (self, other, "DIA_Quentin_CanYouTeachMe_15_02"); //Pokona�e� w walce, ale jestem w stanie pokaza� ci kilka nowych sztuczek.
   }
   else
   {
      AI_Output (self, other, "DIA_Quentin_CanYouTeachMe_15_03"); //Machasz mieczem jak cepem, musisz jeszcze sporo si� nauczy�.
   };
   
   AI_Output (self, other, "DIA_Quentin_CanYouTeachMe_15_04"); //Poka�� ci podstawy walki broni� jednor�czn�.
   AI_Output (self, other, "DIA_Quentin_CanYouTeachMe_15_05"); //Znam te� kilka �wicze� na poprawienie zr�czno�ci.
   AI_Output (self, other, "DIA_Quentin_CanYouTeachMe_15_06"); //Wiem te� jak szybko zregenerowa� si�y. 
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Quentin to dobry wojownik i mo�e mnie wiele nauczy�. Mo�e mi pokaza�, jak sprawnie walczy� broni� jednor�czn�, zna kilka �wicze� poprawiaj�cych zr�czno�� i wie jak szybko zregenerowa� si�y �yciowe.");
};

INSTANCE DIA_HUN_858_Quentin_After (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 2;
	condition		= DIA_HUN_858_Quentin_After_Condition;
	information		= DIA_HUN_858_Quentin_After_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_858_Quentin_After_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_858_Quentin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_858_Quentin_After_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_HUN_858_Quentin_After_15_01"); //Witamy w Obozie Rebeliant�w.
   
	if (quentin_fight == TRUE)
	{
		if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_02"); //Mo�e i nie jeste� mistrzem, ale masz serce do walki, a to najwa�niejsze.
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_03"); //Dobrze wiedzie�, �e chce do nas do��czy� kto�, kto nie ucieka na widok miecza.
			B_GiveXP(100);
		}
		else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_04"); //Cholera, pokona�e� mnie!
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_05"); //Dobrze wiedzie�, �e chce do nas do��czy� taki charakternik.
			B_GiveXP(500);	
		};
	}
	else
	{
		if (quentin_fight == 2)//hero flee detected!
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_10"); //Ucieka�e� jak tch�rz! Gdyby� by� prawdziwym wojownikiem, nigdy by� tak nie post�pi�...
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_09"); //A teraz zejd� mi z oczu.	
		}		
		else if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_06"); //Zapami�taj sobie t� nauk�, bo tutaj nikt nie lubi tch�rzy!
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_07"); //A teraz zejd� mi z oczu.
		}
		else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_08"); //Jak to si� sta�o? Cholera mam z�y dzie�, skoro taki chuderlak mnie pokona�.
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_09"); //A teraz zejd� mi z oczu.	
			B_GiveXP(100);
		};
	};
};

// **************************************************

var int quentin_ok;

INSTANCE DIA_HUN_858_Quentin_Talk (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 3;
	condition		= DIA_HUN_858_Quentin_Talk_Condition;
	information		= DIA_HUN_858_Quentin_Talk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�emy porozmawia�?"; 
};

FUNC INT DIA_HUN_858_Quentin_Talk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_858_Quentin_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_858_Quentin_Talk_Info()
{
	AI_Output (other, self, "DIA_HUN_858_Quentin_Talk_15_01"); //Mo�emy porozmawia�?
   
	if (quentin_fight == TRUE)
	{
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_02"); //Pewnie. Dobrze zrobi mi kr�tka przerwa.
	}
	else
	{
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_03"); //M�w, skoro musisz, tylko si� streszczaj.
	};
   
	AI_Output (other, self, "DIA_HUN_858_Quentin_Talk_15_04"); //Rozmawia�em z Cavalornem. Chc� do was do��czy�, mamy wsp�lnych wrog�w, przyda si� Wam jeszcze jeden miecz.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_05"); //M�wisz o czerwonych?
	AI_Output (other, self, "DIA_HUN_858_Quentin_Talk_15_06"); //Tak.
   
	if (quentin_fight == TRUE)
	{
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_07"); //Pokaza�e� ju�, �e masz serce do walki. Ale nadal brak Ci do�wiadczenia.
	}
	else
	{
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_08"); //Nie przepadam za tch�rzami, ale przyda si� teraz ka�dy, kto da rad� unie�� miecz.
	};
   
	Log_CreateTopic(CH1_Rbl_Warrior, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Warrior, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Warrior, "�eby zdoby� uznanie Quentina musz� pokaza�, �e potrafi� walczy� mieczem.");
   
	AI_Output (other, self, "DIA_HUN_858_Quentin_Talk_15_09"); //Z or�em radz� sobie ca�kiem nie�le.
   
	if (Npc_GetTalentValue(other, NPC_TALENT_1H)>=30)||(Npc_GetTalentValue(other, NPC_TALENT_2H)>=30)
	{
		B_GiveXP(250);
		quentin_ok = TRUE;
		rebel_camp_trust = rebel_camp_trust + 1;//inkrementacja zmiennej odpowiedzialnej za przyj�cie do obozu
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_10"); //Rzeczywi�cie. Radzisz sobie z broni� lepiej, ni� s�dzi�em.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_11"); //Je�eli o mnie chodzi, to nie mam nic przeciwko, �eby� sta� si� jednym z nas.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_12"); //Wiesz ju�, kt�ry koniec miecza pcha� w przeciwnika, a to najwa�niejsze.
      
		if (quentin_fight == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_13"); //Do tego nie stronisz od porz�dnej bitki. 
			AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_14"); //We� t� recept�, mo�e zrobisz z niej lepszy u�ytek ni� ja.
			AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_15"); //Nijak nie potrafi� zrozumie�, co tam nabazgrano. 
			AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_16"); //Zosta�a mi tylko jedna. Reszt� podtar�em ty�ek.
         
			CreateInvItems (self,Recept_ItMw_2H_Sword_Light_01,1);
			B_GiveInvItems (self, other, Recept_ItMw_2H_Sword_Light_01, 1);
		};
      
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_17"); //Wracam do swoich zaj��.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_18"); //Je�eli Cavalorn zapyta mnie, co o Tobie my�l�, to powiem, �e powiniene� na co� si� przyda�.

		Log_SetTopicStatus(CH1_Rbl_Warrior, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Warrior, "Udowodni�em Quentinowi, �e potrafi� w�ada� mieczem i toporem.");
		B_LogEntry(CH1_Rbl_RebelCampTrust, "To Quentina mam z g�owy. Zaufania tego w�ciek�ego wilka nie zdoby�em, ale przynajmniej poprze mnie przed Cavalornem.");
		
		quentin_fight = 0;
	}
	else
	{
		PrintScreen("Wymagane 30 % walki broni� jednor�czn� lub dwur�czn�!", -1, _YPOS_MESSAGE_Joincamp, "font_old_10_white.tga", _TIME_MESSAGE_LOGENTRY);
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_19"); //Nie wydaje mi si�.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_20"); //Przyjd�, jak przestaniesz �mierdzie� ��todziobem, wtedy pogadamy.
		B_StopProcessInfos(self); 
	};
};

INSTANCE DIA_HUN_858_Quentin_Proof (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 4;
	condition		= DIA_HUN_858_Quentin_Proof_Condition;
	information		= DIA_HUN_858_Quentin_Proof_Info;
	permanent		= 1;
	important		= 0;
	description		= "Potrafi� w�ada� mieczem!"; 
};

FUNC INT DIA_HUN_858_Quentin_Proof_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_858_Quentin_Talk))&&(quentin_ok == FALSE)
	{
		return 1;
	};
};
FUNC VOID DIA_HUN_858_Quentin_Proof_Info()
{
	AI_Output (other, self, "DIA_HUN_858_Quentin_Proof_15_09"); //Potrafi� w�ada� mieczem!
   
	if (Npc_GetTalentValue(other, NPC_TALENT_1H)>=30)||(Npc_GetTalentValue(other, NPC_TALENT_2H)>=30)
	{
		quentin_trust = TRUE;
		B_GiveXP(250);
		quentin_ok = TRUE;
		rebel_camp_trust = rebel_camp_trust + 1;//inkrementacja zmiennej odpowiedzialnej za przyj�cie do obozu
		
      AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_10"); //Rzeczywi�cie. Radzisz sobie z broni� lepiej, ni� s�dzi�em.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_11"); //Je�eli o mnie chodzi, to nie mam nic przeciwko, �eby� sta� si� jednym z nas.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_12"); //Wiesz ju�, kt�ry koniec miecza pcha� w przeciwnika, a to najwa�niejsze.
		
      if (quentin_fight == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_13"); //Do tego nie stronisz od porz�dnej bitki. 
			AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_14"); //We� t� recept�, mo�e zrobisz z niej lepszy u�ytek ni� ja.
			AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_15"); //Nijak nie potrafi� zrozumie�, co tam nabazgrolono. 
			AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_16"); //Zosta�a mi tylko jedna. Reszt� podtar�em ty�ek.
         
			CreateInvItems (self,Recept_ItMw_2H_Sword_Light_01,1);
			B_GiveInvItems (self, other, Recept_ItMw_2H_Sword_Light_01, 1);
		};
      
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_17"); //Wracam do swoich zaj��.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_18"); //Je�eli Cavalorn zapyta mnie, co o Tobie my�l�, to powiem, �e powiniene� na co� si� przyda�.

		Log_SetTopicStatus(CH1_Rbl_Warrior, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Warrior, "Udowodni�em Quentinowi, �e potrafi� w�ada� mieczem i toporem.");
		B_LogEntry(CH1_Rbl_RebelCampTrust, "To Quentina mam z g�owy. Zaufania tego w�ciek�ego wilka nie zdoby�em, ale przynajmniej poprze mnie przed Cavalornem.");
		quentin_fight = 0;
	}
	else
	{
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_19"); //Nie wydaje mi si�.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_20"); //Przyjd�, jak przestaniesz �mierdzie� ��todziobem, wtedy pogadamy.
      
		B_StopProcessInfos(self); 
	};
};

INSTANCE DIA_Quentin_Attack (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 11;
	condition		= DIA_Quentin_Attack_Condition;
	information		= DIA_Quentin_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Quentin_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Attack_Info()
{
	AI_Output (self, other, "DIA_Quentin_Attack_11_01"); //My�la�em, �e jednak jeste� m�drzejszy.
	AI_Output (self, other, "DIA_Quentin_Attack_11_02"); //Szkoda, bo pasowa�by� do nas, ch�opcze.
	AI_Output (self, other, "DIA_Quentin_Attack_11_03"); //Zejd� mi z oczu!
	B_StopProcessInfos(self); 
};

// **************************************************

INSTANCE DIA_Quentin_Stew (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 12;
	condition		= DIA_Quentin_Stew_Condition;
	information		= DIA_Quentin_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "To doda Ci si�."; 
};

FUNC INT DIA_Quentin_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_Quentin_Stew_15_01"); //To doda Ci si�.
	AI_Output (self, other, "DIA_Quentin_Stew_11_02"); //Na kontynencie powiadaj�, �e co Ci� nie zabije, to Ci� wzmocni. Zaryzykuj�...
   
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Quentin chyba s�ysza� negatywne opinie na temat gulaszu Snafa, ale postanowi� zaryzykowa�."); 
};

INSTANCE DIA_Quentin_Spy (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 13;
	condition		= DIA_Quentin_Spy_Condition;
	information		= DIA_Quentin_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nied�ugo czeka nas walka."; 
};

FUNC INT DIA_Quentin_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Spy_Info()
{
	spy_count = spy_count + 1;
   
	AI_Output (other, self, "DIA_Quentin_Spy_15_01"); //Nied�ugo czeka nas walka.
	AI_Output (self, other, "DIA_Quentin_Spy_07_02"); //Ca�e �ycie to walka. Kiedy opadniesz z si� to ju� po Tobie.
	AI_Output (other, self, "DIA_Quentin_Spy_15_03"); //A z kim Ty walczysz Quentin? Widz� na Twojej twarzy gniew i... smutek.
	AI_Output (self, other, "DIA_Quentin_Spy_07_04"); //Z samym sob� piracie. Z w�asnymi s�abo�ciami. 
	AI_Output (self, other, "DIA_Quentin_Spy_07_05"); //Walka zamienia cia�o w stal i hartuje umys�. Kiedy nadejdzie czas, mi�nie zareaguj� instynktownie.
	AI_Output (self, other, "DIA_Quentin_Spy_07_06"); //Wtedy nie b�dzie czasu na my�lenie...
	AI_Output (other, self, "DIA_Quentin_Spy_15_07"); //Kiedy?
	AI_Output (self, other, "DIA_Quentin_Spy_07_08"); //Gdy nadejdzie czas zap�aty. 
	AI_Output (self, other, "DIA_Quentin_Spy_07_09"); //Wystarczy ju� tego strz�pienia j�zyka...
   
	B_LogEntry(CH2_Rbl_Spy, "Quentin �yje tylko po to by walczy�. Twierdzi, �e walczy z samym sob�, �e przygotowuje si� do 'czego�'. Tylko do czego?");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od ciebie chcia�.
		B_LogEntry(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_Quentin_Spy1 (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 14;
	condition		= DIA_Quentin_Spy1_Condition;
	information		= DIA_Quentin_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "A Ty nadal walczysz?"; 
};

FUNC INT DIA_Quentin_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_Quentin_Spy1_15_01"); //A Ty nadal walczysz?
	AI_Output (self, other, "DIA_Quentin_Spy1_07_02"); //Tylko walka si� dla mnie liczy.
	AI_Output (other, self, "DIA_Quentin_Spy1_15_03"); //Chcia�em o co� zapyta�...
	AI_Output (self, other, "DIA_Quentin_Spy1_07_04"); //Wiem. Rozumiem Twoje obawy, ale nie potrafi� pom�c.
	AI_Output (self, other, "DIA_Quentin_Spy1_07_05"); //Gdybym zauwa�y� co� podejrzanego, za�atwi�bym to po swojemu.
	AI_Output (other, self, "DIA_Quentin_Spy1_15_06"); //Rozumiem. Popytam innych.
	AI_Output (self, other, "DIA_Quentin_Spy1_07_07"); //Chocia�... Wydaje mi si�, �e Tony zbyt ochoczo bierze s�u�by na warcie za innych.
	AI_Output (self, other, "DIA_Quentin_Spy1_07_08"); //Rzadko si� zdarza, �eby kto� z w�asnej woli pcha� si� na nocne wachty.
	AI_Output (self, other, "DIA_Quentin_Spy1_07_09"); //Ale to tylko moje domys�y, mo�e jestem przewra�liwiony.
   
	B_LogEntry(CH2_Rbl_Spy, "Hmm, Quentin zwr�ci� mi uwag� na to, �e Tony cz�sto bierze s�u�by za innych. To faktycznie jest do�� dziwne.");
	
   if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta�, nie daj mu czeka�.
		B_LogEntry(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};
   
	B_StopProcessInfos(self);
};

INSTANCE DIA_Quentin_PalGraveyard (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 12;
	condition		= DIA_Quentin_PalGraveyard_Condition;
	information		= DIA_Quentin_PalGraveyard_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czy wiesz gdzie znajd� pos��ek Innosa?"; 
};

FUNC INT DIA_Quentin_PalGraveyard_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_SearchAgain))
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_PalGraveyard_Info()
{
	//That's crappy dialog has been created by orc
	AI_Output (other, self, "DIA_Quentin_PalGraveyard_15_01"); //Czy wiesz gdzie znajd� pos��ek Innosa?
	AI_Output (self, other, "DIA_Quentin_PalGraveyard_11_02"); //Pos��ek Innosa w Kolonii Karnej?
	AI_Output (other, self, "DIA_Quentin_PalGraveyard_15_03"); //Kiedy� na tych ziemiach przebywali paladyni i magowie. Mam nadziej�, �e zosta�o po nich co� wiecej, ni� bielej�ce ko�ci.
	AI_Output (self, other, "DIA_Quentin_PalGraveyard_11_04"); //Chyba wiem, o czym m�wisz. Zdaje si�, �e kiedy� natkn��em si� na jaki� grobowiec.
	AI_Output (other, self, "DIA_Quentin_PalGraveyard_15_05"); //Pami�tasz, gdzie to by�o?
	AI_Output (self, other, "DIA_Quentin_PalGraveyard_11_06"); //Przy wej�ciu na ziemie ork�w, niedaleko po�udniowej bramy Starego Obozu. Chyba orkowie przydybali tam kiedy� paladyn�w.
	AI_Output (self, other, "DIA_Quentin_PalGraveyard_11_07"); //W ka�dym razie widzia�em resztki pancerzy i zmursza�e proporce.
	AI_Output (self, other, "DIA_Quentin_PalGraveyard_11_08"); //Kto wie, mo�e znajdziesz te� i pos��ek Innosa.
	
   Mis_Quentin_SentHeroToGYD=TRUE;
	B_LogEntry(CH2_RBL_MysteryBook, "Quentin wspomnia� o cmentarzu paladyn�w, zaraz za wej�ciem na terytoria ork�w, drog� od po�udniowej bramy Starego Obozu."); 
};

INSTANCE DIA_Quentin_PalGraveyardBack (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 12;
	condition		= DIA_Quentin_PalGraveyardBack_Condition;
	information		= DIA_Quentin_PalGraveyardBack_Info;
	permanent		= 0;
	important		= 0;
	description		= "By�em na cmentarzu."; 
};

FUNC INT DIA_Quentin_PalGraveyardBack_Condition()
{
	if (Mis_Quentin_HeroAppearOnGraveyard)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_PalGraveyardBack_Info()
{
	//That's crappy dialog has been created by orc
	AI_Output (other, self, "DIA_Quentin_PalGraveyardBack_15_01"); //By�em na cmentarzu.
	AI_Output (self, other, "DIA_Quentin_PalGraveyardBack_11_02"); //I jak, odnalaz�e� pos��ek Innosa?
	AI_Output (other, self, "DIA_Quentin_PalGraveyardBack_15_03"); //Niestety nie.
	AI_Output (self, other, "DIA_Quentin_PalGraveyardBack_11_04"); //Ja Ci ju� nie pomog�. Nie mam poj�cia, gdzie m�g�by� jeszcze zajrze�.
	AI_Output (other, self, "DIA_Quentin_PalGraveyardBack_15_05"); //Rozumiem, bywaj.
   
	if(aligator_trust)
	{
		AI_Output (self, other, "DIA_Quentin_PalGraveyardBack_11_06"); //Zaczekaj chwil�. Jaki� pirat Ci� tu szuka�. To chyba ten �legendarny�.
	};
   
	B_GiveXP(500);
	B_LogEntry(CH2_RBL_MysteryBook, "Po ponownej wizycie u Quentina nadal nie wiem, gdzie znale�� pos��ek. Quentin wspomina� jeszcze o Jacku Aligatorze, kt�ry mnie szuka�, mo�e on mi jako� pomo�e?"); 
};

INSTANCE DIA_Quentin_Leaf (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 20;
	condition		= DIA_Quentin_Leaf_Condition;
	information		= DIA_Quentin_Leaf_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno znasz si� na alchemii."; 
};

FUNC INT DIA_Quentin_Leaf_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Leaf))
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Leaf_Info()
{
	AI_Output (other, self, "DIA_Quentin_Leaf_15_01"); //Podobno znasz si� na alchemii.
	AI_Output (self, other, "DIA_Quentin_Leaf_11_02"); //Co Ci do tego?
	AI_Output (other, self, "DIA_Quentin_Leaf_15_03"); //Leaf po�kn�� magiczny specyfik i straci� przytomno��.
	AI_Output (other, self, "DIA_Quentin_Leaf_15_04"); //Cavalorn powiedzia�, �e m�g�by� pom�c.
	AI_Output (self, other, "DIA_Quentin_Leaf_11_05"); //Leaf ci�gle pakuje si� w jakie� k�opoty.
	AI_Output (self, other, "DIA_Quentin_Leaf_11_06"); //Chyba mam co� co mu pomo�e. Zaprowad� mnie do niego.
	AI_Output (other, self, "DIA_Quentin_Leaf_15_07"); //Ruszajmy.
	
   B_LogEntry(CH1_RBL_Stone, "Quentin si� zgodzi�. Musz� zaprowadzi� go do Leafa.");

   Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_StopProcessInfos(self); 
};

// **************************************************

INSTANCE DIA_Quentin_LeafFind (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 21;
	condition		= DIA_Quentin_LeafFind_Condition;
	information		= DIA_Quentin_LeafFind_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Quentin_LeafFind_Condition()
{
	var C_NPC leaf; leaf = Hlp_GetNpc(RBL_4011_Leaf);

	if (Npc_KnowsInfo (hero, DIA_Quentin_Leaf))&&(Npc_GetDistToNpc(self,leaf) < 300)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_LeafFind_Info()
{
	var C_NPC leaf; leaf = Hlp_GetNpc(RBL_4011_Leaf);

	B_FullStop (hero);
	
   AI_Output (other, self, "DIA_Quentin_LeafFind_15_01"); //Jeste�my na miejscu!
	
   AI_TurnToNpc (other, leaf);
	AI_TurnToNpc (self, leaf);
	
   AI_Output (self, other, "DIA_Quentin_LeafFind_11_02"); //Daj mi chwil�...
	
   AI_GotoNpc(self,leaf);
	B_StopProcessInfos(self); 
	AI_PlayAni(self, "T_PLUNDER");
	AI_StandUp(leaf);
	AI_TurnToNpc (leaf, other);
	Npc_ExchangeRoutine(leaf,"START");
   Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************

INSTANCE DIA_Quentin_LeafOk (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 22;
	condition		= DIA_Quentin_LeafOk_Condition;
	information		= DIA_Quentin_LeafOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co zrobi�e�?"; 
};

FUNC INT DIA_Quentin_LeafOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_LeafFind))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_LeafOk_Info()
{
	B_FullStop (hero);
	B_FullStop (self);
	
   AI_Output (other, self, "DIA_Quentin_LeafOk_15_01"); //Co zrobi�e�?
	
   AI_TurnToNpc (self, other);
	
   AI_Output (self, other, "DIA_Quentin_LeafOk_11_02"); //Da�em mu po mordzie. To najlepsza metoda. Bywaj!
	
   Npc_ExchangeRoutine(self,"START");
	B_StopProcessInfos(self); 
};

// **************************************************

INSTANCE DIA_Quentin_Martin (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 23;
	condition		= DIA_Quentin_Martin_Condition;
	information		= DIA_Quentin_Martin_Info;
	permanent		= 0;
	important		= 0;
	description		= "Widzia�e� Martina?"; 
};

FUNC INT DIA_Quentin_Martin_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_FISK_MartinRing))&&(Help_Martin)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Martin_Info()
{
	AI_Output (other, self, "DIA_Quentin_Martin_15_01"); //Widzia�e� Martina?
	AI_Output (self, other, "DIA_Quentin_Martin_11_02"); //Nie, ju� od kilku dni nie widzia�em tej zakazanej mordy.
	AI_Output (other, self, "DIA_Quentin_Martin_15_03"); //A R�czk�?
	AI_Output (self, other, "DIA_Quentin_Martin_11_04"); //Tak, jaki� czas temu szed� z kilofem w stron� bramy. Podrzuca� w r�ku jakie� �wiecide�ko...
	AI_Output (other, self, "DIA_Quentin_Martin_15_05"); //Dzi�ki, Quentin.
	AI_Output (self, other, "DIA_Quentin_Martin_11_06"); //Do us�ug.

	B_LogEntry(CH2_RBL_Feelings, "Quentin widzia� jak R�czka opuszcza� ob�z z kilofem. Do tego podrzuca� w r�ku jakie� �wiecide�ko. Ten sukinsyn chyba gdzie� zakopuje swoje �upy.");

	B_fingers_proofs();
};

INSTANCE DIA_Quentin_Hanis (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 25;
	condition		= DIA_Quentin_Hanis_Condition;
	information		= DIA_Quentin_Hanis_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia�em zapyta� o Gor Hanisa."; 
};

FUNC INT DIA_Quentin_Hanis_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kharim_WhatGor))
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Hanis_Info()
{
	AI_Output (other, self, "DIA_Quentin_Hanis_15_01"); //Chcia�em zapyta� o Gor Hanisa.
	AI_Output (self, other, "DIA_Quentin_Hanis_11_02"); //Tak?
	AI_Output (other, self, "DIA_Quentin_Hanis_15_03"); //Podobno to twoje s�owo zawa�y�o na wydaleniu go z obozu.
	AI_Output (self, other, "DIA_Quentin_Hanis_11_04"); //Tak.
	AI_Output (other, self, "DIA_Quentin_Hanis_15_05"); //Nie masz nic wi�cej do powiedzenia?
	AI_Output (self, other, "DIA_Quentin_Hanis_11_06"); //Nie.
	
   B_LogEntry(CH2_RBL_Mem, "Co� mi tu �mierdzi. Quentin nabra� wody w usta. Zosta� mi tylko Ratford.");
	B_StopProcessInfos(self); 
};

// **************************************************

INSTANCE DIA_Quentin_Hanis1 (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 26;
	condition		= DIA_Quentin_Hanis1_Condition;
	information		= DIA_Quentin_Hanis1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia�em znowu zapyta� o Gor Hanisa."; 
};

FUNC INT DIA_Quentin_Hanis1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Hanis))
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Hanis1_Info()
{
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_01"); //Chcia�em znowu zapyta� o Gor Hanisa.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_02"); //Powiedzia�em Ci wszystko co wiem, a teraz zejd� mi z oczu.
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_03"); //Co� tu �mierdzi. Hanis nie m�g� zabi� rekruta, bo pewnie nadal le�a� nieprzytomny po ciosie Kharima.
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_04"); //Jaka jest prawda?
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_05"); //Pos�uchaj mnie uwa�nie. Gor Hanis zabi� rekruta. Wiem, co widzia�em. 
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_06"); //Odpowiedz dok�adnie, co widzia�e�.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_07"); //Zrobi� to, ale po raz ostatni.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_08"); //Gor Hanis powali� Kharima. Nie powiem, �adnie za�atwi� skurczybyka.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_09"); //Kiedy wyci�gn�� r�k� do najemnika, ten uderzy� p�azem miecza.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_10"); //No c�. Ka�dy wojownik powinien by� przygotowany na nieczysty cios.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_11"); //Kharim o dziwo pochyli� si� nad Hanisem i ocuci� go, uderzaj�c w twarz.
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_12"); //Jak go znam, to pewnie robi� to z u�miechem na ustach. Co by�o dalej?
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_13"); //Hanis nagle odzyska� �wiadomo��. Pami�tam, �e co� wyplu�...
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_14"); //P�niej zacz�� op�ta�czo krzycze�, wyrwa� miecz i skoczy� na rekruta. Ten nie mia� szans.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_15"); //Zanim zaatakowa� kolejn� ofiar�, uderzy�em go g�owic� miecza w potylic�.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_16"); //Zwi�zali�my nieszcz�nika i zanie�li�my do Ratforda. Reszt� ju� znasz.
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_17"); //Powiedzia�e�, �e Hanis co� wyplu�. Co to mog�o by�?
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_18"); //Mo�e z�b? Nie mam poj�cia. To Kharim go cuci�.
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_19"); //Hmm. Co� mi �wita. Mam pewien pomys�. Kto w obozie sprzedaje ziele?
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_20"); //Baal Taran i Baal Kagan. A dlaczego pytasz?
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_21"); //My�l�, �e Kharim nie tylko cuci� Gor Hanisa. Bywaj.
	
   B_LogEntry(CH2_RBL_Mem, "Quentin zrelacjonowa� mi wszystko. Wydaje mi si�, �e Kharim nie tylko cuci� Gor Hanisa, ale te� poda� mu doustnie jaki� specyfik, kt�ry sprawi�, �e by�y sekciarz wpad� w sza�. Musz� pogada� ze sprzedawcami ziela - Baal Taranem i Baal Kaganem, czy przypadkiem Kharim niczego od nich ostatnio nie kupi�.");
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Quentin_NewWeapon (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 15;
	condition		= DIA_Quentin_NewWeapon_Condition;
	information		= DIA_Quentin_NewWeapon_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie nowy miecz."; 
};

FUNC INT DIA_Quentin_NewWeapon_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_WeaponDev))&&(NPC_HasItems(other,HUN_MW_03)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_NewWeapon_Info()
{
	B_GiveXP(100);
	
   AI_Output (other, self, "DIA_Quentin_NewWeapon_15_01"); //Mam dla Ciebie nowy miecz.
	AI_Output (self, other, "DIA_Quentin_NewWeapon_11_02"); //To �wietnie, stary jest ju� bardziej wyszczerbiony ni� g�ba Kufla.
	
   B_GiveInvItems (other, self, HUN_MW_03, 1);
	AI_Output (self, other, "DIA_Quentin_NewWeapon_11_03"); //Dzi�ki, b�dzie czym ok�ada� stra�nik�w.
   
	B_LogEntry(CH3_RBL_DelivWeapon, "Quentin dosta� nowy miecz.");
};