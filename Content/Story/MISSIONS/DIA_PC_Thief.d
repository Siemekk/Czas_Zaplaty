// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Condition;
	information	= Info_Diego_EXIT_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// *************************************************************
// 							Hi 
// *************************************************************

INSTANCE Info_Diego_Hi (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Hi_Condition;
	information	= Info_Diego_Hi_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};                       

FUNC INT Info_Diego_Hi_Condition()
{
	return TRUE;
};

FUNC VOID Info_Diego_Hi_Info()
{
	AI_Output(other,self,"Info_Diego_Hi_15_00"); //Witaj.
	AI_Output(self,other,"Info_Diego_Hi_11_01"); //Cuchniesz piratem. Przez takich sukinsyn�w jak Ty straci�em ca�y maj�tek.
	AI_Output(self,other,"Info_Diego_Hi_11_02"); //Zejd� mi z oczu, zanim zetr� ten durny u�mieszek z Twojej twarzy.
};

// *************************************************************

INSTANCE Info_Diego_Rebel (C_INFO)
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_Rebel_Condition;
	information	= Info_Diego_Rebel_Info;
	permanent		= 0;
	important		= 0;
	description		= "Musimy porozmawia�."; 
};                       

FUNC INT Info_Diego_Rebel_Condition()
{
	if (Npc_KnowsInfo(hero, STT_Balam_Again)) && (Npc_KnowsInfo(hero, Info_Diego_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rebel_Info()
{
	AI_Output(other,self,"Info_Diego_Rebel_15_00"); //Musimy porozmawia�.
	AI_Output(self,other,"Info_Diego_Rebel_11_01"); //Ja nic nie musz� piracie. Zejd� mi z oczu.
	AI_Output(other,self,"Info_Diego_Rebel_15_02"); //Najpierw mnie wys�uchasz!
	AI_Output(self,other,"Info_Diego_Rebel_11_03"); //M�w, skoro musisz.
	AI_Output(other,self,"Info_Diego_Rebel_15_04"); //W Starym Obozie szykuje si� bunt. Cienie i kopacze maj� ju� do�� stra�nik�w i dyryguj�cych wszystkim magnat�w.
	AI_Output(other,self,"Info_Diego_Rebel_15_05"); //Balam kaza� Ci� pozdrowi�. Powiedzia� te�, �e bez ciebie cienie nie rusz� do walki.
	AI_Output(self,other,"Info_Diego_Rebel_11_06"); //Zwolnij. Balam? Ten uparty kucharz ju� dawno powinien zaserwowa� Gomezowi trutk� na szczury.
	AI_Output(self,other,"Info_Diego_Rebel_11_07"); //O co chodzi z tym buntem?
	AI_Output(other,self,"Info_Diego_Rebel_15_08"); //To dla nas jedyna szansa. Musimy zdoby� poparcie cieni i kopaczy, po czym uderzy� wsp�lnie na stra�nik�w.
	AI_Output(self,other,"Info_Diego_Rebel_11_09"); //Hmm... To mog�oby si� uda�. 
	AI_Output(self,other,"Info_Diego_Rebel_11_10"); //Dlaczego mam Ci zaufa�? �mierdzisz mi korsarzem.
	AI_Output(other,self,"Info_Diego_Rebel_15_11"); //Tak jak wszyscy chc� si� st�d wydosta� w jednym kawa�ku. A piratem nie zosta�em z wyboru.
	AI_Output(self,other,"Info_Diego_Rebel_11_12"); //I co ja niby mam zrobi�?
	AI_Output(other,self,"Info_Diego_Rebel_15_13"); //Wystarczy, �e poka�esz si� cieniom w obozie.
	AI_Output(self,other,"Info_Diego_Rebel_11_14"); //Tylko tyle? I oczywi�cie wejd� tam przez g��wn� bram�, a stra�nicy b�d� mi wiwatowa� przez ca�� drog�.
	AI_Output(self,other,"Info_Diego_Rebel_11_15"); //Pos�uchaj ch�opcze. Mo�e w moim interesie te� le�y, �eby kopn�� Gomeza w dup� tak mocno jak tylko si� da.
	AI_Output(self,other,"Info_Diego_Rebel_11_16"); //Ale nie zamierzam zosta� cholernym bohaterem, bo oni za kr�tko �yj�.
	AI_Output(self,other,"Info_Diego_Rebel_11_17"); //Nie wejd� do Starego Obozu �ywy i dobrze o tym wiesz.
	AI_Output(other,self,"Info_Diego_Rebel_15_18"); //Dobra, znajd� spos�b na to by wprowadzi� Ci� do obozu w bezpieczny spos�b.
	AI_Output(self,other,"Info_Diego_Rebel_11_19"); //Umowa stoi ch�opcze. Mo�e jednak pomyli�em si� co do Ciebie...
	
   B_LogEntry		(CH3_RBL_Shadows, "Diego nie wejdzie do obozu przez �adn� z bram. Cienie nie stan�� przeciwko stra�nikom bez Diego. Musz� znale�� jaki� spos�b...");
	Log_CreateTopic	(CH3_RBL_Diego, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_Diego, LOG_RUNNING);
	B_LogEntry		(CH3_RBL_Diego, "Diego nie przejdzie przez �adn� z bram �ywy - stra�nicy za dobrze go znaj�. Musz� znale�� spos�b na to by wprowadzi� by�ego cienia do obozu. Od tego zale�y powodzenie ataku na Stary Ob�z.");
};

// *************************************************************

INSTANCE Info_Diego_Entrence (C_INFO)
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Entrence_Condition;
	information	= Info_Diego_Entrence_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wiem, jak dostaniesz si� do obozu!"; 
};                       

FUNC INT Info_Diego_Entrence_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Milten_Teleport))&&(Npc_HasItems(other,ItArScrollTeleport1))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Entrence_Info()
{
	B_GiveXP(250);

	AI_Output(other,self,"Info_Diego_Entrence_15_00"); //Wiem, jak dostaniesz si� do obozu!
	AI_Output(self,other,"Info_Diego_Entrence_11_01"); //Wlecimy tam na miot�ach?
	AI_Output(other,self,"Info_Diego_Entrence_15_02"); //Jest prostszy spos�b.
	AI_Output(self,other,"Info_Diego_Entrence_11_03"); //Czyli?
	AI_Output(other,self,"Info_Diego_Entrence_15_04"); //Mam dla Ciebie prezent od starego przyjaciela - Miltena. Ten zw�j magiczny przeniesie Ci� do Starego Obozu.
	AI_Output(self,other,"Info_Diego_Entrence_11_05"); //Sprytne. Mam nadziej�, �e nie wyl�duj� na stole Gomeza.
	AI_Output(self,other,"Info_Diego_Entrence_11_06"); //Jak znam Miltena to mog� spodziewa� si� najgorszego. Ale warto zaryzykowa�.
	AI_Output(self,other,"Info_Diego_Entrence_11_07"); //Szkoda czasu na strz�pienie j�zyka. Do zobaczenia w obozie.
	Log_SetTopicStatus	(CH3_RBL_Diego, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_Diego, "Diego u�yje teleportu do Starego Obozu.");

	B_StopProcessInfos(self);

	B_GiveInvItems(other,self,ItArScrollTeleport1,1);
};

// *************************************************************

INSTANCE Info_Diego_Hide (C_INFO)
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_Hide_Condition;
	information	= Info_Diego_Hide_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Diego_Hide_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Entrence))&&(Npc_GetDistToWp(self,"OCR_HUT_Z5_SIT")<2000)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Hide_Info()
{
	B_GiveXP(500);
	AI_Output(self,other,"Info_Diego_Hide_11_01"); //Nauczy�em si� dzisiaj, �e nie wszyscy piraci to skurwysyny.
	AI_Output(other,self,"Info_Diego_Hide_15_02"); //Nie zawsze jest si� tym kim chcia�oby si� by�, przyjacielu.
	AI_Output(self,other,"Info_Diego_Hide_11_03"); //Zapami�tam to. Bywaj ch�opcze i uwa�aj na siebie.
	AI_Output(self,other,"Info_Diego_Hide_11_04"); //A o Cieni si� nie martw, ju� ja im przem�wi� do rozs�dku.
	
   Npc_ExchangeRoutine	(self, "OCW");
   B_StopProcessInfos	(self);
};

// *************************************************************

INSTANCE Info_Diego_Prison (C_INFO)
{
	npc		= PC_Thief;
	nr		= 5;
	condition		= Info_Diego_Prison_Condition;
	information		= Info_Diego_Prison_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Diego_Prison_Condition()
{
	if (Npc_KnowsInfo(hero,STT_Balam_GoBackDiego))&&(Npc_GetDistToNpc(self,other) < 600)&&(NPC_HasItems(other, DUNGEONKEY)>=1)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Prison_Info()
{
	B_FullStop (other);
	AI_GotoNpc(self, other);
	AI_Output(self,other,"Info_Diego_Prison_11_01"); //Nie s�dzi�em, �e jeszcze zobacz� przyjazn� twarz. Co Ty tu robisz?
	AI_Output(other,self,"Info_Diego_Prison_15_02"); //Jak to co? Robi� za jednoosobowy oddzia�, kt�ry ma za zadanie wydosta� z celi jakiego�  starego pryka.
	AI_Output(self,other,"Info_Diego_Prison_11_03"); //Mam u Ciebie d�ug, przyjacielu.
	AI_Output(other,self,"Info_Diego_Prison_15_04"); //O sp�acie pomy�limy jak uda si� nam st�d wydosta�. Ale najpierw powiedz jak tu trafi�e�.
	AI_Output(self,other,"Info_Diego_Prison_11_05"); //Odkry�em, �e Urt to parszywy zdrajca.
	AI_Output(other,self,"Info_Diego_Prison_15_06"); //No to nie jeste� sam. Masz jakie� dowody?
	AI_Output(self,other,"Info_Diego_Prison_11_07"); //Ja jestem �ywym dowodem!
	AI_Output(self,other,"Info_Diego_Prison_11_08"); //Ten sukinsyn zorientowa� si�, �e go przejrza�em, kiedy potajemnie spotka�em si� z dow�dcami Cieni. Chcia�em razem z nimi pozby� si� Urta, ale by� ode mnie szybszy.
	AI_Output(self,other,"Info_Diego_Prison_11_10"); //Urt przyszed� ze stra�nikami, kt�rzy roznie�li pozosta�ych Cieni. Ja dosta�em po mordzie i odroczony wyrok.
	AI_Output(other,self,"Info_Diego_Prison_15_11"); //To widz�, �e zd��y�em w ostatniej chwili.
	AI_Output(self,other,"Info_Diego_Prison_11_12"); //Chcia�em wys�a� wiadomo�� do przyjaciela, kt�ry by mnie st�d wydosta�, ale stra�nik by� kompletnym idiot�.
	AI_Output(other,self,"Info_Diego_Prison_15_13"); //Co to za przyjaciel?
	AI_Output(self,other,"Info_Diego_Prison_11_14"); //Bezimienny skazaniec. Na szcz�cie Ty si� zjawi�e�.
	AI_Output(self,other,"Info_Diego_Prison_11_15"); //Musz� wydosta� si� z obozu. 
	AI_Output(other,self,"Info_Diego_Prison_15_16"); //A Urt?
	AI_Output(self,other,"Info_Diego_Prison_11_17"); //Teraz jest poza naszym zasi�giem. Jestem pewien, �e jeszcze go spotkamy i zd��ymy mu odp�aci�.
	AI_Output(self,other,"Info_Diego_Prison_11_18"); //Powiedz Balamowi, �e uciek�em i wr�c� z rebeliantami podczas ataku.
	AI_Output(self,other,"Info_Diego_Prison_11_19"); //Niech przygotuje Cieni i Kopaczy. 
	
   if (Npc_KnowsInfo(hero,DIA_Cienius_Fault))&&(Npc_KnowsInfo(hero,DIA_Kopaczus_Fault))
	{

		/**************************

Ork jak ci si� chce i o ile jest to w zasi�gu to mo�naby wzi�� to pod uwag� i cienie i kopacze rzeczywi�cie b�d� mie� pecha bo straznicy w miejscach gdzie ude�� b�d� przygotowani.
Mo�na wtedy od razu u�mierci� 1/3 atakuj�cych a reszta i tak zginie.
czyli jak chest_conf == 2 to stra�nicy x2 tam gdzie maj� zaatakowa� Cienie i Kopacze

**************************/
		Log_SetTopicStatus	(CH6_RBL_Coordinate, LOG_FAILED);
		B_LogEntry		(CH6_RBL_Coordinate, "Spotkanie z wys�annikami kast to podpucha Urta. Przeze mnie zginie wielu Cieni i Kopaczy. Niech to szlag trafi!");

		AI_Output(other,self,"Info_Diego_Prison_15_20"); //Ju� o to zadba�em. Spotka�em si� z wys�annikami Cieni i Kopaczy.
		AI_Output(self,other,"Info_Diego_Prison_11_21"); //Kto powiedzia� Ci o spotkaniu?!
		AI_Output(other,self,"Info_Diego_Prison_15_22"); //Urt... O cholera!
		AI_Output(self,other,"Info_Diego_Prison_11_23"); //To musia�y by� jego wtyki.
		AI_Output(self,other,"Info_Diego_Prison_11_24"); //Czyli stra�nicy teraz dok�adnie wiedz� gdzie uderz� Cienie i Kopacze. Niech to szlag...
		AI_Output(other,self,"Info_Diego_Prison_15_25"); //Dostaniemy si� do �rodka tunelem i mo�e zdo�amy ich ostrzec.
		AI_Output(self,other,"Info_Diego_Prison_11_26"); //W�tpi�. Na to nic ju� nie poradzimy. Miejmy tylko nadziej�, �e rebelianci i najemnicy zd��� ich wesprze�.
	}
	else
	{
		AI_Output(other,self,"Info_Diego_Prison_15_27"); //W porz�dku, dam mu zna�.
		if (Npc_KnowsInfo(hero,DIA_Urt_DiegoJail))
		{
			AI_Output(other,self,"Info_Diego_Prison_15_28"); //Urt poleci� mi skontakowa� si� z wys�annikami Cieni i Kopaczy.
			AI_Output(self,other,"Info_Diego_Prison_11_29"); //A to bydle. To s� jego donosiciele.
			AI_Output(self,other,"Info_Diego_Prison_11_30"); //Pod �adnym pozorem z nimi nie rozmawiaj!
			AI_Output(other,self,"Info_Diego_Prison_15_31"); //Dobrze wiedzie�, zapami�tam to.
			Log_SetTopicStatus	(CH6_RBL_Coordinate, LOG_SUCCESS);
			B_LogEntry		(CH6_RBL_Coordinate, "Ca�e szcz�cie, �e nie spotka�em si� z wys�annikami kast. Dzi�ki temu Cienie i Kopacze b�d� mie� wi�ksze szanse w walce.");
		};
	};
   
	AI_Output(self,other,"Info_Diego_Prison_11_32"); //Mam ju� do�� tej celi. B�d� czeka� na rebeliant�w w pobli�u zachodniej bramy.
	AI_Output(self,other,"Info_Diego_Prison_11_33"); //Jeszcze raz dzi�ki, Rick. Nigdy Ci tego nie zapomn�.
	AI_Output(self,other,"Info_Diego_Prison_11_34"); //Jak to wszystko si� sko�czy to odwied� mnie w Khorinis. Mam zamiar odebra� swoj� w�asno��, a wtedy miasto b�dzie nasze!
	AI_Output(other,self,"Info_Diego_Prison_15_35"); //He, he. Zapami�tam to.

	/*******************
Diego niech czeka tam gdzie czeka� w CH4.
*******************/

	Npc_ExchangeRoutine	(self, "OCWait");

	Log_SetTopicStatus	(CH6_RBL_Diego, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_Diego, "Uwolni�em Diego. B�dzie czeka� w pobli�u zachodniej bramy. Diego na odchodnym zleci� mi jeszcze ma�y sabota� magazyny stra�nik�w znajduj�cego si� w pobli�u ku�ni.");

	B_LogEntry		(CH6_RBL_Spy, "Diego potwierdzi�, �e to Urt zdradzi�. Musz� powiedzie� o tym Balamowi i Ratfordowi.");

	B_LogEntry		(CH6_RBL_Recognise, "Uwolni�em Diego. Przyw�dca Cieni zaczeka na atak w pobli�u palisady a gdy nadejdzie odpowiednia pora poprowadzi Cieni i Kopaczy do walki.");
	/****************************
Ork chc� jeszcze Urta wykorzysta�. Teraz niech zniknie. Stanie na drodze Dicka jak ten b�dzie �ciga� Gomeza.
Na razie niech czeka w jakim� niedost�pnym miejscu.

***************************/

	var C_NPC urt; urt = Hlp_GetNpc(RBL_4062_Urt);
	Npc_ExchangeRoutine	(urt, "HIDE");
   B_StopProcessInfos(self);
};

// *************************************************************

INSTANCE Info_Diego_Prison1 (C_INFO)
{
	npc		= PC_Thief;
	nr		= 6;
	condition		= Info_Diego_Prison1_Condition;
	information		= Info_Diego_Prison1_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Diego_Prison1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Prison))&&(Npc_GetDistToNpc(self,other) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Prison1_Info()
{
	B_FullStop (other);
	AI_TurnToNpc(self, other);
	
   AI_Output(self,other,"Info_Diego_Prison1_11_01"); //Aha i jeszcze jedno.
	AI_Output(other,self,"Info_Diego_Prison1_15_02"); //Tak?
	AI_Output(self,other,"Info_Diego_Prison1_11_03"); //Nie masz ochoty na ma�y sabota�?
	AI_Output(other,self,"Info_Diego_Prison1_15_04"); //Czemu nie, skoro nie mog� dorwa� Urta, to odreaguj� inaczej.
	AI_Output(self,other,"Info_Diego_Prison1_11_05"); //�wietnie. Zdob�d� klucz do magazynu przy ku�ni w zamku i zabierz stamt�d tyle broni ile si� da.
	AI_Output(self,other,"Info_Diego_Prison1_11_06"); //Przede wszystkim zdob�d� pi�� egzemplarzy piewcy zag�ady. Te bastardy to ulubiona bro� osobistych przydupas�w Gomeza. 
	AI_Output(other,self,"Info_Diego_Prison1_15_07"); //Nie wiesz, gdzie znajd� klucz?
	AI_Output(self,other,"Info_Diego_Prison1_11_08"); //Mia� go przy sobie Stone, ale Gomez te� kaza� go wtr�ci� do lochu.
	AI_Output(self,other,"Info_Diego_Prison1_11_09"); //Skip zabra� Stonowi klucz, wi�c to on jest twoim celem.
	AI_Output(other,self,"Info_Diego_Prison1_15_10"); //Wiem ju� wszystko co nale�y. Bywaj, Diego.
	AI_Output(self,other,"Info_Diego_Prison1_11_11"); //Powodzenia, Rick.
	Log_CreateTopic	(CH6_RBL_Thievery, LOG_MISSION);
	Log_SetTopicStatus	(CH6_RBL_Thievery, LOG_RUNNING);
	B_LogEntry		(CH6_RBL_Thievery, "Na zako�czenie mam jeszcze na g�owie ma�y sabot w Starym Obozie. Musz� zdoby� 5 egzemplarzy piewcy zag�ady. Te bastardy s� przechowywane w magazynie przy ku�ni w zamku. Klucz powinien mie� Skip. Musz� odnie�� te miecze Diego.");

   B_StopProcessInfos(self);
	/**************************
Ork wrzu� Skipowi do inv klucz od magazynu przy ku�ni.
Na razie zrobi�em ten, �eby w og�le co� by�o, zamie� go na w�a�ciwy
*************************/

	//var C_NPC skip; skip = Hlp_GetNpc(GRD_211_Skip);
	//CreateInvItems (skip,ITKEY_OB_SMITH_01,1);
};

// *************************************************************

INSTANCE Info_Diego_Swords (C_INFO)
{
	npc		= PC_Thief;
	nr		= 7;
	condition		= Info_Diego_Swords_Condition;
	information		= Info_Diego_Swords_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam miecze."; 
};                       

FUNC INT Info_Diego_Swords_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Prison1))&& (Npc_KnowsInfo(hero, DIA_Skip_Warehouse))&&(NPC_HasItems(other,ItMw_1H_Sword_Bastard_05)>=4)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Swords_Info()
{
	AI_Output(other,self,"Info_Diego_Swords_15_01"); //Mam miecze.
	AI_Output(self,other,"Info_Diego_Swords_11_02"); //To �wietnie. Chcia�bym zobaczy� miny stra�nik�w, kiedy si� zorientuj�, �e ich b�yskotki znikn�y.
	AI_Output(other,self,"Info_Diego_Swords_15_03"); //W magazynie by�y tylko trzy miecze. Czwarty ukrad�em ze skrzyni Arto.
   
   if (NPC_HasItems(other,ItMw_1H_Sword_Bastard_05)==4)
	{
		AI_Output(other,self,"Info_Diego_Swords_15_04"); //Ostatni gdzie� zagin��.
		AI_Output(self,other,"Info_Diego_Swords_11_05"); //Nie szkodzi, nie�le si� spisa�e�. We� to, powinno Ci si� przyda�.

		Create_and_give(ItMiNugget, 200);
	}
	else if (NPC_HasItems(other,ItMw_1H_Sword_Bastard_05)==5)
	{
		AI_Output(other,self,"Info_Diego_Swords_15_07"); //Pi�te ostrze znalaz�em w do�� dziwnym miejscu.

		/***************************
Ork ten miecz trzeba gdzie� fajnie zabunkrowa� w kolonii, mo�e przy jakim� szkielecie stra�nika na terenach ork�w? Jak wsadzisz go spacerem to dopisz w dialogu gdzie Dick go znalaz� - tak, tam gdzie zostawi�em te 3 kropki xD

****************************/
		AI_Output(self,other,"Info_Diego_Swords_11_08"); //Zadziwiasz mnie, Rick. We� to, powinno Ci si� przyda�.

		Create_and_give(ItMiNugget, 250);
	};

	AI_Output(self,other,"Info_Diego_Swords_11_09"); //Oddam te ostrza rebeliantom przed atakiem.
	AI_Output(other,self,"Info_Diego_Swords_15_10"); //Ciekawe co powiedz� stra�nicy na ich widok, he, he.

	B_GiveInvItems (other,self,ItMw_1H_Sword_Bastard_05,NPC_HasItems(other,ItMw_1H_Sword_Bastard_05));
	Npc_RemoveInvItems(self,ItMw_1H_Sword_Bastard_05,NPC_HasItems(self,ItMw_1H_Sword_Bastard_05));

	Log_SetTopicStatus	(CH6_RBL_Thievery, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_Thievery, "Diego dosta� miecze. Powiedzia�, �e da je rebeliantom przed atakiem - porz�dne ostrza na pewno si� przydadz�.");
   
   B_StopProcessInfos	(self);
};

/*******************************
Diego z kilkoma cieniami i kopaczami spotka ich po wyj�ciu z tunelu do loch�w, dialog niech si� od razu odpali jak tak si� pojawi�

*******************************/

// *************************************************************

INSTANCE Info_Diego_Tunel (C_INFO)
{
	npc		= PC_Thief;
	nr		= 10;
	condition		= Info_Diego_Tunel_Condition;
	information		= Info_Diego_Tunel_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Diego_Tunel_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Cavalorn_TunelTrapAfter))&&(Npc_GetDistToNpc(self,other) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Tunel_Info()
{
	B_FullStop (other);
	AI_GotoNpc(self, other);
	AI_Output(self,other,"Info_Diego_Tunel_11_01"); //Znowu si� spotykamy, przyjacielu. S�ysza�em jaki� rumor, co si� sta�o?
	AI_Output(other,self,"Info_Diego_Tunel_15_02"); //Sekciarze zawalili tunel. Tylko my zdo�ali�my przej��.
	AI_Output(self,other,"Info_Diego_Tunel_11_03"); //Nie mamy wyboru, musimy otworzy� bram�. 
	AI_Output(self,other,"Info_Diego_Tunel_11_04"); //Wy ruszajcie do zamku, mo�e dorwiecie tam Gomeza.
	AI_Output(self,other,"Info_Diego_Tunel_11_05"); //Ja z cieniami zajmiemy si� bramami i stra�nikami, kt�rzy stan� nam na drodze.
	AI_Output(other,self,"Info_Diego_Tunel_15_06"); //Powodzenia.
	B_LogEntry		(CH6_RBL_PayDay, "Spotkali�my w lochach Diego. On z cieniami zajm� si� bramami, my ruszymy do zamku rozprawi� si� z Gomezem.");

	/**********************************
Mo�e zr�b mu takiego ZSa w tej rutynie, �e lata od bramy do bramy i je otwiera: zamkowa, po�udniowa i zachodnia.

********************************/

	Npc_ExchangeRoutine	(self, "gates");
	B_StopProcessInfos	(self);

	/********************
Niech Diego wyjdzie niby z tunelu...

*******************/
	//TODO: Rutyna poczatkowa diego - poza OR
	AI_GotoWP		(self, "TUNEL_OUT");
};


INSTANCE DIA_Diego_CanYouTeachMe (C_INFO)
{
	npc				= PC_Thief;
	condition		= DIA_Diego_CanYouTeachMe_Condition;
	information		= DIA_Diego_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Diego_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Diego_Hide))
	{
		return 1;
	};
};

FUNC VOID DIA_Diego_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Diego_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Diego_CanYouTeachMe_12_02"); //Mog� pokaza� ci �wiczenia zwi�kszaj�ce zr�czno��.
	AI_Output (self, other, "DIA_Diego_CanYouTeachMe_12_03"); //Nie�le te� radz� sobie z �ukiem.	
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Diego poka�e mi jak lepiej szy� z �uku i jak zwi�kszy� zr�czno��.");
};