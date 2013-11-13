// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Luc_Hello (C_INFO)
{
	npc				= STT_340_Lucjusz;
	nr				= 1;
	condition		= DIA_Luc_Hello_Condition;
	information		= DIA_Luc_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Luc_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Luc_Hello_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (self, other, "DIA_Luc_Hello_12_01"); //Co to za przystojniak?!
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Luc_Hello_12_02"); //Ale z ciebie ciacho!
	AI_Output (other, self, "DIA_Luc_Hello_15_03"); //O czym Ty m�wisz?
	AI_Output (self, other, "DIA_Luc_Hello_12_04"); //Nie udawaj, �e nie wiesz. Z takim ty�eczkiem zajdziesz daleko...
	AI_Output (other, self, "DIA_Luc_Hello_15_05"); //Ekhm... Chyba musz� co� za�atwi�. 
	AI_Output (self, other, "DIA_Luc_Hello_12_06"); //Nie uciekaj... Wr�� jeszcze, to doko�czymy konwersacj� w bardziej przytulnym miejscu.
	B_StopProcessInfos(self);
};

// **************************************************

var int luc_draw;

INSTANCE DIA_Luc_Seaman (C_INFO)
{
	npc				= STT_340_Lucjusz;
	nr				= 2;
	condition		= DIA_Luc_Seaman_Condition;
	information		= DIA_Luc_Seaman_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam do Ciebie pro�b�."; 
};

FUNC INT DIA_Luc_Seaman_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Luc_Hello))&&(Npc_KnowsInfo (hero, DIA_Harf_ProposalOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Luc_Seaman_Info()
{
	AI_Output (other, self, "DIA_Luc_Seaman_15_01"); //Mam do Ciebie pro�b�.
	AI_Output (self, other, "DIA_Luc_Seaman_12_02"); //Dla Ciebie wszystko, m�j Ty ogierze!
	AI_Output (other, self, "DIA_Luc_Seaman_15_03"); //(Chyba si� porzygam)
	AI_Output (self, other, "DIA_Luc_Seaman_12_04"); //M�wi�e� co�, pulpeciku?
	AI_Output (other, self, "DIA_Luc_Seaman_15_05"); //Nie, nie! Potrzebuj� rysunku kobiety, na teraz!
	AI_Output (self, other, "DIA_Luc_Seaman_12_06"); //Kobiety? Przesta� sobie nimi zawraca� g�ow�. To pijawki, do tego co druga to dziwka.
	AI_Output (self, other, "DIA_Luc_Seaman_12_07"); //Ja mog� Ci da� to, czego nie da Ci �adna kobieta!
	AI_Output (other, self, "DIA_Luc_Seaman_15_08"); //Nie w�tpi�, ale bardzo zale�y mi na tym rysunku. Najlepiej niech b�dzie akt.
	AI_Output (self, other, "DIA_Luc_Seaman_12_09"); //No dobra, cukiereczku. Zrobi� to dla Ciebie na jutro. Ale b�dziesz musia� mi si� odwdzi�czy�.
	AI_Output (other, self, "DIA_Luc_Seaman_15_10"); //Oczywi�cie. To do jutra...
	
   luc_draw = B_SetDayTolerance()+1;
	B_LogEntry(CH3_Grd_Thief, "Lucjusz przygotuje akt na jutro. Cholera, a� si� boj� my�le�, co on mo�e chcie� w zamian.");
};

// **************************************************

INSTANCE DIA_Luc_Draw (C_INFO)
{
	npc				= STT_340_Lucjusz;
	nr				= 3;
	condition		= DIA_Luc_Draw_Condition;
	information		= DIA_Luc_Draw_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Luc_Draw_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Luc_Seaman))&&(luc_draw <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_Luc_Draw_Info()
{
	AI_Output (self, other, "DIA_Luc_Draw_12_01"); //Gdzie si� podziewa�e�, cukiereczku?
	AI_Output (other, self, "DIA_Luc_Draw_15_02"); //To tu, to tam. Sko�czy�e� rysunek?
	AI_Output (self, other, "DIA_Luc_Draw_12_03"); //Przed chwileczk�. Oto tw�j kobiecy akt.

	CreateInvItems (self,akt,1);
	B_GiveInvItems (self, other, akt, 1);

	B_UseFakeScroll(other);
	AI_Output (other, self, "DIA_Luc_Draw_15_04"); //�wietna robota, wygl�da jak �ywa!
	AI_Output (self, other, "DIA_Luc_Draw_12_05"); //Ciesz� si�, �e Ci si� podoba. Teraz mo�emy wreszcie porozmawia� o wyrazach wdzi�czno�ci...
	AI_Output (other, self, "DIA_Luc_Draw_15_06"); //S�yszysz ten ha�as? Rebelianci atakuj� ob�z!
	AI_Output (self, other, "DIA_Luc_Draw_12_07"); //�wietnie, w ko�cu poznam tych zaro�ni�tych brutali!
	
   B_LogEntry(CH3_Grd_Thief, "Uff, uda�o mi si� uciec. Mam te� kobiecy akt. Czas porozmawia� z Velay�.");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Luc_Miss (C_INFO)
{
	npc				= STT_340_Lucjusz;
	nr				= 4;
	condition		= DIA_Luc_Miss_Condition;
	information		= DIA_Luc_Miss_Info;
	permanent		= 0;
	important		= 0;
	description		= "Musz� ju� i��!"; 
};

FUNC INT DIA_Luc_Miss_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Luc_Draw))
	{
		return 1;
	};
};

FUNC VOID DIA_Luc_Miss_Info()
{
	AI_Output (other, self, "DIA_Luc_Miss_15_00"); //Musz� ju� i��!
	AI_Output (self, other, "DIA_Luc_Miss_12_01"); //Nie t�sknisz za mn�?
	AI_Output (other, self, "DIA_Luc_Miss_15_02"); //Ani troch�!
	AI_Output (self, other, "DIA_Luc_Miss_12_03"); //Niewdzi�czny troglodyta! Id� ju� sobie!
	B_StopProcessInfos(self);
}; 
