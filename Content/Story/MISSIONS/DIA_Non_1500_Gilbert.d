// ********************************
// 				EXIT
// ********************************

instance DIA_Gilbert_EXIT (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 999;
	condition	= DIA_Gilbert_EXIT_Condition;
	information	= DIA_Gilbert_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_EXIT_Info()
{
	B_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Gilbert_First (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_First_Condition;
	information	= DIA_Gilbert_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Gilbert_First_Condition()
{
	if (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_First_Info()
{
	AI_Output (self, other,"DIA_Gilbert_First_04_00"); //Co tu robisz? Nie miewam zbyt cz�sto go�ci!
	AI_Output (self, other,"DIA_Gilbert_First_04_01"); //Widz�, �e niez�y cwaniak z Ciebie. Tak znale�� moj� kryj�wk�, no no!
	
	B_GiveXP(XP_GilbertFound);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Gilbert_Hallo (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_Hallo_Condition;
	information	= DIA_Gilbert_Hallo_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Hallo_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_01"); //Mia�em ju� do�� Starego Obozu. Podpad�em paru ludziom Gomeza. To by�o dawno temu.
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_02"); //Teraz pewnie nikt ju� o mnie nie pami�ta, ale ja si� st�d nie ruszam. Jak na m�j gust - w Starym Obozie wci�� jest za du�o t�pych osi�k�w.


};


instance DIA_Gilbert_Ask (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 2;
	condition	= DIA_Gilbert_Ask_Condition;
	information	= DIA_Gilbert_Ask_Info;
	permanent	= 0;
	description = "Przysy�a mnie Drax.";
};                       

FUNC int DIA_Gilbert_Ask_Condition()
{
	if (Npc_KnowsInfo(other,  Info_Drax_Trust)) && (Npc_KnowsInfo(other,  DIA_Gilbert_Hallo)) &&  (drax_getlost == 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_Ask_Info()
{
	drax_getlost = drax_getlost + 1;//4
	AI_Output (other, self,"DIA_Gilbert_Ask_15_00"); //Przysy�a mnie Drax.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_01"); //Pewnie po konfitury.
	AI_Output (other, self,"DIA_Gilbert_Ask_15_02"); //W rzeczy samej. Drax straci� ca�y zapas konfitur, a popyt nadal ro�nie.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_03"); //Mia�em dostarczy� kolejn� parti� kilka dni temu, ale chyba zwichn��em nog� schodz�c z grani.
	AI_Output (other, self,"DIA_Gilbert_Ask_15_04"); //To niedobrze.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_05"); //Mi to m�wisz? Ledwo dowlok�em si� z powrotem do kryj�wki. Wol� nie my�le� co w�ciek�e psy Gomeza by ze mn� zrobi�y gdyby mnie dorwali.
	AI_Output (other, self,"DIA_Gilbert_Ask_15_06"); //A� tak zalaz�e� im za sk�r�?
	AI_Output (self, other,"DIA_Gilbert_Ask_04_07"); //Od jakiego� czasu pomagam rebeliantom. Raz podczas wymiany z Draxem zaskoczy�o nas kilku stra�nik�w.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_08"); //Dw�ch za�atwili�my, ale jeden da� nog�. Do tego ten gnojek zna� mnie ju� wcze�niej. W Starym Obozie jestem spalony.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_09"); //Sam si� sobie dziwi�, ale robienie konfitur sprawia mi prawdziw� rado��.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_10"); //Uspokajam si� przy tym no i mam zaj�cie.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_11"); //Tylko, �e teraz przez spuchni�t� kostk� nie dam rady nazbiera� jag�d.
	AI_Output (other, self,"DIA_Gilbert_Ask_15_12"); //Chyba m�g�bym Ci pom�c. 
	AI_Output (self, other,"DIA_Gilbert_Ask_04_13"); //To �wietnie. Przynie� mi jag�d zerwanych z co najmniej 10 krzaczk�w.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_14"); //Powinno tego wystarczy� na jakie� 20 wek�w konfitur.
	AI_Output (other, self,"DIA_Gilbert_Ask_15_15"); //W porz�dku, rozejrz� si� za jagodami. 
	AI_Output (self, other,"DIA_Gilbert_Ask_04_16"); //Aha i jeszcze jedno. Je�eli znajdziesz wi�cej jag�d to wezm� ka�d� ilo��. Bez obaw, zap�ac� rud�.
	B_LogEntry		(CH1_Rbl_FindGilbert, "Gilbert zrobi konfitury dla Draxa, ale musz� przynie�� mu jag�d. Wystarczy owoc�w z 10 krzak�w. Za jagody Gilbert zap�aci rud�.");
};

var int gilbert_trade;
var int gilbert_berrys;


instance DIA_Gilbert_Berrys (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 3;
	condition	= DIA_Gilbert_Berrys_Condition;
	information	= DIA_Gilbert_Berrys_Info;
	permanent	= 1;
	description = "Mam jagody.";
};                       

FUNC int DIA_Gilbert_Berrys_Condition()
{
	if (Npc_KnowsInfo(other,  DIA_Gilbert_Ask)) &&  (drax_getlost == 4) && (gilbert_trade == FALSE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_Berrys_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Berrys_15_00"); //Mam jagody.
	if (NPC_HasItems(other,ItFo_Plants_Berrys_01)>=10)
	{
		gilbert_trade = TRUE;
		B_GiveXP(100);
		drax_getlost = drax_getlost + 1;//5
		AI_Output (self, other,"DIA_Gilbert_Berrys_04_01"); //To �wietnie. Daj mi je.
		B_GiveInvItems (other, self, ItFo_Plants_Berrys_01, 10);
		Npc_RemoveInvItems(self,ItFo_Plants_Berrys_01,10);
		AI_Output (self, other,"DIA_Gilbert_Berrys_04_02"); //Przyjd� jutro, konfitury b�d� wtedy gotowe.
		AI_Output (other, self,"DIA_Gilbert_Berrys_15_03"); //20 wek�w?
		AI_Output (self, other,"DIA_Gilbert_Berrys_04_04"); //Co najmniej 20.
		gilbert_berrys = B_SetDayTolerance()+1;
		B_LogEntry		(CH1_Rbl_FindGilbert, "Przynios�em Gilbertowi jagody. Mam wr�ci� jutro po 20 wek�w konfitur.");
	}
	else
	{
		AI_Output (self, other,"DIA_Gilbert_Berrys_04_05"); //Mo�e i masz, ale za ma�o. Wr�� z wi�ksz� ilo�ci�.
		AI_Output (self, other,"DIA_Gilbert_Berrys_04_06"); //Pami�taj, �e potrzebuj� owoc�w z co najmniej 10 krzaczk�w.
	};
};

instance DIA_Gilbert_BerrysOk (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 4;
	condition	= DIA_Gilbert_BerrysOk_Condition;
	information	= DIA_Gilbert_BerrysOk_Info;
	permanent	= 0;
	important	= 1;
	description = "";
};                       

FUNC int DIA_Gilbert_BerrysOk_Condition()
{
	if (gilbert_berrys <= (Wld_GetDay())) &&  (drax_getlost == 5)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_BerrysOk_Info()
{
	B_GiveXP(150);
	drax_getlost = drax_getlost + 1;//6
	AI_Output (self, other,"DIA_Gilbert_BerrysOk_04_01"); //Konfitury ju� gotowe. Tak jak si� umawiali�my, 20 s�oik�w.
	CreateInvItems (self, konfitury,20); 
	B_GiveInvItems (self, other, konfitury, 20);
	AI_Output (self, other,"DIA_Gilbert_BerrysOk_04_02"); //Zanie� je Draxowi
	AI_Output (other, self,"DIA_Gilbert_BerrysOk_15_03"); //Dzi�ki. Postaram si� ich nie zje�� po drodze.
	AI_Output (self, other,"DIA_Gilbert_BerrysOk_04_04"); //I pami�taj, �e zawsze mo�esz mi sprzeda� jagody.
	B_LogEntry		(CH1_Rbl_FindGilbert, "W ko�cu mam konfitury dla Draxa - wszystkie 20 wek�w.");
	Log_CreateTopic   	(CH1_Rbl_Gilbert,LOG_NOTE);
	B_LogEntry(CH1_Rbl_Gilbert, "Gilbert kupi ode mnie ka�d� ilo�� jag�d.");


};

INSTANCE DIA_Gilbert_Buy (C_INFO)
{
	npc		= Non_1500_Gilbert;
	nr			= 15;
	condition		= DIA_Gilbert_Buy_Condition;
	information		= DIA_Gilbert_Buy_Info;
	important		= 0;
	permanent		= 1;
	description 	= "Mam jagody na sprzeda�.";
};                       

FUNC INT DIA_Gilbert_Buy_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Gilbert_BerrysOk))
	{
		return 1;  
	};
};

FUNC VOID DIA_Gilbert_Buy_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Buy_15_00"); //Mam jagody na sprzeda�.
	if (NPC_HasItems(other,ItFo_Plants_Berrys_01)>0)
	{
		AI_Output (self, other,"DIA_Gilbert_Buy_07_01"); //To �wietnie. A to Twoja ruda.
		CreateInvItems(self,ItMiNugget,15*NPC_HasItems(other,ItFo_Plants_Berrys_01));
		B_GiveInvItems(self,other,ItMiNugget,15*NPC_HasItems(other,ItFo_Plants_Berrys_01));
		B_GiveXP(5*NPC_HasItems(other,ItFo_Plants_Berrys_01));
		B_GiveInvItems (other,self,ItFo_Plants_Berrys_01,NPC_HasItems(other,ItFo_Plants_Berrys_01));
		Npc_RemoveInvItems(self,ItFo_Plants_Berrys_01,NPC_HasItems(self,ItFo_Plants_Berrys_01));
		AI_Output (self, other,"DIA_Gilbert_Buy_07_02"); //Przynie� ich wi�cej.
	}
	else
	{
		AI_Output (self, other,"DIA_Gilbert_Buy_07_03"); //Nie masz jag�d. Wr�� jak jakie� nazbierasz.
	};
};

/*************************
Side quests
**************************/


INSTANCE DIA_Gilbert_Stuff (C_INFO)
{
	npc		= Non_1500_Gilbert;
	nr			= 25;
	condition		= DIA_Gilbert_Stuff_Condition;
	information		= DIA_Gilbert_Stuff_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Przyszed�em po paczk� dla Baal Tarana.";
};                       

FUNC INT DIA_Gilbert_Stuff_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_BaalKagan_OrderHelp))&&(Npc_KnowsInfo (hero, DIA_Gilbert_First))
	{
		return 1;  
	};
};

FUNC VOID DIA_Gilbert_Stuff_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Stuff_15_00"); //Przyszed�em po paczk� dla Baal Tarana.
	AI_Output (self, other,"DIA_Gilbert_Stuff_07_01"); //Troch� za wcze�nie, nie uzbiera�em jeszcze wszystkich zi�.
	AI_Output (other, self,"DIA_Gilbert_Stuff_15_02"); //Nie szkodzi. Taranowi bardzo zale�y na towarze bo ostatnio przyby�o mu klient�w.
	AI_Output (self, other,"DIA_Gilbert_Stuff_07_03"); //W porz�dku. W takim razie policz� mu troch� mniej. Wystarczy 200 bry�ek.
	B_LogEntry		(CH2_RBL_Stuff,	"Cholera o tym nie pomy�la�em. Gilbert chce za paczk� 200 bry�ek.");
};



INSTANCE DIA_Gilbert_Stuff1 (C_INFO)
{
	npc		= Non_1500_Gilbert;
	nr			= 26;
	condition		= DIA_Gilbert_Stuff1_Condition;
	information		= DIA_Gilbert_Stuff1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "W porz�dku, zap�ac� za t� paczk�.";
};                       

FUNC INT DIA_Gilbert_Stuff1_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Gilbert_Stuff))&&(NPC_HasItems(other,ItMiNugget)>=200)
	{
		return 1;  
	};
};

FUNC VOID DIA_Gilbert_Stuff1_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Stuff1_15_00"); //W porz�dku, zap�ac� za t� paczk�.
	B_GiveInvItems (other, self, ItMiNugget, 200);
	AI_Output (self, other,"DIA_Gilbert_Stuff1_07_01"); //Mi�o mi to s�ysze�. A to Twoje ziele.
	CreateInvItems (self,package_stuff,1);
	B_GiveInvItems (self, other, package_stuff, 1);
	AI_Output (self, other,"DIA_Gilbert_Stuff1_07_02"); //Tylko powiedz Taranowi, �e na nast�pn� dostaw� b�dzie musia� poczeka� troch� d�u�ej.
	AI_Output (other, self,"DIA_Gilbert_Stuff1_15_03"); //W porz�dku. Bywaj.
	B_LogEntry		(CH2_RBL_Stuff,	"Mam paczk� ziela dla Tarana. Musz� je najpierw zanie�� Kaganowi.");
};


