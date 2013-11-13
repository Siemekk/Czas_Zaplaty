//******************************************
//					EXIT	
//******************************************

instance  DIA_Bullit_Exit (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 999;
	condition	= DIA_Bullit_Exit_Condition;
	information	= DIA_Bullit_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Bullit_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_Exit_Info()
{
	B_StopProcessInfos(self);
};

//******************************************
//					First	
//******************************************

instance  DIA_Bullit_First (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 1;
	condition	= DIA_Bullit_First_Condition;
	information	= DIA_Bullit_First_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int  DIA_Bullit_First_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_First_Info()
{
	AI_Output (self, other,"DIA_Bullit_First1_06_00"); //Kogo my tu mamy? Jeste� jednym z tych, kt�rych ochrzci�em wcze�niej? Czego chcesz? Przyszed�e� po repet�? 
	AI_Output (other, self, "DIA_Bullit_First1_15_01"); //Jak b�d� chcia� dosta� po mordzie, to dam Ci zna�. Tylko przyprowad� kumpli, bo w pojedynk� by�by� dla mnie obelg�.
	AI_Output (self, other,"DIA_Bullit_First1_06_02"); //Za kogo Ty si� uwa�asz gnido? Zaraz poka�� Ci, co robimy z zarozumia�ymi typami.
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self, other, false);
};

//******************************************

instance  DIA_Bullit_Eskort (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 2;
	condition	= DIA_Bullit_Eskort_Condition;
	information	= DIA_Bullit_Eskort_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chcia�by� obi� komu� mord�?"; 
};                       

FUNC int  DIA_Bullit_Eskort_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orkan_Again))&&(Npc_KnowsInfo (hero, DIA_Bullit_First))
	{
		return 1;
	};
};

FUNC VOID  DIA_Bullit_Eskort_Info()
{
	AI_Output (other, self, "DIA_Bullit_Eskort_15_01"); //Chcia�by� obi� komu� mord�?
	AI_Output (self, other,"DIA_Bullit_Eskort_06_02"); //Ka�da okazja jest dobra. O co chodzi?
	AI_Output (other, self, "DIA_Bullit_Eskort_15_03"); //Szykuje si� wyprawa poza palisad�. Mo�e by� gor�co.
	AI_Output (self, other,"DIA_Bullit_Eskort_06_04"); //Chyba nie m�wisz o transporcie broni?
	AI_Output (other, self, "DIA_Bullit_Eskort_15_05"); //W�a�nie o tym.
	AI_Output (self, other,"DIA_Bullit_Eskort_06_06"); //Nie jestem idiot�. Co innego spu�ci� wpierdol ��todziobowi, a co innego szuka� �mierci.
	AI_Output (self, other,"DIA_Bullit_Eskort_06_07"); //Poszukaj frajera gdzie indziej.
	B_LogEntry(CH5_NC_Convoys, "Bulit nie da� si� przekona�.");
	B_StopProcessInfos(self);
};

//******************************************

instance  DIA_Bullit_Attack (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 3;
	condition	= DIA_Bullit_Attack_Condition;
	information	= DIA_Bullit_Attack_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nie obawiasz si� ataku?"; 
};                       

FUNC int  DIA_Bullit_Attack_Condition()
{
	if (CHEST_KNOW == TRUE)&&(Npc_KnowsInfo (hero, DIA_Bullit_First))
	{
		return 1;
	};
};

FUNC VOID  DIA_Bullit_Attack_Info()
{
	AI_Output (other, self, "DIA_Bullit_Attack_15_01"); //Nie obawiasz si� ataku?
	AI_Output (self, other,"DIA_Bullit_Attack_06_02"); //A czego tu si� ba�? Brama zamkowa b�dzie zamkni�ta, wi�c rebelianci mog� nam naskoczy�.
	AI_Output (self, other,"DIA_Bullit_Attack_06_02"); //Wystrzelamy ich jak kaczki z mur�w i przez kraty.
	AI_Output (other, self, "DIA_Bullit_Attack_15_03"); //Czyli atak na bram� zamkow� to czyste szale�stwo...
	AI_Output (self, other,"DIA_Bullit_Attack_06_04"); //Raczej	samob�jstwo. No chyba, �e kto� by bram� podni�s�, ale raczej nikt nie jest a� takim idiot�.
};

//******************************************

instance  DIA_Bullit_Guard (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 4;
	condition	= DIA_Bullit_Guard_Condition;
	information	= DIA_Bullit_Guard_Info;
	permanent	= 0;
	important	= 1;
	description	= ""; 
};                       

FUNC int  DIA_Bullit_Guard_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Guard_First))&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID  DIA_Bullit_Guard_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Bullit_Guard_06_01"); //S�ysza�em, jak stra�nik wykopa� Ci� z loch�w. Lepiej si� tam teraz nie pcha�.
	AI_Output (other, self,"DIA_Bullit_Guard_15_02"); //Dlaczego?
	AI_Output (self, other,"DIA_Bullit_Guard_06_03"); //Gomez zamkn�� w podziemiach Diego po tym, jak ten stary cap wr�ci� do obozu, �eby spiskowa� z cieniami. 
	AI_Output (self, other,"DIA_Bullit_Guard_06_04"); //Jutro maj� go straci�.
	diego_dead = B_SetDayTolerance()+1;
	AI_Output (other, self,"DIA_Bullit_Guard_15_05"); //Magnaci nie boj� si�, �e po �mierci Diego, cienie si� zbuntuj�?
	AI_Output (self, other,"DIA_Bullit_Guard_06_06"); //To sko�czy�oby si� krwaw� rzezi� cieni. Kruk ju� nas na to przygotowa�. 
	AI_Output (self, other,"DIA_Bullit_Guard_06_07"); //Poza tym egzekucja ma si� odby� po cichu w celi. P�niej Gomez chce wywiesi� cia�o Diego na zamkowych murach.
	AI_Output (other, self,"DIA_Bullit_Guard_15_08"); //Kruk wyda� taki rozkaz stra�nikom?
	AI_Output (self, other,"DIA_Bullit_Guard_06_09"); //Tak. Tylko magnaci maj� tam wst�p.
	AI_Output (self, other,"DIA_Bullit_Guard_06_10"); //S�ysza�em, jak Kruk powiedzia�, �e nikogo innego nie mo�na wpuszcza� do celi z tym parszywym zdrajc�.
	AI_Output (other, self,"DIA_Bullit_Guard_15_11"); //A kto przynosi jedzenie?
	AI_Output (self, other,"DIA_Bullit_Guard_06_12"); //Balam. Stra�nik strasznie przy tym narzeka, ale zawsze wy�era mi�so dla Diego.
	AI_Output (other, self,"DIA_Bullit_Guard_15_13"); //Szkoda porz�dnego pieczystego na chodz�cego trupa.
	AI_Output (self, other,"DIA_Bullit_Guard_06_14"); //Dok�adnie.
	AI_Output (other, self,"DIA_Bullit_Guard_15_15"); //Musz� ju� i��.
	AI_Output (self, other,"DIA_Bullit_Guard_06_16"); //Tylko nie pl�cz si� ju� po lochach.
	B_LogEntry(CH6_RBL_Diego, "Stra�nik przed drzwiami nikogo nie przepu�ci, a mam tylko dob� na uwolnienie Diego, zanim zostanie stracony. Ale zaczepi� mnie Bullit. Stra�nik twierdzi, �e pr�cz magnat�w i Balama, kt�ry zanosi je�cowi jedzenie, nikt nie ma tam dost�pu. Bullit doda�, �e stra�nik zawsze zabiera mi�so i sam je zjada. Mam pomys�, musz� tylko porozmawia� z Balamem.");

	Npc_ExchangeRoutine(self,"START");
};

//******************************************

instance  DIA_Bullit_Skip (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 5;
	condition	= DIA_Bullit_Skip_Condition;
	information	= DIA_Bullit_Skip_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dobrze znasz Skipa?"; 
};                       

FUNC int  DIA_Bullit_Skip_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Skip_Warehouse))
	{
		return 1;
	};
};

FUNC VOID  DIA_Bullit_Skip_Info()
{
	AI_Output (other, self,"DIA_Bullit_Skip_15_01"); //Dobrze znasz Skipa?
	AI_Output (self, other,"DIA_Bullit_Skip_06_02"); //Tak sobie, a bo co?
	AI_Output (other, self,"DIA_Bullit_Skip_15_03"); //Wspomnia� co� o mieczach osobistych stra�nik�w Gomeza, kt�re trzyma w magazynie. Jestem pewien, �e to bujda...
	AI_Output (self, other,"DIA_Bullit_Skip_06_04"); //A, te b�yskotki. Po tym jak jeden z tych gamoni przechla� miecz, Gomez rozkaza� je zamkn��. Idiotyczna historia.
	AI_Output (other, self,"DIA_Bullit_Skip_15_05"); //Czyli Skip m�wi� prawd�?
	AI_Output (self, other,"DIA_Bullit_Skip_06_06"); //Niestety, tak. Zreszt�, ten pacan zacz�� ostatnio ostro popija�. Ju� kilka razy widzia�em, jak po zmierzchu szpera w pakach z ry��wk�.
	AI_Output (other, self,"DIA_Bullit_Skip_15_07"); //A po choler�?
	AI_Output (self, other,"DIA_Bullit_Skip_06_08"); //A po co si� szuka w�dy? �eby j� wypi�!
	AI_Output (self, other,"DIA_Bullit_Skip_06_09"); //Trac� czas na rozmow� z idiot�...
	B_LogEntry(CH6_RBL_Thievery, "Nie lubi� robi� z siebie b�azna, ale czasami nie mam wyboru. Dzi�ki temu Bullit zdradzi� mi, �e Skip po nocy buszuje w pakach z ry��wk�. Musz� zaczeka� do zmroku i p�j�� za Skipem. Jak b�d� szybki, to z�oj� mu sk�r�, zanim zorientuje si�, kto to by�. Klucz pewnie b�dzie mia� przy sobie.");

	/*******************************
Ork zmie� skipowi gld tak, �eby mo�na by�o go zla� kiedy b�dzie przy tych pakach.
Aha chodzi o te paki pomi�dzy siedzib� mag�w a zamkiem, tu� pod murem. Niech tam stoi i chleje p� nocy.

*******************************/
};
