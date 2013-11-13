
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Ancient_Exit (C_INFO)
{
	npc			= DRG_4093_Ancient;
	nr			= 999;
	condition	= DIA_Ancient_Exit_Condition;
	information	= DIA_Ancient_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Ancient_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Ancient_Exit_Info()
{
	B_StopProcessInfos	( self );
};


/**************************************************
 					Jaszczury:
DraconianScout
DraconianSolidier
DraconianOfficer
Draco1
Draco2
Draco3
					
**************************************************/


/*******************************

Pojawia si� po udanej akcji z orkami, gdy Hesstad �yje
******************************/



INSTANCE DIA_Ancient_First (C_INFO)
{
	npc				= DRG_4093_Ancient;
	nr				= 1;
	condition		= DIA_Ancient_First_Condition;
	information		= DIA_Ancient_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Ancient_First_Condition()
{

	if (Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_KnowsInfo (hero, DIA_Hess_Orks2))
	{
		return 1;
	};


};

FUNC VOID DIA_Ancient_First_Info()
{
	var C_NPC liz; liz = Hlp_GetNpc(Liz_4092_Hesstad);
	B_FullStop (hero);
	AI_TurnToNpc(self, liz);

	AI_Output (self, hero, "DIA_Ancient_First_11_01"); //ODPOWIEDZIA�EM NA WASZE WEZWANIE. CO MACIE MI DO ZAOFEROWANIA?
	AI_Output (hero, self, "DIA_Ancient_First_11_02"); //Zabierz nasze nie�miertelne dusze do... domu.
	AI_Output (self, hero, "DIA_Ancient_First_11_03"); //P�ONIE W WAS INNY OGIE�, TA SKAZA ZAMYKA BRAMY WIECZNEGO MIASTA PRZED TWOIMI POBRATYMCAMI, PIERWSZY MIECZU.
	AI_Output (hero, self, "DIA_Ancient_First_11_04"); //Pradawny, wr�cili�my do �ycia, dope�nili�my swego przeznaczenia. Bestia nie �yje!
	AI_Output (self, hero, "DIA_Ancient_First_11_05"); //ALE NIE Z WASZEJ R�KI PAD�A! JAK �MIESZ PRZYW�ASZCZA� SOBIE ZAS�UGI INNYCH!
	AI_Output (hero, self, "DIA_Ancient_First_11_06"); //To prawda, �e nikt z nas nie zada� �miertelnego ciosu. Jednak nie ustali�my w walce, orkowe siedliszcze sp�yn�o krwi�.
	AI_Output (self, hero, "DIA_Ancient_First_11_07"); //WIEM CO SI� WYDARZY�O, NIE UWA�ASZ CHYBA, �E ZABICIE KILKU ORK�W TO ZAS�UGA TAK WIELKA ABY DOST�PI� ZASZCZYTU �YCIA U MEGO BOKU?
	AI_Output (hero, self, "DIA_Ancient_First_11_08"); //Uczynisz co zechcesz, Pradawny. Prosimy tylko o wyzwolenie. Mamy ju� do�� walki i tu�aczki...
	AI_Output (self, hero, "DIA_Ancient_First_11_09"); //PRZEMAWIA PRZEZ CIEBIE �AL, DZIECKO. BY� MO�E WYSTAWI�EM WAS NA ZBYT CIʯK� PR�B�...
	AI_Output (self, hero, "DIA_Ancient_First_11_10"); //BY� MO�E ZBYT WIELE OCZEKIWA�EM PO TWOICH POBRATYMCACH. NIKT NIE JEST TU BEZ WINY.
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Ancient_First_11_11"); //WIDZ� W�R�D WAS LUDZKIE DZIECI�. KIM JEST TEN �MIERTELNIK?
	AI_Output (hero, self, "DIA_Ancient_First_11_12"); //To on zabi� Besti� i sprowadzi� nas do tego �wiata. To dzi�ki niemu pokonali�my ork�w.
	AI_Output (self, other, "DIA_Ancient_First_11_13"); //WIELE ZAS�UG JAK NA TAK W�T�� I NIEDOSKONA�� ISTOT�. PRZEM�W, �MIERTELNIKU.
	AI_Output (other, self, "DIA_Ancient_First_15_14"); //To prawda. Zabi�em Besti� i wspar�em Hesstada w walce z orkami.
	AI_Output (self, other, "DIA_Ancient_First_11_15"); //TO JU� WIEM. DLACZEGO TAK POST�PI�E�?

	Info_ClearChoices (DIA_Ancient_First);
	Info_AddChoice (DIA_Ancient_First, "Dla w�asnej chwa�y.", DIA_Ancient_First_Me);
	Info_AddChoice (DIA_Ancient_First, "Bo tak nale�a�o uczyni�.", DIA_Ancient_First_Hess);
};

// ---------------------------me----------------------------------------

FUNC VOID DIA_Ancient_First_Me()
{
	var C_NPC liz; liz = Hlp_GetNpc(Liz_4092_Hesstad);

	AI_Output (other, self, "DIA_Ancient_First_Me_15_01"); //Dla w�asnej chwa�y.
	AI_Output (self, other, "DIA_Ancient_First_Me_11_02"); //WIELKA TO ZAS�UGA DLA WOJOWNIKA. ROZUMIEM TWOJE POB�DKI.
	AI_Output (self, other, "DIA_Ancient_First_Me_11_03"); //PRZYJMIJ ODE MNIE DAR, KT�RY POMO�E CI W WALCE Z POMIOTEM BELIARA.
	
	/***************
Ork daj tu jakiego� fajnego pfxa + jak�� sta��, wysok� odporno�� na ogie�, �eby gracz si� zastanawia� co wybra�.
**************/
	AI_Output (self, other, "DIA_Ancient_First_Me_11_04"); //JA, NARODZONY W OGNIU STWORZENIA B�OGOS�AWI� TO DZIECI�. OD TEJ CHWILI OGIE� B�DZIE CI� CHRONI� I S�U�Y� CI POMOC�.
	AI_TurnToNpc(self, liz);
	AI_Output (self, other, "DIA_Ancient_First_Me_11_05"); //A WY MOJE DZIECI ODEJDZIECIE WRAZ ZE MN�. WASZA PODRӯ DOBIEG�A KO�CA...

	/**************
w jaki� efektowny spos�b niech wszyscy znikn��
***************/

	Log_SetTopicStatus	(CH5_NON_Lizard, LOG_SUCCESS);
	B_LogEntry		(CH5_NON_Lizard, "Pradawny wraz z jaszczurolud�mi odszed�. Hesstad w ko�cu zazna spokoju. Ojciec Smok�w... Kto by pomy�la�? W ka�dym razie ta istota obdarzy�a mnie odporno�ci� na ogie�.");
	B_StopProcessInfos	(self);
	
	
	
	Npc_ExchangeRoutine	(self, "GO");
	AI_Teleport  (self, "GO");
	
	Npc_ExchangeRoutine	(liz, "GO");
	AI_Teleport  (liz, "GO");	
	B_StopProcessInfos(self);

	

};


// ---------------------------hess----------------------------------------

FUNC VOID DIA_Ancient_First_Hess()
{
	var C_NPC liz; liz = Hlp_GetNpc(Liz_4092_Hesstad);

	AI_Output (other, self, "DIA_Ancient_First_Hess_15_01"); //Bo tak nale�a�o uczyni�.
	AI_Output (self, other, "DIA_Ancient_First_Hess_11_02"); //TO SZLACHETNE S�OWA I DZIWNIE BRZMI� W USTACH CZ�OWIEKA.
	AI_Output (self, other, "DIA_Ancient_First_Hess_11_03"); //ALE WYCZUWAM W TOBIE PRAWO�� I SZLACHETNO�� GODN� ZRODZONEGO W OGNIU.
	AI_Output (self, other, "DIA_Ancient_First_Hess_11_04"); //PRZYJMIJ W PODZI�CE T� RUN�. POMO�E CI W WALCE Z POMIOTEM BELIARA, OCHRONI CI� TE� PRZED Z�OWROG� MAGI�.

	/*******************
ork niech to b�dzie runa z jakim� unikatowym czarem + jaka� odporno�� na magi� - t� run� mo�naby do miecza te� wsadzi�
*******************/


	AI_TurnToNpc(self, liz);
	AI_Output (self, other, "DIA_Ancient_First_Hess_11_05"); //A WY MOJE DZIECI ODEJDZIECIE WRAZ ZE MN�. WASZA PODRӯ DOBIEG�A JU� KO�CA...
	Log_SetTopicStatus	(CH5_NON_Lizard, LOG_SUCCESS);
	B_LogEntry		(CH5_NON_Lizard, "Pradawny wraz z jaszczurolud�mi odszed�. Hesstad w ko�cu zazna spokoju. Ojciec Smok�w... Kto by pomy�la�? W ka�dym razie ta istota podarowa�a mi pot�n� run�.");
	
	Npc_ExchangeRoutine	(self, "GO");
	AI_Teleport  (self, "GO");
	
	Npc_ExchangeRoutine	(liz, "GO");
	AI_Teleport  (liz, "GO");	
	B_StopProcessInfos(self);
};




/*******************************

Pojawia si� po nieudanej akcji z orkami, w momencie kiedy hesstad ginie - czyli mo�e triggera wstaw
******************************/



INSTANCE DIA_Ancient_Dead (C_INFO)
{
	npc				= DRG_4093_Ancient;
	nr				= 2;
	condition		= DIA_Ancient_Dead_Condition;
	information		= DIA_Ancient_Dead_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Ancient_Dead_Condition()
{

	var C_NPC liz; liz = Hlp_GetNpc(Liz_4092_Hesstad);


	if (Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_KnowsInfo (hero, DIA_Hess_HelpOk))&&(Npc_IsDead(liz))
	{
		return 1;
	};


};

FUNC VOID DIA_Ancient_Dead_Info()
{

	B_FullStop (hero);
	AI_Output (self, other, "DIA_Ancient_Dead_11_01"); //NIE DOTRZYMA�E� S�OWA, �MIERTELNIKU!
	AI_Output (other, self, "DIA_Ancient_Dead_15_02"); //Zrobi�em wszystko co w mojej mocy, aby pom�c Hesstadowi. 
	AI_Output (self, other, "DIA_Ancient_Dead_11_03"); //TO ZBYT MA�O! MOJE DZIECI... ZABI�E� ICH SWOJ� IGNORANCJ�!
	AI_Output (other, self, "DIA_Ancient_Dead_15_04"); //Ja nie...
	AI_Output (self, other, "DIA_Ancient_Dead_11_05"); //TERAZ TY ODPOWIESZ ZA ICH �MIER�!

	Info_ClearChoices (DIA_Ancient_Dead);
	Info_AddChoice (DIA_Ancient_Dead, "Ch�do� si� przero�ni�ta jaszczurko!", DIA_Ancient_Dead_Kill);
	Info_AddChoice (DIA_Ancient_Dead, "Masz racj�, zawiod�em.", DIA_Ancient_Dead_True);
	Info_AddChoice (DIA_Ancient_Dead, "Nic nie mog�em zrobi�!", DIA_Ancient_Dead_Weak);

};

// -------------------------------------------------------------------

FUNC VOID DIA_Ancient_Dead_Kill()
{
	AI_Output (other, self, "DIA_Ancient_Dead_Kill_15_01"); //Ch�do� si� przero�ni�ta jaszczurko!
	AI_Output (self, other, "DIA_Ancient_Dead_Kill_11_02"); //ARGH! JAK �MIESZ N�DZNY �MIERTELNIKU!
	AI_Output (self, other, "DIA_Ancient_Dead_Kill_11_03"); //UNU�AM TW�J �WIAT W OGNIU, A TWOJ� DUSZ� ROZERW� NA STRZ�PY...

	/*********************
ork daj jaki� fajny pfx, niech jaszczuroludzie i orkowie sp�on� tak samo dick. jakby ci si� chcia�o i jak si� da to mo�na zrobi� szybki najazd na SO i NO, kt�re te� ton� w ogniu
***********************/


	Log_SetTopicStatus	(CH5_NON_Lizard, LOG_FAILED);
	B_LogEntry		(CH5_NON_Lizard, "Pradawny naprawd� w�ciek� si� za �mier� Hesstada. Mog�em da� z siebie wi�cej...");
	B_StopProcessInfos	(self);

};


// -------------------------------------------------------------------

FUNC VOID DIA_Ancient_Dead_Weak()
{
	AI_Output (other, self, "DIA_Ancient_Dead_Weak_15_01"); //Nic nie mog�em zrobi�!
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_02"); //WI�C JAK ZDO�A�E� ZG�ADZI� BESTI�?
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_03"); //��ESZ �MIERTELNIKU!
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_04"); //NIE ZABIJ� CI�, ALE NAZNACZ� CI� TAK ABY� ZAPAMI�TA� CZYM JEST GNIEW OJCA SMOK�W!

	/*********************
ork daj jaki� fajny pfx, niech jaszczuroludzie i orkowie sp�on�. a dicka niech smok ude�y kul� ognia, dick pada na kolana + zmiana tekstury twarzy na tak� popa�on� + ujemny bonus do obra�e� od ognia mo�e ze 20
***********************/


	Log_SetTopicStatus	(CH5_NON_Lizard, LOG_FAILED);
	B_LogEntry		(CH5_NON_Lizard, "Pradawny naprawd� w�ciek� si� za �mier� Hesstada. Naznaczy� mnie ogniem. Mog�em da� z siebie wi�cej...");
	
	Npc_ExchangeRoutine	(self, "GO");
	AI_Teleport  (self, "GO");	
	
	B_StopProcessInfos	(self);

};


// -------------------------------------------------------------------

FUNC VOID DIA_Ancient_Dead_True()
{
	AI_Output (other, self, "DIA_Ancient_Dead_Weak_15_01"); //Masz racj�, zawiod�em.
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_02"); //DOBRZE, �E ROZUMIESZ SW�J B��D. NIESTETY TO �YCIA MYM DZIECIOM NIE PRZYWR�CI.
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_03"); //JEDNAK ZAPAMI�TAJ, �E OJCIEC SMOK�W JEST SPRAWIEDLIWYM S�DZI�.
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_04"); //POZWOL� CI ODEJ��, ABY� M�G� NAPRAWI� Z�O KT�RE UCZYNI�E�...

	/**************
standardowo jaszczurki i orkowie gin�, smok znika, a dickowi nic si� nie dzieje.
**************/


	Log_SetTopicStatus	(CH5_NON_Lizard, LOG_FAILED);
	B_LogEntry		(CH5_NON_Lizard, "Pradawny naprawd� w�ciek� si� za �mier� Hesstada. Pradawny p�ci� mnie wolno. Mog�em da� z siebie wi�cej...");
	
	Npc_ExchangeRoutine	(self, "GO");
	AI_Teleport  (self, "GO");	
	
	
	B_StopProcessInfos	(self);

};








