//Exit in traders func's

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Leren_Hello (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 1;
	condition		= DIA_Leren_Hello_Condition;
	information		= DIA_Leren_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_Hello_Condition()
{
// Ork: Tak mi sie przypomnia�a ta rozmowa wyskakuj�ca w nieodpowiednim miejscu, w
// nie odpowiednim czasie co skonczy�o si� zmian� Rutyny i rozkurwieniem gry w pi�dzie� :P
// *mam nadzieje ze to odp. WP (TODO / do sprawdzenia) i w miare dobry dystans
	if(Npc_GetDistToPlayer(self) < 200 && Npc_GetDistToWP(self,"WAY_PATHMAGE") < 1900)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Hello_Info()
{
	AI_Output (self, other, "DIA_Leren_Hello_11_00"); //Kolejny �mierdz�cy szczur szukaj�cy szcz�cia!
	AI_Output (other, self, "DIA_Leren_Hello_15_01"); //Nie jestem...
	AI_Output (self, other, "DIA_Leren_Hello_11_02"); //Zejd� mi z oczu, z�odzieju!
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"start");
	Npc_ExchangeRoutine(baalparvez,"start");
};

// **************************************************

INSTANCE DIA_Leren_Mag (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 2;
	condition		= DIA_Leren_Mag_Condition;
	information		= DIA_Leren_Mag_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jeste� magiem?"; 
};

FUNC INT DIA_Leren_Mag_Condition()
{
	if (CAVALORN_ASK_TRAIL==2)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Mag_Info()
{
	AI_Output (other, self, "DIA_Leren_Mag_15_01"); //Jeste� magiem?
	AI_Output (self, other, "DIA_Leren_Mag_11_02"); //Jak na to wpad�e�? Kolejny dure�, kt�ry traci m�j bezcenny czas.
	AI_Output (other, self, "DIA_Leren_Mag_15_03"); //Mog� Ci pom�c.
	AI_Output (self, other, "DIA_Leren_Mag_11_04"); //Ty? A niby w czym?
	AI_Output (other, self, "DIA_Leren_Mag_15_05"); //Jeste�my w Kolonii, a tutaj ka�dy mniej lub bardziej potrzebuje czyjej� pomocy. No wiesz, 'przynie�, zabij, spal, zgwa��' i takie tam.
	AI_Output (self, other, "DIA_Leren_Mag_11_06"); //Hmm, mo�e jednak warto po�wi�ci� Ci chwilk�.
	AI_Output (self, other, "DIA_Leren_Mag_11_07"); //A czego ��dasz w zamian?
	AI_Output (other, self, "DIA_Leren_Mag_15_08"); //Podzielisz si� ze mn� swoj� wiedz�. Chc� pozna� arkana magii.
	AI_Output (self, other, "DIA_Leren_Mag_11_09"); //Jednak jeste� g�upcem! Nie ka�dy mo�e zosta� magiem. My�lisz, �e to takie proste? Formu�ka i bach kula ognia!
	AI_Output (self, other, "DIA_Leren_Mag_11_10"); //To lata zg��biania tajemnej wiedzy, medytacja, ofiary po�wi�cone bogom, pr�by cia�a jak i ducha, droga do doskona�o�ci, a w ko�cu...
	AI_Output (other, self, "DIA_Leren_Mag_15_11"); //Przesta� pieprzy�. Wszystkiego mo�na si� nauczy�, r�wnie dobrze mo�e to by� robienie lewatywy, co rzucenie kuli ognia. 
	AI_Output (other, self, "DIA_Leren_Mag_15_12"); //Wszystko zale�y od motywacji i determinacji, a mi nie brakuje jednego ani drugiego. Wi�c jak b�dzie?
	AI_Output (self, other, "DIA_Leren_Mag_11_13"); //No dobra, naucz� Ci� kilku sztuczek, ale najpierw co� dla mnie zrobisz.
	AI_Output (other, self, "DIA_Leren_Mag_15_14"); //W�a�nie po to tu jestem.
	AI_Output (self, other, "DIA_Leren_Mag_11_15"); //Widzisz, jestem naukowcem, wizjonerem i kolekcjonerem.
	AI_Output (self, other, "DIA_Leren_Mag_11_16"); //Od zawsze fascynowa�y mnie przedmioty po�wi�cone bogom, emanuj�ce moc�, naznaczone magi�...
	AI_Output (other, self, "DIA_Leren_Mag_15_17"); //Czyli artefakty. Mo�e i jestem piratem, ale nie jestem idiot�.
	AI_Output (self, other, "DIA_Leren_Mag_11_18"); //Tak, artefakty. Tak si� sk�ada, �e wyczu�em aur� takiego przedmiotu w �wi�tyni ork�w.
	AI_Output (other, self, "DIA_Leren_Mag_15_19"); //Ju� powiedzia�em, �e nie jestem idiot�. Nie p�jd� po jakie� �wiecide�ko do �wi�tyni pe�nej ork�w.
	AI_Output (self, other, "DIA_Leren_Mag_11_20"); //Ale tam ju� od dawna ich nie ma. To stara, zrujnowana �wi�tynia. Cuchnie �mierci� i szczurzymi odchodami. Poczujesz si� tam jak w domu.
	AI_Output (self, other, "DIA_Leren_Mag_11_21"); //Znajdziesz tam przedmiot o pot�nej aurze, ale nie mo�esz go u�y�! Przynie� go do mnie, to dobijemy targu.
	
   if (mag_knows == FALSE)
	{
		mag_knows = TRUE;
		Log_CreateTopic(CH2_RBL_Magic, LOG_MISSION);
		Log_SetTopicStatus(CH2_RBL_Magic, LOG_RUNNING);
	};
		
   B_LogEntry(CH2_RBL_Magic, "Leren nauczy mnie kilku magicznych sztuczek, je�eli przynios� mu jaki� magiczny artefakt ze zrujnowanej �wi�tyni ork�w.");
   B_StopProcessInfos(self);
};

// **************************************************
INSTANCE DIA_Leren_CanYouTeachMe (C_INFO)
{
	npc				=  mag_1604_Leren;
	nr				= 4;
	condition		= DIA_Leren_CanYouTeachMe_Condition;
	information		= DIA_Leren_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Leren_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Leren_Mag))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Leren_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
   AI_Output (self, other, "DIA_Leren_CanYouTeachMe_15_02"); //Mog� nauczy� ci�, jak zwi�kszy� duchow� si�� i jak regenerowa� man�. 
   AI_Output (self, other, "DIA_Leren_CanYouTeachMe_15_03"); //Kiedy zostaniesz magiem, przeka�� ci wiedz� dotycz�c� pi�ciu kr�g�w.
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Leren mo�e mi pom�c zwi�kszy� man� i j� zregenerowa�. Jak zostan� magiem, to nauczy mnie te� magicznych sztuczek.");
};

INSTANCE DIA_Leren_Mag1 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 3;
	condition		= DIA_Leren_Mag1_Condition;
	information		= DIA_Leren_Mag1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, p�jd� do tej �wi�tyni."; 
};

FUNC INT DIA_Leren_Mag1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Mag))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Mag1_Info()
{
	AI_Output (other, self, "DIA_Leren_Mag1_15_01"); //Dobra, p�jd� do tej �wi�tyni.
	AI_Output (self, other, "DIA_Leren_Mag1_11_02"); //Wiedzia�em, �e znajdziesz w sobie wystarczaj�ca odwag�, aby...
	AI_Output (other, self, "DIA_Leren_Mag1_15_03"); //Daruj sobie. Gdzie ta kupa gruzu?
	
	//orc-edytowany dialog, swiatynia jest blisko wiec Leren tlumaczy tylko jak dotrzec
	AI_Output (self, other, "DIA_Leren_Mag1_11_04"); //�wi�tynia znajduj� si� niedaleko.
	AI_Output (self, other, "DIA_Leren_Mag1_11_05");//Przejd� pod mostem, omi� zagrod� Snafa i id� ca�y czas na wprost. Dotrzesz do dawnej orkowej areny. 
	AI_Output (self, other, "DIA_Leren_Mag1_11_06"); //Tam znajdziesz artefakt.
	AI_Output (other, self, "DIA_Leren_Mag1_15_07"); //Komu w drog� temu czas.

	Wld_insertItem(ItArArifact_01, "WP_ORNAMENT");

	Log_CreateTopic(CH2_RBL_Artefact, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Artefact, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Artefact, "Leren wskaza� mi drog� do �wi�tyni ork�w. Mam tam odnale�� jaki� artefakt i przynie�� go magowi. Powinno p�j�� do�� �atwo, o ile tam faktycznie nie ma �ywych ork�w.");
};

// **************************************************

INSTANCE DIA_Leren_Mag2 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 3;
	condition		= DIA_Leren_Mag2_Condition;
	information		= DIA_Leren_Mag2_Info;
	permanent		= 0;
	important		= 0;
	description		= "To ten artefakt?"; 
};

FUNC INT DIA_Leren_Mag2_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Mag1))&&(NPC_HasItems(hero,dusk_power)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Mag2_Info()
{
	mag_prove = mag_prove + 1;
	B_GiveXP(800);
	AI_Output (other, self, "DIA_Leren_Mag2_15_01"); //To ten artefakt?
	AI_Output (self, other, "DIA_Leren_Mag2_11_02"); //Na ow�osione jaja Beliara, uda�o Ci si�!
	AI_Output (other, self, "DIA_Leren_Mag2_15_03"); //Zabi�em przy tym pewnego rozgadanego umarlaka...
	AI_Output (self, other, "DIA_Leren_Mag2_11_04"); //Niewa�ne, daj mi relikt!
	B_GiveInvItems (other, self, dusk_power,1);
	AI_Output (other, self, "DIA_Leren_Mag2_15_05"); //A co z nauk�?
	AI_Output (self, other, "DIA_Leren_Mag2_11_06"); //P�niej o tym pogadamy! 
	AI_Output (self, other, "DIA_Leren_Mag2_11_07"); //Teraz musz� zg��bi� tajemnic� tego wspania�ego dziedzictwa ork�w...
	
   Log_SetTopicStatus(CH2_RBL_Artefact, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Artefact, "Odda�em Lerenowui zorz�, tylko, �e ten zamiast mnie czego� nauczy�, zacz�� �lini� si� na widok artefaktu. Coraz bardziej dziwi� si� tym, kt�rzy dobrowolnie zostaj� magami.");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Leren_Next (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 4;
	condition		= DIA_Leren_Next_Condition;
	information		= DIA_Leren_Next_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jestem ju� got�w na nauk�!"; 
};

FUNC INT DIA_Leren_Next_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Milten_Ask))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Next_Info()
{
	AI_Output (other, self, "DIA_Leren_Next_15_01"); //Jestem ju� got�w na nauk�!
	AI_Output (self, other, "DIA_Leren_Next_11_02"); //Ale ja nie jestem jeszcze na to przygotowany.
	AI_Output (other, self, "DIA_Leren_Next_15_03"); //Rozmawia�em z Miltenem...
	AI_Output (self, other, "DIA_Leren_Next_11_04"); //Wiem, przynios�e� mu wszystkie sk�adniki do wywar�w. Wytrwa�y z Ciebie skurczybyk.
	AI_Output (other, self, "DIA_Leren_Next_15_05"); //Wi�c jak b�dzie z nauk�?
	AI_Output (self, other, "DIA_Leren_Next_11_06"); //Z ch�ci� pokaza�bym Ci kilka sztuczek, ale �r�d�a s� teraz bardzo niestabilne.
	AI_Output (other, self, "DIA_Leren_Next_15_07"); //Jakie �r�d�a?
	AI_Output (self, other, "DIA_Leren_Next_11_08"); //�r�d�a magii g�upcze! A sk�d mam czerpa� energi�, z onuc?
	AI_Output (self, other, "DIA_Leren_Next_11_09"); //Jaki� czas temu skradziono cholern� Tritetr�. Od tej chwili magowie w Kolonii maj� problem ze zogniskowaniem mocy.
	AI_Output (other, self, "DIA_Leren_Next_15_10"); //Co to za Tritetra?
	AI_Output (self, other, "DIA_Leren_Next_11_11"); //To dwana�cie �wi�tych pos��k�w. Ka�dy z nich zosta� konsekrowany na o�tarzu w Wielkiej �wi�tyni jakiego� boga.
	AI_Output (other, self, "DIA_Leren_Next_15_12"); //Beliara te�?
	AI_Output (self, other, "DIA_Leren_Next_11_13"); //Oczywi�cie. Tritetra jest bardzo stara, nie mam poj�cia, jak si� tutaj znalaz�a. Ale jej po��czona moc mog�aby zniszczy� barier�, a przy okazji wszystkich skaza�c�w.
	AI_Output (self, other, "DIA_Leren_Next_11_14"); //Ten kto� musia� wiedzie�, co robi. Zdo�a�em wy�ledzi� miejsca, gdzie ukryto figurki. Rozrzucono je po ca�ej Kolonii.
	AI_Output (other, self, "DIA_Leren_Next_15_15"); //Dlaczego kto� mia�by to robi�?
	AI_Output (self, other, "DIA_Leren_Next_11_16"); //Figurki przechowywane by�y w starych grobowcach, spoczywali tam bohaterowie ka�dego z bog�w. Ich nieumar�e aspekty strzeg�y pos��k�w.
	AI_Output (self, other, "DIA_Leren_Next_11_17"); //Jednak kto� na tyle szalony by rzuci� wyzwanie bogom, skrad� pos��ki i zniszczy� stra�nik�w.
	AI_Output (self, other, "DIA_Leren_Next_11_18"); //Ale �aden �miertelnik nie jest w stanie przenie�� sam wszystkich pos��k�w. Ich moc jest zbyt pot�na, zniszczy�aby ka�dego �mia�ka.
	AI_Output (other, self, "DIA_Leren_Next_15_19"); //Dlatego porozrzuca� je po Kolonii?
	AI_Output (self, other, "DIA_Leren_Next_11_20"); //Raczej ukry� w r�nych miejscach. Nie przewidzia� tylko jednego, �e figurki zechc� mu si� sprzeciwi�.
	AI_Output (other, self, "DIA_Leren_Next_15_21"); //A motywy?
	AI_Output (self, other, "DIA_Leren_Next_11_22"); //Tego nigdy si� nie dowiemy. Znalaz�em szcz�tki tego g�upca, a przy nim pier�cie� z akwamarynem.
	AI_Output (other, self, "DIA_Leren_Next_15_23"); //Akwamaryn? Mo�e to symbol jakiej� organizacji albo sekty?
	AI_Output (self, other, "DIA_Leren_Next_11_24"); //Mo�liwe. Ale tajemnice to specjalno�� Miltena. Pogadaj z nim o pier�cieniu. Dla mnie najwa�niejsze s� pos��ki.
	AI_Output (other, self, "DIA_Leren_Next_15_25"); //Mam je odnale��?
	AI_Output (self, other, "DIA_Leren_Next_11_26"); //Raczej przynie��, bo okre�li�em ju� po�o�enie ka�dej z figurek. Przyniesiesz pos��ki w okre�lonej kolejno�ci, inaczej m�g�by� przep�aci� to �yciem.
	AI_Output (self, other, "DIA_Leren_Next_11_27"); //Wi�c jak b�dzie?
};

// **************************************************

INSTANCE DIA_Leren_Next1 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 5;
	condition		= DIA_Leren_Next1_Condition;
	information		= DIA_Leren_Next1_Info;
	permanent		= 0;
	important		= 0;
	description		= "W porz�dku, przynios� pos��ki."; 
};

FUNC INT DIA_Leren_Next1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Next))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Next1_Info()
{
	AI_Output (other, self, "DIA_Leren_Next1_15_01"); //W porz�dku, przynios� pos��ki.
	AI_Output (self, other, "DIA_Leren_Next1_11_02"); //Nie tra�my wi�c czasu na zb�dne k�apanie g�b�. Pos��k�w jest dwana�cie, po cztery dla ka�dego boga. 
	AI_Output (other, self, "DIA_Leren_Next1_15_03"); //Dlaczego akurat po cztery?
	AI_Output (self, other, "DIA_Leren_Next1_11_04"); //Bo tyle jest stron �wiata g�upcze! No i tyle jest te� Wielkich �wi�ty� konsekrowanych ka�demu z bog�w.
	AI_Output (self, other, "DIA_Leren_Next1_11_05"); //Jako pierwsz� przynie� figurk� Beliara. Znajdziesz j� gdzie� na wybrze�u, tam gdzie morze wyrzuci�o was na brzeg.
	AI_Output (self, other, "DIA_Leren_Next1_11_06"); //Tylko uwa�aj, figurka jest przesycona magi� Beliara. Figurk� jak najszybciej przynie� do mnie.
	AI_Output (other, self, "DIA_Leren_Next1_15_07"); //W porz�dku.

	/*****************************
	Ork jaki� WP mu daj
	***************************/
	MIS_Tritetra_on=1;
	Wld_InsertNpc(SkeletonMage_Beliar,"OW_COAST_SHIPWRECK_WARAN_2");
	Log_CreateTopic(CH2_RBL_Tritetra, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Tritetra, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Tritetra, "Musz� przynie�� Lerenowi Tritetr� - dwana�cie pos��k�w po�wi�conych ka�demu z bog�w. Mam zacz�� od pos��ka Beliara ukrytego gdzie� na pla�y.");
	MIS_Tritetra_innos_counter_max=60;
	MIS_Tritetra_adanos_counter_max=50;
};

// **************************************************

INSTANCE DIA_Leren_FirstBeliar (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 5;
	condition		= DIA_Leren_FirstBeliar_Condition;
	information		= DIA_Leren_FirstBeliar_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zabierz ode mnie to cholerstwo!"; 
};

FUNC INT DIA_Leren_FirstBeliar_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Mag_Beliar_HelloAgain))&&(NPC_HasItems(other,tri_beliar_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_FirstBeliar_Info()
{
	B_GiveXP (500);
	
   AI_Output (other, self, "DIA_Leren_FirstBeliar_15_01"); //Zabierz ode mnie to cholerstwo!
	AI_Output (self, other, "DIA_Leren_FirstBeliar_11_02"); //Cuchnie samym Beliarem, daj to natychmiast!
	
   B_GiveInvItems (other, self, tri_beliar_statue, 1);
	Npc_RemoveInvItems(self,tri_beliar_statue,1);
	
   AI_Output (self, other, "DIA_Leren_FirstBeliar_11_03"); //Odnios� pos��ek tam, gdzie jego moc nikomu nie zaszkodzi.
	
   B_LogEntry(CH2_RBL_Tritetra, "Odda�em pierwszy pos��ek Beliara Lerenowi. Czu�em si�, jakby to paskudztwo ch�epta�o moja krew.");
	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_FirstInnos (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 6;
	condition		= DIA_Leren_FirstInnos_Condition;
	information		= DIA_Leren_FirstInnos_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_FirstInnos_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_FirstBeliar ))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_FirstInnos_Info()
{
	AI_Output (self, other, "DIA_Leren_FirstInnos_11_01"); //Teraz przynie� mi pos��ek Innosa, znajdziesz go na Placu Wymian.
	AI_Output (other, self, "DIA_Leren_FirstInnos_15_02"); //Na Placu Wymian? A co to za miejsce?
	AI_Output (self, other, "DIA_Leren_FirstInnos_11_03"); //To pierwsze co widz� skaza�cy trafiaj�c do Kolonii. 
	AI_Output (self, other, "DIA_Leren_FirstInnos_11_04"); //Ruszaj�c ze Starego Obozu w stron� kopalni Iana, skr�� w prawo i id� ca�y czas �cie�k� w g�r�. Na ko�cu drogi znajdziesz niewielk� nieck� i placyk. To jest w�a�nie Plac Wymian.
	B_LogEntry(CH2_RBL_Tritetra, "Kolejny pos��ek, tym razem po�wi�cony Innosowi, odnajd� na Placu Wymian.");
	Wld_InsertNpc(GreenGobboGarbus,"WP_INTRO_FALL3");
};

// **************************************************

INSTANCE DIA_Leren_FirstInnos1 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 7;
	condition		= DIA_Leren_FirstInnos1_Condition;
	information		= DIA_Leren_FirstInnos1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Oto pos��ek Innosa."; 
};

FUNC INT DIA_Leren_FirstInnos1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Garbus_HelloAgain))&&(NPC_HasItems(other,tri_innos_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_FirstInnos1_Info()
{
	B_GiveXP (500);
	AI_Output (other, self, "DIA_Leren_FirstInnos1_15_01"); //Oto pos��ek Innosa.
	AI_Output (self, other, "DIA_Leren_FirstInnos1_11_02"); //Wy�mienicie. Uwolni� Ci� od tego ci�aru.
   
	B_GiveInvItems (other, self, tri_innos_statue, 1);
	Npc_RemoveInvItems(self,tri_innos_statue,1);
   
	B_LogEntry(CH2_RBL_Tritetra, "Odda�em Lerenowi pos��ek Innosa.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_FirstAdan (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 8;
	condition		= DIA_Leren_FirstAdan_Condition;
	information		= DIA_Leren_FirstAdan_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_FirstAdan_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_FirstInnos1))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_FirstAdan_Info()
{
	AI_Output (self, other, "DIA_Leren_FirstAdan_11_01"); //Teraz wyruszysz po pos��ek Adanosa. Poszukaj w pobli�u kamiennej twierdzy.
	AI_Output (other, self, "DIA_Leren_FirstAdan_15_02"); //Dobrze.
	
   B_LogEntry(CH2_RBL_Tritetra, "Pierwszy pos��ek Adanosa odnajd� w pobli�u kamiennej twierdzy.");
	Wld_InsertNpc(Wisp_Adan,"PATH_TO_PLATEAU04_BRIDGE2");
};

// **************************************************

INSTANCE DIA_Leren_AdanosFirst (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 9;
	condition		= DIA_Leren_AdanosFirst_Condition;
	information		= DIA_Leren_AdanosFirst_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynios�em pos��ek Adanosa."; 
};

FUNC INT DIA_Leren_AdanosFirst_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Garbus_HelloAgain))&&(NPC_HasItems(other,tri_adan_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_AdanosFirst_Info()
{
	B_GiveXP (500);
	AI_Output (other, self, "DIA_Leren_AdanosFirst_15_01"); //Przynios�em pos��ek Adanosa.
	AI_Output (self, other, "DIA_Leren_AdanosFirst_11_02"); //�wietnie, zaczynam wierzy�, �e zdo�asz odzyska� ca�� Tritetr�.
   
	B_GiveInvItems (other, self, tri_adan_statue, 1);
	Npc_RemoveInvItems(self,tri_adan_statue,1);
	B_LogEntry(CH2_RBL_Tritetra, "Odda�em Lerenowi pos��ek Adanosa.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_NextStatu (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 9;
	condition		= DIA_Leren_NextStatu_Condition;
	information		= DIA_Leren_NextStatu_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_NextStatu_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_AdanosFirst ))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_NextStatu_Info()
{
	AI_Output (self, other, "DIA_Leren_NextStatu_11_01"); //Czas na kolejn� pr�b�. Niestety mam z�e wie�ci.
	AI_Output (other, self, "DIA_Leren_NextStatu_15_02"); //Co si� sta�o?
	AI_Output (self, other, "DIA_Leren_NextStatu_11_03"); //Bogowie postanowili pokrzy�owa� nam plany. Pos��ki si� po��czy�y, powsta�y trzy pary i jedna tr�jca.
	AI_Output (other, self, "DIA_Leren_NextStatu_15_04"); //Rzeczywi�cie b�dzie trudniej. Ale musimy spr�bowa�.
	AI_Output (other, self, "DIA_Leren_NextStatu_15_05"); //Poza tym ja zawsze ko�cz� to, co zaczynam. M�w, co robimy.
	AI_Output (self, other, "DIA_Leren_NextStatu_11_06"); //Dwa pos��ki, po�wi�cone Beliarowi i Innosowi znajdziesz w pobli�u orkowego cmentarzyska.
	AI_Output (self, other, "DIA_Leren_NextStatu_11_07"); //Tylko uwa�aj, po��czona moc figurek mo�e Ci� z �atwo�ci� zabi�.
	AI_Output (other, self, "DIA_Leren_NextStatu_15_08"); //Bez obaw, ostro�no�� to moje drugie imi�.

	B_LogEntry(CH2_RBL_Tritetra, "Dwa pos��ki - Beliara i Innosa, znajd� gdzie� na bagnach.");
	B_StopProcessInfos(self);
	var C_NPC BeliarSke; BeliarSke=Hlp_GetNpc(SkeletonMage_Beliar);
	Npc_ExchangeRoutine(BeliarSke,"GRAVEYARD");
};

// **************************************************

INSTANCE DIA_Leren_FirstTwo (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 10;
	condition		= DIA_Leren_FirstTwo_Condition;
	information		= DIA_Leren_FirstTwo_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam pierwsz� par�!"; 
};

FUNC INT DIA_Leren_FirstTwo_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Mag_Beliar_Hello))&&(NPC_HasItems(other,tri_beliar_statue)>=1)&&(NPC_HasItems(other,tri_innos_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_FirstTwo_Info()
{
	B_GiveXP (800);
	AI_Output (other, self, "DIA_Leren_FirstTwo_15_01"); //Mam pierwsz� par�!
	AI_Output (self, other, "DIA_Leren_FirstTwo_11_02"); //Podo�a�e� kolejnej pr�bie, przeka� mi swoje brzemi�.
   
	B_GiveInvItems (other, self, tri_beliar_statue, 1);
	Npc_RemoveInvItems(self,tri_beliar_statue,1);
	B_GiveInvItems (other, self, tri_innos_statue, 1);
	Npc_RemoveInvItems(self,tri_innos_statue,1);
   
	B_LogEntry(CH2_RBL_Tritetra, "Oddda�em Lerenowi pos��ek Innosa i Beliara.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_NextTwo (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 11;
	condition		= DIA_Leren_NextTwo_Condition;
	information		= DIA_Leren_NextTwo_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_NextTwo_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_FirstTwo))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_NextTwo_Info()
{
	AI_Output (self, other, "DIA_Leren_NextTwo_11_01"); //Kolejn� par� znajdziesz w pobli�u wej�cia do Starej Kopalni. Tym razem b�d� to dwa pos��ki Adanosa.
	AI_Output (other, self, "DIA_Leren_NextTwo_15_02"); //Ju� nie mog� si� doczeka�...
	
   B_LogEntry(CH2_RBL_Tritetra, "Kolejna para pos��k�w 'czeka' na mnie w pobli�u Starej Kopalni.");
	B_StopProcessInfos(self);
	var C_NPC Adanos_wisp; Adanos_wisp=Hlp_GetNpc(Wisp_Adan);	
	Npc_ExchangeRoutine(Adanos_wisp,"MINE");
};

// **************************************************

INSTANCE DIA_Leren_TwoAdan (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 12;
	condition		= DIA_Leren_TwoAdan_Condition;
	information		= DIA_Leren_TwoAdan_Info;
	permanent		= 0;
	important		= 0;
	description		= "Oto pos��ki Adanosa."; 
};

FUNC INT DIA_Leren_TwoAdan_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Iskra_Pair1))&&(NPC_HasItems(other,tri_adan_statue)>=2)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_TwoAdan_Info()
{
	B_GiveXP (800);
	AI_Output (other, self, "DIA_Leren_TwoAdan_15_01"); //Oto pos��ki Adanosa.
	AI_Output (self, other, "DIA_Leren_TwoAdan_11_02"); //Przyjm� je i odnios� w bezpieczne miejsce.
	
   B_GiveInvItems (other, self, tri_adan_statue, 2);
	Npc_RemoveInvItems(self,tri_adan_statue,2);

	B_LogEntry(CH2_RBL_Tritetra, "Odda�em Lerenowi dwa pos��ki Adanosa.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_LastTwo (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 13;
	condition		= DIA_Leren_LastTwo_Condition;
	information		= DIA_Leren_LastTwo_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_LastTwo_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_TwoAdan))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_LastTwo_Info()
{
	AI_Output (self, other, "DIA_Leren_LastTwo_11_01"); //To ju� ostatnia dw�jka. To dziwne, ale znalaz� j� jaki� skazaniec. Szukaj go przed po�udniowym wej�ciem do Starego Obozu.
	AI_Output (other, self, "DIA_Leren_LastTwo_15_02"); //Mam nadziej�, �e nie zaniesie ich Gomezowi.
	AI_Output (self, other, "DIA_Leren_LastTwo_11_03"); //To by�oby niefortunne. Ruszaj jak najszybciej.
	
   B_LogEntry(CH2_RBL_Tritetra, "Ostatnia para pos��k�w znajduje si� w posiadaniu jakiego� cz�owieka. Mam go szuka� przed po�udniowym wej�ciem do Starego Obozu.");
	Wld_InsertNpc(HUN_4035_Jahr,"OC_ROUND_13");
};

// **************************************************

INSTANCE DIA_Leren_LastTwoFinish (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 14;
	condition		= DIA_Leren_LastTwoFinish_Condition;
	information		= DIA_Leren_LastTwoFinish_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam ostatni� par�."; 
};

FUNC INT DIA_Leren_LastTwoFinish_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_hun_4035_jahr_Hello))&&(NPC_HasItems(other,tri_beliar_statue)>=1)&&(NPC_HasItems(other,tri_innos_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_LastTwoFinish_Info()
{
	B_GiveXP (800);
	AI_Output (other, self, "DIA_Leren_LastTwoFinish_15_01"); //Mam ostatni� par�.
	AI_Output (self, other, "DIA_Leren_LastTwoFinish_11_02"); //Ju� je zabieram.
	
   B_GiveInvItems (other, self, tri_beliar_statue, 1);
	Npc_RemoveInvItems(self,tri_beliar_statue,1);
	B_GiveInvItems (other, self, tri_innos_statue, 1);
	Npc_RemoveInvItems(self,tri_innos_statue,1);
   
	B_LogEntry(CH2_RBL_Tritetra, "Znowu odda�em Lerenowi pos��ek Innosa i Beliara.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_LastThree (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 15;
	condition		= DIA_Leren_LastThree_Condition;
	information		= DIA_Leren_LastThree_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_LastThree_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_LastTwoFinish))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_LastThree_Info()
{
	AI_Output (self, other, "DIA_Leren_LastThree_11_01"); //Nie mamy czasu do stracenia. Zosta�y ostatnie trzy pos��ki. 
	AI_Output (other, self, "DIA_Leren_LastThree_15_02"); //Gdzie je znajd�?
	AI_Output (self, other, "DIA_Leren_LastThree_11_03"); //Gdzie� w jaskini nieopodal wej�cia na terytorium ork�w.
	AI_Output (self, other, "DIA_Leren_LastThree_11_04"); //B�d� z Tob� szczery. Z tego co wiem, jeszcze �aden �miertelnik nie zdo�a� zdzier�y� mocy trzech statuetek.
	AI_Output (other, self, "DIA_Leren_LastThree_15_05"); //Wi�c lepiej m�dl si� o to, �ebym by� pierwszy. Ruszam.
	AI_Output (self, other, "DIA_Leren_LastThree_11_06"); //Niech Ci� Innos strze�e.
	AI_Output (other, self, "DIA_Leren_LastThree_15_07"); //Wola�bym raczej, �eby �aden z bog�w nie zwraca� na mnie uwagi.
	
   B_LogEntry(CH2_RBL_Tritetra, "Czeka mnie wyprawa po ostatnie trzy pos��ki. Znajd� je gdzie� w jaskini nieopodal wej�cia na orkowe tereny.");
	B_StopProcessInfos(self);	
	var C_NPC Adanos_wisp; Adanos_wisp=Hlp_GetNpc(Wisp_Adan);	
	Npc_ExchangeRoutine(Adanos_wisp,"Cave");	
};

// **************************************************

INSTANCE DIA_Leren_LastThreeFinish (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 16;
	condition		= DIA_Leren_LastThreeFinish_Condition;
	information		= DIA_Leren_LastThreeFinish_Info;
	permanent		= 0;
	important		= 0;
	description		= "Oto ostatnie pos��ki!"; 
};

FUNC INT DIA_Leren_LastThreeFinish_Condition()
{
	if (NPC_HasItems(other,tri_beliar_statue)>=1)&&(NPC_HasItems(other,tri_innos_statue)>=1)&&(NPC_HasItems(other,tri_adan_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_LastThreeFinish_Info()
{
	AI_Output (other, self, "DIA_Leren_LastThreeFinish_15_01"); //Oto ostatnie pos��ki!
	AI_Output (self, other, "DIA_Leren_LastThreeFinish_11_02"); //Dokona�o si�. Obym zdo�a� donie�� je na miejsce...
   
	B_GiveInvItems (other, self, tri_beliar_statue, 1);
	Npc_RemoveInvItems(self,tri_beliar_statue,1);
	B_GiveInvItems (other, self, tri_innos_statue, 1);
	Npc_RemoveInvItems(self,tri_innos_statue,1);
	B_GiveInvItems (other, self, tri_adan_statue, 1);
	Npc_RemoveInvItems(self,tri_adan_statue,1);
   
	B_LogEntry(CH2_RBL_Tritetra, "Odda�em Lerenowi ostatnie trzy pos��ki.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_LastThreeFinish1 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 17;
	condition		= DIA_Leren_LastThreeFinish1_Condition;
	information		= DIA_Leren_LastThreeFinish1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_LastThreeFinish1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_LastThreeFinish))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_LastThreeFinish1_Info()
{
	B_GiveXP (1500);
	
   AI_Output (self, other, "DIA_Leren_LastThreeFinish1_11_01"); //Trudno mi w to uwierzy�. Tritetra znowu jest po��czona!
	AI_Output (other, self, "DIA_Leren_LastThreeFinish1_15_02"); //Co zamierzasz uczyni�?
	AI_Output (self, other, "DIA_Leren_LastThreeFinish1_11_03"); //O to si� nie k�opotaj, przyjacielu. Dowiesz si� wszystkiego w swoim czasie.
	AI_Output (self, other, "DIA_Leren_LastThreeFinish1_11_04"); //Nied�ugo rozpoczniemy nauk� magii. Jednak najpierw id� porozmawiaj z Ratfordem.
	
   Log_SetTopicStatus(CH2_RBL_Tritetra, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Tritetra, "Tritetra znowu jest jedno�ci�. Leren nie zdradzi� co magowie zamierzaj� uczyni� z jej moc�. Powiedzia�, �e nied�ugo rozpoczniemy nauk� magii. Aha i mam porozmawia� z Ratfordem.");
	B_StopProcessInfos(self);	
	MIS_Tritetra_on=0;
};

// **************************************************

INSTANCE DIA_Leren_Eqqupiment (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 18;
	condition		= DIA_Leren_Eqqupiment_Condition;
	information		= DIA_Leren_Eqqupiment_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przyby�em po szat� maga."; 
};

FUNC INT DIA_Leren_Eqqupiment_Condition()
{
	if (other.guild == GIL_MAG)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Eqqupiment_Info()
{
	AI_Output (other, self, "DIA_Leren_Eqqupiment_15_01"); //Przyby�em po szat� maga.
	AI_Output (self, other, "DIA_Leren_Eqqupiment_11_02"); //Przyby�e�? No dobra, we� te �achy. Zosta�y po jednym pechowcu, co rzuca� w ork�w kulami ognia.
	AI_Output (self, other, "DIA_Leren_Eqqupiment_11_03"); //Krew i fekalia na szacie ju� prawie zasch�y. Niech Ci s�u�y lepiej ni� jemu.
	AI_Output (self, other, "DIA_Leren_Eqqupiment_11_04"); //Aha i dam Ci dobr� rad� - wypierz te szmaty, zanim je za�o�ysz!

	CreateInvItem(other, MAG_ARMOR_L);
	CreateInvItem(self, MAG_ARMOR_L);
	B_GiveInvItems(self, other, MAG_ARMOR_L, 1);
	AI_EquipArmor(other, MAG_ARMOR_L);

	B_eqquip_check_mag();
	
   B_LogEntry(CH3_RBL_Choose, "Otrzyma�em od Lerena szat� maga.");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Leren_OldNote (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 190;
	condition		= DIA_Leren_OldNote_Condition;
	information		= DIA_Leren_OldNote_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz�em co� starego i cuchn�cego..."; 
};

FUNC INT DIA_Leren_OldNote_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Rodney_OldNote))&&(NPC_HasItems(other,ork_oldnote)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_OldNote_Info()
{
	AI_Output (other, self, "DIA_Leren_OldNote_15_01"); //Znalaz�em co� starego i cuchn�cego...
	AI_Output (self, other, "DIA_Leren_OldNote_11_02"); //O czym Ty m�wisz?
	AI_Output (other, self, "DIA_Leren_OldNote_15_03"); //I pomy�la�em, �e mo�e rzucisz na to okiem.
	AI_Output (self, other, "DIA_Leren_OldNote_11_04"); //Co to jest?
	AI_Output (other, self, "DIA_Leren_OldNote_15_05"); //Rozsypuj�cy si� pergamin...
	AI_Output (self, other, "DIA_Leren_OldNote_11_06"); //Ostro�nie! Poka� papier.
	
   B_GiveInvItems(other,self,ork_oldnote,1);
	B_UseFakeScroll(self);
	
   AI_Output (self, other, "DIA_Leren_OldNote_11_07"); //Ciekawe... To wczesna mroczna mowa.
	AI_Output (other, self, "DIA_Leren_OldNote_15_08"); //Co to znaczy?
	AI_Output (self, other, "DIA_Leren_OldNote_11_09"); //To pismo ork�w. Ale nawet jak na nich bardzo toporne. W sumie to piktogramy.
	AI_Output (other, self, "DIA_Leren_OldNote_15_10"); //Potrafisz je odczyta�?
	AI_Output (self, other, "DIA_Leren_OldNote_11_11"); //Pewnie, ale wi�kszo�� wyblak�a.
	AI_Output (self, other, "DIA_Leren_OldNote_11_12"); //Orkowy dow�dca zdoby� ludzk� osad�. Ten znaczek, nie znam go...
	AI_Output (self, other, "DIA_Leren_OldNote_11_13"); //To mo�e oznacza� fortel, albo podst�p... 
	AI_Output (self, other, "DIA_Leren_OldNote_11_14"); //Wynika z tego, �e zdobyli ludzkie sadyby z pomoc� zdrajcy.
	AI_Output (self, other, "DIA_Leren_OldNote_11_15"); //To ciekawe. Co za cz�owiek chcia�by pomaga� orkom?
	AI_Output (other, self, "DIA_Leren_OldNote_15_16"); //Co dalej?
	AI_Output (self, other, "DIA_Leren_OldNote_11_17"); //W sumie niewiele. Jest jaka� nazwa... Orgh'Athogn.
	AI_Output (self, other, "DIA_Leren_OldNote_11_18"); //Hmm. Mgliste Wzg�rze, albo jaka� wynios�a budowla we mgle.
	AI_Output (other, self, "DIA_Leren_OldNote_15_19"); //Mo�e Wie�a Mgie�?
	AI_Output (self, other, "DIA_Leren_OldNote_11_20"); //By� mo�e. Nic wi�cej... O cholera! List ca�kiem si� rozsypa�.
	AI_Output (other, self, "DIA_Leren_OldNote_15_21"); //No to �wietnie. Ale chyba wiem, gdzie mo�na znale�� Wie�� Mgie�.
	AI_Output (other, self, "DIA_Leren_OldNote_15_22"); //Dzi�ki za pomoc, Leren.
	
   B_LogEntry(CH3_RBL_RodneyHelp, "Lerenowi uda�o si� odczyta� skrawek pergaminu, zanim ca�kiem si� rozpad�. Wieki temu orkowie zdobyli ludzk� osad� z pomoc� zdrajcy spo�r�d ludzi. W tek�cie przewin�a si� te� nazwa podobna do Wie�y Mgie�. Ciekawe tylko, czego mam tam szuka�?");

	/*********************************

Ork tutaj wypada�oby wsadzi� pana Roderica do wie�y mgie�. I pamietaj, �e ma by� on tylko mi�dzy 22 a 4

************************************/
	Wld_InsertNpc(Roderic,"OW_FOGTOWER_TOP");
};

// **************************************************

INSTANCE DIA_Leren_Rodney (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 19;
	condition		= DIA_Leren_Rodney_Condition;
	information		= DIA_Leren_Rodney_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia�em porozmawia� o inicjacji Rodneya."; 
};

FUNC INT DIA_Leren_Rodney_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Rodney_Sword))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Rodney_Info()
{
	AI_Output (other, self, "DIA_Leren_Rodney_15_01"); //Chcia�em porozmawia� o inicjacji Rodneya.
	AI_Output (self, other, "DIA_Leren_Rodney_11_02"); //Wiem, �e mu pomagasz. 
	AI_Output (other, self, "DIA_Leren_Rodney_15_03"); //A ja wiem, �e przymkniesz na to oko.
	AI_Output (self, other, "DIA_Leren_Rodney_11_04"); //A niby dlaczego?

	Info_ClearChoices (DIA_Leren_Rodney);
	Info_AddChoice (DIA_Leren_Rodney, "A dlaczego nie?", DIA_Leren_Rodney_Want);
	
	if (DICK_CHOOSE == 1)
	{
		Info_AddChoice (DIA_Leren_Rodney, "Bo jestem jednym z was!", DIA_Leren_Rodney_Mag);
	}
	else
	{
		Info_AddChoice (DIA_Leren_Rodney, "Sporo wam pomog�em.", DIA_Leren_Rodney_Help);
	};
	
   Info_AddChoice (DIA_Leren_Rodney, "Pomaga�em przyjacielowi.", DIA_Leren_Rodney_Should);
};

// ---------------------------mag----------------------------------------

FUNC VOID DIA_Leren_Rodney_Mag()
{
	B_GiveXP(250);	
	rodney_mag = TRUE;
	
   AI_Output (other, self, "DIA_Leren_Rodney_Mag_15_01"); //Bo jestem jednym z was!
	AI_Output (self, other, "DIA_Leren_Rodney_Mag_11_02"); //Hmm, mo�e i jeste�, ale zbyt kr�tko, aby...
	AI_Output (other, self, "DIA_Leren_Rodney_Mag_15_03"); //To, �e nie nosz� szaty maga od kilku lat nie oznacza, �e jestem od was gorszy.
	AI_Output (self, other, "DIA_Leren_Rodney_Mag_11_04"); //Nie to chcia�em powiedzie�...
	AI_Output (other, self, "DIA_Leren_Rodney_Mag_15_05"); //A ja chcia�em powiedzie�, �e ta rozmowa zaczyna mnie nu�y�. A kiedy si� niecierpliwi� mam brzydki zwyczaj wydobywa� miecz...
	AI_Output (self, other, "DIA_Leren_Rodney_Mag_11_06"); //Nie musisz zni�a� si� do tak prostackich uwag!
	AI_Output (other, self, "DIA_Leren_Rodney_Mag_15_07"); //Wi�c?
	AI_Output (self, other, "DIA_Leren_Rodney_Mag_11_08"); //Dobra, uznajmy, �e Rodney pomy�lnie zako�czy� inicjacj�. Powiedz mu, �e mo�e przyj�� po szat� i run�.
	AI_Output (other, self, "DIA_Leren_Rodney_Mag_15_09"); //Tylko to chcia�em us�ysze�.
	
   B_LogEntry(CH3_RBL_RodneyHelp, "Leren �askawie uzna� inicjacj� Rodneya za pomy�lnie zako�czon�.");
	B_StopProcessInfos(self);
};

// ---------------------------help----------------------------------------

FUNC VOID DIA_Leren_Rodney_Help()
{
	B_GiveXP(250);	
	rodney_mag = TRUE;
	AI_Output (other, self, "DIA_Leren_Rodney_Help_15_01"); //Sporo wam pomog�em.
	AI_Output (self, other, "DIA_Leren_Rodney_Help_11_02"); //Wiem o tym.

	if (Npc_KnowsInfo (hero, DIA_Leren_Mag1)) 
	{
		AI_Output (other, self, "DIA_Leren_Rodney_Help_15_03"); //Zdoby�em dla Ciebie zorz�.
	};

	if (Npc_KnowsInfo (hero, DIA_Leren_LastThreeFinish1)) 
	{
		AI_Output (other, self, "DIA_Leren_Rodney_Help_15_04"); //Pomog�em Wam z Tritetr�!
	};
   
	AI_Output (other, self, "DIA_Leren_Rodney_Help_15_05"); //Czy moje zas�ugi nie wystarcz� na to, aby�cie zaufali Rodneyowi? R�cz� za niego!
	AI_Output (self, other, "DIA_Leren_Rodney_Help_11_06"); //Dobra ju�, dobra. Uznajmy, �e Rodney pomy�lnie zako�czy� inicjacj�. Powiedz mu, �e mo�e przyj�� po szat� i run�.
	AI_Output (other, self, "DIA_Leren_Rodney_Help_15_07"); //Tylko to chcia�em us�ysze�.

	B_LogEntry(CH3_RBL_RodneyHelp, "Leren �askawie uzna� inicjacj� Rodneya za pomy�lnie zako�czon�.");
	B_StopProcessInfos(self);
};

// ---------------------------should----------------------------------------

FUNC VOID DIA_Leren_Rodney_Should()
{
	AI_Output (other, self, "DIA_Leren_Rodney_Should_15_01"); //Pomaga�em przyjacielowi.
	AI_Output (self, other, "DIA_Leren_Rodney_Should_11_02"); //To zacne pobudki, ale co mnie to obchodzi?
	AI_Output (self, other, "DIA_Leren_Rodney_Should_11_03"); //Je�eli Rodney chce zosta� jednym z nas, musi wykaza� si� nie tylko sprytem, ale tak�e odwag� i po�wi�ceniem.
	AI_Output (self, other, "DIA_Leren_Rodney_Should_11_04"); //Przecie� nie b�dziesz mu ze wszystkim pomaga�! A z sikaniem sam sobie radzi?
	AI_Output (self, other, "DIA_Leren_Rodney_Should_11_05"); //Nie odpowiadaj! To by�o pytanie retoryczne...

	Info_ClearChoices (DIA_Leren_Rodney);
	Info_AddChoice (DIA_Leren_Rodney, "A dlaczego nie?", DIA_Leren_Rodney_Want);
	
	if (DICK_CHOOSE == 1)
	{
		Info_AddChoice (DIA_Leren_Rodney, "Bo jestem jednym z was!", DIA_Leren_Rodney_Mag);
	}
	else
	{
		Info_AddChoice (DIA_Leren_Rodney, "Sporo wam pomog�em.", DIA_Leren_Rodney_Help);
	};
};

// ---------------------------want----------------------------------------

FUNC VOID DIA_Leren_Rodney_Want()
{
	AI_Output (other, self, "DIA_Leren_Rodney_Want_15_01"); //A dlaczego nie?
	AI_Output (self, other, "DIA_Leren_Rodney_Want_11_02"); //Nie r�b z siebie idioty. 
	AI_Output (self, other, "DIA_Leren_Rodney_Want_11_03"); //Chocia�by dlatego, �e musi dowie�� swojej przydatno�ci i zaradno�ci.
	
   Info_ClearChoices (DIA_Leren_Rodney);

	if (DICK_CHOOSE == 1)
	{
		Info_AddChoice (DIA_Leren_Rodney, "Bo jestem jednym z was!", DIA_Leren_Rodney_Mag);
	}
	else
	{
		Info_AddChoice (DIA_Leren_Rodney, "Sporo wam pomog�em.", DIA_Leren_Rodney_Help);
	};
   
	Info_AddChoice (DIA_Leren_Rodney, "Pomaga�em przyjacielowi.", DIA_Leren_Rodney_Should);
};

// **************************************************

var int leren_read;

INSTANCE DIA_Leren_RuneSwd (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 20;
	condition		= DIA_Leren_RuneSwd_Condition;
	information		= DIA_Leren_RuneSwd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_RuneSwd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_Rodney))&&(rodney_mag == TRUE)&&(NPC_HasItems(other,ItMw_2H_RuneSWD_01)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_RuneSwd_Info()
{
	AI_Output (self, other, "DIA_Leren_RuneSwd_11_01"); //Nie tak szybko! A co z artefaktem?
	AI_Output (other, self, "DIA_Leren_RuneSwd_15_02"); //Mam go przy sobie.
	
   AI_UnequipWeapons(other);
	EquipItem(other,ItMw_2H_RuneSWD_01);
   AI_DrawWeapon(other);
	AI_PlayAni(other, "T_1HSINSPECT");
	AI_RemoveWeapon(other);
	
   AI_Output (self, other, "DIA_Leren_RuneSwd_11_03"); //Miecz �ywio��w! Zw� go te� mieczem runicznym albo mieczem Boskiej Tr�jcy.
	AI_Output (other, self, "DIA_Leren_RuneSwd_15_04"); //Sporo o nim wiesz.
	AI_Output (self, other, "DIA_Leren_RuneSwd_11_05"); //My�la�em, �e to tylko legenda...
	AI_Output (self, other, "DIA_Leren_RuneSwd_11_06"); //Ten miecz jest pot�niejszy ni� Uriziel.
	AI_Output (other, self, "DIA_Leren_RuneSwd_15_07"); //W tej chwili nie wygl�da za dobrze.
	AI_Output (self, other, "DIA_Leren_RuneSwd_11_08"); //Musz� przejrze� ksi�gi... Dbaj o ostrze, a ja dowiem si�, jak przywr�ci� mu dawn� �wietno��.
	
   leren_read = B_SetDayTolerance()+2;
	Log_CreateTopic(CH4_GRD_RuneSwd, LOG_MISSION);
	Log_SetTopicStatus(CH4_GRD_RuneSwd, LOG_RUNNING);
	B_LogEntry(CH4_GRD_RuneSwd, "Miecz, kt�ry zdoby�em to legendarne ostrze, zwane mieczem runicznym. Leren obieca�, �e dowie si� czego� wi�cej. Musz� z nim porozmawia� za jaki� czas.");
	B_StopProcessInfos(self);
   
   if (NPC_HasItems(other,ItMw_2H_RuneSWD_01)>1)
   {
      Npc_RemoveInvItems(other, ItMw_2H_RuneSWD_01, 1);
   };
};

INSTANCE DIA_Leren_RuneSwd1 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 21;
	condition		= DIA_Leren_RuneSwd1_Condition;
	information		= DIA_Leren_RuneSwd1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_RuneSwd1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_RuneSwd))&&(NPC_HasItems(other,ItMw_2H_RuneSWD_01)>=1)&&(leren_read <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_RuneSwd1_Info()
{
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_01"); //Znalaz�em spos�b, ale to nie b�dzie �atwe.
	AI_Output (other, self, "DIA_Leren_RuneSwd1_15_02"); //Tego si� domy�lam. 
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_03"); //Miecz runiczny zosta� stworzony na o�tarzu ka�dego z trzech bog�w.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_04"); //Dodatkowo sk�ada si� z trzech nierozerwalnych element�w konsekrowanych w r�nych �wi�tyniach.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_05"); //Ostrze po�wi�cono Innosowi.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_06"); //Jelec, Beliarowi.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_07"); //A osadzony w r�koje�ci klejnot, Adanosowi.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_08"); //W zasadzie ten miecz to jedyny artefakt skupiaj�cy w sobie moce wszystkich bog�w!
	AI_Output (other, self, "DIA_Leren_RuneSwd1_15_09"); //To �wietnie, ale mnie g��wnie interesuje, jak mo�na przywr�ci� ostrzu dawn� �wietno��.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_10"); //Musisz znale�� wyznawc� ka�dego z bog�w. Je�eli o Innosa chodzi, to ja si� tego podejm�. Co do Adanosa to poszukaj mag�w wody - jak ich znam, to gdzie� tu si� jeszcze chowaj�.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_11"); //Gorzej b�dzie z Beliarem. Hmm, m�g�by� spr�bowa� porozmawia� z Xardasem, ma wie�� gdzie� na terenach ork�w.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_12"); //Ale on nie lubi nieproszonych go�ci.
	AI_Output (other, self, "DIA_Leren_RuneSwd1_15_13"); //I co dalej?
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_14"); //Trzej kap�ani wyznaj�cy r�nych bog�w, musz� przeprowadzi� rytua� odrodzenia ostrza.
	AI_Output (other, self, "DIA_Leren_RuneSwd1_15_15"); //Rozumiem.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_16"); //To jeszcze nie wszystko. Do przeprowadzenia rytua�u potrzebny jest specjalny almanach. I to jest w�a�nie najwi�kszy problem.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_17"); //Musisz poszuka� tego inkunabu�u. Jest du�a szansa, �e znajduje si� gdzie� w Kolonii. W ko�cu ostrze wykuto na wyspie Khorinis.
	AI_Output (other, self, "DIA_Leren_RuneSwd1_15_18"); //Dobrze, poszukam tej ksi�gi.
	
   B_LogEntry(CH4_GRD_RuneSwd, "Istnieje spos�b na przywr�cenie ostrzu dawnej �wi�to�ci. Nale�y odprawi� rytua� za po�rednictwem wyznawc�w Adanosa, Innosa i Beliara. Ale najpierw musz� odnale�� 'Almanach odrodzenia', dzi�ki kt�remu magowie poznaj� procedur� rytua�u.");
   
   Wld_InsertItem(ItArRuneTeleport3, "DT_E1_06");
};

INSTANCE DIA_Leren_RuneSwdBack (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 22;
	condition		= DIA_Leren_RuneSwdBack_Condition;
	information		= DIA_Leren_RuneSwdBack_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_RuneSwdBack_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bern_First))&&(Npc_KnowsInfo (hero, DIA_Leren_RuneSwd1))&&(NPC_HasItems(other,ItMw_2H_RuneSWD_01)>=1)&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_RuneSwdBack_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
   
   Black_mag_arrived = true;
	
   AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_01"); //Masz miecz?!
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_02"); //Tak, odzyska�em ostrze. Jeden samob�jca ukrad� miecz i przeprowadzi� z nim jednoosobow� inwazj� na tereny ork�w.
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_03"); //Innos nad Tob� czuwa�! Czy ostrze si� zmieni�o?
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_04"); //Jest parz�co zimne i bardziej pop�kane. Wygl�da jakby si�... postarza�o o kilka wiek�w.
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_05"); //To wp�yw jednego z bog�w. Wydaje mi si�, �e r�wnowaga si� zosta�a zak��cona.
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_06"); //Co to oznacza?
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_07"); //W Kolonii pojawi� si� czarny mag, albo jaki� pot�ny nekromanta.
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_08"); //Tylko mi nie m�w, �e z powodu miecza dobrowolnie przeszed� przez barier�?
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_09"); //Obawiam si�, �e w�a�nie tak by�o. Ten miecz mo�e by� zar�wno zwiastunem nieszcz�cia jak i odkupicielem win.
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_10"); //Jestem te� pewien, �e ten nekromanta mo�e wiedzie� co� wi�cej o almanachu.
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_11"); //Musisz go odnale�� i dowiedzie� si� wszystkiego, co tylko zdo�asz.
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_12"); //Gdzie mam go szuka�?
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_13"); //Tego niestety nie wiem. Ten sukinsyn �wietnie si� maskuje. Ale b�d� ostro�ny, miejsce, kt�re wybra�, mo�e by� naje�one straszliwymi niebezpiecze�stwami.
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_14"); //I nie lekcewa� tego maga. Na wyspie Khorinis ukryto gdzie� jedn� z czterech �wi�ty� po�wi�conych Beliarowi. Blisko�� takiego miejsca mo�e zwielokrotni� moc nekromanty.
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_15"); //Bez obaw, poradz� sobie. Bywaj.
	
   B_LogEntry(CH4_GRD_RuneSwd, "W Kolonii pojawi� si� kolejny nekromanta. Leren twierdzi, �e to w�a�nie miecz go tu �ci�gn��. Musz� odnale�� tego maga i dowiedzie� si�, czy nie wie, gdzie jest 'Almanach odrodzenia'.");
	
	Log_CreateTopic(CH4_Nec_BM, LOG_MISSION);
	Log_SetTopicStatus(CH4_Nec_BM, LOG_RUNNING);
	B_LogEntry(CH4_Nec_BM, "W Kolonii pojawi� si� jaki� nekromanta, musz� go odnale��. Kto wie, je�eli przywi�d� go tu miecz runiczny, to mo�e b�dzie wiedzia�, gdzie znale�� almanach?");

	B_StopProcessInfos(self);

	/***********************
	Ork dobrze by�oby, �eby dopiero teraz nekro pojawi� si� w grze, mo�e niech si� otworzy jakie� przej�cie: g�az, krata, kt�re wcze�niej by�y zyamkni�te. Mo�e doda� przed tym wej�ciem kilka martwych cia� ludzi - wcze�niej ich nie by�o.
	Gracz by si� w ten spos�b skapn�� gdzie jest nekro
	***********************/
};

INSTANCE DIA_Leren_Almanach (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 23;
	condition		= DIA_Leren_Almanach_Condition;
	information		= DIA_Leren_Almanach_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz�em almanach!"; 
};

FUNC INT DIA_Leren_Almanach_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_Swd))&&(NPC_HasItems(other,almanach_res)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Almanach_Info()
{
	AI_Output (other, self, "DIA_Leren_Almanach_15_01"); //Znalaz�em almanach!
	AI_Output (self, other, "DIA_Leren_Almanach_11_02"); //Nie s�dzi�em, �e to w og�le mo�liwe. 
	AI_Output (other, self, "DIA_Leren_Almanach_15_03"); //Mia�e� racj�. Inkunabu� spoczywa� w bibliotece nekromanty. Troch� si� nam�czy�em, �eby go zdoby�.
	AI_Output (self, other, "DIA_Leren_Almanach_11_04"); //Czyta�e� ksi�g�?
	
   if (alman_read == TRUE)
	{
		AI_Output (other, self, "DIA_Leren_Almanach_15_05"); //Tak, ale nic nie zrozumia�em z tego be�kotu. To jaki� archaiczny j�zyk.
	}
	else
	{
		AI_Output (other, self, "DIA_Leren_Almanach_15_06"); //Nie, wol� nie psu� sobie oczu s�owem pisanym.
	};
	
   AI_Output (self, other, "DIA_Leren_Almanach_11_07"); //To ciekawe... Daj mi inkunabu�, niech no na niego rzuc� okiem.
	B_GiveInvItems (other, self, almanach_res, 1);
	
	/******************************
	Ork da si� to zrobi� z ksi�g�?
	*******************************/

	B_UseFakeScroll(self);
	AI_Output (self, other, "DIA_Leren_Almanach_11_08"); //Ten j�zyk to staro�ytne glify, lub raczej piktogramy. Na pewno nie s� dzie�em cz�owieka, cho� no�nik jakim jest ksi�ga, wygl�da na ludzkie rzemios�o. 
	AI_Output (self, other, "DIA_Leren_Almanach_11_09"); //Dziwne...
	AI_Output (other, self, "DIA_Leren_Almanach_15_10"); //Dasz rad� odczyta� almanach?
	AI_Output (self, other, "DIA_Leren_Almanach_11_11"); //Spr�buj�, ale to nie b�dzie �atwe. Wr�� za kilka dni, wtedy dam Ci ostateczn� odpowied�.
	AI_Output (other, self, "DIA_Leren_Almanach_15_12"); //Powodzenia Leren, to dla mnie bardzo wa�ne.
	AI_Output (self, other, "DIA_Leren_Almanach_11_13"); //Nie tylko dla Ciebie, przyjacielu.
	
   B_LogEntry(CH4_GRD_RuneSwd, "Odda�em almanach Lerenowi. Mag nie m�g� go odczyta�, wolumin zapisano jakim� staro�ytnym pismem. Mam wr�ci� za kilka dni, wtedy dowiem si�, czy mag w og�le da rad� pozna� procedur� rytua�u.");
	leren_read = B_SetDayTolerance()+3;//3 dni w ko�cu to nie jest takie proste
};

INSTANCE DIA_Leren_AlmanachRead (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 24;
	condition		= DIA_Leren_AlmanachRead_Condition;
	information		= DIA_Leren_AlmanachRead_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_AlmanachRead_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_Almanach))&&(leren_read <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_AlmanachRead_Info()
{
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_01"); //Ta ksi�ga jest niesamowita!
	AI_Output (other, self, "DIA_Leren_AlmanachRead_15_02"); //To znaczy?
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_03"); //Sam almanach odrodzenia i zawarta w nim formu�a to niezwykle z�o�ony czar.
	AI_Output (other, self, "DIA_Leren_AlmanachRead_15_04"); //Czar?
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_05"); //Tak, ju� to t�umacz�.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_06"); //Almanach dostraja si� do tego, kto go przeczyta. I w zale�no�ci od rasy tego, kto go czyta eksponuje inn� formu�� na przywr�cenie ostrzu dawnej pot�gi.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_07"); //W naszym przypadku procedura rytua�u zosta�a zapisana w j�zyku... jaszczuroludzi!
	AI_Output (other, self, "DIA_Leren_AlmanachRead_15_08"); //Dlaczego?
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_09"); //Wydaje mi si�, �e ksi�ga zosta�a ob�o�ona czarem, kt�ry celowo mo�liwie mocno utrudnia rozwik�anie tajemnicy przywr�cenia ostrzu dawnej �wietno�ci. 
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_10"); //W sumie to do�� logiczna konkluzja, lepiej, �eby na�adowane ostrze nie trafi�o w r�ce jakiego� szale�ca!
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_11"); //Jaszczuroludzi nie widziano tu ju� od wiek�w. W dodatku u�yte tu piktogramy to j�zyk archaiczny, a tym pos�ugiwali si� tylko pradawni przodkowie tej rasy i do tego tylko uczeni w pi�mie, kt�rych by�o naprawd� niewielu.
	AI_Output (other, self, "DIA_Leren_AlmanachRead_15_12"); //Czyli wszystko stracone?
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_13"); //Niezupe�nie. Ten kto rzuci� czar, nie doceni� moich zdolno�ci lingwistycznych i zwyczajnego przypadku.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_14"); //Nowicjat up�yn�� mi na wyspie Risen. Tam nadal mieszkaj� jaszczuroludzie. Z tym, �e rasa zosta�a zasymilowana przez zamieszkuj�cych wysp� g�rnik�w i osadnik�w.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_15"); //Ludzie i jaszczurki �yj� tam w idealnej harmonii! Tam te� pozna�em j�zyk w�owatych, a do tego dialekt uczonych, kt�ry pod wieloma wzgl�dami jest bardzo podobny do tego z almanachu.
	AI_Output (other, self, "DIA_Leren_AlmanachRead_15_16"); //Uff, czyli mam sporo szcz�cia.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_17"); //W�tpi�, przyjacielu. Moim zdaniem nic nie dzieje si� bez powodu. Nie wierz� w przypadek. Los po prostu chcia�, abym to w�a�nie ja pom�g� Ci odczyta� almanach.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_18"); //Zreszt� niewa�ne. Wszystko co zdo�a�em odczyta�, spisa�em na tym pergaminie. 
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_19"); //Rzu� okiem na kartk� i wtedy znowu porozmawiamy.
	
   CreateInvItems (self,alm_log,1);
	B_GiveInvItems (self, other, alm_log, 1);
	Log_CreateTopic(CH4_RBL_Rirual, LOG_MISSION);
	Log_SetTopicStatus(CH4_RBL_Rirual, LOG_RUNNING);
	B_LogEntry(CH4_RBL_Rirual, "Leren odczyta� z almanachu, �e aby przywr�ci� mieczowi runicznemu dawn� moc, nale�y przeprowadzi� bardzo skomplikowany rytua�.");

	Log_SetTopicStatus(CH4_RBL_Almanach, LOG_SUCCESS);
	B_LogEntry(CH4_RBL_Almanach, "Leren zdo�a� odczyta� almanach. Teraz musz� zdoby� wszystkie przedmioty niezb�dne do przeprowadzenia rytua�u.");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Leren_AlmanachReadAfter (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 25;
	condition		= DIA_Leren_AlmanachReadAfter_Condition;
	information		= DIA_Leren_AlmanachReadAfter_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_AlmanachReadAfter_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_AlmanachRead))&&(alm_log_read == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_AlmanachReadAfter_Info()
{
	AI_Output (self, other, "DIA_Leren_AlmanachReadAfter_11_01"); //Wiem, co Ci� niepokoi. Sam si� zastanawia�em co to za kryszta�y. Rozmawia�em o tym z Miltenem i chyba pozna�em odpowied�.
	AI_Output (other, self, "DIA_Leren_AlmanachReadAfter_15_02"); //Ca�y zamieniam si� w s�uch.
	AI_Output (self, other, "DIA_Leren_AlmanachReadAfter_11_03"); //Najlepiej jak sam zapytasz Miltena. B�d� tu na Ciebie czeka�.
	
   B_LogEntry(CH4_RBL_Rirual, "Leren twierdzi, �e Milten wie, co to za gwiezdne kryszta�y s� potrzebne do zniszczenia serca Bestii. Musz� natychmiast z nim porozmawia�.");
};

INSTANCE DIA_Leren_Beast (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 26;
	condition		= DIA_Leren_Beast_Condition;
	information		= DIA_Leren_Beast_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozmawia�em z Miltenem."; 
};

FUNC INT DIA_Leren_Beast_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Milten_Cristals))&&(Npc_KnowsInfo (hero, DIA_Leren_AlmanachReadAfter))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Beast_Info()
{
	AI_Output (other, self, "DIA_Leren_Beast_15_01"); //Rozmawia�em z Miltenem.
	AI_Output (self, other, "DIA_Leren_Beast_11_02"); //Czyli wiesz ju� czego i gdzie szuka�. Sam musisz odnale�� kamienie ogniskuj�ce, w tym nikt Ci nie pomo�e.
	AI_Output (other, self, "DIA_Leren_Beast_15_03"); //Ale gdzie szuka� Bestii?
	AI_Output (self, other, "DIA_Leren_Beast_11_04"); //Niestety na bagnach.
	AI_Output (other, self, "DIA_Leren_Beast_15_05"); //Dlaczego niestety?
	AI_Output (self, other, "DIA_Leren_Beast_11_06"); //Bo z�o, kt�re tam zamieszka�o, a� przyt�acza sw� moc�. Nie zazdroszcz� Ci przyjacielu...
	AI_Output (self, other, "DIA_Leren_Beast_11_07"); //Czeka Ci� walka jakiej jeszcze �aden �miertelnik nie stoczy�. W ka�dym razie ja nie znam nikogo tak g�upiego, kto dobrowolnie rzuci�by wyzwanie tak przera�aj�cej istocie.
	AI_Output (other, self, "DIA_Leren_Beast_15_08"); //Dzi�ki za s�owa otuchy i wiar� w moje mo�liwo�ci. Czas nagli, ruszam na bagna.
	AI_Output (self, other, "DIA_Leren_Beast_11_09"); //Nie tak szybko! �eby pokona� z�o, z kt�rym zamierzasz walczy�, najpierw musisz je pozna� i zrozumie�.
	AI_Output (self, other, "DIA_Leren_Beast_11_10"); //Niedawno z bagien wr�ci� Lester. Porozmawiaj z nim, on wie ca�kiem sporo o Bestii.
	AI_Output (self, other, "DIA_Leren_Beast_11_11"); //Dam Ci dobr� rad� - mniej po�piechu, wi�cej taktyki. Mo�e wtedy d�u�ej po�yjesz.
	AI_Output (other, self, "DIA_Leren_Beast_15_12"); //Nikt nie �yje wiecznie, magu.
	
   Log_CreateTopic(CH4_RBL_Beast, LOG_MISSION);
	Log_SetTopicStatus(CH4_RBL_Beast, LOG_RUNNING);
	B_LogEntry(CH4_RBL_Beast, "Bestia, kt�rej serce mam zniszczy�, zamieszkuje bagna. Wi�cej o tej istocie dowiem si� od Lestera, kt�ry niedawno przyby� do obozu.");
	B_LogEntry(CH4_RBL_Rirual, "Besti� znajd� na bagnach, ale najpierw powinienem porozmawia� z Lesterem.");
   
   Wld_InsertNpc (PC_Psionic,"PATCHH");
	Wld_InsertNpc (Gur_1203_BaalTondral,"GO");
};

INSTANCE DIA_Leren_BeastDead (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 27;
	condition		= DIA_Leren_BeastDead_Condition;
	information		= DIA_Leren_BeastDead_Info;
	permanent		= 0;
	important		= 0;
	description		= "Oto serce Bestii!"; 
};

FUNC INT DIA_Leren_BeastDead_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lester_FightEnd))&&(NPC_HasItems(other,beast_heart)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_BeastDead_Info()
{
	AI_Output (other, self, "DIA_Leren_BeastDead_15_01"); //Oto serce Bestii!
	AI_Output (self, other, "DIA_Leren_BeastDead_11_02"); //Nie s�dzi�em, �e jakikolwiek �miertelnik zdo�a tego dokona�...
	B_GiveInvItems (other, self, beast_heart, 1);
	Npc_RemoveInvItems(self,beast_heart,1);
	B_LogEntry(CH4_RBL_Rirual, "Odda�em Lerenowi serce Bestii.");
};

INSTANCE DIA_Leren_StonesGive (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 28;
	condition		= DIA_Leren_StonesGive_Condition;
	information		= DIA_Leren_StonesGive_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zdoby�em kamienie ogniskuj�ce."; 
};

FUNC INT DIA_Leren_StonesGive_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Milten_Stones))&&(NPC_HasItems(other,Focus_2)>=1)&&(NPC_HasItems(other,Focus_3)>=1)&&(NPC_HasItems(other,Focus_4)>=1)&&(NPC_HasItems(other,Focus_5)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_StonesGive_Info()
{
	AI_Output (other, self, "DIA_Leren_StonesGive_15_01"); //Zdoby�em kamienie ogniskuj�ce.
	AI_Output (self, other, "DIA_Leren_StonesGive_11_02"); //Wiedzia�em, �e sobie poradzisz. Daj mi je.
   
	B_GiveInvItems (other, self, Focus_2, 1);
	B_GiveInvItems (other, self, Focus_3, 1);
	B_GiveInvItems (other, self, Focus_4, 1);
	B_GiveInvItems (other, self, Focus_5, 1);
	Npc_RemoveInvItems(self,Focus_2,1);
	Npc_RemoveInvItems(self,Focus_3,1);
	Npc_RemoveInvItems(self,Focus_4,1);
	Npc_RemoveInvItems(self,Focus_5,1);
   
	AI_Output (other, self, "DIA_Leren_StonesGive_15_03"); //Milten zsynchronizowa� kamienie, teraz mamy wi�ksz� szans� na powodzenie rytua�u.
	AI_Output (self, other, "DIA_Leren_StonesGive_11_04"); //Milten dzia�a mi na nerwy, ale czasami okazuje si� bardzo przydatny.
	AI_Output (self, other, "DIA_Leren_StonesGive_11_05"); //Jest jak wrz�d na ty�ku, do kt�rego cz�owiek najpierw si� przyzwyczaja, a p�niej nie potrafi bez niego �y�.
	B_LogEntry(CH4_RBL_Rirual, "Odda�em Lerenowi kamienie ogniskuj�ce.");
};

INSTANCE DIA_Leren_Ritual (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 29;
	condition		= DIA_Leren_Ritual_Condition;
	information		= DIA_Leren_Ritual_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_Ritual_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_StonesGive))&&(Npc_KnowsInfo (hero, DIA_Leren_BeastDead))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Ritual_Info()
{
	AI_Output (self, other, "DIA_Leren_Ritual_11_01"); //Mamy ju� wszystko co potrzebne do przeprowadzenia rytua�u.
	AI_Output (other, self, "DIA_Leren_Ritual_15_02"); //To �wietnie. Co mam robi�?
	AI_Output (self, other, "DIA_Leren_Ritual_11_03"); //Powiadom tych, kt�rzy, pr�cz mnie, musz� uczestniczy� w rytuale, aby przybyli do kamiennego kr�gu na bagnach - tam odprawimy inkantacj�.
	AI_Output (self, other, "DIA_Leren_Ritual_11_04"); //Ja wyrusz� ju� teraz. Pospiesz si�, bo nie chc� tkwi� tam d�u�ej ni� to konieczne.
	
   AI_PlayAni(other,"T_YES");
	B_LogEntry(CH4_RBL_Rirual, "Mo�na ju� rozpocz�� rytua� przywr�cenie mocy mieczowi runicznemu. Leren b�dzie czeka� na pozosta�ych mag�w przy kamiennym kr�gu na bagnach. Musz� natychmiast poinformowa� Xardasa i maga wody.");
	Npc_ExchangeRoutine(self, "RITUAL");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Leren_RitualBegin (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				=30;
	condition		= DIA_Leren_RitualBegin_Condition;
	information		= DIA_Leren_RitualBegin_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_RitualBegin_Condition()
{
	if (NPC_HasItems(hero,ItMw_2H_RuneSWD_01)>=1) && (Npc_KnowsInfo (hero, DIA_Leren_Ritual))
   &&((Npc_KnowsInfo (hero, Info_Xardas_Ritual))||(Npc_KnowsInfo (hero, Info_Nekroman_RitualBegin)))
   &&((satur_ritual) || (Npc_KnowsInfo (hero, Info_Myxir_Ritual)))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_RitualBegin_Info()
{
	var C_NPC xar; xar = Hlp_GetNpc(Kdf_404_Xardas);
	var C_NPC sat; sat = Hlp_GetNpc(KDW_600_Saturas);
	var C_NPC myx; myx = Hlp_GetNpc(KDW_601_Myxir);
	var C_NPC nek; nek = Hlp_GetNpc(DMB_1700_Necro);

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
   AI_UnequipWeapons(other);
   Give_and_remove(ItMw_2H_RuneSWD_01, 1);
   
	AI_Output (self, other, "DIA_Leren_RitualBegin_11_01"); //Wszyscy ju� s�. Czas rozpocz�� rytua�. Sta� w bezpiecznej odleg�o�ci i nie przeszkadzaj.
	AI_Output (other, self, "DIA_Leren_RitualBegin_15_02"); //Oczywi�cie, w ko�cu to Ty jeste� 'wielkim' magiem.

	B_LogEntry(CH4_RBL_Rirual, "Rytua� si� rozpocz��.");
	B_StopProcessInfos(self);

   if (satur_ritual)
   {
      Npc_ExchangeRoutine	(sat, "RITUAL1");
   }
   else
   {
      Npc_ExchangeRoutine	(myx, "RITUAL1");
   };
	
	if(Npc_KnowsInfo (hero, Info_Xardas_Ritual))
	{
		Npc_ExchangeRoutine	(xar, "RITUAL1");
	};
	if(Npc_KnowsInfo (hero, Info_Nekroman_RitualBegin))
	{
		Npc_ExchangeRoutine	(nek, "RITUAL1");
	};

	Npc_ExchangeRoutine	(self, "RITUAL1");

	AI_PlayAni(self,"T_PRACTICEMAGIC4");

	/***********************
Ork zr�b to jak chcesz, ale nie b�dzie fajne. Moja propozycja.
1. Magowie podchodz� do okre�lonych WP wok� o�atarza w kr�gu
2. Miecz umieszczony jest na o�tarzu a kamienia na oko�o.
3. Rozpoczyna si� rytua�.
4. PO zako�czeniu na��dowany miecz niech zostanie na o�tarzu, Dick sam go sobie zabierze.
5. Na ko�cu ustaw zmienn� ritual_end na true a magowie odchodz� do swych startowych rutyn.

***********************/
};

INSTANCE DIA_Leren_RitualEnd (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 30;
	condition		= DIA_Leren_RitualEnd_Condition;
	information		= DIA_Leren_RitualEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_RitualEnd_Condition()
{
   if ((Npc_KnowsInfo (hero, Info_Nekroman_RitualEnd))||(Npc_KnowsInfo (hero, Info_Xardas_RitualEnd)))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_RitualEnd_Info()
{
   if (satur_ritual)
   {
      var C_NPC sat; sat = Hlp_GetNpc(KDW_600_Saturas);
      Npc_ExchangeRoutine	(sat, "START");
   }
   else
   {
      var C_NPC myx; myx = Hlp_GetNpc(KDW_601_Myxir);
      Npc_ExchangeRoutine	(myx, "START");
   };
   
   var int random; random = Hlp_Random(6);
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, hero);
	AI_Output (self, other, "DIA_Leren_RitualEnd_11_01"); //Uda�o si�! To niesamowite, taka moc...
	AI_Output (other, self, "DIA_Leren_RitualEnd_15_02"); //Co z mieczem?
	AI_Output (self, other, "DIA_Leren_RitualEnd_11_03"); //Spoczywa na o�tarzu, nie �mia�em go tkn��.
	AI_Output (other, self, "DIA_Leren_RitualEnd_15_04"); //Jestem twoim d�u�nikiem, Leren.
	AI_Output (self, other, "DIA_Leren_RitualEnd_11_05"); //Nie ma o czym m�wi�. Skop kilka stra�niczych dup i b�dziemy kwita.
	AI_Output (self, other, "DIA_Leren_RitualEnd_11_06"); //Aha. Nie wiem, czy to Ci� zainteresuje, ale w Nowym Obozie co� si� dzieje. Podobno Lee chce poprowadzi� swoich ludzi do walki ze stra�nikami.
	AI_Output (other, self, "DIA_Leren_RitualEnd_15_07"); //Na to w�a�nie czeka�em! Dzi�ki Leren.

   if (random == 0)
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_01, "PSI_TELEPORT");
   }
   else if (random == 1)
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_DARK, "PSI_TELEPORT");
   }
   else if (random == 2)
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_FIRE, "PSI_TELEPORT");
   }
   else if (random == 3)
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_LIGHT, "PSI_TELEPORT");
   }
   else if (random == 4)
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_WATER, "PSI_TELEPORT");
   }
   else
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_PSI, "PSI_TELEPORT");
   };

	Log_SetTopicStatus(CH4_RBL_Rirual, LOG_SUCCESS);
	B_LogEntry(CH4_RBL_Rirual, "Rytua� dobieg� ko�ca. Miecz czeka na mnie na o�tarzu. Ju� nie mog� si� doczeka�, kiedy poznam moc or�a.");
	B_LogEntry(CH4_RBL_NCRebel, "Podobno Lee w ko�cu podj�� decyzj�. Czas zobaczy� jak wygl�da sytuacja w Nowym Obozie.");
	B_Kapitelwechsel(5);	 	
   
   Npc_ExchangeRoutine(self, "START");
	/*************************************
Ork odpal tu funkcj� odpowiedzialn� za rebeli� Hrabiego i bunt w Nowym obozie:
1. Orle Gniazdo zostaje odci�te, jest oblegane przez stra�nik�w wiernych Gomezowi i Fletcherowi.
2. Lares i jego ludzie wyr�n�li stra�nik�w na polach ry�owych. Tam te� ma si� znale�� Lee i jego ludzie od mag�w wody a tak�e Cronos je�eli nadal �yje.
3. W Kotle Wilk ze swoimi lud�mi wycofa� si� tam gdzie w podstawce mieszkali magowie. Wilk i jego ludzie odparli kilka atak�w stra�nik�w.
4. W kopalni albo raczej przed jej wej�ciem stra�nicy szykuj� si� do ostatecznego ude�enia.

Sporo tego, ale ma by� wida� zmiany, chodzi g��wnie o zmiany rutyn, troch� trup�w, etc. Musi by� jak najbardziej realistycznie. Jak dasz rad� doda� troch� modeli, np. barykada w przej�ciu do mag�w wody tam gdzie jest Wilk to by�oby ok.

***********************************/
};

INSTANCE DIA_Leren_SwdUse (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 30;
	condition		= DIA_Leren_SwdUse_Condition;
	information		= DIA_Leren_SwdUse_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak u�ywa si� mocy miecza?"; 
};

FUNC INT DIA_Leren_SwdUse_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_RitualEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_SwdUse_Info()
{
	AI_Output (other, self, "DIA_Leren_SwdUse_15_01"); //Jak si� u�ywa mocy miecza?
	AI_Output (self, other, "DIA_Leren_SwdUse_11_02"); //To proste. Osadzasz w jelcu run�, z kt�rej mocy ma korzysta� ostrze.
	AI_Output (self, other, "DIA_Leren_SwdUse_11_03"); //Wypr�buj r�ne runy, jestem pewien, �e ka�da da inny efekt w po��czeniu z tym pot�nym artefaktem.
	AI_Output (other, self, "DIA_Leren_SwdUse_15_04"); //Dzi�ki, Leren.
	
   Log_SetTopicStatus(CH4_GRD_RuneSwd, LOG_SUCCESS);
	B_LogEntry(CH4_GRD_RuneSwd, "Miecz runiczny odzyska� sw� moc! Mog� na�adowa� ostrze dowoln� run�, osadzaj�c run� w jelcu miecza. Ju� nie mog� si� doczeka� eksperyment�w z ostrzem!");
};

INSTANCE DIA_Leren_Appear (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 31;
	condition		= DIA_Leren_Appear_Condition;
	information		= DIA_Leren_Appear_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_Appear_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_RitualEnd))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Appear_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other, "DIA_Leren_Appear_11_01"); //Aha. Zapomnia�em jeszcze o jednym drobnym szczeg�le. Mia�em Ci o tym nie m�wi�, bo pewnie to tylko �le przet�umaczony urywek almanachu wprowadzi� mnie w b��d...
	AI_Output (other, self, "DIA_Leren_Appear_15_02"); //Co� mi si� wydaje, �e zaraz gorzko po�a�uj� tej niewiedzy.
	AI_Output (self, other, "DIA_Leren_Appear_11_03"); //Raczej nie. Jak odszed�e� zabawi� si� z Besti�, doczyta�em w almanachu, �e po zniszczeniu serca dusze tych, kt�rzy zostali zniewoleni przez Besti� powr�c�.
	AI_Output (self, other, "DIA_Leren_Appear_11_04"); //Oczywi�cie powr�c� nie tylko pod eteraln� postaci�. Ale jak sam widzisz, nic si� nie dzieje, wi�c...
	AI_Output (self, other, "DIA_Leren_Appear_11_05"); //O cholera, co� wyczuwam...
	AI_Output (self, other, "DIA_Leren_Appear_11_06"); //Nie powinno mnie tu by�. Nie daj si� zabi�!
	/**************************
Ork tak chcia�bym, �eby to wygl�da�o.
0. Leren i reszta mag�w ma stamt�d uciec jak najszybciej, mo�e mdla na sprint im zmie�, tylko dick ma zosta�.
1. Najazd kamerk� gdzie� w pobli�e kr�gu.
2. Rozb�ysk w miejscu gdzie pojawi si� 1 jaszczur. W tym samym momencie taka fala odrzutu, albo trz�sienie ziemi, �eby Dick upad� - niech go fajnie odrzuci.
3. Po tej pierwszej jaszczurce niech si� pojawi� kolejne w rozb�yskach.
4. Ta 1 jaszczura ma podej�� do Dicka i zagai� rozmow�.

**************************/

//************Jaszczury

	Wld_InsertNpc(Liz_4092_Hesstad, "PATH_NEW_AROUND_PSI21");
	Wld_InsertNpc(Draco1, "PATH_NEW_AROUND_PSI20");
	Wld_InsertNpc(Draco2, "PATH_NEW_AROUND_PSI17");

	Npc_ExchangeRoutine(self, "START");
	Log_CreateTopic(CH5_NON_Lizard, LOG_MISSION);
	Log_SetTopicStatus(CH5_NON_Lizard, LOG_RUNNING);
	B_LogEntry(CH5_NON_Lizard, "Zniszczenie serca Bestii uwolni�o uwi�zione tam dusze jaszczuroludzi!");
	B_StopProcessInfos(self);
   
   Leren_teleport_after_ritual = true;
};
