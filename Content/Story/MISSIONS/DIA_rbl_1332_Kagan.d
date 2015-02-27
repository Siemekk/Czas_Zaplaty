// **************************************************
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "Jeste� z obozu Sekty, nieprawda�?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello1_15_00"); //Jeste� z obozu Sekty, nieprawda�?
	AI_Output			(self, other,"DIA_BaalKagan_Hello1_13_01"); //By�em, ale ju� nie nale�� do �wir�w z bagna.
	AI_Output			(self, other,"DIA_BaalKagan_Hello1_13_02"); //Jestem Baal Kagan, znaczy bez tego Baal. A �ni�cy to kawa�ek cuchn�cego g�wna.
};

// ************************************************************
// 						Warum hier
// ************************************************************
//TODO: Sher, albo poprawic tresc dialogu albo zostawic wywalony, logiczna calosc to to narazie nie jest
INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Co tu robisz?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Kiedy� werbowa�em nowych do Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Ale to dawne dzieje. Teraz zajmuj� si� wy��cznie sprzeda�� ziela.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Palenie ziela to do�� popularne zaj�cie w tych stronach. Mo�e nawet zbyt popularne. Ledwie nad��am z kolejnymi dostawami.

	Log_CreateTopic	(GE_TraderOR,	LOG_NOTE);
	B_LogEntry		(GE_TraderOR,	"Baal Kagan sprzedaje ma�e porcje ziela w obozie.");
};


// ************************************************************
// 						TRADE
// ************************************************************
INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "Poka� mi co masz do zaoferowania.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Poka�, co masz do zaoferowania.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Jak sobie �yczysz.
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	important	= 1;	
	permanent	= 0;
	description = "";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_01"); //Zaczekaj chwilk�. Jest co� o czym chcia�bym z Tob� porozmawia�.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_02"); //M�w.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_03"); //To do�� delikatna sprawa...
	AI_PlayAni (self, "T_SEARCH");
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_04"); //Spotka�e� ju� Baal Tarana?
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Greet))
	{
		AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_05"); //Tak.
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_06"); //Jeszcze nie.
	};
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_07"); //A wi�c ta menda...
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_08"); //Menda? Przecie� pochodzicie z tego samego obozu.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_09"); //To stare dzieje. Teraz liczy si� tylko to, �eby przetrwa�.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_10"); //A �eby przetrwa� trzeba mie� za co �y�.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_11"); //A �eby mie� za co �y� trzeba zarabia�.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_12"); //A �eby zarabia� trzeba co� sprzeda�.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_13"); //A �eby co�...
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_14"); //Sko�cz ju� z t� wyliczank�. M�w o co chodzi!
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_15"); //Taran robi mi konkurencj�.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_16"); //M�wisz o handlu zielem?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_17"); //Tak, do cholery. Przecie� nie o kr�ceniu ty�kiem!
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_18"); //Chyba wiem do czego zmierzasz. Moja odpowied� brzmi - NIE. Nie wypruj� mu flak�w tylko dlatego, �e sprzedaje ziele.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_19"); //Spokojnie, wysnu�e� zbyt pochopne wnioski. A kto m�wi o zabijaniu?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_20"); //Wystarczy, �e Taran zrazi do siebie klient�w. Ja ju� zajm� si� reszt�.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_21"); //Co mia�bym zrobi�?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_22"); //Taran sam nie zbiera ziela. Jego dostawca to pustelnik Gilbert.
	if (!Npc_KnowsInfo(hero,DIA_Gilbert_First))
	{
		AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_23"); //Gdzie go znajd�?
		AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_24"); //W tym w�a�nie tkwi problem. Nie mam bladego poj�cia.
		AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_25"); //Musisz odnale�� Gilberta.
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_26"); //Wiem gdzie mieszka.
		AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_27"); //To �wietnie!
	};
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_28"); //Powiesz temu staremu pacanowi, �e przyszed�e� po dostaw� dla Tarana.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_29"); //Gilbert albo Taran nie b�d� nic podejrzewa�?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_30"); //Gilbert to ju� Tw�j problem. Co do Tarana... Cz�owieku on jest ca�y czas zabakany w trupa! Nie odr�ni�by w s�oneczny dzie� go�ej dupy od mordy orka.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_31"); //No dobra. I co dalej?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_32"); //Kiedy dostaniesz paczk� od Gilberta najpierw przyniesiesz j� do mnie, a ja troch� doprawi� ziele.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_33"); //P�niej zaniesiesz paczk� Taranowi.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_34"); //To wszystko?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_35"); //Tak, m�wi�em, �e dla kogo� takiego jak Ty to �aden wysi�ek.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_36"); //Tylko musisz paczk� najpierw przynie�� mi. Je�eli zaniesiesz j� od razu do Tarana, to m�j misterny plan szlag trafi.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_37"); //No dobra, a co ja b�d� z tego mia�?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_38"); //Zap�ac� Ci... 300 bry�ek.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_39"); //To za ma�o.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_40"); //No dobra niech b�dzie 400, ale ani bry�ki wi�cej!
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_41"); //Nie o tym my�la�em. Dasz mi udzia� w zyskach.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_42"); //Chyba za mocno uderzy�e� si� w g�ow�!
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_43"); //Udzia� w zyskach albo Taran o wszystkim si� dowie. Ciekawe co wtedy powiedz� rebelianci, kt�rzy kupuj� ziele? My�l�, �e raczej Twoja popularno�� od tego nie wzro�nie.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_44"); //Ale z ciebie skurwiel! Niech b�dzie. Dostaniesz udzia� w utargu. Powiedzmy... 10 procent.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_45"); //Mam lepszy pomys�. Odpalisz mi 20 procent co 10 dni. 
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_46"); //Ty...
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_47"); //Uwa�aj na s�owa, je�eli lubisz sw�j j�zyk.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_48"); //Niech Ci� szlag! Dobra, przynie� mi t� cholern� paczk�. Zaczynam �a�owa�, �e wda�em si� z Tob� w interesy...

	Log_CreateTopic		(CH2_RBL_Stuff,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Stuff,	LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Stuff, "A ludzie m�wi�, �e ruda nie le�y na ziemi. Pomog� Kaganowi pozby� si� konkurencji, czyli Baal Tarana w zamian za 20-procentowy udzia� w zyskach. Rud� b�d� odbiera� co 10 dni. Musz� mu tylko dostarczy� paczk� ziela od niejakiego Gilberta.");	
};


// ************************************************************

INSTANCE DIA_BaalKagan_StuffHave (C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 3;
	condition	= DIA_BaalKagan_StuffHave_Condition;
	information	= DIA_BaalKagan_StuffHave_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mam przesy�k� od Gilberta.";
};                       

FUNC INT DIA_BaalKagan_StuffHave_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gilbert_Stuff1))&&(Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))&&(NPC_HasItems(other,package_stuff)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_StuffHave_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_StuffHave_15_01"); //Mam przesy�k� od Gilberta.
	AI_Output			(self, other,"DIA_BaalKagan_StuffHave_13_02"); //Nareszcie. Daj ziele, to je doprawi�...
	B_GiveInvItems (other, self, package_stuff, 1);
	Ai_Wait (self,2);	
	B_GiveInvItems (self, other, package_stuff, 1);
	AI_Output			(self, other,"DIA_BaalKagan_StuffHave_13_03"); //W porz�dku, gotowe. Zanie� paczk� Baal Taranowi z pozdrowieniami od Gilberta.
	AI_Output			(other, self,"DIA_BaalKagan_StuffHave_15_04"); //Bez obaw. Zaraz po tym wr�c� po sw�j udzia�.
	B_LogEntry		(CH2_RBL_Stuff, "Mam ju� doprawion� paczk� ziela. Czas odda� j� Baal Taranowi.");
};

var int kagan_pay;

// ************************************************************

INSTANCE DIA_BaalKagan_StuffHave1 (C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 4;
	condition	= DIA_BaalKagan_StuffHave1_Condition;
	information	= DIA_BaalKagan_StuffHave1_Info;
	important	= 0;	
	permanent	= 0;
	description = "Zrobi�em swoje, czas odebra� zap�at�.";
};                       

FUNC INT DIA_BaalKagan_StuffHave1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Stuff))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_StuffHave1_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_StuffHave1_15_01"); //Zrobi�em swoje, czas odebra� zap�at�.
	AI_Output			(self, other,"DIA_BaalKagan_StuffHave1_13_02"); //Nie tak szybko. Wr�� za 10 dni, wtedy dostaniesz swoj� dol�.
	AI_Output			(other, self,"DIA_BaalKagan_StuffHave1_15_03"); //Mo�esz by� pewien, �e o tym nie zapomn�.

	kagan_pay = B_SetDayTolerance()+10;
	Log_SetTopicStatus	(CH2_RBL_Stuff,	LOG_SUCCESS);
	B_LogEntry		(CH2_RBL_Stuff,	"Sprawa za�atwiona. Musz� tylko pami�ta�, �eby wraca� co tydzie� po swoj� dol�.");
};

// ************************************************************

INSTANCE DIA_BaalKagan_StuffHave2 (C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 5;
	condition	= DIA_BaalKagan_StuffHave2_Condition;
	information	= DIA_BaalKagan_StuffHave2_Info;
	important	= 0;	
	permanent	= 1;
	description = "Chyba co� mi si� nale�y.";
};                       

FUNC INT DIA_BaalKagan_StuffHave2_Condition()
{
	//TODO: Kiedys trzeba zatrzyma� ta nieustanna machine zarabiania kasy
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Stuff))&&(kagan_pay <= (Wld_GetDay()))&&(kagan_pay!=0)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_StuffHave2_Info()
{	
	//Jako ze zmniejszona zostala zaplata dla Tarana z 800 na 300
	//to zmniejszam rownie� troche kase ktora wyp�aca Kagan.
   AI_Output			(other, self,"DIA_BaalKagan_StuffHave2_15_01"); //Chyba co� mi si� nale�y.
   
	if(Aloes_Creation==TRUE)&&(Taran_300ore)
	{
		AI_Output			(self, other,"DIA_BaalKagan_StuffHave2_13_02"); //Taran przej�� ostatnio wi�kszo�� moich klient�w, ledwo starcza mi rudy na jedzenie.
		AI_Output			(self, other,"DIA_BaalKagan_StuffHave2_13_03"); //Nie mam nic dla Ciebie.
		kagan_pay=0;
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_StuffHave2_13_02"); //Zabieraj swoj� dol� i zejd� mi z oczu, krwiopijco!
		CreateInvItems (self, ItMiNugget, 100);
		B_GiveInvItems (self, other, ItMiNugget, 100);
	};
   
	kagan_pay = B_SetDayTolerance()+10;
};

// ************************************************************

INSTANCE DIA_BaalKagan_Hanis (C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 6;
	condition	= DIA_BaalKagan_Hanis_Condition;
	information	= DIA_BaalKagan_Hanis_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mam pytanie.";
};                       

FUNC INT DIA_BaalKagan_Hanis_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Quentin_Hanis1))&&(Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_Hanis_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hanis_15_01"); //Mam pytanie.
	AI_Output			(self, other,"DIA_BaalKagan_Hanis_13_02"); //Jakie?
	AI_Output			(other, self,"DIA_BaalKagan_Hanis_15_03"); //Masz na sprzeda� jaki� specyfik, po kt�rym cz�owiek wpada w sza�?
	AI_Output			(self, other,"DIA_BaalKagan_Hanis_13_04"); //Hmm. Znam tylko jedn� tak� ro�lin�. To kl�twa berserkera.
	AI_Output			(self, other,"DIA_BaalKagan_Hanis_13_05"); //Bardzo rzadkie ziele. 
	AI_Output			(other, self,"DIA_BaalKagan_Hanis_15_06"); //Komu� je sprzeda�e�?
	AI_Output			(self, other,"DIA_BaalKagan_Hanis_13_07"); //Jaki� czas temu Kharim pyta� mnie o podobny specyfik. Akurat znalaz�em ziele na orkowym cmentarzu. Sporo za nie zap�aci�, wi�c o nic wi�cej nie pyta�em.
	AI_Output			(other, self,"DIA_BaalKagan_Hanis_15_08"); //Bardzo mi pomog�e�. Bywaj.

	B_LogEntry		(CH2_RBL_Mem, "To Baal Kagan sprzeda� Kharimowi kl�tw� berserkera - ziele, po kt�rym cz�owiek wpada w sza�. W ko�cu mam dowody na to, �e Gor Hanis jest niewinny. Musz� porozmawia� z Ratfordem.");
};

// **************************************************

INSTANCE DIA_rbl_1332_baalkagan_Stew (C_INFO)
{
	npc				= rbl_1332_baalkagan;
	nr				= 12;
	condition		= DIA_rbl_1332_baalkagan_Stew_Condition;
	information		= DIA_rbl_1332_baalkagan_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Twoja porcja pysznego gulaszu, smacznego."; 
};

FUNC INT DIA_rbl_1332_baalkagan_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1332_baalkagan_Stew_Info()
{
	fox_stew = fox_stew + 1;
	//TODO: Sher FIX Needed. anotha' crappy dialog created by orc
	
	AI_Output (other, self, "DIA_rbl_1332_baalkagan_Stew_15_01"); //Twoja porcja pysznego gulaszu, smacznego.
	AI_Output (self, other, "DIA_rbl_1332_baalkagan_Stew_11_02"); //S�uchaj no, dawaj swoj� porcje, bo inaczej to b�d� ostatnie s�owa w twoim �yciu.
	AI_Output (other, self, "DIA_rbl_1332_baalkagan_Stew_15_03"); //Och, doprawdy?
	AI_Output (self, other, "DIA_rbl_1332_baalkagan_Stew_11_04"); //Nie cholera, �artowa�em, dwie porcje to dawka �miertelna.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Kagana trzymaj� si� �arty, mimo tego �e musia� zje�� swoj� porcje."); 
};

// **************************************************

INSTANCE DIA_rbl_1332_baalkagan_Aloes (C_INFO)
{
	npc				= rbl_1332_baalkagan;
	nr				= 12;
	condition		= DIA_rbl_1332_baalkagan_Aloes_Condition;
	information		= DIA_rbl_1332_baalkagan_Aloes_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrafisz przyrz�dzi� mikstur� z aloesu?"; 
};

FUNC INT DIA_rbl_1332_baalkagan_Aloes_Condition()
{
	if (NPC_HasItems(other,aloes)>=1)&&(aloes_find)&& (!Npc_KnowsInfo (hero, DIA_rbl_1331_baaltaran_Aloes))
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1332_baalkagan_Aloes_Info()
{
	//crappy dialog created by orc
	AI_Output (other, self, "DIA_rbl_1332_baalkagan_Aloes_15_01"); //Potrafisz przyrz�dzi� mikstur� z aloesu?
	AI_Output (self, other, "DIA_rbl_1332_baalkagan_Aloes_11_02"); //Nie, ale Taran na pewno da sobie rad�, pomaga� kiedy� przygotowywa� guru mikstury pozwalaj�ce na kontakt ze �ni�cym.
}; 
