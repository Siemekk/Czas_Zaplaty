//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Do zobaczenia.
	B_StopProcessInfos(self);
};

/********************

Gorn MUSI sta� przed Carlosem, przed bram� na Pola ry�owe, dopiero po tym dialogu wejdzie poza palisad�.

************************/

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Raport))
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Hej, nowa twarz.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Kim jeste�?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Nazywam si� Gorn. Jestem najemnikiem w s�u�bie mag�w.
	AI_Output (self, other,"DIA_Gorn_First1_09_03"); //Lub raczej by�em. Odk�d Nowy Ob�z upad�...
	AI_Output (other, self,"DIA_Gorn_First_15_04"); //Jak to upad�?
	AI_Output (self, other,"DIA_Gorn_First1_09_05"); //A tak to. Stra�nicy Gomeza znale�li przej�cie w g�rach, zaatakowali od ty�u. Jednocze�nie przeprowadzili frontalny atak, �eby odwr�ci� nasz� uwag�.
	AI_Output (self, other,"DIA_Gorn_First1_09_06"); //I jak wida� uda�o si� tym skurczybykom na ca�ej linii.
	AI_Output (other, self,"DIA_Gorn_First_15_07"); //Niech to szlag. Musz� opowiedzie� w obozie rebeliant�w, co si� tutaj wydarzy�o.
	AI_Output (self, other,"DIA_Gorn_First1_09_08"); //Jeste� cz�owiekiem Cavalorna? Pozdr�w ode mnie tego starego capa. 
	B_LogEntry(CH2_RBL_Raport, "Nowy Ob�z upad�! Podbili go stra�nicy i podporz�dkowali sobie tych, kt�rzy ocaleli. Musz� natychmiast z�o�y� raport Ratfordowi.");
	
	/*****************
Zmiana rutyny. Gorn po gadce ma wej�� do obozu i sta� z 10m przed bram� do w�a�ciwego obozu.

******************/
	B_Kapitelwechsel(3);	
	Npc_ExchangeRoutine(self,"OR");
   Wld_InsertNpc(ORG_833_Buster, "OW_PATH_056");
};

//*************************************

instance DIA_Gorn_What (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_What_Condition;
	information		= Dia_Gorn_What_Info;
	permanent		= 0;
	important		= 1;
	description		= "Jak leci?"; 
};

FUNC int DIA_Gorn_What_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_First))&&(!Npc_KnowsInfo (hero, DIA_Lee_RBLBegin))&&(Npc_KnowsInfo (hero, DIA_Cavalorn_SpyEnd))
	{
		return 1;
	};
};

func void DIA_Gorn_What_Info()
{
	AI_Output (other, self,"DIA_Gorn_What_15_01"); //Jak leci?
	AI_Output (self, other,"DIA_Gorn_What_09_02"); //Jak krew z nosa, ale mog�o by� gorzej.
};

//*************************************

instance DIA_Gorn_Rebel (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Rebel_Condition;
	information		= Dia_Gorn_Rebel_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak si� tu dosta�e�?"; 
};

FUNC int DIA_Gorn_Rebel_Condition()
{
	if (Npc_GetDistToWP(self, "NC_PATH87") < 500)
	{
		return 1;
	};
};

func void DIA_Gorn_Rebel_Info()
{
	AI_Output (other, self,"DIA_Gorn_Rebel_15_01"); //Jak si� tu dosta�e�?
	AI_Output (self, other,"DIA_Gorn_Rebel_09_02"); //Tak jak wszyscy. Zap�aci�em temu durniowi Carlosowi.
	AI_Output (other, self,"DIA_Gorn_Rebel_15_03"); //Musz� dosta� si� do obozu.
	AI_Output (self, other,"DIA_Gorn_Rebel_09_04"); //A po jak� choler�?
	AI_Output (other, self,"DIA_Gorn_Rebel_15_05"); //Mam swoje powody.
	AI_Output (self, other,"DIA_Gorn_Rebel_09_06"); //Co ty nie powiesz. A wetkn�� Ci kto� kiedy� top�r w dup�?!
	AI_Output (other, self,"DIA_Gorn_Rebel_15_07"); //Zaczekaj! Przysy�a mnie Cavalorn.
	AI_Output (self, other,"DIA_Gorn_Rebel_09_08"); //Ciszej!
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"DIA_Gorn_Rebel_09_09"); //Chod� za mn�. Pogadamy w spokojniejszym miejscu.
	B_StopProcessInfos(self);
   Npc_ExchangeRoutine(self,"talking");
};

//*************************************

instance DIA_Gorn_RebelTalk (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 4;
	condition		= Dia_Gorn_RebelTalk_Condition;
	information		= Dia_Gorn_RebelTalk_Info;
	permanent		= 0;
	important		= 1;
	description		= "Musz� dosta� si� do obozu."; 
};

FUNC int DIA_Gorn_RebelTalk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_Rebel)) && (Npc_GetDistToWP(self, "NC_DAM_BOTTOM") < 500)
	{
		return 1;
	};
};

func void DIA_Gorn_RebelTalk_Info()
{
	AI_Output (other, self,"DIA_Gorn_RebelTalk_15_00"); //Musz� dosta� si� do obozu.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_01"); //Dobra, m�w.
	AI_Output (other, self,"DIA_Gorn_RebelTalk_15_02"); //Podobno w waszym obozie nie wszyscy s� zadowoleni z obecnych rz�d�w.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_03"); //Ba, a kto by si� cieszy� robi�c na emerytur� Gomeza.
	AI_Output (other, self,"DIA_Gorn_RebelTalk_15_04"); //Nie wiem czy mog� Ci zaufa�...
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_05"); //Ch�opcze, tutaj nikt nikomu nie ufa! Ale mo�esz by� pewien, �e nie gram w zespole weso�ych muzykant�w Gomeza.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_06"); //Przed ca�ym tym zamieszaniem by�em najemnikiem. Sporo nabru�dzi�em stra�nikom.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_07"); //Po ataku o dziwo Gomez zarz�dzi�, �eby nie wy�yna� nikogo, ale co najwy�ej wtr�ca� do kopalni albo zagania� do pracy na polach ry�owych.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_08"); //Sporo najemnik�w przesz�o na stron� stra�nik�w.
	AI_Output (other, self,"DIA_Gorn_RebelTalk_15_09"); //Dlaczego?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_10"); //Dla rudy, ch�opcze. To jedyny pow�d. Ale my�l�, �e powr�t Lee sporo by zmieni�.
	
   if (!Npc_KnowsInfo (hero, DIA_Lee_Cord))
	{
		AI_Output (other, self,"DIA_Gorn_RebelTalk_15_11"); //Kto to jest Lee?
		AI_Output (self, other,"DIA_Gorn_RebelTalk_09_12"); //Lee to nasz przyw�dca, p�jdziemy za nim w paszcz� samego Beliara.
	};
   
	AI_Output (other, self,"DIA_Gorn_RebelTalk_15_13"); //A co Lee m�g�by tu zmieni�?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_14"); //Wszystko, ch�opcze. W tej chwili rebelianci s� rozproszeni. Z tego co wiem powsta�y trzy niezale�ne frakcje, na kt�rych czele stoj� Lares, Wilk i Torlof.
	lee_back = lee_back + 1;

	Log_CreateTopic	(CH4_NC_RBLBosses, LOG_MISSION);
	Log_SetTopicStatus	(CH4_NC_RBLBosses, LOG_RUNNING);
	B_LogEntry		(CH4_NC_RBLBosses, "Za rebeli� w Nowym Obozie stoi trzech ludzi: Torlof, Lares i Wilk. Ciekawe czy ten Triumwirat to przemy�lany tw�r?");
	B_LogEntry		(CH4_RBL_NCRebel, "Przyw�dcami rebelii s� Torlof, Lares i Wilk. Powinienem z nimi jak najszybciej porozmawia�.");
	Info_ClearChoices (DIA_Gorn_RebelTalk);
	Info_AddChoice (DIA_Gorn_RebelTalk, "Us�ysza�em ju� do��.", DIA_Gorn_RebelTalk_End);
	Info_AddChoice (DIA_Gorn_RebelTalk, "Kim jest Torlof?", DIA_Gorn_RebelTalk_Torlof);
	Info_AddChoice (DIA_Gorn_RebelTalk, "Wilk?", DIA_Gorn_RebelTalk_Wolf);
	Info_AddChoice (DIA_Gorn_RebelTalk, "Gdzie spotkam Laresa?", DIA_Gorn_RebelTalk_Lares);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Gorn_RebelTalk_Torlof()
{
	AI_Output (other, self,"DIA_Gorn_RebelTalk_Torlof_15_01"); //Kim jest Torlof?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_02"); //Torlof by� kiedy� kapitanem. Jak go znam to pewnie p�ywa� pod pirack� bander�.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_03"); //Kiedy trafi� do Koloni przysta� do najemnik�w.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_04"); //Podczas ataku na ob�z �wietnie radzi� sobie z pozorowanymi atakami i pu�apkami.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_05"); //Po wszystkim stra�nicy wtr�cili go do kopalni, bo zbytnio wda� im si� we znaki.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_06"); //Teraz to w�a�nie Torlof stoi na czele rebeliant�w w Kopalni.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_07"); //Niestety na jego g�owie jest tak�e limit dziennego wydobycia rudy.
	AI_Output (other, self,"DIA_Gorn_RebelTalk_Torlof_15_08"); //Co to znaczy?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_09"); //Ano to, �e jak kopacze nie wykonaj� normy to stra�nicy zabijaj� losowo wybranego pechowca.
	AI_Output (other, self,"DIA_Gorn_RebelTalk_Torlof_15_10"); //Cz�sto si� to zdarza?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_11"); //Rzadko, ale ostatnio zwi�kszono limity i teraz kopaczom jest naprawd� ci�ko. Ciesz� si�, �e mnie tam nie ma...
	B_LogEntry		(CH4_NC_RBLBosses, "Torlof przewodzi kopaczom i skaza�com z Nowej Kopalni. Torlof jest odpowiedzialny za dzienne limity rudy - nie wywi�zanie si� z wyrobu rudy ko�czy si� �mierci� losowo wybranego kopacza.");	
	//Info_ClearChoices (DIA_Gorn_RebelTalk);	
};

// -------------------------------------------------------------------

FUNC VOID DIA_Gorn_RebelTalk_Wolf()
{
	AI_Output (other, self,"DIA_Gorn_RebelTalk_Wolf_15_01"); //Wilk?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Wolf_09_02"); //Tak, jeden z naszych. By� najemnikiem, teraz jest na us�ugach stra�nik�w.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Wolf_09_03"); //Wilk wytwarza przednie �uki, a do tego tylko on potrafi zrobi� pancerz z p�ytek pe�zaczy.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Wolf_09_04"); //W�r�d stra�nik�w zapanowa�a moda na te cholerne p�ytki. Jak ze sraczk� kupuj� je od kopaczy, a Wilk utwardza nimi pancerze. 
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Wolf_09_05"); //Wilk stoi na czele rebeliant�w z Kot�a.
	B_LogEntry		(CH4_NC_RBLBosses, "Wilk przewodzi w Kotle. To doskona�y �uczarz, potrafi te� skleci� pancerz z p�ytek pe�zaczy.");	
	//Info_ClearChoices (DIA_Gorn_RebelTalk);			
};


// -------------------------------------------------------------------

FUNC VOID DIA_Gorn_RebelTalk_Lares()
{
	AI_Output (other, self,"DIA_Gorn_RebelTalk_Lares_15_01"); //Gdzie spotkam Laresa?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Lares_09_02"); //Na polu ry�owym. Dosta� fuch� Ry�owego Ksi�cia kiedy ten rado�nie zadynda� na stryku.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Lares_09_03"); //Lares odpowiada za zbiory ry�u. Podobnie jak Torlof ma okre�lone limity, kt�rych musi przestrzega�.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Lares_09_04"); //Kara za niewype�nienie przydzia��w jest identyczna jak w przypadku kopaczy.
	B_LogEntry		(CH4_NC_RBLBosses, "Lares przewodzi skaza�com na polu ry�owym, tak�e jest zwi�zany limitami zbioru ry�u.");	
	//Info_ClearChoices (DIA_Gorn_RebelTalk);			
};

// -------------------------------------------------------------------

FUNC VOID DIA_Gorn_RebelTalk_End()
{
	AI_Output (other, self,"DIA_Gorn_RebelTalk_End_15_01"); //Us�ysza�em ju� do��.
	Info_ClearChoices (DIA_Gorn_RebelTalk);			
	B_StopProcessInfos(self);
   Npc_ExchangeRoutine(self,"NC");
};

//*************************************

instance DIA_Gorn_Guards (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_Guards_Condition;
	information		= Dia_Gorn_Guards_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co do stra�nik�w - jak dostan� si� do obozu?"; 
};

FUNC int DIA_Gorn_Guards_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_RebelTalk))
	{
		return 1;
	};
};

func void DIA_Gorn_Guards_Info()
{
	AI_Output (other, self,"DIA_Gorn_Guards_15_01"); //Co do stra�nik�w - jak dostan� si� do obozu?
	AI_Output (self, other,"DIA_Gorn_Guards_09_02"); //Za du�o Ci w tym nie pomog�. Zabij jakiego� stra�nika i zabierz mu pancerz. Ci przy bramie to idioci, jako� ich przekonasz, �e powinni Ci� wpu�ci�.
	AI_Output (self, other,"DIA_Gorn_Guards_09_03"); //Aha. Mo�e to Ci si� przyda. Oficjalnie z ramienia Gomeza w obozie rz�dzi Fletcher. Ale szar� eminencj� jest tutaj Hrabia.
	AI_Output (other, self,"DIA_Gorn_Guards_15_04"); //W porz�dku, dzi�ki za rad�. Bywaj.
	AI_Output (self, other,"DIA_Gorn_Guards_09_05"); //Powodzenia, ch�opcze.
	
   B_LogEntry		(CH4_RBL_NCRebel, "Gorn powiedzia�, �e oficjalnie w obozie rz�dzi Fletcher, ale szar� eminencj� jest Hrabia. Ta informacja mo�e mi si� kiedy� przyda�.");
	B_StopProcessInfos	(self);
};

//*************************************

instance DIA_Gorn_LeeBack (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 7;
	condition		= Dia_Gorn_LeeBack_Condition;
	information		= Dia_Gorn_LeeBack_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znowu z Lee?"; 
};

FUNC int DIA_Gorn_LeeBack_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lee_RBLBegin))
	{
		return 1;
	};
};

func void DIA_Gorn_LeeBack_Info()
{
	AI_Output (other, self,"DIA_Gorn_LeeBack_15_01"); //Znowu z Lee?
	AI_Output (self, other,"DIA_Gorn_LeeBack_09_02"); //Jak za starych dobrych czas�w! Z ch�ci� poklepa�bym stra�nik�w toporem, ale Lee kaza� mi zosta� tutaj.
	AI_Output (other, self,"DIA_Gorn_LeeBack_15_03"); //Pewnie nie chce �eby jednoosobowa armia pod wodz� Gorna rozwi�za�a problem stra�nik�w przed nim.
	AI_Output (self, other,"DIA_Gorn_LeeBack_09_04"); //He, he, co� w tym jest. No nic, poczekamy, zobaczymy.
};

//*************************************

instance DIA_Gorn_TheRock (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 8;
	condition		= Dia_Gorn_TheRock_Condition;
	information		= Dia_Gorn_TheRock_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC int DIA_Gorn_TheRock_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lee_RBLFound))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

func void DIA_Gorn_TheRock_Info()
{
	var C_NPC flet; flet = Hlp_GetNpc(Grd_255_Fletcher);

	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Gorn_TheRock_09_01"); //Uwa�aj brachu, stra�nicy zaszyli si� na grani i za choler� nie mo�emy ich stamt�d wykurzy�.
	AI_Output (other, self,"DIA_Gorn_TheRock_15_02"); //Wiem o wszystkim, rozmawia�em z Lee. Co tu si� sta�o?
	AI_TurnToNpc(self, flet);
	AI_Output (self, other,"DIA_Gorn_TheRock_09_03"); //Zaatakowali�my. Jak widzisz to by� raczej g�upi pomys�. Fletcher i jego ho�ota mog� tam siedzie� jak d�ugo zechc�. Wczoraj jeden ze stra�nik�w, prawie nasika� mi na g�ow�!
	AI_Output (other, self,"DIA_Gorn_TheRock_15_04"); //Lee poleci� mi dowiedzie� si� od Flethera wszystkiego co dotyczy Orlego Gniazda.
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Gorn_TheRock_09_05"); //Tfu. Ten kasztel jest przekl�ty, m�wi� Ci. Kiedy rozpocz�o si� zamieszanie w Orlim Gnie�dzie ze sto�pu dochodzi�y nieludzkie krzyki, a� mnie ciarki przesz�y.
	AI_Output (self, other,"DIA_Gorn_TheRock_09_06"); //Kto� wtedy wyszed� na blanki i krzykn�� co� do Fletchera. Szkoda, �e nie widzia�e� przera�enia na twarzy tego dupka.
	AI_Output (self, other,"DIA_Gorn_TheRock_09_07"); //Nie�le si� zdziwi�em kiedy Fletcher na czele stra�nik�w rzuci� si� w nasz� stron�. Te sukinsyny bi�y si� jak demony i musz� przyzna�, �e zas�u�enie przebili sobie drog� przez nasze szeregi.
	AI_Output (self, other,"DIA_Gorn_TheRock_09_08"); //�cigali�my stra�nik�w a� do grani. Po pierwszym ataku dali�my sobie spok�j, szkoda traci� ludzi.
	AI_Output (other, self,"DIA_Gorn_TheRock_15_09"); //Jak sytuacja wygl�da teraz?
	AI_Output (self, other,"DIA_Gorn_TheRock_09_10"); //Staramy si� nie podchodzi� za blisko, ale jakby troch� przycich�o.
	AI_Output (self, other,"DIA_Gorn_TheRock_09_11"); //To znaczy w nocy co� s�yszeli�my, jakby zduszony krzyk. Oczywi�cie nikt z nas nie kwapi� si�, �eby to sprawdzi�.
	AI_Output (self, other,"DIA_Gorn_TheRock_09_12"); //A� mnie r�ce �wierzbi�, �eby dorwa� Fletchera, ale Lee kaza� tu przycupn�� i czeka�. Zdaje si�, �e to Ty masz odwali� ca�� brudn� robot�.
	AI_Output (other, self,"DIA_Gorn_TheRock_15_13"); //Ano, co� ostatnio pech mnie prze�laduje. Dobra, w�a�� na gra�, zobaczymy co tam znajd�...
	AI_Output (self, other,"DIA_Gorn_TheRock_09_14"); //Nie daj si� zabi�!

	B_LogEntry		(CH5_NC_TheRock,	"Gorn powiedzia� mi, �e kiedy wybuch�o zamieszanie w Orlim Gnie�dzie kto� pojawi� si� na blankach i to na jego widok Fletcher uciek� spod mur�w. Gorn twierdzi, �e na grani jakby przycich�o. Mo�e powinienem spr�bowa� si� tam wspi��?");
};

//*************************************

instance DIA_Gorn_TheRockback (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 9;
	condition		= Dia_Gorn_TheRockback_Condition;
	information		= Dia_Gorn_TheRockback_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC int DIA_Gorn_TheRockback_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fletcher_TheRock1))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

func void DIA_Gorn_TheRockback_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Gorn_TheRockback_09_01"); //Wr�ci�e�! Co z Fletcherem?
	AI_Output (other, self,"DIA_Gorn_TheRockback_15_02"); //Nie �yje.
	AI_Output (self, other,"DIA_Gorn_TheRockback_09_03"); //Co?! Nie s�ysza�em odg�os�w walki.
	AI_Output (other, self,"DIA_Gorn_TheRockback_15_04"); //Jaki� demon w nocy za�atwi� wszystkich stra�nik�w. Fletcherowi rozpru� bebechy, �eby d�u�ej zdycha�.
	AI_Output (other, self,"DIA_Gorn_TheRockback_15_05"); //Skr�ci�em jego m�ki.
	AI_Output (self, other,"DIA_Gorn_TheRockback_09_06"); //Niech to szlag, nie cierpi� demon�w! Powiedz o wszystkim Lee, ja zostan� tu z ch�opakami na wszelki wypadek.
	AI_Output (other, self,"DIA_Gorn_TheRockback_15_07"); //Bywaj, Gorn.
	B_LogEntry		(CH5_NC_TheRock,	"Czas zda� relacj� Lee.");

	/************************
Ork w tym miejscu misisz oczy�ci� barykad� Wilka, czyli stra�nik�w zamie� w trupy + kilku ludzi wilka, a Wilk niech stoi gdzie� przed wej�ciem do siedziby mag�w

***********************/
};

INSTANCE DIA_Gorn_CanYouTeachMe (C_INFO)
{
	npc				= PC_Fighter;
	//nr				= 71;
	condition		= DIA_Gorn_CanYouTeachMe_Condition;
	information		= DIA_Gorn_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Gorn_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Gorn_What))
	{
		return 1;
	};
};

FUNC VOID DIA_Gorn_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Gorn_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Gorn_CanYouTeachMe_12_02"); //Widzisz te bicepsy? Znam sporo �wicze� na nabranie krzepy.
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Gorn pomo�e mi nabra� krzepy.");
};