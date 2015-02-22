// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grim_Exit (C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 999;
	condition	= DIA_Grim_Exit_Condition;
	information	= DIA_Grim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 				Hello (Schutzgeld)
// **************************************************

INSTANCE DIA_Grim_Hello (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Hello_Condition;
	information		= DIA_Grim_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Co robisz?";
};

FUNC INT DIA_Grim_Hello_Condition()
{	

	return 1;


};

FUNC VOID DIA_Grim_Hello_Info()
{
	AI_Output (other, self,"DIA_Grim_Hello1_15_01"); //Co robisz?
	AI_Output (self, other,"DIA_Grim_Hello1_06_02"); //Kontempluj� uroki obozowego �ycia. 
	AI_Output (self, other,"DIA_Grim_Hello1_06_03"); //Nigdy Ci� tu nie widzia�em.
	AI_Output (other, self,"DIA_Grim_Hello1_15_04"); //Jestem tu od niedawna.
	AI_Output (self, other,"DIA_Grim_Hello1_06_05"); //To ciekawe... Musz� wraca� do swojej roboty.
};

// **************************************************

INSTANCE DIA_Grim_Rebel (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 3;
	condition		= DIA_Grim_Rebel_Condition;
	information		= DIA_Grim_Rebel_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mam dla Ciebie propozycj�.";
};

FUNC INT DIA_Grim_Rebel_Condition()
{	

	if (Npc_KnowsInfo (hero,DIA_Grim_Hello))&&(Npc_KnowsInfo (hero,DIA_Urt_Packages)) 
	{
		return 1;
	};


};

FUNC VOID DIA_Grim_Rebel_Info()
{
	//1500 rudy? iksde
	AI_Output (other, self,"DIA_Grim_Rebel_15_01"); //Mam dla Ciebie propozycj�.
	AI_Output (self, other,"DIA_Grim_Rebel_06_02"); //Pami�taj, �e rozmawiasz z by�ym kopaczem, wi�c uwa�aj na s�owa. Ci�ko pracowa�em na zbroj� stra�nika i nie mam zamiaru znowu trafi� do kopalni.
	AI_Output (other, self,"DIA_Grim_Rebel_15_03"); //Nie jestem stra�nikiem. Jestem jednym z rebeliant�w. Nied�ugo uderzymy na Stary Ob�z i chc� przekona� kopaczy do wsp�lnej walki.
	AI_Output (self, other,"DIA_Grim_Rebel_06_04"); //M�wisz powa�nie? Cz�owieku przecie� to szale�stwo!
	AI_Output (other, self,"DIA_Grim_Rebel_15_05"); //By�e� kiedy� kopaczem, wiesz, jak stra�nicy traktuj� Twych dawnych braci. Pewnie sam nie raz dosta�e� po mordzie.
	AI_Output (other, self,"DIA_Grim_Rebel_15_06"); //Daj� Ci szans�, �eby odp�aci� im tym samym. Co ty na to?
	AI_Output (self, other,"DIA_Grim_Rebel_06_07"); //To spore ryzyko... Sam nie wiem. Poza tym, �eby porozmawia� ze wszystkimi kopaczami musz� przekupi� kilku stra�nik�w.
	AI_Output (other, self,"DIA_Grim_Rebel_15_08"); //Ile potrzebujesz?
	AI_Output (self, other,"DIA_Grim_Rebel_06_09"); //Co najmniej 200... 300 bry�ek powinno wystarczy�.
	AI_Output (other, self,"DIA_Grim_Rebel_15_10"); //Co� mi si� wydaje, �e nie tylko stra�nicy na tym zarobi�.
	AI_Output (self, other,"DIA_Grim_Rebel_06_11"); //Wszystko kosztuje rebeliancie. Chcesz mie� m�j g�os i poparcie, to p�a�.
};

// **************************************************

INSTANCE DIA_Grim_Ore (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 4;
	condition		= DIA_Grim_Ore_Condition;
	information		= DIA_Grim_Ore_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mam rud�.";
};

FUNC INT DIA_Grim_Ore_Condition()
{	

	if (Npc_KnowsInfo (hero,DIA_Grim_Rebel))&& (NPC_HasItems(other,ItMiNugget)>=300)
	{
		return 1;
	};


};

FUNC VOID DIA_Grim_Ore_Info()
{
	B_GiveXP(250);
	buddler_join = buddler_join + 1;
	AI_Output (other, self,"DIA_Grim_Ore_15_01"); //Mam rud�.
	AI_Output (self, other,"DIA_Grim_Ore_06_02"); //To �wietnie. Natychmiast z niej skorzystam.
	B_GiveInvItems (other, self, ItMiNugget, 300);
	AI_Output (self, other,"DIA_Grim_Ore_06_03"); //Masz moje poparcie. Nied�ugo ulice Starego Obozu sp�yn� krwi� stra�nik�w.
	B_LogEntry		(CH3_RBL_Buddler, "Grim b�dzie walczy� przeciwko stra�nikom.");
	B_StopProcessInfos	(self);
}; 
