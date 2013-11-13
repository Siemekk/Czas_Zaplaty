var int ore_check;
// **************************************************
// 						 EXIT 
// **************************************************

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Drax_Hello (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 1;
	condition		= DIA_Drax_Hello_Condition;
	information		= DIA_Drax_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 	
};

FUNC INT DIA_Drax_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Drax_Hello_Info()
{
	drax_warn = 0;
   
	AI_Output (other, self,  "DIA_Drax_Hello_15_01"); //Witaj.
	AI_Output (self, other, "DIA_Drax_Hello_11_02"); //Nowa twarz. Skoro dotar�e� a� tutaj w jednym kawa�ku, to mo�esz si� przyda�.
	AI_Output (self, other, "DIA_Drax_Hello_11_03"); //Widzisz tamto wzg�rze?
	AI_Output (other, self,  "DIA_Drax_Hello_15_04"); //Tych kilka wzniesie�?
	AI_Output (self, other, "DIA_Drax_Hello_11_05"); //Tak, tam gdzie pal� si� ogniska.
	AI_Output (self, other, "DIA_Drax_Hello_11_06"); //Problem tkwi w tym, �e jeszcze wczoraj by�o tam pu�ciutko. 
	AI_Output (self, other, "DIA_Drax_Hello_11_07"); //Kiedy wsta�em o �wicie i podla�em pie�, poczu�em sw�d palonych bierwion.
	AI_Output (self, other, "DIA_Drax_Hello_11_08"); //Nie wiem, kto tam koczuje, ale na pewno robi to za blisko naszego obozu.
	AI_Output (self, other, "DIA_Drax_Hello_11_09"); //Jak chcesz si� przys�u�y� rebeliantom, to zainteresuj si� tymi cwaniakami.
	AI_Output (other, self,  "DIA_Drax_Hello_15_10"); //W porz�dku, rozejrz� si�.
	AI_Output (self, other, "DIA_Drax_Hello_11_11"); //Tylko b�d� ostro�ny. Nie chcia�bym mie� Ci� na sumieniu.
	AI_Output (other, self,  "DIA_Drax_Hello_15_12"); //Bez obaw. Potrafi� o siebie zadba�.
	AI_Output (other, self,  "DIA_Drax_Hello_15_13"); //Wr�c� niebawem.
	Log_CreateTopic	(CH1_Rbl_Camp, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_Camp, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Camp, "Drax obawia si� o to, kto rozbi� obozowisko w pobli�u Obozu Rebeliant�w. Da� mi do zrozumienia, �e powinienem rozejrze� si� w sytuacji. Warto zdoby� sobie kolejnego sprzymierze�ca, wi�c chyba przyjrz� si� bli�ej temu obozowi.");
	Npc_ExchangeRoutine	(self,"start");
};

var int drax_quest;

INSTANCE DIA_Drax_Camp (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 2;
	condition		= DIA_Drax_Camp_Condition;
	information		= DIA_Drax_Camp_Info;
	permanent		= 1;
	important		= 0;
	description		= "By�em w tamtym obozie."; 	
};

FUNC INT DIA_Drax_Camp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))&&(Npc_KnowsInfo (hero, DIA_Drax_Hello))&& (drax_quest==false)
	{
		return 1;
	};
};

FUNC VOID DIA_Drax_Camp_Info()
{
	AI_Output (other, self,  "DIA_Drax_Camp_15_01"); //By�em w tamtym obozie.

	if (Npc_IsDead(camper_1))&&(Npc_IsDead(camper_2))&&(Npc_IsDead(camper_3))&&(Npc_IsDead(camper_4))
	{
		drax_trust = TRUE;
		drax_quest = TRUE;
		B_GiveXP(500);
		rebel_camp_trust = rebel_camp_trust + 1; 
      
		AI_Output (self, other, "DIA_Drax_Camp_11_02"); //Rzeczywi�cie nikt ju� si� tam nie kr�ci.
		AI_Output (self, other, "DIA_Drax_Camp_11_03"); //Dobra robota. Cavalorn us�yszy ode mnie, �e mo�esz by� cennym nabytkiem dla obozu.

		Log_SetTopicStatus	(CH1_Rbl_Camp, LOG_SUCCESS);
		B_LogEntry		(CH1_Rbl_Camp, "Zabi�em bandyt�w w obozie na wzg�rzu. Drax poprze mnie przed Cavalornem.");
		B_LogEntry		(CH1_Rbl_RebelCampTrust, "Po pozbyciu si� bandyt�w w obozie na wzg�rzu zdoby�em poparcie w osobie Draxa.");
	}
	else
	{
		if (drax_warn==0)
		{
			AI_Output (self, other, "DIA_Drax_Camp_11_04"); //Doprawdy?
			AI_Output (self, other, "DIA_Drax_Camp_11_05"); //Nie wydaje mi si�. Nadal widz� tam jaki� ludzi.
			AI_Output (self, other, "DIA_Drax_Camp_11_06"); //Nast�pnym razem powiedz prawd�, bo b�d� musia� Ci� obi�.
			
         B_LogEntry		(CH1_Rbl_Camp, "Powinienem zabi� bandyt�w w tamtym obozie.");
		};
      
		if (drax_warn == 1)
		{
			AI_Output (self, other, "DIA_Drax_Camp_11_07"); //Chyba nie wyrazi�em si� do�� jasno ostatnim razem.
			AI_Output (self, other, "DIA_Drax_Camp_11_08"); //Zabij tych skurwieli, albo nie pokazuj mi si� na oczy.
			AI_Output (self, other, "DIA_Drax_Camp_11_09"); //A teraz won!
			
         B_LogEntry		(CH1_Rbl_Camp, "Drax nie da� si� oszuka�. Albo zabij� bandyt�w z obozu, albo mog� sobie napyta� biedy.");
		};
      
		if (drax_warn == 2)
		{
			AI_Output (self, other, "DIA_Drax_Camp_11_10"); //Albo jeste� bezczelny, albo po prostu g�upi!
			AI_Output (self, other, "DIA_Drax_Camp_11_11"); //Pora na ma�� nauczk�!
			
         Log_SetTopicStatus	(CH1_Rbl_Camp, LOG_FAILED);
			B_LogEntry		(CH1_Rbl_Camp, "K�amstwo jednak nie pop�aca. Drax si� na mnie rzuci� i raczej w�tpi�, �e powie o mnie Cavalornowi co� dobrego.");
			B_LogEntry		(CH1_Rbl_RebelCampTrust, "Nie zdoby�em poparcia Draxa - czasami jednak nie warto k�ama�.");
			B_StopProcessInfos	(self); 
         B_StartAfterDialogFight(self,other,false);
		};
      
		drax_warn = drax_warn + 1;
		B_StopProcessInfos	(self); 
	};
};

INSTANCE DIA_Drax_Sweets (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 3;
	condition		= DIA_Drax_Sweets_Condition;
	information		= DIA_Drax_Sweets_Info;
	permanent		= 1;
	important		= 0;
	description		= "Przyszed�em po konfitury."; 	
};

FUNC INT DIA_Drax_Sweets_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Again))&&(ore_check == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Drax_Sweets_Info()
{
	drax_getlost = 0;
   
	AI_Output (other, self,  "DIA_Drax_Sweets_15_01"); //Przyszed�em po konfitury.
   
	if (NPC_HasItems(other,ItMiNugget)>=200)
	{
		ore_check = TRUE;
		
      AI_Output (self, other, "DIA_Drax_Sweets_11_02"); //Czy�by Fox zg�odnia�? Najpierw ruda, potem smako�yki.
		AI_Output (other, self,  "DIA_Drax_Sweets_15_03"); //Mam 200 bry�ek na 10 wek�w.
		AI_Output (self, other, "DIA_Drax_Sweets_11_04"); //To za ma�o. Za 200 dostaniesz najwy�ej 5.
		
      Info_ClearChoices (DIA_Drax_Sweets);
		Info_AddChoice (DIA_Drax_Sweets, "Niech b�dzie!", Drax_Sweets1);
		Info_AddChoice (DIA_Drax_Sweets, "�le kombinujesz!", Drax_Sweets2);
	}
	else
	{
		AI_Output (other, self,  "DIA_Drax_Sweets_15_05"); //Mam 200 bry�ek na 10 wek�w.
		AI_Output (self, other, "DIA_Drax_Sweets_11_06"); //Jeste� pewien, �e masz 200 bry�ek?
		AI_Output (self, other, "DIA_Drax_Sweets_11_07"); //Wr�� z rud�, wtedy pogadamy.
      
		B_StopProcessInfos	(self);
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ------------------------------------1--------------------------------
FUNC VOID Drax_Sweets1()
{	
	AI_Output (other, self,"Drax_Sweets1_15_01"); //Niech b�dzie. Oto ruda.
   
	B_GiveInvItems (other, self, ItMiNugget, 200);
   
	AI_Output (self, other,"Drax_Sweets1_11_02"); //Interesy z Tob� to czysta przyjemno��.
	
   CreateInvItems (self,konfitury,5);
	B_GiveInvItems (self, other, konfitury, 5);
	B_LogEntry		(CH1_Rbl_Food, "Drax sprzeda� mi 5 wek�w konfitur za 200 bry�ek rudy. Mam nadziej�, �e to wystarczy Foxowi.");
	B_StopProcessInfos	(self);
};

// ------------------------------------2--------------------------------
FUNC VOID Drax_Sweets2()
{	
	drax_getlost = 1;	
	
   AI_Output (other, self,"Drax_Sweets2_15_01"); //�le kombinujesz. Powiedzia�em 10 wek�w za 200 bry�ek!
	AI_Output (self, other,"Drax_Sweets2_11_02"); //Spokojnie, mo�e si� jako� dogadamy.
	B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE Info_Drax_Talk (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_Talk_Condition;
	information		= Info_Drax_Talk_Info;
	important		= 1;
	permanent		= 0;
};                       

FUNC INT Info_Drax_Talk_Condition()
{	
	if (drax_getlost == 1)&&(NPC_HasItems(other,ItMiNugget)>=200)
	{
		return 1;
	};
};

FUNC VOID Info_Drax_Talk_Info()
{	
	AI_Output (other, self,"Info_Drax_Talk_15_01"); //Co to za propozycja?
	AI_Output (self, other,"Info_Drax_Talk_11_02"); //Zap�acisz za 5 wek�w 150 bry�ek. Ty zarobisz 50 bry�ek, a ja dzisiaj zasn� z poczuciem dobrze spe�nionego obowi�zku.
	AI_Output (self, other,"Info_Drax_Talk_11_03"); //To jak b�dzie?
	
   Info_ClearChoices (Info_Drax_Talk);
	Info_AddChoice (Info_Drax_Talk, "Czemu nie.", Info_Drax_Talk1);
	Info_AddChoice (Info_Drax_Talk, "Nie ma mowy!", Info_Drax_Talk2);
};

// ------------------------------------1--------------------------------
FUNC VOID Info_Drax_Talk1()
{	
	AI_Output (other, self,"Info_Drax_Talk1_15_01"); //Czemu nie, brzmi rozs�dnie.
	
   B_GiveInvItems (other, self, ItMiNugget, 150);
	
   AI_Output (self, other,"Info_Drax_Talk1_02_02"); //I tak si� w�a�nie robi interesy.
	
   CreateInvItems (self,konfitury,5);
	B_GiveInvItems (self, other, konfitury, 5);
	B_LogEntry		(CH1_Rbl_Food, "Drax sprzeda� mi 5 wek�w konfitur za 150 bry�ek rudy. Zarobi�em na tym 50 bry�ek. Mam nadziej�, �e Fox b�dzie zadowolony.");
	B_StopProcessInfos	(self);
};

////////////////////////////////////Edit By Fenix////////////////////////////////////////////////////////////////////
// ------------------------------------2--------------------------------
FUNC VOID Info_Drax_Talk2()
{	
	AI_Output (other, self,"Info_Drax_Talk2_15_01"); //Nie ma mowy. Powiedzia�em 10 wek�w za 200 bry�ek.
	AI_Output (self, other,"Info_Drax_Talk2_11_02"); //A niech Ci� szlag trafi. Bierz te cholerne konfitury i daj mi spok�j!
	
   B_GiveInvItems (other, self, ItMiNugget, 200);
	CreateInvItems (self,konfitury,10);
	B_GiveInvItems (self, other, konfitury, 10);
   
	AI_Output (other, self,"Info_Drax_Talk2_15_03"); //Interesy z Tob� to prawdziwa przyjemno��.

	B_LogEntry		(CH1_Rbl_Food, "Nie da�em si� oszuka� Draxowi. Dosta�em 10 wek�w konfitur za 200 bry�ek, cho� nie by�o �atwo. Czas odda� przysmaki Foxowi.");
	drax_getlost = drax_getlost + 1;
	B_StopProcessInfos	(self);
};

INSTANCE Info_Drax_Trust (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_Trust_Condition;
	information		= Info_Drax_Trust_Info;
	important		= 1;
	permanent		= 0;
};                       

FUNC INT Info_Drax_Trust_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Fox_Final)) && (drax_getlost ==2)
	{
		return 1;
	};
};

FUNC VOID Info_Drax_Trust_Info()
{	
	AI_Output (self, other,"Info_Drax_Trust_11_01"); //Zaczekaj!
	AI_Output (self, other,"Info_Drax_Trust_11_02"); //Obrabowa�e� mnie ze wszystkich konfitur. A do tego m�j dostawca nie daje znak�w �ycia.
	AI_Output (self, other,"Info_Drax_Trust_11_03"); //Mam dla Ciebie propozycj�.
	AI_Output (other, self,"Info_Drax_Trust_15_04"); //S�ucham, tylko si� streszczaj.
	AI_Output (self, other,"Info_Drax_Trust_11_05"); //Konfitur dostarcza mi pewien typ, kt�ry ukrywa si� w pobli�u Starego Obozu.
	AI_Output (self, other,"Info_Drax_Trust_11_06"); //Nie mam poj�cia, gdzie dok�adnie mieszka. Jedyne co wiem to, �e ma na imi� Gilbert.
	AI_Output (self, other,"Info_Drax_Trust_11_07"); //Niestety od kilku dni nie pojawi� si�, a do tej pory zawsze na czas przynosi� mi konfitury.
	AI_Output (self, other,"Info_Drax_Trust_11_08"); //Poszukaj Gilberta i zdob�d� dla mnie co najmniej 20 wek�w z konfiturami.
	AI_Output (self, other,"Info_Drax_Trust_11_09"); //Dobrze zap�ac� za ka�dy s�oiczek.
	
   Info_ClearChoices (Info_Drax_Trust);
	Info_AddChoice (Info_Drax_Trust, "Mog� spr�bowa�.", Info_Drax_Trust1);
	Info_AddChoice (Info_Drax_Trust, "Nie mam czasu na pierdo�y.", Info_Drax_Trust2);
};

// ------------------------------------1--------------------------------
FUNC VOID Info_Drax_Trust1()
{	
	AI_Output (other, self,"Info_Drax_Trust1_15_01"); //Mog� spr�bowa�.
	AI_Output (self, other,"Info_Drax_Trust1_11_02"); //To �wietnie! Wr�� z konfiturami.
	
   drax_getlost = drax_getlost + 1;//3
	Log_CreateTopic	(CH1_Rbl_FindGilbert, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_FindGilbert, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_FindGilbert, "Drax poprosi� mnie o odnalezienie tajemniczego Gilberta - osoby, kt�ra dostarcza mu konfitury. Wiem tylko, �e Gilbert mieszka gdzie� w pobli�u Starego Obozu. Drax potrzebuje 20 s�oik�w konfitur.");
	B_StopProcessInfos	(self);
};
// ------------------------------------2--------------------------------
FUNC VOID Info_Drax_Trust2()
{	
	AI_Output (other, self,"Info_Drax_Trust2_15_01"); //Nie mam czasu na pierdo�y.
	AI_Output (self, other,"Info_Drax_Trust2_11_02"); //Cholera, przez Ciebie b�d� musia� sam w��czy� si� za Gilbertem.
	AI_Output (self, other,"Info_Drax_Trust2_11_03"); //Zejd� mi z oczu!
	
   B_StopProcessInfos	(self);
};

INSTANCE DIA_Drax_Konfitury (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 7;
	condition		= DIA_Drax_Konfitury_Condition;
	information		= DIA_Drax_Konfitury_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam konfitury od Gilberta."; 	
};

FUNC INT DIA_Drax_Konfitury_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gilbert_BerrysOk))&&(NPC_HasItems(other,konfitury)>=20)
	{
		return 1;
	};
};

FUNC VOID DIA_Drax_Konfitury_Info()
{
	B_GiveXP(250);
   
	AI_Output (other, self,  "DIA_Drax_Konfitury_15_01"); //Mam konfitury od Gilberta.
	AI_Output (self, other, "DIA_Drax_Konfitury_11_02"); //W ko�cu. Fox ju� mi �y� nie daje.
	AI_Output (self, other, "DIA_Drax_Konfitury_11_03"); //Oto twoja ruda, z r�ki do r�ki.
	
   CreateInvItems(self,ItMiNugget,100);
	B_GiveInvItems(self,other,ItMiNugget,100);
	B_GiveInvItems(other,self,konfitury,20);
	Npc_RemoveInvItems(self,konfitury,NPC_HasItems(self,konfitury));
	Log_SetTopicStatus	(CH1_Rbl_FindGilbert, LOG_SUCCESS);
	B_LogEntry		(CH1_Rbl_FindGilbert, "Dostarczy�em Draxowi 20 s�oik�w konfitur. Ca�kiem nie�le za nie zap�aci�. Teraz Fox b�dzie m�g� przez jaki� czas ob�era� si� swoim przysmakiem.");
};

INSTANCE DIA_Drax_Attack (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 11;
	condition		= DIA_Drax_Attack_Condition;
	information		= DIA_Drax_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Drax_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Drax_Attack_Info()
{
	AI_Output (self, other, "DIA_Drax_Attack_11_01"); //Ty pieprzony gnoju!
	AI_Output (self, other, "DIA_Drax_Attack_11_02"); //Spr�buj zadrze� ze mn�...
	
   B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Drax_Stew (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 12;
	condition		= DIA_Drax_Stew_Condition;
	information		= DIA_Drax_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Lubisz gulasz?"; 
};

FUNC INT DIA_Drax_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(hero, ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Drax_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_Drax_Stew_15_01"); //Lubisz gulasz?
	AI_Output (self, other, "DIA_Drax_Stew_11_02"); //Wol� kawior, ale dawaj, co tam masz.
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Drax powybrzydza�, ale spa�aszowa� ca�� misk�."); 
};

INSTANCE DIA_DRAX_Spy (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 13;
	condition		= DIA_DRAX_Spy_Condition;
	information		= DIA_DRAX_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zamy�li�e� si�..."; 
};

FUNC INT DIA_DRAX_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DRAX_Spy_Info()
{
	spy_count = spy_count + 1;
   
	AI_Output (other, self, "DIA_DRAX_Spy_15_01"); //Zamy�li�e� si�...
	AI_Output (self, other, "DIA_DRAX_Spy_07_02"); //Co? Co� m�wi�e�?
	AI_Output (other, self, "DIA_DRAX_Spy_15_03"); //By�e� jaki� nieobecny.
	AI_Output (self, other, "DIA_DRAX_Spy_07_04"); //Wydaje Ci si�. Zreszt� co Ci� to obchodzi. 
	AI_Output (other, self, "DIA_DRAX_Spy_15_05"); //Wszyscy nale�ymy do tego samego... stada. To naturalne, �e martwi� si� o tych, kt�rzy by� mo�e b�d� walczy� u mego boku.
	AI_Output (self, other, "DIA_DRAX_Spy_07_06"); //Walka... Tak, krew i ogie�. Nied�ugo czeka nas wszystkich pr�ba ognia...
	AI_Output (other, self, "DIA_DRAX_Spy_15_07"); //Co masz na my�li?
	AI_Output (self, other, "DIA_DRAX_Spy_07_08"); //Niewa�ne. Nied�ugo sam si� przekonasz. Bywaj.
	
   B_LogEntry		(CH2_Rbl_Spy, "Drax wydaje si� jaki� nieobecny. Przeb�kiwa� co� o walce. Chyba powinienem mie� go na oku.");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
      
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od Ciebie chcia�.
		
      B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_DRAX_Spy1 (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 14;
	condition		= DIA_DRAX_Spy1_Condition;
	information		= DIA_DRAX_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ciekawe co przyniesie nam nowy dzie�..."; 
};

FUNC INT DIA_DRAX_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_DRAX_Spy1_Info()
{
	tony_spy = tony_spy + 1;
	AI_Output (other, self, "DIA_DRAX_Spy1_15_01"); //Ciekawe co przyniesie nam nowy dzie�...
	AI_Output (self, other, "DIA_DRAX_Spy1_07_02"); //To co poprzedni, czyli nic dobrego.
	AI_Output (other, self, "DIA_DRAX_Spy1_15_03"); //Co masz na my�li?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_04"); //Nic, tak sobie tylko gadam.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_05"); //Zreszt� co mi tam.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_06"); //W tym obozie dzieje si� co� dziwnego. Ludzie przestaj� sobie ufa�.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_07"); //Pad� na nas blady cie� Gomeza i to chyba dos�ownie.
	AI_Output (other, self, "DIA_DRAX_Spy1_15_08"); //M�w ja�niej.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_09"); //Czy Ty mnie w og�le s�uchasz?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_10"); //Przecie� m�wi�, �e kto� tu w�szy!
	AI_Output (other, self, "DIA_DRAX_Spy1_15_11"); //Masz jakie� podejrzenia?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_12"); //Mo�e i mam, ale to moja sprawa.
	AI_Output (other, self, "DIA_DRAX_Spy1_15_13"); //Nie tylko twoja, wszyscy nale�ymy do tego obozu.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_14"); //Hmm... W sumie racja.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_15"); //Tylko zachowaj to dla siebie.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_16"); //Kilka dni temu widzia�em jak R�czka rozmawia z kim� w lesie!
	AI_Output (other, self, "DIA_DRAX_Spy1_15_17"); //I?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_18"); //Kiedy sobie poszed�, podkrad�em si� do tamtego miejsca, ale nie znalaz�em �adnych �lad�w.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_19"); //Za to sta� tam pie� z�amanego drzewa. Wydaje mi si�, �e R�czka gada� z cholern� ro�lin�!
	AI_Output (other, self, "DIA_DRAX_Spy1_15_20"); //A co w tym z�ego?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_21"); //Ano to, �e s�ysza�em, jak ten pie� mu odpowiada!
	AI_Output (other, self, "DIA_DRAX_Spy1_15_22"); //Oczywi�cie nic wcze�niej nie pi�e�...
	AI_Output (self, other, "DIA_DRAX_Spy1_07_23"); //By�em trze�wy, wiem, co s�ysza�em.
	AI_Output (other, self, "DIA_DRAX_Spy1_15_24"); //Mo�e by� tam kto� jeszcze?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_25"); //Nie wydaje mi si�. Akurat Tony wraca� z patrolu w lesie. Skin�� mi r�k� na chwil� przed tym, jak zauwa�y�em R�czk�.
	AI_Output (other, self, "DIA_DRAX_Spy1_15_26"); //Hmm, to mi ju� chyba wystarczy.
	B_LogEntry		(CH2_Rbl_Spy, "Bardziej zawi�ej historyjki ni� ta Draxa ju� dawno nie s�ysza�em. W ka�dym razie przewin�y si� przez ni� dwa imiona: R�czka i Tony.");
	
	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta�, nie daj mu czeka�.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};

	B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE Info_Drax_NewSword (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_NewSword_Condition;
	information		= Info_Drax_NewSword_Info;
	permanent		= 0;
	important		= 0;
	description		= "To Tw�j nowy przyjaciel."; 
};                       

FUNC INT Info_Drax_NewSword_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Fox_WeaponDev))&&(NPC_HasItems(hero,HUN_MW_03)>=1)
	{
		return 1;
	};
};
FUNC VOID Info_Drax_NewSword_Info()
{	
	B_GiveXP(100);
   
	AI_Output (other, self,"Info_Drax_NewSword15_01"); //To Tw�j nowy przyjaciel.
	AI_Output (self, other,"Info_Drax_NewSword_11_02"); //O czym Ty m�wisz?
	AI_Output (other, self,"Info_Drax_NewSword15_03"); //Mam dla Ciebie nowy miecz od Foxa.
	AI_Output (self, other,"Info_Drax_NewSword_11_04"); //Dobra, daj to �elastwo i podzi�kuj Foxowi.
	B_GiveInvItems (other, self, HUN_MW_03, 1);
	B_LogEntry		(CH3_RBL_DelivWeapon, "Drax te� dosta� nowego 'przyjaciela'.");
};

/*******************
Side quest

********************/

// ************************************************************

INSTANCE Info_Drax_Chest (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_Chest_Condition;
	information		= Info_Drax_Chest_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Drax_Chest_Condition()
{	
	/*******************
WP z chaty Draxa, ork wsad� mu do skrzyni 5x konfitury_chest 
******************/
	if (Npc_KnowsInfo(hero, DIA_Whistler_RevangeOk))&&(NPC_HasItems(hero, konfitury_chest)>=5)&&(Npc_GetDistToWP(hero, "DRAX_SHOP_PATCH")<=600)&&(Mob_HasItems ("OR_CHEST_DRAX", konfitury_fake)>=5)
	{
		return 1;
	};
};
FUNC VOID Info_Drax_Chest_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (other, self,"Info_Drax_Chest_15_01"); //O cholera, chyba kto� idzie...
	AI_GotoNpc(self, other);
	AI_Output (self, other,"Info_Drax_Chest_11_02"); //Co Ty tu robisz?!
	AI_Output (other, self,"Info_Drax_Chest_15_03"); //E nic, rozgl�da�em si� tylko...
	AI_Output (self, other,"Info_Drax_Chest_11_04"); //Mam nadziej�, �e nie dotyka�e� mojej skrzyni...
	B_StopProcessInfos	(self);

	/******************
Ork dor�b ten wp pod skrzyni�
******************/

	// 	AI_GotoWP 			(self,	"DRAX_CHEST");
	// 	AI_AlignToWP		(self);
	// 	AI_PlayAni			(self,	"T_PLUNDER");
};

// ************************************************************

INSTANCE Info_Drax_ChestCheck (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_ChestCheck_Condition;
	information		= Info_Drax_ChestCheck_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Drax_ChestCheck_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Drax_Chest))&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};
FUNC VOID Info_Drax_ChestCheck_Info()
{	
	/***********************
Teoretycznie powinno dzia�a�, ale gracz m�g� wyrzuci� konfitury i nie wsadzi� do skkrzyni. Je�eli da si� sprawdzi� zawarto�� okre�lonej skrzyni to dodaj to do warunku poprzedniego dialogu.
***********************/

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"Info_Drax_ChestCheck_11_01"); //Mniej wi�cej wszystko jest na miejscu. Ale co tu tak cuchnie?
	AI_Output (other, self,"Info_Drax_ChestCheck_15_02"); //To chyba ja...
	AI_Output (self, other,"Info_Drax_ChestCheck_11_03"); //Id� si� umyj cz�owieku i won z mojej chaty!
	
   B_LogEntry		(CH1_RBL_Revange, "Uda�o mi si� podmieni� konfitury. Czas wraca� do �wistaka.");

	/**************
Na drugi dzie� Drax zaczepi Dicka
***************/

	drax_sell = B_SetDayTolerance()+1;
};

// ************************************************************

INSTANCE Info_Drax_Revange (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_Revange_Condition;
	information		= Info_Drax_Revange_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Drax_Revange_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 600)
   && ((Npc_KnowsInfo(hero, Info_Drax_ChestCheck)&&(drax_sell <= Wld_GetDay())) 
   || Npc_KnowsInfo(hero, DIA_Whistler_RevangeDone))
	{
		return 1;
	};
};

FUNC VOID Info_Drax_Revange_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"Info_Drax_Revange_11_01"); //Ty �mierdz�cy z�odzieju!
	AI_Output (other, self,"Info_Drax_Revange_15_02"); //Nie wiem o czym m�wisz...
	AI_Output (self, other,"Info_Drax_Revange_11_03"); //To Ty grzeba�e� w mojej skrzyni z konfiturami! Podmieni�e� je na te cuchn�ce pomyje!
	AI_Output (self, other,"Info_Drax_Revange_11_04"); //Na szcz�cie sam otworzy�em jeden wek przed snem. Dobrze, �e to nie by� jeden z moich klient�w.
	AI_Output (self, other,"Info_Drax_Revange_11_05"); //Przez Ciebie zarzyga�em ca�� chat�!
	AI_Output (other, self,"Info_Drax_Revange_15_06"); //Spokojnie, mog� to wyt�umaczy�...
	AI_Output (self, other,"Info_Drax_Revange_11_07"); //A co tu jest do t�umaczenia. Jeste� z�odziejem, a dla takich jest tylko jedna kara!
	AI_Output (other, self,"Info_Drax_Revange_15_08"); //Zaczekaj! To �wistak mnie nam�wi�...
	AI_Output (self, other,"Info_Drax_Revange_11_09"); //A to pod�a menda! 
	AI_Output (self, other,"Info_Drax_Revange_11_10"); //Chce wojny? To b�dzie j� mia�!
	AI_Output (self, other,"Info_Drax_Revange_11_11"); //S�uchaj. Zapomn� o sprawie, pod jednym warunkiem.
	AI_Output (other, self,"Info_Drax_Revange_15_12"); //Tak?
	AI_Output (self, other,"Info_Drax_Revange_11_13"); //Ukradniesz z jego chaty perliste ber�o. To jedno z jego ulubionych �wiecide�ek.
	AI_Output (other, self,"Info_Drax_Revange_15_14"); //Chyba nie mam wyboru...
	AI_Output (self, other,"Info_Drax_Revange_11_15"); //Szybko si� uczysz. A teraz id� co� ukra��, w ko�cu w tym jeste� najlepszy.

	B_LogEntry(CH1_RBL_Revange, "To jeszcze nie koniec. Drax mnie zdemaskowa�. Musz� ukra�� dla niego perliste ber�o z chaty �wistaka...");
   
   Wld_insertItem(ItMw_Whistler_Toy, "HC_HUTIN_X");
};

// ************************************************************

INSTANCE Info_Drax_RevangeDone (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_RevangeDone_Condition;
	information		= Info_Drax_RevangeDone_Info;
	permanent		= 0;
	important		= 0;
	description		= "We� ber�o i zapomnijmy o sprawie."; 
};                       

FUNC INT Info_Drax_RevangeDone_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Drax_Revange))&&(NPC_HasItems(other,ItMw_Whistler_Toy)>=1)
	{
		return 1;
	};
};
FUNC VOID Info_Drax_RevangeDone_Info()
{	
	AI_Output (other, self,"Info_Drax_RevangeDone_15_01"); //We� ber�o i zapomnijmy o sprawie.
	AI_Output (self, other,"Info_Drax_RevangeDone_11_02"); //Niestrawno�� by�a tego warta!
   
	B_GiveInvItems (other, self, ItMw_Whistler_Toy, 1);
	Npc_RemoveInvItems(self,ItMw_Whistler_Toy,1);
   
	AI_Output (self, other,"Info_Drax_RevangeDone_11_03"); //Zrobi� sobie z tego pogrzebacz. Albo przepychacz w kloace... 
	AI_Output (self, other,"Info_Drax_RevangeDone_11_04"); //Hmm, musz� si� zastanowi�.
	AI_Output (other, self,"Info_Drax_RevangeDone_15_05"); //Czyli jeste�my kwita?
	AI_Output (self, other,"Info_Drax_RevangeDone_11_06"); //Tak, ju� o wszystkim zapomnia�em.
	B_LogEntry		(CH1_RBL_Revange, "Drax dosta� ber�o i zapomnia� o sprawie. Ma�o brakowa�o...");
};
