
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Ormus_EXIT(C_INFO)
{
	npc			= Grd_616_Gardist;
	nr			= 999;
	condition			= Info_Ormus_EXIT_Condition;
	information			= Info_Ormus_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Ormus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Ormus_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Ormus_Hello (C_INFO)
{
	npc		= Grd_616_Gardist;
	nr			= 1;
	condition		= Info_Ormus_Hello_Condition;
	information		= Info_Ormus_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Czym si� zajmujesz?";
};                       

FUNC INT Info_Ormus_Hello_Condition()
{	


	return 1;

};
FUNC VOID Info_Ormus_Hello_Info()
{	
	AI_Output (other, self,"Info_Ormus_Hello_15_00"); //Czym si� zajmujesz?
	AI_Output (self, other,"Info_Ormus_Hello_06_01"); //Pilnuj�, �eby te leniwe �achudry zrobi�y co do nich nale�y.
	AI_Output (other, self,"Info_Ormus_Hello_15_02"); //To pewnie si� nie nudzisz?
	AI_Output (self, other,"Info_Ormus_Hello_06_03"); //�eby� wiedzia�, pi� si� cz�owiekowi chce, a nijak zej�� z posterunku.
	AI_Output (self, other,"Info_Ormus_Hello_06_04"); //Ech, pieskie �ycie stra�nika.

};




// ************************************************************

INSTANCE Info_Ormus_Again (C_INFO)
{
	npc			= Grd_616_Gardist;
	nr			= 2;
	condition		= Info_Ormus_Again_Condition;
	information		= Info_Ormus_Again_Info;
	important		=0;
	permanent		= 0;
	description 	= "S�ysza�e� o �mierci niemowy?";
};                       

FUNC INT Info_Ormus_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Ormus_Hello ))&& (Npc_KnowsInfo (hero, Info_Nia_Def1))
	{
		return 1;
	};

};
FUNC VOID Info_Ormus_Again_Info()
{	
	AI_Output (other, self,"Info_Ormus_Again_15_01"); //S�ysza�e� o �mierci niemowy?
	AI_Output (self, other,"Info_Ormus_Again_06_02"); //A co mia�em nie s�ysze�? Na g�upot� nie ma lekarstwa.
	AI_Output (other, self,"Info_Ormus_Again_15_03"); //Ale dlaczego rzuci� si� na Ni�?
	AI_Output (self, other,"Info_Ormus_Again_06_04"); //Pewnie za d�ugo by� trze�wy. 
	AI_Output (self, other,"Info_Ormus_Again_06_05"); //Cholera napi�bym si� piwa...
};




// ************************************************************

INSTANCE Info_Ormus_Again1 (C_INFO)
{
	npc			= Grd_616_Gardist;
	nr			= 3;
	condition		= Info_Ormus_Again1_Condition;
	information		= Info_Ormus_Again1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mam co� mocniejszego...";
};                       

FUNC INT Info_Ormus_Again1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Ormus_Again))&& (Npc_HasItems (other,ItFobeer)>=1)
	{
		return 1;
	};

};
FUNC VOID Info_Ormus_Again1_Info()
{	

	investigation = investigation + 1;
	AI_Output (other, self,"Info_Ormus_Again1_15_01"); //Mam co� mocniejszego...
	AI_Output (self, other,"Info_Ormus_Again1_06_02"); //To� mi brat!
	AI_Output (other, self,"Info_Ormus_Again1_15_03"); //Nie tak szybko. Mam kilka pyta�.
	AI_Output (self, other,"Info_Ormus_Again1_06_04"); //No dobra. Tylko si� pospiesz bo zasch�o mi w gardle.
	AI_Output (other, self,"Info_Ormus_Again1_15_05"); //Co wiesz o �mierci niemowy?
	AI_Output (self, other,"Info_Ormus_Again1_06_06"); //Tyle co ka�dy. Georg zrobi� z nim porz�dek.
	AI_Output (other, self,"Info_Ormus_Again1_15_07"); //Ale dlaczego rzuci� si� na Ni�?
	AI_Output (self, other,"Info_Ormus_Again1_06_08"); //A sk�d mam wiedzie�? Nie jestem cholern� wr�k�!
	AI_Output (other, self,"Info_Ormus_Again1_15_09"); //Nie ma to jak ch�odne piwko...
	AI_UseItem (other,ItFobeer);
	CreateInvItems (other, ItFobeer,1);
	AI_Output (self, other,"Info_Ormus_Again1_06_10"); //Niech Ci� szlag! Dobra, co� widzia�em.
	AI_Output (self, other,"Info_Ormus_Again1_06_11"); //Nia to cholerna, niewy�yta suka. 
	AI_Output (self, other,"Info_Ormus_Again1_06_12"); //Kilka dni temu poszed�em w nocy si� odla�.
	AI_Output (self, other,"Info_Ormus_Again1_06_13"); //Sta�em w mroku, nikt mnie nie widzia�.
	AI_Output (self, other,"Info_Ormus_Again1_06_14"); //Nia zbli�y�a si� do stra�nika, kt�ry akurat mia� wart� na murze.
	AI_Output (self, other,"Info_Ormus_Again1_06_15"); //My�la�em, �e mu odgryzie wacka. Znikn�li za stert� drewna, a ja nie mia�em ochoty sprawdza� co robi�.
	AI_Output (other, self,"Info_Ormus_Again1_15_16"); //To jeszcze o niczym nie �wiadczy.
	AI_Output (self, other,"Info_Ormus_Again1_06_17"); //Gdyby nie fakt, �e stra�nika znale�li na drugi dzie� uduszonego w�asnymi genitaliami.
	AI_Output (self, other,"Info_Ormus_Again1_06_18"); //Kto� mu obci�� kutasa i wsadzi� w gard�o. To jest chore... Trudno mi znale�� w�a�ciwe s�owo.
	AI_Output (other, self,"Info_Ormus_Again1_15_19"); //Skoro to widzia�e� to dlaczego nie powiedzia�e� nic Krisowi?
	AI_Output (self, other,"Info_Ormus_Again1_06_20"); //A my�lisz, �e by mi uwierzy�? 
	AI_Output (self, other,"Info_Ormus_Again1_06_21"); //Wszyscy wiedz�, �e chlej� ile tylko si� da. Kiedy� pr�bowa�em co� napomkn��.
	AI_Output (self, other,"Info_Ormus_Again1_06_22"); //Kris da� mi kopa i powiedzia�, �e mia�em zwidy.
	AI_Output (other, self,"Info_Ormus_Again1_15_23"); //Hmm, mo�e mia� racj�?
	AI_Output (self, other,"Info_Ormus_Again1_06_24"); //Powiedzia�em co chcia�e�, dawaj piwo!
	B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_UseItem (self,ItFobeer);
	AI_Output (self, other,"Info_Ormus_Again1_06_25"); //Od razu lepiej. Tylko nie gadaj o tym co Ci powiedzia�em.
	AI_Output (other, self,"Info_Ormus_Again1_15_26"); //Pewnie, w ko�cu kto by uwierzy� moczymordzie.
	AI_Output (self, other,"Info_Ormus_Again1_06_27"); //Dok�adnie, bywaj.

	B_LogEntry		(CH4_Non_Eagle, "Ile mo�na dosta� w zamian za butelk� piwa. Ormus twierdzi, �e widzia� jak Nia sp�kowa�a ze stra�nikiem, kt�rego znaleziono martwego na drugi dzie�. Ta historia zaczyna coraz bardziej �mierdzie�.");
};




// ************************************************************

INSTANCE Info_Ormus_Meet (C_INFO)
{
	npc			= Grd_616_Gardist;
	nr			= 3;
	condition		= Info_Ormus_Meet_Condition;
	information		= Info_Ormus_Meet_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Znowu Ci� suszy?";
};                       

FUNC INT Info_Ormus_Meet_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_Ormus_Meet_Info()
{	
	AI_Output (other, self,"Info_Ormus_Meet_15_01"); //Znowu Ci� suszy?
	AI_Output (self, other,"Info_Ormus_Meet_06_02"); //Jak zawsze. Zaczyna kiedy otwieram oczy. A co masz jak�� niepotrzebn� butelczyn�?
	AI_Output (other, self,"Info_Ormus_Meet_15_03"); //Mo�e i mam, ale nic za darmo.
	AI_Output (self, other,"Info_Ormus_Meet_06_04"); //Kogo mam zabi�?
	AI_Output (other, self,"Info_Ormus_Meet_15_05"); //To Nia morduje. Chc� udowodni� Krisowi, �e trzeba z tym sko�czy� raz na zawsze.
	AI_Output (other, self,"Info_Ormus_Meet_15_06"); //Um�wi�em si� z ni�, Pinto b�dzie �wiadkiem. Ale potrzebuj� te� innych, kt�rzy potwierdz� win� dziwki.
	AI_Output (other, self,"Info_Ormus_Meet_15_07"); //Pomo�esz?
	AI_Output (self, other,"Info_Ormus_Meet_06_08"); //Daj mi chwil� na zastanowienie, ale lepiej �eby� mia� t� flaszk� piwa.
};



// ************************************************************

INSTANCE Info_Ormus_MeetAgain (C_INFO)
{
	npc			= Grd_616_Gardist;
	nr			= 3;
	condition		= Info_Ormus_MeetAgain_Condition;
	information		= Info_Ormus_MeetAgain_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Namy�li�e� si�?";
};                       

FUNC INT Info_Ormus_MeetAgain_Condition()
{	

	if (Npc_KnowsInfo (hero,  Info_Ormus_Meet))&& (Npc_HasItems (other,ItFobeer)>=1)
	{
		return 1;
	};

};
FUNC VOID Info_Ormus_MeetAgain_Info()
{	
	AI_Output (other, self,"Info_Ormus_MeetAgain_15_01"); //Namy�li�e� si�?
	AI_Output (self, other,"Info_Ormus_MeetAgain_06_02"); //Dla piwa zrobi� wszystko. Daj flaszk�!
	B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_UseItem (self,ItFobeer);
	AI_Output (self, other,"Info_Ormus_MeetAgain_06_03"); //Tego mi brakowa�o.
	AI_Output (self, other,"Info_Ormus_MeetAgain_06_04"); //W porz�dku, pobawi� si� w podgl�dacza.
	AI_Output (other, self,"Info_Ormus_MeetAgain_15_05"); //Dzi�ki. Pami�taj, po zmroku i nie wychylaj si� z cienia.
	B_LogEntry		(CH4_Non_Eagle, "Ormus pobawi si� w podgl�dacza.");
}; 
