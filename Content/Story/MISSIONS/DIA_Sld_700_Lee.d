//*********************************************************
//							EXIT									
//*********************************************************

instance  DIA_700_Lee_Exit (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  999;
	condition	=  DIA_700_Lee_Exit_Condition;
	information	=  DIA_700_Lee_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_700_Lee_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_700_Lee_Exit_Info()
{
	B_StopProcessInfos	(self);
};

//*********************************************************
//						Greet									
//*********************************************************

instance  DIA_Lee_Hello(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  DIA_Lee_Hello_Condition;
	information	=  DIA_Lee_Hello_Info;
	permanent	=  0;
	description = "Paskudnie to wygl�da.";
};                       

FUNC int  DIA_Lee_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Lee_Hello_Info()
{
	AI_Output (other, self,"DIA_Lee_Hello_15_00"); //Paskudnie to wygl�da.
	AI_Output (self, other,"DIA_Lee_Hello_08_01"); //O czym Ty m�wisz?
	AI_Output (other, self,"DIA_Lee_Hello_15_02"); //O twojej ranie, przecie� nie o mordzie tego wielkoluda w sali z klatkami.
	AI_Output (self, other,"DIA_Lee_Hello_08_03"); //Masz szcz�cie, �e w bitwie Orik dosta� przez �eb i st�pia� mu s�uch.
	AI_Output (self, other,"DIA_Lee_Hello_08_04"); //Co do rany, to magowie uratowali mi ty�ek, dlatego nadal tu jestem. Zawsze sp�acam zaci�gni�te d�ugi.
};

//*********************************************************

instance  DIA_Lee_Who(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  2;
	condition	=  DIA_Lee_Who_Condition;
	information	=  DIA_Lee_Who_Info;
	important		= 0;
	permanent		= 0;
	description = "Kim jeste�?";
};                       

FUNC int  DIA_Lee_Who_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Who_Info()
{
	AI_Output (other, self,"DIA_Lee_Who_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_Lee_Who_08_01"); //Kiedy� by�em genera�em, teraz jestem najemnikiem. Mo�esz nazywa� mnie Lee.
	AI_Output (other, self,"DIA_Lee_Who_15_02"); //Ciekawa historia...
	AI_Output (self, other,"DIA_Lee_Who_08_03"); //Raczej nudna, ale to nie Twoja sprawa.
	
   B_StopProcessInfos(self);
};

//*********************************************************

instance DIA_Lee_Cord (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  3;
	condition	=  DIA_Lee_Cord_Condition;
	information	=  DIA_Lee_Cord_Info;
   important		= 1;
	description = "";
};                       

FUNC int DIA_Lee_Cord_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_Who))&&(Npc_KnowsInfo(hero,DIA_Cord_Question))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Cord_Info()
{
   lee_offer = TRUE;
   AI_Output (self, other,"DIA_Lee_Cord_08_01"); //Cord m�wi�, �e spotka�e� Jarvisa. Da�by� rad� znowu go odnale��?
   AI_Output (other, self,"DIA_Lee_Cord_15_02"); //Pewnie. A dlaczego pytasz?
   AI_Output (self, other,"DIA_Lee_Cord_08_03"); //Musz� co� mu przekaza�, a brakuje mi ludzi. Co Ty na to?
   AI_Output (other, self,"DIA_Lee_Cord_15_04"); //Pod jednym warunkiem. Zap�acisz mi za poprzedni� wiadomo�� od Jarvisa.
   AI_Output (other, self,"DIA_Lee_Cord_15_05"); //Mia�em otrzyma� tyle rudy ile ud�wign�, a Cord zwyczajnie mnie sp�awi�.
   AI_Output (self, other,"DIA_Lee_Cord_08_06"); //Zrobimy tak. Dam Ci teraz 1000 bry�ek. Je�eli zrobisz to o co Ci� poprosz�, otrzymasz drugie tyle i widoki na wi�cej.
   AI_Output (self, other,"DIA_Lee_Cord_08_07"); //Co Ty na to?

	Info_ClearChoices (DIA_Lee_Cord);
	Info_AddChoice (DIA_Lee_Cord, "Rudy nigdy za wiele.", DIA_Lee_Cord_Yes);
	Info_AddChoice (DIA_Lee_Cord, "Zastanowi� si�.", DIA_Lee_Cord_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Lee_Cord_Yes()
{
	lee_offer_condition = 1;
	CreateInvItems (self,ItMiNugget,1000);//ruda
	B_GiveInvItems (self, other, ItMiNugget, 1000);
	AI_Output (other, self,"DIA_Lee_Cord_Yes_15_01"); //Rudy nigdy za wiele.
	AI_Output (self, other,"DIA_Lee_Cord_Yes_08_02"); //Te� tak m�wi�.
	AI_Output (self, other,"DIA_Lee_Cord_Yes_08_03"); //Powiedz Jarvisowi, �e potrzebujemy jeszcze jednego 'wzorca'. B�dzie wiedzia� o co chodzi.
	AI_Output (other, self,"DIA_Lee_Cord_Yes_15_04"); //Co to za wzorzec?
	AI_Output (self, other,"DIA_Lee_Cord_Yes_08_05"); //Gdybym to zdradzi�, musia�bym Ci� zabi�.
	AI_Output (self, other,"DIA_Lee_Cord_Yes_08_06"); //Ruszaj i pami�taj, �e im mniej wiesz, tym lepiej dla ciebie.
	
   B_LogEntry(CH3_NON_Mercenary, "Dziwna sprawa z tymi najemnikami. Co� kombinuj�, ale na razie nic z nich nie wyci�gn��em. Mam znowu odnale�� Jarvisa i przekaza� mu, �e najemnicy potrzebuj� jeszcze jednego wzorca. ");
	B_StopProcessInfos(self);
};

// ---------------------------No----------------------------------------

FUNC VOID DIA_Lee_Cord_No()
{
	AI_Output (other, self,"DIA_Lee_Cord_No_15_01"); //Zastanowi� si�.
	AI_Output (self, other,"DIA_Lee_Cord_No_08_02"); //Skoro musisz.
	B_StopProcessInfos(self);
};

instance DIA_Lee_Cord2 (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  3;
	condition	=  DIA_Lee_Cord2_Condition;
	information	=  DIA_Lee_Cord_Yes;
	description = "Zmieni�em zdanie.";
};

func int DIA_Lee_Cord2_Condition()
{
   if (Npc_KnowsInfo(hero, DIA_Lee_Cord))&&(!lee_offer_condition)
	{
		return 1;
	};
};
//*********************************************************

instance DIA_Lee_Trap(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  4;
	condition	=  DIA_Lee_Trap_Condition;
	information	=  DIA_Lee_Trap_Info;
	important		= 0;
	permanent		= 0;
	description = "Musimy porozmawia�.";
};                       

FUNC int  DIA_Lee_Trap_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_LeeCamp))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Trap_Info()
{
	AI_Output (other, self,"DIA_Lee_Trap_15_00"); //Musimy porozmawia�.
	AI_Output (self, other,"DIA_Lee_Trap_08_01"); //Widzia�em Jarvisa. Co si� sta�o?
	AI_Output (other, self,"DIA_Lee_Trap_15_02"); //Hrabia zdoby� drugi kawa�ek ornamentu...
	AI_Output (self, other,"DIA_Lee_Trap_08_03"); //Sk�d... Jarvis! Zawsze mia� za d�ugi j�zyk, chyba powinienem mu go obci��.
	AI_Output (other, self,"DIA_Lee_Trap_15_04"); //Nic ju� nie zmieni faktu, �e ja te� jestem w to wpl�tany. Poza tym mam do porozmawiania z tym Hrabi�. Powiedzmy, �e to sprawy osobiste.
	AI_Output (other, self,"DIA_Lee_Trap_15_05"); //O co chodzi z ornamentami?
	AI_Output (self, other,"DIA_Lee_Trap_08_06"); //Dobra i tak ju� wiesz wi�cej, ni� powiniene�.
	AI_Output (self, other,"DIA_Lee_Trap_08_07"); //Byli�my najemnikami na us�ugach mag�w wody. Kiedy stra�nicy zaatakowali ob�z, walczyli�my do ko�ca. Nie by�o �atwo...
	AI_Output (self, other,"DIA_Lee_Trap_08_08"); //Dosta�em przez �ebra, reszta te� nie wygl�da�a najlepiej. Stra�nik�w nadal przybywa�o. Musieli znale�� tajne przej�cie przez g�ry.
	AI_Output (self, other,"DIA_Lee_Trap_08_09"); //Magowie odprawili rytua� teleportacji. W ostatniej chwili widz�c, �e ju� po nas Saturas obj�� i nas zakl�ciem.
	AI_Output (self, other,"DIA_Lee_Trap_08_10"); //Uratowa� mi �ycie, a ja zawsze sp�acam d�ugi. Riordian posk�ada� nas do kupy.
	AI_Output (other, self,"DIA_Lee_Trap_15_11"); //Ale co to ma wsp�lnego z ornamentami?
	AI_Output (self, other,"DIA_Lee_Trap_08_12"); //Magowie wody wyniuchali jaki� spos�b na wydostanie si� z Kolonii.
	AI_Output (self, other,"DIA_Lee_Trap_08_13"); //Odczytali piktogramy na �cianach �wi�tyni. Saturas zdo�a� utworzy� map� na podstawie zapisk�w na �cianach.
	AI_Output (self, other,"DIA_Lee_Trap_08_14"); //Mapa wskazuje miejsca ukrycia czterech cz�ci ornamentu, kt�rego potrzebuj� magowie.
	AI_Output (self, other,"DIA_Lee_Trap_08_15"); //Saturas powiedzia�, �e je�eli pomo�emy im odnale�� kawa�ki ornamentu, to b�dziemy kwita.
	AI_Output (self, other,"DIA_Lee_Trap_08_16"); //Dlatego pomagam magom. Kiedy tylko z nimi sko�cz�, wracam do Nowego Obozu skopa� dupy stra�nikom i przywr�ci� wolno�� najemnikom.
	AI_Output (self, other,"DIA_Lee_Trap_08_17"); //Potem wyniesiemy si� z tej zapad�ej dziury, bo mam do sp�acenia jeszcze jeden d�ug...
	AI_Output (other, self,"DIA_Lee_Trap_15_18"); //Nie chc� by� ciekawski, ale co to za d�ug?
	AI_Output (self, other,"DIA_Lee_Trap_08_19"); //To nie jest �adna tajemnica. 
	AI_Output (self, other,"DIA_Lee_Trap_08_20"); //By�em kiedy� genera�em i przyjacielem Rhobara.
	AI_Output (self, other,"DIA_Lee_Trap_08_21"); //Magnatom nie spodoba�o si� to, �e zwyk�y �o�nierz jest powiernikiem kr�la. Do tego za tym wojakiem sta�a ca�a armia Myrtany. �o�nierze poszliby za mn� w ogie�.
	AI_Output (self, other,"DIA_Lee_Trap_08_22"); //Magnaci uknuli spisek, kt�rego ofiar� pad�a �ona Rhobara. Oczywi�cie zabito j� moim sztyletem.
	AI_Output (self, other,"DIA_Lee_Trap_08_23"); //Proces by� kr�tki. Rhobar ze wzgl�du na zas�ugi i przyja�� zes�a� mnie do Kolonii.
	AI_Output (self, other,"DIA_Lee_Trap_08_24"); //Mam zamiar wr�ci� do Myrtany i odp�aci� magnatom dobrym za nadobne.
	AI_Output (other, self,"DIA_Lee_Trap_15_25"); //�ycia up�ywa w strugach g�wna, przyjacielu.
	AI_Output (self, other,"DIA_Lee_Trap_08_26"); //�wi�te s�owa. 
	AI_Output (self, other,"DIA_Lee_Trap_08_27"); //Wystarczy ju� tych pogaw�dek, wr�� kiedy b�dziesz got�w na wypraw� po kolejny kawa�ek ornamentu.
	AI_Output (other, self,"DIA_Lee_Trap_15_28"); //Ja?
	AI_Output (self, other,"DIA_Lee_Trap_08_29"); //A kogo mam wys�a�? Cord i Orik s� mi potrzebni tutaj. S�siedztwo trz�sawisk �le wp�ywa na nasze morale, a i magowie nie ciesz� si� z blisko�ci mieszka�c�w bagna...
	AI_Output (self, other,"DIA_Lee_Trap_08_30"); //Jarvis ju� raz zawi�d�, poza tym nie chc� nara�a� w�asnych ludzi...
	AI_Output (other, self,"DIA_Lee_Trap_15_31"); //Przynajmniej jeste� szczery. Rozumiem, �e moje �ycie jest nic nie warte?
	AI_Output (self, other,"DIA_Lee_Trap_08_32"); //�le mnie zrozumia�e�. Pokaza�e�, �e �wietnie sobie radzisz w najtrudniejszych sytuacjach. Tylko kto� taki poradzi sobie podczas poszukiwa�.
	AI_Output (self, other,"DIA_Lee_Trap_08_33"); //My zajmiemy si� pilnowaniem plec�w mag�w, kiedy Ty b�dziesz si� ugania� za ornamentami.
	AI_Output (self, other,"DIA_Lee_Trap_08_34"); //Wr��, jak si� zdecydujesz. Aha i pami�taj, �e magowie dobrze p�ac�.

	B_LogEntry(CH3_NON_Mercenary, "Lee opowiedzia� mi ciekaw� histori�. W ka�dym razie przyw�dca najemnik�w ma d�ug wzgl�dem mag�w, kt�rego sp�at� ma by� w�a�nie pomoc w odnalezieniu ornament�w. Lee chce, �ebym to ja poszuka� pozosta�ych dw�ch cz�ci ornamentu.");
};

//*********************************************************

instance  DIA_Lee_Agree(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  5;
	condition	=  DIA_Lee_Agree_Condition;
	information	=  DIA_Lee_Agree_Info;
	important		= 0;
	permanent		= 0;
	description = "Dobra, jestem z wami.";
};                       

FUNC int  DIA_Lee_Agree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Lee_Trap))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Agree_Info()
{
	AI_Output (other, self,"DIA_Lee_Agree_15_00"); //Dobra, jestem z wami.
	AI_Output (self, other,"DIA_Lee_Agree_08_01"); //Wiedzia�em, �e si� zgodzisz. A tak mi�dzy nami robisz to dla rudy?
	AI_Output (other, self,"DIA_Lee_Agree_15_02"); //Nie tylko. Mam z Hrabi� na pie�ku.
	AI_Output (self, other,"DIA_Lee_Agree_08_03"); //Rozumiem. Tylko nie pozw�l, by emocje wzi�y g�r� nad zdrowym rozs�dkiem. Nie chc� wys�a� Corda po Twoje zw�oki.
	AI_Output (other, self,"DIA_Lee_Agree_15_04"); //Bez obaw, Lee. M�j gniew jest zimny jak l�d. Hrabia dostanie to na co zas�u�y�.
	AI_Output (self, other,"DIA_Lee_Agree_08_05"); //W porz�dku. Id� do Saturasa, powiedz, �e ja Ci� przysy�am. Dostaniesz map� z lokalizacj� kolejnego ornamentu.
	AI_Output (self, other,"DIA_Lee_Agree_08_06"); //I uwa�aj na siebie.
	AI_Output (other, self,"DIA_Lee_Agree_15_07"); //Jak zawsze. Bywaj.
	B_LogEntry		(CH3_NON_Ornament, "Zgodzi�em si� pom�c najemnikom w poszukiwaniu ornament�w dla mag�w. Musz� porozmawia� z Saturasem, dostan� od niego map� z lokalizacj� kolejnego ornamentu.");
};

//*********************************************************

instance  DIA_Lee_LasOrn(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  6;
	condition	=  DIA_Lee_LasOrn_Condition;
	information	=  DIA_Lee_LasOrn_Info;
	important		= 0;
	permanent		= 0;
	description = "I szlag trafi� kolejny ornament!";
};                       

FUNC int  DIA_Lee_LasOrn_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Konwer))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_LasOrn_Info()
{
	AI_Output (other, self,"DIA_Lee_LasOrn_15_00"); //Straci�em kolejny ornament!
	AI_Output (self, other,"DIA_Lee_LasOrn_08_01"); //Co si� sta�o?
	AI_Output (other, self,"DIA_Lee_LasOrn_15_02"); //Hrabia znowu mnie uprzedzi�. Mam trzy dnia na odnalezienie pozosta�ych cz�ci, albo ca�y plan mag�w szlag trafi.
	AI_Output (self, other,"DIA_Lee_LasOrn_08_03"); //Nie mamy wyboru. Musimy im pom�c. Co zamierzasz?
	AI_Output (other, self,"DIA_Lee_LasOrn_15_04"); //Spr�buj� odnale�� te cholerne ornamenty. W ko�cu da�em ci s�owo.
	AI_Output (self, other,"DIA_Lee_LasOrn_08_05"); //My�la�em, ze robisz to dla rudy i dla zemsty na Hrabim?
	AI_Output (other, self,"DIA_Lee_LasOrn_15_06"); //Przypominasz mi siebie samego, Lee. Sporo nas ��czy, �aden z nas nie chcia� zosta� tym, kim jest teraz.
	AI_Output (self, other,"DIA_Lee_LasOrn_08_07"); //Masz racj� przyjacielu. Szkoda, �e nie poznali�my si� w lepszych czasach.
	AI_Output (other, self,"DIA_Lee_LasOrn_15_08"); //Mo�e kiedy� to nadrobimy...
	AI_Output (self, other,"DIA_Lee_LasOrn_08_09"); //Wr��, jak sko�czy si� ta heca z ornamentami. Do tego czasu b�d� ju� czu� si� lepiej.
	AI_Output (other, self,"DIA_Lee_LasOrn_15_10"); //Dobra. Bywaj.
	AI_Output (self, other,"DIA_Lee_LasOrn_08_11"); //Uwa�aj na siebie.
	B_LogEntry(CH3_NON_Mercenary, "Kiedy sko�czy si� ta ca�a heca z ornamentami, mam porozmawia� z Lee.");
};

//*********************************************************

instance  DIA_Lee_AfterRitual(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  7;
	condition	=  DIA_Lee_AfterRitual_Condition;
	information	=  DIA_Lee_AfterRitual_Info;
	important		= 1;
	permanent		= 0;
	description = "";
};                       

FUNC int  DIA_Lee_AfterRitual_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_RytualFinished))&&(lee_free == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_AfterRitual_Info()
{
	B_GiveXP(1250);
	var C_NPC myxir; myxir = Hlp_GetNpc(KDW_601_Myxir);
	var C_NPC merd; merd = Hlp_GetNpc(KDW_602_Merdarion);
	var C_NPC nefar; nefar = Hlp_GetNpc(KDW_603_Nefarius);
	var C_NPC cron; cron = Hlp_GetNpc(KDW_604_Cronos);
	var C_NPC riod; riod = Hlp_GetNpc(KDW_605_Riordian);

	var C_NPC jar; jar = Hlp_GetNpc(Sld_728_Jarvis);
	var C_NPC orik; orik = Hlp_GetNpc(Sld_701_Orik);
	var C_NPC cord; cord = Hlp_GetNpc(SLD_709_Cord);

	AI_Output (self, other,"DIA_Lee_AfterRitual_08_01"); //Cholera to by�o niespodziewane!
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_02"); //Jak to si� sta�o? Kto sta� na warcie?
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_03"); //Jarvis. Zdaje si�, �e uci�� sobie drzemk�. Poder�n�li mu gard�o i pobiegli do Komnaty Portali.
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_04"); //Min�li Orika, ale ten pata�ach jest g�uchy jak pie�!
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_05"); //Cord akurat wraca� z wychodka, kiedy wbiegali do �rodka. Krzykn�� i rzucili�my si� w pogo�...
	
   if (Npc_IsDead(jar))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_06"); //Szkoda Jarvisa. Ale magowie te� ucierpieli. 
	};
	if (Npc_IsDead(myxir))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_07"); //Myxir ju� raczej si� nie obudzi.
	};
	if (Npc_IsDead(merd))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_08"); //Szkoda Merdariona, sporo mi pom�g�.
	};
	if (Npc_IsDead(nefar))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_09"); //Nefarius te� poleg�.
	};
	if (Npc_IsDead(cron))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_10"); //Cronos jednak nie by� taki twardy, jakiego zgrywa�.
	};
	if (Npc_IsDead(riod))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_11"); //Riordian... Jedyny mag, kt�ry okaza� mi serce. Niech Adanos nad nim czuwa.
	};
	if (Npc_IsDead(orik))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_12"); //Orik pewnie nawet nie us�ysza�, co go zabi�o.
	};
	if (Npc_IsDead(cord))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_13"); //Nie s�dzi�em, �e ktokolwiek zdo�a pokona� Corda!
	};
   
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_14"); //Tak, to by� krwawy dzionek. Mam ju� do�� tej cholernej Kolonii...
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_15"); //Saturas powiedzia�, �e jeste�cie kwita, d�ug sp�acony.
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_16"); //Czasami �a�uj�, �e stawiam honor ponad zdrowy rozs�dek... Gdyby nie m�j up�r Jarvis nadal by �y�...
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_17"); //Nie zawsze mamy wp�yw na to, co si� wydarzy. 
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_18"); //Tak wielu przyjaci� ju� pochowa�em... 
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_19"); //Oni umr� dopiero wtedy, kiedy zginie pami�� o ich czynach.
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_20"); //Masz racj�! Kiedy tylko wr�c� do Myrtany i wyr�wnam rachunki, kupi� gdzie� kawa�ek ziemi i zostan� rolnikiem.
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_21"); //Tak, a ja zostan� rybakiem i b�dziemy co wiecz�r wspomina� przy kuflu stare dobre czasy. Mo�emy te� zapisa� si� do ko�a hafciarek, he, he.
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_22"); //Masz racj�, te� nie mog� sobie tego wyobrazi�. Ech, czasami dobrze by�oby po prostu usi��� z przyjacielem przy anta�ku piwa i ur�n�� si� do nieprzytomno�ci...
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_23"); //Jak tylko sko�cz� si� te brewerie z barier� to s�u�� pomoc�.
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_24"); //Trzymam Ci� za s�owo, Rick! Dobra, wracam do ch�opak�w.

	Log_SetTopicStatus(CH3_NON_Mercenary, LOG_SUCCESS);
	B_LogEntry(CH3_NON_Mercenary, "Lee sp�aci� d�ug wzgl�dem mag�w z moim 'ma�ym' udzia�em. Ciesz� si�, �e pomog�em najemnikom. Znalaz�em te� przyjaciela w by�ym generale kr�lewskiej armii. Dziwny jest ten �wiat...");
};

//*********************************************************

var int lee_agree;
var int tor_know;

instance  DIA_Lee_RBL (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  8;
	condition	=  DIA_Lee_RBL_Condition;
	information	=  DIA_Lee_RBL_Info;
	important		= 0;
	permanent		= 1;
	description = "Jeste� potrzebny w Nowym Obozie!";
};                       

FUNC int DIA_Lee_RBL_Condition()
{
	if (lee_back >=1)&&(lee_agree < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBL_Info()
{
	AI_Output (other, self,"DIA_Lee_RBL_15_00"); //Jeste� potrzebny w Nowym Obozie!
	AI_Output (self, other,"DIA_Lee_RBL_08_01"); //A co tam si� dzieje?

	if (Npc_KnowsInfo(hero,DIA_Torlof_Fight))&&(tor_know == FALSE)
	{
		tor_know = TRUE;
		AI_Output (other, self,"DIA_Lee_RBL_15_02"); //Torlof ma spore problemy. Broni si� ze swoimi lud�mi w kopalni, ale to d�ugo nie potrwa.
		lee_agree = lee_agree + 1;
		B_LogEntry (CH4_NC_RBLBosses, "Powiedzia�em Lee o Torlofie.");
	};
	if (lares_cooperate == TRUE)
	{
		lares_cooperate = 2;
		AI_Output (other, self,"DIA_Lee_RBL_15_03"); //Lares ma ju� do�� stania obok. Powiedz tylko s�owo, a pola ry�owe sp�yn� krwi�.
		lee_agree = lee_agree + 1;
		B_LogEntry (CH4_NC_RBLBosses, "Lee wie ju� o Laresie.");
	};
	if (wolf_cooperate == TRUE)
	{
		wolf_cooperate = false;
		AI_Output (other, self,"DIA_Lee_RBL_15_04"); //Wilk jest got�w by na tw�j znak rozp�ta� piek�o w Kotle.
		lee_agree = lee_agree + 1;
		B_LogEntry (CH4_NC_RBLBosses, "Przekaza�em Lee pozdrowienia od Wilka.");
	};
};

//*********************************************************

instance DIA_Lee_RBLBosses (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  9;
	condition	=  DIA_Lee_RBLBosses_Condition;
	information	=  DIA_Lee_RBLBosses_Info;
	important		= 0;
	permanent		= 0;
	description = "Co teraz zrobisz?";
};                       

FUNC int DIA_Lee_RBLBosses_Condition()
{
	if (lee_back == 4)&&(lee_agree == 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBLBosses_Info()
{
	AI_Output (other, self,"DIA_Lee_RBLBosses_15_00"); //Co teraz zrobisz?
	AI_Output (self, other,"DIA_Lee_RBLBosses_08_01"); //Musz� si� zastanowi�.
	AI_Output (other, self,"DIA_Lee_RBLBosses_15_02"); //Nie ma na to czasu, tam umieraj� ludzie!
	AI_DrawWeapon (self);
	AI_Output (self, other,"DIA_Lee_RBLBosses_08_03"); //To moi ludzie! Wiem, co robi� i nikt nie b�dzie w�tpi� w moj� lojalno��.
	AI_Output (other, self,"DIA_Lee_RBLBosses_15_04"); //Na co chcesz czeka�?!
	AI_RemoveWeapon (self);
	AI_Output (self, other,"DIA_Lee_RBLBosses_08_05"); //Nie jestem idiot�, nie pobiegn� do Nowego Obozu bez sprawdzenia, co tam si� naprawd� dzieje.
	AI_Output (other, self,"DIA_Lee_RBLBosses_15_06"); //Nie ufasz mi?
	AI_Output (self, other,"DIA_Lee_RBLBosses_08_07"); //Ja nikomu nie ufam. Ale powiem Ci, kiedy b�d� got�w do walki o Nowy Ob�z i moich ludzi.
	if (!Npc_KnowsInfo(hero,DIA_Lee_Agree))
	{
		AI_Output (self, other,"DIA_Lee_RBLBosses_08_08"); //Poza tym musz� sp�aci� d�ug wzgl�dem Mag�w Wody. Dopiero wtedy b�d� m�g� wr�ci� do Nowego Obozu.
		B_LogEntry (CH4_RBL_NCRebel, "Lee nie ruszy si�, dop�ki nie za�atwi swoich spraw u Mag�w Wody. Mo�e warto mu w tym pom�c?");

	};
	//AI_Output (other, self,"DIA_Lee_RBLBosses_15_09"); //Wr�c� tu i oby nie by�o za p�no.
	Log_SetTopicStatus	(CH4_NC_RBLBosses, LOG_SUCCESS);
	B_LogEntry (CH4_NC_RBLBosses, "Lee na co� czeka, nie chce od razu ruszy� do ataku. No nic, poza�atwiam swoje sprawy i mo�e wtedy sytuacja dojrzeje na tyle, �e ruszymy do walki.");
	B_LogEntry (CH4_RBL_NCRebel, "Lee chce najpierw sam sprawdzi�, co si� dzieje w Nowym Obozie. Zdaje si�, �e nic na to nie poradz�.");
};

instance  DIA_Lee_RBLBosses1 (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  9;
	condition	=  DIA_Lee_RBLBosses1_Condition;
	information	=  DIA_Lee_RBLBosses1_Info;
	important		= 1;
	permanent		= 0;
	description = "Co teraz zrobisz?";
};                       

FUNC int  DIA_Lee_RBLBosses1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_AfterRitual) && Npc_KnowsInfo(hero,DIA_Leren_RitualEnd))
	{
		return 1;
	};
};


FUNC VOID  DIA_Lee_RBLBosses1_Info()
{
	AI_Output (self, other,"DIA_Lee_RBLBosses1_08_00"); //Czas wraca� na stare �mieci. 
	AI_Output (other, self,"DIA_Lee_RBLBosses1_15_01"); //Co zamierzasz?
	AI_Output (self, other,"DIA_Lee_RBLBosses1_08_02"); //Wr�c� do Nowego Obozu i wykopi� skurwieli Gomeza a� do Myrtany!	
	B_NC_LeeBack();
};

//*********************************************************

instance DIA_Lee_RBLBegin (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  10;
	condition		=  DIA_Lee_RBLBegin_Condition;
	information		=  DIA_Lee_RBLBegin_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC int DIA_Lee_RBLBegin_Condition()
{
	if (Npc_GetDistToWP(self, "NC_RICELORD_SIT") < 600) 
	{
		return 1;
	};
};

FUNC VOID DIA_Lee_RBLBegin_Info()
{
	/************************
Ork Gorn ma by� gdzie� w pobli�u Lee przez ca�y czas, przyda si� dopiero p�niej

**********************/

	B_FullStop (hero);
	//AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Lee_RBLBegin_08_01"); //Wr�ci�em, najwy�szy czas, �eby upu�ci� krwi stra�nikom.
	AI_Output (other, self,"DIA_Lee_RBLBegin_15_02"); //Cieszy mnie to! Od czego zaczniemy?
	AI_Output (self, other,"DIA_Lee_RBLBegin_08_03"); //My?
	AI_Output (other, self,"DIA_Lee_RBLBegin_15_04"); //Chyba nie my�la�e�, �e nie wezm� udzia�u w takiej jatce? Poza tym stra�nicy wywo�uj� u mnie wzmo�one parcie na stolec.
	AI_Output (self, other,"DIA_Lee_RBLBegin_08_05"); //Nie pozwol�, �eby� nabawi� si� niestrawno�ci. Dobrze wiedzie�, �e mamy Ci� u swego boku.
	AI_Output (self, other,"DIA_Lee_RBLBegin_08_06"); //Porozmawiaj z Laresem, on dok�adnie wprowadzi Ci� w sytuacj�. P�niej podejmiemy decyzj� od czego powinni�my zacz��.
	AI_Output (other, self,"DIA_Lee_RBLBegin_15_07"); //W porz�dku.
	
   Log_SetTopicStatus	(CH4_RBL_NCRebel, LOG_SUCCESS);
	B_LogEntry (CH4_RBL_NCRebel, "No to zacz�a si� zabawa. Czas wykopa� stra�nik�w z Nowego Obozu!");

	Log_CreateTopic(CH5_NO_Rebel, LOG_MISSION);
	Log_SetTopicStatus(CH5_NO_Rebel, LOG_RUNNING);
	B_LogEntry(CH5_NO_Rebel, "Walka o Nowy Ob�z w�a�nie si� rozpocz�a. Najwa�niejsze, �e Lee jest z nami, najemnicy i szkodniki p�jd� za genera�em w �ywy ogie�. Musz� porozmawia� z Laresem i dowiedzie� si� czego� wi�cej o aktualnej sytuacji w obozie.");
	
};

//*********************************************************

instance  DIA_Lee_RBLTasks (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  11;
	condition		=  DIA_Lee_RBLTasks_Condition;
	information		=  DIA_Lee_RBLTasks_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Co zamierzasz?";
};                       

FUNC int  DIA_Lee_RBLTasks_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lares_WhatNext))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBLTasks_Info()
{
	AI_Output (other, self,"DIA_Lee_RBLTasks_15_01"); //Co zamierzasz?
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_02"); //Przede wszystkim musimy po��czy� si�y i uderzy� na wroga jednocze�nie z kilku stron.
	AI_Output (other, self,"DIA_Lee_RBLTasks_15_03"); //Zamieniam si� w s�uch.
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_04"); //Musimy odci�� stra�nik�w oblegaj�cych Orle Gniazdo.
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_05"); //Trzeba przedrze� si� z niewielkim oddzia�em i pom�c Torlofowi.
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_06"); //Kto� musia�by te� przemkn�� si� do Wilka i powiedzie� mu jak wygl�da sytuacja.
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_07"); //Mam ju� dw�ch dow�dc�w, kt�rzy zg�osili si� na ochotnika. To Lares i Cord.
	AI_Output (other, self,"DIA_Lee_RBLTasks_15_08"); //Nie musisz wi�c szuka� trzeciego. Co mam zrobi�?
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_09"); //Mo�esz pom�c Torlofowi, zakra�� si� do Wilka albo zamkn�� obl�enie kasztelu.
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_10"); //Co wybierasz?
	B_LogEntry		(CH5_NO_Rebel, "Szykuje si� niez�a zabawa. Zosta�em dow�dc� trzeciego oddzia�u, sam musz� wybra� czym si� zajm�.");

	Info_ClearChoices (DIA_Lee_RBLTasks);
	Info_AddChoice (DIA_Lee_RBLTasks, "Zrobi� niespodziank� Wilkowi.", DIA_Lee_RBLTasks_Wolf);
	Info_AddChoice (DIA_Lee_RBLTasks, "Pomog� Torlofowi, jestem mu to winien.", DIA_Lee_RBLTasks_Torlof);
	Info_AddChoice (DIA_Lee_RBLTasks, "Z przyjemno�ci� zajm� si� Fletcherem.", DIA_Lee_RBLTasks_Siege);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Lee_RBLTasks_Wolf()
{
	task_choice = 1;
	AI_Output (other, self,"DIA_Lee_RBLTasks_Wolf_15_01"); //Zrobi� niespodziank� Wilkowi.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Wolf_08_02"); //Tylko uwa�aj, �eby Ci� nie pomyli� z jakim� stra�nikiem.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Wolf_08_03"); //Najlepiej jakby� podkrad� si� pod os�on� nocy. Po zmierzchu wartownicy nie s� tak czujni jak za dnia. Wtedy ry��wka lepiej im smakuje.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Wolf_08_04"); //Powiedz Wilkowi, �e sygna�em do ataku b�dzie krzyk harpii.
	AI_Output (other, self,"DIA_Lee_RBLTasks_Wolf_15_05"); //W porz�dku. A pozosta�e grupy?
	AI_Output (self, other,"DIA_Lee_RBLTasks_Wolf_08_06"); //Cord uderzy na stra�nik�w w kopalni, Lares zamknie obl�enie stra�nik�w. Powodzenia.

	/************************
Ork musisz tu pozmienia rutyny cordowi + kilku jego ludzi robi� czystki w kopalni [w sumie najlepiej od razu u�mier� wszystkich stra�nik�w chyba, �e chcesz �eby gracz widzia� walk�] 
i laresowi + kilku jego ludzi [zamkni�cie oblegaj�cych orle gniazdo stra�nik�w]
Tutaj Dick nie mo�e wzi�� ze sob� najemnik�w ambient�w. Zr�b rutyny stra�nik�w oblegaj�cych wilka tak, �eby mo�na by�o si� zakra�� pomi�dzy nimi, ale tylko w nocy. Aha i je�eli wykryj� Dicka podczas skradania si� to misja jest spalona a Dick ma zgin��. Tu nie ma mo�liwo�ci ataku na hura, niech gracze u�ywaj� m�zg�w po wybraniu tej opcji.
**************************/

	B_LogEntry		(CH5_NO_Wolf, "Wybra�em Wilka. Najlepiej b�dzie przekra�� si� przez barykady pod os�on� nocy. Cord uderzy na kopalni�, a Lares zajmie si� Orlim Gniazdem.");
   Log_SetTopicStatus	(CH5_NO_Mine, LOG_FAILED);
   Log_SetTopicStatus	(CH5_NO_Guards, LOG_FAILED);
   Info_ClearChoices (DIA_Lee_RBLTasks);
   // Ork: Nie wiem, chyba tutaj rozpocza�bym muzyk� do rebelii, to do��
   // d�ugi kawalek wi�c nie powinien przeszkadza�:
   BOSSFIGHT_CURRENT = BOSSFIGHT_FGT3;
};

// -------------------------------------------------------------------

FUNC VOID DIA_Lee_RBLTasks_Torlof()
{
	task_choice = 2;
	AI_Output (other, self,"DIA_Lee_RBLTasks_Torlof_15_01"); //Pomog� Torlofowi, jestem mu to winien.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Torlof_08_02"); //Rozumiem. Najemnicy z kopalni broni� si� ju� resztkami si�.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Torlof_08_03"); //Je�eli si� po�pieszysz mo�e si� uda�. We� ze sob� kilku najemnik�w.
	AI_Output (other, self,"DIA_Lee_RBLTasks_Torlof_15_04"); //A pozostali?
	AI_Output (self, other,"DIA_Lee_RBLTasks_Torlof_08_05"); //Cord zajmie si� Orlim Gniazdem, a Lares skontaktuje si� z Wilkiem. Powodzenia.


	/************************
Ork musisz tu pozmienia rutyny cordowi + kilku jego ludzi zajmuj� pozycje za stra�nikami, kilka trup�w stra�nik�w nie zaszkodzi [w sumie najlepiej od razu u�mier� wszystkich stra�nik�w chyba, �e chcesz �eby gracz widzia� walk�] 
a Lares niech si� pojawi u Wilka.
Dick mo�e wzi�� ze sob� kilku sposr�d kilkunastu najemnik�w ambient�w, kt�rzy s� teraz na poddoboziu [tam gdzie ry�owy ksi��e mia� chat� i okolice]
Zr�b to tak, �e kolesie maj� ten sam dialog tylko jaka� zmienna ++ i mo�e g�ra 4-5 najemnik�w niech przy��czy si� do Dicka

**************************/

	B_LogEntry		(CH5_NO_Mine, "Pomog� Torlofowi, jestem mu to winien. Musz� si� po�pieszy�. Lee pozwoli� mi zabra� kilku najemnik�w. W tym czasie Cord zajmie si� Orlim Gniazdem a Lares skontaktuje si� z Wilkiem.");
   Log_SetTopicStatus	(CH5_NO_Wolf, LOG_FAILED);
   Log_SetTopicStatus	(CH5_NO_Guards, LOG_FAILED);
   Info_ClearChoices (DIA_Lee_RBLTasks);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Lee_RBLTasks_Siege()
{
	task_choice = 3;
	AI_Output (other, self,"DIA_Lee_RBLTasks_Siege_15_01"); //Z przyjemno�ci� zajm� si� Fletcherem.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Siege_08_02"); //Fletcher ze spor� grup� stra�nik�w oblega Orle Gniazdo z Hrabi� w �rodku.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Siege_08_03"); //Trzeba ich odci�� od Nowego Obozu i ewentualnych posi�k�w ze Starego Obozu.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Siege_08_04"); //Musisz zdoby� dwa przycz�ki w pobli�u Orlego Gniazda i zostawi� tam naszych ludzi.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Siege_08_05"); //We� tylu najemnik�w ilu zdo�asz, dow�dcy zajm� si� posterunkami.
	AI_Output (other, self,"DIA_Lee_RBLTasks_Siege_15_06"); //Dobrze, a co z reszt�?
	AI_Output (self, other,"DIA_Lee_RBLTasks_Siege_08_07"); //Cord zajmie si� kopalni�, a Lares skontaktuje si� z Wilkiem. Powodzenia.


	/************************
Ork musisz tu pozmienia rutyny cordowi + kilku jego ludzi robi� czystki w kopalni [w sumie najlepiej od razu u�mier� wszystkich stra�nik�w chyba, �e chcesz �eby gracz widzia� walk�]  
a Lares niech si� pojawi u Wilka.
Z dickiem p�jdzie 2 dow�dc�w - ka�dy zagada do dicka, ka�dy z nich we�mie ze sob� 5 ambient�w najemnik�w, kt�rzy s� teraz na poddoboziu [tam gdzie ry�owy ksi��e mia� chat� i okolice]

**************************/

	B_LogEntry(CH5_NO_Guards, "Wybra�em Fletchera, mam zdoby� dwa przyczu�ki w pobli�u Orlego Gniazda. Cord zajmie si� kopalni�, a Lares skontaktuje si� z Wilkiem. Mog� wzi�� tylu najemnik�w, ilu zdo�am.");
   Log_SetTopicStatus	(CH5_NO_Mine, LOG_FAILED);
   Log_SetTopicStatus	(CH5_NO_Wolf, LOG_FAILED);
   Info_ClearChoices (DIA_Lee_RBLTasks);
};

//***************quests****************

//*********************************************************

instance  DIA_Lee_RBLWolf (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  12;
	condition		=  DIA_Lee_RBLWolf_Condition;
	information		=  DIA_Lee_RBLWolf_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Ju� za�atwione!";
};                       

FUNC int DIA_Lee_RBLWolf_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Wolf_Sudden))||(Npc_KnowsInfo(hero,DIA_Torlof_Save))||(merc_done == 2)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBLWolf_Info()
{
	AI_Output (other, self,"DIA_Lee_RBLWolf_15_01"); //Ju� za�atwione!

	if (Npc_KnowsInfo(hero,DIA_Wolf_Sudden))
	{
		AI_Output (other, self,"DIA_Lee_RBLWolf_15_02"); //Rozmawia�em z Wilkiem.
		AI_Output (self, other,"DIA_Lee_RBLWolf_08_03"); //Przekaza�e� mu jaki jest sygna� do ataku?
		AI_Output (other, self,"DIA_Lee_RBLWolf_15_04"); //Tak, ca�a sfora b�dzie czeka� na krzyk harpii.
		Log_SetTopicStatus	(CH5_NO_Wolf, LOG_SUCCESS);
		B_LogEntry		(CH5_NO_Wolf, "Plan ataku powoli przybiera konkretny kszta�t. Lee by� bardzo zadowolony. Oby tylko sfora Wilka cierpliwie czeka�a na sygna�.");
	}
	else if(Npc_KnowsInfo(hero,DIA_Torlof_Save))
	{
		AI_Output (other, self,"DIA_Lee_RBLWolf_15_05"); //Torlof nie mo�e si� ju� doczeka� kiedy ostatecznie za�atwimy stra�nik�w.
		AI_Output (self, other,"DIA_Lee_RBLWolf_08_06"); //I dobrze, to ju� nied�ugo.
		AI_Output (other, self,"DIA_Lee_RBLWolf_15_07"); //Kaza� ci� pozdrowi�. Na razie zabezpieczy kopalni� i b�dzie czeka� na rozkaz.
		Log_SetTopicStatus	(CH5_NO_Mine, LOG_SUCCESS);
		B_LogEntry		(CH5_NO_Mine, "Plan ataku powoli przybiera konkretny kszta�t. Lee by� bardzo zadowolony. Torlof ju� wkr�tce b�dzie m�g� zata�czy� ze stra�nikami.");
	}
	else if(merc_done == 2)
	{
		AI_Output (other, self,"DIA_Lee_RBLWolf_15_08"); //Dow�dcy najemnik�w s� ju� z oddzia�ami na miejscu. 
		AI_Output (self, other,"DIA_Lee_RBLWolf_08_09"); //W takim razie Fletcher i Orle Gniazdo s� odci�te - upiekli�my dwie pieczenie przy jednym ogniu.
		Log_SetTopicStatus	(CH5_NO_Guards, LOG_SUCCESS);
		B_LogEntry		(CH5_NO_Guards, "Plan ataku powoli przybiera konkretny kszta�t. Lee by� bardzo zadowolony. Oby tylko najemnicy wytrzymali na posterunkach do czasu ataku.");
	};

	AI_Output (self, other,"DIA_Lee_RBLWolf_08_10"); //To �wietnie. Lares i Cord te� wype�nili swoje zadania.
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_11"); //Ale co� jeszcze zosta�o do zrobienia.
	AI_Output (other, self,"DIA_Lee_RBLWolf_15_12"); //Tak?
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_13"); //To niebezpieczne i ryzykowne zadanie, dlatego musisz sam zadecydowa�.
	AI_Output (other, self,"DIA_Lee_RBLWolf_15_14"); //M�w do cholery o co chodzi!
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_15"); //Nie mo�emy pope�ni� tego samego b��du co poprzednio. Trzeba zlokalizowa� ukryte przej�cie i strzec go za wszelk� cen�.
	AI_Output (other, self,"DIA_Lee_RBLWolf_15_16"); //To nie powinno by� takie trudne.
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_17"); //Obawiam si�, �e mo�esz si� myli�.
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_18"); //Stra�nicy regularnie organizuj� tam przerzuty broni i ludzi. Z tego co wiem, jest tam dobrze ukryty i strze�ony posterunek.
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_19"); //Niestety nikt dok�adnie nie wie, gdzie jest samo przej�cie i gdzie znajduje si� posterunek.
	AI_Output (other, self,"DIA_Lee_RBLWolf_15_20"); //Hmm, rzeczywi�cie nie wygl�da to r�owo.
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_21"); //Wi�c jaka jest twoja decyzja?

	B_LogEntry		(CH5_NO_Rebel, "Nied�ugo uderzymy na stra�nik�w. Lee potrzebuje kogo� do zlokalizowania ukrytej prze��czy w g�rach.");
};

//*********************************************************

instance  DIA_Lee_RBLOk (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  13;
	condition		=  DIA_Lee_RBLOk_Condition;
	information		=  DIA_Lee_RBLOk_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Zrobi� to.";
};                       

FUNC int  DIA_Lee_RBLOk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_RBLWolf))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBLOk_Info()
{
	AI_Output (other, self,"DIA_Lee_RBLOk_15_01"); //Zrobi� to.
	AI_Output (self, other,"DIA_Lee_RBLOk_08_02"); //�wietnie, musisz tam wyruszy� niezw�ocznie.
	AI_Output (self, other,"DIA_Lee_RBLOk_08_03"); //Przej�cia szukaj w pobli�u kopalni, w ka�dym razie tam uderzyli najpierw.
	AI_Output (self, other,"DIA_Lee_RBLOk_08_04"); //Aha i musisz p�j�� sam. Nie mog� odda� ci �adnego najemnika, dop�ki nie odnajdziesz przej�cia.
	AI_Output (self, other,"DIA_Lee_RBLOk_08_05"); //Niech ci nie przyjdzie do g�owy zgrywa� bohatera. Jak tylko znajdziesz przej�cie i posterunek wr��, wy�l� tam ludzi, kt�rzy zajm� si� reszt�.
	AI_Output (other, self,"DIA_Lee_RBLOk_15_06"); //Zobacz�, co da si� zrobi�. 

	Log_CreateTopic		(CH5_NC_Passage,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_NC_Passage,	LOG_RUNNING);
	B_LogEntry		(CH5_NC_Passage,	"Przed atakiem na stra�nik�w Lee chce, �ebym odnalaz� prze��cz, przez kt�r� wcze�niej przedarli si� stra�nicy. Musz� odnale�� przej�cie i ukryty tam posterunek, potem mam wr�ci� do Lee, on zajmie si� reszt�. Powinienem zacz�� poszukiwania w pobli�u kopalni.");
//WP: STRAZNICA1-6

   Wld_InsertNpc(EBR_4444_Stern, "STRAZNICA1");
   Wld_InsertNpc(GRD_4446_Gardist , "STRAZNICA2");
   Wld_InsertNpc(Grd_4445_Gardist, "STRAZNICA3");
};

/******************
Ork najlepiej by�oby zrobi� triggera i kiedy dick znajdzie si� 5m od wej�cie do prze��czy pojawi si� komunikat, �e w�a�nie znalaz� ukryte przej�cie.
Drugi komunikat pojawi si� kiedy dick zbli�y si� do posterunku. Aha do posterunku nie mo�na si� fizycznie dosta�, niech gracze nie zabijaj� tych stra�nik�w, maj� tylko wr�ci� do Lee i zameldowa� gdzie jest przej�cie i posterunek.
Jak odkryje przej�cie do zmienna passage_know ++ i jak odkryje posterunek to te� ja w warunku dam passage_know == 2

*******************/

//*********************************************************

instance DIA_Lee_RBLFound (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  14;
	condition		=  DIA_Lee_RBLFound_Condition;
	information		=  DIA_Lee_RBLFound_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Za�atwione.";
};                       

FUNC int  DIA_Lee_RBLFound_Condition()
{
   var C_NPC Stern; Stern = Hlp_GetNpc(EBR_4444_Stern);
   
	if (Npc_KnowsInfo(hero,DIA_Lee_RBLOk))&&(Npc_IsDead(Stern))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBLFound_Info()
{
	var C_NPC fl; fl = Hlp_GetNpc(GRD_255_Fletcher);
	Npc_ExchangeRoutine(fl,"DIE");	
   AI_PlayAni(fl, "s_deadb");
   AI_PlayAni(fl, "s_woundedb");
	fl.attribute[ATR_HITPOINTS]-=fl.attribute[ATR_HITPOINTS]-5;	
	
	var C_NPC gr1; gr1 = Hlp_GetNpc(Grd_659_Gardist);
	Npc_ExchangeRoutine(gr1,"NC1");	
	gr1.attribute[ATR_HITPOINTS]-=gr1.attribute[ATR_HITPOINTS];		
	
	var C_NPC gr2; gr2 = Hlp_GetNpc(Grd_626_Gardist);
	Npc_ExchangeRoutine(gr2,"NC1");		
	gr2.attribute[ATR_HITPOINTS]-=gr2.attribute[ATR_HITPOINTS];	
	
	Log_SetTopicStatus	(CH5_NC_Passage,	LOG_SUCCESS);
	B_LogEntry		(CH5_NC_Passage,	"Sprawa z prze��cz� za�atwiona. Lee wy�le tam najemnik�w, tym razem stra�nicy nas nie zaskocz�.");

	AI_Output (other, self,"DIA_Lee_RBLFound_15_01"); //Za�atwione.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_02"); //Odnalaz�e� przej�cie?
	AI_Output (other, self,"DIA_Lee_RBLFound_15_03"); //Stra�nic� te� (Rick wyja�nia dok�adn� lokalizacj�)...
	AI_Output (self, other,"DIA_Lee_RBLFound_08_04"); //Natychmiast wy�l� tam najemnik�w.

	/************************************
Ork twoja dzia�a. Zabicie skryptem stra�nik�w z tamtej stra�nicy i wsadzenie tam najemnik�w, tak�e kilku w samym przej�ciu.
hide_clear ();
**********************************/

	AI_Output (self, other,"DIA_Lee_RBLFound_08_05"); //Kiedy Ci� nie by�o, wydarzy�o si� co�... nieoczekiwanego.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_06"); //Co tym razem?
	AI_Output (self, other,"DIA_Lee_RBLFound_08_07"); //W Orlim Gnie�dzie rozgorza�a walka. Nie wiemy dok�adnie co si� sta�o, ale by�o ostro.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_08"); //Fletcher i jego ludzie zamiast zaatakowa� chcieli ucieka�, ale najemnicy zdrowo ich przetrzebili.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_09"); //Fletcher z niedobitkami stra�nik�w przebi� si� i broni� si� teraz na grani w pobli�u tunelu prowadz�cego do kopalni.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_10"); //Do Orlego Gniazda nadal nie mo�emy wej��. Najdziwniejsze jest to, �e sto�p wygl�da na opustosza�y. Trzeba co� wymy�li�, �eby dowiedzie� si� co si� sta�o z Hrabi� i jego lud�mi.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_11"); //Masz jaki� pomys�?
	AI_Output (self, other,"DIA_Lee_RBLFound_08_12"); //Trzeba dorwa� Fletchera, mo�e on wie co� wi�cej.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_13"); //Szkoda jednak traci� dobrych ludzi. Grani �atwo si� broni, kilku ludzi z �ukami i kuszami bez problem�w powstrzyma spory oddzia�. Znajdziesz tam Gorna i jego oddzia�, od niego dowiesz si� wi�cej.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_14"); //Rozumiem, �e wolisz wys�a� i ewentualnie straci� tylko jednego szale�ca?
	AI_Output (self, other,"DIA_Lee_RBLFound_08_15"); //Nie mam wyboru. Ale negocjacje nie wchodz� w rachub�.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_16"); //Potrzebujemy g�owy Fletchera, tylko najpierw musisz wydusi� z niego wszystko, co wie o Orlim Gnie�dzie i tym co si� tam wydarzy�o.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_17"); //A jak mam si� tam dosta�? Nie wdrapi� si� nawet na gra�, bo podziurawi� mnie be�tami.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_18"); //Spr�buj p�j�� w nocy, kto wie, mo�e uda Ci si� przemkn�� w pobli�u stra�nik�w.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_19"); //�wietna rada... No dobra, spr�buj�.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_20"); //Wiedzia�em, �e si� skusisz. Czasami wydaje mi si�, �e... szukasz �mierci.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_21"); //To raczej ona szuka mnie. Na szcz�cie jak do tej pory, bezskutecznie.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_22"); //Powodzenia na szlaku, Rick.

	/************************
Kolejny mi�ch. Zr�b tak, �eby si� wydawa�o, �e pod murami gniazda rozegra�a si� za�arta walka, zabij wi�kszo�� ze stra�nik�w i z po�ow� najemnik�w, cia� powinno by� sporo.
Fletchera wyrutynuj na skarp� po prawej stronie jak si� idzie do kopalni z nowego obozu, wchodzi si� tam po tych du�ych stopniach. W pobli�u skarpy niech si� znajdzie kilku najemnik�w, w tym gorn kt�ry dowodzi t� grup�.
Niespodzianka ma by� taka, �e wszyscy stra�nicy nie �yj�, a Fletcher ledwo zipie - zabij kilku stra�nik�w na tej grani a fletchera powa�nie ra�, ale z do�u ma tego nie by� wida�. Aha a pod grani� na drodze do kopalni daj z kilka cia� najemnik�w, �e niby zaatakowali bez rezultatu.

fletcher_escape ();
**********************/
	B_LogEntry		(CH5_NO_Rebel, "Przej�cie jest ju� zabezpieczone przez najemnik�w.");

	Log_CreateTopic(CH5_NC_TheRock,	LOG_MISSION);
	Log_SetTopicStatus(CH5_NC_TheRock,	LOG_RUNNING);
	B_LogEntry(CH5_NC_TheRock,	"Pod moj� nieobecno�� co� si� wydarzy�o w Orlim Gnie�dzie. Nawet Fletcher tak si� przerazi�, �e nie bacz�c na nic przebi� si� przez najemnik�w i z resztk� stra�nik�w zaszy� si� na grani po drodze do kopalni. Musz� dowiedzie� si� od Fletchera, ile tylko zdo�am o tym, co si� sta�o w sto�pie i dlaczego kasztel wygl�da na opuszczony. Lee zasugerowa�, �e po rozmowie powinienem raz na zawsze pozby� si� Fletchera.");
	
   var C_NPC gorn; gorn = Hlp_GetNpc(PC_Fighter);
	Npc_ExchangeRoutine(gorn,"WATCH");
   
	B_NC_Free();
};

//*********************************************************

instance  DIA_Lee_Convoys (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  20;
	condition		=  DIA_Lee_Convoys_Condition;
	information		=  DIA_Lee_Convoys_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC int  DIA_Lee_Convoys_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_RBLTasks))&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Convoys_Info()
{
	AI_Output (self, other,"DIA_Lee_Convoys_08_01"); //Aha, jeszcze co�.
	AI_Output (other, self,"DIA_Lee_Convoys_15_02"); //Tak?
	AI_Output (self, other,"DIA_Lee_Convoys_08_03"); //Porozmawiaj z Cordem. Dorwali�my jednego ze stra�nik�w. Zanim wyzion�� ducha zacz�� co� krzycze� o konwojach z broni�.
	AI_Output (self, other,"DIA_Lee_Convoys_08_04"); //Cord mia� si� tym zaj��, ale potrzebuje do pomocy kogo� z g�ow� na karku.
	AI_Output (other, self,"DIA_Lee_Convoys_15_05"); //Dobra, porozmawiam z Cordem.

	B_LogEntry		(CH5_NO_Rebel, "Cord potrzebuje pomocy z jakimi� konwojami. Warto z nim porozmawia�.");

	Log_CreateTopic		(CH5_NC_Convoys,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_NC_Convoys,	LOG_RUNNING);
	B_LogEntry		(CH5_NC_Convoys,	"Cord potrzebuje kogo� do pomocy w sprawie konwoj�w ze Starego Obozu. Powinienem z nim porozmawia�.");
};

//*********************************************************

instance  DIA_Lee_TheRock (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  15;
	condition		=  DIA_Lee_TheRock_Condition;
	information		=  DIA_Lee_TheRock_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Rozmawia�em z Fletcherem.";
};                       

FUNC int  DIA_Lee_TheRock_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gorn_TheRockback))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_TheRock_Info()
{
	AI_Output (other, self,"DIA_Lee_TheRock_15_01"); //Rozmawia�em z Fletcherem.
	AI_Output (self, other,"DIA_Lee_TheRock_08_02"); //Nie s�dzi�em, �e dopadniesz go �ywego. Powiedzia� co� ciekawego?
	AI_Output (other, self,"DIA_Lee_TheRock_15_03"); //(Rick streszcza Lee to co us�ysza� od Fletchera)
	AI_Output (self, other,"DIA_Lee_TheRock_08_04"); //Cholera, nie dobrze. My�la�em, ze Hrabia i Kruk stoj� po tej samej stronie barykady.
	AI_Output (self, other,"DIA_Lee_TheRock_08_05"); //Kruk to najbardziej niebezpieczny z magnat�w. Wbrew pozorom to jego trzeba si� ba�, nie Gomeza.
	AI_Output (self, other,"DIA_Lee_TheRock_08_06"); //Musisz dalej w to brn��. W mi�dzyczasie znalaz�em w skrzyni run�. By� mo�e ci si� przyda.
   
   Create_and_give(TheRockTP, 1);
   
   AI_Output (other, self,"DIA_Lee_TheRock_08_07"); //Dzi�ki. Teraz tylko teleportowa� si� do Orlego Gniazda.
	AI_Output (self, other,"DIA_Lee_TheRock_08_08"); //Sytuacja w obozie jest ju� stabilna, rozprawili�my si� z reszt� stra�nik�w.

	/*************************

Ork idealna by�aby funkcja sprawdzaj�ca czy kt�ry� ze stra�nik�w z NO jeszcze �yje, jak tak to tutaj go skilluj

***************************/
	AI_Output (self, other,"DIA_Lee_TheRock_08_09"); //Dowiedz si�, co knuje Kruk i co wydarzy�o si� w Orlim Gnie�dzie. Nie mo�emy pod w�asnym nosem chowa� puszki Beliara.
	AI_Output (other, self,"DIA_Lee_TheRock_15_10"); //Wr�c�, jak dowiem si� czego� wi�cej.
	//B_LogEntry		(CH5_NC_TheRock,	"Czas poszuka� kufra Hrabiego w by�ej siedzibie Mag�w Wody i sprawdzi� co w nim znajd�.");
   B_LogEntry(CH5_NC_TheRock,	"Poinformowa�em Lee, co si� sta�o na grani, a on znalaz� dla mnie run� do Orlego Gniazda. Czas spotka� si� z Hrabi�!");
   
   B_ExchangeRoutine(grd_4010_hrabia,"start");
};

//*********************************************************

instance  DIA_Lee_TheRockCompleated (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  16;
	condition		=  DIA_Lee_TheRockCompleated_Condition;
	information		=  DIA_Lee_TheRockCompleated_Info;
	important		= 0;
	permanent		= 0;
	description 		= "By�em w Orlim Gnie�dzie.";
};                       

FUNC int  DIA_Lee_TheRockCompleated_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_TheRock))&&(Npc_KnowsInfo(hero,DIA_Hrabia_TheRock))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_TheRockCompleated_Info()
{
	var C_NPC hr; hr = Hlp_GetNpc(GRD_4010_Hrabia);

	AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_01"); //By�em w Orlim Gnie�dzie.
	//AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_02"); //Jak si� tam dosta�e�?
	//AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_03"); //W kufrze Hrabiego znalaz�em run� teleportacyjn�.
	//AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_04"); //Co� jeszcze?
   AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_04"); //Jak wygl�da tam sytuacja?
	AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_05"); //Trupy stra�nik�w i demony. Zdaje si�, �e Kruk by� tam przede mn� i poszczu� stra�nik�w swoimi pupilkami.
	AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_06"); //A Hrabia?
	
   if (Npc_IsDead(hr))
	{
		AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_07"); //Martwy.
	}
	else
	{
		AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_08"); //Dogada�em si� z nim. Wsp�lnie dobierzemy si� do Kruka.
		AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_09"); //Pewnie wiesz, co robisz, ale uwa�aj na niego, to szczwany lis.
	};
   
	AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_10"); //Krata do Orlego Gniazda jest zablokowana, nikt stamt�d nie wyjdzie, ani tym bardziej nikt tam nie wejdzie.
	AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_11"); //Tym zajmiemy si� p�niej. Na razie postawi� przed bram� kilku najemnik�w.

	/*******************
Ork daj tam 2 najemnik�w, znaczy zmie� rutyny jakim� 2 ambientom
******************/

	AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_12"); //Zrobi�e� wi�cej ni� od Ciebie oczekiwa�em.
	AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_13"); //Jak to wszystko si� sko�czy, usi�dziemy i schlejemy si� w sztok. Oczywi�cie na tw�j rachunek.
	AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_14"); //Masz to jak w myrta�skim banku.
	AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_15"); //Aha, mam jeszcze jedn� pro�b�. Powiedz Saturasowi, �e Nowy Ob�z znowu jest bezpieczny. Je�eli magowie chc�, mog� wr�ci� na stare �mieci.
	AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_16"); //W porz�dku, bywaj.
   
   Log_SetTopicStatus(CH5_NC_TheRock, LOG_SUCCESS);
   B_LogEntry		(CH5_NC_TheRock, "Lee dowiedzia� si�, co si� wydarzy�o w Orlim Gnie�dzie.");
	B_LogEntry		(CH5_NO_Rebel, "Orle Gniazdo jest ju�... zamkni�te.");

	/******************************

Ork idealnie by�oby cho� cz��iowo odtworzy� porz�dek w NO sprzed ataku stra�nik�w. Niech chocia� g��wni NPCe wr�c� do swoich startowych ruty.

*******************************/

	//merc_start ();
};

//*********************************************************

instance  DIA_Lee_ConvoysCompleated (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  17;
	condition		=  DIA_Lee_ConvoysCompleated_Condition;
	information		=  DIA_Lee_ConvoysCompleated_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Pomog�em Cordowi z konwojami.";
};                       

FUNC int  DIA_Lee_ConvoysCompleated_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Cord_ConvoyConvoyTrapEnd))||(Npc_KnowsInfo(hero,DIA_Cord_ConvoyTrapEnd1)))
	&&(Npc_KnowsInfo(hero,DIA_Lee_Convoys))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_ConvoysCompleated_Info()
{
	AI_Output (other, self,"DIA_Lee_ConvoysCompleated_15_01"); //Pomog�em Cordowi z konwojami.
	AI_Output (self, other,"DIA_Lee_ConvoysCompleated_08_02"); //Wiedzia�em, �e jeste� w�a�ciw� osob� do tego zadania.
	AI_Output (self, other,"DIA_Lee_ConvoysCompleated_08_03"); //Cord na pewno odpowiednio doceni� Twoje wysi�ki.
	AI_Output (other, self,"DIA_Lee_ConvoysCompleated_15_04"); //Mo�na tak powiedzie�.
	AI_Output (self, other,"DIA_Lee_ConvoysCompleated_08_05"); //Dobrze mie� Ci� po swojej stronie, Rick.
	B_LogEntry(CH5_NO_Rebel, "Sprawa Corda by�a bardziej z�o�ona ni� podejrzewa�em, ale mam to ju� za sob�.");
};

//*********************************************************

instance  DIA_Lee_MagsBack (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  20;
	condition		=  DIA_Lee_MagsBack_Condition;
	information		=  DIA_Lee_MagsBack_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Rozmawia�em z Saturasem.";
};                       

FUNC int  DIA_Lee_MagsBack_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_GoBackNC))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_MagsBack_Info()
{
	AI_Output (other, self,"DIA_Lee_MagsBack_15_01"); //Rozmawia�em z Saturasem.
	AI_Output (self, other,"DIA_Lee_MagsBack_08_02"); //Wiem, te� si� z nim widzia�em. Dobrze, �e wszystko wr�ci�o do starego porz�dku.
};

//*********************************************************

instance  DIA_Lee_AllCompleated (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  18;
	condition		=  DIA_Lee_AllCompleated_Condition;
	information		=  DIA_Lee_AllCompleated_Info;
	important		= 1;
	permanent		= 0;
	description 	= ".";
};                       

FUNC int  DIA_Lee_AllCompleated_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_ConvoysCompleated))&&(Npc_KnowsInfo(hero,DIA_Lee_TheRockCompleated))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_AllCompleated_Info()
{
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_01"); //Zrobi�e� dla nas wi�cej ni� �mia�em oczekiwa�. Zaskakujesz mnie, piracie.
	AI_Output (other, self,"DIA_Lee_AllCompleated_15_02"); //Sam si� zaskakuj�. Nigdy bym nie przypuszcza�, �e znajd� tu... przyjaci�.
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_03"); //Nic nie dzieje si� bez powodu, Rick. Oby�my do�yli lepszych czas�w.
	AI_Output (other, self,"DIA_Lee_AllCompleated_15_04"); //Nie mam zamiaru opowiada� swoich przyg�d wnukom, wystarczy, �e sam mam koszmary.
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_05"); //Mimo wszystko warto co� po sobie zostawi�, przyjacielu.
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_06"); //Cz�owiek umiera dwa razy...
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_07"); //Pierwszy raz, gdy przestanie bi� serce.
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_08"); //Drugi raz, kiedy ginie pami�� o nim i jego czynach.
	AI_Output (other, self,"DIA_Lee_AllCompleated_15_09"); //Zapami�tam to, Lee. Bywaj.
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_10"); //Do nast�pnego razu, piracie.

	Log_SetTopicStatus(CH5_NO_Rebel, LOG_SUCCESS);
	B_LogEntry(CH5_NO_Rebel, "Nowy Ob�z znowu jest wolny od stra�nik�w. Sporo mnie to kosztowa�o wysi�ku, ale by�o warto.");

	B_LogEntry (CH4_RBL_NCRebel, "W Nowym Obozie zapanowa� stary porz�dek. Czas porozmawia� z Cavalornem.");
	B_Kapitelwechsel(6);	 

	// Ork: Tutaj koniec? No chyba:
	BOSSFIGHT_CURRENT = BOSSFIGHT_NONE;
};

//*********************************************************

instance  DIA_Lee_Urt (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  20;
	condition		=  DIA_Lee_Urt_Condition;
	information		=  DIA_Lee_Urt_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Znasz stra�nika o imieniu Urt?";
};                       

FUNC int DIA_Lee_Urt_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Cipher_Urt))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Urt_Info()
{
	AI_Output (other, self,"DIA_Lee_Urt_15_01"); //Znasz stra�nika o imieniu Urt?
	AI_Output (self, other,"DIA_Lee_Urt_08_02"); //Nigdy o nim nie s�ysza�em.
	AI_Output (other, self,"DIA_Lee_Urt_15_03"); //A imi�... Urthos co� ci m�wi?
	AI_Output (self, other,"DIA_Lee_Urt_08_04"); //Hmm... By� kiedy� kto� w kr�lewskiej gwardii o takim imieniu.
	AI_Output (self, other,"DIA_Lee_Urt_08_05"); //Z tego co pami�tam zdaje si�, �e by� zamieszany w kradzie� klejnot�w koronnych.
	AI_Output (self, other,"DIA_Lee_Urt_08_06"); //Kr�l rozkaza� straci� wszystkich, kt�rzy brali udzia� w tym procederze. Tylko Urthos zdo�a� zbiec, to podobno on by� przyw�dc� szajki.
	AI_Output (self, other,"DIA_Lee_Urt_08_07"); //Dlaczego pytasz?
	AI_Output (other, self,"DIA_Lee_Urt_15_08"); //Urt, jeden ze stra�nik�w, a zarazem rebeliant odpowiedzialny za stworzenie siatki dywersyjnej w Starym Obozie to w�a�nie Urthos.
	AI_Output (self, other,"DIA_Lee_Urt_08_09"); //No prosz�, jaki ten �wiat ma�y. W ko�cu trafi� tam gdzie jego miejsce.
	AI_Output (other, self,"DIA_Lee_Urt_15_10"); //Podejrzewam, �e m�g� nas zdradzi�. Nie mam niezbitych dowod�w, tylko poszlaki. Co o tym my�lisz?
	AI_Output (self, other,"DIA_Lee_Urt_08_11"); //Urthos to cwane bydl�. W gwardii dos�u�y� si� porucznika. By� jednak zbyt zach�anny i to go zgubi�o.
	AI_Output (self, other,"DIA_Lee_Urt_08_12"); //Chocia� plan kradzie�y obmy�li� bardzo b�yskotliwie... Na pewno nadaje si� do sabota�u.
	AI_Output (self, other,"DIA_Lee_Urt_08_13"); //Obawiam si� jednak, �e m�g�by by� z niego niez�y materia� na zdrajc�. Dla niego liczy si� tylko z�oto, ruda i wszystko na czym m�g�by zarobi�.
	AI_Output (other, self,"DIA_Lee_Urt_15_14"); //Zaufa�by� mu?
	AI_Output (self, other,"DIA_Lee_Urt_08_15"); //Nigdy w �yciu. Uwa�aj na niego, Rick.
	AI_Output (other, self,"DIA_Lee_Urt_15_16"); //Dzi�ki, Lee. To w�a�nie chcia�em us�ysze�.
	
   B_LogEntry(CH6_RBL_Spy, "Lee potwierdzi� wersj� Ciphera. Dodatkowo powiedzia� mi, �e Urthosowi nie mo�na zaufa�. Musz� zdoby� niepodwa�alne dowody. Mo�e znajd� jakiego� �ywego �wiadka?");
}; 

INSTANCE DIA_Lee_CanYouTeachMe (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= DIA_Lee_CanYouTeachMe_Condition;
	information		= DIA_Lee_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Lee_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Lee_Agree))
	{
		return 1;
	};
};

FUNC VOID DIA_Lee_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Lee_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Lee_CanYouTeachMe_12_02"); //Wiem sporo o dwur�cznej broni, mog� podzieli� si� t� wiedz�.
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Lee nauczy mnie jak po mistrzowsku w�ada� dwur�cznym or�em.");
};

INSTANCE DIA_Lee_CanYouTeachMe1 (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= DIA_Lee_CanYouTeachMe1_Condition;
	information		= DIA_Lee_CanYouTeachMe1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Widzia�e� kiedy� miecz runiczny?"; 
};

FUNC INT DIA_Lee_CanYouTeachMe1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Lee_Agree))
	{
		return 1;
	};
};

FUNC VOID DIA_Lee_CanYouTeachMe1_Info()
{
	AI_Output (other, self, "DIA_Lee_CanYouTeachMe1_15_01"); //Widzia�e� kiedy� miecz runiczny?
	AI_Output (self, other, "DIA_Lee_CanYouTeachMe1_12_02"); //Nie, ale s�ysza�em, �e to pot�na bro�.
	AI_Output (other, self, "DIA_Lee_CanYouTeachMe1_15_03"); //Wiesz jak ni� w�ada�?
	AI_Output (self, other, "DIA_Lee_CanYouTeachMe1_12_04"); //Na twoje szcz��ie, tak.
	AI_Output (self, other, "DIA_Lee_CanYouTeachMe1_12_05"); //S�uchaj uwa�nie, bo nie b�d� powtarza�...	
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Lee nauczy mnie jak w�ada� mieczem runicznym.");
};