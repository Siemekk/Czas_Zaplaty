
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jack_Exit (C_INFO)
{
	npc			= PIR_2612_JACKALLIGATOR;
	nr			= 999;
	condition	= DIA_Jack_Exit_Condition;
	information	= DIA_Jack_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jack_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jack_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Jack_Hello (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 1;
	condition		= DIA_Jack_Hello_Condition;
	information		= DIA_Jack_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jeste�?"; 
};

FUNC INT DIA_Jack_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Jack_Hello_Info()
{
	AI_Output (other, self, "DIA_Jack_Hello_15_01"); //Kim jeste�?
	AI_Output (self, other, "DIA_Jack_Hello_12_02"); //Na pewno o mnie s�ysza�e�.
	AI_Output (self, other, "DIA_Jack_Hello_12_03"); //Jestem Jack Aligator.
	AI_Output (self, other, "DIA_Jack_Hello_12_04"); //Boj� si� mnie prawie wszyscy! Jestem najstraszliwszym piratem p�ywaj�cymi po tych wodach.
	AI_Output (self, other, "DIA_Jack_Hello_12_05"); //Pod wodz� kapitana Grega z�upili�my wi�cej statk�w kupieckich, ni� jestem w stanie zliczy�.
	AI_Output (self, other, "DIA_Jack_Hello_12_06"); //Rozmawiasz z �yw� legend�, �e si� tak wyra��.
	AI_Output (other, self, "DIA_Jack_Hello_15_07"); //Rzeczywi�cie nosisz zbroj� pirata. Albo zerwa�e� j� z jaki� zw�ok, albo rzeczywi�cie jeste� jednym z nas.
	AI_Output (self, other, "DIA_Jack_Hello_12_08"); //Nawet w to nie w�tp, chuderlaku!
	Log_CreateTopic	(CH1_Rbl_Pirates, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_Pirates, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Pirates, "Piraci. Najwyra�niej nie tylko nasz okr�t mia� pecha. Znalaz�em w Kolonii niejakiego Jacka Aligatora. Mo�e powie mi co� wi�cej o pozosta�ych piratach.");
};

// **************************************************
INSTANCE DIA_JACKALLIGATOR_CanYouTeachMe (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 4;
	condition		= DIA_JACKALLIGATOR_CanYouTeachMe_Condition;
	information		= DIA_JACKALLIGATOR_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_JACKALLIGATOR_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jack_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_JACKALLIGATOR_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_JACKALLIGATOR_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
   AI_Output (self, other, "DIA_JACKALLIGATOR_CanYouTeachMe_15_02"); //Ty n�dzny szczurze l�dowy, jak �miesz o to pyta�?!
   AI_Output (self, other, "DIA_JACKALLIGATOR_CanYouTeachMe_15_03"); //W sumie mog� ci pokaza� jak unika� cios�w. Na pewno przyda si� to takiemu tch�rzowi jak ty.
   AI_Output (self, other, "DIA_JACKALLIGATOR_CanYouTeachMe_15_04"); //Mog� te� nauczy� ci� oprawia� zwierzyn�.
      
   Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
   B_LogEntry(GE_TeacherOW, "Jack Aligator mo�e mnie nauczy� unikania cios�w oraz oprawiania zwierzyny.");
};

INSTANCE DIA_Jack_Greg (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 2;
	condition		= DIA_Jack_Greg_Condition;
	information		= DIA_Jack_Greg_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znasz Grega?"; 
};

FUNC INT DIA_Jack_Greg_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_Greg_Info()
{
	AI_Output (other, self, "DIA_Jack_Greg_15_01"); //Znasz Grega?
	AI_Output (self, other, "DIA_Jack_Greg_12_02"); //Czy ja znam Grega?!
	AI_Output (self, other, "DIA_Jack_Greg_12_03"); //A czy kr�lewscy paladyni to idioci?
	AI_Output (other, self, "DIA_Jack_Greg_15_04"); //Hmm...
	AI_Output (self, other, "DIA_Jack_Greg_12_05"); //Pewnie, �e tak do stu beczek rumu!
	AI_Output (self, other, "DIA_Jack_Greg_12_06"); //Czym�e by�by Greg gdyby nie Jack Aligator, h�? 
	AI_Output (other, self, "DIA_Jack_Greg_15_07"); //Pewnie nikim.
	AI_Output (self, other, "DIA_Jack_Greg_12_08"); //Dok�adnie!
	AI_Output (self, other, "DIA_Jack_Greg_12_09"); //P�ywa�em na morzach, kiedy Greg jeszcze obsikiwa� pieluchy.
	AI_Output (self, other, "DIA_Jack_Greg_12_10"); //Zreszt�, niewa�ne.
	AI_Output (other, self, "DIA_Jack_Greg_15_11"); //Ale to Greg jest kapitanem, a nie Ty.
	AI_Output (self, other, "DIA_Jack_Greg_12_12"); //Bo... Bo mierzi mnie dowodzenia. Wol� to zostawi� innym.
	AI_Output (other, self, "DIA_Jack_Greg_15_13"); //A co teraz porabia Greg?
	AI_Output (self, other, "DIA_Jack_Greg_12_14"); //Sztorm rozsmarowa� nasz statek na ska�ach.
	AI_Output (self, other, "DIA_Jack_Greg_12_15"); //Kiedy obudzi�em si� na drugi dzie�, nie spotka�em nikogo z naszych.
	AI_Output (self, other, "DIA_Jack_Greg_12_16"); //Ale jak znam Grega, to pewnie ma si� dobrze i kombinuje jak wyrwa� si� z tej cholernej Kolonii.
	
   B_LogEntry		(CH1_Rbl_Pirates, "Jack powiedzia�, �e jego kapitan - Greg, pewnie prze�y� sztorm i powinien znajdowa� si� gdzie� w Kolonii. Mo�e powinienem go poszuka�?");
};

// **************************************************

INSTANCE DIA_Jack_WhatDo (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 3;
	condition		= DIA_Jack_WhatDo_Condition;
	information		= DIA_Jack_WhatDo_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co tu robisz?"; 
};

FUNC INT DIA_Jack_WhatDo_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_Greg))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_WhatDo_Info()
{
	AI_Output (other, self, "DIA_Jack_WhatDo_15_01"); //Co tu robisz?
	AI_Output (self, other, "DIA_Jack_WhatDo_12_02"); //Odpoczywam od cywilizacji, he, he.
	AI_Output (self, other, "DIA_Jack_WhatDo_12_03"); //Kiedy nasza �ajba rozbi�a si� na ska�ach podczas tego cholernego sztormu, docz�apa�em si� a� tutaj i zarzuci�em kotwic�.
	AI_Output (self, other, "DIA_Jack_WhatDo_12_04"); //Ale Jack Aligator nie jest szczurem l�dowym do kro�set!
	AI_Output (self, other, "DIA_Jack_WhatDo_12_05"); //Kiedy tylko znajd� jak�� �ajb�, wci�gn� flag� na maszt i odp�yn� jak najdalej od tego zat�ch�ego l�du.
	AI_Output (other, self, "DIA_Jack_WhatDo_15_06"); //Wasz okr�t te� rozbi� si� podczas sztormu?
	AI_Output (self, other, "DIA_Jack_WhatDo_12_07"); //Z w�asnej woli bym tu nie rzuci� kotwicy!
	AI_Output (self, other, "DIA_Jack_WhatDo_12_08"); //Ju� dawno nie widzia�em takiego szkwa�u. By�o w nim co� dziwnego...
	AI_Output (self, other, "DIA_Jack_WhatDo_12_09"); //Powietrze �mierdzia�o wtedy... umarlakami. Tak w�a�nie, umarlakami!
	AI_Output (self, other, "DIA_Jack_WhatDo_12_10"); //A stary Jack wie co m�wi.
	AI_Output (other, self, "DIA_Jack_WhatDo_15_11"); //Umarlakami?
	AI_Output (self, other, "DIA_Jack_WhatDo_12_12"); //To nie by� zwyczajny sztorm.
	AI_Output (self, other, "DIA_Jack_WhatDo_12_13"); //Wiem co m�wi�, bo prze�y�em ju� niejedno porz�dne wietrzysko na morzu.
	AI_Output (self, other, "DIA_Jack_WhatDo_12_14"); //Po wzburzonych falach pe�ga�y blade ogniki, z odm�t�w wynurzali si� umarli, a na niebie ta�czy�y zmory i szczerzy�y do nas z�by.
	AI_Output (self, other, "DIA_Jack_WhatDo_12_15"); //To by�a paskudna noc...
	
   B_LogEntry		(CH1_Rbl_Pirates, "Okr�t Jacka, jak i m�j, rozbi� si� na ska�ach podczas sztormu. Jack twierdzi, �e to nie by� zwyczajny szkwa�. M�wi, �e widzia� umar�ych, ale nie ma co s�ucha� przes�dnego marynarza.");
};

// **************************************************

INSTANCE DIA_Jack_Ramos (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 4;
	condition		= DIA_Jack_Ramos_Condition;
	information		= DIA_Jack_Ramos_Info;
	permanent		= 0;
	important		= 0;
	description		= "S�ysza�e� o Ramosie?"; 
};

FUNC INT DIA_Jack_Ramos_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_WhatDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_Ramos_Info()
{
	AI_Output (other, self, "DIA_Jack_Ramos_15_01"); //S�ysza�e� o kapitanie Ramosie?
	AI_Output (self, other, "DIA_Jack_Ramos_12_02"); //Pytasz Jacka Aligatora, czy s�ysza� o starym Ramosie?!
	AI_Output (self, other, "DIA_Jack_Ramos_12_03"); //A my�lisz, �e kto nauczy� Ramosa odr�nia� �agiel od damskich pantalon�w, he, he.
	AI_Output (self, other, "DIA_Jack_Ramos_12_04"); //W�a�nie p�yn�li�my na spotkanie z tym starym zrz�d�, kiedy dopad� nas szkwa�...
	
   B_LogEntry		(CH1_Rbl_Pirates, "Jack i Greg p�yn�li na spotkanie z Ramosem, kiedy dopad� ich sztorm.");
	B_StopProcessInfos	( self );
};

// **************************************************

func void B_Aligators_PreQuest()
{
	AI_Output (other, self, "DIA_Jack_Question_Yes_15_01"); //Tak jest, kapitanie!
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_02"); //Kapitanie? 
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_03"); //No tak, jestem teraz kapitanem!
};
   
func void B_Aligators_Quest()
{
   jack_yes = TRUE;
   
   AI_Output (other, self, "DIA_Jack_Question_Yes_15_05"); //A co to za bestia?
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_06"); //Stary i brzydki aligator.
	AI_Output (other, self, "DIA_Jack_Question_Yes_15_07"); //M�wisz o sobie?
   
   if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == FALSE)
   {
      AI_Output (self, other, "DIA_Jack_Question_Yes_12_08"); //Nie prowokuj mnie sterniku!
      AI_Output (other, self, "DIA_Jack_Question_Yes_15_09"); //Tak jest, kapitanie!
   }
   else
   {
      AI_Output (self, other, "DIA_Jack_Fight_12_25"); //Nie prowokuj mnie ponownie!
		AI_Output (other, self, "DIA_Jack_Fight_15_26"); //W porz�dku, jedna walka mi wystarczy.
   };
   
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_10"); //Wracaj�c do aligator�w. Niedaleko st�d znajduje si� jaskinia, w kt�rej te bestie maj� gniazdo.
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_11"); //Widzia�em tam kilkutonow� matron�. To pewnie ona jest mamu�k� ca�ego miotu.
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_12"); //Zabij t� choler� i przynie� mi jej pazury, a nie po�a�ujesz.
	AI_Output (other, self, "DIA_Jack_Question_Yes_15_13"); //A co ja b�d� z tego mia�, pr�cz chwa�y i cudem wyniesionego �ycia?
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_14"); //Hmm... Zedrzyj z gada sk�r�, to sklec� z tego niezgorszy pancerz.
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_15"); //Aha. I lepiej nie zapuszczaj si� tam sam, bo sko�czysz w brzuchu gada.
	
   Log_CreateTopic	(CH1_Rbl_Aligator, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_Aligator, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Aligator, "Jack zleci� mi zabicie starego aligatora, kt�ry zamieszkuje jaskini� w pobli�u jego kryj�wki. Mam przynie�� mu pazury gada. Jak zedr� sk�r� z aligatora, Jack zrobi mi z niej pancerz. Stary pirat zasugerowa� te�, �ebym nie szed� tam sam.");
	
	Wld_InsertNpc		(Aligator_Boss,"SPAWN_OW_BLACKGOBBO_BOSS");		
	B_StopProcessInfos	(self); 
};

INSTANCE DIA_Jack_Question (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 5;
	condition		= DIA_Jack_Question_Condition;
	information		= DIA_Jack_Question_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Jack_Question_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_Ramos))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_Question_Info()
{
	AI_Output (self, other, "DIA_Jack_Question_12_01"); //Zaraz. Przecie� ja sk�d� znam Twoj� facjat�...
	AI_Output (self, other, "DIA_Jack_Question_12_02"); //Jeste� jednym z wilk�w Ramosa!
	AI_Output (other, self, "DIA_Jack_Question_15_03"); //Niestety jednym z ostatnich.
	AI_Output (self, other, "DIA_Jack_Question_12_04"); //Co z kapitanem i statkiem?
	AI_Output (other, self, "DIA_Jack_Question_15_05"); //Kapitan nie �yje, tak samo sternik, nawigator i wi�kszo�� za�ogi.
	AI_Output (self, other, "DIA_Jack_Question_12_06"); //Niech to Beliar poch�onie! Jak to si� sta�o?
	AI_Output (other, self, "DIA_Jack_Question_15_07"); //Sztorm i ska�y. Nie tylko was zaskoczy� szkwa� u wybrze�y wyspy. Prze�y�em tylko ja i kilku ch�opak�w.
	AI_Output (self, other, "DIA_Jack_Question_12_08"); //Szkoda Ramosa. Stary by� i wredny, ale uczciwy pirat. A takich coraz mniej p�ywa...
	AI_Output (self, other, "DIA_Jack_Question_12_09"); //To z Tob� mieli�my si� spotka� na pla�y w pobli�u Khorinis?
	AI_Output (other, self, "DIA_Jack_Question_15_10"); //Tak. Ramos powiedzia� tylko, �e musi sp�aci� stare d�ugi, zanim z�o�y ko�ci na dnie morza.
	AI_Output (self, other, "DIA_Jack_Question_12_11"); //He, he, ca�y Ramos. Co do d�ug�w, skoro nie ma Grega to prawem pirat�w, ja przejmuj� Tw�j d�ug.
	AI_Output (other, self, "DIA_Jack_Question_15_12"); //Prawem pirat�w? Pierwsze s�ysz�...
	AI_Output (self, other, "DIA_Jack_Question_12_13"); //Bo� m�ody i nieopierzony. 
	AI_Output (self, other, "DIA_Jack_Question_12_14"); //Od tej chwili jeste� moim... sternikiem.
	AI_Output (other, self, "DIA_Jack_Question_15_15"); //Mo�e co� Ci umkn�o, ale nie jeste�my na morzu.
	AI_Output (self, other, "DIA_Jack_Question_12_16"); //Niewa�ne, liczy si� funkcja. I wi�cej nie podwa�aj mojego autorytetu!

	Info_ClearChoices (DIA_Jack_Question);
	Info_AddChoice (DIA_Jack_Question, "Tak jest, kapitanie!", DIA_Jack_Question_Yes);
	Info_AddChoice (DIA_Jack_Question, "Nikt nie b�dzie mi m�wi�, co mam robi�.", DIA_Jack_Question_No);
	Info_AddChoice (DIA_Jack_Question, "Nie b�d� z Tob� walczy�.", DIA_Jack_Question_Away);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Jack_Question_Yes()
{
   B_LogEntry(CH1_Rbl_Pirates, "Zosta�em 'sternikiem' Jacka. Wola�em nie wszczyna� burdy z tym starym piratem.");
   B_Aligators_PreQuest();
   
   AI_Output (self, other, "DIA_Jack_Question_Yes_12_04"); //W takim razie zaczniesz pe�nienie swoich obowi�zk�w od wys�ania pewnej wrednej bestii do Beliara.
   
   B_Aligators_Quest();
   
   Info_ClearChoices (DIA_Jack_Question);
};

// ------------------No----------------

FUNC VOID DIA_Jack_Question_No()
{
	Npc_SetAivar(self,AIV_WASDEFEATEDBYSC,  FALSE); Npc_SetAivar(self,AIV_HASDEFEATEDSC,  FALSE);
	jack_no = TRUE;
   
	AI_Output (other, self, "DIA_Jack_Question_No_15_01"); //Nikt nie b�dzie mi m�wi�, co mam robi�.
	AI_Output (self, other, "DIA_Jack_Question_No_12_02"); //Skoro nie chcesz po dobroci, to niech b�dzie si��.
	AI_Output (self, other, "DIA_Jack_Question_No_12_03"); //Udowodnij, �e� pirat, a nie szczur l�dowy!
   
	B_LogEntry		(CH1_Rbl_Pirates, "�eby udowodni� Jackowi, �e jestem prawdziwym piratem, musz�... skopa� mu dup�.");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);	
};

// ------------------Away----------------

FUNC VOID DIA_Jack_Question_Away()
{
	AI_Output (other, self, "DIA_Jack_Question_Away_15_01"); //Nie b�d� z Tob� walczy�.
	AI_Output (self, other, "DIA_Jack_Question_Away_12_02"); //Co?! I ty nazywasz siebie piratem?!
	AI_Output (self, other, "DIA_Jack_Question_Away_12_03"); //Zdychaj szczurze l�dowy!!
   
	B_LogEntry		(CH1_Rbl_Pirates, "Kiedy powiedzia�em Jackowi, �e nie b�d� z nim walczy�, ten wpad� we w�ciek�o�� i si� na mnie rzuci�. Albo on, albo ja...");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);	
};

// **************************************************

INSTANCE DIA_Jack_Fight (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 6;
	condition		= DIA_Jack_Fight_Condition;
	information		= DIA_Jack_Fight_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Jack_Fight_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_Question))&&(jack_no == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_Fight_Info()
{
	//Bugfix: Anti-Fight by bow - add amunition after fight
	CreateInvItems (self, ItAmArrow,100);
   
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
      B_LogEntry		(CH1_Rbl_Pirates, "Nie zdo�a�em pokona� Jacka i zosta�em jego 'sternikiem'. Mo�e to i lepiej...");
		
      AI_Output (self, other, "DIA_Jack_Fight_12_01"); //Nigdy wi�cej nie zaczynaj z Jackiem Aligatorem ch�ystku!
		AI_Output (self, other, "DIA_Jack_Fight_12_02"); //A teraz bez gadania zrobisz to, co Ci rozka��. Rozumiemy si�?
      
      B_Aligators_PreQuest();
      
      AI_Output (self, other, "DIA_Jack_Fight_12_06"); //W takim razie... sterniku, zaczniesz pe�nienie obowi�zk�w od wys�ania pewnej wrednej bestii do Beliara.
      
      B_Aligators_Quest();
	}
	else //if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
      B_GiveXP(150);
		
		AI_Output (self, other, "DIA_Jack_Fight_12_18"); //Niech to Beliar poch�onie - pokona�e� mnie!
		AI_Output (self, other, "DIA_Jack_Fight_12_19"); //Ale nie my�l sobie, �e teraz wszystko Ci wolno!
		AI_Output (other, self, "DIA_Jack_Fight_15_20"); //Gdzie�bym �mia�.
		AI_Output (self, other, "DIA_Jack_Fight_12_21"); //Skoro ju� tu jeste�, to mam rob�tk� godn� takiego �mia�ka. Niedaleko st�d pa��ta si� pewna wredna bestia Beliara.
		
      B_Aligators_Quest();
      
      B_LogEntry		(CH1_Rbl_Pirates, "Pokona�em Jacka. Nawet taki stary wilk morski jak on powinien zna� swoje miejsce.");
	};
};

var int a_f_t;
var int a_f_e;

INSTANCE DIA_Jack_AligatorDead (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 7;
	condition		= DIA_Jack_AligatorDead_Condition;
	information		= DIA_Jack_AligatorDead_Info;
	permanent		= 1;
	important		= 0;
	description		= "Zabi�em wielkiego aligatora."; 
};

FUNC INT DIA_Jack_AligatorDead_Condition()
{
	if (jack_yes==TRUE)&&(Npc_IsDead(Aligator_Boss))&&(a_f_e == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_AligatorDead_Info()
{
	if (a_f_t == FALSE)
	{
		B_GiveXP(1000);
		a_f_t = TRUE;
      
		AI_Output (other, self, "DIA_Jack_AligatorDead_15_01"); //Zabi�em wielkiego aligatora.
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_02"); //A niech mnie rekin wych�do�y! 
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_03"); //Naprawd� tego dokona�e�... 
	};
   
	AI_Output (self, other, "DIA_Jack_AligatorDead_12_04"); //A gdzie trofea?
	
   if (NPC_HasItems(other,ItAt_BossAlgClaws)>=1)
	{
		a_f_e = TRUE;
      
		AI_Output (other, self, "DIA_Jack_AligatorDead_15_05"); //Oto Twoje k�y.
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_06"); //�wietnie. W ko�cu przyozdobi� nimi r�kawice!
      
		B_GiveInvItems (other, self, ItAt_BossAlgClaws, 1);
      
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_07"); //Sam z ch�ci� pos�a�bym to bydl� do Beliara, ale trzeba da� si� wykaza� m�odym wilkom...
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_08"); //W ko�cu nie b�d� �y� wiecznie, he, he.
		
      Log_SetTopicStatus	(CH1_Rbl_Aligator, LOG_SUCCESS);
		B_LogEntry		(CH1_Rbl_Aligator, "Zabi�em ogromnego aligatora. Zrobi�em spore wra�enie na Jacku, cho� stary pirat si� do tego nie przyzna�.");
	}
	else
	{
		AI_Output (other, self, "DIA_Jack_AligatorDead_15_09"); //Cholera! Wiedzia�em, �e o czym� zapomnia�em...
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_10"); //Wr�� wi�c po moje trofeum i nie zawracaj mi niepotrzebnie ty�ka.
		
      B_StopProcessInfos	(self); 
	};
};

var int aligator_armor;

INSTANCE DIA_Jack_AligatorDead1 (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 8;
	condition		= DIA_Jack_AligatorDead1_Condition;
	information		= DIA_Jack_AligatorDead1_Info;
	permanent		= 0;
	important		= 0;
	description		= "M�wi�e� co� o pancerzu ze sk�ry aligatora."; 
};

FUNC INT DIA_Jack_AligatorDead1_Condition()
{
	if (a_f_e == TRUE)&&(NPC_HasItems(other,ItAt_BossAlgSkin)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_AligatorDead1_Info()
{
	aligator_armor = B_SetDayTolerance()+3;
   
	AI_Output (other, self, "DIA_Jack_AligatorDead1_15_01"); //M�wi�e� co� o pancerzu ze sk�ry aligatora.
	AI_Output (self, other, "DIA_Jack_AligatorDead1_12_02"); //A zdar�e� z tego bydl�cia sk�r�?
	AI_Output (other, self, "DIA_Jack_AligatorDead1_15_03"); //Oto ona. 
	
   B_GiveInvItems (other, self, ItAt_BossAlgSkin, 1);
	Npc_RemoveInvItems(self,ItAt_BossAlgSkin,1);
	
   AI_Output (self, other, "DIA_Jack_AligatorDead1_12_04"); //No nawet zbytnio jej nie pochlasta�e�...
	AI_Output (self, other, "DIA_Jack_AligatorDead1_12_05"); //W porz�dku. Wr�� za trzy dni, a pancerz b�dzie gotowy.
	
   B_StopProcessInfos	(self); 
};

INSTANCE DIA_Jack_AligatorDead2 (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 9;
	condition		= DIA_Jack_AligatorDead2_Condition;
	information		= DIA_Jack_AligatorDead2_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Jack_AligatorDead2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_AligatorDead1))&&(aligator_armor <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_AligatorDead2_Info()
{
	B_GiveXP(200);
   
	AI_Output (self, other, "DIA_Jack_AligatorDead2_12_01"); //Pancerz ju� gotowy. 
	AI_Output (self, other, "DIA_Jack_AligatorDead2_12_02"); //Troch� mi to zaj�o, ale to porz�dna zbroja.
	AI_Output (self, other, "DIA_Jack_AligatorDead2_12_03"); //Niech Ci dobrze s�u�y.
	
   CreateInvItem 		(other, ALG_ARMOR);
	AI_EquipArmor				(other, ALG_ARMOR);
   
	AI_Output (other, self, "DIA_Jack_AligatorDead2_15_04"); //Dzi�ki Jack.
	
   B_StopProcessInfos	(self); 
};

INSTANCE DIA_Aligator_Go (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 10;
	condition		= DIA_Aligator_Go_Condition;
	information		= DIA_Aligator_Go_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�e p�jdziesz ze mn�?"; 
};

FUNC INT DIA_Aligator_Go_Condition()
{
	if  (a_f_e == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Aligator_Go_Info()
{
	AI_Output (other, self, "DIA_Aligator_Go_15_01"); //Mo�e p�jdziesz ze mn�?
	AI_Output (self, other, "DIA_Aligator_Go_12_02"); //Ale gdzie i po co?
	AI_Output (other, self, "DIA_Aligator_Go_15_03"); //Zaszy�em si� z ch�opakami w obozie rebeliant�w.
	AI_Output (other, self, "DIA_Aligator_Go_15_04"); //Zawsze to lepsze ni� spanie na pla�y czy w jaskini pe�nej aligator�w.
	AI_Output (self, other, "DIA_Aligator_Go_12_05"); //W sumie racja.
	AI_Output (self, other, "DIA_Aligator_Go_12_06"); //Zreszt�, nic ju� mnie tu nie trzyma.
	AI_Output (self, other, "DIA_Aligator_Go_12_07"); //Prowad� przyjacielu.
   
	B_LogEntry		(CH1_Rbl_NewMembers, "Jack p�jdzie ze mn� do obozu rebeliant�w.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Aligator_GoOut (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 11;
	condition		= DIA_Aligator_GoOut_Condition;
	information		= DIA_Aligator_GoOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Aligator_GoOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Aligator_Go))&&((Npc_GetDistToWP (self,"SPAWN_TALL_PATH_BANDITOS2") < 550 )|| (Npc_GetDistToWP (self,"MOVEMENT_TALL_PATH_BANDITOS2") < 550 )||(Npc_GetDistToWP (self,"PATH_OC_NC_11") < 550 )||(Npc_GetDistToWP (self,"HC_WARRIOR16") < 550 ))
	{
		return 1;
	};
};

FUNC VOID DIA_Aligator_GoOut_Info()
{
	Know_JackAlligator = TRUE;
	aligator_trust = TRUE;
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(250);
   
	AI_Output (other, self,"DIA_Aligator_GoOut_15_01"); //Jeste�my na miejscu. 
	AI_Output (self, other,"DIA_Aligator_GoOut_12_02"); //Bywa�em ju� w gorszych portach ni� ten.
	AI_Output (self, other,"DIA_Aligator_GoOut_12_03"); //Mo�e by�, przynajmniej na jaki� czas.
	AI_Output (self, other,"DIA_Aligator_GoOut_12_04"); //We� te pergaminy. Znalaz�em zwoje w jakiej� skrzyni.
	AI_Output (self, other,"DIA_Aligator_GoOut_12_05"); //Mo�e zrobisz z nich lepszy u�ytek ni� podtarcie ty�ka, he, he.
	AI_Output (other, self,"DIA_Aligator_GoOut_15_06"); //Postaram si�.
	AI_Output (self, other,"DIA_Aligator_GoOut_12_07"); //Nie daj si� zabi� wilku!
   
	CreateInvItems (self, ItArScrollIceCube,2); 
	B_GiveInvItems (self, other, ItArScrollIceCube, 2);
	CreateInvItems (self, ItArScrollFireball,2); 
	B_GiveInvItems (self, other, ItArScrollFireball, 2);
	CreateInvItems (self, ItArScrollDestroyUndead,1); 
	B_GiveInvItems (self, other, ItArScrollDestroyUndead, 1);
   
	B_LogEntry(CH1_Rbl_NewMembers, "Doprowadzi�em Jacka Aligatora do obozu. Mam nadziej�, �e nie b�d� tego �a�owa�...");
   B_LogEntry(CH1_Rbl_Pirates, "No i stary Jack jest z nami w obozie.");
   Log_SetTopicStatus(CH1_Rbl_Pirates, LOG_SUCCESS);
	
   Party_RemoveNpc(self);
	Npc_ExchangeRoutine	(self,"OR");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Jack_KillPatrol (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 12;
	condition		= DIA_Jack_KillPatrol_Condition;
	information		= DIA_Jack_KillPatrol_Info;
	permanent		= 0;
	important		= 0;
	description		= "Musz� rozprawi� si� z kilkoma stra�nikami."; 
};

FUNC INT DIA_Jack_KillPatrol_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Quest1))&&(!Npc_KnowsInfo (hero, DIA_Duke_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_KillPatrol_Info()
{
	AI_Output (other, self, "DIA_Jack_KillPatrol_15_01"); //Musz� rozprawi� si� z kilkoma stra�nikami.
	AI_Output (self, other, "DIA_Jack_KillPatrol_12_02"); //To �ycz� powodzenia.
	AI_Output (other, self, "DIA_Jack_KillPatrol_15_03"); //Nie pomo�esz mi?
	AI_Output (self, other, "DIA_Jack_KillPatrol_12_04"); //Jack jest ju� za stary na takie harce. Czas, �eby�cie wy, m�odzi pokazali co�cie warci.
	AI_Output (other, self, "DIA_Jack_KillPatrol_15_05"); //Powiedz lepiej, �e boisz si� nara�a� sk�r�.
	AI_Output (self, other, "DIA_Jack_KillPatrol_12_06"); //Stary Jack nie wie co to strach ch�ystku! A teraz zejd� mi z oczu.
	
   B_LogEntry		(CH2_RBL_GuardCamp, "Wielki Jack Aligator mi nie pomo�e - cholerny stary pierdziel.");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Jack_Treassure (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 13;
	condition		= DIA_Jack_Treassure_Condition;
	information		= DIA_Jack_Treassure_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Jack_Treassure_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_PalGraveyardBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_Treassure_Info()
{
	AI_Output (self, other, "DIA_Jack_Treassure_12_01"); //Dobrze, �e Ci� widz� brachu. Stary Jack ma dla Ciebie prezent.
	AI_Output (other, self, "DIA_Jack_Treassure_15_02"); //Bogowie strze�cie mnie od pirat�w przynosz�cych dary...
	AI_Output (self, other, "DIA_Jack_Treassure_12_03"); //Nie b�d� g�upi, nie dam Ci nic za darmo.
	AI_Output (other, self, "DIA_Jack_Treassure_15_04"); //Akurat w to nie w�tpi�em.
	AI_Output (self, other, "DIA_Jack_Treassure_12_05"); //Zdradz� Ci pewien sekret w zamian za przys�ug�.
	AI_Output (other, self, "DIA_Jack_Treassure_15_06"); //Co to za przys�uga?
	AI_Output (self, other, "DIA_Jack_Treassure_12_07"); //Co� dla mnie... wykopiesz.
	AI_Output (self, other, "DIA_Jack_Treassure_12_08"); //Dam Ci map� z zaznaczonymi kilkoma miejscami...
	AI_Output (other, self, "DIA_Jack_Treassure_15_09"); //Mapa skarb�w?!
	AI_Output (self, other, "DIA_Jack_Treassure_12_10"); //Tylko jej po��wka, ale rzeczywi�cie wskazuje miejsca, gdzie ukryto kilka b�yskotek.
	AI_Output (other, self, "DIA_Jack_Treassure_15_11"); //Dlaczego sam nie wykopiesz skarb�w?
	AI_Output (self, other, "DIA_Jack_Treassure_12_12"); //Jack Aligator nie jest szczurem l�dowym, a ju� na pewno nie jestem kretem albo nornic�.
	AI_Output (self, other, "DIA_Jack_Treassure_12_13"); //Poza tym nie chc� tego przekl�tego skarbu...
	AI_Output (other, self, "DIA_Jack_Treassure_15_14"); //Jak to przekl�tego?
	AI_Output (self, other, "DIA_Jack_Treassure_12_15"); //To pewnie tylko zabobony, wiesz my piraci jeste�my przes�dni.
	AI_Output (other, self, "DIA_Jack_Treassure_15_16"); //Zaraz... Chyba nie m�wisz o kl�twie czarnej per�y?!
	AI_Output (self, other, "DIA_Jack_Treassure_12_17"); //Chyba nie wierzysz w te bajki? Nie ma �adnej armii umarlak�w i Czarnego Psa. To tylko g�upie opowie�ci trz�s�cych portkami pirat�w...
	//FIXME: Niby za co ten dzwi�k?
	Snd_Play 		("FoundRiddler");
	
   AI_Output (self, other, "DIA_Jack_Treassure_12_18"); //Cholera co to by�o?!
	
   AI_StandUp ( self);
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
   
	AI_Output (other, self, "DIA_Jack_Treassure_15_19"); //Zdaje si�, �e ta g�upia bajka jest jednak czym� wi�cej.
	AI_Output (self, other, "DIA_Jack_Treassure_12_20"); //To tylko wiatr, nic wi�cej...
	AI_Output (self, other, "DIA_Jack_Treassure_12_21"); //Chyba nie boisz si� przes�d�w, sterniku?
	AI_Output (other, self, "DIA_Jack_Treassure_15_22"); //Tylko idiota nie czuje strachu przed tym, czego nie zna.
	AI_Output (other, self, "DIA_Jack_Treassure_15_23"); //A co Ty chcesz w zamian za map�?
	AI_Output (self, other, "DIA_Jack_Treassure_12_24"); //Przynie� mi... czarn� per��.
	AI_Output (other, self, "DIA_Jack_Treassure_15_25"); //Niech Ci� cholera, wiedzia�em, �e ��esz. Sam sobie jej poszukaj, nie jestem idiot�.
	AI_Output (self, other, "DIA_Jack_Treassure_12_26"); //Pos�uchaj, jak przyniesiesz mi per��, to zdradz� Ci, gdzie zakopano prawdziwy skarb Czarnego Psa.
	AI_Output (other, self, "DIA_Jack_Treassure_15_27"); //A sk�d Ty to niby wiesz?
	AI_Output (self, other, "DIA_Jack_Treassure_12_28"); //By�em jego sternikiem. To by�y paskudne czasy...
	AI_Output (other, self, "DIA_Jack_Treassure_15_29"); //Skarb Czarnego Psa... Nawet je�eli jest przekl�ty, to spora g�ra z�ota...
	AI_Output (self, other, "DIA_Jack_Treassure_12_30"); //Calutki b�dzie Tw�j!
	AI_Output (other, self, "DIA_Jack_Treassure_15_31"); //Hmm, niech b�dzie. M�g�bym za to kupi� porz�dny galeon i pop�yn�� na po�udnie z dala od ork�w, paladyn�w Innosa, demon�w i tych wszystkich bog�w.
	AI_Output (self, other, "DIA_Jack_Treassure_12_32"); //Wiedzia�em, �e si� skusisz. Oto mapa.

	/********************************************
	tu map� kilku zakopanych skarb�w trzeba zrobi�, niech to b�dzie tylko po��wka. w jednym z tych miejsc niech gracz znajdzie pos��ek innosa
	********************************************/
	Search_4_JackTreasure = TRUE;
	CreateInvItems (self, JackMap1, 1);
	B_GiveInvItems (self, other, JackMap1, 1);
	//TODO: Rick mo�e byc kapitanem, nie sternikiem.
   
	AI_Output (self, other, "DIA_Jack_Treassure_12_33"); //I nie zapomnij o kilofie! Powodzenia, sterniku.
	
   Log_CreateTopic	(CH2_RBL_Treassure, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Treassure, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Treassure, "Jack Aligator da� mi map� z zaznaczonymi skarbami. Mam dla niego znale�� czarn� per��, a wtedy zdradzi mi miejsce ukrycia skarbu Czarnego Psa. Musz� kupi� jaki� kilof i czas wyruszy� na poszukiwanie skarb�w.");
};

INSTANCE DIA_Jack_TreassureFound (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 13;
	condition		= DIA_Jack_TreassureFound_Condition;
	information		= DIA_Jack_TreassureFound_Info;
	permanent		= 0;
	important		= 0;
	description		= "Oto czarna per�a."; 
};

FUNC INT DIA_Jack_TreassureFound_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_Treassure))&&(Npc_HasItems(hero,Mis_Jack_BlackPearl))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_TreassureFound_Info()
{
	//That's crappy dialog has been created by orc	
	AI_Output (other, self, "DIA_Jack_TreassureFound_15_01"); //Oto czarna per�a.
	AI_Output (self, other, "DIA_Jack_TreassureFound_12_02"); //Dobrze si� spisa�e�, je�eli masz problemy z zagospodarowaniem reszty b�yskotek, kt�re wykopa�e�, to s�u�� pomoc�.
	AI_Output (other, self, "DIA_Jack_TreassureFound_15_03"); //Pomocna z Ciebie d�o�, ale dzi�kuj�, jako� sobie poradz�.
	AI_Output (self, other, "DIA_Jack_TreassureFound_12_04"); //Kiedy� by�em tak krzepki jak Ty, nie takie bogactwa zdobywa�em ch�opcze.
	AI_Output (self, other, "DIA_Jack_TreassureFound_12_05"); //W ka�dym razie dzi�kuj�. Przynios�e� czarn� per�� i jeste�my kwita.
	
	B_GiveInvItems (other, self, Mis_Jack_BlackPearl, 1);
	Log_SetTopicStatus	(CH2_RBL_Treassure, LOG_SUCCESS);
	B_LogEntry		(CH2_RBL_Treassure, "Zanios�em per�� Jackowi, po kilku przechwa�kach w ko�cu podzi�kowa�.");
};

INSTANCE DIA_Jack_TreasureBlackDog (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 13;
	condition		= DIA_Jack_TreasureBlackDog_Condition;
	information		= DIA_Jack_TreasureBlackDog_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mia�e� mi powiedzie�, gdzie znajd� skarb Czarnego Psa."; 
};

FUNC INT DIA_Jack_TreasureBlackDog_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_TreassureFound))
	{
		return 1;
	};
};

func void DIA_Jack_TreasureBlackDog_Info()
{
   AI_Output (other, self, "DIA_Jack_TreasureBlackDog_15_01"); //Mia�e� mi powiedzie�, gdzie znajd� skarb Czarnego Psa.
	AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_02"); //Nie wiem, o czym m�wisz...
   
   AI_DrawWeapon(other);
   
	AI_Output (other, self, "DIA_Jack_TreasureBlackDog_15_03"); //Dobrze wiesz, stary piracie, o czym m�wi�!
   AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_04"); //Dobra, dobra, schowaj t� bro�, to pogadamy.
   
   AI_RemoveWeapon(other);
   
   AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_05"); //No wi�c tak. M�g�bym ci da� map�, ale... na razie jest bezwarto�ciowa.
   AI_Output (other, self, "DIA_Jack_TreasureBlackDog_15_06"); //Co ty pieprzysz?
   AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_07"); //Stary Jack pieprzy tylko dziewki, he, he.
   AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_08"); //Ale wracaj�c do rzeczy. Skarb Czarnego Psa nie znajduje si� w G�rniczej Dolinie. Jest ukryty na wyspie, ale w innej cz�ci.
   AI_Output (other, self, "DIA_Jack_TreasureBlackDog_15_09"); //Czyli zrobi�e� ze mnie tylko ch�opca na posy�ki? Jak my�lisz, co powinienem teraz z tob� zrobi�?
   AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_10"); //Uspok�j si�! Jak tylko barier� szlag trafi, to osobi�cie ci� znajd� i wsadz� ci t� map� w dup�! Masz na to s�owo... pirata.
   AI_Output (other, self, "DIA_Jack_TreasureBlackDog_15_11"); //Mam nadziej�. P�ki co nie zabij� ci�.
};
// **************************************************

INSTANCE DIA_PIR_2612_JACKALLIGATOR_Stew (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 12;
	condition		= DIA_PIR_2612_JACKALLIGATOR_Stew_Condition;
	information		= DIA_PIR_2612_JACKALLIGATOR_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jad�e� ju� co� tak... egzotycznego jak gulasz Snafa?"; 
};

FUNC INT DIA_PIR_2612_JACKALLIGATOR_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2612_JACKALLIGATOR_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_PIR_2612_JACKALLIGATOR_Stew_15_01"); //Jad�e� ju� co� tak... egzotycznego jak gulasz Snafa?
	AI_Output (self, other, "DIA_PIR_2612_JACKALLIGATOR_Stew_11_02"); //Stary Jack znany jest z kulinarnych podr�y, heh.
	AI_Output (self, other, "DIA_PIR_2612_JACKALLIGATOR_Stew_11_03"); //Daj t� potrawk�!
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Jack wzi�� gulasz, przy okazji po raz kolejny pokazuj�c swoje nabrzmia�e ego."); 
};
