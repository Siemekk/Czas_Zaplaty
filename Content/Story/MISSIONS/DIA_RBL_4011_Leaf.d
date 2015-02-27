var int Drunkman_Chest_canbeopened;

func int B_PIWOSZ_CHEST()
{
	if(Drunkman_Chest_canbeopened)
	{
		if(Npc_CanSeeNpcFreeLOS		(piwosz,hero))
		{
			Npc_ClearAIQueue(piwosz);
			B_FullStop 		(piwosz);
			Npc_SetTarget(piwosz,HERO);
			AI_StartState	(piwosz, ZS_CatchThief, 0, "");
		};
      
		return 1;
	}
	else
	{
		return 0;	
	};
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Leaf_Exit (C_INFO)
{
	npc			= RBL_4011_Leaf;
	nr			= 999;
	condition	= DIA_Leaf_Exit_Condition;
	information	= DIA_Leaf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Leaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Leaf_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Leaf_Hello (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 1;
	condition		= DIA_Leaf_Hello_Condition;
	information		= DIA_Leaf_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_Leaf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Leaf_Hello_Info()
{
	AI_Output (other, self, "DIA_Leaf_Hello_15_01"); //Witaj.
	AI_Output (self, other, "DIA_Leaf_Hello_11_02"); //A Ty spadaj.
	AI_Output (other, self, "DIA_Leaf_Hello_15_03"); //Rozmowny jeste�.
	AI_Output (self, other, "DIA_Leaf_Hello_11_04"); //Nie szukam nowych przyjaci�, wypierdalaj!
	
   B_StopProcessInfos	(self);
};

INSTANCE DIA_Leaf_Trol (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 1;
	condition		= DIA_Leaf_Trol_Condition;
	information		= DIA_Leaf_Trol_Info;
	permanent		= 0;
	important		= 0;
	description		= "Cavalorn powiedzia�, �e znasz �owc�w trolli."; 
};

FUNC INT DIA_Leaf_Trol_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_Hello))&&(Npc_KnowsInfo (hero, DIA_Cavalorn_BlackTroll2))
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Trol_Info()
{
	cav_trol = 4;	
   
	AI_Output (other, self, "DIA_Leaf_Trol_15_01"); //Cavalorn powiedzia�, �e znasz �owc�w trolli.
	AI_Output (self, other, "DIA_Leaf_Trol_11_02"); //Znam wiele szumowin, a co Tobie do tego?
	AI_Output (other, self, "DIA_Leaf_Trol_15_03"); //Zamierzam ich odwiedzi�. Im wi�cej si� dowiem, tym wi�ksz� mam szans� na prze�ycie.
	AI_Output (self, other, "DIA_Leaf_Trol_11_04"); //C� za sk�adna konkluzja. Poczu�em si� prawie, jakby� by� baka�arzem.
	AI_Output (self, other, "DIA_Leaf_Trol_11_05"); //W porz�dku, powiem Ci co wiem.
	AI_Output (self, other, "DIA_Leaf_Trol_11_06"); //�owcy to banda my�liwych najwy�szej pr�by. Fakt, �e wi�kszo�� z nich to niezr�wnowa�one bydlaki o sadystycznych sk�onno�ciach, ale poza tym s� w miar� normalni.
	AI_Output (self, other, "DIA_Leaf_Trol_11_07"); //S�k w tym, �e oni nie wpuszczaj� do obozu byle kogo.
	AI_Output (self, other, "DIA_Leaf_Trol_11_08"); //A byle kto, to dla nich kto� kogo nie znaj�.
	AI_Output (other, self, "DIA_Leaf_Trol_15_09"); //Ale znaj� Ciebie, tak?
	AI_Output (self, other, "DIA_Leaf_Trol_11_10"); //Mniej, wi�cej. 
	AI_Output (self, other, "DIA_Leaf_Trol_11_11"); //Tylko, �e wiedza kosztuje, piracie.
	AI_Output (other, self, "DIA_Leaf_Trol_15_12"); //Ile?
	AI_Output (self, other, "DIA_Leaf_Trol_11_13"); //Nie zupe�nie to mia�em na my�li.
	AI_Output (other, self, "DIA_Leaf_Trol_15_14"); //Streszczaj si�, bo nie mam ca�ego dnia!
	AI_Output (self, other, "DIA_Leaf_Trol_11_15"); //W ko�cu to Ty chcesz pogada� z �owcami, nie ja.
	AI_Output (self, other, "DIA_Leaf_Trol_11_16"); //Widzisz. Siedz� tu sobie i kontempluj�, jaki ten �wiat pi�kny.
	AI_Output (self, other, "DIA_Leaf_Trol_11_17"); //Jednak do pe�ni szcz�cia brakuje mi... lazurowego trzmiela.
	AI_Output (other, self, "DIA_Leaf_Trol_15_18"); //Czego?
	AI_Output (self, other, "DIA_Leaf_Trol_11_19"); //To taki trunek. Pogadaj z Piwoszem, on wie o co chodzi.
	AI_Output (other, self, "DIA_Leaf_Trol_15_20"); //Dobra, wr�c� tu z tym sikaczem i lepiej, �eby� wtedy powiedzia�, to co chc� us�ysze�.
	
   Log_CreateTopic	(CH2_Rbl_Lazur, LOG_MISSION);
	B_LogSetTopicStatus	(CH2_Rbl_Lazur, LOG_RUNNING);
	B_LogEntry		(CH2_Rbl_Lazur, "Dowiem si� konkret�w o �owcach trolli, je�eli przynios� Leafowi lazurowego trzmiela. Piwosz powinien wiedzie� co� wi�cej na temat tego trunku.");
	B_StopProcessInfos	(self);
	Drunkman_Chest_canbeopened=true;
};

var int leaf_again;

INSTANCE DIA_Leaf_Trol1 (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 2;
	condition		= DIA_Leaf_Trol1_Condition;
	information		= DIA_Leaf_Trol1_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam samogon."; 
};

FUNC INT DIA_Leaf_Trol1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Drunk_Lazur))
	&& (TH_hero_knowpwd==false)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Trol1_Info()
{
	AI_Output (other, self, "DIA_Leaf_Trol1_15_01"); //Mam samogon.
	
   if (leaf_again == FALSE)	
	{
		if (NPC_HasItems(other,ItFo_Lazur)>=1)
		{
			B_GiveXP(200);
			leaf_again = TRUE;
         
			AI_Output (self, other, "DIA_Leaf_Trol1_11_02"); //Tak, to lazurowy trzmiel!	
			
         B_GiveInvItems (other, self, ItFo_Lazur, 1);
			
         AI_Output (self, other, "DIA_Leaf_Trol1_11_03"); //Daj to zanim st�uczesz butelk�.
			
         AI_UseItem (self,ItFo_Lazur);
			
         AI_Output (self, other, "DIA_Leaf_Trol1_11_04"); //Tego mi brakowa�o...
			
         B_LogSetTopicStatus	(CH2_Rbl_Lazur, LOG_SUCCESS);
			B_LogEntry(CH2_Rbl_Lazur, "Przynios�em Leafowi lazurowego trzmiela, kt�rego ten od razu wych�epta�.");
			
         AI_Output (other, self, "DIA_Leaf_Trol1_15_05"); //Nie chc� si� narzuca�, ale skoro ju� si� napi�e�...
			AI_Output (self, other, "DIA_Leaf_Trol1_11_06"); //I po co ten sarkazm? Gard�o przep�uka�em, ale to jeszcze nie wszystko.
			AI_Output (other, self, "DIA_Leaf_Trol1_15_07"); //Nie przeci�gaj struny! M�w, co wiesz o tych �owcach! Jak si� tam dosta�?!
			AI_Output (self, other, "DIA_Leaf_Trol1_11_08"); //Spokojnie wszystko w swoim czasie.
			AI_DrawWeapon (other);
			AI_Output (self, other, "DIA_Leaf_Trol1_11_09"); //Przecie� nie zabijesz jednego ze swoich, co nie?
			AI_RemoveWeapon (other);
			AI_Output (self, other, "DIA_Leaf_Trol1_11_10"); //Tak ju� lepiej. Pomy�l o czym� przyjemnym, pozb�d� si� z�ych emocji...
			AI_Output (other, self, "DIA_Leaf_Trol1_15_11"); //Jedyna przyjemna my�l jaka przychodzi mi teraz do g�owy, to Twoja rozkwaszona morda! Czego chcesz?!
			AI_Output (self, other, "DIA_Leaf_Trol1_11_12"); //A czego mo�e chcie� biedny rebeliant bez perspektyw na przysz�o��.
			AI_Output (self, other, "DIA_Leaf_Trol1_11_13"); //250 bry�ek rudy powinno wystarczy�.
			
         B_LogEntry		(CH2_Rbl_BlackTroll, "Leaf za informacj� o �owcach ��da 250 bry�ek rudy!");
			Info_ClearChoices (DIA_Leaf_Trol1);
			
			if (NPC_HasItems(other,ItMiNugget)>=250)
			{
				Info_AddChoice (DIA_Leaf_Trol1, "Bierz t� cholern� rud�!", DIA_Leaf_Trol1_Yes);
			}
			else
			{
				Info_AddChoice (DIA_Leaf_Trol1, "Nie mam tyle.", DIA_Leaf_Trol1_No);
			};			
		}
		else
		{
			AI_Output (self, other, "DIA_Leaf_Trol1_11_15"); //Nie masz trzmiela, nie zawracaj mi dupy.
			B_StopProcessInfos(self);
		};		
	}	
	else if (leaf_again == TRUE)
	{
		AI_Output (self, other, "DIA_Leaf_Trol1_11_14"); //Masz rud�?
		Info_ClearChoices (DIA_Leaf_Trol1);

		if (NPC_HasItems(other,ItMiNugget)>=250)
		{
			Info_AddChoice (DIA_Leaf_Trol1, "Bierz t� cholern� rud�!", DIA_Leaf_Trol1_Yes);
		}
		else
		{
			Info_AddChoice (DIA_Leaf_Trol1, "Nie mam tyle.", DIA_Leaf_Trol1_No);
		};		
	}
	else
	{
		AI_Output (self, other, "DIA_Leaf_Trol1_11_15"); //Nie masz trzmiela, nie zawracaj mi dupy.
		B_StopProcessInfos	(self);
	};
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Leaf_Trol1_Yes()
{
	B_GiveXP(250);
	DIA_Leaf_Trol1.permanent = 0;
	TH_hero_knowpwd = TRUE;
	B_GiveInvItems (other, self, ItMiNugget, 250);
   
	AI_Output (other, self, "DIA_Leaf_Trol1_Yes_15_01"); //Bierz t� cholern� rud�!
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_02"); //I po co te nerwy? Z�o�� pi�kno�ci szkodzi, a Ty jeste� ju� wystarczaj�co ohydny.
	AI_Output (other, self, "DIA_Leaf_Trol1_Yes_15_03"); //Nie pierdol mi tu farmazon�w! M�w!
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_04"); //�owcy trolli to odizolowana banda. Nie lubi� obcych pa��taj�cych si� po ich cuchn�cym obozie.
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_05"); //Bez obrazy, ale nie wpuszczaj� te� do obozu pierwszego lepszego �achmyty.
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_06"); //No chyba, �e ten obwie� zna has�o.
	AI_Output (other, self, "DIA_Leaf_Trol1_Yes_15_07"); //A Ty je znasz?
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_08"); //Ale� oczywi�cie. Has�o brzmi...
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_09"); //'Nigdy nie odwracaj si� ty�em do stra�nika'.
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_10"); //He, he, rozumiesz... Ty�em, he, he...
	AI_Output (other, self, "DIA_Leaf_Trol1_Yes_15_11"); //Tak, bardzo zabawne. Je�eli to has�o nie oka�e si� prawdziwe, to wr�c� po Ciebie i utn� Ci to i tamto!
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_12"); //Mam nadziej�, �e si� nie zmieni�o... 
	AI_Output (other, self, "DIA_Leaf_Trol1_Yes_15_13"); //Lepiej dla Ciebie i Twoich cz�onk�w �eby tak by�o!
	
   B_LogEntry		(CH2_Rbl_BlackTroll, "W ko�cu wydusi�em od Leafa jakie� konkrety. �owcy nie wpuszczaj� do obozu nikogo, kto nie zna has�a. Leaf twierdzi, ze has�o brzmi 'Nigdy nie odwracaj si� ty�em do stra�nika', lepiej dla niego, �eby to by�a prawda...");
	Info_ClearChoices (DIA_Leaf_Trol1);
	B_StopProcessInfos	(self); 
};

// ------------------No----------------

FUNC VOID DIA_Leaf_Trol1_No()
{
	AI_Output (other, self, "DIA_Leaf_Trol1_No_15_01"); //Nie mam tyle.
	AI_Output (self, other, "DIA_Leaf_Trol1_No_11_02"); //To wr��, jak b�dziesz mia�.
	
   Info_ClearChoices (DIA_Leaf_Trol1);
	B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Leaf_Debt (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 3;
	condition		= DIA_Leaf_Debt_Condition;
	information		= DIA_Leaf_Debt_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przysy�a mnie Nikolas."; 
};

FUNC INT DIA_Leaf_Debt_Condition()
{
	if (debt_read == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Debt_Info()
{
	debt_counter = debt_counter + 1;
	B_GiveXP (150);
   
	AI_Output (other, self, "DIA_Leaf_Debt_15_01"); //Przysy�a mnie Nikolas.
	AI_Output (self, other, "DIA_Leaf_Debt_11_02"); //Cholera my�la�em, �e ju� zapomnia�....
	AI_Output (other, self, "DIA_Leaf_Debt_15_03"); //To �le my�la�e� i dolicz jeszcze 50 bry�ek odsetek.
	AI_Output (self, other, "DIA_Leaf_Debt_11_04"); //Ile?! Bez przesady.
	AI_Output (other, self, "DIA_Leaf_Debt_15_05"); //Pos�uchaj, albo oddasz ca�� rud� po dobroci albo j� z Ciebie wycisn�.
	AI_Output (self, other, "DIA_Leaf_Debt_11_06"); //Dobra, ju� dobra. Zabieraj rud� i zejd� mi z oczu cholerna pijawko!
	
   CreateInvItems (self, ItMiNugget,250); 
	B_GiveInvItems (self, other, ItMiNugget, 250);
	B_LogEntry		(CH2_TRL_Debt, "Odebra�em d�ug od Leafa, to by�o �atwiejsze ni� my�la�em.");
	B_StopProcessInfos	(self);
};

// **************************************************

var int leaf_plant;
var int leaf_give_plant;

INSTANCE DIA_Leaf_Plant (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 4;
	condition		= DIA_Leaf_Plant_Condition;
	information		= DIA_Leaf_Plant_Info;
	permanent		= 1;
	important		= 0;
	description		= "S�ysza�e� kiedy� o smoczym korzeniu?"; 
};

FUNC INT DIA_Leaf_Plant_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Milten_Plantsd)) && (!leaf_give_plant)
	{                                          	
		return 1;                                 	
	};                                         
};

FUNC VOID DIA_Leaf_Plant_Info()
{
	if (leaf_plant = FALSE)
	{
		leaf_plant = TRUE;
		AI_Output (other, self, "DIA_Leaf_Plant_15_01"); //S�ysza�e� kiedy� o smoczym korzeniu?
		AI_Output (self, other, "DIA_Leaf_Plant_11_02"); //Nie tylko s�ysza�em, ale nawet mam jeden na sprzeda�.
		AI_Output (self, other, "DIA_Leaf_Plant_11_03"); //Ale to droga ro�lina... Bardzo droga.
		AI_Output (other, self, "DIA_Leaf_Plant_15_04"); //Ile chcesz za korze�?
		AI_Output (self, other, "DIA_Leaf_Plant_11_05"); //Hmm, wliczaj�c rzadko�� wyst�powania ro�liny, ryzyko zwi�zane z jej znalezieniem, koszty manipulacyjne...
		AI_Output (other, self, "DIA_Leaf_Plant_15_06"); //Ile?!
		AI_Output (self, other, "DIA_Leaf_Plant_11_07"); //500 bry�ek.
		
      DIA_Leaf_Plant.description = "Masz jeszcze ten korze�?";
		B_LogEntry		(CH2_RBL_Plants, "Ta pijawka Leaf chce za korze� 500 bry�ek! Najch�tniej star�bym ten g�upi u�mieszek z jego mordy kilofem...");
	}
	else
	{
		AI_Output (other, self, "DIA_Leaf_Plant_15_08"); //Masz jeszcze ten korze�?
		AI_Output (self, other, "DIA_Leaf_Plant_11_09"); //Tak, ale cena si� nie zmieni�a - 500 bry�ek!
	};
	
	Info_ClearChoices (DIA_Leaf_Plant);

	if (NPC_HasItems(other,ItMiNugget)>=500)
	{
		Info_AddChoice (DIA_Leaf_Plant, "Bierz t� cholern� rud�!", DIA_Leaf_Plant_Yes);
		Info_AddChoice (DIA_Leaf_Plant, "Musz� si� zastanowi�.", DIA_Leaf_Plant_Go);
	}
	else
	{
		Info_AddChoice (DIA_Leaf_Plant, "Nie mam tyle.", DIA_Leaf_Plant_No);
	};
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Leaf_Plant_Yes()
{
	B_GiveXP(250);
	CreateInvItems (self, dragon_root,1); 
	B_GiveInvItems (self, other, dragon_root, 1);
	leaf_give_plant = true;
	B_GiveInvItems (other, self, ItMiNugget, 500);
	AI_Output (other, self, "DIA_Leaf_Plant_Yes_15_01"); //Bierz t� cholern� rud�!
	AI_Output (self, other, "DIA_Leaf_Plant_Yes_11_02"); //Pewnie, �e wezm�. A to Twoje zielsko. Mam nadziej�, �e to ten korze�...
	AI_Output (other, self, "DIA_Leaf_Plant_Yes_15_03"); //Je�eli tak nie b�dzie, to wypruj� Ci flaki, cholerny s�pie!
	B_LogEntry		(CH2_RBL_Plants, "Kupi�em od Leafa smoczy korze�.");
	Info_ClearChoices (DIA_Leaf_Plant);
	B_StopProcessInfos	(self); 
};



// ------------------No----------------

FUNC VOID DIA_Leaf_Plant_No()
{
	AI_Output (other, self, "DIA_Leaf_Plant_No_15_01"); //Nie mam tyle.
	AI_Output (self, other, "DIA_Leaf_Plant_No_11_02"); //To wr��, jak b�dziesz mia�.
	Info_ClearChoices (DIA_Leaf_Plant);
	B_StopProcessInfos	(self); 
};

// ------------------go----------------

FUNC VOID DIA_Leaf_Plant_Go()
{
	AI_Output (other, self, "DIA_Leaf_Plant_Go_15_01"); //Musz� si� zastanowi�.
	AI_Output (self, other, "DIA_Leaf_Plant_Go_11_02"); //Tylko nie my�l za d�ugo...
	Info_ClearChoices (DIA_Leaf_Plant);
	B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_RBL_4011_Leaf_Stew (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 12;
	condition		= DIA_RBL_4011_Leaf_Stew_Condition;
	information		= DIA_RBL_4011_Leaf_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie porcj� gulaszu."; 
};

FUNC INT DIA_RBL_4011_Leaf_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_4011_Leaf_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_RBL_4011_Leaf_Stew_15_01"); //Mam dla Ciebie porcj� gulaszu.
	AI_Output (self, other, "DIA_RBL_4011_Leaf_Stew_11_02"); //Dzi�ki.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Da�em gulasz Leafowi."); 
};

var int Leaf_finish_last_talk;

// **************************************************

INSTANCE DIA_Leaf_OCSpy (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 5;
	condition		= DIA_Leaf_OCSpy_Condition;
	information		= DIA_Leaf_OCSpy_Info;
	permanent		= 1;
	important		= 0;
	description		= "Podobno wiesz, jak dosta� si� do Starego Obozu."; 
};

FUNC INT DIA_Leaf_OCSpy_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OldCampSpy))&&(!Leaf_OCSpy_notpermanent)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_OCSpy_Info()
{
	if (Leaf_finish_last_talk == FALSE)
	{
		Leaf_finish_last_talk = TRUE;
		DIA_Leaf_OCSpy.description = "Chcia�em doko�czy� poprzedni� rozmow�."; 
		AI_Output (other, self, "DIA_Leaf_OCSpy_15_01"); //Podobno wiesz, jak dosta� si� do Starego Obozu.
		AI_Output (self, other, "DIA_Leaf_OCSpy_11_02"); //Nic za darmo jak mawia�a moja mamusia, kiedy przychodzili klienci.
		AI_Output (other, self, "DIA_Leaf_OCSpy_15_03"); //Nie mam czasu na pierdo�y, m�w czego chcesz.
		AI_Output (self, other, "DIA_Leaf_OCSpy_11_04"); //Tego co zawsze - rudy... Okr�g�y 1000 b�dzie w sam raz.
	}
	else
	{
		AI_Output (self, other, "DIA_Leaf_OCSpy_11_05"); //Jednak przejrza�e� na oczy.
	};
   
	Info_ClearChoices (DIA_Leaf_OCSpy);

	Info_AddChoice (DIA_Leaf_OCSpy, "Nic Ci nie zap�ac�!", DIA_Leaf_OCSpy_Fight);
	
   if (NPC_HasItems(other,ItMiNugget)>=1000)
	{
		Info_AddChoice (DIA_Leaf_OCSpy, "Bierz t� cholern� rud�!", DIA_Leaf_OCSpy_Money);
	};
   
	Info_AddChoice (DIA_Leaf_OCSpy, "Nie mam tyle.", DIA_Leaf_OCSpy_NoMoney);
};

// ---------------------------fight----------------------------------------

FUNC VOID DIA_Leaf_OCSpy_Fight()
{
	B_GiveXP(300);
	Leaf_OCSpy_notpermanent = true;
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_00"); //Nic Ci nie zap�ac�!
	AI_DrawWeapon (other);
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_01"); //Pos�uchaj skurwielu!
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_02"); //Stoimy po tej samej stronie barykady, a Ty chcesz ze mnie zedrze� ostatni� sk�r�?!
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_03"); //To tylko interes, �yjemy w paskudnych czasach, nic nie ma za darmo...
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_04"); //Masz racj�, �yjemy w paskudnych czasach. Ci�gle s�yszy si� o �wirach, kt�rzy wypruwaj� flaki innym tylko dlatego, �e tamci krzywo na niech spoj��.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_05"); //Spokojnie, zrozumia�em aluzj�. Mo�e i jestem zach�anny, ale nie g�upi. Schowaj to �elastwo.
	AI_RemoveWeapon (other);
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_06"); //M�w i lepiej, �ebym si� na Tobie nie zawi�d�.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_07"); //Niech to b�dzie wyraz mojej dobrej woli. W ko�cu walczymy po tej samej stronie.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_08"); //Znam kolesia, kt�ry stoi na stra�y przy p�nocnej bramie obozu. Troch� sie kiedy� wa��sali�my razem, jeszcze zanim trafi�em do Kolonii.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_09"); //Fakt, �e ju� za sob� specjalnie nie przepadamy, ale znam jego s�abe strony.
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_10"); //Nie interesuje mnie Twoje �ycie intymne, czekam na konkrety.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_11"); //Bardzo �mieszne. Kiedy jest nawalony, mo�esz mu wcisn�� ka�de k�amstwo. Wm�wisz mu nawet, �e jest p�-orkiem, bo jego matka...
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_12"); //Czyli wystarczy go spi�? Mocny ma �eb?
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_13"); //Za ko�nierz nie wylewa, ale powiniene� sobie poradzi�. Najlepiej jakby� za�atwi� sobie na t� okazj� jaki� porz�dny trunek.
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_14"); //Dobra Leaf, dzi�ki za przys�ug�. Je�eli prze�yj� wizyt� w Starym Obozie to odp�ac� Ci jak nale�y za t� informacj�.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_15"); //Wystarczy, �e pokrzy�ujesz plany tego cuchn�cego wieprza Gomeza. Powodzenia piracie.
	
   B_LogEntry		(CH3_RBL_OldCampSpy, "Wydusi�em z Leafa, �e stra�nik przed p�nocna bram� po pijaku mo�e da� si� oszuka�. Mo�e Piwosz b�dzie mia� co� na t� okazj�?");
	B_StopProcessInfos	(self); 
};

// ---------------------------money----------------------------------------

FUNC VOID DIA_Leaf_OCSpy_Money()
{
	B_GiveXP(200);
	Leaf_OCSpy_notpermanent = true;
	AI_Output (other, self, "DIA_Leaf_OCSpy_Money_15_01"); //Bierz t� cholern� rud�!
	B_GiveInvItems (other, self, ItMiNugget, 1000);
	AI_Output (other, self, "DIA_Leaf_OCSpy_Money_15_06"); //M�w i lepiej, �ebym si� na tobie nie zawi�d�.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Money_11_08"); //Znam kolesia, kt�ry stoi na stra�y przy p�nocnej bramie obozu. Troch� sie kiedy� wa��sali�my razem, jeszcze zanim trafi�em do Kolonii.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Money_11_09"); //Fakt, �e ju� za sob� specjalnie nie przepadamy, ale znam jego s�abe strony.
	AI_Output (other, self, "DIA_Leaf_OCSpy_Money_15_10"); //Nie interesuje mnie Twoje �ycie intymne, czekam na konkrety.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Money_11_11"); //Bardzo �mieszne. Kiedy jest nawalony, mo�esz mu wcisn�� ka�de k�amstwo. Wm�wisz mu nawet, �e jest p�-orkiem bo jego matka...
	AI_Output (other, self, "DIA_Leaf_OCSpy_Money_15_12"); //Czyli wystarczy go spi�? Mocn� ma g�ow�?
	AI_Output (self, other, "DIA_Leaf_OCSpy_Money_11_13"); //Za ko�nierz nie wylewa, ale powiniene� sobie poradzi�. Najlepiej jakby� za�atwi� sobie na t� okazj� jaki� porz�dny trunek.
	AI_Output (other, self, "DIA_Leaf_OCSpy_Money_15_14"); //Dobra Leaf, dzi�ki za przys�ug�. Je�eli mnie oszuka�e�, to wr�c� i wypruj� ci flaki.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Money_11_15"); //Zapewniam, �e nie b�dzie takiej potrzeby. Powodzenia piracie.
	
   B_LogEntry		(CH3_RBL_OldCampSpy, "Za rud� Leaf powiedzia�, �e stra�nik przed p�nocna bram� po pijaku mo�e da� si� oszuka�. Mo�e Piwosz b�dzie mia� co� na t� okazj�?");
	B_StopProcessInfos	(self); 
};

// ---------------------------no cash----------------------------------------

FUNC VOID DIA_Leaf_OCSpy_NoMoney()
{
	AI_Output (other, self, "DIA_Leaf_OCSpy_NoMoney_15_01"); //Nie mam tyle.
	AI_Output (self, other, "DIA_Leaf_OCSpy_NoMoney_11_02"); //To nie m�j problem.
	
   Info_ClearChoices (DIA_Leaf_OCSpy);
	B_StopProcessInfos	(self); 
};

/***************************
SIDE QUEST

***************************/

// **************************************************

INSTANCE DIA_Leaf_Cristal (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 10;
	condition		= DIA_Leaf_Cristal_Condition;
	information		= DIA_Leaf_Cristal_Info;
	permanent		= 0;
	important		= 0;
	description		= "Szukam... kryszta�u."; 
};

FUNC INT DIA_Leaf_Cristal_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_CristalOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Cristal_Info()
{
	AI_Output (other, self, "DIA_Leaf_Cristal_15_01"); //Szukam... kryszta�u.
	AI_Output (self, other, "DIA_Leaf_Cristal_11_02"); //Jednak �wistak znalaz� jakiego� idiot�.
	AI_Output (other, self, "DIA_Leaf_Cristal_15_03"); //Bez takich wycieczek!
	AI_Output (self, other, "DIA_Leaf_Cristal_11_04"); //Bo co mi zrobisz? Dasz mi klapsa?
	AI_Output (self, other, "DIA_Leaf_Cristal_11_05"); //Spadaj st�d, nie mam teraz czasu.
	B_LogEntry		(CH1_RBL_ArrowCristal, "Ogl�dnie m�wi�c, Leaf mnie sp�awi�.");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Leaf_CristalAgain (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 11;
	condition		= DIA_Leaf_CristalAgain_Condition;
	information		= DIA_Leaf_CristalAgain_Info;
	permanent		= 0;
	important		= 0;
	description		= "Pogadajmy."; 
};

FUNC INT DIA_Leaf_CristalAgain_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_Cristal))
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_CristalAgain_Info()
{
	AI_Output (other, self, "DIA_Leaf_CristalAgain_15_01"); //Pogadajmy.
	AI_Output (self, other, "DIA_Leaf_CristalAgain_11_02"); //Dla mnie ka�da chwila jest bezcenna.
	AI_Output (other, self, "DIA_Leaf_CristalAgain_15_03"); //Ile?
	AI_Output (self, other, "DIA_Leaf_CristalAgain_11_04"); //50 bry�ek.
	AI_Output (other, self, "DIA_Leaf_CristalAgain_15_05"); //To rozb�j!
	AI_Output (self, other, "DIA_Leaf_CristalAgain_11_06"); //Wr�� z rud�, albo spadaj!
	B_LogEntry		(CH1_RBL_ArrowCristal, "Leaf porozmawia ze mn� za 50 bry�ek. Cholerna pijawka!");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Leaf_CristalPay (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 12;
	condition		= DIA_Leaf_CristalPay_Condition;
	information		= DIA_Leaf_CristalPay_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zap�ac� Ci!"; 
};

FUNC INT DIA_Leaf_CristalPay_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_CristalAgain))&&(NPC_HasItems(other,ItMiNugget)>=50)

	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_CristalPay_Info()
{
	AI_Output (other, self, "DIA_Leaf_CristalPay_15_01"); //Zap�ac� Ci!
	AI_Output (self, other, "DIA_Leaf_CristalPay_11_02"); //Najpierw ruda, buziaczki p�niej jak mawia�a moja mamusia.
	AI_Output (other, self, "DIA_Leaf_CristalPay_15_03"); //Bierz kanalio i m�w, co wiesz o tym krysztale!
	B_GiveInvItems (other, self, ItMiNugget, 50);
	AI_Output (self, other, "DIA_Leaf_CristalPay_11_04"); //Grzeczniej prosz�. Poza tym sk�d przypuszczenia, �e cokolwiek wiem o jakim� tam krysztale?
	AI_DrawWeapon (other);
	AI_Output (other, self, "DIA_Leaf_CristalPay_15_05"); //Oddaj rud�, albo...
	AI_Output (self, other, "DIA_Leaf_CristalPay_11_06"); //Albo co? Schowaj ten patyk, zanim komu� stanie si� krzywda.
	AI_RemoveWeapon (other);
	B_LogEntry		(CH1_RBL_ArrowCristal, "Leaf zabra� rud�, ale nic nie powiedzia�. Cholerny sukinsyn!");
	
   Info_ClearChoices (DIA_Leaf_CristalPay);
	Info_AddChoice (DIA_Leaf_CristalPay, "Czas na lanie.", DIA_Leaf_CristalPay_Yes);
	Info_AddChoice (DIA_Leaf_CristalPay, "Jeszcze tu wr�c�!", DIA_Leaf_CristalPay_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Leaf_CristalPay_Yes()
{
	quentin_fight = TRUE;
	AI_Output (other, self, "DIA_Leaf_CristalPay_Yes_15_01"); //Czas na lanie.
	AI_Output (self, other, "DIA_Leaf_CristalPay_Yes_07_02"); //O, pieseczek pokaza� z�bki.
	AI_Output (self, other, "DIA_Leaf_CristalPay_Yes_07_03"); //Zaraz zaczniesz skowyta�!
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ------------------No----------------

FUNC VOID DIA_Leaf_CristalPay_No()
{
	AI_Output (other, self, "DIA_Leaf_CristalPay_No_15_01"); //Jeszcze tu wr�c�!
	AI_RemoveWeapon (self);
	AI_Output (self, other, "DIA_Leaf_CristalPay_No_11_02"); //No c�, smr�d zawsze wraca. Nic na to nie poradz�...
	B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Leaf_Beer (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 13;
	condition		= DIA_Leaf_Beer_Condition;
	information		= DIA_Leaf_Beer_Info;
	permanent		= 0;
	important		= 0;
	description		= "Napijesz si�?"; 
};

FUNC INT DIA_Leaf_Beer_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_Leaf))&&(NPC_HasItems(other,ItFobeer)>=2)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Beer_Info()
{
	AI_Output (other, self, "DIA_Leaf_Beer_15_01"); //Napijesz si�?
	AI_Output (self, other, "DIA_Leaf_Beer_11_02"); //W ko�cu zaczynasz rozmow� jak kurtu... kultru... porz�dny cz�ek.
	AI_Output (other, self, "DIA_Leaf_Beer_15_03"); //Twoje zdrowie, Leaf!
	B_GiveInvItems (other, self, ItFoBeer, 1);

	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
	AI_UseItem (other,ItFobeer);
	AI_UseItem (self,ItFobeer);

	AI_Output (self, other, "DIA_Leaf_Beer_11_04"); //Wiesz co? Rozczuli�e� mnie. O co chodzi z tym kryszta�em?
	AI_Output (other, self, "DIA_Leaf_Beer_15_05"); //�wistak ubzdura� sobie, �e z metalu zawartego w meteorycie mo�na wytopi� groty �ywio��w.
	AI_Output (self, other, "DIA_Leaf_Beer_11_06"); //Rozumiem. Dobra, powiem Ci co wiem.
	AI_Output (self, other, "DIA_Leaf_Beer_11_07"); //By�em na polowaniu. Mia�em straszne gazy po gulaszu Snafa... Polaz�em w krzaki i nagle jak nie pierdylnie!
	AI_Output (self, other, "DIA_Leaf_Beer_11_08"); //Najpierw my�la�em, �e to ja. Ale p�niej zobaczy�em dymi�c� dziur� i bij�cy z niej trupi blask.
	AI_Output (self, other, "DIA_Leaf_Beer_11_09"); //Ledwo zd��y�em portki podci�gn�� tak stamt�d wia�em!
	AI_Output (other, self, "DIA_Leaf_Beer_15_10"); //Gdzie znajd� ten krater?
	AI_Output (self, other, "DIA_Leaf_Beer_11_11"); //Przed bagnami skr�� w lewo do lasu. Id� tak, aby mie� po prawej ska�y, p�niej skr�� w lewo. 
	AI_Output (self, other, "DIA_Leaf_Beer_11_12"); //Gdzie� tam jest taka paskudna dziura...
	AI_Output (self, other, "DIA_Leaf_Beer_11_13"); //Tylko uwa�aj na wilki i cieniostwory, pe�no tam tego si� wa��sa.
	B_LogEntry		(CH1_RBL_ArrowCristal, "Piwo pomog�o. Leaf zdradzi� mi, gdzie szuka� krateru. Przed bagnami musz� skr�ci� w lewo, mam i�� kawa�ek maj�c po prawej ska�y po czym skr�ci� w lewo w las. Gdzie� tam znajd� kryszta�. Musz� uwa�a� na wilki i cieniostwory.");
};

/*********************************
Ork za��czam opis Laviusa. Zr�b to jako� fajnie ;P

Dostajemy map� z po�o�eniem kryszta�u, gdzie to ma by� zamieszcz� p�niej screena - screena nie ma, wi�c da�em t� dziur� bo po co kombinowa�, opis celowo niedok�adny, �eby gracze troch� po�azili [sher]. 
W ka�dym razie idziemy tam i podchodzimy do kryszta�u. 
Je�li Rick ma przy sobie strza�y to zmieniaj� one form� w ogniowe i upadaj� na ziemie. 
Rick NIE mo�e ich podnie��. Podchodzi on do kryszta�u i zabiera go. 
W momencie gdy go podnosi podbiega do niego z 5 �cierwojad�w przemalowanych na fioletowo. 
Niech one maj� takie same obra�enia jak normalne tyle �e maj� tak z 3 razy wi�cej �ycia. 
Rick je ubija i idzie do obozu. 

I tu pro�ba do Orc'a: Je�li dobrze wiem to ty jeste� odpowiedzialny za animacj� ubijania modzie Kolonia �ywych Trup�w czy jako� tak to by�o. 
Pasowa�aby taka animacja �e kiedy przechodzimy obok kogo� z kryszta�em robi on krok w ty� i wyrzuca p�on�ce lub mro��ce strza�y. 
W ka�dym razie Rick dociera do �wistaka. Gdy podchodzi do niego wypadaj� mu z r�k strza�y ogniste. Podchodzi on do nas i zagaduj...

------------------------

Czyli teraz dialog �wistaka...

**********************************/

// **************************************************

INSTANCE DIA_Leaf_Stone (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 14;
	condition		= DIA_Leaf_Stone_Condition;
	information		= DIA_Leaf_Stone_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl�dasz jak struty."; 
};

FUNC INT DIA_Leaf_Stone_Condition()
{
	if (Kapitel>=3)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Stone_Info()
{
	AI_Output (other, self, "DIA_Leaf_Stone_15_01"); //Wygl�dasz jak struty.
	AI_Output (self, other, "DIA_Leaf_Stone_11_02"); //Ech... Dowiedzia�em si� czego� za co warto zabi�, ale sprawa utkn�a w martwym punkcie.
	AI_Output (other, self, "DIA_Leaf_Stone_15_03"); //Co to za matactwo?
	AI_Output (self, other, "DIA_Leaf_Stone_11_04"); //Powiem Ci pod warunkiem, �e mi pomo�esz. Dla takiego twardziela jak Ty to powinna by� pestka.
	AI_Output (other, self, "DIA_Leaf_Stone_15_05"); //Czuj�, �e b�d� tego �a�owa�...
	AI_Output (self, other, "DIA_Leaf_Stone_11_06"); //Wr�� jak zmienisz zdanie.
};

// **************************************************

INSTANCE DIA_Leaf_StoneOk (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 15;
	condition		= DIA_Leaf_StoneOk_Condition;
	information		= DIA_Leaf_StoneOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, zaryzykuj�. O co chodzi?"; 
};

FUNC INT DIA_Leaf_StoneOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_Stone))
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_StoneOk_Info()
{
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_01"); //Dobra, zaryzykuj�. O co chodzi?
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_02"); //A jednak masz jaja.
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_03"); //Kupi�em pewn� ksi�g�. Kto� znalaz� wolumin w Klasztorze Zmiennokszta�tnych. 
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_04"); //Przeczyta�em tam bardzo ciekaw� historyjk� o kamieniu filozoficznym i magach, kt�rzy rzekomo odkryli jego tajemnic�. Magowi ci podobno mieli swoj� siedzib� na terenie Kolonii.
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_05"); //A gdzie dok�adnie?
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_06"); //W Kanionie Trolli.
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_07"); //Chyba przesadzi�e�... I ja mam tam p�j�� dobrowolnie?!
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_08"); //Wiesz czym jest kamie� filozoficzny?
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_09"); //Obawiam si�, �e za chwil� si� dowiem.
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_10"); //To cudo zapewnia posiadaczowi �ycie wieczne i to w dobrobycie!
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_11"); //Aha. Wiesz co, chyba zostawi�em mi�so na patelni...
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_12"); //Tak �atwo si� nie wywiniesz. Przecie� nie z�amiesz danego s�owa?
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_13"); //Niech to szlag. Dobra, czego dok�adnie mam szuka�?
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_14"); //No... kamienia. Wys�a�em ju� kilka os�b, ale do tej pory nikt nie wr�ci�.
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_15"); //To mnie podnios�e� na duchu. 
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_16"); //P�jd� do Kanionu Trolli i zobacz� co tam znajd�. A gdzie to jest?
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_17"); //Pomi�dzy �cie�k� do Placu Wymian, a kopalni� Gomeza. Nie da si� tam nie trafi�. Je�eli odnajdziesz kamie�, oboje b�dziemy op�ywa� w bogactwach!
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_18"); //�ycz mi szcz�cia, bo czuj�, �e b�d� go potrzebowa�.
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_19"); //Tak, powodzenia. Przynie� m�j kamie� jak najszybciej!

	Log_CreateTopic	(CH1_RBL_Stone, LOG_MISSION);
	Log_SetTopicStatus	(CH1_RBL_Stone, LOG_RUNNING);
	B_LogEntry		(CH1_RBL_Stone, "Kamie� filozoficzny, kt�ry zapewnia wieczne i dostatnie �ycie. No c�, podobno mog� co� znale�� w Kanionie Trolli. Drogi do kanionu mam szuka� pomi�dzy �cie�k� prowadz�c� do Placu Wymian a kopalni� Gomeza. Cholera, �eby tylko piraci nie dowiedzieli si� w jakim idioty�mie bior� udzia�...");
	
	Wld_InsertNpc		(RBL_4128_DeathRebel,"SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE_BODY1");	
	var C_NPC rbl; rbl = Hlp_GetNpc(RBL_4128_DeathRebel);
	B_ChangeAttribute	(rbl, ATR_HITPOINTS, -rbl.attribute[ATR_HITPOINTS_MAX]);
	Wld_InsertNpc		(RBL_4127_DeathRebel,"SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE_BODY2");
	rbl = Hlp_GetNpc(RBL_4127_DeathRebel);	
	B_ChangeAttribute	(rbl, ATR_HITPOINTS, -rbl.attribute[ATR_HITPOINTS_MAX]);	    
};
/*********************************
Ork teraz twoja brocha. Trzeba do Kanionu wsadzi� skrzyni� a do niej t� notatk� stone_note + kilka cia� rebeliant�w i szkielety dooko�a + kilka czarnych i kilkana�cie zielonych goblin�w
Jak gracz przeczyta to pojawi si� mag-szaleniec Non_4122_Kafu, ale to ju� moja dzia�a ;P
Aha ten mag mia� mie� niby szat� ziemi, ale nie znalaz�em w itemach to da�em mu szat� s�dziego - jak chcesz to zmie�.
**********************************/

// **************************************************

INSTANCE DIA_Leaf_StoneHave (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 16;
	condition		= DIA_Leaf_StoneHave_Condition;
	information		= DIA_Leaf_StoneHave_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zdoby�em kamie�!"; 
};

FUNC INT DIA_Leaf_StoneHave_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kafu_Hallo))&&(Npc_KnowsInfo (hero, DIA_Leaf_StoneOk))&&(NPC_HasItems(other,Fil_Stone)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_StoneHave_Info()
{
	AI_Output (other, self, "DIA_Leaf_StoneHave_15_01"); //Zdoby�em kamie�!
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_02"); //B�d� bogaty! B�d� bogiem! Daj mi to!
	
   B_GiveInvItems (other, self, Fil_Stone, 1);
	
   AI_Output (self, other, "DIA_Leaf_StoneHave_11_03"); //Co� ma�y ten kamie�...
	AI_Output (other, self, "DIA_Leaf_StoneHave_15_04"); //To tylko odprysk. Ale dzi�ki niemu mag, kt�rego zabi�em prze�y� kilka wiek�w.
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_05"); //Jak si� tego u�ywa?
	AI_Output (other, self, "DIA_Leaf_StoneHave_15_06"); //Nie mam poj�cia.
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_07"); //Hmm. Mo�e to po�kn� i popij� piwem...
	AI_Output (other, self, "DIA_Leaf_StoneHave_15_08"); //Tak, to �wietny pomys�... (co za idiota)
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_09"); //Co tam mruczysz?
	AI_Output (other, self, "DIA_Leaf_StoneHave_15_10"); //Nic, nic. Smacznego.
	
   CreateInvItems	(self, ItFoBeer, 1);
	AI_UseItem (self,ItFobeer);
	Npc_RemoveInvItems(self,Fil_Stone,1);
	
   AI_Output (self, other, "DIA_Leaf_StoneHave_11_11"); //Co� dziwnie si� czuj�... 
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_12"); //Dlaczego wszystko si� kr�ci?
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_13"); //Ja...
	B_LogEntry		(CH1_RBL_Stone, "�wietnie. Ten idiota Leaf po�kn�� odprysk kamienia filozoficznego i straci� przytomno��. Musz� jako� powiedzie� o tym Cavalornowi...");

	Npc_ExchangeRoutine	(self, "DRAINED"); 
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Leaf_StoneFinished (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 17;
	condition		= DIA_Leaf_StoneFinished_Condition;
	information		= DIA_Leaf_StoneFinished_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leaf_StoneFinished_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_LeafOk))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_StoneFinished_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other, "DIA_Leaf_StoneFinished_11_01"); //Strasznie boli mnie g�owa. Co si� sta�o?
	AI_Output (other, self, "DIA_Leaf_StoneFinished_15_02"); //Straci�e� przytomno��. To chyba nie by�o zbyt m�dre, �eby po�yka� odprysk...
	AI_Output (self, other, "DIA_Leaf_StoneFinished_11_03"); //Chyba troch� mnie ponios�o...
	AI_Output (self, other, "DIA_Leaf_StoneFinished_11_04"); //Dzi�ki za uratowanie dupska. We� to, solidnie zapracowa�e� na ten pier�cie�.

	/*****************
Ork daj dickowi jaki� pier�cie� czy co tam chcesz
*******************/

	AI_Output (other, self, "DIA_Leaf_StoneFinished_15_05"); //Dzi�ki, Leaf. I staraj si� ju� nie po�yka� nic magicznego.
	AI_Output (self, other, "DIA_Leaf_StoneFinished_11_06"); //Spadaj!
	Log_SetTopicStatus	(CH1_RBL_Stone, LOG_SUCCESS);
	B_LogEntry		(CH1_RBL_Stone, "I po sprawie. Leaf niestety wr�ci� do formy. A kamie� filozoficzny... No c�, czeka go chyba niez�e zatwardzenie.");
}; 

instance Info_Leaf_Choice (C_INFO)
{
	npc			= RBL_4011_Leaf;
	condition	= Info_Leaf_Choice_Condition;
	information	= Info_Leaf_Choice_Info;
	important	= 0;
	permanent	= 0;
	description = "Mam do ciebie spraw�.";
};

FUNC int  Info_Leaf_Choice_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_RBL_2617_Carlson_armor))
	{
		return TRUE;
	};
};

FUNC void  Info_Leaf_Choice_Info()
{
	AI_Output 		(hero, self,"Info_Leaf_Choice_15_01"); //Mam do ciebie spraw�.
	AI_Output 		(self, hero,"Info_Leaf_Choice_14_02"); //Czego znowu chcesz?
   AI_Output 		(hero, self,"Info_Leaf_Choice_15_03"); //Podobno zyskujesz rud� od Carlsona i od razu m�wi�, �e masz z tym natychmiast sko�czy�!
   AI_Output 		(self, hero,"Info_Leaf_Choice_14_04"); //Bo co mi zrobisz?

	Info_ClearChoices (Info_Leaf_Choice);
	Info_AddChoice (Info_Leaf_Choice, "Po prostu waln� w tw�j pusty �eb.", Info_Leaf_Choice_Yes);
	Info_AddChoice (Info_Leaf_Choice, "A dobre piwko?", Info_Leaf_Choice_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID Info_Leaf_Choice_Yes()
{
	AI_Output 		(hero, self,"Info_Leaf_Choice_Yes_15_01"); //Po prostu waln� w tw�j pusty �eb.
	AI_Output 		(self, hero,"Info_Leaf_Choice_Yes_14_02"); //Chcesz si� bi�? Prosz� bardzo.
   
   B_LogEntry		(CH2_RBL_armor, "No c�, musz� znowu mu pokaza�, gdzie jego miejsce.");
   Info_ClearChoices (Info_Leaf_Choice);
   B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ---------------------------No----------------------------------------

FUNC VOID Info_Leaf_Choice_No()
{
	AI_Output 		(hero, self,"Info_Leaf_Choice_Nugget_15_01"); //A dobre piwko?
	AI_Output 		(self, hero,"Info_Leaf_Choice_Nugget_14_02"); //Zapomnij, teraz mam taki zarobek, �e nawet starczy mi alkohol do ko�ca mych dni.	
};

// **************************************************

INSTANCE DIA_Leaf_armor2 (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 15;
	condition		= DIA_Leaf_armor2_Condition;
	information		= DIA_Leaf_armor2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przestaniesz tru� dup� Carlsonowi, czy mamy kontynuowa�?"; 
};

FUNC INT DIA_Leaf_armor2_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Leaf_Choice))
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_armor2_Info()
{
	AI_Output (other, self, "DIA_Leaf_armor2_15_01"); //Wi�c jak? Przestaniesz tru� dup� Carlsonowi, czy mamy kontynuowa�?
	AI_Output (self, other, "DIA_Leaf_armor2_11_02"); //Niech ci� szlag trafi, dobra przestan� wyciska� od niego rud�, a teraz wyno� si� z moich oczu. 
	
	B_LogEntry		(CH2_RBL_armor, "I po sprawie, g�adko posz�o teraz mog� wr�ci� do Carlsona.");
};