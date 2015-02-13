
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Sher_Exit (C_INFO)
{
	npc			= Non_4088_Sher;
	nr			= 999;
	condition	= DIA_Sher_Exit_Condition;
	information	= DIA_Sher_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sher_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Sher_Exit_Info()
{
	B_StopProcessInfos	( self );
};

INSTANCE DIA_Sher_GoAway (C_INFO)
{
	npc				= Non_4088_Sher;
	nr				= 1;
	condition		= DIA_Sher_GoAway_Condition;
	information		= DIA_Sher_GoAway_Info;
	permanent		= 1;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Sher_GoAway_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 2000)&&(!Npc_KnowsInfo (hero, DIA_Carlos_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Sher_GoAway_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Sher_GoAway_11_01"); //Nie wiem jak si� tu dosta�e�, ale nie powinno Ci� tutaj by�.
	AI_Output (other, self, "DIA_Sher_GoAway_15_02"); //Zaczekaj...
	AI_Output (self, other, "DIA_Sher_GoAway_11_03"); //Robi� to dla twojego dobra, ch�opcze.
	AI_Output (self, other, "DIA_Sher_GoAway_11_04"); //Kiedy� mi za to podzi�kujesz...

	B_StopProcessInfos(self);

	/**************
	Wypad z kopalni, nie ma wst�pu przed odpowiednim w�tkiem fabularnym xD
	*************/

	AI_GotoWP(hero, "FM_02");
};

// **************************************************
// 					
// **************************************************

INSTANCE DIA_Sher_First (C_INFO)
{
	npc				= Non_4088_Sher;
	nr				= 2;
	condition		= DIA_Sher_First_Condition;
	information		= DIA_Sher_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Sher_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Carlos_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Sher_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
   
	if (Npc_KnowsInfo (hero, DIA_Sher_GoAway))
	{
		AI_Output (self, other, "DIA_Sher_First_11_01"); //To znowu Ty...
	};
   
	AI_Output (self, other, "DIA_Sher_First_11_02"); //Kolejny szcz�liwy skazaniec mog�cy popracowa� ku chwale i maj�tno�ci Gomeza.
	AI_Output (other, self, "DIA_Sher_First_15_03"); //A co Tobie do tego?
	AI_Output (self, other, "DIA_Sher_First_11_04"); //Cynizm i duma to cz�sto strony tej samej monety.
	
   var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
	
   if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other, "DIA_Sher_First_11_05"); //Komu si� narazi�e�?
		AI_Output (other, self, "DIA_Sher_First_15_06"); //To znaczy?
		AI_Output (self, other, "DIA_Sher_First_11_07"); //Nosisz pancerz stra�nika.
		AI_Output (other, self, "DIA_Sher_First_15_08"); //To d�uga historia, a ja nie mam czasu na nudne opowie�ci.
	};
	
   AI_Output (other, self, "DIA_Sher_First_15_02"); //Szukam Torlofa. Znasz go?
	AI_Output (self, other, "DIA_Sher_First_11_09"); //Znam, to w�a�nie on poleci� mi wita� nowych. Podobno mam do tego wrodzony dar...
	AI_Output (other, self, "DIA_Sher_First_15_10"); //Skoro tak twierdzisz. Gdzie go znajd�?
	AI_Output (self, other, "DIA_Sher_First_11_11"); //Id� dalej, nie spos�b go nie zauwa�y�. Krzyczy najg�o�niej z ca�ej ho�oty.
	AI_Output (other, self, "DIA_Sher_First_15_12"); //Dzi�ki za rad�.
	AI_Output (self, other, "DIA_Sher_First_11_13"); //Zaczekaj. Gdyby� potrzebowa� pomocy, to daj mi zna�.
	AI_Output (other, self, "DIA_Sher_First_15_14"); //B�d� o tym pami�ta�. Bywaj.
	
   B_LogEntry		(CH4_GRD_NewMine, "Pierwsz� osob�, kt�r� spotka�em w kopalni by� nijaki Sher. Mimo podejrzanego wygl�du wywar� na mnie dobre wra�enie. Torlofa znajd� w g��bi, podobno krzyczy najg�o�niej z ca�ej ho�oty, he, he.");
	B_StopProcessInfos	(self);

	/***************
	Wraca do rutyny kopania rudy - MUSI kopa� gdzie� w pobli�u torlofa, g�ra 10m od niego
	**************/
	Npc_ExchangeRoutine(self,"GO");

	/***************
	Zmiana rutyny czy tam teleport carlosa, niech ju� b�dzie tam gdzie trzeba go p�niej szuka� i oczywi�cie hp = 0.
	**************/
};

// **************************************************

INSTANCE DIA_Sher_Hlp (C_INFO)
{
	npc				= Non_4088_Sher;
	nr				= 3;
	condition		= DIA_Sher_Hlp_Condition;
	information		= DIA_Sher_Hlp_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrzebuj� Twojej pomocy."; 
};

FUNC INT DIA_Sher_Hlp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Torlof_Hlp))
	{
		return 1;
	};
};

FUNC VOID DIA_Sher_Hlp_Info()
{
	AI_Output (other, self, "DIA_Sher_Hlp_15_01"); //Potrzebuj� Twojej pomocy.
	AI_Output (self, other, "DIA_Sher_Hlp_11_02"); //Co si� sta�o?
	AI_Output (other, self, "DIA_Sher_Hlp_15_03"); //B�d� z tob� szczery. Przyby�em tu, aby nak�oni� Torlofa do przy��czenia si�...
	AI_Output (self, other, "DIA_Sher_Hlp_11_04"); //Wiem po co tu przyby�e�, piracie.
	AI_Output (other, self, "DIA_Sher_Hlp_15_05"); //Przecie� nikt z kopalni nie wie o tym kim kiedy� by�em.
	AI_Output (self, other, "DIA_Sher_Hlp_11_06"); //Zdradzi� Ci� ch�d. Z regu�y zwyczajnych marynarzy nie wtr�caj� do Kolonii wi�c zaryzykowa�em stwierdzenie, �e jeste� korsarzem. Jak wida� trafne.
	AI_Output (other, self, "DIA_Sher_Hlp_15_07"); //Powiedzmy, �e Ci wierz�. Powiedz mi co taki cwaniak jak Ty robi w Kolonii, do tego wal�c kilofem w bry�� rudy?
	AI_Output (self, other, "DIA_Sher_Hlp_11_08"); //To samo co i Ty, poszukuj� odpowiedzi. Wi�cej wiedzie� nie musisz.
	AI_Output (other, self, "DIA_Sher_Hlp_15_09"); //Wspomnia�e� co� o pomocy.
	AI_Output (self, other, "DIA_Sher_Hlp_11_10"); //W rzeczy samej. S�ucham wi�c, w czym tkwi problem.
	AI_Output (other, self, "DIA_Sher_Hlp_15_11"); //Torlof pomo�e mi wydosta� si� z kopalni je�eli zdo�am przekona� kilku skaza�c�w do bardziej wyt�onej pracy.
	AI_Output (self, other, "DIA_Sher_Hlp_11_12"); //Niech zgadn� - Cipher, Homer i Butch?
	AI_Output (other, self, "DIA_Sher_Hlp_15_13"); //Cholera, jak Ty to robisz?!
	AI_Output (self, other, "DIA_Sher_Hlp_11_14"); //To proste, sp�dzi�em w kopalni szmat czasu, do tego staram si� widzie�, a nie tylko patrze�.
	AI_Output (self, other, "DIA_Sher_Hlp_11_15"); //�atwo wtedy dostrzec kto si� obija zamiast pracowa� i z kim Torlof ma najwi�cej problem�w.
	AI_Output (self, other, "DIA_Sher_Hlp_11_16"); //Obserwowa�em ka�dego z tej tr�jki i wydaje mi si�, �e mog� Ci pom�c.
	AI_Output (other, self, "DIA_Sher_Hlp_15_17"); //Zamieniam si� w s�uch.
	AI_Output (self, other, "DIA_Sher_Hlp_11_18"); //Zacznijmy od Butcha. Tutaj wystarczy kilka inwektyw i t�gie ci�gi. Tylko go nie zabij, wystarczy, �e poczuje smak w�asnej krwi.
	AI_Output (other, self, "DIA_Sher_Hlp_15_19"); //A pozostali?
	AI_Output (self, other, "DIA_Sher_Hlp_11_20"); //Homer to sentymentalny g�upiec. Nie ma dnia �eby nie opowiada� o wspania�ej tamie, kt�r� sam zaprojektowa�.
	AI_Output (self, other, "DIA_Sher_Hlp_11_21"); //Trafisz do niego zachwalaj�c t� budowl�, zasugeruj, �e tylko walka pozwoli mu wznie�� kolejne dzie�o.
	AI_Output (self, other, "DIA_Sher_Hlp_11_22"); //A �eby walczy�, najpierw trzeba troch� popracowa�. My�l�, �e to wystarczy.
	AI_Output (other, self, "DIA_Sher_Hlp_15_23"); //Zosta� jeszcze Cipher.
	AI_Output (self, other, "DIA_Sher_Hlp_11_24"); //To akurat najmniejszy problem. Cipher sprzeda�by w�asn� matk� za paczk� ziela.
	
   if (NPC_HasItems(other,ItMiJoint_1)>=1)||(NPC_HasItems(other,ItMiJoint_2)>=1)||(NPC_HasItems(other,ItMiJoint_3)>=1)
	{
		AI_Output (other, self, "DIA_Sher_Hlp_15_25"); //Na szcz�cie mam co� co powinno przypa�� mu do gustu.
	}
	else
	{
		AI_Output (other, self, "DIA_Sher_Hlp_15_26"); //Cholera, nie mam �adnego zielska.
		AI_Output (self, other, "DIA_Sher_Hlp_11_27"); //Masz szcz�cie. Chowa�em to na specjaln� okazj�, ale Tobie bardziej si� przyda. Bierz.
      
      CreateInvItems (self,ItMiJoint_3,1);
		B_GiveInvItems (self, other, ItMiJoint_3, 1);
      
      AI_Output (other, self, "DIA_Sher_Hlp_15_28"); //Dzi�ki, Sher.
	};
	
   AI_Output (self, other, "DIA_Sher_Hlp_11_29"); //To ju� chyba wszystko, ch�opcze.
	AI_Output (other, self, "DIA_Sher_Hlp_15_30"); //Dlaczego mi pomagasz?
	AI_Output (self, other, "DIA_Sher_Hlp_11_31"); //A dlaczego nie?
	
   AI_TurnToNpc(self, other);
	Ai_Wait (self,1);
	
   AI_Output (self, other, "DIA_Sher_Hlp_11_32"); //Powiedzmy, �e dostrzegam w Tobie co� wi�cej ni� tylko zimne wyrachowanie wilka morskiego.
	AI_Output (self, other, "DIA_Sher_Hlp_11_33"); //�ycie up�ywa w strugach g�wna, przyjacielu. Czasami warto co� zrobi� �eby komu� mniej... �mierdzia�o.
	AI_Output (other, self, "DIA_Sher_Hlp_15_34"); //Zapami�tam to. Bywaj.
	AI_Output (self, other, "DIA_Sher_Hlp_11_35"); //Powodzenia, piracie.
	
   B_LogEntry		(CH4_GRD_NewMine, "Rozmowa z Sherem sporo mi pomog�a. Butcha wystarczy obi�, Cipher zrobi wszystko za dobre zielsko a Homer ma bzika na punkcie tamy, kt�r� zaprojektowa�. Zobaczymy na ile zdadz� si� rady tego przem�drza�ego kopacza.");
};

// **************************************************

INSTANCE DIA_Sher_HlpAfter (C_INFO)
{
	npc				= Non_4088_Sher;
	nr				= 4;
	condition		= DIA_Sher_HlpAfter_Condition;
	information		= DIA_Sher_HlpAfter_Info;
	permanent		= 0;
	important		= 0;
	description		= "Uda�o si�, wszyscy zacz�li pracowa�!"; 
};

FUNC INT DIA_Sher_HlpAfter_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Sher_Hlp))&&(miners_work == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_Sher_HlpAfter_Info()
{
	AI_Output (other, self, "DIA_Sher_HlpAfter_15_01"); //Uda�o si�, wszyscy zacz�li pracowa�!
	AI_Output (self, other, "DIA_Sher_HlpAfter_11_02"); //Ciesz� si�, �e mog�em pom�c.
	AI_Output (other, self, "DIA_Sher_HlpAfter_15_03"); //To Twoja zas�uga!
	AI_Output (self, other, "DIA_Sher_HlpAfter_11_04"); //Ja tylko wskaza�em Ci odpowiedni� drog�.
	AI_Output (other, self, "DIA_Sher_HlpAfter_15_05"); //Jako� si� odwdzi�cz�, przyjacielu.
	AI_Output (self, other, "DIA_Sher_HlpAfter_11_06"); //Wystarczy, �e nadal b�dziesz wybiera� w�a�ciwy kierunek.
	AI_Output (self, other, "DIA_Sher_HlpAfter_11_07"); //Kto wie, mo�e spotkamy si� w lepszych czasach.
	AI_Output (other, self, "DIA_Sher_HlpAfter_15_08"); //By�bym rad. Bywaj, Sher.
	AI_Output (self, other, "DIA_Sher_HlpAfter_11_09"); //Powodzenia, Rick.
	
   B_LogEntry		(CH4_GRD_NewMine, "Wskaz�wki Shera bardzo mi pomog�y. Odnios�em wra�enie, �e ten dziwny skazaniec mia� jaki� ukryty cel w tym aby mi pom�c.");
};

// **************************************************

INSTANCE DIA_Sher_End (C_INFO)
{
	npc				= Non_4088_Sher;
	nr				= 5;
	condition		= DIA_Sher_End_Condition;
	information		= DIA_Sher_End_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Sher_End_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jurgen_Second))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Sher_End_Info()
{
	var C_NPC jur; jur = Hlp_GetNpc(Grd_4090_Jurgen);
	B_FullStop (hero);
	AI_TurnToNpc(self, hero);
   
	AI_Output (self, hero, "DIA_Sher_End_11_00"); //Sta�!
	AI_Output (self, hero, "DIA_Sher_End_11_01"); //We�cie mnie zamiast jego.
	AI_Output (other, self, "DIA_Sher_End_15_02"); //Nie r�b tego!
	AI_Output (self, hero, "DIA_Sher_End_11_03"); //To m�j wyb�r ch�opcze.
	AI_Output (self, hero, "DIA_Sher_End_11_04"); //Poza tym to r�wnie dobre miejsce na zako�czenie w�dr�wki, jak ka�de inne.
	AI_Output (self, hero, "DIA_Sher_End_11_05"); //Zapami�taj przyjacielu, �e to nie cel podr�y kszta�tuje ludzk� dusz�, ale droga, kt�ra do niego zmierza. 
	AI_Output (self, hero, "DIA_Sher_End_11_06"); //To nasze wybory staj� si� �wiadectwem tego co po nas zostanie.
	AI_Output (other, self, "DIA_Sher_End_15_07"); //Dlaczego to robisz?
	AI_Output (self, hero, "DIA_Sher_End_11_08"); //Powiedzmy, �e mam przeczucie, �e dzi�ki tobie sporo si� tu zmieni na lepsze.
	
   AI_TurnToNpc(self, jur);
	AI_TurnToNpc(jur, hero);
	
   AI_Output (self, hero, "DIA_Sher_End_11_12"); //Na co czekasz Jurgen? Tylko zr�b to jak nale�y, od jednego ci�cia.
	
   B_StopProcessInfos(self);
};
