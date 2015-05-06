
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_336_Mark_Exit (C_INFO)
{
	npc			= RBL_2616_Mark;
	nr			= 999;
	condition	= DIA_HUN_336_Mark_Exit_Condition;
	information	= DIA_HUN_336_Mark_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_336_Mark_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_336_Mark_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Mark_Hello (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 1;
	condition		= DIA_Mark_Hello_Condition;
	information		= DIA_Mark_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Mark_Hello_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_336_CAVALORN_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Hello_Info()
{
	AI_Output (self, other, "DIA_Mark_Hello_11_01"); //Hej Ty! Nigdy Ci� tu nie widzia�em. Z kt�rego obozu Ci� wyrzucili? 
	AI_Output (other, self, "DIA_Mark_Hello_15_02"); //Nie Tw�j interes.
	AI_Output (self, other, "DIA_Mark_Hello_11_03"); //A za co dosta�e� kopa?
	AI_Output (other, self, "DIA_Mark_Hello_15_04"); //Za obcinanie j�zyk�w w�cibskich idiot�w!
	AI_Output (self, other, "DIA_Mark_Hello_11_05"); //Zrozumia�em aluzj�. Rzeczywi�cie niemi�e z Ciebie bydl�!		
	
   B_StopProcessInfos	( self );
};

// **************************************************

INSTANCE DIA_Mark_Again (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 2;
	condition		= DIA_Mark_Again_Condition;
	information		= DIA_Mark_Again_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ty jeste� Mark?"; 
};

FUNC INT DIA_Mark_Again_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_336_CAVALORN_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Again_Info()
{
	AI_Output (other, self, "DIA_Mark_Again_15_01"); //Ty jeste� Mark?
	AI_Output (self, other, "DIA_Mark_Again_11_02"); //Tak. A co Ci do tego?
	AI_Output (other, self, "DIA_Mark_Again_15_03"); //Cavalorn twierdzi, �e wiesz wszystko o tym obozie. Chcia�em zasi�gn�� j�zyka.
	AI_Output (self, other, "DIA_Mark_Again_11_04"); //Ostatnim razem m�wi�e� co� innego. Je�eli pami�� mnie nie myli, to by�o co� o obcinaniu j�zyk�w.
	AI_Output (other, self, "DIA_Mark_Again_15_05"); //Wybacz, ponios�o mnie. Ci wszyscy skaza�cy doprowadzaj� mnie do sza�u!
	AI_Output (self, other, "DIA_Mark_Again_11_06"); //Nie tylko Ty masz ten problem. Na szcz�cie nie jestem pami�tliwy.
	AI_Output (self, other, "DIA_Mark_Again_11_07"); //No i wi�kszo�� z obozowych obwiesi ma mnie do��. Pytaj o co chcesz!	
	
	Log_CreateTopic	(CH1_Rbl_MarkInfo, LOG_MISSION);
	B_LogSetTopicStatus	(CH1_Rbl_MarkInfo, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_MarkInfo, "Po niezbyt fortunnym rozpocz�ciu znajomo�ci, Mark zgodzi� si� odpowiedzie� na moje pytania.");
};

//**************************************************

INSTANCE DIA_Mark_Attack (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 11;
	condition		= DIA_Mark_Attack_Condition;
	information		= DIA_Mark_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Mark_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Attack_Info()
{
	AI_Output (self, other, "DIA_Mark_Attack_11_01"); //Czego tu jeszcze szukasz �az�go?
	AI_Output (self, other, "DIA_Mark_Attack_11_02"); //Chyba porz�dnego lania!
	AI_Output (self, other, "DIA_Mark_Attack_11_03"); //Ale ja nie lubi� przemocy. Tym razem Ci odpuszcz�!	
	
   B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Mark_Camp (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp_Condition;
	information		= DIA_Mark_Camp_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co to za ob�z?"; 
};

FUNC INT DIA_Mark_Camp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp_15_01"); //Co to za ob�z?
	AI_Output (self, other, "DIA_Mark_Camp_11_02"); //Nie�le si� tu urz�dzili�my, co nie? Mo�e to nie zamek Gomeza, ale jest przytulnie i w miar� bezpiecznie.
	AI_Output (self, other, "DIA_Mark_Camp_11_03"); //Reszta obwiesi nazywa nas rebeliantami, bo otwarcie sprzeciwili�my si� Gomezowi i jego przydupasom.
	
   B_LogEntry(CH1_Rbl_MarkInfo, "Czyli to ob�z rebeliant�w. Ciekawe miejsce i ciekawi ludzie, niestety maj� wi�cej wrog�w ni� sojusznik�w.");
};

// **************************************************

INSTANCE DIA_Mark_Camp1 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp1_Condition;
	information		= DIA_Mark_Camp1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kto to Gomez?"; 
};

FUNC INT DIA_Mark_Camp1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Camp))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp1_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp1_15_01"); //Kto to Gomez?
	AI_Output (self, other, "DIA_Mark_Camp1_11_02"); //Hmm, jakby to powiedzie�.
	AI_Output (self, other, "DIA_Mark_Camp1_11_03"); //Wyobra� sobie kogo�, kto w�a�nie spali� Ci dom, wyrucha� �on� i ulubionego konia.
	AI_Output (self, other, "DIA_Mark_Camp1_11_04"); //A wszystko po to, �eby zdoby� kilka bry�ek rudy.
	AI_Output (self, other, "DIA_Mark_Camp1_11_05"); //Taki jest w�a�nie Gomez. Zrobi wszystko, �eby po�o�y� �ap� na wszystkich kopalniach rudy w Kolonii.
	AI_Output (self, other, "DIA_Mark_Camp1_11_06"); //No i jeszcze w�adza. To go nakr�ca bardziej ni� bagienne ziele sekciarzy.
	AI_Output (self, other, "DIA_Mark_Camp1_11_07"); //Radz� omija� Stary Ob�z szerokim �ukiem.	
	
	B_LogEntry(CH1_Rbl_MarkInfo, "Gomez to kawa� skurwiela, dla kt�rego liczy si� tylko ruda i w�adza.");
};

// **************************************************

INSTANCE DIA_Mark_Camp2 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp2_Condition;
	information		= DIA_Mark_Camp2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak si� tu �yje?"; 
};

FUNC INT DIA_Mark_Camp2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp2_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp2_15_01"); //Jak si� tu �yje?
	AI_Output (self, other, "DIA_Mark_Camp2_11_02"); //Jak i wsz�dzie.
	AI_Output (self, other, "DIA_Mark_Camp2_11_03"); //Musisz je��, sra� i czasem nadstawi� dup� jakiemu� skurwielowi, co by sobie poch�do�y�, zamiast wypru� Ci flaki.
	AI_Output (self, other, "DIA_Mark_Camp2_11_04"); //No i jeszcze orkowie. Ale z nimi nie da si� pogada�. Najlepsza metoda na prze�ycie to szybko przebiera� nogami i nie ogl�da� si� za siebie, dop�ki nie zobaczysz bramy obozu.
	
	B_LogEntry(CH1_Rbl_MarkInfo, "Przyjemne miejsce ten ob�z rebeliant�w, musz� uwa�a� na to co m�wi� i z kim rozmawiam.");
};

// **************************************************

INSTANCE DIA_Mark_Camp3 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp3_Condition;
	information		= DIA_Mark_Camp3_Info;
	permanent		= 0;
	important		= 0;
	description		= "Z kim powinienem porozmawia�?"; 
};

FUNC INT DIA_Mark_Camp3_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp3_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp3_15_01"); //Z kim powinienem porozmawia�?
	AI_Output (self, other, "DIA_Mark_Camp3_11_02"); //Oczywi�cie ze mn�!
	AI_Output (other, self, "DIA_Mark_Camp3_15_03"); //Bez urazy, ale mia�em na my�li kogo�, delikatnie m�wi�c... bardziej powa�anego.	
	AI_Output (self, other, "DIA_Mark_Camp3_11_04"); //To nie by�o mi�e! 
	AI_Output (self, other, "DIA_Mark_Camp3_11_05"); //No dobra, wiem, �e jestem tylko lokaln� atrakcj�.
	AI_Output (self, other, "DIA_Mark_Camp3_11_06"); //Co do reszty...
	AI_Output (self, other, "DIA_Mark_Camp3_11_07"); //Na pewno Cavalorn i Ratford, tych dw�ch tutaj rz�dzi. Ale uwa�aj przy nich na s�owa, bo mo�esz straci� j�zyk.
	AI_Output (self, other, "DIA_Mark_Camp3_11_08"); //Z mag�w to Milten i Leren, cho� to zarozumia�e i aroganckie dupki.
	AI_Output (self, other, "DIA_Mark_Camp3_11_09"); //A reszta to zbieranina ze wszystkich oboz�w. Wi�kszych ment nigdzie nie znajdziesz!
	AI_Output (self, other, "DIA_Mark_Camp3_11_10"); //�wistak na widok b�yszcz�cego miecza dostaje wzwodu.
	AI_Output (self, other, "DIA_Mark_Camp3_11_11"); //Aidan podgl�da kopuluj�ce cieniostwory z r�k� w spodniach.
	AI_Output (self, other, "DIA_Mark_Camp3_11_12"); //R�czka... No c�, temu ostatnio ca�kiem odbi�o. Jego musisz przed u�yciem wstrz�sn��.
	AI_Output (self, other, "DIA_Mark_Camp3_11_13"); //Quentin to zabijaka, z nim radz� ostro�nie. W ka�dym razie bez kija nie podchod�, bo to w�ciek�y pies.
	AI_Output (self, other, "DIA_Mark_Camp3_11_14"); //Tony to nowy nabytek. �ajza ze Starego Obozu. Niby nie jest z�a ch�opina, ale zbyt ch�tnie bierze za innych warty jak na m�j gust.
	AI_Output (self, other, "DIA_Mark_Camp3_11_15"); //Fox za konfitury da si� wyrucha� orkowi, a Garry to urodzony nieudacznik.
	AI_Output (self, other, "DIA_Mark_Camp3_11_16"); //Kto tam jeszcze zosta�...
	AI_Output (self, other, "DIA_Mark_Camp3_11_17"); //Aha, Fisk. Prowadzi gospod�, lub raczej mordowni�. Lepiej omijaj to miejsce chyba, �e bol� Ci� z�by.
	AI_Output (self, other, "DIA_Mark_Camp3_11_18"); //Z Vamem te� co� jest nie tak. Z w�asnej woli zajmuje si� ciesielk� i chyba nawet to lubi.
	AI_Output (self, other, "DIA_Mark_Camp3_11_19"); //Drax to kombinator i malkontent, ale jako� sobie radzi.
	AI_Output (self, other, "DIA_Mark_Camp3_11_20"); //Jest jeszcze Abel. Prosty jak jego miecz, idealny pies wartowniczy.
	AI_Output (self, other, "DIA_Mark_Camp3_11_21"); //Dam Ci te� dobr� rad�. Nigdy nie bierz do ust czego�, co upichci� Snaf! Mo�na si� po tym przekr�ci�.
	AI_Output (self, other, "DIA_Mark_Camp3_11_22"); //W sumie by�aby z jego potrawek niez�a bro�, mo�na by tym obrzuca� ork�w.
	AI_Output (self, other, "DIA_Mark_Camp3_11_23"); //To mniej wi�cej tyle. Pogadaj z ch�opakami, to dowiesz si� wi�cej.
	
   B_LogEntry(CH1_Rbl_MarkInfo, "W obozie rebeliant�w mieszka niez�a mena�eria. Warto porozmawia� z ka�dym z nich.");
};

// **************************************************

INSTANCE DIA_Mark_Camp4 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp4_Condition;
	information		= DIA_Mark_Camp4_Info;
	permanent		= 0;
	important		= 0;
	description		= "A co z innymi obozami?"; 
};

FUNC INT DIA_Mark_Camp4_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp4_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp4_15_01"); //A co z innymi obozami?
	AI_Output (self, other, "DIA_Mark_Camp4_11_02"); //A co ma by�? S� i tyle.
	AI_Output (other, self, "DIA_Mark_Camp4_15_03"); //Mo�esz powiedzie� co� wi�cej?
	AI_Output (self, other, "DIA_Mark_Camp4_11_04"); //Ju� si� ba�em, �e nie zapytasz!
	AI_Output (self, other, "DIA_Mark_Camp4_11_05"); //Kiedy� by�y trzy g��wne obozy.
	AI_Output (self, other, "DIA_Mark_Camp4_11_06"); //Zabijaki Gomeza w Starym Obozie. 
	AI_Output (self, other, "DIA_Mark_Camp4_11_07"); //�wiry na bagnie, czcz�cy �ni�cego i ci�gle nabakani zielem.
	AI_Output (self, other, "DIA_Mark_Camp4_11_08"); //No i najemne s�ugusy mag�w wody z Nowego Obozu.
	AI_Output (self, other, "DIA_Mark_Camp4_11_09"); //Rozk�ad si� by� mniej wi�cej r�wny. Ka�dy mia� co�, czego potrzebowa� inny ob�z.
	AI_Output (self, other, "DIA_Mark_Camp4_11_10"); //Sekciarze handlowali zielem, w Nowym Obozie p�dzili ry��wk�, a Gomez trzyma� �ap� na rudzie i dostawach dla Rhobara.
	AI_Output (self, other, "DIA_Mark_Camp4_11_11"); //Mo�na by rzec, �e �yli�my w stanie b�ogiej r�wnowagi.
	AI_Output (self, other, "DIA_Mark_Camp4_11_12"); //Wszystko by�o dobrze, dop�ki w Kolonii nie pojawi� si� pewien Bezimienny idiota, kt�ry zacz�� wsz�dzie wtyka� nos.	
	
	B_LogEntry(CH1_Rbl_MarkInfo, "Kiedy� w Kolonii Karnej rz�dzi�y trzy g��wne obozy: Stary, Nowy i na bagnie.");
};

// **************************************************

INSTANCE DIA_Mark_Camp5 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp5_Condition;
	information		= DIA_Mark_Camp5_Info;
	permanent		= 0;
	important		= 0;
	description		= "A jak to wygl�da teraz?"; 
};

FUNC INT DIA_Mark_Camp5_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Camp4))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp5_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp5_15_01"); //A jak to wygl�da teraz?
	AI_Output (self, other, "DIA_Mark_Camp5_11_02"); //Ano troch� si� popierdoli�o.
	AI_Output (self, other, "DIA_Mark_Camp5_11_03"); //Sekciarze chyba przesadzili z zielem, bo stracili�my z nimi kontakt. Lepiej tam nie zagl�da�.
	AI_Output (self, other, "DIA_Mark_Camp5_11_04"); //W ka�dym razie jeszcze nikt nie wr�ci� stamt�d �ywy.	
	AI_Output (self, other, "DIA_Mark_Camp5_11_05"); //Gomez wyr�n�� mag�w ognia i chce zagarn�� wszystkie kopalnie dla siebie.
	AI_Output (self, other, "DIA_Mark_Camp5_11_06"); //Totalnie mu odbi�o, jak tak dalej p�jdzie, to unu�a ca�� Koloni� we krwi.
	AI_Output (self, other, "DIA_Mark_Camp5_11_07"); //A w Nowym Obozie p�ki co bez wi�kszych zmian. 
	AI_Output (self, other, "DIA_Mark_Camp5_11_08"); //Najemnicy i magowie wody wydobywaj� rud�, �eby przeprowadzi� jaki� rytua� i da� nog� z Kolonii.
	AI_Output (self, other, "DIA_Mark_Camp5_11_09"); //Ci kt�rzy mieli do�� pozosta�ych oboz�w przyszli tutaj.
	AI_Output (self, other, "DIA_Mark_Camp5_11_10"); //Jest jeszcze kilku �wir�w z obozu �owc�w, ale ich radz� omija� szerokim �ukiem.
	AI_Output (self, other, "DIA_Mark_Camp5_11_11"); //Dla nich liczy si� tylko zabijanie trolli i innego plugastwa.	
	
	B_LogEntry(CH1_Rbl_MarkInfo, "Obecnie w Kolonii pr�cz pozosta�ych oboz�w powsta�y jeszcze obozy rebeliant�w i �owc�w.");
};

// **************************************************

INSTANCE DIA_Mark_Camp6 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp6_Condition;
	information		= DIA_Mark_Camp6_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co to za Bezimienny?"; 
};

FUNC INT DIA_Mark_Camp6_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Camp4))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp6_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp6_15_01"); //Co to za Bezimienny?
	AI_Output (self, other, "DIA_Mark_Camp6_11_02"); //Cz�owieku, to dopiero jest opowie��!
	AI_Output (self, other, "DIA_Mark_Camp6_11_03"); //Je�eli chodzi o kataklizmy, kt�re nawiedzi�y Koloni� Karn� to do tej pory by�y trzy.
	AI_Output (self, other, "DIA_Mark_Camp6_11_04"); //Pierwszy to magiczna bariera, kt�r� stworzyli magowie Rhobara, �eby odizolowa� skaza�c�w od �wiata.
	AI_Output (self, other, "DIA_Mark_Camp6_11_05"); //Eksperyment zako�czy� si� uwi�zieniem mag�w, �mierci� �o�nierzy kr�la, a nasz monarcha musi teraz p�aci� za rud�.
	AI_Output (self, other, "DIA_Mark_Camp6_11_06"); //Kolejna tragedia to przej�cie w�adzy przez psychopat� Gomeza.
	AI_Output (self, other, "DIA_Mark_Camp6_11_07"); //Rze�nia by�a przednia, ale zabawa szybko si� sko�czy�a, kiedy si� okaza�o, �e powsta� nowy podzia� na lepszych i gorszych.
	AI_Output (self, other, "DIA_Mark_Camp6_11_08"); //Osobi�cie wola�em czasy sprzed Gomeza, przynajmniej cz�owiek by� pewien, �e nie obudzi si� z no�em w plecach, a co najwy�ej z czyim� kutasem w dupie.
	AI_Output (self, other, "DIA_Mark_Camp6_11_09"); //Ostatni kataklizm to przybycie do Kolonii Bezimiennego skaza�ca, kt�ry wsz�dzie w�ciubia� nos.
	AI_Output (self, other, "DIA_Mark_Camp6_11_10"); //To przez niego Gomez zabi� mag�w ognia i zaostrzy�a si� sytuacja w obozach.
	AI_Output (self, other, "DIA_Mark_Camp6_11_11"); //Ale te� dzi�ki niemu zacz�li�my walczy� o wolno�� i tylko on odwa�y� si� zrobi� co�, �eby zniszczy� barier�.
	AI_Output (self, other, "DIA_Mark_Camp6_11_12"); //Mo�e jest troch� dr�twy i cyniczny, ale pom�g� nam wi�cej ni� wszyscy kap�ani Adanosa razem wzi�ci. No i orkowie robi� pod siebie na jego widok!
	AI_Output (self, other, "DIA_Mark_Camp6_11_13"); //Powiem Ci, �e on zajdzie daleko. Nie zdziwi�bym si�, gdyby kiedy� wykopa� Rhobara i posadzi� dupsko na jego tronie.
	AI_Output (self, other, "DIA_Mark_Camp6_11_14"); //Ale po�yjemy, zobaczymy.
	AI_Output (self, other, "DIA_Mark_Camp6_11_15"); //Chcesz jeszcze o co� zapyta�?
	
	B_LogEntry(CH1_Rbl_MarkInfo, "Do Kolonii trafi� te� jaki� Bezimienny skazaniec, kt�ry sporo tu namiesza�. Chyba warto by�oby zrobi� z niego sojusznika.");
};

// **************************************************

INSTANCE DIA_Mark_Camp7 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp7_Condition;
	information		= DIA_Mark_Camp7_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jakie� dobre rady?"; 
};

FUNC INT DIA_Mark_Camp7_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Camp6))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp7_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp7_15_01"); //Jakie� dobre rady?
	AI_Output (self, other, "DIA_Mark_Camp7_11_02"); //Uwa�aj z kim rozmawiasz i co m�wisz.
	AI_Output (self, other, "DIA_Mark_Camp7_11_03"); //Czasem lepiej najpierw zabi�, a dopiero p�niej pyta�.
	AI_Output (self, other, "DIA_Mark_Camp7_11_04"); //Cho� z drugiej strony wtedy troch� mniej si� dowiesz...
	AI_Output (self, other, "DIA_Mark_Camp7_11_05"); //Zdob�d� szacunek tych, kt�rych powa�aj� inni, to najwi�ksze szumowiny dadz� Ci �y� i b�d� schodzi� z drogi.
	AI_Output (self, other, "DIA_Mark_Camp7_11_06"); //I nigdy, ale to nigdy, nie jedz tego, co przyrz�dzi� Snaf!
	AI_Output (self, other, "DIA_Mark_Camp7_11_07"); //No i jak k�adziesz si� spa�, to odwracaj si� ty�kiem do �ciany, bo r�nie bywa.
	AI_Output (self, other, "DIA_Mark_Camp7_11_08"); //A tak w og�le, po prostu uwa�aj na siebie.
	AI_Output (self, other, "DIA_Mark_Camp7_11_09"); //Kolonia Karna to paskudne miejsce. Cz�sto trzeba wybra� mniejsze z�o, albo si� zeszmaci�, �eby prze�y� i osi�gn�� zamierzony cel.
	AI_Output (self, other, "DIA_Mark_Camp7_11_10"); //Ostro�nie dobieraj przyjaci� i nie ganiaj za trollami, bo to nikomu jeszcze nie wysz�o na dobre!
	AI_Output (self, other, "DIA_Mark_Camp7_11_11"); //R�b co m�wi� i mo�e doczekasz czas�w, kiedy barier� szlag trafi. 
	AI_Output (other, self, "DIA_Mark_Camp7_15_12"); //Dzi�ki Mark. Sporo mi pomog�e�.
	AI_Output (self, other, "DIA_Mark_Camp7_11_13"); //Nie ma sprawy przyjacielu. Tylko nie daj si� zabi�, bo kogo ja wtedy b�d� zanudza�?
	AI_Output (self, other, "DIA_Mark_Camp7_11_14"); //Powodzenia na szlaku!
	
   B_LogSetTopicStatus	(CH1_Rbl_MarkInfo, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_MarkInfo, "Mark sporo mi pom�g�, wiele dowiedzia�em si� o Kolonii Karnej. Nie b�dzie �atwo, ale dam sobie rad�!");
};

//**************************************************

INSTANCE DIA_Mark_Spy (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 13;
	condition		= DIA_Mark_Spy_Condition;
	information		= DIA_Mark_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nie zauwa�y�e� czego� podejrzanego?"; 
};

FUNC INT DIA_Mark_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Spy_Info()
{
	AI_Output (other, self, "DIA_Mark_Spy_15_01"); //Nie zauwa�y�e� czego� podejrzanego?
	AI_Output (self, other, "DIA_Mark_Spy_11_02"); //Masz na my�li pirata wtykaj�cego wsz�dzie nos?
	AI_Output (other, self, "DIA_Mark_Spy_11_03"); //Pytam powa�nie. Kto� w obozie w�szy dla Gomeza.
	AI_Output (self, other, "DIA_Mark_Spy_11_04"); //O kurwa! To ju� po nas!
	AI_Output (other, self, "DIA_Mark_Spy_15_05"); //Ciszej, bo kto� nas us�yszy! Uspok�j si� i m�w, czy nie zauwa�y�e� czego� dziwnego.	
	AI_Output (self, other, "DIA_Mark_Spy_11_06"); //Hmm, tu nic nie jest normalne.
	AI_Output (self, other, "DIA_Mark_Spy_11_07"); //Ka�dy ma jakie� tajemnice, a ja wol� sie od nich trzyma� z daleka.
	AI_Output (self, other, "DIA_Mark_Spy_11_08"); //Popytaj innych, nie chc� sobie narobi� wrog�w.
	AI_Output (other, self, "DIA_Mark_Spy_11_09"); //Boisz si� kogo�?
	AI_Output (self, other, "DIA_Mark_Spy_11_10"); //Ja?!
	AI_Output (self, other, "DIA_Mark_Spy_11_11"); //Pewnie, �e si� boj�, idioto! Sram w gacie na widok w�asnego cienia, nawet gol� si� t�p� brzytw�.
	AI_Output (self, other, "DIA_Mark_Spy_11_12"); //Nie zamierzam zgrywa� bohatera, popytaj innych!

	B_LogEntry		(CH2_Rbl_Spy, "Mark o dziwo nie okaza� si� zbyt rozmowny. Wida�, �e kogo� si� boi i nie pu�ci pary z ust. Musz� spr�bowa� szcz�cia gdzie indziej.");

	B_StopProcessInfos	(self);
};

//**************************************************

INSTANCE DIA_Mark_Spy1 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 13;
	condition		= DIA_Mark_Spy1_Condition;
	information		= DIA_Mark_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kogo si� boisz?"; 
};

FUNC INT DIA_Mark_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Spy1_Info()
{
	AI_Output (other, self, "DIA_Mark_Spy1_15_01"); //Kogo si� boisz?
	AI_Output (self, other, "DIA_Mark_Spy1_11_02"); //Ciebie, ork�w, Gomeza, potrawek Snafa, ki�y, ch�do�onych mag�w...
	AI_Output (self, other, "DIA_Mark_Spy1_11_03"); //Mam wylicza� dalej?
	AI_Output (other, self, "DIA_Mark_Spy1_15_04"); //Nie trzeba. Szkoda na Ciebie traci� czas.
	AI_Output (self, other, "DIA_Mark_Spy1_11_05"); //Dok�adnie! Mark nie lubi rzuca� si� w oczy, dlatego wszyscy mnie lubi�.
	AI_Output (other, self, "DIA_Mark_Spy1_15_06"); //I niech tak zostanie. Bywaj.

	B_LogEntry		(CH2_Rbl_Spy, "Od Marka nie dowiem si� niczego, ten cz�owiek boi si� w�asnego cienia!");

	B_StopProcessInfos	(self);
};

//**************************************************

INSTANCE DIA_Mark_Stew (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Stew_Condition;
	information		= DIA_Mark_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie porcj� przepysznego gulaszu od Snafa."; 
};

FUNC INT DIA_Mark_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_Mark_Stew_15_01"); //Mam dla Ciebie porcj� przepysznego gulaszu od Snafa.
	AI_Output (self, other, "DIA_Mark_Stew_11_02"); //Zabierz to �wi�stwo ode mnie. Od potrawek Snafa mam koszmary.
   AI_Output (other, self, "DIA_Mark_Stew_15_03"); //We�miesz ten gulasz, czy mam Ci go pchn�� do gard�a?
   AI_Output (self, other, "DIA_Mark_Stew_11_04"); //Daj mi ten gulasz, jako� to prze�yj�.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Mark wspomnia�, �e ma koszmary od potraw Snafa, ale nak�oni�em go, �eby wzi�� porcj�."); 
}; 