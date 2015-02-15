// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_RBL_2604_Tony_Exit (C_INFO)
{
	npc			= RBL_2604_Tony;
	nr			= 999;
	condition	= DIA_RBL_2604_Tony_Exit_Condition;
	information	= DIA_RBL_2604_Tony_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_RBL_2604_Tony_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_RBL_2604_Tony_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_RBL_2604_Tony_Warn (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 2;
	condition		= DIA_RBL_2604_Tony_Warn_Condition;
	information		= DIA_RBL_2604_Tony_Warn_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RBL_2604_Tony_Warn_Condition()
{
	//Grds at last need to be down.
	var c_npc grd1; var c_npc grd2;
	grd1 = Hlp_GetNpc(GRD_2599_Guard);
	grd2 = Hlp_GetNpc(GRD_4063_Guard);
	if (Npc_GetDistToNpc(self,hero) < 450)
	&& (grd1.attribute[ATR_HITPOINTS]<2)
	&& (grd2.attribute[ATR_HITPOINTS]<2)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2604_Tony_Warn_Info()
{
	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);	
	
	AI_ReadyMeleeWeapon			(hero);
	self.flags = 0;
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_01"); //Ten �achmyta nosi czerwon� zbroj�, wyprujmy mu flaki!
	AI_ReadyMeleeWeapon			(hank);
	AI_ReadyMeleeWeapon			(rodney);
	AI_ReadyMeleeWeapon			(angus);	
	AI_Output (self, other,"DIA_RBL_2604_Tony_Warn_08_02"); //St�jcie! Schowajcie miecze zanim b�dzie za p�no!
	//	AI_RemoveWeapon 			( rodney );	
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_03"); //Za p�no na co, czerwona mendo?!	
	AI_Output (self, other,"DIA_RBL_2604_Tony_Warn_08_04"); //Na pomy�k�, kt�ra mo�e was i mnie kosztowa� �ycie.
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_05"); //M�w ja�niej, bo ko�czy mi si� cierpliwo��.
	// 	AI_RemoveWeapon 			( angus );	
	// 	AI_RemoveWeapon 			( hank );
	AI_Output (self, other,"DIA_RBL_2604_Tony_Warn_08_06"); //Polujecie na czerwone zbroje?
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_07"); //Tylko si� bronimy. Ci dranie rzucili si� na nas na pla�y, kiedy chcieli�my spokojnie porozmawia�.
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_08"); //Drugi raz nie pope�nimy tego samego b��du. A wiadomo, �e najlepsz� obron� jest atak.
	AI_Output (self, other,"DIA_RBL_2604_Tony_Warn_08_09"); //Jeste�my po tej samej stronie barykady. Jestem zbiegiem ze Starego Obozu. To ludzie stamt�d nosz� czerwone pancerze.
	//	AI_RemoveWeapon 			( hero );		
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_10"); //Stary Ob�z? A sk�d ja mam wiedzie�, �e m�wisz prawd�?
	AI_Output (self, other,"DIA_RBL_2604_Tony_Warn_08_11"); //Udowodni� to. Zaprowadz� was do Obozu Rebeliant�w, do kt�rego teraz nale��.
	Log_CreateTopic	(CH1_Pir_RebelCamp, LOG_MISSION);
	B_LogSetTopicStatus(CH1_Pir_RebelCamp, LOG_RUNNING);
	B_LogEntry		(CH1_Pir_RebelCamp, "Spotkali�my kolesia w czerwonej zbroi, kt�ry twierdzi, �e jest uciekinierem ze Starego Obozu. W zamian za �ycie chce nam udowodni�, �e m�wi prawd� i zaprowadzi nas do Obozu Rebeliant�w, do kt�rego podobno teraz nale�y."); 
	
	//Npc_ExchangeRoutine(self,"START");	
};

instance  RBL_2604_Tony_CAMPS (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 3;
	condition		= RBL_2604_Tony_CAMPS_Condition;
	information		= RBL_2604_Tony_CAMPS_Info;
	permanent		= 0;
	important		= 0;
	description		= "Powiedz nam co� wi�cej o tych obozach."; 
};

FUNC int  RBL_2604_Tony_CAMPS_Condition()
{
	if (Npc_KnowsInfo(other,DIA_RBL_2604_Tony_Warn))
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_CAMPS_Info()
{
	AI_Output (other, self,"RBL_2604_Tony_CAMPS_Info_15_01"); //Powiedz nam co� wi�cej o tych obozach.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_02"); //Sk�d wy si� wzi�li�cie?
	AI_Output (other, self,"RBL_2604_Tony_CAMPS_Info_15_03"); //Powiedzmy, �e przyp�yn�li�my.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_04"); //W porz�dku, nie chc� wiedzie� nic wi�cej. Wracaj�c do oboz�w...
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_05"); //Znajdujemy si� w Kolonii Karnej. To tutaj Rhobar zsy�a najgorszych przest�pc�w, kt�rzy zdychaj� w kopalniach wydobywaj�c dla kr�lewskiej armii bezcenn� rud�.	
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_06"); //Przed powstaniem bariery stra�e zamieszkiwa�y na zamku. Kiedy powsta�a magiczna os�ona co� posz�o nie tak. Natychmiast wykorzysta� to Gomez i jego banda.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_07"); //Stra�nicy nie mieli najmniejszych szans. Ludzie ze Starego Obozu wyr�n�li prawie wszystkich, zostawiaj�c przy �yciu tylko mag�w ognia, kt�rych zreszt� zamordowali zaledwie kilka dni temu.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_08"); //Wtedy te� da�em nog� z obozu tych psychopat�w.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_09"); //Poza Starym Obozem powsta� te� Nowy Ob�z i Ob�z Bractwa na bagnach.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_10"); //W Nowym Obozie rz�dz� magowie wody i najemnicy. Ruda, kt�r� si� tam wydobywa nie trafia jednak do kr�lewskich ku�ni. 
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_11"); //Magowie Wody sk�aduj� kruszec w ogromnym kopcu. Podobno chc� wykorzysta� rud� do ucieczki z Kolonii.	
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_12"); //Z kolei Ob�z Bractwa na bagnach to banda �wir�w uzale�nionych od bagiennego ziela. Ci wierz� w jakiego� �ni�cego, kt�ry ma im zwr�ci� wolno��.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_13"); //Jak si� pewnie domy�lasz, nie ka�demu odpowiada�o �ycie w tych obozach.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_14"); //Dlatego w�a�nie powsta� Ob�z Rebeliant�w.
};

instance  RBL_2604_Tony_RebelCamp (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 4;
	condition		= RBL_2604_Tony_RebelCamp_Condition;
	information		= RBL_2604_Tony_RebelCamp_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ob�z Rebeliant�w?"; 
};

FUNC int  RBL_2604_Tony_RebelCamp_Condition()
{
	if (Npc_KnowsInfo(other,RBL_2604_Tony_CAMPS))
	{
		return 1;
	};
};


FUNC void  RBL_2604_Tony_RebelCamp_Info()
{
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_01"); //Ob�z Rebeliant�w?
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_02"); //Tak. A co w tym dziwnego?
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_03"); //Nie s�dzi�em, �e mordercy, gwa�ciciele i z�odzieje odczuwaj� potrzeb� rebelii.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_04"); //Nikt nie lubi, jak si� mu m�wi co ma robi�.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_05"); //W Starym Obozie wszystko kr�ci si� wok� rudy i Gomeza. Wychylisz si� i czapa.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_06"); //W Nowym Obozie nikt Ci� nie szanuje, chyba, �e jeste� s�ugusem na posy�ki Mag�w Wody.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_07"); //A Bractwo to banda �pun�w wierz�cych w urojonego bo�ka.
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_08"); //Zaczynam rozumie�. Pewnie sam da�bym sobie z nimi spok�j.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_09"); //Dlatego w�a�nie uciek�em ze Starego Obozu.
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_10"); //Cz�owiek powinien sam decydowa� o w�asnym losie. Nawet je�eli musi wybra� 'mniejsze z�o'.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_11"); //W rzeczy samej.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_12"); //Mo�e i jeste�my band� skaza�c�w, ale nawet skaza�cy maj� sw�j honor i dum�.
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_13"); //Czyli Ob�z Rebeliant�w to zbieranina z pozosta�ych oboz�w?	
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_14"); //Mo�na tak powiedzie�. A Ty i twoi przyjaciele pr�dzej czy p�niej te� b�dziecie musieli wybra�, po kt�rej stronie staniecie.
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_15"); //To si� jeszcze oka�e. Kto jest waszym przyw�dc�?
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_16"); //Cavalorn, kiedy� tak�e nale�a� do Starego Obozu.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_17"); //Zreszt� zamiast strz�pi� j�zyk, mog� was tam zaprowadzi�.
   
	B_LogEntry		(CH1_Pir_RebelCamp, "Ob�z Rebeliant�w zrzesza uciekinier�w z pozosta�ych oboz�w. Przewodzi nimi niejaki Cavalorn.");
};

var int oc_tony_know;

///////////////////////////////
//OLD CAMP
/////////////////////////////	
instance  RBL_2604_Tony_OLDCAMP (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 5;	
	condition		= RBL_2604_Tony_OLDCAMP_Condition;
	information		= RBL_2604_Tony_OLDCAMP_Info;
	important		= 0;
	permanent		= 1;
	description		= "Opowiedz mi o Starym Obozie."; 
};

FUNC int  RBL_2604_Tony_OLDCAMP_Condition()
{
	if Npc_KnowsInfo(hero, RBL_2604_Tony_CAMPS)
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_OLDCAMP_Info()
{
	AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Info_15_01"); //Opowiedz mi o Starym Obozie.
	AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Info_07_02"); //To stamt�d uciek�em, wi�c co nieco wiem o tym miejscu.
	if (oc_tony_know == FALSE)
	{
		oc_tony_know = TRUE;
		Log_CreateTopic	(CH1_Pir_OldCamp, LOG_NOTE);
		B_LogEntry		(CH1_Pir_OldCamp, "Tony uciek� ze Starego Obozu. Mog� dowiedzie� si� od niego du�o wi�cej o tym miejscu.");
	};

	Info_ClearChoices (RBL_2604_Tony_OLDCAMP );
	Info_AddChoice		(RBL_2604_Tony_OLDCAMP,"Dzi�ki za informacje. (wr��)"	,RBL_2604_Tony_OLDCAMP_Exit);		
	
	if (Tony_Members == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s� ludzie ze Starego Obozu?"	,RBL_2604_Tony_OLDCAMP_Members);
	};
	if (Tony_Jobs == FALSE)
	{
		Info_AddChoice (RBL_2604_Tony_OLDCAMP,"Czym dok�adnie zajmuje si� Stary Ob�z?"	,RBL_2604_Tony_OLDCAMP_Jobs);
	};
	if (Tony_Chief == FALSE)
	{
		Info_AddChoice (RBL_2604_Tony_OLDCAMP,"Kto jest szefem w Starym Obozie?"	,RBL_2604_Tony_OLDCAMP_Chief);	
	};
};

FUNC void  RBL_2604_Tony_OLDCAMP_Members()
{
	if (Tony_Members==FALSE)
	{
		Tony_Members = TRUE;
		Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Members_Info_15_01"); //Kim s� ludzie ze Starego Obozu?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Members_Info_07_02"); //Cz�onkowie Starego Obozu dziel� si� na cztery kasty - magnaci, stra�nicy, cienie i kopacze.
		
      B_LogEntry		(CH1_Pir_OldCamp, "Stary Ob�z zamieszkuj� cztery kasty: magnaci, stra�nicy, cienie i kopacze.");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Members_Info_15_03"); //Kim s� ludzie ze Starego Obozu?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Members_Info_07_04"); //Przecie� ju� ci o tym m�wi�em.
		Info_ClearChoices (RBL_2604_Tony_OLDCAMP );
		if (Tony_OreBaron == FALSE)
		{
			Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Opowiedz mi o magnatach."	,RBL_2604_Tony_OLDCAMP_OreBaron);
		};
		if (Tony_Guards == FALSE)
		{
			Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s� stra�nicy?",RBL_2604_Tony_OLDCAMP_Guards);
		};
		if (Tony_Diggers == FALSE)
		{	
			Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Mo�esz mi co� powiedzie� o kopaczach?",RBL_2604_Tony_OLDCAMP_Diggers);	
		};
		if (Tony_Shadows == FALSE)
		{
			Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Cienie? Kim s� cienie?"	,RBL_2604_Tony_OLDCAMP_Shadows);
		};
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"To mi wystarczy (Powr�t).",RBL_2604_Tony_OLDCAMP_Back);
	};
};


FUNC void  RBL_2604_Tony_OLDCAMP_Jobs()
{
	if (Tony_Jobs == FALSE)
	{
		Tony_Jobs = TRUE;
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Jobs_Info_15_01"); //Czym dok�adnie zajmuje si� Stary Ob�z?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_02"); //Stary Ob�z od pocz�tku istnienia dostarcza� magiczn� rud� kr�lowi.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_03"); //W zamian za ni� otrzymuje wszystko czego zapragnie.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_04"); //Ostatnio stra�nicy i magnaci zacz�li podejrzewa�, �e cienie s� w zmowie z rebeliantami. Pola�a si� krew.	
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_05"); //Dlatego si� stamt�d wynios�em.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_06"); //Cienie nadal s�u�� Gomezowi, jednak sytuacja jest do�� napi�ta.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_07"); //Gomez nie mo�e otwarcie napu�ci� na nich swoich stra�nik�w, bo straci�by zbyt wielu swoich ludzi i os�abi� ob�z.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_08"); //Wiedz� o tym magnaci, stra�nicy jak i cienie. Kto wie jak to si� sko�czy...
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_09"); //Najgorzej maj� kopacze. Od �witu do zmierzchu haruj� w pocie czo�a przy wydobyciu rudy.	
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_10"); //A jedyne co z tego maj� to �arcie i obelgi stra�nik�w.	
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_11"); //Gdyby kopacze stan�li po stronie cieni, to Gomez mia�by spory problem.
		B_LogEntry		(CH1_Pir_OldCamp, "Sytuacja w Starym Obozie wydaje si� do�� napi�ta. Magnaci i stra�nicy nie ufaj� cieniom, nie mog� jednak otwarcie przeciwko nim wyst�pi�, bo za bardzo os�abi�oby to si�y obozu. Warto te� pami�ta� o kopaczach, kt�rzy szczerze nienawidz� stra�nik�w.");	
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Jobs_Info_15_12"); //Czym dok�adnie zajmuje si� Stary Ob�z?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_13"); //Przecie� ju� Ci o tym m�wi�em.
		Info_ClearChoices (RBL_2604_Tony_OLDCAMP );
	};
};

FUNC void  RBL_2604_Tony_OLDCAMP_Chief()
{
	if (Tony_Chief == FALSE)
	{
		Tony_Chief = TRUE;
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Chief_Info_15_01"); //Kto jest szefem w Starym Obozie?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Chief_Info_07_02"); //W Starym Obozie niepodzielnie rz�dz� magnaci.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Chief_Info_07_03"); //A najwi�kszym skurwysynem w�r�d nich jest Gomez.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Chief_Info_07_04"); //Gomez to szaleniec. Liczy si� dla niego tylko w�adza, kt�r� mo�e kupi� za rud�.	
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Chief_Info_07_05"); //Zrobi wszystko by przej�� kontrol� nad wydobyciem rudy w Kolonii.
		B_LogEntry		(CH1_Pir_OldCamp, "Przyw�dc� magnat�w w Starym Obozie jest Gomez. Tony twierdzi, �e Gomez nie cofnie si� przed niczym by zdoby� kontrol� nad kopalniami rudy w Kolonii.");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Chief_Info_15_06"); //Kto jest szefem w Starym Obozie?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Chief_Info_07_07"); //Nie lubi� si� powtarza�.
		Info_ClearChoices (RBL_2604_Tony_OLDCAMP );
	};
};

FUNC void  RBL_2604_Tony_OLDCAMP_OreBaron()
{
	if (Tony_OreBaron == FALSE)
	{
		Tony_OreBaron = TRUE;
		AI_Output (other, self,"RBL_2604_Tony_OreBaron_Info_15_00");//Opowiedz mi o magnatach.
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_01"); //Magnaci sprawuj� niepodzieln� w�adz� w Starym Obozie.
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_02"); //Ich wola decyduje o �yciu lub �mierci.
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_03"); //Magnaci wymieniaj� rud� na wszystko czego zapragn�. Dostaj� nawet kobiety!
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_04"); //Kr�l musi spe�ni� ka�d� zachciank� tych pijawek. Nie mo�e ryzykowa� utraty dostaw magicznej rody.
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_05"); //Czym wtedy walczyliby jego dzielni paladyni z orkami pustosz�cymi kontynent?
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_06"); //Tak naprawd� koniec magicznej rudy oznacza koniec Myrtany.
		B_LogEntry		(CH1_Pir_OldCamp, "Magnaci otrzymuj� od kr�la za magiczn� rud� wszystko czego zapragn�.");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_OreBaron_Info_15_00");//Opowiedz mi o magnatach.
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_01"); //Ju� o nich pyta�e�.
	};
	Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
	if (Tony_OreBaron == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Opowiedz mi o magnatach."	,RBL_2604_Tony_OLDCAMP_OreBaron);
	};
	if (Tony_Guards == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s� stra�nicy?"	,RBL_2604_Tony_OLDCAMP_Guards);
	};
	if (Tony_Diggers == FALSE)
	{	
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Powiedzie� mi co� wi�cej o kopaczach?"	,RBL_2604_Tony_OLDCAMP_Diggers);	
	};
	if (Tony_Shadows == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Cienie? Kim s� cienie?"	,RBL_2604_Tony_OLDCAMP_Shadows);
	};
	Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"To mi wystarczy (Powr�t)."	,RBL_2604_Tony_OLDCAMP_Back);



};
FUNC void  RBL_2604_Tony_OLDCAMP_Guards()
{
	if (Tony_Guards == FALSE)
	{
		Tony_Guards = TRUE;
		AI_Output (other, self,"RBL_2604_Tony_Guards_Info_15_00"); //Kim s� stra�nicy?
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_15_01"); //Stra�nicy pilnuj� Starego Obozu i kopalni nale��cej do magnat�w.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_02"); //Dowodzi nimi Thorus. To prawdziwy twardziel. Ci�ko go zabi�... On zasze wraca! 
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_03"); //Chyba jako jedyny stra�nik nie pochwala� eliminacji podejrzanych Cieni.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_04"); //Thorus jest jednak lojalny. Wype�ni ka�de polecenie Gomeza, nawet je�eli nie b�dzie si� z nim zgadza�.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_05"); //Stra�nicy to najwi�ksza si�a Starego Obozu.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_06"); //S� w�r�d nich te� prawdziwe menty, rz�dni krwi sady�ci i socjopaci. Jak nie przymierzaj�c Bloodwyn.
		AI_Output (other, self,"RBL_2604_Tony_Guards_Info_15_09"); //Kim jest Bloodwyn?
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_10"); //Bloodwyn gdyby m�g� wlaz�by Gomezowi do ty�ka bez �oju z kretoszczura.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_11"); //Zrobi dla niego wszystko.	
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_12"); //Do tego ci�gle pastwi si� nad kopaczami i czerpie z tego perwersyjn� przyjemno��.	
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_13"); //Kolejny sadysta to Szakal.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_14"); //Chocia� ten woli szuka� wyzwa� w�r�d Cieni lub nawet innych Stra�nik�w.	
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_15"); //W ka�dym razie stra�nicy ze Starego Obozu to najgorsze menty w ca�ej kolonii.	
		B_LogEntry		(CH1_Pir_OldCamp, "Stra�nicy ze Starego Obozu to najwi�ksze sukinsyny w kolonii. Na szczeg�ln� uwag� zas�uguj� Bloodwyn i Szakal.");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_Guards_Info_15_00"); //Kim s� stra�nicy?
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_15_01"); //Przecie� ju� wiesz.
	};
	Info_ClearChoices (RBL_2604_Tony_OLDCAMP );
	if (Tony_OreBaron == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Opowiedz mi o magnatach."	,RBL_2604_Tony_OLDCAMP_OreBaron);
	};
	if (Tony_Guards == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s� stra�nicy?"	,RBL_2604_Tony_OLDCAMP_Guards);
	};
	if (Tony_Diggers == FALSE)
	{	
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Mo�esz mi co� powiedzie� o kopaczach?"	,RBL_2604_Tony_OLDCAMP_Diggers);	
	};
	if (Tony_Shadows == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Cienie? Kim s� cienie?"	,RBL_2604_Tony_OLDCAMP_Shadows);
	};
	Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"To mi wystarczy (Powr�t)."	,RBL_2604_Tony_OLDCAMP_Back);
};

FUNC void  RBL_2604_Tony_OLDCAMP_Shadows()
{
	if (Tony_Shadows == FALSE)
	{
		Tony_Shadows = TRUE;
      
		AI_Output (other, self,"RBL_2604_Tony_Shadows_Info_15_00"); //Cienie? Kim s� cienie?
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_01"); //Cienie to g��wnie zwiadowcy i my�liwi. Kto� pomi�dzy kopaczem, a stra�nikiem.
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_02"); //Kiedy� by�em jednym z  nich.
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_03"); //Przyw�dc� cieni jest, lub raczej by�, Diego. To prawdziwy twardziel.
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_04"); //Nawet magnaci go szanuj�, cho� jest dla nich jak wrz�d na ty�ku.	
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_05"); //Diego ma zasady i nigdy ich nie �amie. Mo�e dlatego jest tak niebezpieczny dla magnat�w.
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_06"); //Do tego Diego �yje w dobrych stosunkach z ka�d� wp�ywow� osob� w Kolonii niezale�nie od tego z jakiego obozu ta osoba pochodzi.
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_07"); //Je�eli w Starym Obozie kto� mo�e bezpo�rednio zagrozi� magnatom to tym kim� jest w�a�nie Diego.
		B_LogEntry		(CH1_Pir_OldCamp, "Cienie to g��wnie my�liwi i zwiadowcy. Ich przyw�dc� jest niejaki Diego. Podobno szanuj� go wszyscy mieszka�cy kolonii niezale�nie od obozu, do kt�rego nale��.");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_Shadows_Info_15_00"); //Cienie? Kim s� cienie?
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_01"); //Cieniami i tyle.
	};
	Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
	if (Tony_OreBaron == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Opowiedz mi o magnatach."	,RBL_2604_Tony_OLDCAMP_OreBaron);
	};
	if (Tony_Guards == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s� stra�nicy?"	,RBL_2604_Tony_OLDCAMP_Guards);
	};
	if (Tony_Diggers == FALSE)
	{	
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Mo�esz mi co� powiedzie� o kopaczach?"	,RBL_2604_Tony_OLDCAMP_Diggers);	
	};
	if (Tony_Shadows == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Cienie? Kim s� cienie?"	,RBL_2604_Tony_OLDCAMP_Shadows);
	};
	Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"To mi wystarczy (Powr�t)."	,RBL_2604_Tony_OLDCAMP_Back);
};

FUNC void  RBL_2604_Tony_OLDCAMP_Diggers()
{
	if (Tony_Diggers == FALSE)
	{
		Tony_Diggers = TRUE;
      
		AI_Output (other, self,"RBL_2604_Tony_Diggers_Info_15_00"); //Mo�esz mi co� powiedzie� o kopaczach?
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_01"); //Wyobra� sobie kogo� kto za sple�nia�y ser czy zepsute mi�so pracuje w pocie czo�a od zmierzchu do �witu.
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_02"); //Wyobra� sobie kogo� kto ci�gle s�ucha obelg stra�nik�w, kto za nieopatrzne spojrzenie traci ostatnie z�by. 
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_03"); //W ko�cu wyobra� sobie kogo� kto dla krotochwili stra�nik�w walczy w nier�wnej walce o �ycie jak zaszczuty pies.
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_04"); //To s� w�a�nie kopacze.
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_05"); //Ostatnie ogniwo �a�cucha pokarmowego w Kolonii.
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_06"); //Jednak wbrew pozorom, nawet kopacze mog� by� sporym zagro�eniem. Gdyby znalaz� si� kto� kto zdo�a�by ich zjednoczy� i wskaza� wsp�lny cel...
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_07"); //Jedyn� osob�, kt�ra przychodzi mi na my�l jest Diego. 
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_08"); //W ko�cu nawet paladyn Innosa dupa kiedy wrog�w kupa, he, he.
		B_LogEntry		(CH1_Pir_OldCamp, "Wiem, �e nie chcia�bym zosta� kopaczem. Dziwi� si�, �e ludzie daj� si� tak upodla�, tylko po to, �eby prze�y�. Mo�e znajdzie si� kiedy� kto� kto wska�e kopaczom inny cel w �yciu?");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_Diggers_Info_15_00"); //Mo�esz mi co� powiedzie� o kopaczach?
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_01"); //Szkoda na to czasu.
	};
   
	Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
	if (Tony_OreBaron == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Opowiedz mi o magnatach."	,RBL_2604_Tony_OLDCAMP_OreBaron);
	};
	if (Tony_Guards == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s� stra�nicy?"	,RBL_2604_Tony_OLDCAMP_Guards);
	};
	if (Tony_Diggers == FALSE)
	{	
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Mo�esz mi co� powiedzie� o kopaczach?"	,RBL_2604_Tony_OLDCAMP_Diggers);	
	};
	if (Tony_Shadows == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Cienie?... Kim s� cienie?"	,RBL_2604_Tony_OLDCAMP_Shadows);
	};
   
	Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"To mi wystarczy (Powr�t)."	,RBL_2604_Tony_OLDCAMP_Back);
};

FUNC void  RBL_2604_Tony_OLDCAMP_Back()
{
	Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
	
   if (Tony_Members == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s� ludzie z Starego Obozu?"	,RBL_2604_Tony_OLDCAMP_Members);
	};
   
	if (Tony_Jobs == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Czym konkretnie zajmuje si� Stary Ob�z?"	,RBL_2604_Tony_OLDCAMP_Jobs);
	};
   
	if (Tony_Chief == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kto jest szefem w Starym Obozie?"	,RBL_2604_Tony_OLDCAMP_Chief);	
	};
   
	Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Dzi�ki za informacje. (powr�t)"	,RBL_2604_Tony_OLDCAMP_Exit);	
};

FUNC void  RBL_2604_Tony_OLDCAMP_Exit()
{
	Tony_Members = TRUE;
	Tony_Jobs = TRUE;
	Tony_Chief = TRUE;
	Tony_Guards = TRUE;
	Tony_Shadows = TRUE;
	Tony_Diggers = TRUE;
	Tony_OreBaron = TRUE;
	Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
};

instance  RBL_2604_Tony_Fallow (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 6;
	condition		= RBL_2604_Tony_Fallow_Condition;
	information		= RBL_2604_Tony_Fallow_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zaprowad� nas do Obozu Rebeliant�w."; 
};

FUNC int  RBL_2604_Tony_Fallow_Condition()
{
	if (Npc_KnowsInfo(other,DIA_RBL_2604_Tony_Warn))
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_Fallow_Info()
{
	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);	
	Party_AddNpc(hank);
	Party_AddNpc(rodney);
	Party_AddNpc(angus);
   
	AI_Output (other, self,"RBL_2604_Tony_Fallow_Info_15_01"); //Zaprowad� nas do Obozu Rebeliant�w.
	AI_Output (self, other,"RBL_2604_Tony_Fallow_Info_07_02"); //�wietnie. Chod�cie za mn�, tylko si� nie zgubcie.
	
   B_LogEntry		(CH1_Pir_RebelCamp, "Tony zaprowadzi mnie do Obozu Rebeliant�w.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self, "GuideOR");
	// Bugfix: Pirates sometimes disapear so follow pc routine is
	// set after that dialog, not cinematic - orc
	Npc_ClearAiQueue(angus);		
	Npc_ClearAiQueue(hank);		
	Npc_ClearAiQueue(rodney);		
	Npc_ExchangeRoutine	(angus,"FOLPC2HUN");
	Npc_ExchangeRoutine(hank,"FOLPC2HUN");
	Npc_ExchangeRoutine(rodney,"FOLPC2HUN");	
	self.flags=NPC_FLAG_FRIEND;
	B_SetPermAttitude(self,ATT_FRIENDLY);	
	B_StopProcessInfos	(self);	
};

instance  RBL_2604_Tony_FallowEnd (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 7;
	condition		= RBL_2604_Tony_FallowEnd_Condition;
	information		= RBL_2604_Tony_FallowEnd_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  RBL_2604_Tony_FallowEnd_Condition()
{
	if (Npc_KnowsInfo(other,RBL_2604_Tony_Fallow))&&(Npc_GetDistToWP (self,"OW_PATH_OC_NC4") < 500 )
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_FallowEnd_Info()
{
	B_FullStop (other);
	AI_TurnToNpc(hero, self);
	AI_GotoNpc(self,other);
	B_GiveXP(150);
   
	AI_Output (self, other,"RBL_2604_Tony_FallowEnd_Info_07_01"); //Jeste�my na miejscu.
	AI_Output (self, other,"RBL_2604_Tony_FallowEnd_Info_07_02"); //Uwa�ajcie na siebie i nie dajcie si� zabi�!
	AI_Output (other, self,"RBL_2604_Tony_FallowEnd_Info_15_03"); //O to si� nie b�j.
	
   B_LogEntry		(CH1_Pir_RebelCamp, "Dotarli�my do Obozu Rebeliant�w. Teraz wszystko w naszych r�kach.");	
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine	(self, "OR");
	var c_npc entrancegrd; entrancegrd=hlp_getnpc(HUN_2615_Abel);
	AI_GotoNPC(entrancegrd,hero);
	B_StopProcessInfos	(self);
};

var int tony_guard;
var int guard_ok;
instance  RBL_2604_Tony_Guard (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 6;
	condition		= RBL_2604_Tony_Guard_Condition;
	information		= RBL_2604_Tony_Guard_Info;
	permanent		= 1;
	important		= 0;
	description		= "Chcia�bym do was do��czy�."; 
};

FUNC int  RBL_2604_Tony_Guard_Condition()
{
	if (Npc_KnowsInfo(other,DIA_HUN_336_Cavalorn_Hello))&&(guard_ok==FALSE)
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_Guard_Info()
{
	AI_Output (other, self,"RBL_2604_Tony_Guard_Info_15_01"); //Chcia�bym do was do��czy�.
	
   if (tony_guard==FALSE)
	{
		tony_guard=TRUE;
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_02"); //M�dra decyzja. Na pewno tego nie po�a�ujesz.
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_03"); //Zgaduj�, �e szukasz kogo� kto si� za Tob� wstawi u Cavalorna, tak?
		AI_Output (other, self,"RBL_2604_Tony_Guard_Info_15_04"); //W rzeczy samej.
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_05"); //To dobrze trafi�e�. Poza tym co� jestem Ci winien przyjacielu.
		AI_Output (other, self,"RBL_2604_Tony_Guard_Info_15_06"); //To jak b�dzie? Szepniesz za mn� s��wko Cavalornowi?	
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_07"); //Nie tak szybko. Wdzi�czno��, wdzi�czno�ci�, ale faktycznie jest co� co m�g�by� dla mnie zrobi�.
		AI_Output (other, self,"RBL_2604_Tony_Guard_Info_15_08"); //Zamieniam si� w s�uch.	
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_09"); //Od jakiego� czasu mam pecha do nocnych wart. Konam ju� ze zm�czenia.
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_10"); //Staniesz w nocy za mnie na warcie?
	}
	else
	{
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_11"); //To jak b�dzie z t� wart�? Mog� na Ciebie liczy�?
	};
   
	Info_ClearChoices (RBL_2604_Tony_Guard);
	Info_AddChoice (RBL_2604_Tony_Guard, "Czemu nie.", RBL_2604_Tony_Guard_Yes);
	Info_AddChoice (RBL_2604_Tony_Guard, "Raczej nie teraz.", RBL_2604_Tony_Guard_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID RBL_2604_Tony_Guard_Yes()
{
	guard_ok = TRUE;
	AI_Output (other,self,"RBL_2604_Tony_Guard_Yes_Info_15_01"); //Czemu nie.
	AI_Output (self, other,"RBL_2604_Tony_Guard_Yes_Info_07_02"); //Wiedzia�em, �e porz�dny z Ciebie ch�op.
	AI_Output (self, other,"RBL_2604_Tony_Guard_Yes_Info_07_03"); //Robota jest prosta. Stajesz na warcie i pilnujesz, �eby nic nie pod�azi�o za blisko obozu.
	//Sher, popraw jak cos
	// (Tony wczesniej rozpoczyna� nam misje z warta bez wzgledu na pore dnia
	// obecnie zaczyna sie w poprawionym kolejnym dialogu z uwzglednieniem daty (rutyna tonego takze zmieniona))
	AI_Output (self, other,"RBL_2604_Tony_Guard_Yes_Info_07_04"); //Moja warta rozpocznie si� w nocy.
	AI_Output (self, other,"RBL_2604_Tony_Guard_Yes_Info_07_05"); //B�d� na ciebie czeka�.
	Log_CreateTopic	(CH1_Rbl_TonyGuard, LOG_MISSION);
	B_LogSetTopicStatus	(CH1_Rbl_TonyGuard, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_TonyGuard, "�eby zosta� jednym z rebeliant�w zgodzi�em si� stan�� za Toniego na warcie w nocy. Musz� dotrwa� do rana, inaczej Tony mo�e mie� nieprzyjemno�ci, a ja nie zdob�d� jego poparcia.");
	Info_ClearChoices (RBL_2604_Tony_Guard);
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"GUIDESENTRY");	
};

// ------------------No----------------

FUNC VOID RBL_2604_Tony_Guard_No()
{
	AI_Output (other,self,"RBL_2604_Tony_Guard_No_Info_15_01"); //Raczej nie teraz.
	AI_Output (self, other,"RBL_2604_Tony_Guard_No_Info_07_02"); //Jak tam sobie chcesz. Wr�� jak zmienisz zdanie.
	Info_ClearChoices (RBL_2604_Tony_Guard);
	B_StopProcessInfos	(self);
};

instance  RBL_2604_Tony_GuardGuide (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 86;
	condition		= RBL_2604_Tony_GuardGuide_Condition;
	information		= RBL_2604_Tony_GuardGuide_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC int  RBL_2604_Tony_GuardGuide_Condition()
{
	if (guard_ok)&&(Npc_GetDistToWP(hero,"WITAMYWHC")<350)
	&&(Wld_IsTime(20,00,03,00))
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_GuardGuide_Info()
{
	AI_Output (self, other,"RBL_2604_Tony_GuardGuide_Info_07_01"); //To tutaj.	
	AI_Output (self, other,"RBL_2604_Tony_GuardGuide_Info_07_02"); //Ja p�jd� si� porz�dnie wyspa� i wr�c� rano.
	AI_Output (self, other,"RBL_2604_Tony_GuardGuide_Info_07_03"); //Tylko pami�taj, �eby nie schodzi� z posterunku, bo Cavalorn urwie mi jaja.
	AI_Output (self, other,"RBL_2604_Tony_GuardGuide_Info_07_04"); //No nic, czas ju� na mnie.
	AI_Output (self, other,"RBL_2604_Tony_GuardGuide_Info_07_05"); //Bywaj, do rana. Spokojnej nocy.
	AI_Output (other,self,"RBL_2604_Tony_GuardGuide_Info_15_06"); //Niech Ci si� przy�ni jaka� ma�o ow�osiona panna.
	Log_CreateTopic	(CH1_Rbl_TonyGuard, LOG_MISSION);
	B_LogSetTopicStatus	(CH1_Rbl_TonyGuard, LOG_RUNNING);
	//Sher, popraw jak cos
	B_LogEntry		(CH1_Rbl_TonyGuard, "Przej��em nocn� wart� Toniego.");

	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"REST");			
	Story_RickSentry_MisState=1;//akceptacja
};

instance  RBL_2604_Tony_GuardFinal (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 16;
	condition		= RBL_2604_Tony_GuardFinal_Condition;
	information		= RBL_2604_Tony_GuardFinal_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  RBL_2604_Tony_GuardFinal_Condition()
{
	if (Story_RickSentry_MisState>1)
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_GuardFinal_Info()
{
	if (Story_RickSentry_MisState==2)
	{
		tony_trust = TRUE;
		B_GiveXP(300);
		rebel_camp_trust = rebel_camp_trust + 1; // inkrementacja zmiennej globalnej z warto�ci� zaufania w obozie rebeliant�w za wykonanie zada�.
		
      AI_Output (self, other,"RBL_2604_Tony_GuardFinal_Info_07_01"); //�wietna robota przyjacielu. Czuj� si� jak m�ody b�g. Masz m�j g�os i miecz je�eli przyjdzie taka potrzeba.
		AI_Output (other, self,"RBL_2604_Tony_GuardFinal_Info_15_02"); //Nie by�o �atwo, ale zawsze to jaka� odmiana.
		AI_Output (self, other,"RBL_2604_Tony_GuardFinal_Info_07_03"); //We� to, zas�u�y�e�.
		//mo�e Tony da mu jak�� receptur�, albo sk�adniki.
		CreateInvItems (self,ItMiNugget, 70);
		B_GiveInvItems (self, other, ItMiNugget, 70);	
		B_LogSetTopicStatus	(CH1_Rbl_TonyGuard, LOG_SUCCESS);
		B_LogEntry		(CH1_Rbl_TonyGuard, "Uda�o mi si� dotrwa� do rana na warcie. Tony by� bardzo wdzi�czny, na pewno wstawi si� za mn� przed Cavalornem. Do tego dosta�em 100 bry�ek rudy.");
		B_LogEntry		(CH1_Rbl_RebelCampTrust, "Zdoby�em poparcie Toniego. Tylko tak dalej.");
	}
	else if (Story_RickSentry_MisState==3)
	{
		AI_Output (self, other,"RBL_2604_Tony_GuardFinal_Info_07_04"); //Niech to szlag. Cavalorn obchodzi� w nocy stra�e i m�j posterunek by� podobno pusty.
		AI_Output (self, other,"RBL_2604_Tony_GuardFinal_Info_07_05"); //�adnie mi si� odwdzi�czasz za pomoc w dotarciu do obozu.
		AI_Output (self, other,"RBL_2604_Tony_GuardFinal_Info_07_06"); //Nie b�d� sprzeciwia� si�, kiedy Cavalorn zdecyduje si� przyj�� Ci� do obozu. Ale te� Ci� nie popr�. Rad� sobie sam.

		B_LogSetTopicStatus	(CH1_Rbl_TonyGuard, LOG_FAILED);
		B_LogEntry		(CH1_Rbl_TonyGuard, "Niech to szlag. Nie zdoby�em g�osu Toniego. Mog�em jednak sta� na warcie zamiast w��czy� si� po okolicy.");
	};
   
	Npc_ExchangeRoutine	(self,"OR");	
};

INSTANCE DIA_Tony_Attack (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 11;
	condition		= DIA_Tony_Attack_Condition;
	information		= DIA_Tony_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Tony_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Attack_Info()
{
	AI_Output (self, other, "DIA_Tony_Attack_11_01"); //Cholera, a ja Ci� tu przyprowadzi�em...
	AI_Output (self, other, "DIA_Tony_Attack_11_02"); //Pirackie �cierwo!
	
   B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);	
};

// **************************************************

INSTANCE DIA_Tony_Stew (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 12;
	condition		= DIA_Tony_Stew_Condition;
	information		= DIA_Tony_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jedz na zdrowie przyjacielu."; 
};

FUNC INT DIA_Tony_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_Tony_Stew_15_01"); //Jedz na zdrowie przyjacielu.
	AI_Output (self, other, "DIA_Tony_Stew_11_02"); //Dzi�ki, tego mi brakowa�o...
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Tony podzi�kowa� i zjad� gulasz zanim zd��y�em zamruga� oczami."); 
};

INSTANCE DIA_Tony_Spy (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 13;
	condition		= DIA_Tony_Spy_Condition;
	information		= DIA_Tony_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "D�ugo jeste� w obozie?"; 
};

FUNC INT DIA_Tony_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Spy_Info()
{
	spy_count = spy_count + 1;
	
   AI_Output (other, self, "DIA_Tony_Spy_15_01"); //D�ugo jeste� w obozie?
	AI_Output (self, other, "DIA_Tony_Spy_11_02"); //Wystarczaj�co d�ugo, �eby sta� si� jego cz�ci�.
	AI_Output (self, other, "DIA_Tony_Spy_11_03"); //I nie �a�uj� swojej decyzji. Stary Ob�z to banda socjopat�w, lepiej si� trzyma� od nich z daleka.
	AI_Output (other, self, "DIA_Tony_Spy_15_04"); //Nie ma tam nikogo normalnego?
	AI_Output (self, other, "DIA_Tony_Spy_11_05"); //Mia�em tam tylko jednego przyjaciela, nazywa� si� Szakal i niejedn� butelk� razem osuszyli�my.
	
   if (Tony_Guards == TRUE)
	{
		AI_Output (other, self, "DIA_Tony_Spy_15_06"); //Szakal? Wcze�niej powiedzia�e�, �e to wredny sukinsyn.
		AI_Output (self, other, "DIA_Tony_Spy_11_07"); //Niemo�liwe. Musz� wraca� do swoich obowi�zk�w...
		B_LogEntry		(CH2_Rbl_Spy, "Przy�apa�em Toniego na k�amstwie. Wcze�niej nazwa� Szakala wrednym sukinsynem, teraz twierdzi, �e nic takiego nie powiedzia�. Dziwne...");
	};
   
	B_LogEntry		(CH2_Rbl_Spy, "Tony powiedzia� mi, �e nie �a�uje swej decyzji. Stary Ob�z to wg niego banda socjopat�w. Tony mia� tam tylko jednego przyjaciela, kt�ry nazywa� si� Szakal.");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od Ciebie chcia�.
		B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_Tony_Spy1 (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 13;
	condition		= DIA_Tony_Spy1_Condition;
	information		= DIA_Tony_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno nie zawsze wybierasz proste �cie�ki."; 
};

FUNC INT DIA_Tony_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_Tony_Spy1_15_01"); //Podobno nie zawsze wybierasz proste �cie�ki.
	AI_Output (self, other, "DIA_Tony_Spy1_11_02"); //Nie rozumiem...
	AI_Output (other, self, "DIA_Tony_Spy1_15_03"); //Chodz� s�uchy, �e nie zawsze m�wisz prawd�.
	AI_Output (self, other, "DIA_Tony_Spy1_11_04"); //W ko�cu jeste�my w Kolonii Karnej. Tutaj ka�dy m�wi to co chce. Masz z tym jaki� problem?
	AI_Output (other, self, "DIA_Tony_Spy1_15_05"); //Mo�e i mam. Nale�ymy do tego samego... stada. Brak zaufania nas os�abia.
	AI_Output (self, other, "DIA_Tony_Spy1_11_06"); //Wtykasz nos w nie swoje sprawy. Mo�e zrobi�em b��d przyprowadzaj�c Ci� tutaj.
	AI_Output (self, other, "DIA_Tony_Spy1_11_07"); //Zejd� mi z oczu.

	B_LogEntry		(CH2_Rbl_Spy, "Rozmowa z Tonym nie wyja�ni�a zbyt wiele, pr�cz tego, �e by� dziwnie zdenerwowany. Mo�e to w�a�ciwy trop...");
	
   if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta�, nie daj mu czeka�.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};
   
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Tony_Secrets1 (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 15;
	condition		= DIA_Tony_Secrets1_Condition;
	information		= DIA_Tony_Secrets1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie propozycj�."; 
};

FUNC INT DIA_Tony_Secrets1_Condition()
{
	if (tony_spy == 15)&&(Npc_KnowsInfo (hero, DIA_Tony_Spy1))
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Secrets1_Info()
{
	AI_Output (other, self, "DIA_Tony_Secrets1_15_01"); //Mam dla Ciebie propozycj�.
	AI_Output (self, other, "DIA_Tony_Secrets1_11_02"); //Po naszej ostatniej rozmowie nie chc� mie� z Tob� nic wsp�lnego.
	AI_Output (other, self, "DIA_Tony_Secrets1_15_03"); //Spokojnie. Wtedy pad�o zbyt wiele pochopnych s��w.
	AI_Output (other, self, "DIA_Tony_Secrets1_15_04"); //Przemy�la�em kilka spraw i dlatego wr�ci�em.
	AI_Output (self, other, "DIA_Tony_Secrets1_11_05"); //Streszczaj si�.
	AI_Output (other, self, "DIA_Tony_Secrets1_15_06"); //Cavalorn wie, �e kto� z obozu ryje na rzecz magnat�w.
	AI_Output (self, other, "DIA_Tony_Secrets1_11_07"); //Po co mi to m�wisz? Co mnie to obchodzi?!
	AI_Output (other, self, "DIA_Tony_Secrets1_15_08"); //Powinno, bo jestem pewien, �e to Ty!
	
   AI_DrawWeapon (self);
	
   AI_Output (self, other, "DIA_Tony_Secrets1_11_09"); //Nie b�d� oboj�tnie s�ucha� podobnych kalumnii! Zaraz ze�resz to co powiedzia�e� razem z ostrzem...
	AI_Output (other, self, "DIA_Tony_Secrets1_15_10"); //Zaczekaj! Gdybym przyszed� tu po to, �eby Ci� za�atwi�, to ju� le�a�by� martwy.
	
   AI_RemoveWeapon (self);
   
	AI_Output (self, other, "DIA_Tony_Secrets1_11_11"); //Sko�czymy t� rozmow� gdzie indziej. Chod� za mn�!
   
	B_StopProcessInfos(self);
   
	//AI_GotoWP		(self, "TONY_M");
	//AI_GotoWP		(hero, "ABEL_M");
   Npc_ExchangeRoutine	(self,"MEETING");
};
	
INSTANCE DIA_Tony_Secrets (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 15;
	condition		= DIA_Tony_Secrets_Condition;
	information		= DIA_Tony_Secrets_Info;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Tony_Secrets_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Tony_Secrets1))&&(Npc_GetDistToWP(self,"TONY_M") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Secrets_Info()
{
	AI_GotoNPC(hero, self);	
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_Tony_Secrets_11_11"); //A teraz m�w o co ci chodzi.

	Info_ClearChoices (DIA_Tony_Secrets);
	Info_AddChoice (DIA_Tony_Secrets, "Zap�a� za milczenie.", DIA_Tony_Secrets_Pay);
	Info_AddChoice (DIA_Tony_Secrets, "Chcia�em... zmieni� stron�.", DIA_Tony_Secrets_Join);
	Info_AddChoice (DIA_Tony_Secrets, "Jednak si� rozmy�li�em... Gi� zdrajco!", DIA_Tony_Secrets_Kill);
};

// -----------------------pay--------------------------------------------
/*
TODO: Po zakonczeniu dialogu odpala sie kamerka, rick i tony wyjmuja bronie tony pada na glebe bohater zostaje "osaczony" przez mysliwych. -> start dialogu z abelem z automatu
*/
var int tony_pay;

FUNC VOID DIA_Tony_Secrets_Pay()
{
   tony_pay = 1;
	tony_spy = tony_spy + 2;//17

	AI_Output (other, self, "DIA_Tony_Secrets_Pay_15_01"); //Zap�a�  za milczenie.
	AI_Output (self, other, "DIA_Tony_Secrets_Pay_11_02"); //P�aci� za co? Za swoj� niewinno��? Chyba uderzy�e� si� w g�ow�!
	AI_Output (other, self, "DIA_Tony_Secrets_Pay_15_03"); //Czyli nie zap�acisz?
	AI_Output (self, other, "DIA_Tony_Secrets_Pay_11_04"); //Nie, idioto! A teraz �ryj �elazo...
	
   Info_ClearChoices (DIA_Tony_Secrets);
	B_StopProcessInfos	(self);
};

// -------------------------kill------------------------------------------
var int tony_death;

FUNC VOID DIA_Tony_Secrets_Kill()
{
   tony_death = 1;
	tony_spy = tony_spy + 2;//17

	AI_Output (other, self, "DIA_Tony_Secrets_Kill_15_01"); //Jednak si� rozmy�li�em... Gi� zdrajco!
	AI_Output (self, other, "DIA_Tony_Secrets_Kill_11_02"); //Sam si� prosisz o �mier�!
	
   Info_ClearChoices (DIA_Tony_Secrets);
   B_StopProcessInfos	(self);
};

// ----------------------------join---------------------------------------
var int tony_join;

FUNC VOID DIA_Tony_Secrets_Join()
{
   tony_join = 1;
	tony_spy = tony_spy + 1;//16
   
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_01"); //Chcia�em... zmieni� stron�.
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_02"); //Nie rozumiem...
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_03"); //Rozumiesz doskonale. Dlatego zamiast wyda� Ci� Cavalornowi wola�em porozmawia�.
	
   AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
   
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_04"); //Za��my czysto hipotetycznie, �e masz racj�. Co mo�esz mi zaoferowa�?
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_05"); //Swoje us�ugi i spor� wiedz� o planach Cavalorna.
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_06"); //Powiedz mi wszystko, a ja przeka�� Twoje s�owa komu trzeba.
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_07"); //Nie jestem idiot�. Chc� osobi�cie porozmawia� z Twoim kontaktem.
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_08"); //To nie takie proste... Nikt Ci� nie zna, nikt Ci nie ufa...
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_09"); //Przecie� rozmawiamy czysto hipotetycznie. A co do ryzyka, to tylko ja je ponosz�.
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_10"); //Je�eli stwierdz�, �e to co wiem to za ma�o, to sko�cz� jako naw�z gdzie� w kniei.
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_11"); //Hmm... Dobra, tutaj jest za du�o ciekawskich uszu i oczu.
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_12"); //Doko�czymy t� hipotetyczn� rozmow� p�niej. B�d� tu czeka� po zmroku.
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_13"); //Przyjd� na pewno.
	
   B_LogEntry		(CH2_Rbl_Spy, "Mam Toniego! Co prawda rozmawiali�my czysto hipotetycznie, ale dowiem si� wi�cej po zmroku w pobli�u G��bi.");
	B_StopProcessInfos	(self);

	/*****************************
		W dzie� normalnie a od 22 do 4 rano czeka tam w obozie na dicka

		*****************************/
	Npc_ExchangeRoutine	(self,"MOURDER");
};

INSTANCE DIA_Tony_SecretsMeet (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 16;
	condition		= DIA_Tony_SecretsMeet_Condition;
	information		= DIA_Tony_SecretsMeet_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Tony_SecretsMeet_Condition()
{
	if (Npc_GetDistToWP(self,"TONY_M") < 500)&&(tony_join)&&(Wld_IsTime (22,00,04,00))
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_SecretsMeet_Info()
{
	tony_spy = tony_spy + 1;//17
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_01"); //W ko�cu jeste�!
	AI_Output (other, self, "DIA_Tony_SecretsMeet_15_02"); //Nie zwyk�em rzuca� s��w na wiatr. Dowiem si� czego� wi�cej?
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_03"); //By� mo�e. Czyli chcesz zmieni�... stron�?
	AI_Output (other, self, "DIA_Tony_SecretsMeet_15_04"); //Inaczej zamiast mnie przyszed�by tu Cavalorn i kilku rebeliantow, �eby wypru� Ci flaki.
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_05"); //Racja. Dobra wystarczy tych gierek.
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_06"); //Owszem pracuj� dla magnat�w, a dok�adnie dla Hrabiego.
	AI_Output (other, self, "DIA_Tony_SecretsMeet_15_07"); //Hrabiego?
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_08"); //To kto� komu lepiej nie wchodzi� w parad�. Hrabia s�ucha tylko Kruka, nawet Gomeza ma w dupie. To jemu sk�adam raporty.
	AI_Output (other, self, "DIA_Tony_SecretsMeet_15_09"); //Czyli za tym wszystkim nie stoi Gomez tylko Kruk?
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_10"); //Mo�na tak powiedzie�. Gomez my�li tylko o rudzie i zem�cie. Kruk ma dalekosi�ne plany, a Hrabia po prostu trzyma z silniejszym i sprytniejszym.
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_11"); //Um�wi� Ci� z Hrabi� i wtedy...
	
   AI_DrawWeapon (self);
   
	AI_Output (self, other, "DIA_Tony_Mourder_11_05"); //Co to do cholery?
	
   AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
   
   AI_PlayAni(self, "T_HEASHOOT_2_STAND");
   
	AI_Output (self, other, "DIA_Tony_Mourder_11_06"); //Niiieeee!!!
	B_StopProcessInfos	(self);
};

//******************Killing

INSTANCE DIA_Tony_Mourder (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 15;
	condition		= DIA_Tony_Mourder_Condition;
	information		= DIA_Tony_Mourder_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Tony_Mourder_Condition()
{
	if (tony_pay)||(tony_death)||(Npc_KnowsInfo (hero, DIA_Tony_SecretsMeet))
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Mourder_Info()
{
	var C_NPC abel; abel = Hlp_GetNpc(HUN_2615_Abel);
	Npc_ClearAiQueue(abel);		
	Npc_ExchangeRoutine(abel,"MOURDER");
   
   B_LogEntry(CH2_Rbl_Spy, "Tony zosta� zabity na moich oczach strza�em z kuszy albo �uku. Kto� to zaplanowa� i wrobi� mnie w morderstwo!");

   B_StopProcessInfos(self);
	Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
   B_StopProcessInfos(hero);
};

/***************************

SIDE QUEST

****************************/

INSTANCE DIA_Tony_Kuva (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 20;
	condition		= DIA_Tony_Kuva_Condition;
	information		= DIA_Tony_Kuva_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jaki masz interes w wykupie d�ugu Kuvy?";
};

FUNC INT DIA_Tony_Kuva_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_KuvaOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Kuva_Info()
{
	AI_Output (other, self, "DIA_Tony_Kuva_15_01"); //Jaki masz interes w wykupie d�ugu Kuvy?
	AI_Output (self, other, "DIA_Tony_Kuva_11_02"); //Sk�d o tym wiesz?
	AI_Output (other, self, "DIA_Tony_Kuva_15_03"); //To niewa�ne. Co Kuva robi w klatce i kto go tam zamkn��?
	AI_Output (self, other, "DIA_Tony_Kuva_11_04"); //Sporo tych pyta�...
	AI_Output (self, other, "DIA_Tony_Kuva_11_05"); //D�ug Kuvy wykupi�em bo mia�em w�asne powody. To nie twoja sprawa.
	AI_Output (other, self, "DIA_Tony_Kuva_15_06"); //Ale sprawa Kuvy. Siedzi teraz w zamkni�ciu i czeka na �mier�!
	AI_Output (self, other, "DIA_Tony_Kuva_11_07"); //A co mnie to obchodzi.
	AI_Output (other, self, "DIA_Tony_Kuva_15_08"); //Je�eli masz to gdzie� to dlaczego wykupi�e� jego d�ug?
	AI_Output (self, other, "DIA_Tony_Kuva_11_09"); //Ju� powiedzia�em, to nie twoja sprawa. Spadaj.

	B_LogEntry		(CH1_RBL_Cage, "Niczego nie dowiedzia�em si� od Toniego. Nie wiem, co on knuje, ale powinienem jeszcze raz porozmawia� z Kuv�, mo�e przypomni sobie co� przydatnego.");
};
