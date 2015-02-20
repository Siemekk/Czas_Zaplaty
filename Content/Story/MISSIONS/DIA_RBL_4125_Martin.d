// **************************** 
//				EXIT 
// ****************************

instance  Info_Martin_EXIT (C_INFO)
{
	npc			=	RBL_4125_Martin;
	nr			=	999;
	condition	=	Info_Martin_EXIT_Condition;
	information	=	Info_Martin_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Martin_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Martin_EXIT_Info()
{
	B_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Martin_Hallo (C_INFO)
{
	npc			=	RBL_4125_Martin;
	nr			=	1;
	condition	=	Info_Martin_Hallo_Condition;
	information	=	Info_Martin_Hallo_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co Ty tu robisz?"; 
};                       

FUNC int  Info_Martin_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Martin_Hallo_Info()
{
	AI_Output (other, self,"Info_Martin_Hallo_15_00"); //Co Ty tu robisz?
	AI_Output (self, other,"Info_Martin_Hallo_04_01"); //Daj mi spok�j...
	B_StopProcessInfos	(self);
};

// ****************************

instance  Info_Martin_What (C_INFO)
{
	npc			=	RBL_4125_Martin;
	nr			=	2;
	condition	=	Info_Martin_What_Condition;
	information	=	Info_Martin_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl�dasz jakby prze�u� Ci� troll i wysra�."; 
};                       

FUNC int  Info_Martin_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_FISK_MartinOk))
	{
		return 1;
	};
};

FUNC VOID  Info_Martin_What_Info()
{
	AI_Output (other, self,"Info_Martin_What_15_00"); //Wygl�dasz jakby prze�u� Ci� troll i wysra�.
	AI_Output (self, other,"Info_Martin_What_04_01"); //I tak si� czuj�. Daj mi spok�j.
	AI_Output (other, self,"Info_Martin_What_15_02"); //Czasami lepiej jest si� wykrzycze�, ni� t�amsi� w sobie b�l.
	AI_Output (self, other,"Info_Martin_What_04_03"); //Cholera, kaznodzieja mi si� trafi�. A co Ci� to w og�le obchodzi?

	Info_ClearChoices (Info_Martin_What);
	Info_AddChoice (Info_Martin_What, "Czasami warto si� pochyli� nad drugim cz�owiekiem.", Info_Martin_What_Good);
	Info_AddChoice (Info_Martin_What, "Masz racj�, to nie moja sprawa.", Info_Martin_What_Bed);
};

// ------------------------------------------------------------------

FUNC VOID Info_Martin_What_Bed()
{
	AI_Output (other, self,"Info_Martin_What_Bed_15_00"); //Masz racj�, to nie moja sprawa.
	AI_Output (self, other,"Info_Martin_What_Bed_04_01"); //Daj mi wi�c spok�j.
	
   B_LogEntry		(CH2_RBL_Feelings, "Nie b�d� bawi� si� w kaznodziej�. Niech Fisk sam si� dowie co si� dzieje z Martinem.");
	B_StopProcessInfos	(self);
	Help_Martin = 0;
};

// ------------------------------------------------------------------

FUNC VOID Info_Martin_What_Good()
{
	AI_Output (other, self,"Info_Martin_What_Good_15_00"); //Czasami warto si� pochyli� nad drugim cz�owiekiem.
	AI_Output (self, other,"Info_Martin_What_Good_04_01"); //Hmm. Mo�e masz i racj�...
	AI_Output (self, other,"Info_Martin_What_Good_04_02"); //Zanim trafi�em do Kolonii by�em czeladnikiem u z�otnika.
	AI_Output (self, other,"Info_Martin_What_Good_04_03"); //Sz�o mi ca�kiem nie�le. Niestety m�j mistrz by� strasznym sk�pirad�em.
	AI_Output (self, other,"Info_Martin_What_Good_04_04"); //Pokocha�em pewn� dziewczyn�, nie sta� mnie jednak by�o na pier�cionek zar�czynowy.
	AI_Output (self, other,"Info_Martin_What_Good_04_05"); //Podebra�em kilka uncji z zapas�w mistrza i wieczorem wykona�em pi�kny pier�cie�.
	AI_Output (self, other,"Info_Martin_What_Good_04_06"); //Da�em go mej lubej.
	AI_Output (other, self,"Info_Martin_What_Good_15_07"); //Musia�a by� zachwycona.
	AI_Output (self, other,"Info_Martin_What_Good_04_08"); //By�a. Ca�e dwa dni, dop�ki go nie sprzeda�a. Cholerna zdzira!
	AI_Output (self, other,"Info_Martin_What_Good_04_09"); //Mistrz zorientowa� si�, �e brakuje z�ota. Oczywi�cie oskar�y� mnie.
	AI_Output (self, other,"Info_Martin_What_Good_04_10"); //S�dzia w Khorinis nie potrzebowa� dowod�w, bo razem z moim mistrzem grywa� co wiecz�r w oczko.
	AI_Output (self, other,"Info_Martin_What_Good_04_11"); //Tak w�a�nie trafi�em do Kolonii, przez g�upi� mi�o�� i pier�cie�.
	AI_Output (self, other,"Info_Martin_What_Good_04_12"); //Jednak zanim mnie oskar�ono odzyska�em sygnet. Zdo�a�em go przemyci� do Kolonii.
	AI_Output (other, self,"Info_Martin_What_Good_15_13"); //Nie chc� wiedzie� gdzie go ukry�e�.
	AI_Output (self, other,"Info_Martin_What_Good_04_14"); //Po�kn��em go. Na drugi dzie� zrobi�em niezwykle cenn� kup�.
	AI_Output (self, other,"Info_Martin_What_Good_04_15"); //Ten pier�cie� ma dla mnie ogromne znaczenie...
	AI_Output (self, other,"Info_Martin_What_Good_04_16"); //To przez niego si� tu znalaz�em, w�o�y�em w jego wykonanie sporo serca. Musz� go odzyska�!
	AI_Output (other, self,"Info_Martin_What_Good_15_17"); //Straci�e� pier�cie�?
	AI_Output (self, other,"Info_Martin_What_Good_04_18"); //Kto� mi go ukrad� przed kilkoma dniami. Ten sukinsyn dobrze wiedzia� czego szuka.
	AI_Output (other, self,"Info_Martin_What_Good_15_19"); //Masz jakie� podejrzenia?
	AI_Output (self, other,"Info_Martin_What_Good_04_20"); //Niestety �adnych. Ale to nie m�g� by� amator. Prawie nie rozstawa�em si� z pier�cieniem.
	AI_Output (other, self,"Info_Martin_What_Good_15_21"); //Rozumiem. Popytam i mo�e czego� si� dowiem.
	AI_Output (self, other,"Info_Martin_What_Good_04_22"); //B�d� dyskretny. Wola�bym, �eby za du�o ludzi nie dowiedzia�o si� o mojej pami�tce.
	
   B_LogEntry		(CH2_RBL_Feelings, "Dowiedzia�em si� wszystkiego. Kto� ukrad� Martinowi cenn� pami�tk� - z�oty pier�cie�. Czas odebra� od Fiska nagrod�. ");
	B_StopProcessInfos	(self);
   Wld_InsertItem(ItMi_Martin_Ring, "OW_WATERFALLCAVE_1");
	Help_Martin = TRUE;
};

// ****************************

instance  Info_Martin_Fingers (C_INFO)
{
	npc			=	RBL_4125_Martin;
	nr			=	3;
	condition	=	Info_Martin_Fingers_Condition;
	information	=	Info_Martin_Fingers_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz�em z�odzieja."; 
};                       

FUNC int  Info_Martin_Fingers_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Fingers_Martin))
	{
		return 1;
	};
};

FUNC VOID  Info_Martin_Fingers_Info()
{
	AI_Output (other, self,"Info_Martin_Fingers_15_00"); //Znalaz�em z�odzieja.
	AI_Output (self, other,"Info_Martin_Fingers_04_01"); //R�czka?
	AI_Output (other, self,"Info_Martin_Fingers_15_02"); //Tak.
	AI_Output (self, other,"Info_Martin_Fingers_04_03"); //A to sukinsyn! Jeszcze si� z nim policz�.
};

// ****************************

instance  Info_Martin_Ring (C_INFO)
{
	npc			=	RBL_4125_Martin;
	nr			=	4;
	condition	=	Info_Martin_Ring_Condition;
	information	=	Info_Martin_Ring_Info;
	permanent		= 0;
	important		= 0;
	description		= "Odnalaz�em pier�cie�."; 
};                       

FUNC int  Info_Martin_Ring_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Martin_Fingers))&&(NPC_HasItems(other,ItMi_Martin_Ring)>=1)
	{
		return 1;
	};
};

FUNC VOID  Info_Martin_Ring_Info()
{
	AI_Output (other, self,"Info_Martin_Ring_15_00"); //Odnalaz�em pier�cie�.
	AI_Output (self, other,"Info_Martin_Ring_04_01"); //Poka� mi go!
	AI_Output (self, other,"Info_Martin_Ring_04_02"); //Pi�kny jak zawsze... Pi�kny i zdradziecki.
	AI_Output (self, other,"Info_Martin_Ring_04_03"); //Mo�esz go zatrzyma�.
	AI_Output (other, self,"Info_Martin_Ring_15_04"); //Co?! Tyle si� nabiega�em, a Ty mi go oddajesz?
	AI_Output (self, other,"Info_Martin_Ring_04_05"); //Nie mog� ju� �y� przesz�o�ci�. Sygnet za bardzo przypomina mi to kim by�em i jak si� tu znalaz�em.
	AI_Output (self, other,"Info_Martin_Ring_04_06"); //Nie masz poj�cia do jakich przemy�le� cz�owiek mo�e doj�� wpatruj�c si� w tafl� wody...
	AI_Output (other, self,"Info_Martin_Ring_15_07"); //W porz�dku. Wezm� pier�cie�. Uwa�aj na siebie, Martin.
	AI_Output (self, other,"Info_Martin_Ring_04_08"); //B�d� pami�ta� co dla mnie zrobi�e�. Bywaj, piracie.

	Npc_ExchangeRoutine(self,"DO");
	B_LogEntry		(CH2_RBL_Feelings, "Ten Martin to dziwny cz�owiek. Po ca�ej Kolonii ugania�em si� za jego pier�cieniem a on mi go odda�. Ale troch� go rozumiem - przesz�o�� nie powinna nikogo prze�ladowa�. Nawet pod postaci� z�otego pier�cienia. Czas porozmawia� z Fiskiem.");
}; 
