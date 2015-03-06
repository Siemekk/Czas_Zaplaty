
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Ash_EXIT(C_INFO)
{
	npc			= Grd_617_Gardist;
	nr			= 999;
	condition			= Info_Ash_EXIT_Condition;
	information			= Info_Ash_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Ash_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Ash_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Ash_Hello (C_INFO)
{
	npc		= Grd_617_Gardist;
	nr			= 1;
	condition		= Info_Ash_Hello_Condition;
	information		= Info_Ash_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Co robisz?";
};                       

FUNC INT Info_Ash_Hello_Condition()
{	


	return 1;


};
FUNC VOID Info_Ash_Hello_Info()
{	
	AI_Output (other, self,"Info_Ash_Hello_15_00"); //Co robisz?
	AI_Output (self, other,"Info_Ash_Hello_06_01"); //Gotuj�, idioto.
};




// ************************************************************

INSTANCE Info_Ash_Again (C_INFO)
{
	npc			= Grd_617_Gardist;
	nr			= 2;
	condition		= Info_Ash_Again_Condition;
	information		= Info_Ash_Again_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Wiesz kto to Znami�?";
};                       

FUNC INT Info_Ash_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Ash_Hello))&&(Npc_KnowsInfo (hero, Info_Nia_Def1)) 
	{
		return 1;
	};

};
FUNC VOID Info_Ash_Again_Info()
{	
	investigation = investigation + 1;
	AI_Output (other, self,"Info_Ash_Again_15_01"); //Wiesz kto to Znami�?
	AI_Output (self, other,"Info_Ash_Again_06_02"); //To ten idiota, kt�rego zabi� Georg. A co Ci do tego?
	AI_Output (other, self,"Info_Ash_Again_15_03"); //Nie wydaje Ci si� dziwne, �e niemowa rzuci� si� na Ni� nie zwa�aj�c na Georga?
	AI_Output (self, other,"Info_Ash_Again_06_04"); //Mia� nie po kolei w g�owie, co w tym dziwnego? 
	AI_Output (self, other,"Info_Ash_Again_06_05"); //Jedni si� wieszaj�, inni skacz� z mur�w na g�ow�, a jeszcze inni rzucaj� si� na zabijak�w jak Georg.
	AI_Output (self, other,"Info_Ash_Again_06_06"); //Chcia� umrze� i tyle.
	AI_Output (other, self,"Info_Ash_Again_15_07"); //Wygl�da� jakby...
	AI_Output (self, other,"Info_Ash_Again_06_08"); //Pos�uchaj. G�wno mnie obchodzi jak wygl�da� Znami� i dlaczego da� si� pochlasta�.
	AI_Output (self, other,"Info_Ash_Again_06_09"); //W Gnie�dzie s�uchasz Hrabiego i Krisa, albo Ci� nie ma.
	AI_Output (self, other,"Info_Ash_Again_06_10"); //Czy teraz wyrazi�em si� jasno?
	AI_Output (other, self,"Info_Ash_Again_15_11"); //Ale co to ma wsp�lnego ze �mierci� niemowy?
	AI_Output (self, other,"Info_Ash_Again_06_12"); //A jak my�lisz kto mu uchlasta� ozor?
	AI_Output (other, self,"Info_Ash_Again_15_13"); //Kris...
	AI_Output (self, other,"Info_Ash_Again_06_14"); //Znami� za bardzo nim mieli�. Zbyt g�o�no m�wi�, �e Nia to dziwka, kt�ra daje dupy ka�demu kto ma w�adz�.
	AI_Output (self, other,"Info_Ash_Again_06_15"); //Ale to nie moja sprawa i dobrze Ci radz�, �eby� za du�o nie niucha�.
	AI_PlayAni(other,"T_YES");
	B_LogEntry		(CH4_Non_Eagle, "�mier� niemowy da�a mi troch� do my�lenia. Kucharz Ash powiedzia� co� ciekawego. Znami� straci� j�zyk, bo za g�o�no krytykowa� Ni� i to z kim sypia. Kris to bezwzgl�dny cz�owiek, a przede wszystkim zaufany Hrabiego, musz� na niego uwa�a�.");
};



// ************************************************************

INSTANCE Info_Ash_Again1 (C_INFO)
{
	npc			= Grd_617_Gardist;
	nr			= 2;
	condition		= Info_Ash_Again1_Condition;
	information		= Info_Ash_Again1_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Mam do Ciebie pro�b�.";
};                       

FUNC INT Info_Ash_Again1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_Ash_Again1_Info()
{	
	AI_Output (other, self,"Info_Ash_Again1_15_01"); //Mam do Ciebie pro�b�.
	AI_Output (self, other,"Info_Ash_Again1_06_02"); //Jak�, ch�optasiu?
	AI_Output (other, self,"Info_Ash_Again1_15_03"); //Spotkam si� z Ni�, Pinto ukryje si� w cieniu. 
	AI_Output (other, self,"Info_Ash_Again1_15_04"); //Potrzebuj� jeszcze kilku �wiadk�w, �eby Kris nie mia� wyboru.
	AI_Output (other, self,"Info_Ash_Again1_15_05"); //Musimy pozby� si� tej krwio�erczej dziwki!
	AI_Output (self, other,"Info_Ash_Again1_06_06"); //Na mnie nie licz. Nie mam zamiaru zadziera� z Krisem.
	AI_Output (self, other,"Info_Ash_Again1_06_07"); //Poza tym m�sko-kobiece igraszki budz� we mnie odraz�!
	AI_Output (self, other,"Info_Ash_Again1_06_08"); //Nie ma to jak dwa umi�nione cia�a, ow�osione torsy splecione w...
	AI_Output (other, self,"Info_Ash_Again1_15_09"); //Ekhm. Chyba ju� sobie p�jd�, bywaj.
	B_LogEntry		(CH4_Non_Eagle, "Na Asha nie mog� liczy�. I w og�le lepiej si� do niego nie odwraca� ty�em.");

}; 
