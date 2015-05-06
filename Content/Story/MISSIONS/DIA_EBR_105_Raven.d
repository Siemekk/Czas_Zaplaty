// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "Kim jeste�?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Nazywam si� Kruk. Jestem praw� r�k� Gomeza. 
	AI_Output (self, other,"DIA_Raven_Who_10_02"); //Ka�dy, kto chce si� spotka� z szefem, musi najpierw porozmawia� ze mn�.
};

// **************************************

instance DIA_Raven_Wait (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 2;
	condition	= DIA_Raven_Wait_Condition;
	information	= DIA_Raven_Wait_Info;
	permanent		= 0;
	important		= 1;
	description	= "";
};                       

FUNC int DIA_Raven_Wait_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_Who))&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Wait_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (self, other,"DIA_Raven_Wait_10_01"); //Jeszcze z Tob� nie sko�czy�em.
	AI_GotoNpc(other,self);
	AI_Output (other, self,"DIA_Raven_Wait_15_02"); //Ale mo�e ja nie mam ochoty na dalsz� rozmow�.
	AI_Output (self, other,"DIA_Raven_Wait_10_03"); //Akurat to, ch�opcze jest ma�o wa�ne.
	AI_Output (self, other,"DIA_Raven_Wait_10_04"); //Tym razem nie obij� Ci pyska za bezczelno��.
	AI_Output (other, self,"DIA_Raven_Wait_15_05"); //Zbytek �aski.
	AI_Output (self, other,"DIA_Raven_Wait_10_06"); //Szukam kogo� w�cibskiego i zaradnego, a Ty na kogo� takiego wygl�dasz.
	AI_Output (other, self,"DIA_Raven_Wait_15_07"); //Nie jestem zainteresowany.
	AI_Output (self, other,"DIA_Raven_Wait_10_08"); //Wyt�umacz� to inaczej...
	
   AI_DrawWeapon (self);
	B_StopProcessInfos(self);
	B_StartAfterDialogFight(self, other, false);
};

// **************************************

var int raven_wait;

instance DIA_Raven_After (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 3;
	condition	= DIA_Raven_After_Condition;
	information	= DIA_Raven_After_Info;
	permanent		= 0;
	important		= 1;
	description	= "";
};                       

FUNC int DIA_Raven_After_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_Wait))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_After_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Raven_After_10_01"); //Dotar�o w ko�cu do Ciebie, �e ze mn� nie ma �art�w?
	AI_Output (other, self,"DIA_Raven_After_15_02"); //Skoro musisz, m�w o co chodzi.
	AI_Output (self, other,"DIA_Raven_After_10_03"); //Tak jest du�o lepiej i nie boli, prawda?
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other,"DIA_Raven_After_10_04"); //S�uchaj uwa�nie. Dostarczysz co� ode mnie komu�, kto na to czeka. Znajdziesz go na Placu Wymian.
	AI_Output (self, other,"DIA_Raven_After_10_05"); //I �adnych pyta�. Idziesz, wracasz, zachowujesz �ycie. Skrewisz - umrzesz.
	AI_Output (self, other,"DIA_Raven_After_10_06"); //Jasne?
	AI_PlayAni(other,"T_YES");
   Create_and_give(Raven_bottle, 1);
	AI_Output (self, other,"DIA_Raven_After_10_07"); //We� t� butelk�, tylko jej nie zgub!
	AI_Output (self, other,"DIA_Raven_After_10_08"); //Na co czekasz? Masz na to jeden dzie�!
	raven_wait = B_SetDayTolerance()+1;
	Log_CreateTopic(CH2_RBL_Lighthouse, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Lighthouse, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Lighthouse, "Pozna�em prawdziwe oblicze Kruka - kawa� z niego skurwiela. Nie mam wyboru, musz� dostarczy� t� butelk� komu� na Placu Wymian. Mam na to jeden dzie�. Swoj� drog� ciekawe co w tej butelce jest?");
   
   wld_insertnpc(Grd_4126_Kraken, "OW_PATH_1_16_8");
};

instance DIA_Raven_Letter (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 4;
	condition		= DIA_Raven_Letter_Condition;
	information		= DIA_Raven_Letter_Info;
	permanent		= 0;
	important		= 0;
	description		= "Sprawa z przesy�k� zako�czona.";
};                       

FUNC int DIA_Raven_Letter_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_KRAKEN_Raven))||(raven_list)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Letter_Info()
{
	AI_Output (other, self,"DIA_Raven_Letter_15_01"); //Sprawa z przesy�k� zako�czona.

	if (raven_wait >= Wld_GetDay())
	{
		AI_Output (self, other,"DIA_Raven_Letter_10_02"); //Zagl�da�e� do butelki?
      
		if (raven_list)
		{
			AI_Output (other, self,"DIA_Raven_Letter_15_03"); //Nie... Ja...
			AI_Output (self, other,"DIA_Raven_Letter_10_04"); //Mo�e kolejne lanie nauczy Ci�, �e nie czyta si� cudzej korespondencji!
			Log_SetTopicStatus(CH2_RBL_Lighthouse, LOG_FAILED);
			B_LogEntry(CH2_RBL_Lighthouse, "Ten Kruk to straszne bydl�. Nie chc� mie� z nim nic wsp�lnego.");
			AI_DrawWeapon(self);
			B_StopProcessInfos(self); 
			B_StartAfterDialogFight(self,other,false);
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_Letter_15_05"); //Nie jestem idiot�. Butelk� dosta� Kraken w idealnym stanie.
			AI_Output (self, other,"DIA_Raven_Letter_10_06"); //Tak, wiem. Zapami�tam Twoj� twarz, mo�e kiedy� jeszcze si� przydasz.
			Log_SetTopicStatus(CH2_RBL_Lighthouse, LOG_SUCCESS);
			B_LogEntry(CH2_RBL_Lighthouse, "Zadanie zako�czone. Mam dziwne przeczucie, �e powinienem trzyma� si� od Kruka jak najdalej.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Raven_Letter_10_07"); //Sp�ni�e� si� gnoju!
		AI_Output (self, other,"DIA_Raven_Letter_10_08"); //Mo�e kolejne lanie czego� Ci� nauczy...
		Log_SetTopicStatus(CH2_RBL_Lighthouse, LOG_FAILED);
		B_LogEntry(CH2_RBL_Lighthouse, "Ten Kruk to straszne bydl�. Nie chc� mie� z nim nic wsp�lnego.");
		AI_DrawWeapon (self);
		B_StopProcessInfos(self); 
		B_StartAfterDialogFight(self,other,false);
	};
};

//********Hrabia + mag + orle gniazdo*********************

var int raven_ok;
var int Hrabia_RavenTrap;
instance DIA_Raven_Mag (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 5;
	condition		= DIA_Raven_Mag_Condition;
	information		= DIA_Raven_Mag_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dosz�y mnie s�uchy, �e szukasz maga.";
};                       

FUNC int DIA_Raven_Mag_Condition()
{
	return Hrabia_RavenTrap;
};

FUNC VOID DIA_Raven_Mag_Info()
{
	AI_Output (other, self,"DIA_Raven_Mag_15_01"); //Dosz�y mnie s�uchy, �e szukasz maga.

	if (Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) <= 3) && (hero.guild == GIL_MAG)
	{
		AI_Output (self, other,"DIA_Raven_Mag_10_02"); //Nie szukam adepta, tylko prawdziwego maga. Wr�� jak czego� si� nauczysz.
		B_LogEntry(CH1_Rbl_Hrabia, "Musz� bardziej zg��bi� magiczn� wiedz�. Kruk potrzebuje do�wiadczonego maga.");
	}
	else
	{
		raven_ok = TRUE;
		AI_Output (self, other,"DIA_Raven_Mag_10_03"); //My�l�, �e sprostasz moim wymaganiom.
		AI_Output (self, other,"DIA_Raven_Mag_10_04"); //Sprawa jest prosta. Zabior� Ci� w pewne miejsce, a Ty wym�wisz s�owa inkantacji. 
		AI_Output (other, self,"DIA_Raven_Mag_15_05"); //P�atne z g�ry.
		AI_Output (self, other,"DIA_Raven_Mag_10_06"); //Niech b�dzie, wr�� do mnie, jak b�dziesz got�w.
		B_LogEntry(CH1_Rbl_Hrabia, "Sprawa za�atwiona. Mam wr�ci� do Kruka jak b�d� got�w.");
	};
};

//****************************

instance DIA_Raven_MagAgain (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 6;
	condition		= DIA_Raven_MagAgain_Condition;
	information		= DIA_Raven_MagAgain_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nadal szukasz maga?";
};                       

FUNC int DIA_Raven_MagAgain_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_Mag))&&(raven_ok == FALSE )&&(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) >= 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_MagAgain_Info()
{
	raven_ok = TRUE; 
	AI_Output (other, self,"DIA_Raven_MagAgain_15_01"); //Nadal szukasz maga?
	AI_Output (self, other,"DIA_Raven_MagAgain_10_02"); //My�l�, �e sprostasz moim wymaganiom.
	AI_Output (self, other,"DIA_Raven_MagAgain_10_03"); //Sprawa jest prosta. Zabior� Ci� w pewno miejsce, a Ty wym�wisz s�owa inkantacji. 
	AI_Output (other, self,"DIA_Raven_MagAgain_15_04"); //P�atne z g�ry.
	AI_Output (self, other,"DIA_Raven_MagAgain_10_05"); //Niech b�dzie, wr�� do mnie, jak b�dziesz got�w.
	B_LogEntry(CH1_Rbl_Hrabia, "Sprawa za�atwiona. Mam wr�ci� do Kruka, jak b�d� got�w.");
};

//****************************

instance DIA_Raven_MagAgainReadyReady (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 6;
	condition		= DIA_Raven_MagAgainReady_Condition;
	information		= DIA_Raven_MagAgainReady_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jestem got�w.";
};                       

FUNC int DIA_Raven_MagAgainReady_Condition()
{
	if ((Npc_KnowsInfo (hero,DIA_Raven_MagAgain))||(Npc_KnowsInfo (hero,DIA_Raven_Mag)))&&(raven_ok == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_MagAgainReady_Info()
{
	raven_ok = TRUE; 
	AI_Output (other, self,"DIA_Raven_MagAgainReady_15_01"); //Jestem got�w.
	AI_Output (self, other,"DIA_Raven_MagAgainReady_10_02"); //W porz�dku. St�j blisko mnie...

	/****************************
Ork niech Kruk teleportuje Dicka i siebie do Orlego Gniazda, daj tu te� demona na dziedziniec tam gdzie si� pojawi�. Oczywi�cie demona ma ich zaatakowa� - stw�rz tak� mocniejsz� wersj� lorda demona RavenDemonLord.
Ork zmie� mu te� w tym momencie pancerz na ten kruka z G2 NK
****************************/

	B_LogEntry(CH1_Rbl_Hrabia, "No to czeka mnie ostra jazda...");
   Raven_teleport_to_EN = true;
   Wld_InsertNpc(RavenDemonLord, "NC_EN_MAINPATH_03");
};

//****************************
// TODO: Porz�dny cinematic znacznie ciekawszy, napewno lepiej sie sprawdzi
//****************************
instance DIA_Raven_Castle (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 7;
	condition		= DIA_Raven_Castle_Condition;
	information		= DIA_Raven_Castle_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};                       

FUNC int DIA_Raven_Castle_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Raven_MagAgainReadyReady))&&(Npc_GetDistToWP(self,"NC_EN_MAINPATH_05") < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Castle_Info()
{
	B_FullStop (hero);
   B_FullStop (hrabia);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Raven_Castle_10_01"); //Nie obawiaj si� demona. To m�j...
	AI_TurnToNpc(self, RavenDemonLord);
	AI_Output (self, other,"DIA_Raven_Castle_10_02"); //Co do cholery?!
	AI_Output (other, self,"DIA_Raven_Castle_15_03"); //Musimy go zabi�!
	B_StopProcessInfos(self);
   
   self.flags = NPC_FLAG_IMMORTAL;
   AI_GotoWP(self, "NC_EN_MAINPATH_04");
   B_ExchangeRoutine(hrabia, "WaitInEN");
   AI_Teleport(hrabia, "NC_EN_TAVERN_03");
};

//****************************

instance DIA_Raven_Castle1 (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 7;
	condition		= DIA_Raven_Castle1_Condition;
	information		= DIA_Raven_Castle1_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};                       

FUNC int DIA_Raven_Castle1_Condition()
{
	var C_NPC demi; demi = Hlp_GetNpc(RavenDemonLord);

	if (Npc_KnowsInfo (hero, DIA_Raven_Castle))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_IsDead(demi))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Castle1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Raven_Castle1_10_01"); //Nie rozumiem, jak to si� mog�o sta�.
	AI_Output (other, self,"DIA_Raven_Castle1_15_02"); //Takie rzeczy si� zdarzaj�. Demony to niestabilne istoty...
	AI_Output (self, other,"DIA_Raven_Castle1_10_03"); //Nie o tym m�wi�em. Wydaje mi si�, �e jednak �le Ci� oceni�em.
	AI_Output (other, self,"DIA_Raven_Castle1_15_04"); //Tak?
	AI_Output (self, other,"DIA_Raven_Castle1_10_05"); //�eby przygotowa� tak� zasadzk� trzeba mie� jaja.
	AI_Output (other, self,"DIA_Raven_Castle1_15_06"); //Sk�d...
	AI_Output (self, other,"DIA_Raven_Castle1_10_07"); //Powiedzmy, �e Beliar szepcze mi do ucha. Zacznijmy od tego �ywotnego sukinsyna.
	AI_TurnToNpc(self, hrabia);
	AI_Output (self, other,"DIA_Raven_Castle1_10_08"); //Wyjd� z ukrycia, przyjacielu!
	B_StopProcessInfos	(self);

	/***********************

Niech hrabia wyjdzie z ukrycia gdzie� na �rodek dziedzi�ca...

**********************/
   AI_Teleport(hrabia, "NC_EN_MAINPATH_04");
   B_ExchangeRoutine(hrabia, "death");
   AI_SetWalkmode (hrabia, NPC_RUN); 
	AI_GotoWP(hrabia, "NIA_INSPECT");
};

//****************************

instance DIA_Raven_CastleCount (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition		= DIA_Raven_CastleCount_Condition;
	information		= DIA_Raven_CastleCount_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};                       

FUNC int DIA_Raven_CastleCount_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_Castle1)) && (Npc_GetDistToWP(hrabia, "NIA_INSPECT") < 500) && (Npc_GetDistToWP(self, "NIA_INSPECT") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_CastleCount_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, hrabia);

	AI_Output (self, other,"DIA_Raven_CastleCount_10_01"); //�ywotne z Ciebie bydl�. Ale z tym nie wygrasz.
	AI_Output (self, other,"DIA_Raven_CastleCount_10_02"); //Wzywam Ci� BELIARZE. Uka� temu g�upcowi SW� pot�g�!
	
   B_StopProcessInfos(self);
	Snd_Play ("FoundRiddler");	
	Wld_PlayEffect("spellFX_Thunderstorm", self, hrabia, 1, 0, DAM_MAGIC, FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, hrabia, 1, 0, DAM_MAGIC, FALSE);
	AI_PlayAni(hrabia, "T_PSI_VICTIM");
	Npc_ChangeAttribute(hrabia, ATR_HITPOINTS, -hrabia.attribute[ATR_HITPOINTS_MAX]);
   self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
};

//****************************

instance DIA_Raven_CastleFight (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 9;
	condition		= DIA_Raven_CastleFight_Condition;
	information		= DIA_Raven_CastleFight_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};                       

FUNC int DIA_Raven_CastleFight_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_CastleCount))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_IsDead(hrabia))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_CastleFight_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);

	AI_Output (self, other,"DIA_Raven_CastleFight_10_01"); //Teraz Twoja kolej. Zobaczmy co� wart...
	AI_DrawWeapon (self);
	AI_GotoNpc(self, other);
	B_LogEntry(CH1_Rbl_Hrabia, "Hrabia nie �yje. Musz� sam stawi� czo�a Krukowi!");
   B_ClearIMMORTAL(Ebr_105_Raven);
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self, other, true);
   Raven_fights_Rick = true;
};

//****************************

instance DIA_Raven_CastleFightAfter (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 10;
	condition		= DIA_Raven_CastleFightAfter_Condition;
	information		= DIA_Raven_CastleFightAfter_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};                       

FUNC int DIA_Raven_CastleFightAfter_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_CastleFight))&&(!Raven_fights_Rick)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_CastleFightAfter_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Raven_CastleFightAfter_10_01"); //Zaskoczy�e� mnie...
	AI_Output (other, self,"DIA_Raven_CastleFightAfter_15_02"); //Daj mi jeszcze chwil�. Wypruj� Ci flaki i nic Ci� ju� nie zaskoczy.
	AI_Output (self, other,"DIA_Raven_CastleFightAfter_10_03"); //Wola�bym nie. Mam inne plany. Mam nadziej�, �e ju� si� nie spotkamy.
	AI_Output (other, self,"DIA_Raven_CastleFightAfter_15_04"); //Tch�rz! Nigdy wi�cej nie wchod� mi w drog�!
	Log_SetTopicStatus(CH1_Rbl_Hrabia, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Hrabia, "Hrabia sko�czy� tak jak �y�, czyli z mieczem w r�ku. Mo�e to i dobrze... A Kruk najzwyczajniej w �wiecie zwia�. Mam nadziej�, �e ju� go nie spotkam.");
	/********************
Ork Kruk ma znikn��, nie poart�w do SO tylko gdzie� gdzie gracze nie maj� dost�pu. Mo�e ten placyk nad Placem wymian sk�d Bezia wrzucili do Kolonii.

*********************/
   Raven_teleport_to_hidden = true;
   
   Npc_ExchangeRoutine(self,"Hidden");
   B_StopProcessInfos(self); 
};
