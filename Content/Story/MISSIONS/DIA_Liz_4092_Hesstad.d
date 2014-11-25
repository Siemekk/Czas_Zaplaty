// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Hess_Exit (C_INFO)
{
	npc			= Liz_4092_Hesstad;
	nr			= 999;
	condition	= DIA_Hess_Exit_Condition;
	information	= DIA_Hess_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hess_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Hess_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int liz_questions;

INSTANCE DIA_Hess_First (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 1;
	condition		= DIA_Hess_First_Condition;
	information		= DIA_Hess_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_First_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_Appear))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_First_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Hess_First_11_01"); //Uwolni�e� nas...
	AI_Output (other, self, "DIA_Hess_First_15_02"); //Nie�wiadomie. Sk�d znasz ludzk� mow�?
	AI_Output (self, other, "DIA_Hess_First_11_03"); //Moje s�owa rozbrzmiewaj� w Twojej g�owie. Potrafi� te� odczyta� twe my�li...
	AI_Output (self, other, "DIA_Hess_First_11_04"); //Waleczne w Tobie serce bije. Moi bracia s� Ci wdzi�czni za wyzwolenie.
	AI_Output (other, self, "DIA_Hess_First_15_05"); //Zabi�em Besti�, ale nie wiedzia�em, �e uwolni� co� wi�cej ni� zniewolone dusze. Jak to si� sta�o, �e przybrali�cie materialn� posta�?
	AI_Output (self, other, "DIA_Hess_First_11_06"); //Ci��y na nas przekle�stwo szale�stwa lub jak niekt�rzy twierdz�, g�upoty. 
	AI_Output (self, other, "DIA_Hess_First_11_07"); //Przed bitw� wszyscy z�o�yli�my �luby krwi i na w�asne dusze przysi�gli�my, �e nie spoczniemy, dop�ki nie wyplenimy zaka�y tych ziem - ork�w.
	AI_Output (other, self, "DIA_Hess_First_15_08"); //Nie obra� si�, ale my�la�em, �e orkowie i wy s�u�ycie temu samemu w�adcy.
	AI_Output (self, other, "DIA_Hess_First_11_09"); //Tylko nasi s�abi bracia ulegli namowom Beliara. Tych, kt�rych tu widzisz nasi potomkowie nazywali staro�ytnymi.
	AI_Output (self, other, "DIA_Hess_First_11_10"); //Narodzili�my si� z jaja Pradawnego, w czasach gdy bogowie st�pali jeszcze w�r�d �miertelnik�w.
	B_LogEntry(CH5_NON_Lizard, "Nast�pstwem rytua�u okaza�o si� tak�e uwolnienie jaszczuroludzi. Ciekawe dlaczego wr�cili?");
};

// **************************************************

INSTANCE DIA_Hess_Born (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 2;
	condition		= DIA_Hess_Born_Condition;
	information		= DIA_Hess_Born_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jest Pradawny?"; 
};

FUNC INT DIA_Hess_Born_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_First ))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Born_Info()
{
	liz_questions = liz_questions + 1;
	AI_Output (other, self, "DIA_Hess_Born_15_01"); //Kim jest Pradawny?
	AI_Output (self, other, "DIA_Hess_Born_11_02"); //To Pierwszy ze Smok�w, nasz Ojciec i B�g.
	AI_Output (self, other, "DIA_Hess_Born_11_03"); //To Pradawny wskrzesi� do �ycia zapomnian� ras� jaszczuroludzi. Niestety byli�my tylko cieniem naszych wielkich przodk�w, niegodnymi zaszczyt�w Smoczego Rodu.
	AI_Output (self, other, "DIA_Hess_Born_11_04"); //Pradawny porzuci� nas... To dla nas najwi�ksza ha�ba. Stali�my si� dzie�mi niegodnymi ojca.
	AI_Output (self, other, "DIA_Hess_Born_11_05"); //Dlatego przez ca�e �ycie starali�my si� udowodni�, �e Pradawny si� myli�.
	AI_Output (self, other, "DIA_Hess_Born_11_06"); //Wszystko co uczynili�my, zrobili�my ku jego chwale.
	AI_Output (self, other, "DIA_Hess_Born_11_07"); //Mo�e jeszcze kiedy� spojrzy na nas �askawszym okiem...
	B_LogEntry(CH5_NON_Lizard, "Ojcem jaszczuroludzi jest Pradawny, Pierwszy Spo�r�d Smok�w. Mimo, i� porzuci� jaszczuroludzi ci nadal oddaj� mu bosk� cze��.");
};

// **************************************************

INSTANCE DIA_Hess_Ancesor (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 12;
	condition		= DIA_Hess_Ancesor_Condition;
	information		= DIA_Hess_Ancesor_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak to cieniem przodk�w?"; 
};

FUNC INT DIA_Hess_Ancesor_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Born ))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Ancesor_Info()
{
	liz_questions = liz_questions + 1;
	AI_Output (other, self, "DIA_Hess_Ancesor_15_01"); //Jak to cieniem przodk�w?
	AI_Output (self, other, "DIA_Hess_Ancesor_11_02"); //U zarania dziej�w, jeszcze zanim narodzi� si� ludzki r�d, a tak�e wasi bogowie na tych ziemiach �y�y tylko smoki i jaszczuroludzie.
	AI_Output (self, other, "DIA_Hess_Ancesor_11_03"); //Jednak nasi przodkowie byli du�o pot�niejsi ni� jakakolwiek z dwuno�nych ras rozumnych.
	AI_Output (self, other, "DIA_Hess_Ancesor_11_04"); //�yli ze smokami w symbiozie i przyja�ni, dop�ki nie rozp�ta�a si� Wojna Ognia.
	AI_Output (self, other, "DIA_Hess_Ancesor_11_05"); //Nikt dok�adnie nie pami�ta, kto zdradzi� pierwszy, smoki, czy nasi przodkowie.
	AI_Output (self, other, "DIA_Hess_Ancesor_11_06"); //Wojna trwa�a setki lat, a� doprowadzi�a do ca�kowitej zag�ady naszych ansesor�w.
};

// **************************************************

INSTANCE DIA_Hess_Left (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 13;
	condition		= DIA_Hess_Left_Condition;
	information		= DIA_Hess_Left_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dlaczego Pradawny was porzuci�?"; 
};

FUNC INT DIA_Hess_Left_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Born ))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Left_Info()
{
	liz_questions = liz_questions + 1;
	AI_Output (other, self, "DIA_Hess_Left_15_01"); //Dlaczego Pradawny was porzuci�?
	AI_Output (self, other, "DIA_Hess_Left_11_02"); //Ojciec Smok�w, wskrzeszaj�c nasz� ras�, chcia� odpokutowa� winy swego rodu, kt�re doprowadzi�y do zag�ady jaszczuroludzi w Wojnie Ognia.
	AI_Output (self, other, "DIA_Hess_Left_11_03"); //Niestety okazali�my si� zaledwie cieniem naszych ansesor�w. Pradawny uzna� nas za prymitywn� ras�, niegodn� dost�pienia zaszczytu zg��biania pot�gi naszych przodk�w.
	AI_Output (self, other, "DIA_Hess_Left_11_04"); //Jednak zanim odszed�, powiedzia�, �e droga, kt�r� wybierzemy mo�e zaprowadzi� nas do kolebki narodzin.
	AI_Output (self, other, "DIA_Hess_Left_11_05"); //Niestety wi�kszo�� z nas zacz�o kierowa� si� nienawi�ci�, co od razu wykorzysta� Beliar.
	AI_Output (self, other, "DIA_Hess_Left_11_06"); //Ci jaszczuroludzie s�u�� Panu Ciemno�ci i s� skazani na wieczne pot�pienie.
	AI_Output (self, other, "DIA_Hess_Left_11_07"); //Garstka wybra�a drog� walki o w�asne przeznaczenie. Udowodnimy Pradawnemu, �e niew�a�ciwie nas os�dzi�!
	AI_Output (self, other, "DIA_Hess_Left_11_08"); //A wtedy staniemy si� godnymi, aby powr�ci� na dziedzin� naszych ojc�w.

	B_LogEntry(CH5_NON_Lizard, "Jaszczuroludzie chc� udowodni� Pradawnemu, �e s� godni chwa�y swych ojc�w.");
};

// **************************************************

INSTANCE DIA_Hess_Ancient (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 3;
	condition		= DIA_Hess_Ancient_Condition;
	information		= DIA_Hess_Ancient_Info;
	permanent		= 0;
	important		= 0;
	description		= "Staro�ytni?"; 
};

FUNC INT DIA_Hess_Ancient_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_First ))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Ancient_Info()
{
	liz_questions = liz_questions + 1;
	AI_Output (other, self, "DIA_Hess_Ancient_15_01"); //Staro�ytni?
	AI_Output (self, other, "DIA_Hess_Ancient_11_02"); //Kieruj� nami inne pobudki, mamy cel, kt�ry musimy osi�gn��!
	AI_Output (self, other, "DIA_Hess_Ancient_11_03"); //Nasi zdegenerowani bracia s�u�� Beliarowi i uosabiaj� wszystko, z czym tak zaciekle walczymy.
	AI_Output (self, other, "DIA_Hess_Ancient_11_04"); //To w nas narodzi si� ponownie chwa�a naszych ojc�w.
};

// **************************************************

INSTANCE DIA_Hess_Course (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 4;
	condition		= DIA_Hess_Course_Condition;
	information		= DIA_Hess_Course_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak chcecie pozby� si� wp�ywu kl�twy?"; 
};

FUNC INT DIA_Hess_Course_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_First ))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Course_Info()
{
	liz_questions = liz_questions + 1;
	AI_Output (other, self, "DIA_Hess_Course_15_01"); //Jak chcecie pozby� si� wp�ywu kl�twy?
	AI_Output (self, other, "DIA_Hess_Course_11_02"); //�yjemy po to by walczy� ze s�ugami Beliara.
	AI_Output (self, other, "DIA_Hess_Course_11_03"); //Pan Ciemno�ci przyzwa� Besti�, aby sta�a si� nasz� zag�ad�. Jednak dzi�ki Tobie i mocy Pradawnego zn�w �yjemy.
	AI_Output (self, other, "DIA_Hess_Course_11_04"); //Nadejdzie dzie�, gdy zgnieciemy ca�y pomiot Beliara!
	B_LogEntry(CH5_NON_Lizard, "Ci jaszczuroludzie s� zaciek�ymi wrogami Beliara.");
};

// **************************************************

INSTANCE DIA_Hess_Kill (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 5;
	condition		= DIA_Hess_Kill_Condition;
	information		= DIA_Hess_Kill_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobry jaszczur, to martwy jaszczur!"; 
};

FUNC INT DIA_Hess_Kill_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_First)) && (!Npc_KnowsInfo (hero, DIA_Hess_HelpOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Kill_Info()
{
	AI_Output (other, self, "DIA_Hess_Kill_15_00"); //Dobry jaszczur, to martwy jaszczur!
	AI_Output (self, other, "DIA_Hess_Kill_11_01"); //Nie tak �atwo nas zabi�, cz�owieku. Jednak skoro taka Twa wola...

	/**************

   Ork zmie� tutaj nastawienie na wrogie wszystkim przywo�anym jaszczurkom
   *********************/

	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);

	Log_SetTopicStatus(CH5_NON_Lizard, LOG_FAILED);
	B_LogEntry(CH5_NON_Lizard, "Nigdy nie lubi�em jaszczurek. Zrobi� sobie z nich porz�dne buty!");
};

INSTANCE DIA_Hess_Help(C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 10;
	condition		= DIA_Hess_Help_Condition;
	information		= DIA_Hess_Help_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Help_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_First))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Help_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Hess_Help_11_01"); //Zaczekaj cz�owieku! Mimo, �e nie�wiadomie to wiele dobrego dla nas uczyni�e�.
	AI_Output (other, self, "DIA_Hess_Help_15_02"); //Jako� b�d� musia� z tym �y�...
	AI_Output (self, other, "DIA_Hess_Help_11_03"); //Mimo, i� honor i duma wzbraniaj� si� przed tymi s�owami musz� poprosi� Ci� o jeszcze jedn� przys�ug�.
	AI_Output (other, self, "DIA_Hess_Help_15_04"); //A dlaczego mia�bym wam pom�c? Sk�d pomys�, �e jestem zainteresowany waszym losem?
	
   if (liz_questions >1)&&(liz_questions <=5)
	{
		AI_Output (self, other, "DIA_Hess_Help_11_05"); //Zada�e� wiele pyta�, na kt�re uzyska�e� szczere odpowiedzi. 
		AI_Output (self, other, "DIA_Hess_Help_11_06"); //Wiem, �e to niewiele, ale pozna�e� nasz� tragiczn� histori�.
		AI_Output (self, other, "DIA_Hess_Help_11_07"); //Je�eli zechcesz, mo�esz nam pom�c napisa� jej zako�czenie.
	}
	else
	{
		AI_Output (self, other, "DIA_Hess_Help_11_08"); //Mimo, i� nie interesuje Ci� nasz los, wyczuwam w Tobie serce wojownika.
		AI_Output (self, other, "DIA_Hess_Help_11_09"); //Nasze �ycie to ci�g�a walka. Je�eli zechcesz stan�� u naszego boku, by� mo�e zdo�amy zako�czy� �mierteln� tu�aczk�.
	};	
   
	AI_Output (self, other, "DIA_Hess_Help_11_10"); //Jaka b�dzie Twoja odpowied�?
	AI_Output (other, self, "DIA_Hess_Help_15_11"); //Zastanowi� si�...
	
   B_LogEntry(CH5_NON_Lizard, "Hesstad poprosi� mnie o pomoc w walce. Domy�lam si�, �e ich celem s� orkowie. Sam nie wiem, czy powinienem wpl�tywa� si� w kolejn� spraw�, kt�ra mnie nie dotyczy...");
};

INSTANCE DIA_Hess_HelpOk (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 20;
	condition		= DIA_Hess_HelpOk_Condition;
	information		= DIA_Hess_HelpOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Stan� u Waszego boku."; 
};

FUNC INT DIA_Hess_HelpOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_HelpOk_Info()
{
	AI_Output (other, self, "DIA_Hess_HelpOk_15_01"); //Stan� u Waszego boku.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_02"); //To dla nas wielki zaszczyt. Nie trwo�my jednak czasu na s�owa.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_03"); //Czuj�, �e Pradawny nas obserwuje. �mier� Bestii musia�a zwr�ci� jego uwag�, a wi�c i nasze powt�rne narodziny.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_04"); //To nasza ostatnia szansa na udowodnienie swej warto�ci.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_05"); //Wiem, �e na tej wyspie znajduje si� �wi�tynia Beliara, jednak nie ona jest naszym celem.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_06"); //Jaszczuroludzie unurzaj� t� krain� w krwi ork�w! Zabijemy pomiot Beliara, kt�ry obozuje przed �wi�tyni�.
	AI_Output (other, self, "DIA_Hess_HelpOk_15_07"); //To szale�stwo! To ogromny ob�z, dobrze obwarowany o liczebno�ci ork�w nawet nie wspomn�.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_08"); //Dla nas nie ma innej drogi. Zgodzi�e� si� stan�� u naszego boku w tej walce.
	AI_Output (other, self, "DIA_Hess_HelpOk_15_09"); //Cholera, wiedzia�em, �e co� tu �mierdzi. No dobra, jaki masz plan?
	AI_Output (self, other, "DIA_Hess_HelpOk_11_10"); //P�jdziemy tam i zabijemy wszystkich ork�w.
	AI_Output (other, self, "DIA_Hess_HelpOk_15_11"); //Hmm, widz�, �e d�ugo nad tym rozmy�la�e�...
	AI_Output (self, other, "DIA_Hess_HelpOk_11_12"); //Jednak naszym g��wnym celem b�d� orkowi dow�dcy. Je�eli zabijemy ich wszystkich ��cznie z genera�em to wystarczy, aby zasia� w ich szeregach chaos.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_13"); //Wtedy nie b�d� ju� gro�ni.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_14"); //Ruszajmy do boju!
	AI_Output (other, self, "DIA_Hess_HelpOk_15_15"); //A je�li zginiesz? Co wtedy zrobi Pradawny?
	AI_Output (self, other, "DIA_Hess_HelpOk_11_16"); //Nie spos�b tego przewidzie�. To staro�ytna istota. By� mo�e spopieli t� krain� by przypiecz�towa� nasz� pora�k�. W ka�dym razie kiedy� ju� tak uczyni�...
	AI_Output (other, self, "DIA_Hess_HelpOk_15_17"); //To �wietnie. W takim razie b�d� pilnowa� twoich plec�w. 
	
   B_LogEntry(CH5_NON_Lizard, "Zgodzi�em si� pom�c jaszczuroludziom w ich walce i ju� zaczynam tego �a�owa�.");

	Log_CreateTopic(CH5_NON_OrCHunting, LOG_MISSION);
	Log_SetTopicStatus(CH5_NON_OrCHunting, LOG_RUNNING);
	B_LogEntry(CH5_NON_OrCHunting, "Hesstad ma �wietny plan - wyr�n�� ca�y ob�z ork�w! No nic, skoro ju� da�em s�owo, nie b�d� go cofa�. Na szcz�cie wystarczy 'tylko' wyr�n�� wszystkich dow�dc�w i genera�a co w sumie wychodzi na to samo, bo aby si� do nich dosta� musimy przebi� si� przez orkowy ob�z. Aha - Hesstad nie mo�e zgin��, bo wtedy ten ich Pradawny mo�e urz�dzi� w Kolonii niez�y bajzel.");
	
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self, "GD1");
	
	Wld_InsertNpc(OrcGen1, "ORC_GEN12");
	Wld_InsertNpc(OrcElite1, "ORC_ELITE_TRAIN1");	
	Wld_InsertNpc(OrcElite1, "ORC_ELITE_TRAIN2");
	
	Wld_InsertNpc(OrcGen2, "ORC_GENERAL11");
	Wld_InsertNpc(OrcGen3, "OW_ORC_SHAMAN_ROOM2");
	
	Wld_InsertNpc(OrcElder, "ORC_ELDER");
	Wld_InsertNpc(OrcElite1, "ORK_ELITE1");	
	Wld_InsertNpc(OrcElite1, "ORK_ELITE2");	
};

INSTANCE DIA_Hess_Help1(C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 11;
	condition		= DIA_Hess_Help1_Condition;
	information		= DIA_Hess_Help1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Help1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help))&&(Npc_GetDistToWP(self,"OW_ORC_PATH") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Help1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(hero, self);
	AI_Output (self, other, "DIA_Hess_Help1_11_01"); //Przyb�d�cie wojownicy, czas przela� orkow� krew!

	Npc_ExchangeRoutine(self, "GD2");	
	
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH");
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH");

	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH");
	
	Wld_InsertNpc(DraconianOfficer, "OW_ORC_PATH");
	
	B_StopProcessInfos(self);	
};	

INSTANCE DIA_Hess_Help11(C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 11;
	condition		= DIA_Hess_Help11_Condition;
	information		= DIA_Hess_Help11_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Help11_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help1))&&(Npc_GetDistToWP(self,"OW_ORC_PATH_06_1") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Help11_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(hero, self);
	AI_Output (self, other, "DIA_Hess_Help11_11_01"); //Wzywam was bracia, sta�cie u mego boku!

	Npc_ExchangeRoutine(self, "GD3");
	
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(DraconianOfficer, "OW_ORC_PATH_06_1");
	
	B_StopProcessInfos(self);	
};	

INSTANCE DIA_Hess_Help111(C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 11;
	condition		= DIA_Hess_Help111_Condition;
	information		= DIA_Hess_Help111_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Help111_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help11))&&(Npc_GetDistToWP(self,"OW_ORC_PATH_06_10") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Help111_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(hero, self);
	AI_Output (self, other, "DIA_Hess_Help11_111_01"); //Odpowiedzcie na zew ognia!

	Npc_ExchangeRoutine(self, "GD4");
	
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH_06_10");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH_06_10");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH_06_10");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH_06_10");
	Wld_InsertNpc(DraconianOfficer, "OW_ORC_PATH_06_10");
		
	B_StopProcessInfos(self);	
};	

INSTANCE DIA_Hess_Help1111(C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 11;
	condition		= DIA_Hess_Help1111_Condition;
	information		= DIA_Hess_Help1111_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Help1111_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help111))&&(Npc_GetDistToWP(self,"OW_ORC_BOSS2") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Help1111_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(hero, self);
	AI_Output (self, other, "DIA_Hess_Help11_1111_01"); //Czas na ostateczn� walk�! Do mnie bracia!

	Npc_ExchangeRoutine(self, "GD5");	
	
	Wld_InsertNpc(DraconianScout, "OW_ORC_BOSS2");
	Wld_InsertNpc(DraconianScout, "OW_ORC_BOSS2");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_BOSS2");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_BOSS2");
	Wld_InsertNpc(DraconianOfficer, "OW_ORC_BOSS2");	
	
	B_StopProcessInfos(self);	
};	

INSTANCE DIA_Hess_Orks (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 21;
	condition		= DIA_Hess_Orks_Condition;
	information		= DIA_Hess_Orks_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Orks_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help1111))&&(Npc_GetDistToNpc(self,hero) < 1500)
 	&& (Npc_IsDead(OrcGen1))&&(Npc_IsDead(OrcGen2))&&(Npc_IsDead(OrcGen3))&&(Npc_IsDead(OrcElder))
	{
      return 1;
	};
};

FUNC VOID DIA_Hess_Orks_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Hess_Orks_11_01"); //Uda�o si�! G�owy hydry zosta�y odci�te!
	AI_Output (other, self, "DIA_Hess_Orks_15_02"); //Nie by�o �atwo...
	AI_Output (self, other, "DIA_Hess_Orks_11_03"); //Wielkie czyny wymagaj� wielkich po�wi�ce�.
	AI_Output (self, other, "DIA_Hess_Orks_11_04"); //Czas odda� pok�on Pradawnemu.	
	AI_Output (self, other, "DIA_Hess_Orks_11_05"); //Znajdziesz mnie tam �miertelniku gdzie wszystko si� zacz�o.

	Log_SetTopicStatus(CH5_NON_OrCHunting, LOG_SUCCESS);
	B_LogEntry(CH5_NON_OrCHunting, "Uda�o si�, orkowie gryz� ziemi�. Hesstad powiedzia�, �e znajd� go tam gdzie wszystko si� zacz�o. W�tpi� w istnienie tego ich Ojca Smok�w, ale kto wie...");

	/******************
Niech wszystkie �ywe jaszczurki udaj� si� do kr�gu tam si� przeprowadzi mod�y
*******************/

	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self, "START");
	B_StopProcessInfos(self);
	AI_Teleport(self, "START");
};

INSTANCE DIA_Hess_Orks2 (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 22;
	condition		= DIA_Hess_Orks2_Condition;
	information		= DIA_Hess_Orks2_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Orks2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Orks))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Orks2_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(hero, self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Hess_Orks2_11_01"); //Krew wrze w mych �y�ach, w ko�cu doczekali�my tej chwili...
	AI_Output (other, self, "DIA_Hess_Orks2_15_02"); //Oby� si� nie myli�.

	/***********
Niech Hess i reszta jaszczur�w odwr�c� si� w stron� miejsca gdzie pojawi si� Pradawny, gdzie� w pobli�u kr�gu, �eby by�o dla niego miejsce.
Ork wiem, �e jest animacja kl�czenie, jakby si� da�o to niech wszystkie jaszczurki padn� na kolana
************************/
	AI_AlignToWP(self);
	AI_Output (self, other, "DIA_Hess_Orks2_11_03"); //Ojcze ognia, sp�jrz na swe dzieci!
	AI_Output (self, other, "DIA_Hess_Orks2_11_04"); //Okupili�my s�abo�� w�asn� krwi� i �yciem braci. Nasza droga zako�czy�a si� przed przepa�ci�... 
	AI_Output (self, other, "DIA_Hess_Orks2_11_05"); //Umarli�my, aby narodzi� si� na nowo, pozw�l nam przez ostateczn� �mier� wr�ci� do domu.
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Hess_Orks2_11_06"); //Dokona�o si�.

	B_LogEntry(CH5_NON_Lizard, "Niech mnie licho, oni naprawd� przywo�ali smoka!");

	/**************************
Ork po dialogu powinien pojawi� si� w fajny spos�b wielki i paskudny smok, kt�ry zagada do Dicka, jego instancja to DRG_4093_Ancient

****************************/
	B_StopProcessInfos(self);
	Wld_InsertNpc(DRG_4093_Ancient, "PSI_TELEPORT");
}; 
