
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Bukhart_Exit (C_INFO)
{
	npc			= Non_4021_Bukhart;
	nr			= 999;
	condition	= DIA_Bukhart_Exit_Condition;
	information	= DIA_Bukhart_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Bukhart_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bukhart_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Bukhart_Hello (C_INFO)
{
	npc				= Non_4021_Bukhart;
	nr				= 1;
	condition		= DIA_Bukhart_Hello_Condition;
	information		= DIA_Bukhart_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Bukhart_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Bukhart_Hello_Info()
{
	AI_Output (self, other, "DIA_Bukhart_Hello_11_01"); //Kto Ci� tu do ci�kiej cholery wpu�ci�?!
	AI_Output (other, self, "DIA_Bukhart_Hello_15_02"); //Znajomy z obozu rebeliant�w opowiedzia� mi o �owcach trolli, wi�c przyszed�em przekona� si� na w�asne oczy, czy te wszystkie opowie�ci nie s� przesadzone.
	AI_Output (self, other, "DIA_Bukhart_Hello_11_03"); //�owcy trolli? Co za idiotyczna nazwa. A co do opowie�ci, to nie znam �adnej, kt�ra ko�czy�a by si� dobrze dla trolla, he, he.
	AI_Output (self, other, "DIA_Bukhart_Hello_11_04"); //Witaj w naszym 'os�awionym' obozie. Tylko nie w�a� nikomu w drog�, bo szkoda by by�o takiego �licznego ch�opczyka poharata�.
	AI_Output (other, self, "DIA_Bukhart_Hello_15_05"); //Potrafi� o siebie zadba�.
	AI_Output (self, other, "DIA_Bukhart_Hello_11_06"); //Po�yjemy, zobaczymy. Bywaj.
	
   B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Bukhart_Thief (C_INFO)
{
	npc				= Non_4021_Bukhart;
	nr				= 2;
	condition		= DIA_Bukhart_Thief_Condition;
	information		= DIA_Bukhart_Thief_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nie przeszkadzam?"; 
};

FUNC INT DIA_Bukhart_Thief_Condition()
{
	if (Burhart_Doing_Bad)&&(Npc_KnowsInfo (hero,DIA_Snow_WhatOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_Thief_Info()
{
	B_GiveXP (250);
   
	AI_Output (other, self, "DIA_Bukhart_Thief_15_01"); //Nie przeszkadzam?
	
   B_SmartTurnToNpc	(self, other);
	
   AI_Output (self, other, "DIA_Bukhart_Thief_11_02"); //Niech Ci� szlag, ale mnie nastraszy�e�... Co ty tu robisz o tej porze?
	AI_Output (other, self, "DIA_Bukhart_Thief_15_03"); //Czekam na z�odzieja zapas�w. I wiesz co? Chyba w�a�nie go znalaz�em.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_04"); //Cholerny Snow Ci� wynaj��? Mia�em go na oku, nie przyszed�bym tu, gdyby ten cwaniak nie poszed� spa�.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_05"); //Najwidoczniej nie przewidzia�e� wszystkiego. Snow si� ucieszy, kiedy powiem, kogo tutaj spotka�em.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_06"); //To nie jest to, na co wygl�da. Poza tym lepiej by by�o, jakby� trzyma� j�zyk za z�bami.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_07"); //Grozisz mi?
	AI_Output (self, other, "DIA_Bukhart_Thief_11_08"); //Widzisz, nie skubi� Snowa dla krotochwili czy z g�odu. To bardziej skomplikowane ni� my�lisz.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_09"); //M�w, mam czas.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_10"); //No dobra.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_11"); //Ta zdzira zakaza�a nam... pi� przed akcj�.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_12"); //Co?! Kobieta nie pozwala wam pi�?! I wy jej s�uchacie?!
	AI_Output (self, other, "DIA_Bukhart_Thief_11_13"); //Nie znasz Kiry. Ona jest jak cholerna dziwka Beliara. Potrafi dopiec do �ywego i to nie tylko j�zykiem.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_14"); //Chyba tylko Tablor da�by jej rad� na miecze, ale on jest zbyt honorowy, by skrzy�owa� or� z kobiet�.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_15"); //Ju� kilka razy pr�bowali�my go podpu�ci�, ale za ka�dym razem spra� nas p�azem - cholerny rycerzyk.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_16"); //Snow znowu jest uparty jak w� i ma te, no... zasady. Nie pozwala nam zbli�a� si� do zapas�w, wszystkie racje rozdziela sam.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_17"); //Butelka piwa dziennie! Przecie� to si� nie mie�ci w g�owie!
	AI_Output (other, self, "DIA_Bukhart_Thief_15_18"); //Rzeczywi�cie, nie zazdroszcz� wam. Kto by pomy�la�, s�awni �owcy trolli zastraszeni przez jedn� kobiet�.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_19"); //Dlatego kradn� zapasy Snowa. Oczywi�cie ginie wszystko pr�cz alkoholu.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_20"); //Korth ma uk�ad z jakim� handlarzem, wymiana towarowa. �apiesz?
	AI_Output (other, self, "DIA_Bukhart_Thief_15_21"); //Skradzione zapasy, za piwo, wino i w�d�. Chyba rozumiem.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_22"); //A dlaczego Kira zakaza�a wam pi�?
	AI_Output (self, other, "DIA_Bukhart_Thief_11_23"); //G�upia sprawa.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_24"); //Poszli�my na ostatni� robot� po ostrej popijawie. Ledwo widzia�em na oczy, Korth mia� kaca, a Postronek zerzyga� si� na cieniostwora, he, he.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_25"); //Tropili�my trolla. Pech chcia�, �e napatoczyli�my si� na ca�� cholern� rodzink�.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_26"); //Cztery trolle, a my byli�my tak wstawieni, ze ledwie je zauwa�yli�my.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_27"); //Gdyby nie Kira i Tablor, to pewnie by�my stamt�d nie wr�cili.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_28"); //Hmm, ale z tego wynika, �e Kira dobrze zrobi�a.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_29"); //Mo�e i dobrze, ale to by� cios poni�ej pasa. Wola�bym ju� rzuci� si� na trolla z go�ymi r�kami, ni� usycha� z pragnienia.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_30"); //Dziewczyna chce �eby�cie d�u�ej po�yli, bo od waszej... kondycji zale�y te� i jej �ycie.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_31"); //Nie potrzebuj� kaznodzieja. Wiem o tym, ale �ycie bez piwa...
	AI_Output (other, self, "DIA_Bukhart_Thief_15_32"); //W porz�dku, us�ysza�em ju� wszystko, co mnie interesowa�o.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_33"); //Cholera, Korth mnie zabije.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_34"); //Pogadam z nim, mo�e jako� si� dogadamy.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_35"); //Ale musz� powiedzie� Snowowi, �e to Twoja robota. Przemilcz� tylko spraw�... motyw�w.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_36"); //Wiem, wiem, s�owo nie dym. Dobra, to w sumie moja wina, �e da�em si� dorwa� i to jeszcze jakiemu� ��todziobowi.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_37"); //Powodzenia na szlaku.
	
   B_LogEntry		(CH2_TRL_Thief, "Znalaz�em z�odzieja. Okaza� si� nim Bukhart. Jednak jego motywy... No nic powinienem pogada� z Korthem, mo�e uda si� co� wymy�li�. Czas powiedzie� Snowowi, kto okrada� go z zapas�w.");
	B_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"Start");
};

var int bukhart_price;

// **************************************************
INSTANCE DIA_Bukhart_Trol (C_INFO)
{
	npc				= Non_4021_Bukhart;
	nr				= 3;
	condition		= DIA_Bukhart_Trol_Condition;
	information		= DIA_Bukhart_Trol_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Bukhart_Trol_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 500)&&(Npc_KnowsInfo (hero,DIA_Tablor_Talk))
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_Trol_Info()
{
	B_FullStop (hero);
	
   AI_Output (self, other, "DIA_Bukhart_Trol_11_01"); //Hej, Ty. Zaczekaj...
	
   if  (C_BodystateContains(self, BS_SIT))
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self,	hero);
	};
		//AI_TurnToNpc (other, self);
	AI_GotoNpc(self, other);
	AI_Output (other, self, "DIA_Bukhart_Trol_15_02"); //Co chcesz? Spiesz� si�...
	AI_Output (self, other, "DIA_Bukhart_Trol_11_03"); //Mam dla Ciebie pewn� propozycj�.
	AI_Output (other, self, "DIA_Bukhart_Trol_15_04"); //Streszczaj si�.
	
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_Bukhart_Trol_11_05"); //Podobno Tablor za��da� od Ciebie jakiej� sk�ry.

	if (tablor_trol== TRUE)&&(tablor_beast==FALSE)
	{
		AI_Output (other, self, "DIA_Bukhart_Trol_15_06"); //Zgodzi�em si� przynie�� mu sk�r� trolla.
	}
	else if (tablor_shadow == TRUE)&&(tablor_beast==FALSE)
	{
		AI_Output (other, self, "DIA_Bukhart_Trol_15_07"); //Tak, zedr� dla niego sk�r� z cieniostwora.
	} 
	else if ((tablor_shadow == TRUE)||(tablor_trol== TRUE))&&(tablor_beast==TRUE)
	{
		AI_Output (other, self, "DIA_Bukhart_Trol_15_08"); //To ju� nieaktualne.
		AI_Output (self, other, "DIA_Bukhart_Trol_11_09"); //Ujm� to tak - je�eli chcesz, �ebym nie nagada� Kirze na Tw�j temat jaki� g�upot, to za��my, �e ta kwestia nadal jest aktualna.
	};
   
	AI_Output (other, self, "DIA_Bukhart_Trol_15_10"); //A co Tobie do tego?
	AI_Output (self, other, "DIA_Bukhart_Trol_11_11"); //Tylko to, �e przypadkiem mam na zbyciu sk�r� trolla.
	AI_Output (self, other, "DIA_Bukhart_Trol_11_12"); //Namy�l si�. Po co si� m�czy�, po co nara�a� �ycie, skoro mo�esz kupi� 'ciep�y towar' za kilka n�dznych bry�ek.
	AI_Output (other, self, "DIA_Bukhart_Trol_15_13"); //A ile ten 'ciep�y towar' kosztuje?

	if (bukhart_trait == TRUE)&&(Npc_KnowsInfo (hero,DIA_Snow_Find))
	{
		AI_Output (self, other, "DIA_Bukhart_Trol_11_14"); //Wypapla�e� Snowowi to, co obieca�e� zachowa� dla siebie.
		AI_Output (self, other, "DIA_Bukhart_Trol_11_15"); //Cholerni hipokryci p�ac� podw�jnie - 2000 bry�ek rudy!
		
      bukhart_price = 1;
	}
	else if (bukhart_trait == FALSE)&&(Npc_KnowsInfo (hero,DIA_Snow_Find))
	{
		AI_Output (self, other, "DIA_Bukhart_Trol_11_16"); //Nie b�d� z Ciebie zdziera�, nie zdradzi�e� Snowowi mojego sekretu.
		AI_Output (self, other, "DIA_Bukhart_Trol_11_17"); //Wystarczy 1000 bry�ek rudy, przyjacielu.
		
      bukhart_price = 2;
	}
	else //if (bukhart_trait == FALSE)&&(Npc_KnowsInfo (hero,DIA_Snow_Find))
	{
		AI_Output (self, other, "DIA_Bukhart_Trol_11_18"); //Jak dla Ciebie niech b�dzie... 1500 bry�ek rudy.
		
      bukhart_price = 3;
	};
   
	AI_Output (other, self, "DIA_Bukhart_Trol_15_19"); //Ale z Ciebie zdzierca - musz� si� nad tym zastanowi�.
	AI_Output (self, other, "DIA_Bukhart_Trol_11_20"); //Przemy�l to i pami�taj, �e szepn� za Tob� Kirze s�odkie s��wko do uszka tylko wtedy, jak kupisz sk�r�.
	AI_Output (self, other, "DIA_Bukhart_Trol_11_21"); //A teraz wracaj ju� do tych swoich spraw.

	Log_CreateTopic	(CH2_TRL_TrolFure, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_TrolFure, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_TrolFure, "Nie ma to jak szanta�. Bukhart poprze mnie przed Kir�, je�eli kupi� od niego sk�r� trolla. Chyba nie mam wyboru...");
	B_StopProcessInfos (self);
};

var int Bukhart_TrollSkin;

INSTANCE DIA_Bukhart_Trol2 (C_INFO)
{
	npc				= Non_4021_Bukhart;
	nr				= 4;
	condition		= DIA_Bukhart_Trol2_Condition;
	information		= DIA_Bukhart_Trol2_Info;
	permanent		= 1;
	important		= 0;
	description		= "Kupi� sk�r� trolla."; 
};

FUNC INT DIA_Bukhart_Trol2_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Tablor_Talk)) && (!Bukhart_TrollSkin)
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_Trol2_Info()
{
	AI_Output (other, self, "DIA_Bukhart_Trol2_15_01"); //Kupi� sk�r� trolla.

	if (bukhart_price == 1)&&(NPC_HasItems(other,ItMiNugget)>=2000)
	{
		TH_trust = TH_trust + 1;
		Bukhart_TrollSkin = true;
		B_GiveXP (200);
		B_GiveInvItems (other, self, ItMiNugget, 2000);
      
		AI_Output (self, other, "DIA_Bukhart_Trol2_11_02"); //Interesy z Tob� to prawdziwa przyjemno��.
		AI_Output (other, self, "DIA_Bukhart_Trol2_15_03"); //W tym wypadku jednostronna. Daj t� wylinia�� sk�r� i pami�taj, co przyrzek�e�.
		
      CreateInvItems (self, ItAt_TrollSkin,1); 	
		B_GiveInvItems (self, other, ItAt_TrollSkin, 1);
		
      AI_Output (self, other, "DIA_Bukhart_Trol2_11_04"); //Bez obaw, Kira dowie si� jaki to z Ciebie cudowny ch�opiec, he, he.
		
      Log_SetTopicStatus	(CH2_TRL_TrolFure, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_TrolFure, "Za poparcie Bukharta musia�em s�ono zap�aci�, bo a� 2000 bry�ek - mog�em jednak trzyma� j�zyk za z�bami, kiedy rozmawia�em ze Snowem.");
		B_LogEntry(CH2_TRL_Quest, "Zdoby�em popracie Bukharta za 2000 bry�ek...");
	}
	else if (bukhart_price == 2)&&(NPC_HasItems(other,ItMiNugget)>=1000)
	{
		TH_trust = TH_trust + 1;
		Bukhart_TrollSkin = true;
		B_GiveXP (500);
		B_GiveInvItems (other, self, ItMiNugget, 1000);
		
      AI_Output (self, other, "DIA_Bukhart_Trol2_11_05"); //To by�a naprawd� niska cena, zdoby�em t� sk�r� z nara�eniem �ycia.
		AI_Output (other, self, "DIA_Bukhart_Trol2_15_06"); //Tak, oczywi�cie. Daj to futro i szepnij Kirze o mnie co� mi�ego.
		
      CreateInvItems (self, ItAt_TrollSkin,1); 	
		B_GiveInvItems (self, other, ItAt_TrollSkin, 1);
		AI_Output (self, other, "DIA_Bukhart_Trol2_11_07"); //Bez obaw, dodam kilka pikantnych szczeg��w - nie zdziw si�, jak Kira od razu si� na Ciebie rzuci, he, he.
		Log_SetTopicStatus	(CH2_TRL_TrolFure, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_TrolFure, "Poparcie Bukharta kosztowa�o mnie 1000 bry�ek i to tylko dzi�ki temu, �e nie zdradzi�em Snowowi jego sekretu.");
		B_LogEntry(CH2_TRL_Quest, "Bukhart szepnie Kirze o mnie kilka s��w poparcia.");
	}
	else if (bukhart_price == 3)&&(NPC_HasItems(other,ItMiNugget)>=1500)
	{
		TH_trust = TH_trust + 1;
		Bukhart_TrollSkin = true;
		B_GiveXP (300);
		B_GiveInvItems (other, self, ItMiNugget, 1500);
		
      AI_Output (self, other, "DIA_Bukhart_Trol2_11_08"); //Sk�ra jest w dobrym stanie, ta ruda cho� po cz�ci zrekompensuje mi trudy jej zdobycia.
		AI_Output (other, self, "DIA_Bukhart_Trol2_15_09"); //Bardzo mnie to cieszy - niech Kira te� si� o tym dowie.
		
      CreateInvItems (self, ItAt_TrollSkin,1); 	
		B_GiveInvItems (self, other, ItAt_TrollSkin, 1);
		
      AI_Output (self, other, "DIA_Bukhart_Trol2_11_10"); //O to si� nie b�j, ju� ja wiem, co jej powiedzie�.
		
      Log_SetTopicStatus	(CH2_TRL_TrolFure, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_TrolFure,"No c� 1500 bry�ek za wylinia�� sk�r� i poparcie u Kiry - Bukhart nie�le si� ceni.");
		B_LogEntry(CH2_TRL_Quest, "Bukhart szepnie Kirze o mnie kilka s��w poparcia.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bukhart_Trol2_11_11"); //Nie ma rudy, nie ma sk�ry.
	};
   
	B_StopProcessInfos (self);
};