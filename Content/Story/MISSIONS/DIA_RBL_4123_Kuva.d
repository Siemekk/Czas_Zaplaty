// **************************** 
//				EXIT 
// ****************************

instance  Info_Kuva_EXIT (C_INFO)
{
	npc			=	RBL_4123_Kuva;
	nr			=	999;
	condition	=	Info_Kuva_EXIT_Condition;
	information	=	Info_Kuva_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Kuva_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Kuva_EXIT_Info()
{
	B_StopProcessInfos	(self);
};



/************************

Ork ten Kuva ma by� zamkni�ty w jaskini pomi�dzy SK a Kanionem Trola - jest tam taka jedna. Wstaw kraty + drzwi zamkni�te na klucz kuva_key 


*************************/




// **************************** 
//			Hallo 
// ****************************

instance  Info_Kuva_Hallo (C_INFO)
{
	npc			=	RBL_4123_Kuva;
	nr			=	1;
	condition	=	Info_Kuva_Hallo_Condition;
	information	=	Info_Kuva_Hallo_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};                       

FUNC int  Info_Kuva_Hallo_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID  Info_Kuva_Hallo_Info()
{
	B_FullStop (hero);
	AI_Output (self, other,"Info_Kuva_Hallo_04_01"); //Hej, Ty! St�j!
	AI_TurnToNpc(other, self);
	AI_Output (other, self,"Info_Kuva_Hallo_15_02"); //Co to za ptaszek w klatce?
	AI_Output (self, other,"Info_Kuva_Hallo_04_03"); //Bardzo �mieszne.
	AI_Output (other, self,"Info_Kuva_Hallo_15_04"); //Sam si� tu zamkn��e�?
	AI_Output (self, other,"Info_Kuva_Hallo_04_05"); //Nie b�d� idiot�. Musisz mnie st�d wydosta�!
	AI_Output (other, self,"Info_Kuva_Hallo_15_06"); //Je�eli kto� Ci� tu zamkn�� to musia� mie� jaki� pow�d. Nie chc� si� nikomu narazi�.
	AI_Output (self, other,"Info_Kuva_Hallo_04_07"); //Niech Ci� szlag. Przecie� mnie tu nie zostawisz!

	Info_ClearChoices (Info_Kuva_Hallo);
	Info_AddChoice (Info_Kuva_Hallo, "Dobra, pomog� Ci.", Info_Kuva_Hallo_Yes);
	Info_AddChoice (Info_Kuva_Hallo, "A co mnie to obchodzi.", Info_Kuva_Hallo_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID Info_Kuva_Hallo_Yes()
{
	AI_Output (other, self,"Info_Kuva_Hallo_Yes_15_01"); //Dobra, pomog� Ci.
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_02"); //Nigdy Ci tego nie zapomn�, przyjacielu!
	AI_Output (other, self,"Info_Kuva_Hallo_Yes_15_03"); //Kto Ci� tu zamkn��?
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_04"); //Nie mam poj�cia, ale przyszed�em tu na spotkanie ze �wistakiem.
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_05"); //Nawet nie wiem kiedy oberwa�em przez �eb. Kiedy odzyska�em przytomno�� le�a�em zamkni�ty w klatce. 
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_06"); //Sukinsyn zostawi� mi troch� �arcia i buteleczk� z trucizn�. Niech go szlag trafi!
	AI_Output (other, self,"Info_Kuva_Hallo_Yes_15_07"); //Ciesz si�, �e nie przyku� Ci� �a�cuchem do kraty i nie zostawi� pi�y...
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_08"); //Ale� Ty pomys�owy!
	AI_Output (other, self,"Info_Kuva_Hallo_Yes_15_09"); //Nie widzia�e� jego twarzy?
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_10"); //Nie. Ale to pewnie �wistak. Wisia�em mu sporo rudy. Ostatnio jestem ma�o wyp�acalny...
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_11"); //Pewnie da� mi w �eb, przeszuka�, nie znalaz� rudy wi�c si� wnerwi�, a reszt� ju� znasz.
	AI_Output (other, self,"Info_Kuva_Hallo_Yes_15_12"); //Dobra, pogadam ze �wistakiem. Nigdzie si� st�d nie ruszaj.
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_13"); //Bardzo �mieszne...
	Log_CreateTopic	(CH1_RBL_Cage, LOG_MISSION);
	Log_SetTopicStatus	(CH1_RBL_Cage, LOG_RUNNING);
	B_LogEntry		(CH1_RBL_Cage, "Obieca�em pom�c Kuvie, kt�rego kto� pomys�owy zamkn�� w klatce. Kuva twierdzi, �e by� winien �wistakowi rud� i to z nim mia� si� tu spotka�. Od niego powinienem zacz��.");
	Kuva_Help=TRUE;
};


// ---------------------------No----------------------------------------

FUNC VOID Info_Kuva_Hallo_No()
{
	AI_Output (other, self,"Info_Kuva_Hallo_No_15_01"); //A co mnie to obchodzi.
	AI_Output (self, other,"Info_Kuva_Hallo_No_04_02"); //Ty gnoju! Nie masz serca!
	AI_Output (other, self,"Info_Kuva_Hallo_No_15_03"); //Witamy w Kolonii Karnej. Baw si� dobrze...
	AI_Output (self, other,"Info_Kuva_Hallo_No_04_04"); //Skurwiel!
	B_StopProcessInfos	(self);
};



// ****************************

instance  Info_Kuva_Again (C_INFO)
{
	npc			=	RBL_4123_Kuva;
	nr			=	2;
	condition	=	Info_Kuva_Again_Condition;
	information	=	Info_Kuva_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};                       

FUNC int  Info_Kuva_Again_Condition()
{

	if (Npc_GetDistToNpc(self,hero) < 500)&&(Npc_KnowsInfo (hero, DIA_Tony_Kuva))

	{
		return 1;
	};


};

FUNC VOID  Info_Kuva_Again_Info()
{
	B_FullStop (hero);
	AI_Output (self, other,"Info_Kuva_Again_04_01"); //Dowiedzia�e� si� czego� nowego?
	AI_TurnToNpc(other, self);
	AI_Output (other, self,"Info_Kuva_Again_15_02"); //Mniej, wi�cej. 
	AI_Output (other, self,"Info_Kuva_Again_15_03"); //Tw�j d�ug wykupi� R�czka, to chcia� Ci powiedzie� podczas spotkania �wistak.
	AI_Output (other, self,"Info_Kuva_Again_15_04"); //Rud� na wykup R�czka dosta� od Toniego.
	AI_Output (other, self,"Info_Kuva_Again_15_05"); //Ale Tony nie powiedzia� mi nic wi�cej. Musz� zdoby� jaki� dow�d, co� co mo�e wskaza� sprawc�.
	AI_Output (self, other,"Info_Kuva_Again_04_06"); //Ale to pogmatwane...
	AI_Output (other, self,"Info_Kuva_Again_15_07"); //Zaraz... Trucizna! Ilu w Kolonii jest skaza�c�w potrafi�cych wa�y� trucizn�?
	AI_Output (self, other,"Info_Kuva_Again_04_08"); //Pewnie niewielu. Masz racj�, to jest w�a�ciwy �lad!
	AI_Output (other, self,"Info_Kuva_Again_15_09"); //Mam nadziej�, �e jeszcze nie wypi�e� tej trucizny?
	AI_Output (self, other,"Info_Kuva_Again_04_10"); //Nie jestem idiot�! Mam j� przy sobie.
	AI_Output (other, self,"Info_Kuva_Again_15_11"); //Tak w�a�ciwie to sk�d pewno��, �e to trucizna?
	AI_Output (self, other,"Info_Kuva_Again_04_12"); //Bo ja wiem... Dziwna buteleczka z cuchn�c� zawarto�ci� nie mo�e by� afrodyzjakiem.
	AI_Output (other, self,"Info_Kuva_Again_15_13"); //Znasz kogo� kto potrafi wa�y� mikstury?
	AI_Output (self, other,"Info_Kuva_Again_04_14"); //Ja nie, ale pogadaj z Cavalornem on zna tu wszystkich.
	AI_Output (other, self,"Info_Kuva_Again_15_15"); //Daj mi buteleczk� i znikam.
	CreateInvItems (self,ItFo_Nabil_Poison,1);
	B_GiveInvItems (self, other, ItFo_Nabil_Poison, 1);
	AI_Output (self, other,"Info_Kuva_Again_04_16"); //Tylko o mnie nie zapomnij!

	B_LogEntry		(CH1_RBL_Cage, "Dziwna buteleczka wcale nie musi by� trucizn�. Musz� poszuka� skaza�c�w, kt�rzy potrafi� wa�y� mikstury. Cavalorn zna tu wszystkich, ciekawe co powie?");
}; 
