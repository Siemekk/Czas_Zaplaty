
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snow_Exit (C_INFO)
{
	npc			= Non_4024_Snow;
	nr			= 999;
	condition	= DIA_Snow_Exit_Condition;
	information	= DIA_Snow_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Snow_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snow_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Snow_Hello (C_INFO)
{
	npc				= Non_4024_Snow;
	nr				= 1;
	condition		= DIA_Snow_Hello_Condition;
	information		= DIA_Snow_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Paskudne miejsce."; 
};

FUNC INT DIA_Snow_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Snow_Hello_Info()
{
	AI_Output (other, self, "DIA_Snow_Hello_15_01"); //Paskudne miejsce.
	AI_Output (self, other, "DIA_Snow_Hello_11_02"); //M�wisz o Kolonii czy o naszym zacnym obozie?
	AI_Output (other, self, "DIA_Snow_Hello_15_03"); //A co to za r�nica?
	AI_Output (self, other, "DIA_Snow_Hello_11_04"); //Racja, �adna. Skoro ju� tutaj w�ciubi�e� nos, to b�d� mia� dla Ciebie pewn� propozycj�.
	AI_Output (self, other, "DIA_Snow_Hello_11_05"); //Ale najpierw pogadaj z szefow�, ona lubi wita� nowych... cz�onk�w.
	AI_Output (other, self, "DIA_Snow_Hello_15_06"); //Szefow�?!
	AI_Output (self, other, "DIA_Snow_Hello_11_07"); //Niewa�ne, cholera znowu zepsu�em niespodziank�.
	
   B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Snow_What (C_INFO)
{
	npc				= Non_4024_Snow;
	nr				= 2;
	condition		= DIA_Snow_What_Condition;
	information		= DIA_Snow_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl�dasz jakby� wdepn�� w spore �ajno."; 
};

FUNC INT DIA_Snow_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Snow_Hello))&&(TH_trust >= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Snow_What_Info()
{
	AI_Output (other, self, "DIA_Snow_What_15_01"); //Wygl�dasz jakby� wdepn� w spore �ajno.
	AI_Output (self, other, "DIA_Snow_What_11_02"); //Mo�na tak powiedzie�. Jestem odpowiedzialny za zaopatrzenie w tym cholernym obozie.
	AI_Output (self, other, "DIA_Snow_What_11_03"); //Ci�gle wszystkiego brakuje. Jestem pewien, �e kt�ry� z tych sukinsyn�w z obozu zakrada si� noc� do sk�adziku i zwija zapasy.
	AI_Output (self, other, "DIA_Snow_What_11_04"); //Ju� kilka razy pr�bowa�em si� zaczai� na z�odzieja, ale musia� mie� mnie na oku.
	AI_Output (other, self, "DIA_Snow_What_15_05"); //Mam propozycj�.
	AI_Output (self, other, "DIA_Snow_What_11_06"); //M�w.
	AI_Output (other, self, "DIA_Snow_What_15_07"); //Przyby�em tu, �eby zaproponowa� Kirze sojusz przeciwko Gomezowi. Twoja szefowa powiedzia�a, �e najpierw musi sprawdzi�, co jestem wart, zanim podejmie decyzj�.
	AI_Output (self, other, "DIA_Snow_What_11_08"); //I s�usznie. Zawsze stali�my z boku i nigdy nie anga�owali�my si� w konflikty mi�dzy obozami. To nie nasza sprawa.
	AI_Output (self, other, "DIA_Snow_What_11_09"); //Ale skoro Kira chce da� Ci szans�, to czemu nie. Jak j� znam, to pewnie nie robi tego bezinteresownie.
	AI_Output (other, self, "DIA_Snow_What_15_10"); //Co masz na my�li?
	AI_Output (self, other, "DIA_Snow_What_11_11"); //Kira to wredna suka. Niech Ci� nie zwiod� pozory urody i rzeczowo�ci.
	AI_Output (self, other, "DIA_Snow_What_11_12"); //Jak my�lisz, dlaczego baba m�wi kilku facetom i orkowi co maj� robi�?
	AI_Output (other, self, "DIA_Snow_What_15_13"); //Mo�e ci faceci nie maj� jaj...
	AI_Output (self, other, "DIA_Snow_What_11_14"); //Bardzo �mieszne, ale lepiej tego nie powtarzaj przy innych.
	AI_Output (self, other, "DIA_Snow_What_11_15"); //Wr��my jednak do Twojej propozycji. O Kirze mo�emy pogada� p�niej.
	AI_Output (other, self, "DIA_Snow_What_15_16"); //Pomog� Ci rozwi�za� problem ze z�odziejem.
	AI_Output (self, other, "DIA_Snow_What_11_17"); //Bezinteresownie?
	AI_Output (other, self, "DIA_Snow_What_15_18"); //Niezupe�nie. Kira kaza�a mi zdoby� wasz� przychylno��.
	AI_Output (self, other, "DIA_Snow_What_11_19"); //Rozumiem. W porz�dku, Ty pomo�esz mi, ja pomog� Tobie. Brzmi uczciwie.
	AI_Output (other, self, "DIA_Snow_What_15_20"); //Opowiedz mi wszystko, co wiesz o tym z�odzieju.
	AI_Output (self, other, "DIA_Snow_What_11_21"); //Zakrada si� noc� do magazynku. Zabiera g��wnie �arcie, ale czasami te� inne przedmioty, takie kt�re �atwo sprzeda� w Kolonii, albo wymieni�.
	AI_Output (self, other, "DIA_Snow_What_11_22"); //To musi by� kto� z nas. Wiem tylko, �e to nie jest Korth, bo on ci�gle �l�czy na warcie.
};

// **************************************************

var int snow_day;
var int snow_compleated;

INSTANCE DIA_Snow_WhatOk (C_INFO)
{
	npc				= Non_4024_Snow;
	nr				= 3;
	condition		= DIA_Snow_WhatOk_Condition;
	information		= DIA_Snow_WhatOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "W porz�dku, przypilnuj� magazynku."; 
};

FUNC INT DIA_Snow_WhatOk_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Snow_What))
	{
		return 1;
	};
};

FUNC VOID DIA_Snow_WhatOk_Info()
{
	var C_NPC buk; buk = Hlp_GetNpc(Non_4021_Bukhart);
	snow_compleated = 0;
	
   AI_Output (other, self, "DIA_Snow_WhatOk_15_01"); //W porz�dku, przypilnuj� magazynku.
	AI_Output (self, other, "DIA_Snow_WhatOk_11_02"); //�wietnie.
	
   if (Wld_IsTime (20,00,06,00))
	{
		AI_Output (self, other, "DIA_Snow_WhatOk_11_03"); //W takim razie id� do siebie. Wr�c� o �wicie.
	}
	else
	{
		AI_Output (self, other, "DIA_Snow_WhatOk_11_04"); //Wr�� wi�c o zmierzchu i miej oko na zapasy.
	};
   
   Npc_ExchangeRoutine(self,"GO_HOME");//zmiana standardowej rutyny pojdzie do chaty o 20 i b�dzie tam do 6

	Log_CreateTopic	(CH2_TRL_Thief, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Thief, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Thief, "Snow jest kwatermistrzem w obozie �owc�w trolli i ma problemy ze z�odziejem, kt�ry noc� wykrada zaopatrzenie. Je�eli chc� zdoby� jego przychylno��, to musz� dowiedzie� si�, kim jest z�odziej. Powinienem poczeka� w nocy, w pobli�u magazynku i przy�apa� z�odzieja na gor�cym uczynku.");

	snow_day = B_SetDayTolerance()+1;
	B_StopProcessInfos (self);
	B_ExchangeRoutine(buk,"Thief");
};

INSTANCE DIA_Snow_Perm (C_INFO)
{
	npc				= Non_4024_Snow;
	nr				= 4;
	condition		= DIA_Snow_Perm_Condition;
	information		= DIA_Snow_Perm_Info;
	permanent		= 1;
	important		= 0;
	description		= "Jak tam zapasy? Nadal gin�?"; 
};

FUNC INT DIA_Snow_Perm_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Snow_WhatOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Snow_Perm_Info()
{
	AI_Output (other, self, "DIA_Snow_Perm_15_01"); //Jak tam zapasy? Nadal gin�?

	if (snow_day<= (Wld_GetDay()))&&(snow_compleated == 0)
	{
		snow_day = B_SetDayTolerance()+1;
		AI_Output (self, other, "DIA_Snow_Perm_11_02"); //Ty sukinsynie, mia�e� przypilnowa� sk�adziku! Znowu co� zgin�o.
      
		if (Wld_IsTime (20,00,06,00))
		{
			AI_Output (self, other, "DIA_Snow_Perm_11_03"); //Rusz dup� i przypilnuj skrzy�, jak mnie nie b�dzie.
		}
		else
		{
			AI_Output (self, other, "DIA_Snow_Perm_11_04"); //Wr�� tu wieczorem i capnij tego cwaniaka!
		};
	}
	else if (snow_compleated == 1)
	{
		AI_Output (self, other, "DIA_Snow_Perm_11_05"); //Dzi�ki za pomoc, ju� wszystko w porz�dku.
		DIA_Snow_Perm.permanent = 0;
	}
   else
   {
      AI_Output (self, other, "DIA_Snow_Perm_11_06"); //A z�apa�e� z�odzieja? Nie, wi�c wr�� wieczorem i przyczaj si� gdzie�.
   };

	B_StopProcessInfos (self);
};
// **************************************************

INSTANCE DIA_Snow_Find (C_INFO)
{
	npc				= Non_4024_Snow;
	nr				= 5;
	condition		= DIA_Snow_Find_Condition;
	information		= DIA_Snow_Find_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz�em tego z�odziejaszka."; 
};

FUNC INT DIA_Snow_Find_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Bukhart_Thief))&&(snow_compleated == 0)
	{
		return 1;
	};
};

FUNC VOID DIA_Snow_Find_Info()
{
	B_GiveXP (250);
	trol_cmp_trust = trol_cmp_trust + 1;
	snow_compleated = 1;
   
	AI_Output (other, self, "DIA_Snow_Find_15_01"); //Znalaz�em tego z�odziejaszka.
	AI_Output (self, other, "DIA_Snow_Find_11_02"); //Kto?
	AI_Output (other, self, "DIA_Snow_Find_15_03"); //To Bukhart majstrowa� przy zapasach.
	AI_Output (self, other, "DIA_Snow_Find_11_04"); //Cholerny ochlej. Pewnie szuka� piwska. Hmm, tylko �e alkohol nigdy nie zgin��...
	AI_Output (self, other, "DIA_Snow_Find_11_05"); //Wi�c czego on tam szuka�?

	Info_ClearChoices (DIA_Snow_Find);
	Info_AddChoice (DIA_Snow_Find, "To nie takie proste.", DIA_Snow_Find_Yes);
	Info_AddChoice (DIA_Snow_Find, "Nie mam poj�cia.", DIA_Snow_Find_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Snow_Find_Yes()
{
	TH_trust = TH_trust + 1;
	bukhart_trait = TRUE;
	snow_know = TRUE;
   
	AI_Output (other, self, "DIA_Snow_Find_Yes_15_06"); //To nie takie proste.
	AI_Output (self, other, "DIA_Snow_Find_Yes_11_07"); //Bukhart to idiota, ale pewnie nie dzia�a� sam. Mam racj�?
	AI_Output (other, self, "DIA_Snow_Find_Yes_15_08"); //Tak, wiem, �e robi� to w porozumieniu z Korthem.
	AI_Output (other, self, "DIA_Snow_Find_Yes_15_09"); //Chodzi o ten zakaz Kiry z alkoholem.
	AI_Output (other, self, "DIA_Snow_Find_Yes_15_10"); //Bukhart krad� towary, a Korth je... up�ynnia�.
	AI_Output (self, other, "DIA_Snow_Find_Yes_11_11"); //A niech to. Cwane skurczybyki. 
	AI_Output (self, other, "DIA_Snow_Find_Yes_11_12"); //Zachowam to dla siebie, lepiej, �eby Kira si� o tym nie dowiedzia�a.
	AI_Output (self, other, "DIA_Snow_Find_Yes_11_13"); //Doceniam Twoj� szczero��. We� t� recept�, trudn� j� zdoby�, a Tobie powinna si� przyda�.
	
	CreateInvItems		(self, Recept_ItFo_Potion_Health_03, 1);//hp03 pot
	B_GiveInvItems		(self, other,Recept_ItFo_Potion_Health_03, 1);

	AI_Output (self, other, "DIA_Snow_Find_No_11_14"); //Dobra robota, b�d� o tym pami�ta�. Kira te� si� dowie, �e potrafisz sobie radzi� w r�nych sytuacjach.
	AI_Output (self, other, "DIA_Snow_Find_No_11_15"); //To mi wystarczy. Bywaj.

	Log_SetTopicStatus	(CH2_TRL_Thief, LOG_SUCCESS);
	B_LogEntry		(CH2_TRL_Thief, "Powiedzia�em Snowowi, kto by� z�odziejem i jakie by�y motywy. Wstawi si� za mn� u Kiry. Nie wiem tylko, czy ta szczero�� mi nie zaszkodzi.");
	B_LogEntry		(CH2_TRL_Quest, "Snow mnie poprze, to wcale nie by�o takie trudne.");
	B_StopProcessInfos	(self); 
};

// ------------------No----------------

FUNC VOID DIA_Snow_Find_No()
{
	TH_trust = TH_trust + 1;	
	AI_Output (other, self, "DIA_Snow_Find_No_15_16"); //Nie mam poj�cia. Pewnie by� g�odny.
	AI_Output (self, other, "DIA_Snow_Find_No_11_17"); //Mo�liwe, Bukhart ca�y czas jest g�odny.
	AI_Output (self, other, "DIA_Snow_Find_No_11_18"); //W ka�dym razie dzi�ki za pomoc. B�d� o tym pami�ta�. Kira te� si� dowie, �e potrafisz sobie radzi� w r�nych sytuacjach.
	AI_Output (self, other, "DIA_Snow_Find_No_11_19"); //To mi wystarczy. Bywaj.
	
   Log_SetTopicStatus	(CH2_TRL_Thief, LOG_SUCCESS);
	B_LogEntry		(CH2_TRL_Thief, "Powiedzia�em Snowowi, kto by� z�odziejem, jednak przemilcza�em motywy Bukharta. Powiedzia�, �e poprze mnie przed Kir�.");
	B_LogEntry		(CH2_TRL_Quest, "Snow mnie poprze, to wcale nie by�o takie trudne.");
	B_StopProcessInfos	(self); 
};