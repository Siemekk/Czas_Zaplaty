// ************************ EXIT **************************

INSTANCE DIA_SLD_709_Cord_Exit (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 999;
	condition	= DIA_SLD_709_Cord_Exit_Condition;
	information	= DIA_SLD_709_Cord_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_709_Cord_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int cord_warn;

/*------------------------------------------------------------------------
Hi							
------------------------------------------------------------------------*/

instance  DIA_Cord_Hello (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_Hello_Condition;
	information		= DIA_Cord_Hello_Info;
	important		= 1;
	permanent		= 1;
	description		= "."; 
};

FUNC int  DIA_Cord_Hello_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 600) && (cord_warn < 3)
	{
		return 1;
	};
};

FUNC void  DIA_Cord_Hello_Info()
{
	B_FullStop (hero);
	AI_DrawWeapon (self);
	AI_GotoNpc(other,self);
   
	if (Kapitel<3)
	{
		AI_Output (self, other,"DIA_Cord_Hello_14_11"); //Odejd� st�d, bo �ycie to cenny dar, ch�opcze.
		AI_RemoveWeapon (self);
		B_StopProcessInfos(self);
		AI_GotoWP(other, "LOCATION_19_03_PATH_RUIN7");
	}
	else
	{
		if (cord_warn==0)
		{
			cord_warn = cord_warn + 1;//1
			AI_DrawWeapon (self);
			AI_Output (self, other,"DIA_Cord_Hello_14_12"); //A Ty chyba szukasz guza!
			AI_Output (other, self,"DIA_Cord_Hello_15_13"); //Chodz� tam, gdzie mi si� podoba.
			AI_Output (self, other,"DIA_Cord_Hello_14_14"); //To �wietnie. My�l�, �e tam Ci si� bardziej spodoba...
			AI_RemoveWeapon(self);
			B_StopProcessInfos(self);
			AI_GotoWP(other, "LOCATION_19_03_PATH_RUIN7");
		}
		else if (cord_warn==1)
		{
			cord_warn = cord_warn + 1;//2
			AI_Output (other, self,"DIA_Cord_Hello_15_17"); //Nikt nie b�dzie mi m�wi�, co mam robi�!
			AI_Output (self, other,"DIA_Cord_Hello_06_18"); //Co Ty nie powiesz? Wyno� si� p�kim dobry!
			AI_RemoveWeapon(self);
			B_StopProcessInfos(self);
			AI_GotoWP(other, "LOCATION_19_03_PATH_RUIN7");
		}
		else if (cord_warn==2)
		{
			cord_warn = cord_warn + 1;//3
			AI_Output (other, self,"DIA_Cord_Hello_15_19"); //Prosisz si� o z�ojenie sk�ry.
			AI_Output (self, other,"DIA_Cord_Hello_06_20"); //Skoro nalegasz...
			B_StopProcessInfos (self); 
			B_StartAfterDialogFight(self,other,false);
		};
	};
}; 

INSTANCE DIA_Cord_After (C_INFO)
{
	npc				= SLD_709_Cord;
	nr				= 2;
	condition		= DIA_Cord_After_Condition;
	information		= DIA_Cord_After_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Cord_After_Condition()
{
	if (cord_warn==3)
	{
		return 1;
	};
};

FUNC VOID DIA_Cord_After_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);

	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Cord_After_07_01"); //Potrafisz walczy�. Szkoda, �e nie jeste� najemnikiem.
		B_GiveXP(100);
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Cord_After_07_02"); //Nie�le, pokona�e� mnie. Niezgorszy z Ciebie szermierz.
		B_GiveXP(200);	
	};
   
	AI_Output (self, other, "DIA_Cord_After_07_03"); //Jak chcesz mo�esz si� tu rozejrze�. Wydaje mi si�, �e mo�esz okaza� si�... pomocny.
};

//************************************************************

instance  DIA_Cord_Question (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_Question_Condition;
	information		= DIA_Cord_Question_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ty jeste� Cord?"; 
};

FUNC int  DIA_Cord_Question_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jarvis_Help))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_Question_Info()
{
	B_GiveXP(250);
	AI_Output (other, self,"DIA_Cord_Question_15_01"); //Ty jeste� Cord?
	AI_Output (self, other,"DIA_Cord_Question_14_02"); //Tak, a co Ci do tego?
	AI_Output (other, self,"DIA_Cord_Question_15_03"); //Mam dla Ciebie wiadomo�� od Jarvisa. Kaza� przekaza�, �e 'znalaz� zgub� i czeka na reszt�'.
	AI_Output (self, other,"DIA_Cord_Question_14_04"); //Hmm, rozumiem. Mo�esz wraca�...
	AI_Output (other, self,"DIA_Cord_Question_15_05"); //Chwila. Jarvis powiedzia�, �e dostan� tyle rudy ile ud�wign�.
	AI_Output (self, other,"DIA_Cord_Question_14_06"); //To id� do niego. A teraz zejd� mi z drogi, ch�opcze.
	
   B_LogEntry(CH3_NON_Mercenary, "Przekaza�em wiadomo�� Cordowi, ale o zap�acie mog� zapomnie�. Musz� sobie porozmawia� z tym Jarvisem.");
	B_StopProcessInfos(self);
};

//************************************************************

instance  DIA_Cord_Convoys (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_Convoys_Condition;
	information		= DIA_Cord_Convoys_Info;
	important		= 0;
	permanent		= 0;
	description		= "O co chodzi z tymi konwojami?"; 
};

FUNC int  DIA_Cord_Convoys_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Lee_Convoys))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_Convoys_Info()
{
	AI_Output (other, self,"DIA_Cord_Convoys_15_01"); //O co chodzi z tymi konwojami?
	AI_Output (self, other,"DIA_Cord_Convoys_14_02"); //Cholerni magnaci co jaki� czas wysy�aj� ze Starego Obozu do Fletchera konwoje z �ywno�ci�, broni� i lud�mi. W drodze powrotnej konwoje zabieraj� rud� i ry��wk�.
	AI_Output (self, other,"DIA_Cord_Convoys_14_03"); //Musimy je przej�� i zadba� o to, aby nikt nie zdo�a� zbiec do Starego Obozu.
	AI_Output (other, self,"DIA_Cord_Convoys_15_04"); //W czym wi�c problem?
	AI_Output (self, other,"DIA_Cord_Convoys_14_05"); //W tym, �e nas te mendy za dobrze znaj�. Potrzebuj� kogo� kto chocia� na pierwszy rzut oka b�dzie wygl�da� jak stra�nik.
	AI_Output (other, self,"DIA_Cord_Convoys_15_06"); //I oczywi�cie pomy�la�e� o mnie. Po prostu czuj� si� zaszczycony.
	AI_Output (self, other,"DIA_Cord_Convoys_14_07"); //Daj spok�j z t� ironi�. Wiem od Gorna, �e ju� wcze�niej paradowa�e� po obozie w pancerzu stra�nika. 
	AI_Output (other, self,"DIA_Cord_Convoys_15_08"); //W Starym Obozie te� si� rozgl�da�em.
	AI_Output (self, other,"DIA_Cord_Convoys_14_09"); //Sam widzisz, �e nie znajd� nikogo lepszego.
	AI_Output (self, other,"DIA_Cord_Convoys_14_10"); //Wi�c jak b�dzie?
	
   B_LogEntry		(CH5_NC_Convoys,	"Cord chce przej�� konwoje z �ywno�ci�, broni� i lud�mi zmierzaj�ce ze Starego Obozu do Fletchera. Potrzebuje kogo� kto z pozoru wygl�da jak stra�nik, czyli niestety nadaj� si� do tego najlepiej.");
};

//************************************************************

instance  DIA_Cord_ConvoysHelp (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysHelp_Condition;
	information		= DIA_Cord_ConvoysHelp_Info;
	important		= 0;
	permanent		= 0;
	description		= "W porz�dku, wchodz� w to."; 
};

FUNC int  DIA_Cord_ConvoysHelp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Cord_Convoys))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoysHelp_Info()
{
	AI_Output (other, self,"DIA_Cord_ConvoysHelp_15_01"); //W porz�dku, wchodz� w to.
	AI_Output (self, other,"DIA_Cord_ConvoysHelp_14_02"); //W ko�cu kto� z twardymi jajami. Czasu nie mamy zbyt du�o, wi�c s�uchaj uwa�nie.
	AI_Output (self, other,"DIA_Cord_ConvoysHelp_14_03"); //Uda�o mi si� dowiedzie� tylko tyle, �e pierwszy konw�j transportuje �ywno��. Najcz�ciej wybieraj� ucz�szczany szlak ze Starego Obozu do Nowego.
	AI_Output (self, other,"DIA_Cord_ConvoysHelp_14_04"); //Ten jest te� najs�abiej chroniony. Zajmiesz si� tym sam. Wyr�nij stra�nik�w i przejmij �adunek.
	AI_Output (other, self,"DIA_Cord_ConvoysHelp_15_05"); //Rozumiem. Zajm� si� tym od razu.
	AI_Output (self, other,"DIA_Cord_ConvoysHelp_14_06"); //Wr�� do mnie jak tylko za�atwisz spraw�.
	B_LogEntry		(CH5_NC_Convoys, "Konw�j pod��a szlakiem ze Starego Obozu do Nowego. Mam wyr�n�� stra�nik�w i przej�� �adunek. Wygl�da do�� prosto.");

	/*********************

Wsad� ich przed mostem do NO, tam gdzie kufer jest, niech sobie gadaj� i wpierdzielaj� �arcie, kt�re niby nios� dla Fletchera i jego bandy
*************************/

	Wld_InsertNpc	(Grd_4096_Convoy1, "OW_PATH_056");
	Wld_InsertNpc	(Grd_4097_Convoy2, "OW_PATH_056");
};

//************************************************************

var int cord_wait;
var int cord_price;

instance  DIA_Cord_ConvoysPeople (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysPeople_Condition;
	information		= DIA_Cord_ConvoysPeople_Info;
	important		= 0;
	permanent		= 0;
	description		= "Za�atwi�em spraw� z pierwszym konwojem."; 
};

FUNC int  DIA_Cord_ConvoysPeople_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Convoy1_First))&&(Npc_KnowsInfo(hero,DIA_Cord_ConvoysHelp))&&(NPC_HasItems(hero,foodpackage)>=4)
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoysPeople_Info()
{
	cord_price = cord_price + 1;
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_01"); //Za�atwi�em spraw� z pierwszym konwojem.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_02"); //Masz ca�y transport?
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_03"); //Cztery paczki cuchn�cego �arcia, prosz� bardzo. Nie ka� mi tylko tego je��.
	B_GiveInvItems (other, self, foodpackage, 4);
	Npc_RemoveInvItems(self,foodpackage,4);
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_04"); //Bez obaw. To mia�a by� �ywno�� dla kopaczy i najemnik�w z kopalni.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_05"); //Czas na kolejny transport. Tym razem b�dzie to '�ywy inwentarz'.
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_06"); //Ludzie?
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_07"); //Przecie� jeste�my w Kolonii, tu nie ma ludzi. To skaza�cy.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_08"); //Nie wiem ilu i nie znam trasy przemarszu, ale powinni by� jeszcze w pobli�u Starego Obozu.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_09"); //Poszukaj ich w pobli�u bram.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_10"); //Masz na to dwa dni.
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_11"); //Troch� ma�o, ale zrobi� co w mojej mocy.
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_12"); //Tw�j rachunek ro�nie, Cord.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_13"); //Za�atw spraw� z konwojami do ko�ca, a nie po�a�ujesz.
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_14"); //To si� dopiero oka�e, przyjacielu.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_15"); //Stra�nicy wybrani do tej roboty to wybitne skurywysny, wi�c si� z nimi nie cackaj.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_16"); //Porozmawiaj z Orikiem, pomo�e Ci w wypruwaniu flak�w.
	cord_wait = B_SetDayTolerance()+2;
	B_LogEntry		(CH5_NC_Convoys, "Tym razem to transport ludzi. Cord zasugerowa� abym rozejrza� si� w pobli�u Starego Obozu, a dok�adnie w okolicy bram. Da� mi 2 dni na odnalezienie transportu. Mo�e Orik pomo�e mi ze stra�nikami.");

	/*****************************************

Miejsce: tam gdzie w g1 by�y te 3 z�bacza - po przej�ciu rzeki mo�naby�o i�� do cytadeli zmiennokszta�tnych.
Wsadzi si� tam 3 martwych koopaczy i 1 �ywego - stra�nicy si� zabawili z nimi. Stra�nicy maj� si� rzuci� na dicka i orika jak tylko go zobacz�. 
Wszystkich npc�w zrobi�em, daj im tylko odp. wp.

********************************************/

	/**********************
�ywy towar
**************************/

	Wld_InsertNpc	(VLK_4098_Buddler,"OW_PATH_168");
	Wld_InsertNpc	(VLK_4099_Buddler,"OW_PATH_169");
	Wld_InsertNpc	(VLK_4100_Buddler,"OW_PATH_169");
	var C_NPC vk1; vk1 = Hlp_GetNpc(VLK_4098_Buddler);
	Npc_ChangeAttribute	(vk1, ATR_HITPOINTS, -vk1.attribute[ATR_HITPOINTS_MAX]);
	var C_NPC vk2; vk2 = Hlp_GetNpc(VLK_4099_Buddler);
	Npc_ChangeAttribute	(vk2, ATR_HITPOINTS, -vk2.attribute[ATR_HITPOINTS_MAX]);
	var C_NPC vk3; vk3 = Hlp_GetNpc(VLK_4100_Buddler);
	Npc_ChangeAttribute	(vk3, ATR_HITPOINTS, -vk3.attribute[ATR_HITPOINTS_MAX]);

	Wld_InsertNpc	(VLK_4101_Buddler, "OW_PATH_170");

	/**************************
Stra�nicy
***************************/

	Wld_InsertNpc	(Grd_4102_Convoy,"OW_PATH_168");
	Wld_InsertNpc	(Grd_4103_Convoy,"OW_PATH_168");
	Wld_InsertNpc	(Grd_4104_Convoy,"OW_PATH_169");
	Wld_InsertNpc	(Grd_4105_Convoy,"OW_PATH_170");
};

//************************************************************

instance  DIA_Cord_ConvoysPeopleDone (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysPeopleDone_Condition;
	information		= DIA_Cord_ConvoysPeopleDone_Info;
	important		= 0;
	permanent		= 0;
	description		= "'�ywy towar' zabezpieczony."; 
};

FUNC int  DIA_Cord_ConvoysPeopleDone_Condition()
{	
	var C_NPC con1; con1 = Hlp_GetNpc(Grd_4102_Convoy);
	var C_NPC con2; con2 = Hlp_GetNpc(Grd_4103_Convoy);
	var C_NPC con3; con3 = Hlp_GetNpc(Grd_4104_Convoy);
	var C_NPC con4; con4 = Hlp_GetNpc(Grd_4105_Convoy);

	if (Npc_KnowsInfo(hero, DIA_ConvoyCommander_First))
	&& (Npc_IsDead(con1) && Npc_IsDead(con2) && Npc_IsDead(con3) && Npc_IsDead(con4))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoysPeopleDone_Info()
{
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone_15_01"); //'�ywy towar' zabezpieczony.
	
   if (cord_wait >= Wld_GetDay())
	{
		cord_price = cord_price + 1;
		AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone_14_02"); //Uwin��e� si� z tym, �wietna robota.
	}
	else
	{
		AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone_14_03"); //Sp�ni�e� si�! Ale lepiej p�no ni� wcale.
	};

	B_LogEntry(CH5_NC_Convoys, "Transport ludzi zabezpieczony.");
};

//************************************************************

instance  DIA_Cord_ConvoysPeopleDone2 (C_INFO)
{

	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysPeopleDone2_Condition;
	information		= DIA_Cord_ConvoysPeopleDone2_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ocala� tylko jeden z kopaczy."; 
};

FUNC int  DIA_Cord_ConvoysPeopleDone2_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Cord_ConvoysPeopleDone))&&(Npc_KnowsInfo(hero,DIA_Budd_First ))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoysPeopleDone2_Info()
{
	var C_NPC bud; bud = Hlp_GetNpc(VLK_4101_Buddler);

	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone2_15_01"); //Ocala� tylko jeden z kopaczy.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone2_14_02"); //Co si� z nim sta�o?
	
   if (Npc_KnowsInfo(hero,DIA_Budd_Safe))
	{
		cord_price = cord_price + 1;
		AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone2_15_03"); //Doprowadzi�em go bezpiecznie do obozu.
		AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone2_14_04"); //Jestem pod wra�eniem. Uwzgl�dni� to podczas zap�aty.
		B_LogEntry		(CH5_NC_Convoys, "Op�aci�o si� doprowadzi� tego biednego kopacza do obozu. Cord uwzgl�dni to przy rozliczeniu.");
	}
	else if (Npc_IsDead(bud))
	{
		AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone2_15_05"); //Nie da� rady... Stra�nicy paskudnie go posiekali.
		AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone2_14_06"); //Cholerne sukinsyny!
	}
   else
   {
      AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone2_14_07"); //Nie wiem... Gdzie� zagin�� w akcji...
   };
};

//************************************************************

instance  DIA_Cord_ConvoysPeopleDone3 (C_INFO)
{

	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysPeopleDone3_Condition;
	information		= DIA_Cord_ConvoysPeopleDone3_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz�em to przy dow�dcy konwoju."; 
};

FUNC int  DIA_Cord_ConvoysPeopleDone3_Condition()
{	
	if (NPC_HasItems(hero,convoy_list)>=1)&&(convoy_list_read == TRUE)
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoysPeopleDone3_Info()
{
	cord_price = cord_price + 1;
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_01"); //Znalaz�em to przy dow�dcy konwoju.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_02"); //Co to za papier?
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_03"); //Sam zobacz.
	B_GiveInvItems (other, self, convoy_list, 1);
	Npc_RemoveInvItems(self,convoy_list,1);
	B_UseFakeScroll(self);
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_04"); //To jest nasza przepustka do przej�cia ostatniego konwoju!
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_05"); //Te� tak sobie pomy�la�em. Jest tylko jedno ale. Kto podszyje si� pod przysz�ego konwojenta?
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_06"); //A jak my�lisz? Znam tylko jednego szale�ca, kt�ry za odpowiedni� ilo�� rudy nakopa�by do dupy samemu Beliarowi!
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_07"); //Wiesz jak mnie podej��... Za��my, �e p�jd� do Starego Obozu. Co dalej?
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_08"); //Zastawimy pu�apk� na konw�j. Bro� b�d� przewozi� pod dobr� eskort�.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_09"); //To w tej chwili najcenniejszy towar w Kolonii.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_10"); //Przede wszystkim musisz do��czy� do eskorty.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_11"); //Musisz te� dowiedzie� si�, jak� tras� wyruszy transport. I musisz mi t� wiadomo�� przekaza� odpowiednio wcze�nie, �ebym zdo�a� przygotowa� niespodziank� dla tych sukinsyn�w.
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_12"); //Cholera... To Ci� b�dzie sporo kosztowa�.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_13"); //Wiem, ale nie wybra�bym do tej roboty nikogo innego. Dasz sobie rad�, Rick.
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_14"); //Jak mam dostarczy� wiadomo��?
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_15"); //Wy�l� jednego z naszych. B�dzie czeka� w jaskini za mostem, w pobli�u po�udniowej bramy. 
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_16"); //Dobra, zobaczymy jak to si� sko�czy.

	B_LogEntry(CH5_NC_Convoys, "No to wdepn��em. Musz� do��czy� do eskorty przewo��cej bro� ze Starego Obozu, dowiedzie� si� jak� tras� rusz� i przekaza� t� wiadomo�� najemnikowi, kt�ry b�dzie czeka� w jaskini za mostem. �ebym tylko nie pomyli� kolejno�ci, he, he.");
};

//************************************************************

instance DIA_Cord_ConvoysPeopleDone4 (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysPeopleDone4_Condition;
	information		= DIA_Cord_ConvoysPeopleDone4_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int DIA_Cord_ConvoysPeopleDone4_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Cord_ConvoysPeopleDone3))
	{
		return 1;
	};
};

FUNC void DIA_Cord_ConvoysPeopleDone4_Info()
{
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone4_14_01"); //Jeszcze jedno, Rick.
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone4_15_02"); //Co tym razem?
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone4_14_03"); //Nie daj si� zabi�, bo ju� si� zd��y�em do Ciebie przyzwyczai�.
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone4_15_04"); //Czy to o�wiadczyny?
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone4_14_05"); //Zejd� mi z oczu, piracie!
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone4_15_06"); //Bywaj, Cord.
	
   B_StopProcessInfos(self);
};

//************************************************************

func void B_EndTrapChangeRoutine()
{
	var C_NPC sldCordTrap7506; sldCordTrap7506 = Hlp_GetNpc(SLD_7506_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7506, "HIDE");
	var C_NPC sldCordTrap7507; sldCordTrap7507 = Hlp_GetNpc(SLD_7507_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7507, "HIDE");
	var C_NPC sldCordTrap7508; sldCordTrap7508 = Hlp_GetNpc(SLD_7508_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7508, "HIDE");
	var C_NPC sldCordTrap7509; sldCordTrap7509 = Hlp_GetNpc(SLD_7509_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7509, "HIDE");
	var C_NPC sldCordTrap7510; sldCordTrap7510 = Hlp_GetNpc(SLD_7510_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7510, "HIDE");
	var C_NPC sldCordTrap7511; sldCordTrap7511 = Hlp_GetNpc(SLD_7511_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7511, "HIDE");
	var C_NPC sldCordTrap7512; sldCordTrap7512 = Hlp_GetNpc(SLD_7512_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7512, "HIDE");
	var C_NPC sldCordTrap7513; sldCordTrap7513 = Hlp_GetNpc(SLD_7513_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7513, "HIDE");
};
//CINEMATIC?
//DIA_Cord_ConvoyConvoyTrap
//DIA_Cord_ConvoyConvoyTrapEnd etc.
//DIA_Orkan_EscortTrapTalk
instance DIA_Cord_ConvoyConvoyTrap (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoyConvoyTrap_Condition;
	information		= DIA_Cord_ConvoyConvoyTrap_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int DIA_Cord_ConvoyConvoyTrap_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orkan_EscortTrap))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC void DIA_Cord_ConvoyConvoyTrap_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, hero);
	var C_NPC ork; ork = Hlp_GetNpc(Grd_4106_Orkan);
	AI_TurnToNpc(self, ork);
	AI_Output (self, other,"DIA_Cord_ConvoyConvoyTrap_14_01"); //Rzu�cie bro�! Nie macie szans, celuje w was kilkana�cie kuszy.
	AI_Output (self, other,"DIA_Cord_ConvoyConvoyTrap_14_02"); //Zale�y nam tylko na broni.
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
	AI_PlayAni(self,"T_YES");
	AI_TurnToNpc(ork, hero);
	B_StopProcessInfos	(self);
};

//************************************************************

instance DIA_Cord_ConvoyConvoyTrapEnd (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoyConvoyTrapEnd_Condition;
	information		= DIA_Cord_ConvoyConvoyTrapEnd_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int DIA_Cord_ConvoyConvoyTrapEnd_Condition()
{	
	if (merc_trap == 2)&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoyConvoyTrapEnd_Info()
{
	B_FullStop (hero);
	var C_NPC ork; ork = Hlp_GetNpc(Grd_4106_Orkan);

	/*********************
Dodaj tej najemnik�w kt�rzy przyszli z Cordem

***********************/

	AI_TurnToNpc(self, ork);
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_01"); //Czemu nie? Znam Ci� Orkan, wiem na co ci� sta�. Przyda si� nam kto� taki.
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_02"); //Witaj w�r�d ludzi Lee, stra�niku.
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_03"); //A co do Ciebie, piracie...
	AI_Output (other, self, "DIA_Cord_ConvoyConvoyTrapEnd_15_04"); //Zdaje si�, �e solidnie zapracowa�em na nagrod�.
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_05"); //Niech mnie szlag, je�eli tak nie jest!
	cord_price = cord_price + 1;
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_06"); //To co� specjalnego, tobie bardziej si� przyda.

	/*********************

Ork nagroda rudy zale�y od cord_price sam ustal co na jakim poziomie by� powinno, ale za przekonanie orkana i reszty do dobicia do NO daj dodatkowo co� porz�dnego - recepta, etc.

************************/

	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_07"); //Powiem Lee, co z Ciebie za zi�ko.
	AI_Output (other, self, "DIA_Cord_ConvoyConvoyTrapEnd_15_08"); //Tylko nie m�w tego zbyt g�o�no, s�awa mnie zabija.
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_09"); //Nie ma sprawy. Do zobaczenia w obozie.
	AI_TurnToNpc(self, ork);
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_10"); //Ruszamy!

	if (NPC_HasItems(hero,weaponpackage)>=1)
	{
		AI_TurnToNpc(self, other);
		AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_11"); //Aha i oddaj paczki z broni�!
		AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_12"); //Skoro nalegasz...
		B_GiveInvItems (other,self,weaponpackage,NPC_HasItems(hero,weaponpackage));
		Npc_RemoveInvItems(self,weaponpackage,NPC_HasItems(self,weaponpackage));
	};
	
	Npc_RemoveInvItems(ork, weaponpackage, NPC_HasItems(ork, weaponpackage));
	Npc_RemoveInvItems(kirgo, weaponpackage, NPC_HasItems(kirgo, weaponpackage));
	Npc_RemoveInvItems(asghan, weaponpackage, NPC_HasItems(asghan, weaponpackage));
   
	AI_TurnToNpc(self, ork);
	AI_TurnToNpc(ork, hero);
	Log_SetTopicStatus	(CH5_NC_Convoys,	LOG_SUCCESS);
	B_LogEntry		(CH5_NC_Convoys, "Sprawa z konwojami zako�czona. Uda�o mi si� nam�wi� kilku stra�nik�w do zmiany strony barykady. Oby w Nowym Obozie wytrzymali d�u�ej ni� w Starym.");
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"NC1");
	
	B_EndTrapChangeRoutine();
};

//************************************************************

instance DIA_Cord_ConvoyTrapEnd1 (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoyTrapEnd1_Condition;
	information		= DIA_Cord_ConvoyTrapEnd1_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int DIA_Cord_ConvoyTrapEnd1_Condition()
{	
	var C_NPC ork; ork = Hlp_GetNpc(Grd_4106_Orkan);
	var C_NPC kir; kir = Hlp_GetNpc(Grd_251_Kirgo);
	var C_NPC ash; ash = Hlp_GetNpc(Grd_263_Asghan);

	if (merc_trap == 3)&&(Npc_GetDistToNpc(self,hero) < 1500)
	&&(Npc_IsDead(ork))&&(Npc_IsDead(kir))&&(Npc_IsDead(ash))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoyTrapEnd1_Info()
{
	B_FullStop (hero);

	/*********************
Dodaj tej najemnik�w kt�rzy przyszli z Cordem

***********************/

	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_01"); //Ju� po wszystkim.
	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_02"); //Szkoda, �e musia�o doj�� do krwawego fina�u. Zawsze szanowa�em Orkana i Kirgo.
	AI_Output (other, self, "DIA_Cord_ConvoyTrapEnd1_15_04"); //Zdaje si�, �e solidnie zapracowa�em na nagrod�.
	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_05"); //Zaiste, opowie�ci o tobie piracie nie by�y przesadzone.
	cord_price = cord_price + 1;
	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_06"); //Twoja nagroda, zas�u�y�e� na ni�.

	/*********************

Ork nagroda w rudzie zale�y od cord_price sam ustal co na jakim poziomie by� powinno, po zabiciu stra�nik�w daj te� co� dodatkowego - recepta, etc. ale gorszego ni� przy do��czaniu do NO.

************************/

	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_07"); //Wracam do Lee, zdam mu raport z post�p�w.
	AI_Output (other, self, "DIA_Cord_ConvoyTrapEnd1_15_08"); //W porz�dku, bywaj.
	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_09"); //Do zobaczenia w obozie.
	

	if (NPC_HasItems(hero,weaponpackage)>=1)
	{
		AI_TurnToNpc(self, other);
		AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_11"); //Aha i oddaj paczki z broni�!
		AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_12"); //Skoro nalegasz...
		B_GiveInvItems (other,self,weaponpackage,NPC_HasItems(hero,weaponpackage));
		Npc_RemoveInvItems(self,weaponpackage,NPC_HasItems(self,weaponpackage));
	};
   
	Log_SetTopicStatus	(CH5_NC_Convoys,	LOG_SUCCESS);
	B_LogEntry		(CH5_NC_Convoys, "Sprawa z konwojami zako�czona. Stra�nicy nie �yj�, Cord ma swoj� bro�, wszyscy s� zadowoleni - no mo�e pr�cz stra�nik�w.");
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"NC1");
	
	B_EndTrapChangeRoutine();
};

//************************************************************

instance DIA_Cord_AllEnd (C_INFO)
{

	npc				= SLD_709_Cord;
	condition		= DIA_Cord_AllEnd_Condition;
	information		= DIA_Cord_AllEnd_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co s�ycha�?"; 
};

FUNC int DIA_Cord_AllEnd_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Cord_ConvoyConvoyTrapEnd))||(Npc_KnowsInfo(hero,DIA_Cord_ConvoyTrapEnd1))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_AllEnd_Info()
{
	AI_Output (other, self, "DIA_Cord_AllEnd_15_01"); //Co s�ycha�?
	AI_Output (self, other, "DIA_Cord_AllEnd_14_02"); //Jako� sobie radzimy.
	AI_Output (self, other, "DIA_Cord_AllEnd_14_03"); //Jeszcze raz dzi�ki za pomoc z konwojami.
	AI_Output (other, self, "DIA_Cord_AllEnd_15_04"); //By�o, min�o. Nie daj si� zabi�, Cord.
	AI_Output (self, other, "DIA_Cord_AllEnd_14_05"); //Ty te�, piracie. Ty te�...
};

/****************************


Wyja�ni� spraw� zaginionych konwoji, dlaczego magnaci wysy�ali z�om, etc.

*******************************/

INSTANCE DIA_Cord_CanYouTeachMe (C_INFO)
{
	npc				= SLD_709_Cord;
	//nr				= 71;
	condition		= DIA_Cord_CanYouTeachMe_Condition;
	information		= DIA_Cord_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Cord_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Cord_ConvoysPeopleDone4))
	{
		return 1;
	};
};

FUNC VOID DIA_Cord_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Cord_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe_12_02"); //Fechtunek to moje �ycie, a bro� jednor�czna to moja kochanka.
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe_12_03"); //Poka�� Ci jak zosta� mistrzem miecza.	
	
	Log_CreateTopic(GE_TeacherNC, LOG_NOTE);
	B_LogEntry(GE_TeacherNC, "Cord nauczy mnie po mistrzowsku w�ada� broni� jednor�czn�.");
};

INSTANCE DIA_Cord_CanYouTeachMe1 (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_CanYouTeachMe1_Condition;
	information		= DIA_Cord_CanYouTeachMe1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Umiesz walczy� dwoma ostrzami?"; 
};

FUNC INT DIA_Cord_CanYouTeachMe1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Cord_ConvoysPeopleDone4))
	{
		return 1;
	};
};

FUNC VOID DIA_Cord_CanYouTeachMe1_Info()
{
	AI_Output (other, self, "DIA_Cord_CanYouTeachMe1_15_01"); //Umiesz walczy� dwoma ostrzami?
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe1_12_02"); //Oczywi�cie, ale to nie lada sztuka.
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe1_12_03"); //Przede wszystkim musisz mistrzowsko w�ada� broni� jednor�czn�.
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe1_12_04"); //Musisz te� pozna� tajniki walki broni� dwur�czn�.
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe1_12_05"); //Wr�� do mnie, jak zg��bisz t� wiedz�.	
	
	Log_CreateTopic(GE_TeacherNC, LOG_NOTE);
	B_LogEntry(GE_TeacherNC, "Cord mo�e mnie nauczy� walki dwoma ostrzami. Musz� wcze�niej zosta� mistrzem w�adania mieczem jednor�cznym i pozna� podstawy walki broni� dwur�czn�.");
};

INSTANCE DIA_Cord_CanYouTeachMe11 (C_INFO)
{
	npc				= SLD_709_Cord;
	//nr				= 71;
	condition		= DIA_Cord_CanYouTeachMe11_Condition;
	information		= DIA_Cord_CanYouTeachMe11_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nauczysz mnie walczy� dwoma ostrzami?"; 
};

FUNC INT DIA_Cord_CanYouTeachMe11_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Cord_CanYouTeachMe1)) && (Npc_GetTalentValue(other, NPC_TALENT_1H)>=60) && (Npc_GetTalentValue(other, NPC_TALENT_2H)>=60)
	{
		return 1;
	};
};

FUNC VOID DIA_Cord_CanYouTeachMe11_Info()
{
	AI_Output (other, self, "DIA_Cord_CanYouTeachMe11_15_01"); //Nauczysz mnie walczy� dwoma ostrzami?
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe11_12_02"); //Pewnie, oto tajniki w�adania t� broni�.

	Log_CreateTopic(GE_TeacherNC, LOG_NOTE);
	B_LogEntry(GE_TeacherNC, "Cord nauczy mnie w�ada� dwoma ostrzami.");
};