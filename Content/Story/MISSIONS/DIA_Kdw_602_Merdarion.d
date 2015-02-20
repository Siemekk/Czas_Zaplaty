// ************************ EXIT **************************

instance  Info_Merdarion_EXIT (C_INFO)
{
	npc			= KDW_602_Merdarion;
	nr			= 999;
	condition	= Info_Merdarion_EXIT_Condition;
	information	= Info_Merdarion_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Merdarion_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Merdarion_Hi (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  1;	
	condition	=  DIA_Merdarion_Hi_Condition;
	information	=  DIA_Merdarion_Hi_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co porabiasz?";
};                       

FUNC int  DIA_Merdarion_Hi_Condition()
{
	return 1;
};

FUNC VOID  DIA_Merdarion_Hi_Info()
{
	AI_Output (other, self,"DIA_Merdarion_Hi_15_01"); //Co porabiasz?
	AI_Output (self, other,"DIA_Merdarion_Hi_08_02"); //Wybacz, nie mog� teraz rozmawia�.
	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Merdarion_Problem (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  2;	
	condition	=  DIA_Merdarion_Problem_Condition;
	information	=  DIA_Merdarion_Problem_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mam problem z ornamentami.";
};                       

FUNC int  DIA_Merdarion_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cronos_Wait))
	{
		return 1;
	};
};

FUNC VOID  DIA_Merdarion_Problem_Info()
{
	AI_Output (other, self,"DIA_Merdarion_Problem_15_01"); //Mam problem z ornamentami.
	AI_Output (self, other,"DIA_Merdarion_Problem_08_02"); //Jak my wszyscy, a dok�adniej z ich brakiem.
	AI_Output (other, self,"DIA_Merdarion_Problem_15_03"); //Kto� ci�gle jest o krok przede mn�.
	AI_Output (self, other,"DIA_Merdarion_Problem_08_04"); //Kto taki?
	AI_Output (other, self,"DIA_Merdarion_Problem_15_05"); //Nazywa si� Hrabia. S�u�y kt�remu� z magnat�w.
	AI_Output (self, other,"DIA_Merdarion_Problem_08_06"); //Ale jak magnaci dowiedzieli si� o ornamentach? To bez sensu...
	AI_Output (self, other,"DIA_Merdarion_Problem_08_07"); //Chocia�...
	AI_Output (self, other,"DIA_Merdarion_Problem_08_08"); //Dowiedz si�, dla kt�rego z magnat�w pracuje Hrabia. 
	AI_Output (self, other,"DIA_Merdarion_Problem_08_09"); //To pomo�e nam przedsi�wzi�� dalsze kroki.
	AI_Output (other, self,"DIA_Merdarion_Problem_15_10"); //B�d� mia� to na uwadze.

	B_LogEntry(CH3_NON_Seekers, "Merdarion poprosi� mnie, �ebym dowiedzia� si�, kt�remu z magnat�w s�u�y Hrabia.");
};

// *****************************************

instance DIA_Merdarion_Crow (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  3;	
	condition	=  DIA_Merdarion_Crow_Condition;
	information	=  DIA_Merdarion_Crow_Info;
	permanent	= 0;
	important 	= 0;
	description 	= "Wiem, czyje rozkazy wykonuje Hrabia.";
};                       

FUNC int  DIA_Merdarion_Crow_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hrabia_FindThief1))
	{
		return 1;
	};
};

FUNC VOID  DIA_Merdarion_Crow_Info()
{
	AI_Output (other, self,"DIA_Merdarion_Crow_15_01"); //Wiem, czyje rozkazy wykonuje Hrabia.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_02"); //To Kruk, prawda?
	AI_Output (other, self,"DIA_Merdarion_Crow_15_03"); //Sk�d wiedzia�e�?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_04"); //Tego si� obawia�em. 
	AI_Output (self, other,"DIA_Merdarion_Crow_08_05"); //Kruk kontaktowa� si� z nami przez kurier�w jeszcze przed zamordowaniem mag�w ognia.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_06"); //G��wnie ja z nim korespondowa�em i to wbrew zakazom Saturasa.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_07"); //Dlaczego?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_08"); //Kruk posiad� pewien staro�ytny wolumin, w kt�rym spisano histori� dawnej rasy �yj�cej w Jarkendarze.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_09"); //Czym jest ten Jarkendar?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_10"); //To staro�ytna kraina, onegdaj w�adali tam pot�ni �miertelnicy. Jednak wszystko ma sw�j pocz�tek jak i koniec.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_11"); //W�adza, zdrada i zag�ada...
	AI_Output (self, other,"DIA_Merdarion_Crow_08_12"); //Nie ma ju� staro�ytnych, pozosta�o jednak wiele pyta� bez odpowiedzi, a tak�e pot�ga, kt�r� pozostawiono bez stra�nika.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_13"); //Kruk nie potrafi� odczyta� staro�ytnego j�zyka, w kt�rym spisano wolumin.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_14"); //Ja po cz�ci potrafi� przet�umaczy� te znaki, ale nie mam ksi�gi.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_15"); //Spotkali�cie si�?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_16"); //Tak, ale tylko raz.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_17"); //Saturas o tym wiedzia�?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_18"); //Nie, ale po spotkaniu wyjawi�em mu prawd�, a tak�e pobudki, kt�re mn� kierowa�y.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_19"); //Kruk przyby� w towarzystwie Hrabiego. Pokaza� mi ksi�g� i za��da�, �ebym j� przet�umaczy�.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_20"); //Kiedy zobaczy�em inkanuba�... A� kipia� mrokiem Beliara. Wyrwa�em wolumin i teleportowa�em si� na o�lep.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_21"); //Trafi�em do jakiej� zatopionej wie�y, w kt�rej a� cuchn�o od nekromancji. Ukry�em wolumin w jednej ze skrzy� i teleportowa�em si� z powrotem.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_22"); //Dlaczego nie zabra�e� ksi�gi ze sob�?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_23"); //Bo te piktogramy to nie by� j�zyk staro�ytnych... To by�a mroczna mowa!
	AI_Output (self, other,"DIA_Merdarion_Crow_08_24"); //Ten manuskrypt po�wi�cono Beliarowi. Ledwo prze�y�em kontakt z ksi�g�.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_25"); //St�d w�a�nie pojawi�a si� skaza u Kruka.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_26"); //Jestem pewien, �e Beliar op�ta� go, magnat nie jest ju� sob�.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_27"); //Zrobi wszystko by dosta� si� do Jarkendaru, gdzie z�o wzi�o sw�j pocz�tek.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_28"); //Jak to si� zacz�o?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_29"); //Nienawi�� dw�ch braci - Innosa i Beliara.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_30"); //Tam w�a�nie wykuto szpon Beliara, straszliwe ostrze, kt�re jest tym pot�niejsze, im silniejszy jest ten, kto nim w�ada.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_31"); //Tam te� stworzono opok� Innosa, tarcz�, kt�ra mo�e odbi� ka�dy czar do �r�d�a i daje temu, kt�ry j� nosi niewra�liwo�� na ogie�.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_32"); //Dwa pot�ne artefakty w jednej krainie. Kasty, kt�re rozp�ta�y bratob�jcz� walk�, rzeka ognia i krwi, kt�ra poch�on�a wszystkich �miertelnik�w...
	AI_Output (self, other,"DIA_Merdarion_Crow_08_33"); //Jestem pewien, �e Kruk chce zdoby� szpon Beliara.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_34"); //Magnat s�dzi�, �e znajdzie odpowiedzi w ksi�dze, kt�r� wzi�� za wolumin napisany przez staro�ytnych.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_35"); //Musia� gdzie� przeczyta� o Jarkendarze.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_36"); //Dlatego w�a�nie porzuci�em almanach i mam nadziej�, �e nikt go ju� nie odnajdzie. Niech spoczywa w tej plugawej wie�y po wsze czasy.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_37"); //Rozumiem, �e ka�dy kto wejdzie w posiadanie woluminu zostanie op�tany przez Beliara?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_38"); //Pr�dzej b�d� p�niej, ale tak. Ksi�g� spisano ludzk� krwi� i nikt kto w�ada magi� inn� ni� Beliara, nie powinien jej nawet dotyka�.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_39"); //Ale tobie si� uda�o.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_40"); //Kontakt by� zbyt kr�tki. To mnie ocali�o.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_41"); //Wybra�em losowy teleport, ale ksi�ga zniekszta�ci�a zakl�cie, wolumin sam wybra� miejsce, do kt�rego chcia� trafi�.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_42"); //Ta wie�a... Do dzisiaj przechodz� mnie ciarki, kiedy pomy�l� o tym miejscu.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_43"); //Hmm... To co powiedzia�e� da�o mi do my�lenia. Bywaj.
	
   //Mob_CreateItems ("OC_CHEST_RAVEN", ItKe_SunkenTower, 1); //klucz dodany jest ju� do skrzyni w zenie
	B_LogEntry(CH3_NON_Seekers, "Sporo si� dowiedzia�em od Merdariona. Z opowie�ci maga wynika, �e Kruk zosta� op�tany przez Beliara i �e magnat pragnie dosta� w swoje �apska jaki� szpon Beliara ukryty gdzie� w Jarkendarze. Nie wiem, co z tego wyniknie... Merdarion ukry� jaki� plugawy manuskrypt Beliara w starej wie�y nekromanty.");
};

/****************************

Ork w starej wie�y Xardasa powinny by� pot�ne demony Beliara, mo�e jaki� ksi��e demon�w, kt�ry przepuszcza tylko Kruka.
magnat ukry� 3 ornamenty w skrzyni. Klucz jest w skrzyni tam gzie Kruk �pi, czyli Dick musi zakra�� si� do zamku i obrobi� skrzyni�.
Pewnie ju� to dawno zrobi� podczas zada� z broni� dla Urta wi�c luzik.
MAGICTOWER_03 �rodek
MAGICTOWER_02 wejscie
ItKe_SunkenTower - klucz do skrzyni
orn1-orn4

****************************/

// *****************************************

instance DIA_Merdarion_Aura (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  5;	
	condition	=  DIA_Merdarion_Aura_Condition;
	information	=  DIA_Merdarion_Aura_Info;
	permanent	= 0;
	important 	= 0;
	description 	= "Hrabia da� nam ultimatum.";
};                       

FUNC int  DIA_Merdarion_Aura_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Konwer))
	{
		return 1;
	};
};

FUNC VOID  DIA_Merdarion_Aura_Info()
{
   Mob_CreateItems ("CHEST_ORNAMENTS", orn1, 1); 
   Mob_CreateItems ("CHEST_ORNAMENTS", orn2, 1); 
   Mob_CreateItems ("CHEST_ORNAMENTS", orn4, 1); 

	AI_Output (other, self,"DIA_Merdarion_Aura_15_01"); //Hrabia da� nam ultimatum.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_02"); //Co takiego?
	AI_Output (other, self,"DIA_Merdarion_Aura_15_03"); //Je�eli nie zwr�c� mu ornamentu, kt�ry odda�em Cronosowi, sam po niego przyjdzie.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_04"); //Nie masz chyba zamiaru uk�ada� si� z tym... �ajdakiem?
	AI_Output (other, self,"DIA_Merdarion_Aura_15_05"); //Nie mam wyboru, musz� odnale�� ornamenty, kt�re Hrabia odda� Krukowi.
	AI_Output (other, self,"DIA_Merdarion_Aura_15_06"); //Niestety Saturas nie mo�e wykry� aury ornament�w. Powiedzia�, �e musi je t�umi� jaka� inna, antagonistyczna aura.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_07"); //Znam tylko jedno miejsce w Kolonii, gdzie aura Beliara jest tak pot�na. To zatopiona wie�a nekromanty.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_08"); //Kruk musia� o niej wiedzie�. To idealne miejsce na ukrycie ornament�w.
	AI_Output (other, self,"DIA_Merdarion_Aura_15_09"); //Mam si� zapu�ci� do zatopionej wie�y nekromanty? Nie jestem a� takim szale�cem!
	AI_Output (self, other,"DIA_Merdarion_Aura_08_10"); //Nie powinno by� tak �le. Z tego co wiem, Xardas opu�ci� j� jaki� czas temu.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_11"); //W wie�y znajdziesz co najwy�ej troch� przywo�anych s�ug.
	AI_Output (other, self,"DIA_Merdarion_Aura_15_12"); //I tak nie mam wyboru. Gdzie znajd� t� wie��?
	AI_Output (self, other,"DIA_Merdarion_Aura_08_13"); //Id�c do kamiennej cytadeli, tam gdzie harpie maj� sw�j dom, skr�� w prawo, napotkasz sznurowy most prowadz�cy do ruin twierdzy. 
	AI_Output (self, other,"DIA_Merdarion_Aura_08_14"); //Z mostu wida� niewielkie jezioro z wysepk�, na kt�rej znajdziesz wej�cie do zatopionej wie�y.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_15"); //Mo�esz te� spr�bowa� poszuka� przej�cia przez orkowe tereny, ale to bardziej niebezpieczna droga.
	AI_Output (other, self,"DIA_Merdarion_Aura_15_16"); //Dzi�ki, magu. Ruszam bo czas nagli.
	B_LogEntry(CH3_NON_Seekers, "Merdarion twierdzi, �e Kruk m�g� ukry� ornamenty w zatopionej wie�y nekromanty Xardasa. Czeka mnie niezbyt mi�y spacer...");
};

// *****************************************

instance DIA_Merdarion_Find (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  6;	
	condition	=  DIA_Merdarion_Find_Condition;
	information	=  DIA_Merdarion_Find_Info;
	permanent	= 0;
	important 	= 0;
	description 	= "Znalaz�em ornamenty!";
};                       

FUNC int  DIA_Merdarion_Find_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Merdarion_Aura))&&(!Npc_KnowsInfo(hero,Info_Saturas_Find))&&(NPC_HasItems(hero,orn1)>=1)&&(NPC_HasItems(hero,orn2)>=1)&&(NPC_HasItems(hero,orn4)>=1)
	{
		return 1;
	};
};

FUNC VOID  DIA_Merdarion_Find_Info()
{
	AI_Output (other, self,"DIA_Merdarion_Find_15_01"); //Znalaz�em ornamenty!
	if (ornament_wait >= (Wld_GetDay()))
	{
		AI_Output (self, other,"DIA_Merdarion_Find_08_02"); //Niech Adanosowi b�d� dzi�ki!
		AI_Output (self, other,"DIA_Merdarion_Find_08_03"); //Natychmiast powiedz to Saturasowi.
	}
	else
	{
		AI_Output (self, other,"DIA_Merdarion_Find_08_04"); //Sp�ni�e� si�... Ornamenty s� teraz tylko bezwarto�ciowymi kawa�kami kamienia...
	};
   
	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Merdarion_FindAll (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  7;	
	condition	=  DIA_Merdarion_FindAll_Condition;
	information	=  DIA_Merdarion_FindAll_Info;
	permanent	= 0;
	important 	= 0;
	description 	= "Saturas chce rozpocz�� rytua�.";
};                       

FUNC int  DIA_Merdarion_FindAll_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Merdarion_Aura))&&(ritual_time_ok == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Merdarion_FindAll_Info()
{
	AI_Output (other, self,"DIA_Merdarion_FindAll_15_01"); //Saturas chce rozpocz�� rytua�.
   
	if (ornament_wait >= Wld_GetDay())
	{
		AI_Output (self, other,"DIA_Merdarion_FindAll_08_02"); //W ko�cu uwolnimy si� od tej cholernej bariery.
		AI_Output (self, other,"DIA_Merdarion_FindAll_08_03"); //Ju� id�.
		B_LogEntry(CH3_NON_Ornament, "Merdarion ruszy� do komnaty.");
		Npc_ExchangeRoutine(self,"RIT");
	}
	else
	{
		AI_Output (self, other,"DIA_Merdarion_FindAll_08_04"); //Sp�ni�e� si�... Wszystko stracone!
	};
   
	B_StopProcessInfos(self);
};
