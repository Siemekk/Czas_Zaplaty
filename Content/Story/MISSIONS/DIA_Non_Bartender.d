
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Bartender_EXIT(C_INFO)
{
	npc			= Grd_657_Gardist;
	nr			= 999;
	condition			= Info_Bartender_EXIT_Condition;
	information			= Info_Bartender_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Bartender_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bartender_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Bartender_Hello (C_INFO)
{
	npc		= Grd_657_Gardist;
	nr			= 1;
	condition		= Info_Bartender_Hello_Condition;
	information		= Info_Bartender_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Czym si� zajmujesz?";
};                       

FUNC INT Info_Bartender_Hello_Condition()
{	


	return 1;


};
FUNC VOID Info_Bartender_Hello_Info()
{	

	AI_Output (other, self,"Info_Bartender_Hello_15_00"); //Czym si� zajmujesz?
	AI_Output (self, other,"Info_Bartender_Hello_06_01"); //Sprzedaj� najlepsz� ry��wk� w tej zapad�ej dziurze.

};




// ************************************************************

INSTANCE Info_Bartender_Again (C_INFO)
{
	npc			= Grd_657_Gardist;
	nr			= 2;
	condition		= Info_Bartender_Again_Condition;
	information		= Info_Bartender_Again_Info;
	important		= 0;
	permanent		= 1;
	description 		= "Przep�uka�bym gard�o.";
	trade 			= 1;
};                       

FUNC INT Info_Bartender_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Bartender_Hello))
	{
		return 1;
	};

};
FUNC VOID Info_Bartender_Again_Info()
{	
	AI_Output (other, self,"Info_Bartender_Again_15_01"); //Przep�uka�bym gard�o.
	AI_Output (self, other,"Info_Bartender_Again_06_02"); //Je�eli tylko masz rud�...
};



// ************************************************************

INSTANCE Info_Bartender_Stigma (C_INFO)
{
	npc			= Grd_657_Gardist;
	nr			= 3;
	condition		= Info_Bartender_Stigma_Condition;
	information		= Info_Bartender_Stigma_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Dobrze zna�e� Znami�?";

};                       

FUNC INT Info_Bartender_Stigma_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Bartender_Hello))&&(Npc_KnowsInfo (hero, Info_Nia_Def1))
	{
		return 1;
	};

};
FUNC VOID Info_Bartender_Stigma_Info()
{	
	AI_Output (other, self,"Info_Bartender_Stigma_15_01"); //Dobrze zna�e� Znami�?
	AI_Output (self, other,"Info_Bartender_Stigma_06_02"); //Przychodzi� czasem utopi� smutki.
	AI_Output (other, self,"Info_Bartender_Stigma_15_03"); //Przed, czy po tym jak straci� j�zyk?
	AI_Output (self, other,"Info_Bartender_Stigma_06_04"); //Przed i po. Zdecydowanie cz�ciej pi� jak m�g� mieli� ozorem.
	AI_Output (other, self,"Info_Bartender_Stigma_15_05"); //M�wi� co� ciekawego?
	AI_Output (self, other,"Info_Bartender_Stigma_06_06"); //Mo�e i m�wi�. A co Ci do tego?
	AI_Output (other, self,"Info_Bartender_Stigma_15_07"); //Ile?
	AI_Output (self, other,"Info_Bartender_Stigma_06_08"); //Pos�uchaj. Nikt w Gnie�dzie nie zadziera z Krisem. 
	AI_Output (other, self,"Info_Bartender_Stigma_15_09"); //Pytam, ile? Ka�dy ma swoj� cen�, karczmarzu.
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Bartender_Stigma_06_10"); //200 bry�ek, wr�� jak si� zdecydujesz.


};


// ************************************************************

INSTANCE Info_Bartender_Stigma1 (C_INFO)
{
	npc			= Grd_657_Gardist;
	nr			= 4;
	condition		= Info_Bartender_Stigma1_Condition;
	information		= Info_Bartender_Stigma1_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Mam 200 bry�ek.";

};                       

FUNC INT Info_Bartender_Stigma1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Bartender_Stigma))&&(NPC_HasItems(other,ItMiNugget)>=200)
	{
		return 1;
	};

};
FUNC VOID Info_Bartender_Stigma1_Info()
{	
	investigation = investigation + 1;
	B_GiveInvItems (other, self, ItMiNugget, 200);
	AI_Output (other, self,"Info_Bartender_Stigma1_15_01"); //Mam 200 bry�ek.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_02"); //Ciszej, idioto!
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Bartender_Stigma1_06_03"); //Dawaj rud�, tylko powoli. Nie chc� zwraca� na siebie uwag�.
	AI_Output (other, self,"Info_Bartender_Stigma1_15_04"); //M�w, bo mo�e si� okaza�, �e Kris wcale nie jest najwredniejszym typem w tej cholernej dziurze.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_05"); //Dobra, ju� dobra. Powiem co wiem, a Ty dasz mi spok�j.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_06"); //I jakby co to ode mnie tego nie s�ysza�e�.
	AI_PlayAni (other,"T_YES");
	AI_Output (self, other,"Info_Bartender_Stigma1_06_07"); //Kiedy� Znami� wypi� wi�cej ni� powinien i zacz�� be�kota�.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_08"); //Na szcz�cie nikt tego nie s�ysza�, pr�cz mnie.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_09"); //Znami� m�wi�, �e Nia to wredna suka. �e pod t� niewinn� mink� kryje si� prawdziwy potw�r.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_10"); //Powiedzia�, �e nawet Gomez si� jej przerazi� i odda� dziwk� Krukowi.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_11"); //M�wi si�, �e w nocy dorwa�a kumpla Arto w ��ku i od tamtej chwili osobisty przydupas Gomeza nosi przydomek Blizna.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_12"); //Kruk nie mia� na ni� czasu. Ale wpad�a w oko Hrabiemu.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_13"); //Ale jego teraz nie ma, a dziewczyna si� nudzi.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_14"); //Mo�e to tylko dziwny zbieg okoliczno�ci, ale ludzie zacz�li gin�� kiedy Hrabia opu�ci� Gniazdo.
	AI_Output (other, self,"Info_Bartender_Stigma1_15_15"); //Sugerujesz, �e to Nia zabija? To niedorzeczne...
	AI_Output (self, other,"Info_Bartender_Stigma1_06_16"); //Nic nie sugeruj�. Zrobisz co uwa�asz z t� wiedz�.
	AI_Output (other, self,"Info_Bartender_Stigma1_15_17"); //Drogo mnie kosztowa�a. Ciekawe ile z tego to prawda?
	AI_Output (self, other,"Info_Bartender_Stigma1_06_18"); //Zapytasz Znami� jak ju� si� z nim spotkasz. 
	AI_Output (self, other,"Info_Bartender_Stigma1_06_19"); //A teraz daj mi spok�j, nie chc�, �eby kto� widzia� jak z Tob� rozmawiam.
	B_LogEntry		(CH4_Non_Eagle, "Ta historia z zab�jstwami nabiera rumie�c�w. Karczmarz opowiedzia� mi ciekaw� histori�. Znami�, zanim straci� j�zyk, by� do�� rozmowny. Twierdzi�, �e Nia to niebezpieczna kobieta, dla kt�rej liczy si� tylko w�adza i ostra zabawa. Ober�ysta zwr�ci� uwag� na to, �e zab�jstwa rozpocz�y si� po tym jak Hrabia opu�ci� Gniazdo. Ciekawe czego jeszcze si� dowiem?");
};



// ************************************************************

INSTANCE Info_Bartender_StigmaMeet (C_INFO)
{
	npc			= Grd_657_Gardist;
	nr			= 4;
	condition		= Info_Bartender_StigmaMeet_Condition;
	information		= Info_Bartender_StigmaMeet_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Mam dla Ciebie propozycj� nie do odrzucenia.";

};                       

FUNC INT Info_Bartender_StigmaMeet_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_Bartender_StigmaMeet_Info()
{	

	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_01"); //Mam dla Ciebie propozycj� nie do odrzucenia.
	AI_Output (self, other,"Info_Bartender_StigmaMeet_06_02"); //Pos�uchaj...
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_03"); //Nie, to Ty pos�uchaj!
	AI_DrawWeapon (self);
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_04"); //Zrobisz co m�wi�, albo wytn� Ci kilka dodatkowych otwor�w.
	AI_Output (self, other,"Info_Bartender_StigmaMeet_06_05"); //Spokojnie, schowaj �elastwo. Dogadamy si�.
	AI_RemoveWeapon (self);
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_06"); //Mam zamiar dowie�� Krisowi, �e to Nia morduje. Pinto jest ze mn�.
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_07"); //Potrzebuj� kilku �wiadk�w, �eby Kris nic nie kombinowa�.
	AI_Output (self, other,"Info_Bartender_StigmaMeet_06_08"); //Wiem, �e b�d� tego �a�owa�, ale niech b�dzie.
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_09"); //Zobaczymy si� po zmroku. Ukryj si� w cieniu.
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_10"); //Tylko nie zapomnij. Bo w przeciwnym razie wr�c� i sprawi�, �e b�dziesz b�aga� o szybk� �mier�.
	AI_Output (self, other,"Info_Bartender_StigmaMeet_06_11"); //Nie musisz mi grozi�. Da�em s�owo, a teraz zje�d�aj.
	B_LogEntry		(CH4_Non_Eagle, "Karczmarz mi pomo�e.");

}; 
