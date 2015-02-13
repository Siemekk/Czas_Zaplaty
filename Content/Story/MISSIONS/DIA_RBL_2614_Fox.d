// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Fox_Hello (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 1;
	condition		= DIA_Fox_Hello_Condition;
	information		= DIA_Fox_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl�dasz jak kto�, kto potrzebuje pomocy."; 
};

FUNC INT DIA_Fox_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Fox_Hello_Info()
{
	AI_Output (other, self, "DIA_Fox_Hello_15_01"); //Wygl�dasz jak kto�, kto potrzebuje pomocy.
	AI_Output (self, other, "DIA_Fox_Hello_11_02"); //A Ty wygl�dasz jak kto�, kto szuka guza. Spadaj.
	B_StopProcessInfos	( self );
};

INSTANCE DIA_Fox_Trade(C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 1;
	condition		= DIA_Fox_Trade_Condition;
	information		= DIA_Fox_Trade_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zajmujesz si� handlem?"; 
};

FUNC INT DIA_Fox_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Fox_Trade_Info()
{
	AI_Output (other, self, "DIA_Fox_Trade_15_01"); //Zajmujesz si� handlem?
	AI_Output (self, other, "DIA_Fox_Trade_11_02"); //Tak, handluj� broni� by�cie si� mogli wzajemnie ok�ada�.
	
	Log_CreateTopic(GE_TraderOR,	LOG_NOTE);
	B_LogEntry(GE_TraderOR,	"Fox sprzedaje bro� w obozie.");
};

// **************************************************

INSTANCE DIA_Fox_Again (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 2;
	condition		= DIA_Fox_Again_Condition;
	information		= DIA_Fox_Again_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozmawia�em z Cavalornem."; 
};

FUNC INT DIA_Fox_Again_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Again_Info()
{
	AI_Output (other, self, "DIA_Fox_Again_15_01"); //Rozmawia�em z Cavalornem.
	AI_Output (self, other, "DIA_Fox_Again_11_02"); //Tak? To �wietnie. A co mnie to obchodzi?
	AI_Output (other, self, "DIA_Fox_Again_15_03"); //Zasugerowa�, �ebym porozmawia� z kim si� da. Mam udowodni� swoj� przydatno��...
	AI_Output (self, other, "DIA_Fox_Again_11_04"); //Rozumiem. Nast�pny uciekinier z innych oboz�w. Po prostu �wietnie, robi si� tu prawdziwe schronisko dla ps�w!
	AI_Output (other, self, "DIA_Fox_Again_15_05"); //Masz z tym jaki� problem?
	AI_Output (self, other, "DIA_Fox_Again_11_06"); //Pewnie, �e mam. Kolejna morda do wy�ywienia!
	AI_Output (other, self, "DIA_Fox_Again_15_07"); //Mo�e zaraz pozb�d� si� jednej wyszczekanej g�by.
	AI_Output (self, other, "DIA_Fox_Again_11_08"); //Chcia�by� idioto! Lepiej ze mn� nie zadzieraj! Problem w tym, �e im wi�cej nowych tym mniej porz�dnego �arcia dla mnie. A przede wszystkim mniej moich ukochanych konfiturek...
	AI_Output (other, self, "DIA_Fox_Again_15_09"); //Dobrze si� czujesz?
	AI_Output (self, other, "DIA_Fox_Again_11_10"); //Nie do cholery! Czuj� si� fatalnie. Ju� p� dnia bez konfitur...
	AI_Output (self, other, "DIA_Fox_Again_11_11"); //Zaraz. Chwila. Co Cavalorn powiedzia�?
	AI_Output (other, self, "DIA_Fox_Again_15_12"); //Chce, �ebym udowodni� swoj� przydatno��...
	AI_Output (other, self, "DIA_Fox_Again_15_13"); //Dobra, nie r�b ju� takiej miny, wiem co chcesz powiedzie�. Poszukam tych konfitur.
	AI_Output (self, other, "DIA_Fox_Again_11_15"); //A jednak jest nadzieja na tym �wiecie! S�uchaj!
	AI_Output (self, other, "DIA_Fox_Again_11_16"); //Konfitury sprzedaje Drax. Nie wiem sk�d ten troglodyta je bierze, ale s� przepyszne.
	AI_Output (self, other, "DIA_Fox_Again_11_17"); //We� t� rud� i przynie� mi co najmniej 10 wek�w konfitur.
	
   CreateInvItems (self,ItMiNugget,200);//ruda
	B_GiveInvItems (self, other, ItMiNugget, 200);
	
   AI_Output (self, other, "DIA_Fox_Again_11_18"); //Aha. I nie daj si� oszuka�. Drax to szczwany lis i na ka�dym chce zarobi�.
	AI_Output (self, other, "DIA_Fox_Again_11_19"); //Pospiesz si�!
	AI_Output (other, self, "DIA_Fox_Again_15_20"); //Grzmia�o?
	AI_Output (self, other, "DIA_Fox_Again_11_21"); //Nie idioto, to m�j brzuch!
	
	Log_CreateTopic	(CH1_Rbl_Food, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_Food, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Food, "Ci rebelianci to dziwna zbieranina. Jedni chc� ludzkich g��w inni wek�w z konfiturami. Musz� kupi� dla Foxa od Draxa co najmniej 10 s�oik�w z konfiturami. Fox przestrzeg� mnie te� przed Draxem, kt�ry podobno nie jest zbyt uczciwym sprzedawc�.");
};

INSTANCE DIA_Fox_Final (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 3;
	condition		= DIA_Fox_Final_Condition;
	information		= DIA_Fox_Final_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam konfitury."; 
};

FUNC INT DIA_Fox_Final_Condition()
{
	if ((Npc_KnowsInfo (hero, DIA_Drax_Sweets))||(Npc_KnowsInfo (hero, Info_Drax_Talk)))&&(NPC_HasItems(other,konfitury)>=5)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Final_Info()
{
	fox_trust = TRUE;
	AI_Output (other, self, "DIA_Fox_Final_15_01"); //Mam konfitury.
	
   if (NPC_HasItems(other,konfitury)<=9)
	{
		B_GiveXP(100);
		rebel_camp_trust = rebel_camp_trust + 1; 
		AI_Output (self, other, "DIA_Fox_Final_11_02"); //Nie masz dziesi�ciu s�oik�w?
		AI_Output (other, self, "DIA_Fox_Final_15_03"); //Drax mia� ich tylko pi��.
		AI_Output (self, other, "DIA_Fox_Final_11_04"); //Ostrzega�em Ci�, �e Drax to szczwany lis. Jednak lepsze to ni� nic. Daj konfitury.
		B_GiveInvItems (other, self, konfitury, 5);
		Npc_RemoveInvItems (self,konfitury,5);
		AI_Output (self, other, "DIA_Fox_Final_11_05"); //Co tak patrzysz? Popr� Ci� przed Cavalornem, ale nici z premii. 
		AI_Output (self, other, "DIA_Fox_Final_11_06"); //A teraz zejd� mi z oczu. Tatu� nadchodzi konfiturki!
		Log_SetTopicStatus	(CH1_Rbl_Food, LOG_SUCCESS);
		B_LogEntry		(CH1_Rbl_Food, "Fox dosta� 5 wek�w konfitur. Poprze mnie przed Cavalornem, ale omin�a mnie premia.");
		B_LogEntry		(CH1_Rbl_RebelCampTrust, "Zdoby�em poparcie Foxa - przez �o��dek do serca.");
	}
	else
	{
		B_GiveXP(250);
		rebel_camp_trust = rebel_camp_trust + 1; 
		AI_Output (self, other, "DIA_Fox_Final_11_07"); //Cudownie! Dziesi�� wek�w!
		AI_Output (self, other, "DIA_Fox_Final_11_08"); //�wietna robota. A teraz daj mi te smako�yki...
		B_GiveInvItems (other, self, konfitury, 10);
		Npc_RemoveInvItems (self,konfitury,10);
		AI_Output (self, other, "DIA_Fox_Final_11_09"); //Nie da�e� si� oszuka� Draxowi. Zas�u�y�e� na premi�.
		AI_Output (self, other, "DIA_Fox_Final_11_10"); //We� ten pier�cie�, niech Ci dobrze s�u�y.
		CreateInvItems (self,Schutzring_Geschosse1,1);
		B_GiveInvItems (self, other, Schutzring_Geschosse1, 1);
		AI_Output (self, other, "DIA_Fox_Final_11_11"); //Tatu� nadchodzi konfiturki!
		Log_SetTopicStatus	(CH1_Rbl_Food, LOG_SUCCESS);
		B_LogEntry		(CH1_Rbl_Food, "Fox dosta� 10 wek�w konfitur. Poprze mnie przed Cavalornem i do tego da� mi ciekawy pier�cie�.");
		B_LogEntry		(CH1_Rbl_RebelCampTrust, "Zdoby�em poparcie Foxa - przez �o��dek do serca.");
	};
};

INSTANCE DIA_Fox_Attack (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 11;
	condition		= DIA_Fox_Attack_Condition;
	information		= DIA_Fox_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Fox_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Attack_Info()
{
	AI_Output (self, other, "DIA_Fox_Attack_11_01"); //Czego tu jeszcze szukasz �az�go?
	AI_Output (self, other, "DIA_Fox_Attack_11_02"); //Chyba porz�dnego lania!
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);	
};

// **************************************************

INSTANCE DIA_Fox_Camp (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 12;
	condition		= DIA_Fox_Camp_Condition;
	information		= DIA_Fox_Camp_Info;
	permanent		= 0;
	important		= 0;
	description		= "Cavalorn powiedzia�, �e jeste� kwatermistrzem."; 
};

FUNC INT DIA_Fox_Camp_Condition()
{
	if (Kapitel>=2)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Camp_Info()
{
	AI_Output (other, self, "DIA_Fox_Camp_15_01"); //Cavalorn powiedzia�, �e jeste� kwatermistrzem.
	AI_Output (self, other, "DIA_Fox_Camp_11_02"); //Ano jestem. Dbam o to, �eby nikomu z was nie zabrak�o �arcia ani onuc.
	AI_Output (other, self, "DIA_Fox_Camp_15_03"); //Cavalorn m�wi� co� o jakim� problemie...
	AI_Output (self, other, "DIA_Fox_Camp_11_04"); //Mam teraz pe�ne r�ce roboty, a trzeba poroznosi� �arcie.
	AI_Output (self, other, "DIA_Fox_Camp_11_05"); //Powinien si� tym zaj�� Snaf, w ko�cu to on gotuje ten cholerny gulasz...
	AI_Output (other, self, "DIA_Fox_Camp_15_06"); //Gulasz?
	AI_Output (self, other, "DIA_Fox_Camp_11_07"); //Tak, potrawka z mi�sa kretoszczur�w i cholera wie czego jeszcze.
	AI_Output (self, other, "DIA_Fox_Camp_11_08"); //Mam zapas tego paskudztwa w kufrze, w magazynku. Ale nie dam rady roznie�� potrawki.
	AI_Output (other, self, "DIA_Fox_Camp_15_09"); //Dobra, przesta� m�drkowa� bo Ci g�owa od tego spuchnie. Pomog� Ci z gulaszem.
	AI_Output (self, other, "DIA_Fox_Camp_11_10"); //Wiedzia�em, �e si� domy�lisz.
	AI_Output (self, other, "DIA_Fox_Camp_11_11"); //Przetrz��nij skrzyni� na zapleczu. Znajdziesz tam wystarczaj�c� ilo�� porcji gulaszu.
	AI_Output (self, other, "DIA_Fox_Camp_11_12"); //Rozdaj potrawk� ch�opakom w obozie. Jak sko�czysz, wr�� do mnie.
	AI_Output (other, self, "DIA_Fox_Camp_15_13"); //O to si� nie b�j. Przyda�by mi si� nowy pancerz.
	AI_Output (self, other, "DIA_Fox_Camp_11_14"); //Roznie� gulasz, to pogadamy o pancerzu.
	AI_Output (other, self, "DIA_Fox_Camp_15_15"); //Umowa stoi.
	
   B_LogEntry		(CH2_Rbl_RebelCampLife, "Fox zatrudni� mnie do roznoszenia gulaszu po obozie. Te� mi obowi�zki...");
	Log_CreateTopic	(CH2_Rbl_Food, LOG_MISSION);
	B_LogSetTopicStatus	(CH2_Rbl_Food, LOG_RUNNING);
	B_LogEntry		(CH2_Rbl_Food, "Fox poprosi� mnie o rozniesienie gulaszu po obozie. W zamian dostan� od niego jaki� pancerz. No nic, trzeba si� b�dzie troch� nachodzi�..."); 
	fox_stew = 0;
	Mob_CreateItems ("OR_SUPLIES", ItFo_Stew, 32);
	B_StopProcessInfos	( self );
};

INSTANCE DIA_Fox_Stew (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 13;
	condition		= DIA_Fox_Stew_Condition;
	information		= DIA_Fox_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozda�em gulasz."; 
};

FUNC INT DIA_Fox_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(fox_stew >= 25)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Stew_Info()
{
	AI_Output (other, self, "DIA_Fox_Stew_15_01"); //Rozda�em gulasz.
	
   if(fox_stew!=32)
	{
		AI_Output (self, other, "DIA_Fox_Stew_11_02"); //Rozdzieli�e� wszystkie porcje?
		AI_Output (other, self, "DIA_Fox_Stew_15_03"); //Chyba tak.	Obawiam si�, �e sko�czy si� to epidemi� sraczki w obozie.
		AI_Output (self, other, "DIA_Fox_Stew_11_04"); //Najwa�niejsze, �e si� tego pozby�e�.
		B_GiveXP(500);
	}
	else
	{
		B_GiveXP(500);		
		AI_Output (self, other, "DIA_Fox_Stew_11_05"); //Cholera i nikt Ci� nie obi�? �wietna robota!
	};
   
	AI_Output (other, self, "DIA_Fox_Stew_15_06"); //A co z pancerzem?
	AI_Output (self, other, "DIA_Fox_Stew_11_07"); //Jest Tw�j. Prawie nowy str�j rebelianta. Poprzedni w�a�ciciel niezbyt d�ugo si� nim cieszy�.
	AI_Output (other, self, "DIA_Fox_Stew_15_08"); //A co mu sie sta�o?
	AI_Output (self, other, "DIA_Fox_Stew_11_09"); //Ze�ar�y go wilki.
	AI_Output (self, other, "DIA_Fox_Stew_11_10"); //Porozmawiaj z Aidanem. Zdaje si�, �e te� przyda�aby si� mu pomoc.

	CreateInvItem		(self,			RBL_ARMOR_L);
	B_GiveInvItems		(self, other,	RBL_ARMOR_L, 1);
	AI_EquipArmor				(other, RBL_ARMOR_L);

	B_LogSetTopicStatus	(CH2_Rbl_Food, LOG_SUCCESS);
	B_LogEntry		(CH2_Rbl_Food, "Za rozniesienie gulaszu dosta�em str�j rebelianta. Nie wiem czy by�o warto..."); 
	B_LogEntry		(CH2_Rbl_RebelCampLife, "Pomog�em Foxowi w rozniesieniu gulaszu za co dosta�em lichy pancerz.");
	B_LogEntry		(CH2_Rbl_RebelCampLife, "Kwatermistrz powiedzia�, �ebym porozmawia� z Aidanem. Podobno kowal potrzebuje pomocy.");
};

INSTANCE DIA_FOX_Spy (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 13;
	condition		= DIA_FOX_Spy_Condition;
	information		= DIA_FOX_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak to jest by� kwatermistrzem rebeliant�w?"; 
};

FUNC INT DIA_FOX_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_FOX_Spy_Info()
{
	spy_count = spy_count + 1;
   
	AI_Output (other, self, "DIA_FOX_Spy_15_01"); //Jak to jest by� kwatermistrzem rebeliant�w?
	AI_Output (self, other, "DIA_FOX_Spy_11_02"); //A jak to jest by� piratem, h�?
	AI_Output (other, self, "DIA_FOX_Spy_15_03"); //Nigdy si� nad tym nie zastanawia�em...
	AI_Output (self, other, "DIA_FOX_Spy_11_04"); //Ani ja, wi�c daj sobie spok�j z takimi pytaniami.
	AI_Output (other, self, "DIA_FOX_Spy_15_05"); //A jak tu trafi�e�?
	AI_Output (self, other, "DIA_FOX_Spy_11_06"); //Powiedzmy, �e nie dano mi wyboru. Jasne?
	AI_Output (other, self, "DIA_FOX_Spy_15_07"); //Powiedzmy, �e tak.

	B_LogEntry		(CH2_Rbl_Spy, "Fox nie jest zbyt rozmowny. Nie zdradzi� jak trafi� do obozu, powiedzia� tylko, �e nie mia� wyboru. Ciekawe co mia� na my�li?");

	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od ciebie chcia�.
		B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_FOX_Spy1 (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 13;
	condition		= DIA_FOX_Spy1_Condition;
	information		= DIA_FOX_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ilu was pozosta�o?"; 
};

FUNC INT DIA_FOX_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_FOX_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_FOX_Spy1_15_01"); //Ilu was pozosta�o?
	AI_Output (self, other, "DIA_FOX_Spy1_11_02"); //Co masz na my�li?
	AI_Output (other, self, "DIA_FOX_Spy1_15_03"); //By�e� kurierem Mag�w. Z tego co wiem, nie mia�e� wyboru i musia�e� przysta� do Obozu Rebeliant�w.
	AI_Output (self, other, "DIA_FOX_Spy1_11_04"); //Sporo wiesz jak na kogo�, kto jest tu od niedawna.
	AI_Output (self, other, "DIA_FOX_Spy1_11_05"); //Rzeczywi�cie by�em kurierem mag�w. To by�a dobra posada.
	AI_Output (self, other, "DIA_FOX_Spy1_11_06"); //Jednak kiedy Gomez rozprawi� si� z magami ognia, wszystko si� spapra�o.
	AI_Output (self, other, "DIA_FOX_Spy1_11_07"); //W Starym Obozie nie mia�em czego szuka�, w Nowym te� za mn� nie przepadano, a o Sekcie wol� nie s�ysze�.
	AI_Output (self, other, "DIA_FOX_Spy1_11_08"); //Wtedy znalaz�em ob�z Cavalorna. Urz�dzi�em si� tutaj jak mog�em.
	AI_Output (other, self, "DIA_FOX_Spy1_15_09"); //W interesie kwatermistrza jest, �eby ob�z dobrze prosperowa�.
	AI_Output (self, other, "DIA_FOX_Spy1_11_10"); //Wiem co mam robi�. Nie chcesz mi chyba zarzuci� niegospodarno�ci?!
	AI_Output (other, self, "DIA_FOX_Spy1_15_11"); //Nie o tym m�wi�. Wydaje mi si�, �e jest tu kto�, kto d��y do czego� zupe�nie odmiennego.
	AI_Output (self, other, "DIA_FOX_Spy1_11_12"); //Hmm, parszywy wilk w stadzie? Je�eli dobrze Ci� zrozumia�em to uwa�asz, �e jest w�r�d nas zdrajca?
	AI_Output (other, self, "DIA_FOX_Spy1_15_13"); //Tak.
	AI_Output (self, other, "DIA_FOX_Spy1_11_14"); //Znam wszystkich z tego obozu, ale nikogo nie przy�apa�em na knuciu...
	AI_Output (self, other, "DIA_FOX_Spy1_11_15"); //Jedyne co mi zawsze nie pasowa�o to przybycie Twoje i Toniego.
	AI_Output (self, other, "DIA_FOX_Spy1_11_16"); //Co do Ciebie, to udowodni�e� ju�, �e warto Ci zaufa�.
	AI_Output (self, other, "DIA_FOX_Spy1_11_17"); //Co do Toniego, to nie zmieni�em zdania.
	AI_Output (other, self, "DIA_FOX_Spy1_15_18"); //Co masz na my�li?
	AI_Output (self, other, "DIA_FOX_Spy1_11_19"); //Tony nadal �mierdzi Starym Obozem. To tylko przeczucie, ale mu nie ufam.
	AI_Output (other, self, "DIA_FOX_Spy1_15_20"); //Dzi�ki, to mi wystarczy.
	B_LogEntry		(CH2_Rbl_Spy, "Fox nie przy�apa� nikogo z obozu na zdradzie. Jednak nie ufa Toniemu, ale to tylko jego przeczucia. Wola�bym dowod�w...");
	
	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta�, nie daj mu czeka�.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};

	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_RBL_2614_FOX_Stew (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 12;
	condition		= DIA_RBL_2614_FOX_Stew_Condition;
	information		= DIA_RBL_2614_FOX_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Porcja dla Ciebie."; 
};

FUNC INT DIA_RBL_2614_FOX_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2614_FOX_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_RBL_2614_FOX_Stew_15_01"); //Porcja dla Ciebie.
	AI_Output (self, other, "DIA_RBL_2614_FOX_Stew_11_02"); //Przesta�, przecie� tego nie da si� zje��.
	AI_Output (other, self, "DIA_RBL_2614_FOX_Stew_15_03"); //Mia�em roznie�� ka�demu troch� gulaszu, bez wyj�tk�w!
	AI_Output (self, other, "DIA_RBL_2614_FOX_Stew_11_04"); //No dobra, mo�e tym razem jako� to prze�kn�.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Fox mia� nadziej�, �e gulasz da si� zje��."); 
};

INSTANCE DIA_Fox_SpyKillEnd (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 16;
	condition		= DIA_Fox_SpyKillEnd_Condition;
	information		= DIA_Fox_SpyKillEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Fox_SpyKillEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Abel_SpyKillEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_SpyKillEnd_Info()
{
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_11"); //Sprawa wygl�da do�� oczywi�cie. Niech b�dzie G��bia.
   B_StopProcessInfos	(self);
};

INSTANCE DIA_Fox_Eqquipment (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 14;
	condition		= DIA_Fox_Eqquipment_Condition;
	information		= DIA_Fox_Eqquipment_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przyszed�em po wyposa�enie."; 
};

FUNC INT DIA_Fox_Eqquipment_Condition()
{
	if (other.guild == GIL_HUN)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Eqquipment_Info()
{
	AI_Output (other, self, "DIA_Fox_Eqquipment_15_01"); //Przyszed�em po wyposa�enie.
	AI_Output (self, other, "DIA_Fox_Eqquipment_11_02"); //Ale w Starej Kopalni by�a jatka! To dopiero by�a wyprawa, Gomeza pewnie krew zaleje, he, he.
	AI_Output (self, other, "DIA_Fox_Eqquipment_11_03"); //Dla Ciebie znajd� jaki� pancerz, ale nic za darmo...
	AI_Output (other, self, "DIA_Fox_Eqquipment_15_04"); //Po wyprawie do Starej Kopalni �atwo puszczaj� mi nerwy. Czasami trac� �wiadomo��, a po chwili wok� mnie walaj� si� por�bane cia�a...
	AI_Output (self, other, "DIA_Fox_Eqquipment_11_05"); //Eee, wiesz co? Potraktuj ten pancerz jako podarunek. Prezent od starego, dobrego Foxa.

	CreateInvItem(self, HUN_ARMOR_L);
	B_GiveInvItems(self, other, HUN_ARMOR_L, 1);
	AI_EquipArmor(other, HUN_ARMOR_L);
	AI_Output (other, self, "DIA_Fox_Eqquipment_15_06"); //B�d� o tym pami�ta�.

	B_eqquip_check();
   
	B_LogEntry(CH3_RBL_Choose, "Dosta�em od Foxa lepszy pancerz.");
};

//**************************************************

INSTANCE DIA_Fox_WeaponDev (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 15;
	condition		= DIA_Fox_WeaponDev_Condition;
	information		= DIA_Fox_WeaponDev_Info;
	permanent		= 0;
	important		= 0;
	description		= "Pomog� Ci z or�em."; 
};

FUNC INT DIA_Fox_WeaponDev_Condition()
{
	if (ratford_help == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_WeaponDev_Info()
{
	AI_Output (other, self, "DIA_Fox_WeaponDev_15_01"); //Pomog� Ci z or�em.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_02"); //Nie wiesz jak mnie to cieszy. Nogi mi ju� do dupy w�a�� od biegania po obozie.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_03"); //Przez ten cholerny atak nagle ka�dy przypomnia� sobie, �e czego� potrzebuje.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_04"); //Jakby wcze�niej nie mo�na by�o o tym pomy�le�!
	AI_Output (other, self, "DIA_Fox_WeaponDev_15_05"); //Dobra, m�w komu mam zanie�� bro� i miejmy to ju� za sob�.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_06"); //Zosta�o mi jeszcze kilku rebeliant�w.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_07"); //Quentin, Drax, R�czka i Cavalorn.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_08"); //Najwy�sza pora, �eby wymienili to swoje przerdzewia�e �elastwo.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_09"); //Oto miecze, pospiesz si� bo czasu mamy coraz mniej.
	CreateInvItems (self,HUN_MW_03,4); 
	B_GiveInvItems (self, other, HUN_MW_03, 4);
	B_LogEntry		(CH3_RBL_DelivWeapon, "Dosta�em od Foxa nowe miecza dla Quentina, Draxa, R�czki i Cavalorna. Nie ma na co czeka�, stra�nicy mog� uderzy� w ka�dej chwili.");
	B_StopProcessInfos	(self);
};

//**************************************************

INSTANCE DIA_Fox_WeaponDevback (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 16;
	condition		= DIA_Fox_WeaponDevback_Condition;
	information		= DIA_Fox_WeaponDevback_Info;
	permanent		= 0;
	important		= 0;
	description		= "Za�atwi�em spraw� z or�em."; 
};

FUNC INT DIA_Fox_WeaponDevback_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_NewWeapon))&&(Npc_KnowsInfo (hero, Info_Drax_NewSword))&&(Npc_KnowsInfo (hero, DIA_Fingers_NewSword))&&(cav_take == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_WeaponDevback_Info()
{
	others_help = others_help + 1;
	B_GiveXP(500);
   
	AI_Output (other, self, "DIA_Fox_WeaponDevback_15_01"); //Za�atwi�em spraw� z or�em.
	AI_Output (self, other, "DIA_Fox_WeaponDevback_11_02"); //Cavalorn te� wzi�� miecz?
	AI_Output (other, self, "DIA_Fox_WeaponDevback_15_03"); //Wzi�� cho� z oporami.
	AI_Output (self, other, "DIA_Fox_WeaponDevback_11_04"); //Ja nigdy bym go do tego nie nam�wi�. �wietna robota.
	AI_Output (self, other, "DIA_Fox_WeaponDevback_11_05"); //Nie mog� da� Ci nic w podzi�ce.
	AI_Output (other, self, "DIA_Fox_WeaponDevback_15_06"); //Dobra, czas ju� na mnie.
	
   Log_SetTopicStatus	(CH3_RBL_DelivWeapon, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_DelivWeapon, "Roznios�em wszystkie miecze. Fox jest mi wdzi�czny i to w sumie wszystko. Psuj� sobie reputacj�, robi�c zadania za darmo...");
}; 

INSTANCE DIA_Fox_Armor (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 16;
	condition		= DIA_Fox_Armor_Condition;
	information		= DIA_Fox_Armor_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz mo�e lepszy pancerz dla mnie?"; 
};

FUNC INT DIA_Fox_Armor_Condition()
{
	return C_IsChapter(4);
};

FUNC VOID DIA_Fox_Armor_Info()
{
	AI_Output (other, self, "DIA_Fox_Armor_15_01"); //Masz mo�e lepszy pancerz dla mnie?
	AI_Output (self, other, "DIA_Fox_Armor_11_02"); //Tak...
	AI_Output (other, self, "DIA_Fox_Armor_15_03"); //To daj mi go.
	AI_Output (self, other, "DIA_Fox_Armor_11_04"); //Hola, hola. Nie tak szybko! B�dziesz musia� za niego zap�aci�!
	AI_Output (other, self, "DIA_Fox_Armor_15_05"); //Mo�e przynios� ci kilka konfitur i za�atwimy t� spraw�?
   AI_Output (self, other, "DIA_Fox_Armor_11_06"); //KONFITURY!!! NIE, nie nam�wisz mnie! Nie mog� tak rozdawa� pancerzy.
   AI_Output (self, other, "DIA_Fox_Armor_11_07"); //Musisz zap�aci�. Ale warte s� swojej ceny. Obejrzyj je sobie.
	AI_Output (other, self, "DIA_Fox_Armor_15_08"); //Zobaczmy...
}; 

var int buy_HUN_ARMOR_M;
var int buy_HUN_ARMOR_H;
var int buy_HUN_ARMOR_H2;

instance RBL_2614_FOX_HUN_ARMOR_M (C_INFO)
{
	npc				= RBL_2614_FOX;
   nr				   = 900;
	condition		= RBL_2614_FOX_HUN_ARMOR_M_Condition;
	information		= RBL_2614_FOX_HUN_ARMOR_M_Info;
	important		= 0;
	permanent		= 1;
   description = B_BuildBuyArmorString(NAME_MiddleHunterArmor, VALUE_HUN_ARMOR_M);
};

FUNC int RBL_2614_FOX_HUN_ARMOR_M_Condition()
{	
	if Npc_KnowsInfo(hero, DIA_Fox_Armor) && (!buy_HUN_ARMOR_M)
	{
      return 1;
	};
};

func void RBL_2614_FOX_HUN_ARMOR_M_Info()
{
   AI_Output(other, self,"RBL_2614_FOX_BuyArmorAtFox_15_01"); //Chcia�bym kupi� zbroj�.
   
	if (Npc_HasItems(hero, itminugget)>= HUN_ARMOR_M.value)
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFox_08_02"); //Prosz�, mam nadziej�, �e b�dziesz z niej zadowolony!		
		CreateInvItem (hero, HUN_ARMOR_M);	
		Npc_RemoveInvItems (hero, ItMiNugget, HUN_ARMOR_M.value); 
		AI_EquipArmor(hero, HUN_ARMOR_M);
      buy_HUN_ARMOR_M = true;
	}
	else
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFoxRefused_07_03"); //Nie masz wystarczaj�cej ilo�ci rudy, a ja nie mog� robi� tak hojnych prezent�w!
	};

	B_StopProcessInfos(self);
};

instance RBL_2614_FOX_HUN_ARMOR_H (C_INFO)
{
	npc				= RBL_2614_FOX;
   nr				   = 900;
	condition		= RBL_2614_FOX_HUN_ARMOR_H_Condition;
	information		= RBL_2614_FOX_HUN_ARMOR_H_Info;
	important		= 0;
	permanent		= 1;
   description = B_BuildBuyArmorString(NAME_HeavyHunterArmor, VALUE_HUN_ARMOR_H);
};

FUNC int RBL_2614_FOX_HUN_ARMOR_H_Condition()
{	
	if Npc_KnowsInfo(hero, DIA_Fox_Armor) && (!buy_HUN_ARMOR_H)
	{
      return 1;
	};
};

func void RBL_2614_FOX_HUN_ARMOR_H_Info()
{      
   AI_Output(other, self,"RBL_2614_FOX_BuyArmorAtFox_15_01"); //Chcia�bym kupi� zbroj�.
   
	if (Npc_HasItems(hero, itminugget)>= HUN_ARMOR_H.value)
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFox_08_02"); //Prosz�, mam nadziej�, �e b�dziesz z niej zadowolony!		
		CreateInvItem (hero, HUN_ARMOR_H);	
		Npc_RemoveInvItems (hero, ItMiNugget, HUN_ARMOR_H.value); 
		AI_EquipArmor(hero, HUN_ARMOR_H);
      buy_HUN_ARMOR_H = true;
	}
	else
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFoxRefused_07_03"); //Nie masz wystarczaj�cej ilo�ci rudy, a ja nie mog� robi� tak hojnych prezent�w!
	};

	B_StopProcessInfos(self);
};

instance RBL_2614_FOX_Improved_HUN_ARMOR_H (C_INFO)
{
	npc				= RBL_2614_FOX;
   nr				   = 900;
	condition		= RBL_2614_FOX_Improved_HUN_ARMOR_H_Condition;
	information		= RBL_2614_FOX_Improved_HUN_ARMOR_H_Info;
	important		= 0;
	permanent		= 1;
   description = B_BuildBuyArmorString(NAME_ImprovedHeavyHunterArmor, VALUE_HUN_ARMOR_H2);
};

FUNC int RBL_2614_FOX_Improved_HUN_ARMOR_H_Condition()
{	
	if Npc_KnowsInfo(hero, DIA_Fox_Armor) && (!buy_HUN_ARMOR_H2)
	{
      return 1;
	};
};

func void RBL_2614_FOX_Improved_HUN_ARMOR_H_Info()
{   
   AI_Output(other, self,"RBL_2614_FOX_BuyArmorAtFox_15_01"); //Chcia�bym kupi� zbroj�.
   
	if (Npc_HasItems(hero, itminugget)>= HUN_ARMOR_H2.value)
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFox_08_02"); //Prosz�, mam nadziej�, �e b�dziesz z niej zadowolony!		
		CreateInvItem (hero, HUN_ARMOR_H2);	
		Npc_RemoveInvItems (hero, ItMiNugget, HUN_ARMOR_H2.value); 
		AI_EquipArmor(hero, HUN_ARMOR_H2);
      buy_HUN_ARMOR_H2 = true;
	}
	else
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFoxRefused_07_03"); //Nie masz wystarczaj�cej ilo�ci rudy, a ja nie mog� robi� tak hojnych prezent�w!
	};

	B_StopProcessInfos(self);
};
