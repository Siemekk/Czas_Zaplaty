/*
// ************************ EXIT **************************

instance  Info_StrangeDemon_EXIT (C_INFO)
{
	npc			=	StrangeDemon;
	nr			=	999;
	condition	=	Info_StrangeDemon_EXIT_Condition;
	information	=	Info_StrangeDemon_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_StrangeDemon_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_StrangeDemon_EXIT_Info()
{
	//AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //...
	//AI_Output (hero, self,"Info_Saturas_EXIT_15_01"); //�miertelny?... Kto, ja?... Dobrze, ju� id�!

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Deep Demon
//***************************************************************************
instance Info_StrangeDemon_INTRO (C_INFO)
{
	npc			= StrangeDemon;
	condition	= Info_StrangeDemon_INTRO_Condition;
	information	= Info_StrangeDemon_INTRO_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_StrangeDemon_INTRO_Condition()
{	
	return 1;
};

FUNC VOID Info_StrangeDemon_INTRO_Info()
{
	AI_TurnAway		(hero, self);
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_01"); //Zaraz... Kto... Kto to powiedzia�?
	AI_WhirlAround	(hero, self);	//KEIN B_Whirlaround()!!!
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_02"); //To TY?! Jak... Jak si� dosta�e� do mojej g�owy?
	AI_Output 		(self, other,"DIA_BaalCadar_NoTalk_Hi_02_03"); //
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_04"); //TYLE LAT W BUTELCE I TRAFI� MI SI� IDIOTA.
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_05"); //Ty m�wisz?!
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_06"); //M�wi�, ta�cz�, jem i wydalam jak ka�da �ywa istota.
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_07"); //Demony to pomiot Beliara!
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_08"); //Pomiot co to pali wioski, porywa dziewice i zsy�a zaraz� na pola... 
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_09"); //Powiedzmy, �e to zabobony. Nie ka�dy demon s�u�y Beliarowi.
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_10"); //Tylko te kt�re dadz� si� zwi�za� S�OWEM MOCY.
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_11"); //Jakim s�owem?
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_12"); //Musisz pozna� imi� demona i wypowiedzie� je w jego mowie. Ot i ca�y sekret.
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_13"); //A jakie jest twoje imi�?
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_14"); //Hmm, z nas dwojga to ty robisz za idiot� wi�c nie spodziewaj si� prawdziwej odpowiedzi.
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_15"); //Mo�esz nazywa� mnie... Wielkim i Wspania�ym W�adc� Demonicznych Hord, Ksi�ciem Ciemno�ci, Jego Mroczno�ci�...
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_16"); //Nie do��, �e wygadany to jeszcze skromny...
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_17"); //No prosz�, trafi� mi si� �miertelnik z poczuciem humoru. Jednak nie jest tak �le.
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_18"); //To od czego zaczniemy?
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_19"); //Od niczego, nie b�d� traci� czasu na demoniczne �cierwo.
	AI_StopProcessInfos	(self);
};

//***************************************************************************
instance Info_StrangeDemon_Halo (C_INFO)
{
	npc			= StrangeDemon;
	condition	= Info_StrangeDemon_Halo_Condition;
	information	= Info_StrangeDemon_Halo_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_StrangeDemon_Halo_Condition()
{	
	if (Npc_KnowsInfo (hero,  Info_StrangeDemon_INTRO))
	{
		return 1;
	};
};

FUNC VOID Info_StrangeDemon_Halo_Info()
{
	AI_TurnAway		(hero, self);
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_01"); //Wybacz, mo�e jednak �le zacz�li�my. Mam dla ciebie propozycj�.
	AI_Output		(hero, self,"Info_StrangeDemon_Halo_15_02"); //Nie b�d� paktowa� z demonem.
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_03"); //A ty w k�ko to samo.
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_04"); //Nie jestem zwyczajnym demonem. Narodzi�em si� w czasach kiedy nie by�o jeszcze Beliara i jego braci.
	AI_Output		(hero, self,"Info_StrangeDemon_Halo_15_05"); //Co mnie to obchodzi?	
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_06"); //Ale� ty uparty!
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_07"); //Ujm� to tak. Znam sekrety, kt�re uczyni� z ciebie obrzydliwie bogatego cz�owieka.
	AI_Output		(hero, self,"Info_StrangeDemon_Halo_15_08"); //A ja w zamian mam ci odda� dusz� czy nadstawi� ty�ka?
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_09"); //Wystarczy, �e mnie wys�uchasz. P�niej sam zdecydujesz co zrobisz.	
	AI_Output		(hero, self,"Info_StrangeDemon_Halo_15_10"); //Niech b�dzie, m�w.
	
	B_LogEntry		(Strange_DemonStory, "");	
};
//***************************************************************************
instance Info_StrangeDemon_Halo1 (C_INFO)
{
	npc			= StrangeDemon;
	nr			=	2;
	condition	= Info_StrangeDemon_Halo1_Condition;
	information	= Info_StrangeDemon_Halo1_Info;
	permanent	= 0;
	important 	= 0;
	description =	"Zamieniam si� w s�uch.";
};

FUNC INT Info_StrangeDemon_Halo1_Condition()
{	
	if (Npc_KnowsInfo (hero,  Info_StrangeDemon_Halo))
	{
		return 1;
	};
};

FUNC VOID Info_StrangeDemon_Halo1_Info()
{
	AI_Output		(hero, self,"Info_StrangeDemon_Halo1_15_02"); //Zamieniam si� w s�uch.
	AI_Output		(self, hero,"Info_StrangeDemon_Halo1_17_01"); //Wszystko zacz�o si� w czasach...
	AI_Output		(hero, self,"Info_StrangeDemon_Halo1_15_02"); //Nie jestem archeologiem, przejd� od razu do tej cz�ci z obrzydliwym bogactwem.

	B_LogEntry		(Strange_DemonStory, "");	
};
*/