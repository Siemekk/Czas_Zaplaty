
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Seven_EXIT(C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 999;
	condition			= Info_Seven_EXIT_Condition;
	information			= Info_Seven_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Seven_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Seven_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Seven_Hello (C_INFO)
{
	npc		= Grd_613_Gardist;
	nr			= 1;
	condition		= Info_Seven_Hello_Condition;
	information		= Info_Seven_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Kim jeste�?";
};                       

FUNC INT Info_Seven_Hello_Condition()
{	


	return 1;


};
FUNC VOID Info_Seven_Hello_Info()
{	

	AI_Output (other, self,"Info_Seven_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"Info_Seven_Hello_06_01"); //M�w mi Si�demka. 
	AI_Output (other, self,"Info_Seven_Hello_15_02"); //Co to za imi�?
	AI_Output (self, other,"Info_Seven_Hello_06_03"); //Du�o lepsze ni� nie przymierzaj�c... kutas. Prawda, Dick?
	AI_Output (other, self,"Info_Seven_Hello_15_04"); //Mam na imi� Rick!
	AI_Output (self, other,"Info_Seven_Hello_06_05"); //Wybacz, m�j b��d.
};




// ************************************************************

INSTANCE Info_Seven_Again (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_Again_Condition;
	information		= Info_Seven_Again_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Szkoda tego niemowy.";
};                       

FUNC INT Info_Seven_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Seven_Hello))&& (Npc_KnowsInfo (hero, Info_Nia_Def1))
	{
		return 1;
	};

};
FUNC VOID Info_Seven_Again_Info()
{	

	AI_Output (other, self,"Info_Seven_Again_15_00"); //Szkoda tego niemowy.
	AI_Output (self, other,"Info_Seven_Again_06_01"); //Szkoda jest wtedy, jak ork wpadnie do studni - ani wody do picia, ani �cierwa do zabicia.
	AI_Output (other, self,"Info_Seven_Again_15_02"); //Kiedy z nim rozmawia�em wygl�da� jakby co� go �miertelnie przerazi�o.
	AI_Output (self, other,"Info_Seven_Again_06_03"); //Hmm, jak tak patrz� na twoj� bu�k�, to nawet wiem co.
	AI_Output (other, self,"Info_Seven_Again_15_04"); //Nie na mnie patrzy�, tylko na Ni�.
	AI_Output (self, other,"Info_Seven_Again_06_05"); //Aaa. No c�, tutaj powinni�my zako�czy� rozmow�.
	AI_Output (other, self,"Info_Seven_Again_15_06"); //Ty te� si� czego� boisz?
	AI_Output (self, other,"Info_Seven_Again_06_07"); //Si�demka nie boi si� niczego!
	AI_Output (other, self,"Info_Seven_Again_15_08"); //Wi�c?
	AI_Output (self, other,"Info_Seven_Again_06_09"); //Zrobimy to po mojemu. Zadam Ci kilka... zagadek. 
	AI_Output (self, other,"Info_Seven_Again_06_10"); //Je�eli dobrze odpowiesz na wszystkie, zdradz� Ci co� o czym lepiej g�o�no nie m�wi�.
	AI_Output (self, other,"Info_Seven_Again_06_11"); //I pami�taj, masz tylko jedn� pr�b� na ka�d� z zagadek, wi�c dobrze si� zastan�w.
	B_LogEntry		(CH4_Non_Eagle, "Si�demka zdradzi mi co wie je�eli odgadn� jego zagadki. Te� wymy�li�...");
};


// ************************************************************

INSTANCE Info_Seven_Again1 (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_Again1_Condition;
	information		= Info_Seven_Again1_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Co to za zagadki?";
};                       

FUNC INT Info_Seven_Again1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Seven_Again))
	{
		return 1;
	};

};
FUNC VOID Info_Seven_Again1_Info()
{	

	AI_Output (other, self,"Info_Seven_Again1_15_00"); //Co to za zagadki?
	AI_Output (self, other,"Info_Seven_Again1_06_01"); //Zacznijmy od pierwszej.
	AI_Output (self, other,"Info_Seven_Again1_06_02"); //Ta b�dzie na rozgrzewk�.
	AI_Output (self, other,"Info_Seven_Again1_06_03"); //Jakie kroki nale�y podj�� kiedy spotka si� w�ciek�ego warga?

	Info_ClearChoices (Info_Seven_Again1);
	Info_AddChoice (Info_Seven_Again1, "Najlepiej nic nie robi�.", Info_Seven_Again1_Nothing);
	Info_AddChoice (Info_Seven_Again1, "Jak najd�u�sze.", Info_Seven_Again1_Ok);
	Info_AddChoice (Info_Seven_Again1, "Zachlasta� bydl�!", Info_Seven_Again1_Kill);
	Info_AddChoice (Info_Seven_Again1, "Nie mam poj�cia.", Info_Seven_Again1_No);
};


// -----------------------------------------------------------------

FUNC VOID Info_Seven_Again1_Nothing()
{
	AI_Output (other, self,"Info_Seven_Again1_Nothing_15_00"); //Najlepiej nic nie robi�.
	AI_Output (self, other,"Info_Seven_Again1_Nothing_06_01"); //I czeka�, a� zwierzaczek sko�czy je��?
	AI_Output (self, other,"Info_Seven_Again1_Nothing_06_02"); //Zaprawd�, jeste� idiot�!
		Info_ClearChoices (Info_Seven_Again1);
};

// -----------------------------------------------------------------

FUNC VOID  Info_Seven_Again1_Kill()
{
	AI_Output (other, self," Info_Seven_Again1_Kill_15_00"); //Zachlasta� bydl�!
	AI_Output (self, other," Info_Seven_Again1_Kill_06_01"); //Niby tak, ale nie to mia�em na my�li.
		Info_ClearChoices (Info_Seven_Again1);
};


FUNC VOID  Info_Seven_Again1_No()
{
	AI_Output (other, self," Info_Seven_Again1_No_15_00"); //Nie mam poj�cia.
	AI_Output (self, other," Info_Seven_Again1_No_06_01"); //U�yj tego czego� pomi�dzy uszami!
	AI_Output (self, other," Info_Seven_Again1_No_06_02"); //Tracisz tylko m�j czas...
		Info_ClearChoices (Info_Seven_Again1);
};


// -----------------------------------------------------------------
var int Seven_Myst;
FUNC VOID  Info_Seven_Again1_Ok()
{
	AI_Output (other, self," Info_Seven_Again1_Ok_15_00"); //Jak najd�u�sze.
	AI_Output (self, other," Info_Seven_Again1_Ok_06_01"); //He, he. W rzeczy samej. 
	AI_Output (self, other," Info_Seven_Again1_Ok_06_02"); //Bardzo dobrze, wr�� jak b�dziesz got�w do nast�pnej zagadki.
	B_LogEntry		(CH4_Non_Eagle, "Pierwsz� zagadk� mam z g�owy, czas na nast�pn�.");
	Seven_Myst = 1;
		Info_ClearChoices (Info_Seven_Again1);
};




// ************************************************************

INSTANCE Info_Seven_Myst (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_Myst_Condition;
	information		= Info_Seven_Myst_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Czekam na kolejn� zagadk�.";
};                       

FUNC INT Info_Seven_Myst_Condition()
{	

	if (Seven_Myst==1)
	{
		return 1;
	};

};
FUNC VOID Info_Seven_Myst_Info()
{	

	AI_Output (other, self,"Info_Seven_Myst_15_00"); //Czekam na kolejn� zagadk�.
	AI_Output (self, other,"Info_Seven_Myst_06_01"); //Teraz wymy�l� co� trudniejszego...
	AI_Output (self, other,"Info_Seven_Myst_06_02"); //Ju� mam!
	AI_Output (self, other,"Info_Seven_Myst_06_03"); //Co m�wi kat ustawiaj�c skaza�ca pod szubienic�?

	Info_ClearChoices (Info_Seven_Myst);
	Info_AddChoice (Info_Seven_Myst, "Pyta o ostatnie �yczenie?", Info_Seven_Myst_Nothing);
	Info_AddChoice (Info_Seven_Myst, "Nic nie m�wi.", Info_Seven_Myst_Ok);
	Info_AddChoice (Info_Seven_Myst, "G�owa do g�ry!", Info_Seven_Myst_Kill);
	Info_AddChoice (Info_Seven_Myst, "Nie mam poj�cia.", Info_Seven_Myst_No);
};


// -----------------------------------------------------------------

FUNC VOID Info_Seven_Myst_Nothing()
{
	AI_Output (other, self,"Info_Seven_Myst_Nothing_15_00"); //Pyta o ostatnie �yczenie?
	AI_Output (self, other,"Info_Seven_Myst_Nothing_06_01"); //To nie z�ota rybka, ani koncert �ycze�.
	AI_Output (self, other,"Info_Seven_Myst_Nothing_06_02"); //Odpadasz z gry.
		Info_ClearChoices (Info_Seven_Myst);
};

// -----------------------------------------------------------------
FUNC VOID  Info_Seven_Myst_Kill()
{
	Seven_Myst=2;			
	AI_Output (other, self," Info_Seven_Myst_Kill_15_00"); //G�owa do g�ry!
	AI_Output (self, other," Info_Seven_Myst_Kill_06_01"); //He, he. Masz poczucie humoru, to lubi�.
	AI_Output (self, other," Info_Seven_Myst_Kill_06_02"); //Daj zna�, jak b�dziesz got�w na nast�pn� zagadk�.
	B_LogEntry		(CH4_Non_Eagle, "Drug� zagadk� mam z g�owy, czas na kolejn�.");
		Info_ClearChoices (Info_Seven_Myst);
};


FUNC VOID  Info_Seven_Myst_No()
{
	AI_Output (other, self," Info_Seven_Myst_No_15_00"); //Nie mam poj�cia.
	AI_Output (self, other," Info_Seven_Myst_No_06_01"); //U�yj tego czego� pomi�dzy uszami!
	AI_Output (self, other," Info_Seven_Myst_No_06_02"); //Tracisz tylko m�j czas...
		Info_ClearChoices (Info_Seven_Myst);
};


// -----------------------------------------------------------------

FUNC VOID  Info_Seven_Myst_Ok()
{
	AI_Output (other, self," Info_Seven_Myst_Ok_15_00"); //Nic nie m�wi.
	AI_Output (self, other," Info_Seven_Myst_Ok_06_01"); //Mo�e i nic, ale to za bardzo oklepane.
	AI_Output (self, other," Info_Seven_Myst_Ok_06_02"); //Mog�e� si� bardziej wysili�.
		Info_ClearChoices (Info_Seven_Myst);
};




// ************************************************************

INSTANCE Info_Seven_MystAgain (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_MystAgain_Condition;
	information		= Info_Seven_MystAgain_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Co wymy�li�e� tym razem?";
};                       

FUNC INT Info_Seven_MystAgain_Condition()
{	

	if (Seven_Myst==2)
	{
		return 1;
	};

};
FUNC VOID Info_Seven_MystAgain_Info()
{	

	AI_Output (other, self,"Info_Seven_MystAgain_15_00"); //Co wymy�li�e� tym razem?
	AI_Output (self, other,"Info_Seven_MystAgain_06_01"); //Teraz mo�e co� z bajek.
	AI_Output (self, other,"Info_Seven_MystAgain_06_02"); //Ta powinno Ci si� spodoba�.
	AI_Output (self, other,"Info_Seven_MystAgain_06_03"); //Co to jest dziewica?

	Info_ClearChoices (Info_Seven_MystAgain);
	Info_AddChoice (Info_Seven_MystAgain, "Kobieta, kt�ra jeszcze nigdy...", Info_Seven_MystAgain_Nothing);
	Info_AddChoice (Info_Seven_MystAgain, "Ekhm, to tylko mit i zabobon.", Info_Seven_MystAgain_Ok);
	Info_AddChoice (Info_Seven_MystAgain, "Je�eli pijesz do mnie!", Info_Seven_MystAgain_Kill);
	Info_AddChoice (Info_Seven_MystAgain, "Satyra na leniwych ch�op�w.", Info_Seven_MystAgain_No);
};


// -----------------------------------------------------------------

FUNC VOID Info_Seven_MystAgain_Nothing()
{
	AI_Output (other, self,"Info_Seven_MystAgain_Nothing_15_00"); //Kobieta, kt�ra jeszcze nigdy...
	AI_Output (self, other,"Info_Seven_MystAgain_Nothing_06_01"); //Bystrzacha mi si� trafi�.
	AI_Output (self, other,"Info_Seven_MystAgain_Nothing_06_02"); //Tyle to ka�dy wie. Zejd� mi z oczu.
		Info_ClearChoices (Info_Seven_MystAgain);
};

// -----------------------------------------------------------------

FUNC VOID  Info_Seven_MystAgain_Kill()
{
	AI_Output (other, self," Info_Seven_MystAgain_Kill_15_00"); //Je�eli pijesz do mnie!
	AI_Output (self, other," Info_Seven_MystAgain_Kill_06_01"); //Gdzie�bym �mia�. Chocia� z drugiej strony...
	AI_Output (self, other," Info_Seven_MystAgain_Kill_06_02"); //Wiesz co, mi�o by�o, ale mam sporo na g�owie. Bywaj.
		Info_ClearChoices (Info_Seven_MystAgain);
};


FUNC VOID  Info_Seven_MystAgain_No()
{
	Seven_Myst=3;
	AI_Output (other, self," Info_Seven_MystAgain_No_15_00"); //Satyra na leniwych ch�op�w.
	AI_Output (self, other," Info_Seven_MystAgain_No_06_01"); //Dobre, nie? Sw�j ch�op. �e te� Ci� wcze�niej nie pozna�em.
	AI_Output (self, other," Info_Seven_MystAgain_No_06_02"); //Wr�� jak b�dziesz got�w na prawdziwe wyzwanie.
	B_LogEntry		(CH4_Non_Eagle, "Kolejn� zagadk� mam z g�owy, czas na ostatni�.");
		Info_ClearChoices (Info_Seven_MystAgain);
};


// -----------------------------------------------------------------

FUNC VOID  Info_Seven_MystAgain_Ok()
{
	AI_Output (other, self," Info_Seven_MystAgain_Ok_15_00"); //Ekhm, to tylko mit i zabobon.
	AI_Output (self, other," Info_Seven_MystAgain_Ok_06_01"); //Niby tak, ale nie to chcia�em us�ysze�.
	AI_Output (self, other," Info_Seven_MystAgain_Ok_06_02"); //Szkoda, bo nie�le Ci sz�o.
		Info_ClearChoices (Info_Seven_MystAgain);
};




// ************************************************************

INSTANCE Info_Seven_MystLast (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_MystLast_Condition;
	information		= Info_Seven_MystLast_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Jestem got�w na prawdziwe wyzwanie.";
};                       

FUNC INT Info_Seven_MystLast_Condition()
{	

	if (Seven_Myst==3)
	{
		return 1;
	};

};
FUNC VOID Info_Seven_MystLast_Info()
{	

	AI_Output (other, self,"Info_Seven_MystLast_15_00"); //Jestem got�w na prawdziwe wyzwanie.
	AI_Output (self, other,"Info_Seven_MystLast_06_01"); //W rzeczy samej. Ale tym razem b�dzie ju� na powa�nie.
	AI_Output (self, other,"Info_Seven_MystLast_06_02"); //S�uchaj uwa�nie, bo to nie b�dzie proste.
	AI_Output (self, other,"Info_Seven_MystLast_06_03"); //Jak dziwnie by to nie zabrzmia�o przedstawi� ci kilka hipotez na... hipotezy.
	AI_Output (self, other,"Info_Seven_MystLast_06_04"); //Jeste� got�w?
	AI_Output (other, self,"Info_Seven_MystLast_15_05"); //Dawaj.
	AI_Output (self, other,"Info_Seven_MystLast_06_06"); //Hipoteza pierwsza. Hipoteza druga jest fa�szywa, a hipoteza trzecia jest prawdziwa.
	AI_Output (self, other,"Info_Seven_MystLast_06_07"); //Hipoteza druga. Hipoteza czwarta jest prawdziwa, a hipoteza sz�sta jest fa�szywa.
	AI_Output (self, other,"Info_Seven_MystLast_06_08"); //Hipoteza trzecia. Hipoteza czwarta jest fa�szywa, hipoteza pi�ta jest prawdziwa.
	AI_Output (self, other,"Info_Seven_MystLast_06_09"); //Hipoteza czwarta. Hipotezy druga i sz�sta s� obydwie prawdziwe.
	AI_Output (self, other,"Info_Seven_MystLast_06_10"); //Hipoteza pi�ta. Hipoteza pierwsza jest prawdziwa, a hipoteza druga jest fa�szywa.
	AI_Output (self, other,"Info_Seven_MystLast_06_11"); //Hipoteza sz�sta. Hipoteza czwarta jest fa�szywa, a hipoteza pi�ta jest prawdziwa.
	AI_Output (self, other,"Info_Seven_MystLast_06_12"); //Co najmniej jedna z tych hipotez jest prawdziwa. A kt�re s� fa�szywe?

	Info_ClearChoices (Info_Seven_MystLast);
	Info_AddChoice (Info_Seven_MystLast, "Pierwsza i trzecia.", Info_Seven_MystLast_Nothing);
	Info_AddChoice (Info_Seven_MystLast, "Druga i czwarta.", Info_Seven_MystLast_Ok);
	Info_AddChoice (Info_Seven_MystLast, "Pi�ta i sz�sta.", Info_Seven_MystLast_Kill);
	Info_AddChoice (Info_Seven_MystLast, "M�g�by� powt�rzy�?", Info_Seven_MystLast_No);
};



// -----------------------------------------------------------------

FUNC VOID Info_Seven_MystLast_Nothing()
{
	AI_Output (other, self,"Info_Seven_MystLast_Nothing_15_00"); //Pierwsza i trzecia.
	AI_Output (self, other,"Info_Seven_MystLast_Nothing_06_01"); //�le, te s� prawdziwe.
	AI_Output (self, other,"Info_Seven_MystLast_Nothing_06_02"); //Nie uda�o Ci si�, przykro mi, ale nic Ci nie powiem.
		Info_ClearChoices (Info_Seven_MystLast);
};

// -----------------------------------------------------------------

FUNC VOID  Info_Seven_MystLast_Kill()
{
	AI_Output (other, self," Info_Seven_MystLast_Kill_15_00"); //Pi�ta i sz�sta.
	AI_Output (self, other," Info_Seven_MystLast_Kill_06_01"); //Ta para jest prawdziwa.
	AI_Output (self, other," Info_Seven_MystLast_Kill_06_02"); //Nic z tego, nic Ci nie powiem. Bywaj.
		Info_ClearChoices (Info_Seven_MystLast);
};


FUNC VOID  Info_Seven_MystLast_No()
{
	AI_Output (other, self," Info_Seven_MystLast_No_15_00"); //M�g�by� powt�rzy�?
	AI_Output (self, other," Info_Seven_MystLast_No_06_01"); //Nic z tego. Mia�e� tylko jedn� szans�.
	AI_Output (self, other," Info_Seven_MystLast_No_06_02"); //Szkoda, bo niewiele brakowa�o. Powodzenia.
		Info_ClearChoices (Info_Seven_MystLast);

};


// -----------------------------------------------------------------

FUNC VOID  Info_Seven_MystLast_Ok()
{
	Seven_Myst=4;
	AI_Output (other, self," Info_Seven_MystLast_Ok_15_00"); //Druga i czwarta.
	AI_Output (self, other," Info_Seven_MystLast_Ok_06_01"); //Nie�le. Nie s�dzi�em, �e odgadniesz prawid�owo.
	AI_Output (self, other," Info_Seven_MystLast_Ok_06_02"); //Jestem pod wra�eniem.
	AI_Output (self, other," Info_Seven_MystLast_Ok_06_03"); //Wr��, to pogadamy o pewnej zdzirze. Ale najpierw porozmawiaj z innymi.
	AI_Output (self, other," Info_Seven_MystLast_Ok_06_04"); //To co Ci powiem pogr��y zab�jc�.
	B_LogEntry		(CH4_Non_Eagle, "Odgad�em ostatni� zagadk�! Teraz to ja b�d� zadawa� pytania, ale najpierw musz� wypyta� innych o podejrzenia w sprawie zab�jstwa.");
		Info_ClearChoices (Info_Seven_MystLast);
};




// ************************************************************

INSTANCE Info_Seven_MystEnd (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_MystEnd_Condition;
	information		= Info_Seven_MystEnd_Info;
	important		= 0;
	permanent		= 0;
	description 		= "No to zamieniam si� w s�uch.";
};                       

FUNC INT Info_Seven_MystEnd_Condition()
{	

	/*******************
Dick musia� wcze�niej pogada� z innymi, jak ju� obleci wszystkich to dopiero wtedy Si�demka z nim pogada

************************/


	if (Seven_Myst==4)&&(Npc_KnowsInfo (hero, Info_Ash_Again))&&(Npc_KnowsInfo (hero, Info_Bartender_Stigma1))&&(Npc_KnowsInfo (hero, Info_Ormus_Again1))&&(Npc_KnowsInfo (hero, Info_SmithX_Again))
	{
		return 1;
	};

};
FUNC VOID Info_Seven_MystEnd_Info()
{	

	var C_NPC pinto; pinto = Hlp_GetNpc(Grd_612_Gardist);

	investigation = investigation + 1;
	AI_Output (other, self,"Info_Seven_MystEnd_15_00"); //No to zamieniam si� w s�uch.
	AI_Output (self, other,"Info_Seven_MystEnd_06_01"); //Zas�u�y�e� na to, by us�ysze� prawd� o mrocznej stronie pewnej niewy�ytej dziwki.
	AI_Output (self, other,"Info_Seven_MystEnd_06_02"); //Jestem pewien, �e to Nia zabija. Widzia�em jak uje�d�a�a tego ostatniego pechowca.
	AI_Output (self, other,"Info_Seven_MystEnd_06_03"); //Na koniec zad�ga�a go no�em. Kiedy dogorywa�, ona nadal na nim siedzia�a.
	AI_Output (self, other,"Info_Seven_MystEnd_06_04"); //Jest gorsza ni� harpie.
	AI_Output (other, self,"Info_Seven_MystEnd_15_05"); //Dlaczego nikomu tego nie powiedzia�e�?
	AI_Output (self, other,"Info_Seven_MystEnd_06_06"); //Bo to i tak nic nie da.
	AI_Output (self, other,"Info_Seven_MystEnd_06_07"); //Kris jej nie tknie. Mog� si� za�o�y�, �e pewnie sam co� podejrzewa.
	AI_Output (self, other,"Info_Seven_MystEnd_06_08"); //Jak znam jego i Pinto to przed powrotem Hrabiego wrobi� w zab�jstwa jakiego� pechowca.
	AI_Output (other, self,"Info_Seven_MystEnd_15_09"); //Dlaczego tak na mnie patrzysz?
	AI_Output (self, other,"Info_Seven_MystEnd_06_10"); //Jeste� nowy, nikt Ci� tu nie zna, do tego wtykasz nos w nie swoje sprawy. Jeste� idealnym kandydatem.
	AI_Output (other, self,"Info_Seven_MystEnd_15_11"); //Ale nie by�o mnie tutaj kiedy to si� zacz�o!
	AI_Output (self, other,"Info_Seven_MystEnd_06_12"); //Kto wie? Mo�e zakrada�e� si� w nocy?
	AI_Output (self, other,"Info_Seven_MystEnd_06_13"); //Jestem pewien, �e znajdzie si� jaki� �wiadek. 
	AI_Output (other, self,"Info_Seven_MystEnd_15_14"); //Cholera, masz racj�. Co teraz?
	AI_Output (self, other,"Info_Seven_MystEnd_06_15"); //S�uchaj brachu. Polubi�em Ci�. My�limy podobnie.
	AI_Output (self, other,"Info_Seven_MystEnd_06_16"); //Mo�e w innych czasach i w innym miejscu zostaliby�my przyjaci�mi.
	AI_Output (self, other,"Info_Seven_MystEnd_06_17"); //Pomog� Ci, ale trzeba dzia�a� szybko.
	AI_Output (other, self,"Info_Seven_MystEnd_15_18"); //S�ucham.
	AI_Output (self, other,"Info_Seven_MystEnd_06_19"); //Musisz sprowokowa� Ni� i musz� by� na to �wiadkowie. Najlepiej, �eby by� przy tym Kris lub Pinto.
	AI_Output (other, self,"Info_Seven_MystEnd_15_20"); //Ale jak to zrobi�?
	AI_Output (self, other,"Info_Seven_MystEnd_06_21"); //To ju� Twoja dzia�ka. To bezlitosna bestia, ale z ka�d� ofiar� sp�kowa�a.
	AI_Output (self, other,"Info_Seven_MystEnd_06_22"); //Mo�e spr�buj si� z ni� um�wi�, najlepiej po zmroku.
	AI_Output (self, other,"Info_Seven_MystEnd_06_23"); //Pogadaj te� z Krisem, albo Pinto. Kto� z nich musi by� �wiadkiem.
	AI_Output (other, self,"Info_Seven_MystEnd_15_24"); //A je�eli oni poczekaj�, a� dziewczyna mnie zaszlachtuje? Albo rzuc� si� na mnie, kiedy to ja j� zabij�?
	AI_Output (other, self,"Info_Seven_MystEnd_15_25"); //Tak czy inaczej, w�tpi�, �e stan� po mojej stronie.
	AI_Output (self, other,"Info_Seven_MystEnd_06_26"); //Racja. Za�atw sobie wi�cej �wiadk�w, co najmniej kilku, kt�rzy te� to zobacz�.
	AI_Output (self, other,"Info_Seven_MystEnd_06_27"); //Wtedy Kris i Pinto powinni umy� r�ce.
	AI_Output (other, self,"Info_Seven_MystEnd_15_28"); //Tak zrobi�. Wielkie dzi�ki Si�demka, jestem Ci co� winien.
	AI_Output (self, other,"Info_Seven_MystEnd_06_29"); //Sp�acisz d�ug jak pozb�dziesz si� tej psychopatki. Powodzenia, przyjacielu.

	B_LogEntry		(CH4_Non_Eagle, "Si�demka jest pewien, �e to Nia zabija. Musz� nam�wi� j� na nocne spotkanie, o kt�rym musi te� dowiedzie� si� Kris lub Pinto. Powinienem te� przekona� co najmniej kilku innych �wiadk�w, bo inaczej Kris i tak na mnie zrzuci win�.");

	B_StopProcessInfos	(self);


	/***********************************

Pinto ma podej�� do gadaj�cych Dicka i SI�demki.

************************************/


};



// ************************************************************

INSTANCE Info_Seven_MystEnd1 (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_MystEnd1_Condition;
	information		= Info_Seven_MystEnd1_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Pomo�esz?";
};                       

FUNC INT Info_Seven_MystEnd1_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_Seven_MystEnd1_Info()
{	
	AI_Output (other, self,"Info_Seven_MystEnd1_15_00"); //Pomo�esz?
	AI_Output (self, other,"Info_Seven_MystEnd1_06_01"); //Pewnie, nie m�g�bym przegapi� okazji, �eby zobaczy� min� tej dziwki.
	AI_Output (self, other,"Info_Seven_MystEnd1_06_02"); //Zaczaj� si� w cieniu i powiem Krisowi jak by�o naprawd�.
	AI_Output (other, self,"Info_Seven_MystEnd1_15_03"); //Dzi�ki Si�demka. Jeste� prawdziwym przyjacielem.
	AI_Output (self, other,"Info_Seven_MystEnd1_06_04"); //Nie ma sprawy, bestyjka dostanie to, na co zas�u�y�a.
	B_LogEntry		(CH4_Non_Eagle, "Si�demka mi pomo�e.");
	
	Npc_ExchangeRoutine	(self,"WAIT");	
	
};


// ************************************************************

INSTANCE Info_Seven_Watch (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_Watch_Condition;
	information		= Info_Seven_Watch_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Seven_Watch_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Pinto_Hmm))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};

};
FUNC VOID Info_Seven_Watch_Info()
{	
	var C_NPC pinto; pinto = Hlp_GetNpc(Grd_612_Gardist);

	B_FullStop (hero);
	AI_TurnToNpc (self, pinto);
	AI_Output (self, other,"Info_Seven_Watch_06_01"); //Dziwka mia�a n�. Odrzuci�a brzeszczot, gdy tylko zobaczy�a mnie w cieniu.
	AI_Output (self, other,"Info_Seven_Watch_06_02"); //Nie mog�em pozwoli�, �eby usz�o jej to znowu p�azem.
	AI_Output (self, other,"Info_Seven_Watch_06_03"); //Za du�o ta twierdza widzia�a ju� �mierci...
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other,"Info_Seven_Watch_06_04"); //O, tu le�y!
	B_StopProcessInfos	(self);
	AI_PlayAni			(self,	"T_PLUNDER");

	/************************
Seven ma si� niby schyli� po n� Nii

*********************/
};



// ************************************************************

INSTANCE Info_Seven_Watch1 (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_Watch1_Condition;
	information		= Info_Seven_Watch1_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Seven_Watch1_Condition()
{	
	if (Npc_KnowsInfo (hero,Info_Pinto_Hmm1))&& (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};

};
FUNC VOID Info_Seven_Watch1_Info()
{	
	var C_NPC pinto; pinto = Hlp_GetNpc(Grd_612_Gardist);

	B_FullStop (hero);
	AI_TurnToNpc (self, pinto);
	AI_Output (self, other,"Info_Seven_Watch1_06_01"); //Za chwil� do was do��cz� Pinto. Chc� jeszcze zamieni� s��wko z naszym bohaterem.
	AI_TurnToNpc (self, other);
	AI_GotoNpc(self, hero);
	AI_Output (self, other,"Info_Seven_Watch1_06_02"); //Kurtyna opad�a. Troch� szkoda, �e Pinto tak �atwo da� si� nabra�.
	AI_Output (other, self,"Info_Seven_Watch1_15_03"); //O czym Ty m�wisz?
	AI_Output (self, other,"Info_Seven_Watch1_06_04"); //Widzisz, Rick. Zabi�em Ni�, bo widzia�a twarz prawdziwego mordercy.
	AI_Output (other, self,"Info_Seven_Watch1_15_05"); //To niemo�liwe. Przecie� sam m�wi�e�, �e...
	AI_Output (other, self,"Info_Seven_Watch1_15_06"); //To TY!
	AI_Output (self, other,"Info_Seven_Watch1_06_07"); //W rzeczy samej drogi ch�opcze. To ja.
	AI_Output (other, self,"Info_Seven_Watch1_15_08"); //Wykorzysta�e� mnie!
	AI_DrawWeapon (hero);
	AI_Output (self, other,"Info_Seven_Watch1_06_09"); //Spokojnie, bo zaczynamy zwraca� uwag�.
	AI_Output (self, other,"Info_Seven_Watch1_06_10"); //Schowaj miecz. Nie chcia�bym zrobi� Ci krzywdy.
	AI_RemoveWeapon (hero);
	AI_Output (self, other,"Info_Seven_Watch1_06_11"); //Tak lepiej. A teraz pos�uchaj.
	AI_Output (self, other,"Info_Seven_Watch1_06_12"); //Nia rzeczywi�cie by�a potworem, cho� nie takim, jakim j� przedstawi�em.
	AI_Output (self, other,"Info_Seven_Watch1_06_13"); //Wykorzystywa�a m�czyzn, bawi�a si� nimi i porzuca�a, jak par� onucy.
	AI_Output (self, other,"Info_Seven_Watch1_06_14"); //Kiedy� pad�o i na mnie.
	AI_Output (self, other,"Info_Seven_Watch1_06_15"); //Mo�e wyjd� na idiot�, ale straci�em dla lafiryndy g�ow�. Nic na to nie poradz�, kochliwy jestem i tyle.
	AI_Output (self, other,"Info_Seven_Watch1_06_16"); //To by�o zaraz po tym, jak Hrabia j� tu przywi�z�. Spotkali�my si� potajemnie kilka razy.
	AI_Output (self, other,"Info_Seven_Watch1_06_17"); //P�niej przesta�a przychodzi�. Nakry�em ladacznic�, jak zabawia�a si� ze stra�nikiem.
	AI_Output (self, other,"Info_Seven_Watch1_06_18"); //P�niej byli inni, wielu innych...
	AI_Output (self, other,"Info_Seven_Watch1_06_19"); //Nie mog�em pozwoli�, �eby jaka� dziwka drwi�a z moich uczu�!
	AI_Output (self, other,"Info_Seven_Watch1_06_20"); //Zacz��em zabija�. Wysy�a�em do Beliara ka�dego g�upca, kt�ry z ni� obcowa�.
	AI_Output (self, other,"Info_Seven_Watch1_06_21"); //Czasem inni widzieli jak Nia z kim� sobie u�ywa�a, p�niej ten kto� gryz� ziemi�.
	AI_Output (self, other,"Info_Seven_Watch1_06_22"); //Nawet taki idiota jak Ormus zorientowa� si�, kto stoi za morderstwami. Podejrze� by�o coraz wi�cej. Dlatego w�a�nie Znami� si� na ni� rzuci�.
	AI_Output (self, other,"Info_Seven_Watch1_06_23"); //Dobrze to rozegra�em, a niewy�yta dziwka dosta�a to, na co zas�u�y�a.
	AI_Output (other, self,"Info_Seven_Watch1_15_24"); //Po co mi to m�wisz?
	AI_Output (self, other,"Info_Seven_Watch1_06_25"); //Bo polubi�em Ci�, ch�opcze. Jeste�my bardziej podobni ni� chcia�by� przyzna�.
	AI_Output (other, self,"Info_Seven_Watch1_15_26"); //Nie jestem taki jak Ty!
	AI_Output (self, other,"Info_Seven_Watch1_06_27"); //Jeszcze nie. A mo�e ju� nie? Kto wie...
	AI_Output (other, self,"Info_Seven_Watch1_15_28"); //Powinienem zaci�gn�� Ci� do Krisa!
	AI_Output (self, other,"Info_Seven_Watch1_06_29"); //I jak my�lisz, komu by da� wiar�? Tobie, czy Pinto i reszcie? Do tego ten n�...
	AI_Output (self, other,"Info_Seven_Watch1_06_30"); //Zwin��em or� dzisiaj, w ko�cu epilog musi by� dramatyczny.
	AI_Output (other, self,"Info_Seven_Watch1_15_31"); //Jeste� chory!
	AI_Output (self, other,"Info_Seven_Watch1_06_32"); //Nie, Rick. Jestem tylko cz�owiekiem, nawet takie bydle jak ja ma uczucia.
	AI_Output (other, self,"Info_Seven_Watch1_15_33"); //Niech ci� szlag, Si�demka!
	AI_Output (self, other,"Info_Seven_Watch1_06_34"); //Pewnie tak i b�dzie. 
	AI_Output (self, other,"Info_Seven_Watch1_06_35"); //Bywaj, Rick. Mi�o by�o Ci� pozna�.

	Npc_ExchangeRoutine	(self,"START");	

	Log_SetTopicStatus	(CH4_Non_NiaHelp, LOG_SUCCESS);
	B_LogEntry		(CH4_Non_Eagle, "Ten sukinsyn mnie wykorzysta�! To Si�demka zabija�, znowu wyszed�em na idiot�. Czas opu�ci� to pokr�cone miejsce.");

}; 

INSTANCE DIA_Seven_CanYouTeachMe (C_INFO)
{
	npc				= Grd_613_Gardist;
	//nr				= 71;
	condition		= DIA_Seven_CanYouTeachMe_Condition;
	information		= DIA_Seven_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Seven_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Seven_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Seven_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Seven_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Seven_CanYouTeachMe_12_02"); //Poka�� Ci, co mo�na zrobi� z kusz�.
	
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Si�demka poprawi moje umiejetno�ci strzelania z kuszy.");
	
};