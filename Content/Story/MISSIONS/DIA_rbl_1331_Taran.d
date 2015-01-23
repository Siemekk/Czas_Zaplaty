// **************************************************
// // 						 EXIT 
// // **************************************************
//trader
// INSTANCE DIA_rbl_1331_baaltaran_Exit (C_INFO)
// {
// 	npc			= rbl_1331_baaltaran;
// 	nr			= 999;
// 	condition	= DIA_rbl_1331_baaltaran_Exit_Condition;
// 	information	= DIA_rbl_1331_baaltaran_Exit_Info;
// 	permanent	= 1;
// 	description = DIALOG_ENDE;
// };                       

// FUNC INT DIA_rbl_1331_baaltaran_Exit_Condition()
// {
// 	return 1;
// };

// FUNC VOID DIA_rbl_1331_baaltaran_Exit_Info()
// {
// 	B_StopProcessInfos	( self );
// };


// **************************************************

INSTANCE DIA_rbl_1331_baaltaran_Stew (C_INFO)
{
	npc				= rbl_1331_baaltaran;
	nr				= 12;
	condition		= DIA_rbl_1331_baaltaran_Stew_Condition;
	information		= DIA_rbl_1331_baaltaran_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie gulasz."; 
};

FUNC INT DIA_rbl_1331_baaltaran_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1331_baaltaran_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Stew_15_01"); //Mam dla Ciebie gulasz.
	AI_Output (self, other, "DIA_rbl_1331_baaltaran_Stew_11_02"); //Mo�e by tym dziadostwem napcha� fajk� wodn�?
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Stew_15_03"); //Nie wiem, czy to dobry pomys�. Ale zrobisz jak uwa�asz.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Taran zabra� gulasz, a� si� boj� co z nim zrobi."); 
};

// **************************************************

var int Taran_300ore;
INSTANCE DIA_rbl_1331_baaltaran_Aloes (C_INFO)
{
	npc				= rbl_1331_baaltaran;
	nr				= 12;
	condition		= DIA_rbl_1331_baaltaran_Aloes_Condition;
	information		= DIA_rbl_1331_baaltaran_Aloes_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrafisz uwarzy� mikstur� z aloesu?"; 
};

FUNC INT DIA_rbl_1331_baaltaran_Aloes_Condition()
{
	if (NPC_HasItems(other,aloes)>=1)&&(aloes_find)
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1331_baaltaran_Aloes_Info()
{
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Aloes_15_01"); //Potrafisz uwarzy� mikstur� z aloesu?
	AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_02"); //Mo�e i potrafi�. A do czego potrzebujesz tej mikstury?
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Aloes_15_03"); //Kto� straci� g�os, a mi zale�y na tym, aby go odzyska�.
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Aloes_15_04"); //Potrafisz przygotowa� mikstur�?
	AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_05"); //Tak, ale to Ci� b�dzie kosztowa�...
	
	// W momencie kiedy zobaczylem tekst o 800 bry�kach mialem 200 w ekwipunku + sam ekwipunek warty nie wiecej niz 100
	// 800 na ten moment to pomimo wszystko stanowczo za du�o. 300 to i tak jest ogromna suma.
	if(taran_gone <= Wld_GetDay())&&(taran_gone!=0)//heh, dobry byl ten warunek sher :D
	{
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_06"); //Hmm, zajmie mi to sporo pracy, do tego kosztowne ingrediencje no i op�ata manipulacyjna...
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_07"); //300 bry�ek!
		B_LogEntry		(CH1_Rbl_Plant, "Taran zgodzi� si� uwarzy� mikstur� z aloesu ale za 300 bry�ek rudy. Jednak czasami warto uwa�a� komu si� podpada."); 
		Taran_300ore = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_08"); //Nie b�d� z ciebie zdziera�.
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_09"); //100 bry�ek za�atwi spraw�.
		B_LogEntry		(CH1_Rbl_Plant, "Taran zgodzi� si� uwarzy� mikstur� z aloesu za 100 bry�ek rudy."); 
	};
};

var int Aloes_Creation;
// **************************************************

func void B_Taran_create_aloes(var int nugget_value)
{
   if (NPC_HasItems(other,aloes)>=1)
	{		
		AI_Output (self, other, "B_Taran_create_aloes11_01"); //�wietnie, masz rud� i niezb�dne sk�adniki. To potrwa tylko chwilk�...
		B_GiveInvItems(other,self,itminugget,nugget_value);
		Npc_RemoveInvItems(self,itminugget,nugget_value);
		B_GiveInvItems(other,self,aloes,1);
		Npc_RemoveInvItems(self,aloes,1);
		//ani
		AI_Output (self, other, "B_Taran_create_aloes_11_02"); //Oto i Twoje remedium.
		B_GiveInvItems(self,other,aloes_mixture,1);
		B_LogEntry		(CH1_Rbl_Plant, "Taran przygotowa� mikstur�, teraz wystarczy zanie�� j� Pachowi."); 
		Aloes_Creation=TRUE;	
	}
	else
	{
		AI_Output (self, other, "B_Taran_create_aloes_11_03"); //Tak, masz rud�, ale jak mam zrobi� mikstur� z aloesu bez aloesu?
	};	
};

INSTANCE DIA_rbl_1331_baaltaran_Aloes2 (C_INFO)
{
	npc				= rbl_1331_baaltaran;
	nr				= 12;
	condition		= DIA_rbl_1331_baaltaran_Aloes2_Condition;
	information		= DIA_rbl_1331_baaltaran_Aloes2_Info;
	permanent		= 1;
	important		= 0;
	description		= "Oto 100 bry�ek rudy, a teraz przygotuj mikstur�."; 
};

FUNC INT DIA_rbl_1331_baaltaran_Aloes2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_rbl_1331_baaltaran_Aloes)&&(!Taran_300ore) && (!Aloes_Creation))
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1331_baaltaran_Aloes2_Info()
{
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Aloes2_15_01"); //Oto 100 bry�ek rudy, a teraz przygotuj mikstur�.
   
	if (NPC_HasItems(other,itminugget)>=100)
	{
		B_Taran_create_aloes(100);
	}
	else
	{
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes2_11_05"); //Nie masz 100 bry�ek rudy, nie pr�buj mnie oszuka�.
	};
};

INSTANCE DIA_rbl_1331_baaltaran_Aloes2_2 (C_INFO)
{
	npc				= rbl_1331_baaltaran;
	nr				= 12;
	condition		= DIA_rbl_1331_baaltaran_Aloes2_2_Condition;
	information		= DIA_rbl_1331_baaltaran_Aloes2_2_Info;
	permanent		= 1;
	important		= 0;
	description		= "Oto 300 bry�ek rudy, a teraz przygotuj mikstur�."; 
};

FUNC INT DIA_rbl_1331_baaltaran_Aloes2_2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_rbl_1331_baaltaran_Aloes))&&(Taran_300ore) && (!Aloes_Creation)
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1331_baaltaran_Aloes2_2_Info()
{
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Aloes2_2_15_01"); //Oto 300 bry�ek rudy, a teraz przygotuj mikstur�.
   
	if (NPC_HasItems(other,itminugget)>=300)
	{
		B_Taran_create_aloes(300);
	}
	else
	{
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes2_2_11_05"); //Nie masz 300 bry�ek rudy, nie pr�buj mnie oszuka�.
	};
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance DIA_BaalTaran_Greet (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Jestem tu nowy. Kim jeste�?";
};                       

FUNC int DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Jestem tu nowy. Kim jeste�?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Jestem Baal Taran z Bractwa �ni�cego.
};

INSTANCE DIA_BaalTaran_CanYouTeachMe (C_INFO)
{
	npc				=  RBL_1331_BaalTaran;
	nr				= 4;
	condition		= DIA_BaalTaran_CanYouTeachMe_Condition;
	information		= DIA_BaalTaran_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_BaalTaran_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTaran_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_BaalTaran_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
   AI_Output (self, other, "DIA_BaalTaran_CanYouTeachMe_15_02"); //Tak, mog� nauczy� ci�, jak zwi�kszy� swoj� duchow� si��.
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Taran mo�e mi pom�c zwi�kszy� man�.");
};
// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "Bractwo �ni�cego? A c� to takiego?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Bractwo �ni�cego? A c� to takiego?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft1_05_01"); //Jeste�my, lub raczej byli�my wsp�lnot� wyznawc�w nowej wiary.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft1_05_02"); //Nasz ob�z znajduje si� na wsch�d st�d, na bagnie.
};

// **************************************************
//					Wer ist der Schl�fer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Kim jest �ni�cy?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Kim jest �ni�cy?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper1_05_01"); //Wierzyli�my, �e �ni�cy b�dzie naszym wybawicielem. Ale to nie by�a dobrze ulokowana wiara...
};

// **************************************************
//					Lehre des Schl�fers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Opowiedz mi o naukach �ni�cego.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Opowiedz mi o naukach �ni�cego.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //�ni�cy jest niezwykle pot�ny, mo�e nawet pot�niejszy od Innosa, boga �wiat�a.
	AI_Output (self, other,"DIA_BaalTaran_Lehre1_05_02"); //Ale jest przy tym zbyt zach�anny i krwio�erczy. Wyrzek�em si� go i dobrze mi z tym.
};

// **************************************************

instance  DIA_BaalTaran_WhatDo (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 5;
	condition	= DIA_BaalTaran_WhatDo_Condition;
	information	= DIA_BaalTaran_WhatDo_Info;
	permanent	= 0;
	description = "Jak trafi�e� do Obozu Rebeliant�w?";
};                       

FUNC int  DIA_BaalTaran_WhatDo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Lehre))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WhatDo_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WhatDo_15_00"); //Jak trafi�e� do Obozu Rebeliant�w?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo_05_01"); //Mia�em ju� do�� tych �wir�w na bagnie. Cavalorn m�drze gada. Je�eli zrobimy porz�dek z Gomezem, to wtedy mo�emy zacz�� ponowne negocjacje z kr�lem.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo_05_02"); //Na pewno Arcymag Kr�gu Ognia znajdzie spos�b na zniszczenie bariery. Niech sobie Rhobar zabiera rud�, my chcemy si� tylko wyrwa� z tego g�wna.
};

// **************************************************

instance  DIA_BaalTaran_WhatDo1 (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 6;
	condition	= DIA_BaalTaran_WhatDo1_Condition;
	information	= DIA_BaalTaran_WhatDo1_Info;
	permanent	= 0;
	description = "Czym si� zajmujesz w obozie?";
};                       

FUNC int  DIA_BaalTaran_WhatDo1_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Lehre))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WhatDo1_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WhatDo1_15_00"); //Czym si� zajmujesz w obozie?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo1_05_01"); //Sprzedaj� ziele, na tym znam si� najlepiej.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo1_05_02"); //Chcesz co� kupi�?
	Log_CreateTopic   	(CH2_DrugTrader,LOG_NOTE);
	B_LogEntry			(CH2_DrugTrader,"Taran w Obozie Rebeliant�w sprzedaje ziele.");
};

// **************************************************

instance  DIA_BaalTaran_WhatDo3 (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 8;
	condition	= DIA_BaalTaran_WhatDo3_Condition;
	information	= DIA_BaalTaran_WhatDo3_Info;
	important		= 1;
	permanent		= 0;
	description = "";
};                       

FUNC int  DIA_BaalTaran_WhatDo3_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_WhatDo1))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WhatDo3_Info()
{
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_01"); //Zaczekaj chwil�... Twoje oczy...
	AI_Output (other, self,"DIA_BaalTaran_WhatDo3_15_02"); //Co� z nimi nie tak?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_03"); //Wyczyta�em w nich... �mier�.
	AI_Output (other, self,"DIA_BaalTaran_WhatDo3_15_04"); //Co ty bredzisz. Od zielska zupe�nie pomiesza�o Ci si� w g�owie.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_05"); //Ziele pomaga mi dostrzec prawd�... 
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_06"); //Mo�esz dowiedzie� si� wi�cej za marne... 200 bry�ek.
	AI_Output (other, self,"DIA_BaalTaran_WhatDo3_15_07"); //200 bry�ek za wys�uchanie jaki� bredni? Nie jestem idiot�!
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_08"); //Przeznaczenia nie oszukasz. Mog� Ci pom�c, ale nie za darmo.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_09"); //Wr�� jak zmienisz zdanie.
	Log_CreateTopic	(CH3_RBL_Destiny, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_Destiny, LOG_RUNNING);
	B_LogEntry		(CH3_RBL_Destiny, "Taran twierdzi, �e potrafi zajrze� w przysz�o��. Za 200 bry�ek powie mi co mnie czeka. Mo�e warto spr�bowa�?");
};

// **************************************************

instance  DIA_BaalTaran_WhatDo4 (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 9;
	condition	= DIA_BaalTaran_WhatDo4_Condition;
	information	= DIA_BaalTaran_WhatDo4_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Przepowiedz mi przysz�o��.";
};                       

FUNC int  DIA_BaalTaran_WhatDo4_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_WhatDo3))&& (NPC_HasItems(other,ItMiNugget)>=200)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WhatDo4_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WhatDo4_15_01"); //Przepowiedz mi przysz�o��.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_02"); //Tak te� i b�dzie...
	B_GiveInvItems (other, self, ItMiNugget, 200);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_03"); //Przywi�d� Ci� tu gniew morza i ��dza z�ota.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_04"); //Niestety znalaz�e� tylko �mier� i niepewno�� jutra.
	AI_Output (other, self,"DIA_BaalTaran_WhatDo4_15_05"); //Tyle to sam wiem. Mia�e� przepowiada� przysz�o��, a nie rozgrzebywa� przesz�o��.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_06"); //Czeka Ci� d�uga droga, na kt�rej ko�cu napotkasz... �mier�.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_07"); //Przyjaciele wytrwaj� przy Tobie do ko�ca jednak spoczniesz sam tam gdzie z�o wzi�o sw�j pocz�tek.
	AI_Output (other, self,"DIA_BaalTaran_WhatDo4_15_08"); //Kiedy to si� stanie?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_09"); //Wtedy gdy nadejdzie w�a�ciwy czas...
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_10"); //Ale b�dzie Ci dane wybra� sw�j los. Bogowie nie nakre�lili Twego przeznaczenia, sam je ukszta�tujesz...
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_11"); //Wcze�niej zostaniesz zdradzony jednak odp�acisz zdrajcy krwi�...
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_12"); //Ogie� i �mier� krocz� w Twym cieniu... Tak b�dzie do ko�ca Twych dni.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_13"); //Pozorna prawda, wrogowie, kt�rzy stan� si� przyjaci�mi...
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_14"); //Kl�twa Pana Mroku...
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_15"); //Widz�... NIE!
	Mdl_RemoveOverlayMds(self,"humans_skeleton_fly.mds");
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_16"); //Nie mam ju� si�... Odejd�...
	Log_SetTopicStatus	(CH3_RBL_Destiny, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_Destiny, "Taran ukaza� mi przysz�o��, nie wiem jednak ile w jego s�owach jest prawdy... Poza tym ka�dy musi w ko�cu umrze�, kto chcia�by �y� wiecznie? ");
	B_StopProcessInfos	( self );
};

// **************************************************

instance  DIA_BaalTaran_WhatDo5 (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_WhatDo5_Condition;
	information	= DIA_BaalTaran_WhatDo5_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Wszystko w porz�dku?";
};                       

FUNC int  DIA_BaalTaran_WhatDo5_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_WhatDo4))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WhatDo5_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WhatDo5_15_01"); //Wszystko w porz�dku?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo5_05_02"); //Nie! Do cholery nigdy jeszcze nie widzia�em czego� takiego...
	AI_Output (other, self,"DIA_BaalTaran_WhatDo5_15_03"); //O czym m�wisz?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo5_05_04"); //O niczym. Odejd� i najlepiej nigdy nie wracaj.
	B_StopProcessInfos	( self );
};

var int taran_gone;

// **************************************************

instance  DIA_BaalTaran_Stuff (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 11;
	condition	= DIA_BaalTaran_Stuff_Condition;
	information	= DIA_BaalTaran_Stuff_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Mam paczk� od Gilberta.";
};                       

FUNC int  DIA_BaalTaran_Stuff_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalKagan_StuffHave))&&(NPC_HasItems(other,package_stuff)>=1)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Stuff_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Stuff_15_01"); //Mam paczk� od Gilberta.
	AI_Output (self, other,"DIA_BaalTaran_Stuff_05_02"); //Co? Dlaczego akurat Tobie j� da�? Poza tym mam jeszcze zapas.
	AI_Output (other, self,"DIA_BaalTaran_Stuff_15_03"); //Spotka�em go niedaleko Starego Obozu. Kiedy� troch� mu pomog�em, a wida�, �e wiek robi ju� swoje.
	AI_Output (other, self,"DIA_BaalTaran_Stuff_15_04"); //Powiedzia�, �e ma dla Ciebie przesy�k� wi�c zaoferowa�em pomoc. Ot i ca�a tajemnica.
	AI_Output (self, other,"DIA_BaalTaran_Stuff_05_05"); //Staruszek pospieszy� si� z dostaw�. Ale w sumie co to za r�nica.
	AI_Output (self, other,"DIA_BaalTaran_Stuff_05_06"); //Daj paczk�. A to za fatyg�.
	B_GiveInvItems (other, self, package_stuff, 1);
	Npc_RemoveInvItems(self,package_stuff,1);
	CreateInvItems (self,ItMiJoint_3, 1);
	B_GiveInvItems (self, other, ItMiJoint_3, 1);

	taran_gone = B_SetDayTolerance()+1;
	B_LogEntry		(CH2_RBL_Stuff,	"Taran dosta� doprawiona paczk� ziela. Czas odebra� zap�at�.");
};

// **************************************************

instance  DIA_BaalTaran_Stuff1 (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 12;
	condition	= DIA_BaalTaran_Stuff1_Condition;
	information	= DIA_BaalTaran_Stuff1_Info;
	important		= 1;
	permanent		= 0;
	description 		= ".";
};                       

FUNC int  DIA_BaalTaran_Stuff1_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalKagan_StuffHave1))&&(taran_gone <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Stuff1_Info()
{
	AI_Output (self, other,"DIA_BaalTaran_Stuff1_05_01"); //To Ty! To przez ciebie straci�em klient�w!
	AI_Output (other, self,"DIA_BaalTaran_Stuff1_15_02"); //Nie wiem o czym m�wisz...
	AI_Output (self, other,"DIA_BaalTaran_Stuff1_05_03"); //Skurwiel! Ale nawet Ty nie uciekniesz przed kl�tw� w�asnego przeznaczenia!
	AI_Output (self, other,"DIA_BaalTaran_Stuff1_05_04"); //Wspomnisz moje s�owa w chwili �mierci, piracie.
	B_StopProcessInfos	( self );
};

// **************************************************

instance  DIA_BaalTaran_Hanis (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 13;
	condition	= DIA_BaalTaran_Hanis_Condition;
	information	= DIA_BaalTaran_Hanis_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Chcia�em zapyta� o Kharima.";
};                       

FUNC int  DIA_BaalTaran_Hanis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Quentin_Hanis1))&&(Npc_KnowsInfo(hero, DIA_BaalTaran_WhatDo1)) && (!Npc_KnowsInfo(hero, DIA_RATFORD_Hanis1))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Hanis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Hanis_15_01"); //Chcia�em zapyta� o Kharima.
	AI_Output (self, other,"DIA_BaalTaran_Hanis_05_02"); //Tak?
	AI_Output (other, self,"DIA_BaalTaran_Hanis_15_03"); //Nie sprzeda�e� mu ostatnio jakiego� ziela? Czego� specjalnego?
	AI_Output (self, other,"DIA_BaalTaran_Hanis_05_04"); //Nie. Nie sprzeda�em mu nic, odk�d nie zap�aci� za zew nocy. 
	AI_Output (other, self,"DIA_BaalTaran_Hanis_15_05"); //Dzi�ki.
	B_LogEntry		(CH2_RBL_Mem, "To nie Taran sprzeda� ziele Kharimowi.");
};

//***************************************************************

/*************************************
Duch
*************************************/

// **************************************************

INSTANCE DIA_baaltaran_GhostMixt (C_INFO)
{
	npc				= rbl_1331_baaltaran;
	nr				= 312;
	condition		= DIA_baaltaran_GhostMixt_Condition;
	information		= DIA_baaltaran_GhostMixt_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rzucisz okiem na ten flakonik?"; 
};

FUNC INT DIA_baaltaran_GhostMixt_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Roderic_OldNote))&&(NPC_HasItems(other,dream_mixture)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_baaltaran_GhostMixt_Info()
{
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_01"); //Rzucisz okiem na ten flakonik?
	AI_Output (self, other, "DIA_baaltaran_GhostMixt_11_02"); //Mog� i rzuci�...

	/***************************
Przyda�a by si� jakas animacja z przyk�adaniem buteleczki do nosa

****************************/
	B_GiveInvitems(other,self,dream_mixture,1);
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_03"); //Co to mo�e by�?
	Ai_PlayAni(self,"T_CHECKPOTION_FULL");
	AI_WAit(self,1);
	
	AI_Output (self, other, "DIA_baaltaran_GhostMixt_11_04"); //Wyczuwam ziele nostrzyka, li�� melisy, korze� koz�ka, szyszki chmielu...
	AI_Output (self, other, "DIA_baaltaran_GhostMixt_11_05"); //I siln� magi�. Ten nap�j musia� sporz�dzi� orkowy szaman. 
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_06"); //Jak dzia�a taka mikstura?
	AI_Output (self, other, "DIA_baaltaran_GhostMixt_11_07"); //To mocny nap�j usypiaj�cy. Z powodu szyszek chmielu cz�sto dodaje si� do grzanego piwa, lub wina. Praktycznie nie da si� go wykry�.
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_08"); //Chyba ju� rozumiem co si� sta�o.
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_09"); //Dzi�ki, Taran. Bardzo mi pomog�e�.
	AI_Output (self, other, "DIA_baaltaran_GhostMixt_11_10"); //Nie ma sprawy. Mo�e kupisz jakie� ziele?
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_11"); //Innym razem, bywaj.
	B_LogEntry		(CH3_RBL_RodneyHelp, "W fiolce, kt�r� znalaz�em w Wie�y Mgie� znajdowa�a si� silna mikstura usypiaj�ca. My�l�, �e to 'przyjaciel' ducha sta� za zdrad�. Poda� mu grzane wino z �rodkiem usypiaj�cym, a reszt� za�atwili orkowie. Kawa� z niego sukinsyna. Musz� porozmawia� z... duchem.");
}; 
