// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Drunk_Exit (C_INFO)
{
	npc			= RBL_2608_BeerDrinker;
	nr			= 999;
	condition	= DIA_Drunk_Exit_Condition;
	information	= DIA_Drunk_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Drunk_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Drunk_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Drunk_Hello (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 1;
	condition		= DIA_Drunk_Hello_Condition;
	information		= DIA_Drunk_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wcze�nie zacz��e�."; 
};

FUNC INT DIA_Drunk_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Drunk_Hello_Info()
{
	AI_Output (other, self, "DIA_Drunk_Hello_15_01"); //Wcze�nie zacz��e�.
	AI_Output (self, other, "DIA_Drunk_Hello_11_02"); //M�j drogi, dzie� na trze�wo to dzie� stracony... hik.
	
   B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Drunk_Lazur (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 2;
	condition		= DIA_Drunk_Lazur_Condition;
	information		= DIA_Drunk_Lazur_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrzebuj� specjalnego trunku."; 
};

FUNC INT DIA_Drunk_Lazur_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_Trol))&&(Npc_KnowsInfo (hero, DIA_Drunk_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_Lazur_Info()
{
	AI_Output (other, self, "DIA_Drunk_Lazur_15_01"); //Potrzebuj� specjalnego trunku.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_02"); //M�j drogi, wszystkie trunki s� specjalne i niepowtarzalne.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_03"); //Nie znajdziesz napitk�w o tym samym aromacie, o tym samym bukiecie. Nawet wytrawione, znaczy wytrawne gard�o nie jest w stanie...
	AI_Output (other, self, "DIA_Drunk_Lazur_15_04"); //To fascynuj�ce, ale szukam lazurowego trzmiela. I jest to jedyny pow�d, dla kt�rego odwiedzi�em obozowego ochleja.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_05"); //Teraz to urazi�e� mnie do �ywego... hik.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_06"); //Nawet gdybym mia� w mojej skrzyni trzmiela, to i tak bym go nie odda� nikomu! Rozumiesz? NIKOMU!
	AI_Output (other, self, "DIA_Drunk_Lazur_15_07"); //Sko�czmy z t� fars�, dobrze zap�ac�.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_08"); //Nie ka�dego i nie wszystko mo�na kupi�, piracie.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_09"); //I nie zbli�aj si� do mojego kufra... hik!
	
   B_LogEntry		(CH2_Rbl_Lazur, "Rozmowa z Opojem nic mi nie da�a. Stary pijak zarzeka� si�, �e w jego skrzyni na pewno nie ma lazurowego trzmiela, wi�c to powinno by� pierwsze miejsce, kt�re musz� sprawdzi�.");
};

// **************************************************

INSTANCE DIA_Drunk_Innos (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 3;
	condition		= DIA_Drunk_Innos_Condition;
	information		= DIA_Drunk_Innos_Info;
	permanent		= 0;
	important		= 0;
	description		= "Szukam wody �wi�conej."; 
};

FUNC INT DIA_Drunk_Innos_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_SearchAgain))
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_Innos_Info()
{
	AI_Output (other, self, "DIA_Drunk_Innos_15_01"); //Szukam wody �wi�conej.
	AI_Output (self, other, "DIA_Drunk_Innos_11_02"); //Nie mam �adnej wody...
	AI_Output (self, other, "DIA_Drunk_Innos_11_03"); //Znaczy nie w czystej postaci... hik.
	AI_Output (other, self, "DIA_Drunk_Innos_15_04"); //A w jakiej postaci?
	AI_Output (self, other, "DIA_Drunk_Innos_11_05"); //Zrobi�em z tego przedni samogon, he, he.
	AI_Output (other, self, "DIA_Drunk_Innos_15_06"); //Zrobi�e� bimber z wody �wi�conej?!
	AI_Output (self, other, "DIA_Drunk_Innos_11_07"); //A co, nie wolno mi? Cz�owieku jakiego to ma kopa... hik.
	AI_Output (other, self, "DIA_Drunk_Innos_15_08"); //Niewa�ne, ile chcesz za ten �wi�cony... samogon?
	AI_Output (self, other, "DIA_Drunk_Innos_11_09"); //Hmm, niech no pomy�l�... Z 500 bry�ek co najmniej. Albo nawet 300... hik.
	AI_Output (other, self, "DIA_Drunk_Innos_15_10"); //Dobra, to dam Ci 100.
	AI_Output (self, other, "DIA_Drunk_Innos_11_11"); //Niech b�dzie.
	
   B_LogEntry		(CH2_RBL_MysteryBook, "Piwosz zrobi� z wody �wi�conej bimber, sprzeda mi go za 100 bry�ek.");
};

// **************************************************

INSTANCE DIA_Drunk_InnosSell (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 4;
	condition		= DIA_Drunk_InnosSell_Condition;
	information		= DIA_Drunk_InnosSell_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kupi� ten �wi�cony bimber."; 
};

FUNC INT DIA_Drunk_InnosSell_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Drunk_Innos))&&(NPC_HasItems(other,ItMiNugget)>=100)
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_InnosSell_Info()
{
	B_GiveXP (250);
	
   AI_Output (other, self, "DIA_Drunk_InnosSell_15_01"); //Kupi� ten �wi�cony bimber.
	AI_Output (self, other, "DIA_Drunk_InnosSell_11_02"); //Prosz� bardzo, niech Ci idzie na zdrowie... hik.
	
   CreateInvItems (self,ItFo_Innos_Booz,1);	
	B_GiveInvItems (self, other, ItFo_Innos_Booz, 1);
   B_GiveInvItems (other, self, ItMiNugget, 100);
	
   AI_Output (self, other, "DIA_Drunk_InnosSell_11_03"); //Tylko nie siadaj za blisko ogniska, strasznie si� po nim pierdzi... hik
	
   B_LogEntry		(CH2_RBL_MysteryBook, "Mam wod� �wi�con�, a raczej p�dzony na niej bimber - mam nadziej�, �e to wystarczy.");
};

// **************************************************

INSTANCE DIA_Drunk_Herb (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 5;
	condition		= DIA_Drunk_Herb_Condition;
	information		= DIA_Drunk_Herb_Info;
	permanent		= 0;
	important		= 0;
	description		= "S�ysza�em, �e p�dzisz bimber z d�biny?"; 
};

FUNC INT DIA_Drunk_Herb_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Milten_Plantsda))
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_Herb_Info()
{
	AI_Output (other, self, "DIA_Drunk_Herb_15_01"); //S�ysza�em, �e p�dzisz bimber z d�biny?
	AI_Output (self, other, "DIA_Drunk_Herb_11_02"); //Hik... P�dz� bimber z wszystkiego co na drzewo nie ucieka... Hik.
	AI_Output (other, self, "DIA_Drunk_Herb_15_03"); //Potrzebuj� li�cia d�bu. Masz jaki� na sprzeda�?
	AI_Output (self, other, "DIA_Drunk_Herb_11_04"); //Tak si� sk�ada, �e mam, ale zdaje si�, �e wpad�em w ci�g... Hik.
	AI_Output (other, self, "DIA_Drunk_Herb_15_05"); //Co to znaczy?
	AI_Output (self, other, "DIA_Drunk_Herb_11_06"); //Ano to, �e potrzebuj� teraz du�o... paliwa... Hik.
	AI_Output (self, other, "DIA_Drunk_Herb_11_07"); //Przynie� mi 10 ry��wek to pogadamy.

	B_LogEntry		(CH2_RBL_Plants, "Piwosz sprzeda mi li�� d�bu za 10 ry��wek. Nie ma to jak barter...");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Drunk_Herb1 (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 6;
	condition		= DIA_Drunk_Herb1_Condition;
	information		= DIA_Drunk_Herb1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam ry��wk�."; 
};

FUNC INT DIA_Drunk_Herb1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Drunk_Herb))&&(NPC_HasItems(other,ItFoBooze)>=10)
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_Herb1_Info()
{
	B_GiveXP (250);
   
	AI_Output (other, self, "DIA_Drunk_Herb1_15_01"); //Mam ry��wk�.
	AI_Output (self, other, "DIA_Drunk_Herb1_11_02"); //Hik... Jak� ry��wk�?
	AI_Output (other, self, "DIA_Drunk_Herb1_15_03"); //Ry��wka za li�� d�bu - pami�tasz?
	AI_Output (self, other, "DIA_Drunk_Herb1_11_04"); //Jaki li�� d�bu? Chyba nie ten, kt�rym podtar�em si� dzisiaj w krzakach... Hik.
	
   AI_DrawWeapon (other);
	
   AI_Output (other, self, "DIA_Drunk_Herb1_15_05"); //Niech Ci� szlag! Dawaj ten cholerny li��, albo utn� Ci ten zakuty �eb!
	AI_Output (self, other, "DIA_Drunk_Herb1_11_06"); //Spokojnie... Hik. M�wisz, li�� d�bu?
	AI_Output (self, other, "DIA_Drunk_Herb1_11_07"); //Chyba jeszcze jaki� mi zosta�. Chowam je w spodniach, �eby mie� je zawsze przy sobie. Tak w razie czego...
	AI_Output (self, other, "DIA_Drunk_Herb1_11_08"); //Wiesz, nigdy nie wiadomo, kiedy mnie pogoni... Hik.
	AI_Output (self, other, "DIA_Drunk_Herb1_11_09"); //O mam! Bierz li��, tylko uwa�aj, zdaje si�, �e troszk� si� upa�ka�...
	AI_Output (other, self, "DIA_Drunk_Herb1_15_10"); //Ale to �mierdzi! Bierz ry��wk� i zejd� mi z oczu moczymordo!
	
   AI_RemoveWeapon (other);
	CreateInvItems (self, ItFo_Plants_OrcHerb_02, 1);
	B_GiveInvItems (self, other, ItFo_Plants_OrcHerb_02, 1);
	B_GiveInvItems (other, self, ItFoBooze, 10);
	B_LogEntry		(CH2_RBL_Plants, "Mam li�� d�bu od Piwosza - chyba powinienem go porz�dnie wyp�uka�.");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_RBL_2608_BeerDrinker_Stew (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 12;
	condition		= DIA_RBL_2608_BeerDrinker_Stew_Condition;
	information		= DIA_RBL_2608_BeerDrinker_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam gulasz."; 
};

FUNC INT DIA_RBL_2608_BeerDrinker_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2608_BeerDrinker_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_RBL_2608_BeerDrinker_Stew_15_01"); //Mam gulasz.
	AI_Output (self, other, "DIA_RBL_2608_BeerDrinker_Stew_11_02"); //Hik... I co z tego?
	AI_Output (other, self, "DIA_RBL_2608_BeerDrinker_Stew_15_03"); //To porcja dla ciebie.
	AI_Output (self, other, "DIA_RBL_2608_BeerDrinker_Stew_11_04"); //Nie jestem a� tak pijany, �eby to zje��... Hik.
	AI_Output (other, self, "DIA_RBL_2608_BeerDrinker_Stew_15_05"); //Bierz, albo wepchn� Ci to w gard�o!
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Piwosza do zabrania gulaszu przekona�y dopiero moje gro�by."); 
};

// **************************************************

INSTANCE DIA_Drunk_SpecialBooz (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 7;
	condition		= DIA_Drunk_SpecialBooz_Condition;
	information		= DIA_Drunk_SpecialBooz_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrzebuj� czego� na specjaln� okazj�."; 
};

FUNC INT DIA_Drunk_SpecialBooz_Condition()
{
	return Leaf_OCSpy_notpermanent;
};

FUNC VOID DIA_Drunk_SpecialBooz_Info()
{
	B_GiveXP (150);
   
	AI_Output (other, self, "DIA_Drunk_SpecialBooz_15_01"); //Potrzebuj� czego� na specjaln� okazj�.
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_02"); //A co to za okazja?
	AI_Output (other, self, "DIA_Drunk_SpecialBooz_15_03"); //Powiedzmy, �e chc� spi� trolla. 
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_04"); //Hik... To musia�oby by� co� naprawd� mocnego...
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_05"); //Mam co� takiego. To nalewka spirytusowa na bazie starych onuc i sfermentowanego aloesu.
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_06"); //Nigdy tego nie pi�em, ale prze�ar�o ju� dwa korki, wi�c powinno nie�le kopa�.
	AI_Output (other, self, "DIA_Drunk_SpecialBooz_15_07"); //Co za to chcesz?
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_08"); //A do czego potrzebujesz takiej trucizny?
	AI_Output (other, self, "DIA_Drunk_SpecialBooz_15_09"); //Musz� wej�� do Starego Obozu. Mam zamiar upi� stra�nika...
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_10"); //A niech mnie, to Ci dopiero przednia my�l, �e te� sam na to nie wpad�em!
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_11"); //Skoro tak to dam Ci ten specja� za darmo. Tylko trzymaj trunek z dala od sk�ry, bo to cholerstwo jest strasznie �r�ce.
	
   CreateInvItems (self, ItFo_Special_Booz, 1);
	B_GiveInvItems (self, other, ItFo_Special_Booz, 1);
	
   AI_Output (other, self, "DIA_Drunk_SpecialBooz_15_12"); //Dzi�ki. Zapami�tam to.
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_13"); //Wystarczy, �e pokrzy�ujesz plany tego wieprza Gomeza, przyjacielu. Powodzenia. Hik...
	
   B_LogEntry(CH3_RBL_OldCampSpy, "Dosta�em od Piwosza nalewk� spirytusow�, to musi zadzia�a� na stra�nika przy p�nocnej bramie.");
   B_equipment_to_OC();
}; 

INSTANCE DIA_Drunk_Lazur2 (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 2;
	condition		= DIA_Drunk_Lazur2_Condition;
	information		= DIA_Drunk_Lazur2_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Drunk_Lazur2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Drunk_Lazur))&&(NPC_HasItems(other,ItFo_Lazur)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_Lazur2_Info()
{
	AI_Output (self, other, "DIA_Drunk_Lazur2_11_01"); //Kto ci pozwoli� grzeba� w mojej skrzyni?
        
   AI_DrawWeapon (self);
   
	AI_Output (self, other, "DIA_Drunk_Lazur2_11_02"); //Oddawaj mi wszystko, co zabra�e� z�odzieju, zw�aszcza lazurowego trzmiela.
	AI_Output (other, self, "DIA_Drunk_Lazur2_15_03"); //Przykro mi, nie mog� tego zrobi�.
	AI_Output (self, other, "DIA_Drunk_Lazur2_11_04"); //Dosy� tego!... hik, nikt nie b�dzie mnie bezczelnie okrada�, teraz dostaniesz porz�dnie baty... hik!
       
   B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
	
   B_LogEntry		(CH2_Rbl_Lazur, "Piwosz si� wkrzurzy�, gdy zabra�em jego drobiazgi ze skrzyni i mnie zaatakowa�.");
};
