// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Gestath_Exit (C_INFO)
{
	npc			= HUN_2609_GESTATH;
	nr			= 999;
	condition	= DIA_Gestath_Exit_Condition;
	information	= DIA_Gestath_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gestath_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Gestath_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

var int gestath_y;
var int gestath_n;

INSTANCE DIA_Gestath_Hello (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 1;
	condition		= DIA_Gestath_Hello_Condition;
	information		= DIA_Gestath_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Gestath_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Gestath_Hello_Info()
{
	AI_Output (self, other, "DIA_Gestath_Hello_11_01"); //Kim Ty do cholery jeste� i co tutaj robisz?
	AI_Output (other, self, "DIA_Gestath_Hello_15_02"); //M�g�bym zapyta� o to samo.
	AI_Output (self, other, "DIA_Gestath_Hello_11_03"); //Masz szcz�cie, �e mam mocne nerwy i nie pu�ci�em ci�ciwy. Czego tu szukasz?
	AI_Output (other, self, "DIA_Gestath_Hello_15_04"); //Zwiedzam...
	AI_Output (self, other, "DIA_Gestath_Hello_11_05"); //Wybra�e� niezbyt fortunne miejsce na przechadzk�.
	AI_Output (self, other, "DIA_Gestath_Hello_11_06"); //Jestem Gestath, my�liwy. Jaki� czas pracowa�em dla Gomeza.
	AI_Output (self, other, "DIA_Gestath_Hello_11_07"); //Ale od niedawna poluj� na w�asny rachunek.
	AI_Output (other, self, "DIA_Gestath_Hello_15_08"); //Nale�ysz do Starego Obozu? Je�eli tak...
   
	AI_DrawWeapon (self);
   AI_DrawWeapon (other);
   
	AI_Output (self, other, "DIA_Gestath_Hello_11_09"); //Spokojnie. Schowaj �elastwo, zanim komu� stanie si� krzywda.
	AI_Output (self, other, "DIA_Gestath_Hello_11_10"); //Ju� nie pracuj� dla Gomeza. 
   
   AI_RemoveWeapon (other);
	AI_RemoveWeapon (self);
   
	AI_Output (other, self, "DIA_Gestath_Hello_15_11"); //M�g�by� m�wi� ja�niej?
	AI_Output (self, other, "DIA_Gestath_Hello_11_12"); //Czemu nie, mam teraz sporo wolnego czasu.
	AI_Output (self, other, "DIA_Gestath_Hello_11_13"); //Trafi�em do Kolonii w poszukiwaniu brata.
	AI_Output (other, self, "DIA_Gestath_Hello_15_14"); //Brata? Czy ja dobrze zrozumia�em? Da�e� wtr�ci� si� za barier�, �eby znale�� brata?!
	AI_Output (self, other, "DIA_Gestath_Hello_11_15"); //Tak. By�em mu to winien. 
	AI_Output (self, other, "DIA_Gestath_Hello_11_16"); //Widzisz. Jaki� czas temu polowali�my razem w kr�lewskich lasach.
	AI_Output (other, self, "DIA_Gestath_Hello_15_17"); //Chcia�e� powiedzie�, �e k�usowali�cie.
	AI_Output (self, other, "DIA_Gestath_Hello_11_18"); //Jak zwa�, tak zwa�. Mniejsza o semantyk�.
	AI_Output (self, other, "DIA_Gestath_Hello_11_19"); //Nie polowali�my jednak na byle co.
	AI_Output (self, other, "DIA_Gestath_Hello_11_20"); //S�ysza�e� kiedy� o lodowym trollu?
	AI_Output (other, self, "DIA_Gestath_Hello_15_21"); //Nie, nigdy.
	AI_Output (self, other, "DIA_Gestath_Hello_11_22"); //Bo ma�o kto o tym stworzeniu s�ysza�. Ja te� zawsze uwa�a�em t� besti� za wymys� bard�w.
	AI_Output (self, other, "DIA_Gestath_Hello_11_23"); //Jednak lodowe trolle �yj�. I uwierz mi, �e czarny troll przy nim, to niegro�ny szczeniaczek.
	AI_Output (other, self, "DIA_Gestath_Hello_15_24"); //M�w dalej.
	AI_Output (self, other, "DIA_Gestath_Hello_11_25"); //Dowiedzieli�my si�, �e jedna z tych bestii spustoszy�a kilka wiosek u podn�a g�r. Ruszyli�my na �owy.
	AI_Output (self, other, "DIA_Gestath_Hello_11_26"); //Jednak do zabicia takiego cholerstwa potrzeba specjalnej broni i specjalnej amunicji.
	AI_Output (self, other, "DIA_Gestath_Hello_11_27"); //Szukali�my czarnodrzewa na �uk i kr�lewskiej harpii na pi�ra do brzechwy.
	AI_Output (self, other, "DIA_Gestath_Hello_11_28"); //Niestety kr�lewskie harpie �yj� tylko w kr�lewskim lesie, a do tego s� oczkiem w g�owie Rhobara.
	AI_Output (self, other, "DIA_Gestath_Hello_11_29"); //Kr�l uwielbia na nie polowa�, co trzeba przyzna�, jest do�� niebezpiecznym zaj�ciem.
	AI_Output (self, other, "DIA_Gestath_Hello_11_30"); //Mieli�my pecha, bo kiedy po�o�yli�my dwie harpie, napatoczy� si� kr�lewski �owczy. 
	AI_Output (self, other, "DIA_Gestath_Hello_11_31"); //Ja zdo�a�em skoczy� z grani, ale Cavalorn zosta�. Jestem pewien, �e te� m�g�by da� nog�, ale ten idiota chcia� da� mi szans� na ucieczk�.
	AI_Output (other, self, "DIA_Gestath_Hello_15_32"); //Cavalorn? To tw�j brat?
	AI_Output (self, other, "DIA_Gestath_Hello_11_33"); //Tak. Mo�e go znasz?
	AI_Output (other, self, "DIA_Gestath_Hello_15_34"); //Kto wie. M�w dalej, to zaczyna si� robi� coraz ciekawsze.
	AI_Output (self, other, "DIA_Gestath_Hello_11_35"); //Brat nie wyda� mnie. Wzi�� ca�� win� na siebie. 
	AI_Output (self, other, "DIA_Gestath_Hello_11_36"); //Troch� czasu zaj�o mi wywiedzenie si�, gdzie go wys�ali. 
	AI_Output (self, other, "DIA_Gestath_Hello_11_37"); //Sprzeda�em ca�y dobytek na �ap�wki, ale by�o warto.
	AI_Output (self, other, "DIA_Gestath_Hello_11_38"); //W ko�cu dowiedzia�em si�, �e zosta� zes�any do Kolonii Karnej na wyspie Khorinis.
	AI_Output (self, other, "DIA_Gestath_Hello_11_39"); //Problem tkwi� w tym, �e okr�ty handlowe ju� nie p�ywa�y do Khorinis. Wszyscy bali si� ork�w.
	AI_Output (self, other, "DIA_Gestath_Hello_11_40"); //Moj� jedyn� szans� by�a galera ze skaza�cami.
	AI_Output (self, other, "DIA_Gestath_Hello_11_41"); //Prawie wszyscy skazani za wi�ksze przewinienia trafiali do Kolonii, bo kr�l potrzebowa� rudy.
	AI_Output (self, other, "DIA_Gestath_Hello_11_42"); //Nie mia�em nic do stracenia.
	AI_Output (self, other, "DIA_Gestath_Hello_11_43"); //Pod okiem �owczego zaciuka�em kr�lewsk� harpi�. Do tego ubi�em te� konia pod samym Rhobarem!
	AI_Output (self, other, "DIA_Gestath_Hello_11_44"); //Ma�o tego nie przep�aci�em g�ow�.
	AI_Output (self, other, "DIA_Gestath_Hello_11_45"); //Na szcz�cie kr�l doceni� m�j strza� - trafi�em harpi� w oko ze stu krok�w!
	AI_Output (self, other, "DIA_Gestath_Hello_11_46"); //Dosta�em bilet w jedn� stron� do Kolonii Karnej i tak si� tu znalaz�em.
	AI_Output (self, other, "DIA_Gestath_Hello_11_47"); //Kiedy trafi�em do Starego Obozu zacz��em wypytywa� o Cavalorna. W mi�dzyczasie wykona�em kilka zlece� dla Gomeza.
	AI_Output (self, other, "DIA_Gestath_Hello_11_48"); //Cieniostwory, z�bacze, trolle. Troch� z tego co upolowa�em, powinno jeszcze znajdowa� si� w skrzyniach ukrytych w wie�y zamkowej.
	AI_Output (self, other, "DIA_Gestath_Hello_11_49"); //Niestety mia�em pecha. Gomezowi odbi�o i zabi� mag�w ognia. 
	AI_Output (self, other, "DIA_Gestath_Hello_11_50"); //Z�orzeczy� te� na jakiego� Bezimiennego sukinsyna.
	AI_Output (self, other, "DIA_Gestath_Hello_11_51"); //A ja po cichu ulotni�em si� ze Starego Obozu.
	AI_Output (self, other, "DIA_Gestath_Hello_11_52"); //Mia�em w�a�nie na nowo rozpocz�� poszukiwania brata, kiedy zjawi�e� si� Ty.
	AI_Output (other, self, "DIA_Gestath_Hello_15_53"); //I dobrze si� sta�o. Wiem, gdzie obozuje Cavalorn.
	AI_Output (self, other, "DIA_Gestath_Hello_11_54"); //Co?! M�w! Gdzie jest m�j brat?!
	AI_Output (other, self, "DIA_Gestath_Hello_15_55"); //Przewodzi obozowi rebeliant�w. M�wi ci to co�?
	AI_Output (self, other, "DIA_Gestath_Hello_11_56"); //Tak. Gomez co� przeb�kiwa� o tych rebeliantach. Ale zdaje si�, �e nie traktowa� ich powa�nie.
	AI_Output (other, self, "DIA_Gestath_Hello_15_57"); //W�a�nie teraz ob�z rebeliant�w przygotowuje si� do odparcia ataku stra�nik�w.
	AI_Output (self, other, "DIA_Gestath_Hello_11_58"); //W takim razie nie mo�e mnie tam zabrakn��! Prowad�.
	
   if (q_y==TRUE)
	{
		AI_Output (other, self, "DIA_Gestath_Hello_15_59"); //Cavalornowi przyda si� ka�da pomoc. Kto� z twoimi umiej�tno�ciami b�dzie cennym 'nabytkiem' dla obozu.	
		AI_Output (other, self, "DIA_Gestath_Hello_15_60"); //Poza tym to Tw�j brat...
	};
   
	AI_Output (self, other, "DIA_Gestath_Hello_11_61"); //Albo poczekaj...
	AI_Output (self, other, "DIA_Gestath_Hello_11_62"); //Nie chc� przywita� brata z pustymi r�kami.
	AI_Output (other, self, "DIA_Gestath_Hello_15_63"); //Co masz na my�li?
	AI_Output (self, other, "DIA_Gestath_Hello_11_64"); //Dam mu w prezencie pi�ra harpii! Przednia my�l!
	AI_Output (self, other, "DIA_Gestath_Hello_11_65"); //W ko�cu to przez te bestyjki oboje znale�li�my si� w Kolonii Karnej.
	AI_Output (self, other, "DIA_Gestath_Hello_11_66"); //Co do samego polowania to mam dla Ciebie propozycj�.
	AI_Output (self, other, "DIA_Gestath_Hello_11_67"); //Zwabisz tu kilka z tych paskudztw, a ja uwolni� �wiat od ich skrzeku.
	AI_Output (other, self, "DIA_Gestath_Hello_15_68"); //Nie wiem, czy to taki dobry pomys�. Ty b�dziesz tu sobie spokojnie czeka�, a ja mam robi� za przyn�t�...
	AI_Output (self, other, "DIA_Gestath_Hello_11_69"); //Bez obaw. Te harpie s� o po�ow� mniejsze od kr�lewskich. Do tego wygl�daj� na wychudzone.
	AI_Output (self, other, "DIA_Gestath_Hello_11_70"); //Niedaleko jest cytadela. Widzia�em tam kilkana�cie harpii. Wystarczy, �e zwabisz tu kilka z tych bestii.
	AI_Output (self, other, "DIA_Gestath_Hello_11_71"); //Co Ty na to?

	Info_ClearChoices (DIA_Gestath_Hello);
	Info_AddChoice (DIA_Gestath_Hello, "Niech b�dzie.", DIA_Gestath_Hello_Yes);
	Info_AddChoice (DIA_Gestath_Hello, "Dzi�ki, ale nie skorzystam.", DIA_Gestath_Hello_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Gestath_Hello_Yes()
{
	gestath_y = TRUE;
   
	AI_Output (other, self, "DIA_Gestath_Hello_Yes_15_01"); //Niech b�dzie.
	AI_Output (self, other, "DIA_Gestath_Hello_Yes_11_02"); //To ruszaj do cytadeli.
	AI_Output (self, other, "DIA_Gestath_Hello_Yes_11_03"); //Zwab tu kilka z tych bestii.
	AI_Output (self, other, "DIA_Gestath_Hello_Yes_11_04"); //Jak z nimi sko�cz�, to zaprowadzisz mnie do Cavalorna. 
   
	Log_CreateTopic(CH1_Rbl_Harpies, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Harpies, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Harpies, "Dziwna historia. Spotka�em my�liwego o imieniu Gestath. Okaz�o si�, �e jest bratem Cavalorna i trafi� tu z poczucia winy. Niewa�ne... W ka�dym razie Gestath chce pom�c bratu w walce ze stra�nikami. Nie chce jednak i�� z pustymi r�kami. Ubzdura� sobie, �e da Cavalornowi w prezencie pi�ra harpii, a ja mam mu w tym pom�c, zwabiaj�c kilka z nich do kryj�wki my�liwego. No mam nadziej�, �e one nie lataj� za szybko...");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAITFORHARPIES");
};

// ------------------No----------------

FUNC VOID DIA_Gestath_Hello_No()
{
	gestath_n = TRUE;
   
	AI_Output (other, self, "DIA_Gestath_Hello_No_15_01"); //Dzi�ki, ale raczej nie skorzystam.
	AI_Output (self, other, "DIA_Gestath_Hello_No_11_02"); //Cholera! Nie chc� powita� brata bez prezentu.
	AI_Output (self, other, "DIA_Gestath_Hello_No_11_03"); //Wr��, jak zmienisz zdanie.
	B_StopProcessInfos(self);
};

INSTANCE DIA_Gestath_CanYouTeachMe (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 4;
	condition		= DIA_Gestath_CanYouTeachMe_Condition;
	information		= DIA_Gestath_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Gestath_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gestath_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Gestath_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Gestath_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
   AI_Output (self, other, "DIA_Gestath_CanYouTeachMe_15_02"); //Tak, w ko�cu jestem my�liwym. Czego konkretnie chcia�by� si� nauczy�?
      
   Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
   B_LogEntry(GE_TeacherOW, "Gestath jest my�liwym, wi�c mog� si� od niego wiele nauczy�.");
};

INSTANCE DIA_Gestath_HelloAgain (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 2;
	condition		= DIA_Gestath_HelloAgain_Condition;
	information		= DIA_Gestath_HelloAgain_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zmieni�em zdanie."; 
};

FUNC INT DIA_Gestath_HelloAgain_Condition()
{
	if (gestath_n == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Gestath_HelloAgain_Info()
{
	gestath_y = TRUE;
   
	AI_Output (other, self, "DIA_Gestath_HelloAgain_Yes_15_01"); //Zmieni�em zdanie.
	AI_Output (self, other, "DIA_Gestath_HelloAgain_Yes_11_02"); //To �wietnie. W takim razie ruszaj do cytadeli.
	AI_Output (self, other, "DIA_Gestath_HelloAgain_Yes_11_03"); //Zwab tu kilka harpii.
	AI_Output (self, other, "DIA_Gestath_HelloAgain_Yes_11_04"); //Jak z nimi sko�cz�, to zaprowadzisz mnie do Cavalorna. 
	Log_CreateTopic(CH1_Rbl_Harpies, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Harpies, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Harpies, "Dziwna historia. Spotka�em my�liwego o imieniu Gestath. Okaz�o si�, �e jest bratem Cavalorna i trafi� tu z poczucia winy. Niewa�ne... W ka�dym razie Gestath chce pom�c bratu w walce ze stra�nikami. Nie chce jednak i�� z pustymi r�kami. Ubzdura� sobie, �e da Cavalornowi w prezencie pi�ra harpii, a ja mam mu w tym pom�c, zwabiaj�c kilka z nich do kryj�wki my�liwego. No mam nadziej�, �e one nie lataj� za szybko...");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT4HARPIES");
};

INSTANCE DIA_Gestath_HarpKill (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 3;
	condition		= DIA_Gestath_HarpKill_Condition;
	information		= DIA_Gestath_HarpKill_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Gestath_HarpKill_Condition()
{
	if (gestath_y == TRUE)&&(Npc_IsDead(harp1))&&(Npc_IsDead(harp2))&&(Npc_IsDead(harp3))&&(Npc_IsDead(harp4))&&(Npc_IsDead(harp5))
	{
		return 1;
	};
};

FUNC VOID DIA_Gestath_HarpKill_Info()
{
	B_GiveXP(250);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Gestath_HarpKill_11_01"); //�wietna robota, wszystkie harpie s� martwe!
	AI_Output (self, other,"DIA_Gestath_HarpKill_11_02"); //Zas�u�y�e� na �uk. Oto recepta.
   
	CreateInvItems (self, Recept_ItRw_Bow_Long_04,1); //recepta na �uk czy �uk?
	B_GiveInvItems (self, other, Recept_ItRw_Bow_Long_04, 1);//jw
   
	AI_Output (other, self,"DIA_Gestath_HarpKill_15_03"); //Na szcz�cie szybko biegam. 
	Log_SetTopicStatus(CH1_Rbl_Harpies, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Harpies, "Polowanie na harpie zako�czone, strat w�asny brak! Gestath da� mi recept� na niez�y �uk.");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Gestath_Go (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 4;
	condition		= DIA_Gestath_Go_Condition;
	information		= DIA_Gestath_Go_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ruszajmy do Obozu Rebeliant�w."; 
};

FUNC INT DIA_Gestath_Go_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gestath_HarpKill))&&(q_y==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Gestath_Go_Info()
{
	B_GiveXP(100);
   
	AI_Output (other, self,"DIA_Gestath_Go_15_01"); //Ruszajmy do Obozu Rebeliant�w.
	AI_Output (self, other,"DIA_Gestath_Go_11_02"); //Prowad�. Ju� nie mog� doczeka� si� spotkania z bratem!
   
	B_LogEntry(CH1_Rbl_NewMembers, "Zgodzi�em si� zaprowadzi� Gestatha do Obozu Rebeliant�w.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Gestath_GoOut (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 5;
	condition		= DIA_Gestath_GoOut_Condition;
	information		= DIA_Gestath_GoOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Gestath_GoOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gestath_Go))&&((Npc_GetDistToWP (self,"MOVEMENT_TALL_PATH_BANDITOS2") < 550 )||(Npc_GetDistToWP (self,"PATH_OC_NC_11") < 550 )||(Npc_GetDistToWP (self,"HC_WARRIOR16") < 550 ))
	{
		return 1;
	};
};

FUNC VOID DIA_Gestath_GoOut_Info()
{
	gestath_trust = TRUE;
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(200);
   
	AI_Output (other, self,"DIA_Gestath_GoOut_15_01"); //Jeste�my na miejscu. Cavalorna znajdziesz w centrum obozowiska.
	AI_Output (self, other,"DIA_Gestath_GoOut_11_02"); //Dzi�ki przyjacielu. Nie zapomn� Ci tego.
	AI_Output (self, other,"DIA_Gestath_GoOut_11_03"); //Mamy z bratem tyle do nadrobienia...
   
	B_LogEntry(CH1_Rbl_NewMembers, "Doprowadzi�em Gestatha do obozu.");
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"OR");
	B_ExchangeRoutine	(hun_336_cavalorn,"GestathIn");	
	B_StopProcessInfos(self);
	Know_Gestath=TRUE;
};

// **************************************************

INSTANCE DIA_HUN_2609_GESTATH_Stew (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 12;
	condition		= DIA_HUN_2609_GESTATH_Stew_Condition;
	information		= DIA_HUN_2609_GESTATH_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie porcj� gulaszu."; 
};

FUNC INT DIA_HUN_2609_GESTATH_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_2609_GESTATH_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_HUN_2609_GESTATH_Stew_15_01"); //Spr�buj gulaszu Snafa, w dziczy nie jad�e� takich... specja��w.
	AI_Output (self, other, "DIA_HUN_2609_GESTATH_Stew_11_02"); //Dzi�ki przyjacielu, z ch�ci� wrzuc� co� na z�b.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Gestath bez opor�w zjad� gulasz."); 
};
