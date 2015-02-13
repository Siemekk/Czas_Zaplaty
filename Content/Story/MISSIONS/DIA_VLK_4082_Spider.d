
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Spider_Exit (C_INFO)
{
	npc			= VLK_4082_Spider;
	nr			= 999;
	condition	= DIA_Spider_Exit_Condition;
	information	= DIA_Spider_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Spider_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Spider_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************
// 					
// **************************************************


INSTANCE DIA_Spider_First (C_INFO)
{
	npc				= VLK_4082_Spider;
	nr				= 1;
	condition		= DIA_Spider_First_Condition;
	information		= DIA_Spider_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Spider_First_Condition()
{

	if (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};


};

FUNC VOID DIA_Spider_First_Info()
{


	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Spider_First_11_01"); //Paj�ki... S�ysz� tupot ich n�ek... Wo�aj� mnie...
	AI_Output (other, self, "DIA_Spider_First_15_02"); //O czym ty gadasz?
	AI_Output (self, other, "DIA_Spider_First_11_03"); //Sie�... Zimna i wilgotna... Wysysa �ycie i krew... Paj�ki s� wsz�dzie!
	AI_Output (other, self, "DIA_Spider_First_15_04"); //Cholerny �wir!
	B_StopProcessInfos	(self );
};



// **************************************************


INSTANCE DIA_Spider_Escape (C_INFO)
{
	npc				= VLK_4082_Spider;
	nr				= 2;
	condition		= DIA_Spider_Escape_Condition;
	information		= DIA_Spider_Escape_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno wiesz co� o wyj�ciu?"; 
};

FUNC INT DIA_Spider_Escape_Condition()
{

	if (Npc_KnowsInfo (hero, DIA_Krzywy_First))
	{
		return 1;
	};


};

FUNC VOID DIA_Spider_Escape_Info()
{
	AI_Output (other, self, "DIA_Spider_Escape_15_00"); //Podobno wiesz co� o wyj�ciu?
	AI_Output (self, other, "DIA_Spider_Escape_11_01"); //Tylko paj�ki znaj� prawd�! Ich zapytaj...
	AI_Output (other, self, "DIA_Spider_Escape_15_02"); //Jakie paj�ki?
	AI_Output (self, other, "DIA_Spider_Escape_11_03"); //Te, kt�re chodz� po wodzie.

	Info_ClearChoices (DIA_Spider_Escape);
	Info_AddChoice (DIA_Spider_Escape, "Jak mam zapyta�... paj�ka?", DIA_Spider_Escape_Ask);
	Info_AddChoice (DIA_Spider_Escape, "Gdzie jest to wyj�cie?", DIA_Spider_Where);
	Info_AddChoice (DIA_Spider_Escape, "Zwariowa�e�?", DIA_Spider_Mad);
	Info_AddChoice (DIA_Spider_Escape, "M�w, albo zginiesz!", DIA_Spider_Die);
};

// --------------------------ask----------------------------------------

FUNC VOID DIA_Spider_Escape_Ask()
{
	AI_Output (other, self, "DIA_Spider_Escape_Ask_15_01"); //Jak mam zapyta�... paj�ka?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_11_02"); //One wiedz� wszystko!
	AI_Output (other, self, "DIA_Spider_Escape_Ask_15_03"); //Ale jak pyta�?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_11_04"); //Patrz i obserwuj! Paj�ki powiedz� Ci prawd�. Poka�� Ci j�...
	Info_ClearChoices (DIA_Spider_Escape);
	Info_AddChoice (DIA_Spider_Escape, "Jak zada� to pieprzone pytanie?!", DIA_Spider_Escape_Ask_How);
	Info_AddChoice (DIA_Spider_Escape, "Zwariowa�e�?", DIA_Spider_Mad);
	Info_AddChoice (DIA_Spider_Escape, "M�w, albo zginiesz!", DIA_Spider_Die);
};


// -------------------------mad----------------------------------------

FUNC VOID DIA_Spider_Mad()
{
	AI_Output (other, self, "DIA_Spider_Mad_15_01"); //Zwariowa�e�?
	AI_Output (self, other, "DIA_Spider_Mad_11_02"); //Tylko paj�ki znaj� prawd�... Tylko one...
	//Info_ClearChoices (DIA_Spider_Escape);
};


// -------------------------die----------------------------------------

FUNC VOID DIA_Spider_Die()
{
	AI_Output (other, self, "DIA_Spider_Die_15_01"); //M�w, albo zginiesz!
	AI_Output (self, other, "DIA_Spider_Die_11_02"); //Zapytaj paj�k�w... Mo�e zdradz� Ci prawd�...
	//Info_ClearChoices (DIA_Spider_Escape);
};


// -------------------------where----------------------------------------

FUNC VOID DIA_Spider_Where()
{
	AI_Output (other, self, "DIA_Spider_Where_15_01"); //Gdzie jest to wyj�cie?
	AI_Output (self, other, "DIA_Spider_Where_11_02"); //Tam gdzie woda... Obserwuj paj�ki... Podziwiaj ich taniec...
	B_LogEntry		(CH2_NON_Deep, "Woda? Paj�ki? Ten Paj�k to prawdziwy �wir!");
	//Info_ClearChoices (DIA_Spider_Escape);
};

// -----------------------------------------------------------------

FUNC VOID DIA_Spider_Escape_Ask_How()
{
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_01"); //Jak zada� to pieprzone pytanie?!
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_02"); //Cholera, ale� Ty uparty!
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_03"); //To ty nie jeste� �wirem?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_04"); //Nie jestem idioto! Ale dzi�ki temu nikt nie zmusza mnie do pracy, nie bije i nie pr�buje mnie zje��.
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_05"); //Czego Ty ode mnie chcesz?
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_06"); //Krzywy powiedzia�, �e m�wi�e� co� o wyj�ciu z G��bi. Co wiesz?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_07"); //Niewiele. Ale mam pewne podejrzenia...
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_08"); //M�w do cholery!
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_09"); //Mia�em kiedy� kumpla. M�wili�my na niego Wydra, bo �wietnie p�ywa�.
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_10"); //I co z tego?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_11"); //Kole� upar� si�, �e podwodne tunele musz� prowadzi� na powierzchni�.
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_12"); //Pewnego dnia rozebra� si� do golizny, wzi�� spory wdech i skoczy� do wody.
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_13"); //I?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_14"); //No i tyle go widzieli�my.
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_15"); //Uda�o mu si�?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_16"); //A sk�d mam to wiedzie�? Nigdy nie wr�ci�. Ale kto wie...
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_17"); //Hmm... Mo�e ten tunel jednak prowadzi ku wolno�ci...
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_18"); //By� mo�e. A teraz daj mi poudawa� �wira w spokoju...
	B_LogEntry		(CH2_NON_Deep, "Paj�k nie jest jednak �wirem, ale �wietnie go udaje. Powiedzia� mi co� ciekawego. Podobno kiedy� jeden ze skaza�c�w skoczy� do wody, by� pewien, �e podwodny tunel prowadzi na zewn�trz. Jedynym sposobem, �eby to sprawdzi� jest p�j�� w jego �lady...");
	Info_ClearChoices (DIA_Spider_Escape);
	B_StopProcessInfos	(self );
}; 

// **************************************************

INSTANCE DIA_Spider_Escape2 (C_INFO)
{
	npc				= VLK_4082_Spider;
	nr				= 2;
	condition		= DIA_Spider_Escape2_Condition;
	information		= DIA_Spider_Escape2_Info;
	permanent		= 0;
	important		= 0;
	description		= "O co chodzi z tymi paj�kami?"; 
};

FUNC INT DIA_Spider_Escape2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Spider_Escape))
	{
		return 1;
	};
};

FUNC VOID DIA_Spider_Escape2_Info()
{
	AI_Output (other, self, "DIA_Spider_Escape2_15_01"); //O co chodzi z tymi paj�kami?
	AI_Output (self, other, "DIA_Spider_Escape2_11_02"); //A jak my�lisz?
	AI_Output (self, other, "DIA_Spider_Escape2_11_03"); //Nikt nie zapuszcza si� g��biej w tunele, bo tam a� si� roi od tych skurwieli.		
	AI_Output (other, self, "DIA_Spider_Escape2_15_04"); //Mo�e tam jest wyj�cie?
	AI_Output (self, other, "DIA_Spider_Escape2_11_05"); //W�tpi�, �eby kto� tam wszed� i po�y� wystarczaj�co d�ugo, aby o tym opowiedzie�.
	AI_Output (self, other, "DIA_Spider_Escape2_11_06"); //Ale mo�esz spr�bowa�, zostanie wi�cej szczur�w dla nas.
	AI_Output (other, self, "DIA_Spider_Escape2_15_07"); //Dlaczego?
	AI_Output (self, other, "DIA_Spider_Escape2_11_08"); //Bo umarli nie musz� je��.
	AI_Output (other, self, "DIA_Spider_Escape2_15_09"); //Ale� ty zabawny.
	AI_Output (self, other, "DIA_Spider_Escape2_11_10"); //Jak nie chcesz mnie zabi�, to zejd� mi z oczu. Mam sporo do przemy�lenia...
};