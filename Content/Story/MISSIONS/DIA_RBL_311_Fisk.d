
// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Fisk_Hello (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 1;
	condition		= DIA_Fisk_Hello_Condition;
	information		= DIA_Fisk_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Fisk_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Fisk_Hello_Info()
{
	AI_Output (self, other, "DIA_Fisk_Hello_12_01"); //Co� poda�, ��todziobie?
	AI_Output (other, self, "DIA_Fisk_Hello_15_02"); //Nie zwyk�em p�uka� gard�a l�dowymi szczynami. Masz co� mocniejszego?
	AI_Output (self, other, "DIA_Fisk_Hello_12_03"); //Mo�e i mam. Sam sprawd�.
	
	Log_CreateTopic(GE_TraderOR, LOG_NOTE);
	B_LogEntry(GE_TraderOR,	"U Fiska mog� si� czego� napi� i naje��.");
};

// **************************************************

INSTANCE DIA_Fisk_Bartender (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 3;
	condition		= DIA_Fisk_Bartender_Condition;
	information		= DIA_Fisk_Bartender_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jeste� karczmarzem?"; 
};

FUNC INT DIA_Fisk_Bartender_Condition()
{
   if (Npc_KnowsInfo(other,DIA_Fisk_Hello))
   { 
   	return TRUE; 
   }; 
};

FUNC VOID DIA_Fisk_Bartender_Info()
{
	AI_Output (other, self, "DIA_Fisk_Bartender_15_01"); //Jeste� karczmarzem?
	AI_Output (self, other, "DIA_Fisk_Bartender_12_02"); //Nie, do cholery. Ale kto� musi prowadzi� interes.
	AI_Output (other, self, "DIA_Fisk_Bartender_15_03"); //Czym zajmowa�e� si� wcze�niej?
	AI_Output (self, other, "DIA_Fisk_Bartender_12_04"); //By�em kupcem w Starym Obozie i wiod�o mi si� nie najgorzej, dop�ki Gomez nie zacz�� usuwa� Cieni.
	AI_Output (self, other, "DIA_Fisk_Bartender_12_05"); //Wtedy stwierdzi�em, �e nadszed� w�a�ciwy czas na zmian� otoczenia.
	AI_Output (self, other, "DIA_Fisk_Bartender_12_06"); //Z Cavalornem znam si� od lat. Jak widzisz mam oko na tutejsze menty przesiaduj�ce w ober�y.
	AI_Output (self, other, "DIA_Fisk_Bartender_12_07"); //Ale Ciebie widz� tu po raz pierwszy. Ten pancerz...
	AI_Output (self, other, "DIA_Fisk_Bartender_12_08"); //Nie jeste� skaza�cem?
	AI_Output (other, self, "DIA_Fisk_Bartender_15_09"); //Jestem... By�em... 'marynarzem'.
	AI_Output (other, self, "DIA_Fisk_Bartender_15_10"); //M�j okr�t rozbi� si� u wybrze�y Khorinis, a przez barier� nie mog� si� st�d wydosta�.
	AI_Output (self, other, "DIA_Fisk_Bartender_12_11"); //Hmm, piraci w Kolonii. Ciekawe...
	AI_Output (other, self, "DIA_Fisk_Bartender_15_12"); //Powiedzia�em, �e jestem marynarzem!
	AI_Output (self, other, "DIA_Fisk_Bartender_12_13"); //Jak tam sobie chcesz. 
	AI_Output (self, other, "DIA_Fisk_Bartender_12_14"); //Mi�o si� gaw�dzi�o, ale musz� wraca� do wycierania kufli.
};

// **************************************************

var int fisk_answer;
var int fisk_agree_fight;

INSTANCE DIA_Fisk_Fight (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 4;
	condition		= DIA_Fisk_Fight_Condition;
	information		= DIA_Fisk_Fight_Info;
	permanent		= 1;
	important		= 0;
	description		= "Przysy�a mnie Cavalorn."; 
};

FUNC INT DIA_Fisk_Fight_Condition()
{
   if (Npc_KnowsInfo(other,DIA_Fisk_Bartender))&&(Npc_KnowsInfo(other,DIA_HUN_336_Cavalorn_Hello))
   &&(hark_trial!=5) && (!fisk_agree_fight)//fight not ready Done
   { 
   	return TRUE; 
   }; 
};

FUNC VOID DIA_Fisk_Fight_Info()
{
	if (fisk_answer == FALSE)
	{
      fisk_answer = TRUE;
	
      AI_Output (other, self, "DIA_Fisk_Fight_15_01"); //Przysy�a mnie Cavalorn.
      AI_Output (self, other, "DIA_Fisk_Fight_12_02"); //Cavalorn podsy�a mi nowych tylko po to, �eby ich sprawdzi�.
      AI_Output (self, other, "DIA_Fisk_Fight_12_03"); //Nie mam teraz nic do roboty.
      AI_Output (self, other, "DIA_Fisk_Fight_12_04"); //Ostatnio w karczmie nic si� nie dzieje, mo�na usn�� z nud�w...
      AI_Output (other, self, "DIA_Fisk_Fight_15_05"); //Na pewno nic si� dla mnie nie znajdzie?
      AI_Output (self, other, "DIA_Fisk_Fight_12_06"); //Sam widzisz. Cisza i spok�j...
      AI_Output (self, other, "DIA_Fisk_Fight_12_07"); //Zaraz... Mam pomys�.
      AI_Output (self, other, "DIA_Fisk_Fight_12_08"); //Rozruszaj towarzystwo w ober�y to si� za Tob� wstawi�.
      AI_Output (other, self, "DIA_Fisk_Fight_15_09"); //Ale jak mam to zrobi�?
      AI_Output (self, other, "DIA_Fisk_Fight_12_10"); //A ja my�la�em, �e masz g�ow� na karku.
      AI_Output (other, self, "DIA_Fisk_Fight_15_11"); //Masz na my�li rozr�b�?
      AI_Output (self, other, "DIA_Fisk_Fight_12_12"); //Jednak masz jaja. Tak, czas troch� rozrusza� towarzystwo.
	}
	else
	{
      AI_Output (other, self, "DIA_Fisk_Fight_15_13"); //Przysy�a mnie Cavalorn.
      AI_Output (self, other, "DIA_Fisk_Fight_12_14"); //To ju� wiem. To jak b�dzie z rozruszaniem towarzystwa?
	};

	Info_ClearChoices(DIA_Fisk_Fight);
	Info_AddChoice	 (DIA_Fisk_Fight, "W porz�dku. Zobacz� co da si� zrobi�." ,DIA_Fisk_Fight_Yes);
	Info_AddChoice	 (DIA_Fisk_Fight, "Nie szukam guza." ,DIA_Fisk_Fight_No);
};

func void DIA_Fisk_Fight_Yes()
{
	AI_Output (other, self,"DIA_Fisk_Fight_Yes_15_00"); //W porz�dku. Zobacz� co da si� zrobi�.
	AI_Output (self, other,"DIA_Fisk_Fight_Yes_12_01"); //�wietnie. Tylko nie upaprajcie pod�ogi za bardzo krwi� bo ci�ko j� p�niej doszorowa�.
	AI_Output (self, other,"DIA_Fisk_Fight_Yes_12_02"); //I ma by� bez ofiar. Taka spokojna burda na lepsze kr��enie.
	Log_CreateTopic(CH1_Rbl_SkipFight, LOG_MISSION);
	B_LogSetTopicStatus(CH1_Rbl_SkipFight, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_SkipFight, "Zgodzi�em si� zainicjowa� burd� w ober�y Fiska. Tylko jak to zrobi�?");
	
   fisk_agree_fight = true;
	Info_ClearChoices(DIA_Fisk_Fight);
};

func void DIA_Fisk_Fight_No()
{
	AI_Output (other, self,"DIA_Fisk_Fight_No_15_00"); //Nie szukam guza. 
	AI_Output (self, other,"DIA_Fisk_Fight_No_12_01"); //Ale ja szukam rozrywki. Wr�� jak zmienisz zdanie.
	Info_ClearChoices(DIA_Fisk_Fight);	
};

// **************************************************
func void Dia_Fisk_trust()
{
   fisk_trust = TRUE;
	B_GiveXP(250);
	rebel_camp_trust = rebel_camp_trust + 1; 
   
   AI_Output (self, other, "DIA_Fisk_AfterFight_12_03"); //Piwo na m�j koszt i niech Ci idzie na zdrowie.
   
   CreateInvItems	(self, ItFoBeer, 6);
	B_GiveInvItems (self, other,ItFoBeer, 6);
	AI_Output (other, self, "DIA_Fisk_AfterFight_15_04"); //Dzi�ki.
	AI_UseItem (other,ItFobeer);
   
	B_LogSetTopicStatus(CH1_Rbl_SkipFight, LOG_Success);
	B_LogEntry(CH1_Rbl_SkipFight, "Doprowadzi�em do burdy w karczmie. Fisk by� zadowolony.");
	B_LogEntry		(CH1_Rbl_RebelCampTrust, "Zadowoli�em Fiska.");
};

INSTANCE DIA_Fisk_AfterFight(C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 4;
	condition		= DIA_Fisk_AfterFight_Condition;
	information		= DIA_Fisk_AfterFight_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak Ci si� podoba�o przedstawienie?"; 
};

FUNC INT DIA_Fisk_AfterFight_Condition()
{
  	if (DIA_Fisk_Fight.permanent == 0)&&(hark_trial >= 5)&&(hark_trial!=10)&& (!Npc_KnowsInfo(other, DIA_Fisk_AfterFight_WOIntroduce))//10=fail
  	{ 
   	return TRUE; 
   }; 
};

FUNC VOID DIA_Fisk_AfterFight_Info()
{
	AI_Output (other, self, "DIA_Fisk_AfterFight_15_01"); //Jak Ci si� podoba�o przedstawienie?
	AI_Output (self, other, "DIA_Fisk_AfterFight_12_02"); //By�o ca�kiem nie�le. O to mi chodzi�o.
	
   Dia_Fisk_trust();
};

INSTANCE DIA_Fisk_AfterFight_WOIntroduce(C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 4;
	condition		= DIA_Fisk_AfterFight_WOIntroduce_Condition;
	information		= DIA_Fisk_AfterFight_WOIntroduce_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Fisk_AfterFight_WOIntroduce_Condition()
{
   if (!Npc_KnowsInfo(other,DIA_Fisk_Fight))&&(hark_trial >= 5) && (!Npc_KnowsInfo(other, DIA_Fisk_AfterFight))
  	{ 
   	return TRUE; 
  	}; 
};

FUNC VOID DIA_Fisk_AfterFight_WOIntroduce_Info()
{
	// Sher, popraw dialog.
	// (ca�y dialog jest utworzony na wypadek gdyby Rick doprowadzi� do burdy bez
	// wczesniejszej rozmowy z Fiskiem)
	AI_Output (self, other, "DIA_Fisk_AfterFight_WOIntroduce_12_00"); //By�o ca�kiem nie�le.
	AI_Output (other, self, "DIA_Fisk_AfterFight_WOIntroduce_15_01"); //Masz na my�li burd�?
	AI_Output (self, other, "DIA_Fisk_AfterFight_WOIntroduce_12_02"); //Przednia rozrywka, przyjacielu. No i ober�a niezbyt zachlapana krwi�, po prostu idealnie!
	AI_Output (self, other, "DIA_Fisk_AfterFight_WOIntroduce_12_03"); //Na pewno wspomn� o Tobie Cavalornowi.
	
   Dia_Fisk_trust();
};

// **************************************************

INSTANCE DIA_Fisk_Stew (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 12;
	condition		= DIA_Fisk_Stew_Condition;
	information		= DIA_Fisk_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynios�em pyszny gulasz."; 
};

FUNC INT DIA_Fisk_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Fisk_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_Fisk_Stew_15_01"); //Przynios�em pyszny gulasz.
	AI_Output (self, other, "DIA_Fisk_Stew_11_02"); //Nie przesadzaj. Za te pomyje, ju� dawno kto� powinien utopi� Snafa w kotle.
	AI_Output (self, other, "DIA_Fisk_Stew_11_03"); //Ale lepsze to ni� nic.
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
 	B_LogEntry		(CH2_Rbl_Food, "Fisk stwierdzi�, �e to pomyje, ale te� zjad�."); 
};

INSTANCE DIA_FISK_Spy (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 13;
	condition		= DIA_FISK_Spy_Condition;
	information		= DIA_FISK_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl�dasz na kogo� kto ju� sporo widzia�."; 
};

FUNC INT DIA_FISK_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_Spy_Info()
{
	spy_count = spy_count + 1;
   
	AI_Output (other, self, "DIA_FISK_Spy_15_01"); //Wygl�dasz na kogo� kto ju� sporo widzia�.
	AI_Output (self, other, "DIA_FISK_Spy_07_02"); //Nie powiem, widzia�em to i owo. A co konkretnie masz na my�li?
	AI_Output (other, self, "DIA_FISK_Spy_15_03"); //Kim by�e� w Starym Obozie?
	AI_Output (self, other, "DIA_FISK_Spy_07_04"); //Nikim wa�nym. Zwyk�ym kupcem.
	AI_Output (other, self, "DIA_FISK_Spy_15_05"); //Dobrze znasz Gomeza?
	AI_Output (self, other, "DIA_FISK_Spy_07_06"); //Tyle ile trzeba by�o by prze�y� w�r�d magnat�w. A po co te pytania?
	AI_Output (other, self, "DIA_FISK_Spy_15_07"); //Jestem tylko ciekaw czym si� wcze�niej zajmowa�e�.
	AI_Output (self, other, "DIA_FISK_Spy_07_08"); //Ciekawo�� w Kolonii to cz�sta przyczyna k�opot�w. Zapami�taj to.
	B_LogEntry		(CH2_Rbl_Spy, "Fisk by� kim� wa�nym w Obozie Gomeza. Dobrze zna� magnat�w. Ciekawe czy to tylko przypadek, �e znalaz� si� w Obozie Rebeliant�w?");
	
	if (spy_count == 12)
	{
      spy_count = spy_count + 1;
      
      AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od ciebie chcia�.
      
      B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_FISK_Spy1 (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 13;
	condition		= DIA_FISK_Spy1_Condition;
	information		= DIA_FISK_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno musia�e� ucieka� z Obozu Stra�nik�w przez jakiego� skaza�ca."; 
};

FUNC INT DIA_FISK_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_FISK_Spy1_15_01"); //Podobno musia�e� ucieka� z Obozu Stra�nik�w przez jakiego� skaza�ca.
	AI_Output (self, other, "DIA_FISK_Spy1_07_02"); //To nie by� zwyczajny skazaniec. 
	AI_Output (self, other, "DIA_FISK_Spy1_07_03"); //Powiedzmy, �e sprzeda�em mu wi�cej ni� powinienem.
	AI_Output (other, self, "DIA_FISK_Spy1_15_04"); //A Gomezowi si� to nie spodoba�o.
	AI_Output (self, other, "DIA_FISK_Spy1_07_05"); //W rzeczy samej. Nie mia�em wielkiego wyboru. Nie chcia�em podzieli� losu Mag�w Ognia czy niekt�rych spo�r�d Cieni.
	AI_Output (other, self, "DIA_FISK_Spy1_15_06"); //My�lisz, �e Gomez m�g�by mie� w obozie swojego szpiega?
	AI_Output (self, other, "DIA_FISK_Spy1_07_07"); //Je�eli my�lisz o mnie to nawet za g�r� rudy bym dla niego nie pracowa�.
	AI_Output (self, other, "DIA_FISK_Spy1_07_08"); //Gomez to szaleniec, kt�ry pr�dzej czy p�niej zap�aci za swoje zbrodnie.
	AI_Output (self, other, "DIA_FISK_Spy1_07_09"); //Nie sypn��bym Cavalorna i ch�opak�w - nie gryzie si� r�ki, kt�ra Ci� karmi, piracie.
	AI_Output (other, self, "DIA_FISK_Spy1_15_10"); //To mo�e kto� inny?
	AI_Output (self, other, "DIA_FISK_Spy1_07_11"); //Nie wiem... Chocia� co� ci powiem. Tony by� kumplem Szakala, a to jeden z najbardziej zaufanych ludzi Gomeza.
	AI_Output (self, other, "DIA_FISK_Spy1_07_12"); //Z tego co wiem nikt ze stra�nik�w nie �ciga� Toniego kiedy to niby ucieka� z obozu Gomeza.
	AI_Output (self, other, "DIA_FISK_Spy1_07_13"); //Ale to tylko moje spostrze�enia. Mog� si� myli�, dlatego trzymam j�zyk za z�bami. Nie oskar�am nikogo je�eli nie mam dowod�w.
	AI_Output (other, self, "DIA_FISK_Spy1_15_14"); //To rzadka zaleta. Przemy�l� to co powiedzia�e�...
	
   B_LogEntry		(CH2_Rbl_Spy, "Fisk raczej nie jest cz�owiekiem Gomeza. I nawet on zauwa�y�, �e z Tonym jest co� nie tak. Zwr�ci� mi uwag� na to, �e Szakal i Tony byli przyjaci�mi. Powinienem o tym pami�ta�.");
	
   if (tony_spy == 12)
	{
      tony_spy = tony_spy + 1;
	
      AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta�, nie daj mu czeka�.
	
      B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};
	
   B_StopProcessInfos	(self);
};

/*********************************

SIDE QUEST

*********************************/

INSTANCE DIA_FISK_Martin (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 20;
	condition		= DIA_FISK_Martin_Condition;
	information		= DIA_FISK_Martin_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_FISK_Martin_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Cavalorn_BlackTrollBack))
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_Martin_Info()
{
	B_FullStop (hero);
	AI_Output (self, other, "DIA_FISK_Martin_07_01"); //Zatrzymaj si�! Nie szukasz jakiej� roboty?
	AI_TurnToNpc(other, self);
	AI_Output (other, self, "DIA_FISK_Martin_15_02"); //Mo�e i szukam.
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_FISK_Martin_07_03"); //Wiedzia�em, �e si� skusisz.
	AI_Output (other, self, "DIA_FISK_Martin_15_04"); //Najpierw powiedz o co chodzi.
	AI_Output (self, other, "DIA_FISK_Martin_07_05"); //M�j przyjaciel ma problemy. Nazywa si� Martin.
	AI_Output (self, other, "DIA_FISK_Martin_07_06"); //Od jakiego� czasu stoi nad brzegiem rzeki i... stoi. Gapi si� tylko w wod�. Robi to ca�ymi dniami.
	AI_Output (other, self, "DIA_FISK_Martin_15_07"); //Mo�e szuka spokoju? Albo chce si� rzuci� w odm�ty.
	AI_Output (self, other, "DIA_FISK_Martin_07_08"); //Tam? Co najwy�ej by si� poobija� na tej p�yci�nie.
	AI_Output (self, other, "DIA_FISK_Martin_07_09"); //Najgorsze jest to, �e nie chce mi powiedzie� co si� dzieje. Dobrze go znam, wiem, �e co� go trapi.
	AI_Output (other, self, "DIA_FISK_Martin_15_10"); //Czym zajmowa� si� wcze�niej?
	AI_Output (self, other, "DIA_FISK_Martin_07_11"); //A r�nie. Troch� polowa�, czasami wykona� jakie� zadanie dla Ratforda, sporo te� sp�dza� czasu w tawernie.
	AI_Output (self, other, "DIA_FISK_Martin_07_12"); //Pomo�esz?
};

//***************************************************************

INSTANCE DIA_FISK_MartinOk (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 21;
	condition		= DIA_FISK_MartinOk_Condition;
	information		= DIA_FISK_MartinOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, porozmawiam z Martinem."; 
};

FUNC INT DIA_FISK_MartinOk_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_FISK_Martin))
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_MartinOk_Info()
{
	AI_Output (other, self, "DIA_FISK_MartinOk_15_01"); //Dobra, porozmawiam z Martinem.
	AI_Output (self, other, "DIA_FISK_MartinOk_07_02"); //Kamie� mi spad� z serca. Mo�e komu� obcemu pr�dzej si� zwierzy.
	AI_Output (self, other, "DIA_FISK_MartinOk_07_03"); //Znajdziesz go nad rzek�. Powodzenia.
	AI_Output (other, self, "DIA_FISK_MartinOk_15_04"); //Chwileczk�. A zap�ata?
	AI_Output (self, other, "DIA_FISK_MartinOk_07_05"); //Dostaniesz 100 bry�ek po wykonanej robocie.
	AI_Output (other, self, "DIA_FISK_MartinOk_15_06"); //Niech b�dzie.
   
   Wld_InsertNpc(RBL_4125_Martin, "HC_NEAR_WATCHTOWER3_2"); 

	Log_CreateTopic	(CH2_RBL_Feelings, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Feelings, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Feelings, "Fisk prosi� mnie, �ebym si� dowiedzia� co dr�czy jego przyjaciela, Martina. Znajd� go nad rzek� gdzie ostatnio notorycznie przesiaduje.");
};

//***************************************************************

INSTANCE DIA_FISK_MartinRing (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 22;
	condition		= DIA_FISK_MartinRing_Condition;
	information		= DIA_FISK_MartinRing_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozmawia�em z Martinem."; 
};

FUNC INT DIA_FISK_MartinRing_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Martin_What))
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_MartinRing_Info()
{
	AI_Output (other, self, "DIA_FISK_MartinRing_15_01"); //Rozmawia�em z Martinem.
	AI_Output (self, other, "DIA_FISK_MartinRing_07_02"); //I?
	
   if (!Help_Martin)
	{
      AI_Output (other, self, "DIA_FISK_MartinRing_15_03"); //Nic mi nie powiedzia�. Skoro ma tajemnice to trzeba to uszanowa�.
      AI_Output (self, other, "DIA_FISK_MartinRing_07_04"); //Nie wywi�za�e� si� z umowy. Po co ja w og�le traci�em na Ciebie czas?
      AI_Output (other, self, "DIA_FISK_MartinRing_15_05"); //Mam wystarczaj�co du�o w�asnych problem�w, �eby jeszcze zajmowa� si� cudzymi. Bywaj.
	
      Log_SetTopicStatus(CH2_RBL_Feelings, LOG_FAILED);
      B_LogEntry(CH2_RBL_Feelings, "Sprawa z Martinem zako�czona, niech sami radz� sobie ze swoimi problemami.");
	}
	else
	{
      AI_Output (other, self, "DIA_FISK_MartinRing_15_06"); //Wiem co go dr�czy. Kto� mu ukrad� z�oty pier�cionek, kt�ry wiele dla niego znaczy�.
      AI_Output (other, self, "DIA_FISK_MartinRing_15_07"); //A teraz nagroda.
      AI_Output (self, other, "DIA_FISK_MartinRing_07_08"); //Spokojnie. Dostaniesz rud� jak pomo�esz Martinowi odzyska� pier�cie�.
      AI_Output (other, self, "DIA_FISK_MartinRing_15_09"); //Nie tak si� umawiali�my. Jeste� cholernym oszustem!
      AI_Output (self, other, "DIA_FISK_MartinRing_07_10"); //Co najwy�ej naci�gaczem, a to spora r�nica. Poza tym czego si� spodziewa�e� po skaza�cu?
      AI_Output (other, self, "DIA_FISK_MartinRing_15_11"); //Niech to szlag. Dobra, dowiem si� kto za tym stoi. Masz jakie� podejrzenia?
      AI_Output (self, other, "DIA_FISK_MartinRing_07_12"); //Stawia�bym na profesjonalist�. W obozie mamy tylko jednego wykwalifikowanego z�odzieja.
      AI_Output (other, self, "DIA_FISK_MartinRing_15_13"); //R�czka. Masz racj�, zaczn� od niego.
      AI_Output (self, other, "DIA_FISK_MartinRing_07_14"); //W�tpi�, �e si� przyzna. Pogadaj z lud�mi w obozie, mo�e kto� co� widzia�.
      AI_Output (other, self, "DIA_FISK_MartinRing_15_15"); //Martinowi zale�a�o na dyskrecji...
      AI_Output (self, other, "DIA_FISK_MartinRing_07_16"); //Wi�c b�d� dyskretny. Powodzenia.
	
      B_LogEntry(CH2_RBL_Feelings, "Dostan� rud� jak pomog� Martinowi odzyska� pier�cie�. Fisk to cholerny oszust. Martin twierdzi�, �e sygnetu nie ukrad� amator, w obozie znajd� R�czk� - �wietnego z�odzieja. W�tpi�, �e R�czka przyzna si� do kradzie�y, ale mo�e kto� w obozie co� widzia�?");
	};
};

//***************************************************************

INSTANCE DIA_FISK_MartinRingOk (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 23;
	condition		= DIA_FISK_MartinRingOk_Condition;
	information		= DIA_FISK_MartinRingOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Martin wr�ci� do �ywych."; 
};

FUNC INT DIA_FISK_MartinRingOk_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Martin_Ring))
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_MartinRingOk_Info()
{
	AI_Output (other, self, "DIA_FISK_MartinRingOk_15_01"); //Martin wr�ci� do �ywych.
	AI_Output (self, other, "DIA_FISK_MartinRingOk_07_02"); //O to mi w�a�nie chodzi�o!
	AI_Output (self, other, "DIA_FISK_MartinRingOk_07_03"); //To twoja ruda, nale�y Ci si�.
	AI_Output (other, self, "DIA_FISK_MartinRingOk_15_04"); //Te� tak uwa�am. Bywaj.

	CreateInvItems (self,ItMiNugget, 100);
	B_GiveInvItems (self, other, ItMiNugget, 100);
	Log_SetTopicStatus	(CH2_RBL_Feelings, LOG_SUCCESS);
	B_LogEntry		(CH2_RBL_Feelings, "I po sprawie. Jestem bogatszy o pier�cie�, rud� i kilka �wie�ych blizn. Ach to �ycie...");
};

