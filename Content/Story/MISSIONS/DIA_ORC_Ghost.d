//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_OrcGhost_EXIT (C_INFO)
{
	npc			= ORC_GHOST;
	nr			= 999;
	condition	= Info_OrcGhost_EXIT_Condition;
	information	= Info_OrcGhost_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_OrcGhost_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_OrcGhost_EXIT_Info()
{
	B_StopProcessInfos(self);
};

//---------------------------------------------------------------------
instance  Info_OrcGhost_Kill (C_INFO)
{
	npc			= ORC_GHOST;
	condition	= Info_OrcGhost_Kill_Condition;
	information	= Info_OrcGhost_Kill_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcGhost_Kill_Condition()
{	
	if /*(npc_getdisttowp(hero,"OGY_SHAMAN_5")<600)&&*/(Npc_KnowsInfo (hero, DIA_Roderic_OldNote1))
	{
		return 1;
	};
};

FUNC void  Info_OrcGhost_Kill_Info()
{
	AI_GotoWP(self, "OGY_SHAMAN_5");
   
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_01"); //Cuchniesz jak �ywa troll... G�upcem jeste� my�l�c, �e skalasz to miejsce sw� obecno�ci�!
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_02"); //Co� mam pecha do rozgadanych duch�w...
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_03"); //Ka�da cz�owiek to zdradzieckie nasienie Innosa. �yjecie tylko po to, by tapla� si� w k�amstwie i zdradzie...
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_04"); //Nie chc� z Tob� walczy�. Szukam... odpowiedzi.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_05"); //Niewa�ne jest to czego Ty chcesz, ale to o co upominaj� si� duchy mych braci. A one spragnione s� krwi!
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_06"); //Zaczekaj! Na pewno mo�emy si� dogada�. Ty mi co� dasz, a ja dam co� tobie.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_07"); //Hmm, wyczuwam w twym g�osie prawd�. Niech b�dzie - wymiana.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_08"); //M�w czego chcesz.
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_09"); //Musz� wej�� do podziemi Klasztoru Zmiennokszta�tnych. Szukam klucza, kt�ry znajduje si� gdzie� tutaj.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_10"); //Wiem kogo szukasz. Pos�uchaj tej opowie�ci.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_11"); //Rzadko si� zdarza, �e orkowie i ludzie �yj� razem, a jeszcze rzadziej, gdy wzajemnie si� szanuj� i ze sob� nie walcz�.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_12"); //By� kiedy� cz�owiek, taki jak Ty, silny i bezczelny, kt�ry zdoby� szacunek ork�w.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_13"); //By� wspania�ym wojownikiem, walczy� jak demon, zabija� jak w��.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_14"); //Nazwali go Urksh'Est, co w czarnej mowie znaczy Zimny P�omie�. Nigdy nie okazywa� emocji ani lito�ci.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_15"); //Kiedy jeszcze krew p�yn�a w mych �y�ach byli�my przyjaci�mi. Zaufa�em mu, zdradzi�em mu sekrety, kt�re skrz�tnie skrywali�my w czelu�ciach klasztoru.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_16"); //Morra nas zdradzi�, zdradzi� mnie, a ja dla niego zdradzi�em swych braci...
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_17"); //Od tamtego czasu jestem pot�piony...
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_18"); //Znasz ludzkie imi� tego zdrajcy?
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_19"); //Tak, bracia nazywali go Truan.
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_20"); //Jak� mia� odegra� rol� podczas ataku na ludzk� osad�?
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_21"); //Mia� si� pozby� stra�nika, u�pi� go, a wtedy zr�wnali�my osad� z ziemi�.
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_22"); //Po co zaatakowali�cie osad�?
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_23"); //Ludzie stali nam na drodze do reliktu, kt�ry musieli�my zdoby�.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_24"); //Ale Urksh'Est zdradzi� i nas. Pchn�� mnie sztyletem w serce, �eby dosta� si� do ukrytych komnat. Tylko krew szamana otwiera�a drog� do pradawnego artefaktu...
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_25"); //Nie wiem jaki los spotka� go w podziemiach klasztoru, ale nigdy stamt�d nie wyszed�.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_26"); //Wiem tylko, �e duch zdrajcy zosta� uwi�ziony w mroku pomi�dzy �yciem, a �mierci�.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_27"); //Od dawna ju� nikt... 
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_28"); //Wystarczy Morra. Teraz zap�ata.
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_29"); //M�w czego pragniesz orku.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_30"); //Uwolnij mnie od �wiata �miertelnik�w, daj mi wolno�� Morra. Cho� tak zma� przewiny swego brata.
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_31"); //Zrobi� to.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_32"); //Szkoda, �e Urksh'Est nie by� taki jak Ty. W Tobie wyczuwam si�� i prawd�. Twe my�li i s�owa s� jednym...
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_33"); //Stawaj wi�c Morra...
	
   B_LogEntry		(CH3_RBL_RodneyHelp, "W orkowej nekropolii spotka�em ducha orka, kt�ry opowiedzia� mi histori� Urksh'Est - Zimnego P�omienia. Cz�owieka, kt�ry zdoby� zaufanie ork�w, a potem ich zdradzi�. Cz�owieka, kt�ry zdradzi� swych braci, aby posi��� pot�ny artefakt ukryty w podziemiach klasztoru. Imi� jego brzmi Truan.");
	self.guild = GIL_UNDEADORC;

	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget(self,other); 
	//AI_StartState(self,ZS_ATTACK,0,""); 
	
	var c_npc nameless; nameless = Hlp_GetNpc(Nameless_ThirdMeetGYD);
	if(Hlp_IsValidNpc(nameless))
	{
		B_StartAfterDialogFight(nameless,self,true);	
	};	
   
	B_StopProcessInfos(self); 
};
