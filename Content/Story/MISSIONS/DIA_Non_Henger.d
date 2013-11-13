
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Henger_EXIT(C_INFO)
{
	npc			= Grd_615_Gardist;
	nr			= 999;
	condition			= Info_Henger_EXIT_Condition;
	information			= Info_Henger_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Henger_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Henger_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Henger_Hello (C_INFO)
{
	npc		= Grd_615_Gardist;
	nr			= 1;
	condition		= Info_Henger_Hello_Condition;
	information		= Info_Henger_Hello_Info;
	important		=1;
	permanent		= 1;
	description 	= "";
};                       

FUNC INT Info_Henger_Hello_Condition()
{	
	/***************************
Ma dzia�a� tak, �e po ostatniej gadce z Krisem Wisielec ju� przepuszcza.

***************************/

	if (Npc_KnowsInfo (hero, Info_Henger_Again))&&(Npc_GetDistToNpc(self,hero) < 200)&&(!Npc_KnowsInfo (hero, Info_Kris_Fin))
	{
		return 1;
	};
};
FUNC VOID Info_Henger_Hello_Info()
{	
	B_FullStop (hero);
	AI_Output (self, other,"Info_Henger_Hello_06_01"); //Nie wyjdziesz, dop�ki Kris na to nie pozwoli.
	B_StopProcessInfos	(self);
	AI_GotoWP		(other, "KRIS_WAIT");
};


// ************************************************************

INSTANCE Info_Henger_Hello1 (C_INFO)
{
	npc		= Grd_615_Gardist;
	nr			= 1;
	condition		= Info_Henger_Hello1_Condition;
	information		= Info_Henger_Hello1_Info;
	important		=0;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Henger_Hello1_Condition()
{	

	if (Npc_GetDistToNpc(self,hero) < 200)&&(Npc_KnowsInfo (hero, Info_Kris_Fin))
	{
		return 1;
	};

};
FUNC VOID Info_Henger_Hello1_Info()
{	
	B_FullStop (hero);
	AI_Output (self, other,"Info_Henger_Hello_06_01"); //Mia�em do Ciebie nosa. W ko�cu b�d� spokojnie spa� w nocy.
	AI_Output (self, other,"Info_Henger_Hello_06_02"); //Dobrze wiedzie�, �e zab�jca ju� gryzie ziemi�.
	AI_Output (other, self,"Info_Henger_Again_15_03"); //Czasem �atwo pomyli� odbicie gwiazd w tafli wody z prawdziwym niebem.
	AI_Output (self, other,"Info_Henger_Hello_06_04"); //Co tam mamroczesz?
	AI_Output (other, self,"Info_Henger_Again_15_05"); //Nic takiego. Bywaj.

	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"START");	
};



// ************************************************************

INSTANCE Info_Henger_Again (C_INFO)
{
	npc			= Grd_615_Gardist;
	nr			= 2;
	condition		= Info_Henger_Again_Condition;
	information		= Info_Henger_Again_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Henger_Again_Condition()
{	

	if  (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};

};
FUNC VOID Info_Henger_Again_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
	AI_Output (self, other,"Info_Henger_Again_06_01"); //Hej, Ty! Podejd� no tu z �aski swojej.
	AI_GotoNpc(other,self);
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Henger_Again_06_02"); //Morda paskudna, ale bez szramy. Czego tu szukasz?
	AI_Output (other, self,"Info_Henger_Again_15_03"); //Dawno nikomu pyska nie obi�em. Co Ty na to?
	AI_Output (self, other,"Info_Henger_Again_06_04"); //Spokojnie. Mi nie do bitki si� spieszy. 
	AI_Output (self, other,"Info_Henger_Again_06_05"); //Mamy tu pewne... problemy. Dlatego nie wpuszczam do Orlego Gniazda pierwszego lepszego �achmyty.
	AI_Output (other, self,"Info_Henger_Again_15_06"); //Dzi�ki, wiesz jak przypodoba� si� ludziom.
	AI_Output (self, other,"Info_Henger_Again_06_07"); //Racja, dyplomata ze mnie �aden. Nie bierz tego do siebie. To przez t� cholern� wart�.
	AI_Output (other, self,"Info_Henger_Again_15_08"); //Czego pilnujesz? Nie wpuszczasz do twierdzy obcych?
	AI_Output (self, other,"Info_Henger_Again_06_09"); //Raczej nie wypuszczam nikogo poza mury. Mamy tu spory bajzel...
	AI_Output (self, other,"Info_Henger_Again_06_10"); //W�a� do �rodka i pogadaj z Krisem. Ale pami�taj, �e bez jego zgody nie opu�cisz Gniazda.
	AI_Output (other, self,"Info_Henger_Again_15_11"); //Niech b�dzie. 
	AI_Output (self, other,"Info_Henger_Again_06_12"); //Co� czuj�, �e b�dziesz tego �a�owa�. Krisa znajdziesz w pobli�u bramy.


	Log_CreateTopic	(CH4_Non_Eagle, LOG_MISSION);
	Log_SetTopicStatus	(CH4_Non_Eagle, LOG_RUNNING);
	B_LogEntry		(CH4_Non_Eagle, "Orle Gniazdo. Stra�nik - Wisielec - twierdzi, �e maj� jaki� problem. I o dziwo nikogo nie wypuszczaj� na zewn�trz. Ciekawe co si� tu �wi�ci? Jak ju� b�d� w �rodku mam porozmawia� z jakim� Krisem.");


	/*******************
Ork, Dick ma podej�� do Krisa, kt�ry czeka gdzie� niedaleko bramy. W sumie idealnie jakby Kris z kim� rozmawia�. Po gadce z Krisem, Wisielec ju� nie wypu�ci Dicka z Gniazda.
Dopiero po rozwi�zaniu zagadnki Dick b�dzie m�g� wyj��. Takie ma�e utrudnienie dla graczy co te� powinno zaplusowa� z klimatem questa ;)

*************************/

	B_StopProcessInfos	(self);
	AI_GotoWP		(other, "KRIS_WAIT");
}; 
