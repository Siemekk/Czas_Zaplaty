// **************************************************
// 						 EXIT
// **************************************************
prototype NoName_Exit (C_INFO)
{
	npc			=  Nameless_SecondMeet;
	nr			=  999;
	condition	=  DIA_NoName_Exit_Condition;
	information	=  DIA_NoName_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = DIALOG_ENDE;
};

instance DIA_NoNamer_Exit (NoName_Exit)
{
};

FUNC int  DIA_NoName_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_NoName_Exit_Info()
{
	B_StopProcessInfos(self);
};

instance DIA_NoNamer_Exit2 (NoName_Exit)
{
	npc = Nameless_ThirdMeet;
};

instance DIA_NoNamer_Exit3 (NoName_Exit)
{
	npc = Nameless_ThirdMeetGYD;
};

instance DIA_NoNamer_Exit4 (NoName_Exit)
{
	npc = Nameless_FourthMeet;
};

instance DIA_NoNamer_Exit5 (NoName_Exit)
{
	npc = Nameless_Temple;
};

//--------------------------------------------------------------------------
// Spotkanie po rozmowie z Informatorem ze SO wys�anym przez Urta. Bezi ma si� pojawi� jak informator umrze.
//--------------------------------------------------------------------------
instance  DIA_NoName_Hi (C_INFO)
{
	npc				= Nameless_SecondMeet;
	condition		= DIA_NoName_Hi_Condition;
	information		= DIA_NoName_Hi_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_Hi_Condition()
{
	var C_NPC info; info = Hlp_GetNpc(RBL_4064_Info);

	if (Npc_GetDistToNpc(self,hero) < 2000)&&(Npc_IsDead(Info))
	{
		return 0;
	};
};

FUNC void  DIA_NoName_Hi_Info()
{
	var C_NPC g1; g1 = Hlp_GetNpc(GRD_4065_Guard);
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
	AI_Output (self, other,"DIA_NoName_Hi_Info_15_01"); //Niez�a jatka. Zajm� si� s�ugusami Gomeza.
	AI_Output (other, self,"DIA_NoName_Hi_Info_15_02"); //Nie pozwol�, �eby omin�a mnie taka zabawa...
	B_StopProcessInfos	(self);
	Npc_SetTarget(self,g1);
};

//--------------------------------------------------------------------------

instance  DIA_NoName_HiAgain (C_INFO)
{
	npc				= Nameless_SecondMeet;
	condition		= DIA_NoName_HiAgain_Condition;
	information		= DIA_NoName_HiAgain_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_HiAgain_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1500)&&((Npc_IsDead(GRD_2730_Gardist)+Npc_IsDead(GRD_2731_Gardist)+Npc_IsDead(GRD_2732_Gardist)+Npc_IsDead(GRD_2733_Gardist))>=4)
	{
		return TRUE;
	};
};

FUNC void  DIA_NoName_HiAgain_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
	AI_Output (self, other,"DIA_NoName_HiAgain_Info_15_01"); //I po sprawie.
	AI_Output (self, other,"DIA_NoName_HiAgain_Info_15_02"); //Czy ja ju� Ci� kiedy� nie spotka�em?
	
   if(Npc_KnowsInfo(hero,RBL_2604_Tony_GuardFinal))
	{
		AI_Output (other, self,"DIA_NoName_HiAgain_Info_15_03"); //To chyba Ty za�atwi�e� tego trolla w Obozie Rebeliant�w. Zdaje si�, �e uratowa�e� mi wtedy sk�r�.
		
      B_LogEntry		(CH1_Rbl_NoName, "Ten dziwny skazaniec znowu uratowa� mi ty�ek. Sk�d on si� tutaj wzi��?");
	}
	else
	{
		//crappy dialog, by orcwarrior:
		AI_Output (other, self,"DIA_NoName_HiAgain_Info_15_08"); //Nie przypominam sobie. Zdaje si�, �e w�a�nie uratowa�e� mi sk�r�.
		
      B_LogEntry		(CH1_Rbl_NoName, "Ten dziwny skazaniec uratowa� mi ty�ek. Sk�d on si� tutaj wzi��?");
	};
   
	AI_Output (self, other,"DIA_NoName_HiAgain_Info_15_04"); //Tylko nie m�w tego za g�o�no, bo popsujesz mi reputacj�, he, he.
	AI_Output (other, self,"DIA_NoName_HiAgain_Info_15_05"); //Nie ma sprawy, b�d� milcza� jak gr�b. Mimo wszystko... Dzi�ki.
	AI_Output (self, other,"DIA_NoName_HiAgain_Info_15_06"); //Powodzenia na szlaku.
	AI_Output (other, self,"DIA_NoName_HiAgain_Info_15_07"); //Bywaj.
	
   CreateInvItem(self,ItArScrollTeleport1);

	B_StopProcessInfos	(self);

	/****************
Niech Bezio gdzie� p�jdzie
******************/

	Npc_ExchangeRoutine(self,"INVISIBLE");
};

//--------------------------------------------------------------------------

/******************
Bezio w obozie rbl�
*******************/

instance  DIA_NoName_RBL1 (C_INFO)
{
	npc				= Nameless_ThirdMeet;
	condition		= DIA_NoName_RBL1_Condition;
	information		= DIA_NoName_RBL1_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_RBL1_Condition()
{
	return TRUE;
};

FUNC void  DIA_NoName_RBL1_Info()
{
	AI_TurnToNpc(other, self);
	AI_Output (self, other,"DIA_NoName_RBL1_Info_15_01"); //Witaj. M�g�by� mi powiedzie� co� o tym obozie?
	AI_Output (other, self,"DIA_NoName_RBL1_Info_15_02"); //Je�eli nie musisz, to si� tutaj nie kr��. To niezbyt bezpieczne miejsce.
	AI_Output (self, other,"DIA_NoName_RBL1_Info_15_03"); //Potrafi� o siebie zadba�.
	AI_Output (other, self,"DIA_NoName_RBL1_Info_15_04"); //Nie m�wi�, �e nie. Rebelianci to paskudna banda, a ��czy ich tylko jeden cel - wykopa� Gomeza z Kolonii.
	AI_Output (self, other,"DIA_NoName_RBL1_Info_15_05"); //To mamy sporo wsp�lnego. Rozejrz� si� po obozie, mo�e znajd� co� do roboty.
	AI_Output (other, self,"DIA_NoName_RBL1_Info_15_06"); //Powodzenia.

	B_LogEntry		(CH1_Rbl_NoName, "Bezimienny skazaniec w ko�cu trafi� do obozu rebeliant�w. Chyba nie tylko ja ci�gle wtykam nos w nie swoje sprawy...");
	B_StopProcessInfos	(self);
};

//--------------------------------------------------------------------------

instance  DIA_NoName_RBL2 (C_INFO)
{
	npc				= Nameless_ThirdMeet;
	condition		= DIA_NoName_RBL2_Condition;
	information		= DIA_NoName_RBL2_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcia�by� co� zarobi�?";
};

FUNC int  DIA_NoName_RBL2_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_NoName_RBL1))&&(Npc_KnowsInfo (hero,DIA_Roderic_OldNote1))&&(!Npc_KnowsInfo (hero,Info_OrcGhost_Kill))
	{
		return TRUE;
	};
};

FUNC void  DIA_NoName_RBL2_Info()
{
	AI_Output (other, self,"DIA_NoName_RBL2_Info_15_01"); //Chcia�by� co� zarobi�?
	AI_Output (self, other,"DIA_NoName_RBL2_Info_15_02"); //Pewnie. M�w o co chodzi.
	AI_Output (other, self,"DIA_NoName_RBL2_Info_15_03"); //Czeka mnie spacerek na stare cmentarzysko ork�w...
	AI_Output (self, other,"DIA_NoName_RBL2_Info_15_04"); //Wiem gdzie to jest, ju� tam by�em. Obawiam si�, �e nie znajdziesz tam nic ciekawego.
	AI_Output (other, self,"DIA_NoName_RBL2_Info_15_05"); //A ja si� obawiam, �e jednak mo�esz si� myli�.
	AI_Output (other, self,"DIA_NoName_RBL2_Info_15_06"); //Zap�ac� Ci... 200 bry�ek. Wi�c jak b�dzie?
	AI_Output (self, other,"DIA_NoName_RBL2_Info_15_07"); //Daj mi chwil� na zastanowienie.
	
   B_LogEntry		(CH1_Rbl_NoName, "Zapyta�em Bezimiennego, czy nie chcia�by przej�� si� ze mn� na cmentarzysko ork�w. Powiedzia�, �e musi si� chwil� zastanowi�.");
	B_StopProcessInfos	(self);
};

//--------------------------------------------------------------------------

instance  DIA_NoName_RBL3 (C_INFO)
{
	npc				= Nameless_ThirdMeet;
	condition		= DIA_NoName_RBL3_Condition;
	information		= DIA_NoName_RBL3_Info;
	important		= 0;
	permanent		= 0;
	description		= "Idziesz?";
};

FUNC int  DIA_NoName_RBL3_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_NoName_RBL2))&&(!Npc_KnowsInfo (hero,Info_OrcGhost_Kill))
	{
		return TRUE;
	};
};

FUNC void  DIA_NoName_RBL3_Info()
{
	AI_Output (other, self,"DIA_NoName_RBL3_Info_15_01"); //Idziesz?
	AI_Output (self, other,"DIA_NoName_RBL3_Info_15_02"); //Dobra, chod� za mn�.

	/*******************
Bezio przy��cza si� do Dicka
*******************/
	B_LogEntry		(CH1_Rbl_NoName, "Bezimienny wyruszy ze mn� na cmentarzysko ork�w.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOWGYD");
	B_StopProcessInfos	(self);
};

instance  DIA_NoName_RBL3_2 (C_INFO)
{
	npc				= Nameless_ThirdMeet;
	condition		= DIA_NoName_RBL3_2_Condition;
	information		= DIA_NoName_RBL3_2_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_RBL3_2_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_NoName_RBL3))&&(Npc_GetDistToWP(self,"OW_PATH_198_ORCGRAVEYARD8")<1000)
	{
		return TRUE;
	};
};

var int nameless_enterGYD;

FUNC void  DIA_NoName_RBL3_2_Info()
{
	AI_Output (self, other,"DIA_NoName_RBL3_2_Info_15_01"); //No to jeste�my na miejscu.
	AI_Output (other, self,"DIA_NoName_RBL3_2_Info_15_02"); //Dobra, otworz� bram�.
	nameless_enterGYD=TRUe;

	B_LogEntry		(CH1_Rbl_NoName, "Dotarli�my na cmentarzysko ork�w, ciekawe co nas czeka w �rodku.");
	Party_RemoveNpc(self);
	B_StopProcessInfos	(self);
};

instance  DIA_NoName_RBL3_3_1 (C_INFO)
{
	npc				= Nameless_ThirdMeetGYD;
	condition		= DIA_NoName_RBL3_3_1_Condition;
	information		= DIA_NoName_RBL3_3_1_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_RBL3_3_1_Condition()
{
	if (Npc_GetDistToWP(hero,"GRYD_003")<700)
	{
		return 1;
	};
};

FUNC void  DIA_NoName_RBL3_3_1_Info()
{
	AI_Output (other, self, "DIA_NoName_RBL3_3_1_Info_15_01"); //Ciemno tutaj.
	AI_Output (self, other, "DIA_NoName_RBL3_3_1_Info_15_02"); //We� to, b�dziesz chocia� widzia�, w co wpychasz miecz.
	Npc_SetTarget(self,self);
	AI_ReadySpell			(self,	SPL_LIGHT,	1);
	AI_PlayAni(self,"T_MAGRUN_2_SLESHOOT");
	Wld_PlayEffect("SPELLFX_LIGHT_ACTIVE", self, self, 1, 0, DAM_MAGIC, FALSE);
	AI_PlayAni(self,"T_SLESHOOT_2_STAND");
	AI_UnReadySpell			(self);

	CreateInvItems(self,ItArSCrollLight,5);
	B_GiveInvItems(self,other,ItArSCrollLight,5);
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOWGYDIN");
	B_StopProcessInfos	(self);
};

instance DIA_NoName_RBL3_3 (C_INFO)
{
	npc				= Nameless_ThirdMeetGYD;
	condition		= DIA_NoName_RBL3_3_Condition;
	information		= DIA_NoName_RBL3_3_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_RBL3_3_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_NoName_RBL3_2))&&(Npc_GetDistToWP(hero,"GRYD_054")<2000)
	{
		return 1;
	};
};

FUNC void  DIA_NoName_RBL3_3_Info()
{
	AI_Output (self, other,"DIA_NoName_RBL3_3_Info_15_01"); //Co teraz?
	AI_Output (other, self,"DIA_NoName_RBL3_3_Info_15_02"); //Nie wiem, ale na prawo nie ma nic ciekawego.
	AI_Output (other, self,"DIA_NoName_RBL3_3_Info_15_03"); //Mo�e spr�bujmy wdrapa� si� wy�ej.

	B_LogEntry		(CH1_Rbl_NoName, "Jedyna sensowna mo�liwo�� to wdrapa� si� na g�r�.");
	B_StopProcessInfos	(self);
};
//--------------------------------------------------------------------------

instance  DIA_NoName_RBL4 (C_INFO)
{
	npc				= Nameless_ThirdMeetGYD;
	condition		= DIA_NoName_RBL4_Condition;
	information		= DIA_NoName_RBL4_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_RBL4_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_NoName_RBL3))&&(Npc_KnowsInfo (hero,Info_OrcGhost_Kill))&&(Npc_GetDistToNpc(self,hero) < 2000)
	{
		return TRUE;
	};
};

FUNC void  DIA_NoName_RBL4_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
   
	AI_Output (self, other,"DIA_NoName_RBL4_Info_15_01"); //Na mnie ju� czas. Posz�o ca�kiem g�adko.
	AI_Output (other, self,"DIA_NoName_RBL4_Info_15_02"); //Dzi�ki za pomoc, chocia� pewnie poradzi�bym sobie sam.
	AI_Output (self, other,"DIA_NoName_RBL4_Info_15_03"); //Tak, tak, felczer kaza� przytakiwa�...
	AI_Output (self, other,"DIA_NoName_RBL4_Info_15_04"); //A teraz moje 200 bry�ek ci�ko zarobionej rudy.
	
   if (NPC_HasItems(other,ItMiNugget)>=200)
	{
		AI_Output (other, self,"DIA_NoName_RBL4_Info_15_05"); //No, nie wiem... Przecie� nic takiego nie zrobi�e�.
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_06"); //Widz�, �e ci�ko Ci si� rozsta� z rud�. Mam Ci w tym pom�c?
		AI_Output (other, self,"DIA_NoName_RBL4_Info_15_07"); //No dobra, bierz.
		B_GiveInvItems (other, self, ItMiNugget, 200);
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_08"); //Dzi�ki, brachu. To by� �atwy zarobek. Powodzenia na szlaku.
	}
	else
	{
		AI_Output (other, self,"DIA_NoName_RBL4_Info_15_10"); //Ekhm... Jakby Ci to powiedzie�...
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_11"); //Tylko mi nie m�w, �e nie masz marnych 200 bry�ek!
		AI_Output (other, self,"DIA_NoName_RBL4_Info_15_12"); //No, s�k w tym, �e nie mam.
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_13"); //Cholera mog�em sprawdzi� przed wyruszeniem w drog� z takim go�odupcem.
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_14"); //Niech b�dzie. Tym razem Ci podaruj�.
		AI_Output (other, self,"DIA_NoName_RBL4_Info_15_15"); //Obgadamy to w karczmie, o ile tam zagl�dasz.
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_16"); //Czemu nie. Trzymam Ci� za s�owo. Powodzenia na szlaku.
	};
   
   AI_Output (other, self,"DIA_NoName_RBL4_Info_15_09"); //Wzajemnie.
   
	B_LogEntry		(CH1_Rbl_NoName, "No i po sprawie. W sumie Bezimienny jest dobrym kompanem. Mo�e warto to kiedy� powt�rzy�?");
	/*******************
	Bezio od��cza si� od Dicka, nie wiem gdzie ma i��, wi�c to twoja dzia�a Ork
	*******************/
	Party_RemoveNpc(self);
   
	Hero_GotoGYD = 2;
	removeNamelessFromWorldZen = true;
	Npc_ExchangeRoutine(self,"INVISIBLEGRYD");
	B_StopProcessInfos	(self);
};

/***********************

Wyst�py Beziego

0. Trol. V
1. Informator. V
2. Kopalnia. V
3. przed cmentarzem w trakcie misji z rodneyem - pojawi si� jak mamy i�� na cmentarz. V

x. �wi�tynia �piocha. V

**************************/


