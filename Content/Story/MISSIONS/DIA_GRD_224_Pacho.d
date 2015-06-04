func void PACHO_OPEN_CHEST_SCRIPT()
{
	Mis_Pacho_ChestOpened=TRUE;	
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Pacho_Exit (C_INFO)
{
	npc			= GRD_224_PACHO;
	nr			= 999;
	condition	= DIA_Pacho_Exit_Condition;
	information	= DIA_Pacho_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pacho_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Pacho_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Pacho_Hello (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 1;
	condition		= DIA_Pacho_Hello_Condition;
	information		= DIA_Pacho_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pacho_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 250)//A wlasnie ze powinno byc shergar, inaczej zagaduje do nas spod p�ki skalnej
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_Hello_Info()
{
	AI_TurnToNpc (Skorpio,other);
	AI_TurnToNpc (self,other);		
	Ai_Wait (self,1);//10sek WTF?	
	AI_Output (other, self, "DIA_Pacho_Hello_15_01"); //Co si� tak gapisz?
	AI_Output (self, other, "DIA_Pacho_Hello_11_02"); //Ekkhhhrrr... Khhhrrrr...

	AI_Output (other, self, "DIA_Pacho_Hello_15_03"); //Nie udawaj idioty. Je�eli pr�bujesz mnie sprowokowa�, to �wietnie Ci idzie...
	//AI_DrawWeapon (hero);
	B_ExchangeRoutine(Skorpio, "FOLLOW");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_Mixture (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 2;
	condition		= DIA_Pacho_Mixture_Condition;
	information		= DIA_Pacho_Mixture_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pacho_Mixture_Condition()
{
	if (NPC_HasItems(hero,aloes_mixture)>=1)&&(aloes_find==2)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_Mixture_Info()
{
	B_GiveXP(500);
	B_GiveInvItems (other, self, aloes_mixture, 1);
   
	AI_Output (other, self, "DIA_Pacho_Mixture_15_01"); //Esencja strasznie cuchnie, ale powinna pom�c.
	AI_Output (other, self, "DIA_Pacho_Mixture_15_02"); //Jeste� got�w?
   
	if (C_BodystateContains(self, BS_SIT))
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
   
	AI_TurnToNpc (self, other);
   
	AI_Output (other, self, "DIA_Pacho_Mixture_15_03"); //To do dna. 
   
	AI_Wait(self,3);
	AI_UseItem (self,aloes_mixture);
	AI_Wait(self,1);	
	
	AI_PlayAni		(self,	"T_PSI_VICTIM");	
	AI_Output (other, self, "DIA_Pacho_Mixture_15_04"); //Wszystko w porz�dku?
	AI_Output (self, other, "DIA_Pacho_Mixture_11_05"); //Khhrr... Ehmmm... Ta.
	AI_Output (self, other, "DIA_Pacho_Mixture_11_06"); //Ja... M�wi�....!
	AI_Output (self, other, "DIA_Pacho_Mixture_11_07"); //Dzi�ki przyjacielu! Wskocz� za Tob� w ka�dy ogie�!
	AI_Output (other, self, "DIA_Pacho_Mixture_15_08"); //Nigdzie nie musisz wskakiwa�, wystarczy, �e oka�esz sw� wdzi�czno��...
	AI_Output (self, other, "DIA_Pacho_Mixture_11_09"); //We� t� rud�, nale�y Ci si� jak jasna cholera.
   
	CreateInvItems (self,ItMiNugget,100);//ruda
	B_GiveInvItems (self, other, ItMiNugget, 100);
	Log_SetTopicStatus	(CH1_Rbl_Plant, LOG_SUCCESS);
	B_LogEntry		(CH1_Rbl_Plant, "Mikstura zadzia�a�a i Pacho odzyska� g�os. Musz� przyzna�, �e jego hojno�� mnie zadziwi�a.");	
	B_StopProcessInfos(self);
	self.voice = 10;//make pacho have voice back ;-)
};

INSTANCE DIA_Pacho_GoOut (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 3;
	condition		= DIA_Pacho_GoOut_Condition;
	information		= DIA_Pacho_GoOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pacho_GoOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Scorpio_GoOut))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_GoOut_Info()
{
	pacho_trust = TRUE;
	B_GiveXP(200);
	B_FullStop (hero);
	AI_GotoNpc(self,other);
   
	AI_Output (self, other, "DIA_Pacho_GoOut_11_01"); //Jeszcze raz dzi�kuj� za wszystko. 
	AI_Output (self, other, "DIA_Pacho_GoOut_11_02"); //Kiedy� Ci si� odwdzi�cz�, przyjacielu.
	AI_Output (other, self, "DIA_Pacho_GoOut_15_03"); //Trzymam Ci� za s�owo.
	AI_Output (self, other, "DIA_Pacho_GoOut_11_04"); //We� t� mikstur�. Mi si� ju� nie przyda.
	
   CreateInvItems (self,ItFo_Potion_Health_Perma_03,1);
	B_GiveInvItems (self, other, ItFo_Potion_Health_Perma_03, 1);
	B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_Map (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 4;
	condition		= DIA_Pacho_Map_Condition;
	information		= DIA_Pacho_Map_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam do Ciebie pytanie."; 
};

FUNC INT DIA_Pacho_Map_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_Scorpio_Map))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_Map_Info()
{
	AI_Output (other, self, "DIA_Pacho_Map_15_01"); //Mam do Ciebie pytanie.
	AI_Output (self, other, "DIA_Pacho_Map_11_02"); //Pytaj przyjacielu.
	AI_Output (other, self, "DIA_Pacho_Map_15_03"); //Skorpion potrzebowa� map� Kolonii. Uda�o mi si� jedn� dla niego zdoby�. Nie chcia� jednak powiedzie� nic wi�cej.
	AI_Output (self, other, "DIA_Pacho_Map_11_04"); //Ka�dy ma swoje tajemnice...
	AI_Output (other, self, "DIA_Pacho_Map_15_05"); //Co chcesz przez to powiedzie�?
	AI_Output (self, other, "DIA_Pacho_Map_11_06"); //Ano to, �e o niekt�rych sekretach lepiej nie wiedzie�, bo d�u�ej si� wtedy �yje.
	AI_Output (other, self, "DIA_Pacho_Map_15_07"); //Rozumiem, �e to nie moja sprawa.
	AI_Output (self, other, "DIA_Pacho_Map_11_08"); //I tak, i nie.
	AI_Output (other, self, "DIA_Pacho_Map_15_09"); //Kontynuuj.
	AI_Output (self, other, "DIA_Pacho_Map_11_10"); //Lepiej, �eby to co teraz powiem, zosta�o mi�dzy nami.
	
   AI_PlayAni(other,"T_YES");
	
   AI_Output (self, other, "DIA_Pacho_Map_11_11"); //Skorpion i ja mamy pewien uk�ad, kt�ry od jakiego� czasu sta� si� niewygodny dla nas obu.
	AI_Output (self, other, "DIA_Pacho_Map_11_12"); //Dzi�ki Tobie odzyska�em g�os... Potraktuj to co powiem jako wyraz wdzi�czno�ci.
	AI_Output (self, other, "DIA_Pacho_Map_11_13"); //Ja i Skorpion ukradli�my Gomezowi sporo z jego zapas�w rudy.
	AI_Output (other, self, "DIA_Pacho_Map_15_14"); //�e co?! I wy jeszcze �yjecie?
	AI_Output (self, other, "DIA_Pacho_Map_11_15"); //To by�a dobrze zaplanowana akcja.
	AI_Output (self, other, "DIA_Pacho_Map_11_16"); //Skorpion mia� dost�p do zamku i wewn�trznego pier�cienia. Ja by�em zwiadowc�, znam ludzi, koloni� i ekhm... odpowiednie miejsca, �eby si� ukry�.
	AI_Output (self, other, "DIA_Pacho_Map_11_17"); //Skorpion wynosi� rud�, a ja j� ukrywa�em. 
	AI_Output (self, other, "DIA_Pacho_Map_11_18"); //Robili�my to etapami, tak aby magnaci si� nie zorientowali.
	AI_Output (self, other, "DIA_Pacho_Map_11_19"); //Te szumowiny zostawi�y sobie spory zapas na czarn� godzin�.
	AI_Output (self, other, "DIA_Pacho_Map_11_20"); //Niestety Skorpion sta� si� zbyt pazerny. Ostatnim razem pr�cz rudy przyni�s� jeszcze co� cennego, co nale�a�o do Gomeza.
	AI_Output (self, other, "DIA_Pacho_Map_11_21"); //Tym razem mieli�my pecha. Byli�my ju� za bram�, kiedy rozleg� si� alarm. W ostatniej chwili zaszyli�my si� w lesie. 
	AI_Output (self, other, "DIA_Pacho_Map_11_22"); //Biegli�my dop�ki nie mieli�my pewno�ci, �e stra�nicy zgubili nasz trop.
	AI_Output (self, other, "DIA_Pacho_Map_11_23"); //Skorpion wr�ci�, �eby sprawdzi� czy nikt ju� za nami nie pod��a.
	AI_Output (self, other, "DIA_Pacho_Map_11_24"); //Ja wykorzysta�em chwil�, �eby ukry� ostatni �up.
	AI_Output (self, other, "DIA_Pacho_Map_11_25"); //Miejsce wybra�em starannie. Nikt si� tam nie zapuszcza.
	AI_Output (self, other, "DIA_Pacho_Map_11_26"); //Niestety mia�em pecha. Ko�czy�em w�a�nie zakopywa� skarb, kiedy okaza�o si�, �e nie by�em sam.
	AI_Output (self, other, "DIA_Pacho_Map_11_27"); //Nie wiem, co to za bestia by�a. Chlasn�a mnie przez pier�, zanim zorientowa�em si�, co si� dzieje.
	AI_Output (self, other, "DIA_Pacho_Map_11_28"); //Gdyby nie pancerz, przep�aci�bym to �yciem.
	AI_Output (self, other, "DIA_Pacho_Map_11_29"); //Potw�r pochlasta� mi szyj�. Na o�lep siekn��em mieczem i rzuci�em si� do ucieczki.
	AI_Output (self, other, "DIA_Pacho_Map_11_30"); //Nie wiem dlaczego bestia mnie nie wyko�czy�a...
	AI_Output (self, other, "DIA_Pacho_Map_11_31"); //Straci�em przytomno�� gdzie� w lesie.
	AI_Output (self, other, "DIA_Pacho_Map_11_32"); //Tam znalaz� mnie Skorpion. Zatamowa� krwotok i ukrywali�my si�, dop�ki nas nie znalaz�e�.
	AI_Output (other, self, "DIA_Pacho_Map_15_33"); //Ale co ma z tym wsp�lnego mapa Kolonii?
	AI_Output (self, other, "DIA_Pacho_Map_11_34"); //Powiedzia�em Skorpionowi, �e ju� tam nie wr�c�.
	AI_Output (other, self, "DIA_Pacho_Map_15_35"); //Gdzie?
	AI_Output (self, other, "DIA_Pacho_Map_11_36"); //Tam gdzie zakopa�em ostatni, najwi�kszy �up.
	AI_Output (self, other, "DIA_Pacho_Map_11_37"); //Opowiedzia�em mu o bestii, ale si� upar�. Ruda ca�kiem mu przes�oni�a zdrowy rozs�dek.
	AI_Output (self, other, "DIA_Pacho_Map_11_38"); //Pr�bowa�em wyt�umaczy�, gdzie to jest, ale to nie takie proste.
	AI_Output (self, other, "DIA_Pacho_Map_11_39"); //Powiedzia�em, �e wska�� mu to miejsce na mapie.
	AI_Output (other, self, "DIA_Pacho_Map_15_40"); //Rozumiem. A jaka w tym moja rola?
	AI_Output (self, other, "DIA_Pacho_Map_11_41"); //To by�a poka�na sumka. Naprawd� okr�g�a. Do tego ta b�yskotka Gomeza...
	AI_Output (other, self, "DIA_Pacho_Map_15_42"); //Zaczynam rozumie�. Nie zrezygnowa�e� z rudy, ale obawiasz si� bestii.
	AI_Output (self, other, "DIA_Pacho_Map_11_43"); //Dok�adnie. Skorpionowi ju�... nie ufam. Ruda nim zaw�adn�a. 
	AI_Output (self, other, "DIA_Pacho_Map_11_44"); //Gdybym z nim poszed�, to pewnie zosta�bym tam na wieki z no�em w plecach.
	AI_Output (self, other, "DIA_Pacho_Map_11_45"); //Ty... wzbudzasz zaufanie. A przede wszystkim pomog�e�, kiedy tego najbardziej potrzebowa�em.
	AI_Output (self, other, "DIA_Pacho_Map_11_46"); //Dlaczego nie mieliby�my na tym skorzysta� obaj?
	AI_Output (self, other, "DIA_Pacho_Map_11_47"); //Podzielimy si� r�wno po po�owie, do tego mo�esz wzi�� b�yskotk� Gomeza.
	AI_Output (other, self, "DIA_Pacho_Map_15_48"); //Jestem piratem. Sk�d pewno��, �e nie poder�n� Ci gard�a, kiedy ju� b�dziemy na miejscu?
	AI_Output (self, other, "DIA_Pacho_Map_11_49"); //Znam si� na ludziach. Co Ty na to?

	Info_ClearChoices (DIA_Pacho_Map);
	Info_AddChoice (DIA_Pacho_Map, "�yje si� tylko raz.", DIA_Pacho_Map_Yes);
	Info_AddChoice (DIA_Pacho_Map, "Wol� nie ryzykowa�.", DIA_Pacho_Map_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Pacho_Map_Yes()
{
	pacho_ore = TRUE;
   
	AI_Output (other, self, "DIA_Pacho_Map_Yes_15_01"); //�yje si� tylko raz. Niech b�dzie.
	AI_Output (self, other, "DIA_Pacho_Map_Yes_11_02"); //Nie b�dziesz �a�owa�!
	AI_Output (self, other, "DIA_Pacho_Map_Yes_11_03"); //Wyruszymy wieczorem, pod os�on� nocy nie b�dziemy tak si� rzuca� w oczy.
	AI_Output (self, other, "DIA_Pacho_Map_Yes_11_04"); //Wr�� jak b�dziesz got�w.	
	
   Log_CreateTopic(CH1_Rbl_Ore, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Ore, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Ore, "Zgodzi�em si� pom�c Pacho w odkopaniu rudy, kt�r� wraz ze Skorpionem ukradli Gomezowi. To mo�e by� niebezpieczne przedsi�wzi�cie, ale czasami trzeba zaryzykowa�, �eby si� ob�owi�. Wyruszymy, gdy zapadnie zmrok.");
	B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Pacho_Map_No()
{
	AI_Output (other, self, "DIA_Pacho_Map_No_15_01"); //Wol� nie ryzykowa�. Rad� sobie sam, ja nie potrzebuj� tej rudy.
	AI_Output (self, other, "DIA_Pacho_Map_No_11_02"); //Twoja strata. Jednak pomyli�em si� co do Ciebie...
	B_StopProcessInfos(self);
};

var int pacho_time_check;

INSTANCE DIA_Pacho_Journey (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 5;
	condition		= DIA_Pacho_Journey_Condition;
	information		= DIA_Pacho_Journey_Info;
	permanent		= 1;
	important		= 0;
	description		= "Jestem got�w."; 
};

FUNC INT DIA_Pacho_Journey_Condition()
{
	if (pacho_ore == TRUE)&&(pacho_time_check == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_Journey_Info()
{
	AI_Output (other, self, "DIA_Pacho_Journey_15_01"); //Jestem got�w.
   
	if (Wld_IsTime (21,00,04,00))
	{
		pacho_time_check = TRUE;
      
		AI_Output (self, other, "DIA_Pacho_Journey_11_02"); //�wietnie. Ruszajmy wi�c.
		AI_Output (self, other, "DIA_Pacho_Journey_11_03"); //Tylko pami�taj, �e nie powinni�my rzuca� si� w oczy.
		
      if (scorpio_traitor == TRUE)
		{
			AI_Output (other, self, "DIA_Pacho_Journey_15_04"); //Oczywi�cie.
			AI_Quicklook(self, Skorpio);
			AI_TurnToNpc(self, Skorpio);
			AI_PlayAni(self, "t_ComeOverHere");
			B_LogEntry(CH1_Rbl_Ore, "Da�em znak Skorpionowi, �eby za nami pod��y�.");
		};
      
		B_LogEntry(CH1_Rbl_Ore, "Wyruszy�em z Pacho do miejsca, gdzie zakopa� rud� Gomeza. Musimy zachowa� ostro�no��...");
		Party_AddNpc(self);

		Npc_ExchangeRoutine(self, "pachotreasure");
		self.flags=NPC_FLAG_FRIEND;
		B_SetPermAttitude(self,ATT_FRIENDLY);
	}
	else
	{
		AI_Output (self, other, "DIA_Pacho_Journey_11_05"); //Wyruszymy kiedy zapadnie zmrok...
	};
   
   B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_JourneyEnd (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 6;
	condition		= DIA_Pacho_JourneyEnd_Condition;
	information		= DIA_Pacho_JourneyEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_JourneyEnd_Condition()
{
	if (pacho_time_check == TRUE)&&(Npc_GetDistToWP (self,"OW_PATH_OW_PATH_WARAN05_SPAWN01") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_JourneyEnd_Info()
{
	B_FullStop (self);
	B_FullStop (other);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other, self);

	AI_Output (self, other, "DIA_Pacho_JourneyEnd_11_01"); //Jeste�my ju� prawie na miejscu!

	B_LogEntry(CH1_Rbl_Ore, "Dotarli�my ju� prawie na miejsce. Teraz musimy tylko znale�� miejsce ukrycia rudy.");
	Party_AddNpc(self);

	B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_OreEnd (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 7;
	condition		= DIA_Pacho_OreEnd_Condition;
	information		= DIA_Pacho_OreEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_OreEnd_Condition()
{
	if (pacho_time_check == TRUE)&&(Npc_GetDistToWP (self,"OW_PATH_MIS_PACHO_TREASURE") < 600 )
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_OreEnd_Info()
{
	B_GiveXP(300);

	AI_Output (self, other, "DIA_Pacho_OreEnd_11_01"); //Tak, poznaj� to miejsce!
	AI_Output (self, other, "DIA_Pacho_OreEnd_11_02"); //Tutaj trzeba kopa�...
   
	AI_PlayAni(self,"T_PLUNDER");
	
   B_LogEntry(CH1_Rbl_Ore, "Pacho pokaza� mi miejsce, w kt�rym zakopa� rud�. Nie pozostaje mi nic innego jak wykopa� te bogactwa.");
	Party_RemoveNpc(self);

	B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_OreDig (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 8;
	condition		= DIA_Pacho_OreDig_Condition;
	information		= DIA_Pacho_OreDig_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_OreDig_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pacho_OreEnd))&&(Mis_PachoSplit)&&((!C_BodyStateContains(hero, BS_INVENTORY))
   &&(!C_BodyStateContains(hero, BS_MOBINTERACT_INTERRUPT)))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_OreDig_Info()
{
	B_FullStop (other);
	AI_TurnToNpc(other, self);
	AI_GotoNpc(other, self);
   
	AI_Output (self, other, "DIA_Pacho_OreDig_11_01"); //Wykopa�e� wszystko! Daj mi moj� cz�� i uciekajmy zanim...
	B_LogEntry(CH1_Rbl_Ore, "Po wykopaniu rudy Pacho za��da� swojej cz�ci.");
   
	if (scorpio_traitor == TRUE)
	{
		AI_wait(self, 0.5);	
		AI_Output (self, other, "DIA_Pacho_OreDig_11_02"); //Co on tu robi?! 
		AI_TurnToNpc(self, other);
		AI_Output (self, other, "DIA_Pacho_OreDig_11_03"); //Zdrajca!
		B_LogEntry(CH1_Rbl_Ore, "Pacho niezbyt ucieszy� si� na widok Skorpiona.");
	}
	else
	{
		AI_TurnToNpc(self, hrabia);
		AI_wait(self, 0.5);		
		AI_Output (self, other, "DIA_Pacho_OreDig_11_04"); //Kto� si� tam czai!
		AI_Output (other, self, "DIA_Pacho_OreDig_15_05"); //Kto to do cholery jest?!
		B_LogEntry(CH1_Rbl_Ore, "Kto� nas zaskoczy� po wykopaniu rudy...");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_Pacho_AfterDigEnd (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 9;
	condition		= DIA_Pacho_AfterDigEnd_Condition;
	information		= DIA_Pacho_AfterDigEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pacho_AfterDigEnd_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_Hrabia_Ore))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_AfterDigEnd_Info()
{
	if (scorpio_traitor == TRUE)
	{
		AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_01"); //Cholerny zdrajca! Masz szcz�cie, �e �yjemy.
	}
	else
	{
		AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_02"); //Jednak prze�y�e�!
	};
   
	AI_Output (other, self, "DIA_Pacho_AfterDigEnd_15_03"); //Mam silny instynkt samozachowawczy.
	AI_Output (other, self, "DIA_Pacho_AfterDigEnd_15_04"); //Kim by� ten... z�odziej?
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_05"); //Wiem tylko, �e lepiej schodzi� mu z drogi.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_06"); //Nazywa si� Hrabia.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_07"); //Czasami widywa�em go, jak zapuszcza� si� sam na tereny ork�w.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_08"); //Raz za nim poszed�em.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_09"); //Kiedy natrafi�em na kilkana�cie wyr�ni�tych warg�w i kilka martwych patroli ork�w, wr�ci�em.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_10"); //Za Hrabi� kroczy �mier� piracie i lepiej nie wchodzi� mu w drog�.
	AI_Output (other, self, "DIA_Pacho_AfterDigEnd_15_11"); //A co z rud� Gomeza?
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_12"); //Je�eli Hrabia po�o�y� na niej �apy, to lepiej o niej zapomnij. Szkoda stawia� �ycie za kilka bry�ek.
	AI_Output (other, self, "DIA_Pacho_AfterDigEnd_15_13"); //Ja tak �atwo nie zapominam...
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_14"); //To ju� Twoja sprawa. Ja tam wiem swoje. Nie rusz� si� z Obozu Rebeliant�w, cho�by przyszed� tu sam �ni�cy.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_15"); //Mam ju� do�� rudy i ca�ej tej cholernej kolonii!

	Log_SetTopicStatus(CH1_Rbl_Ore, LOG_FAILED);	
	B_LogEntry(CH1_Rbl_Ore, "I ca�� cholern� rud� Gomeza szlag trafi�! Hrabia, kimkolwiek jest, ograbi� mnie z uczciwie ukradzionej rudy magnat�w. Nadejdzie czas gdy wyr�wnam rachunki...");
	
   if (hrabia_log == FALSE)
	{
		hrabia_log = TRUE;
		Log_CreateTopic	(CH1_Rbl_Hrabia, LOG_MISSION);
		Log_SetTopicStatus	(CH1_Rbl_Hrabia, LOG_RUNNING);
	};
   
	B_LogEntry(CH1_Rbl_Hrabia, "Pacho powiedzia� mi, �e gnojek, kt�ry zrabowa� rud� Gomeza to niejaki Hrabia. By�y zwiadowca Gomeza radzi� mi nie wchodzi� mu w drog�. Ja jednak tak �atwo nie zapominam...");
	Npc_ExchangeRoutine(self, "OR");		

	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_GRD_224_PACHO_Stew (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 12;
	condition		= DIA_GRD_224_PACHO_Stew_Condition;
	information		= DIA_GRD_224_PACHO_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie porcj� gulaszu."; 
};

FUNC INT DIA_GRD_224_PACHO_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other, ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_GRD_224_PACHO_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_GRD_224_PACHO_Stew_15_01"); //Mam dla Ciebie porcj� gulaszu.
	AI_Output (self, other, "DIA_GRD_224_PACHO_Stew_11_02"); //Ale� to cuchnie.
	AI_Output (other, self, "DIA_GRD_224_PACHO_Stew_15_03"); //Wiem, ale musz� rozda� wszystkie porcja.
	AI_Output (self, other, "DIA_GRD_224_PACHO_Stew_11_04"); //No dobra wezm� to paskudztwo, ale robi� to tylko dla Ciebie.
	
	B_GiveInvItems(other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Pacho zabra� gulasz, ale tylko ze wzgl�du na mnie."); 
};

/****************************

SIDE QUEST

***************************/

INSTANCE DIA_Pacho_Hunting (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 10;
	condition		= DIA_Pacho_Hunting_Condition;
	information		= DIA_Pacho_Hunting_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pacho_Hunting_Condition()
{
	if (Kapitel>=2)&&(Npc_GetDistToNpc(self, hero) < 600)&&(Npc_KnowsInfo(hero, DIA_Pacho_GoOut))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_Hunting_Info()
{
	B_FullStop (other);
	AI_Output (self, other, "DIA_Pacho_Hunting_11_01"); //Pst! Rick!
	AI_TurnToNpc(other, self);
	AI_Output (other, self, "DIA_Pacho_Hunting_15_02"); //Co tak syczysz?
	AI_Output (self, other, "DIA_Pacho_Hunting_11_03"); //Podejd� na chwil�.
	AI_GotoNpc(other, self);
	AI_Output (other, self, "DIA_Pacho_Hunting_15_04"); //Znowu straci�e� mow�?
	AI_Output (self, other, "DIA_Pacho_Hunting_11_05"); //Nawet mi o tym nie przypominaj...
	AI_Output (self, other, "DIA_Pacho_Hunting_11_06"); //Mam dla Ciebie propozycj�. Chocia� tak mog� Ci si� odwdzi�czy�.
	AI_Output (other, self, "DIA_Pacho_Hunting_15_07"); //O co chodzi?
	AI_Output (self, other, "DIA_Pacho_Hunting_11_08"); //Tutaj nie mo�emy rozmawia�, za du�o w�cibskich uszu.
};

//*************************************************

INSTANCE DIA_Pacho_HuntingOk (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 11;
	condition		= DIA_Pacho_HuntingOk_Condition;
	information		= DIA_Pacho_HuntingOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, prowad�."; 
};

FUNC INT DIA_Pacho_HuntingOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pacho_Hunting))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingOk_Info()
{
	AI_Output (other, self, "DIA_Pacho_HuntingOk_15_01"); //Dobra, prowad�.
	AI_Output (self, other, "DIA_Pacho_HuntingOk_11_02"); //Nie po�a�ujesz.
   
   Npc_ExchangeRoutine(self, "GuideToTalking");
	B_StopProcessInfos(self);
};

//*************************************************

INSTANCE DIA_Pacho_HuntingBegin (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 12;
	condition		= DIA_Pacho_HuntingBegin_Condition;
	information		= DIA_Pacho_HuntingBegin_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingBegin_Condition()
{
	if (Npc_KnowsInfo(hero,  DIA_Pacho_HuntingOk))&&(Npc_GetDistToWP(hero, "WITAMYWHC") < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingBegin_Info()
{
	B_FullStop (other);
	AI_TurnToNpc(other, self);
	AI_GotoNpc(self, other);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_01"); //Tutaj nikt nas nie pods�ucha.
	AI_Output (other, self, "DIA_Pacho_HuntingBegin_15_02"); //M�w o co chodzi.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_03"); //Pods�ucha�em Lerena i Miltena, jak rozmawiali o stadzie czarnych wilk�w, a dok�adnie o przyw�dcy watahy.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_04"); //Dowiedzia�em si� czego� bardzo ciekawego.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_05"); //Podobno k�y przyw�dcy stada maj� bardzo przydatne w�a�ciwo�ci.
	AI_Output (other, self, "DIA_Pacho_HuntingBegin_15_06"); //Czyli jakie?
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_07"); //Je�eli zrobi� z nich gwizdek, to mo�na zyska� sojusznika w walce.
	AI_Output (other, self, "DIA_Pacho_HuntingBegin_15_08"); //Nie rozumiem.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_09"); //Na g�os gwizdka przyb�d� wilki i b�d� walczy� po stronie tego, kto u�y� piszcza�ki.
	AI_Output (other, self, "DIA_Pacho_HuntingBegin_15_10"); //To rzeczywi�cie ciekawe. Oczywi�cie, o ile to prawda.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_11"); //Wiem, ale jest tylko jeden spos�b na to, aby si� o tym przekona�. Musimy zapolowa� na stado czarnych wilk�w.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_12"); //A je�eli gwizdek oka�e si� bujd�, to zawsze mo�esz sprzeda� sw�j kie� magom, he, he.
	AI_Output (other, self, "DIA_Pacho_HuntingBegin_15_13"); //Racja. Dobra, prowad�.

	Log_CreateTopic(CH2_RBL_WhiteTeeth, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_WhiteTeeth, LOG_RUNNING);
	B_LogEntry(CH2_RBL_WhiteTeeth, "Razem z Pacho wyruszy�em na polowanie. Musimy ustrzeli� przyw�dc� stada czarnych wilk�w i zdoby� k�y zwierz�cia. Podobno kiedy zrobi si� z nich gwizdek, mo�na przywo�a� do walki wilka.");

	/*********************
Niech to nie b�dzie za daleko Ork, ale gdzie� w lesie
Dorobi�em te� czarne wilki, ale bez textury + przyw�dc�
Daj im gdzie� wp 6 powinno wystarczy� a� nadto
**********************/

	Wld_InsertNpc(BlackWolf, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(BlackWolf, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(BlackWolf, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(BlackWolf, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(BlackWolf, "OW_PATH_SCAVENGER01_SPAWN01");

	Wld_InsertNpc(BlackWolfBoss, "OW_PATH_SCAVENGER01_SPAWN01");

   var C_NPC Pacho; Pacho = Hlp_GetNpc(GRD_224_PACHO);
   
	Party_AddNpc(Pacho);
	Npc_ExchangeRoutine(Pacho, "GUIDEWOLF");
	B_StopProcessInfos(self);
};

/********************
Zrobi�em tak, �e ten gwizdek przywo�uje Bia�ego K�a, kt�ry od tej pory zostanie ju� z Dickiem for ever ;)
Je�eli to Ci odpowiada to zr�b mu ze 2 komendy chocia�: Chod�, Zosta�.

Jak wolisz to zr�b tak aby gwizdek przywo�ywa� tylko okoliczne wilki, kt�re b�d� walczy� po stronie dicka przez jaki� czas

Decyduj ;P
********************/

//*************************************************

INSTANCE DIA_Pacho_HuntingBeginOk (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 13;
	condition		= DIA_Pacho_HuntingBeginOk_Condition;
	information		= DIA_Pacho_HuntingBeginOk_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingBeginOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pacho_HuntingBegin))&&(Npc_GetDistToWP (self, "MOVEMENT_OW_PATH_SCAVENGER01_SPAWN01") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingBeginOk_Info()
{
	B_FullStop (other);
	AI_GotoNpc(self, other);
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other, "DIA_Pacho_HuntingBeginOk_11_01"); //Jeste�my na miejscu. Nie daj si� osaczy�.
	AI_Output (other, self, "DIA_Pacho_HuntingBeginOk_15_02"); //Zabierzmy si� za te pieseczki.
	
   B_StopProcessInfos(self);
};

//*************************************************

INSTANCE DIA_Pacho_HuntingFinished (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 14;
	condition		= DIA_Pacho_HuntingFinished_Condition;
	information		= DIA_Pacho_HuntingFinished_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingFinished_Condition()
{
	var C_NPC bw; bw = Hlp_GetNpc(BlackWolfBoss);

	if (Npc_KnowsInfo (hero, DIA_Pacho_HuntingBeginOk))&&(Npc_GetDistToNpc(self, hero) < 1000)&&(Npc_IsDead(bw))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingFinished_Info()
{
	var C_NPC bw; bw = Hlp_GetNpc(BlackWolfBoss);

	/**********************
Niech Hark podejdzie gdzie� blisko, najlepiej �eby go nie by�o wida�

***********************/

	var C_NPC hark; hark = Hlp_GetNpc(RBL_2618_HARK);
	Npc_ExchangeRoutine	(hark, "WOLF");

	B_FullStop (other);
	AI_TurnToNpc (self, bw);
	AI_GotoNpc(self, bw);
	CreateInvItems (self, ItAt_BlackWolfTeeth, 1);

	//AI_Output (self, other, "DIA_Pacho_HuntingFinished_11_01"); //
	//AI_Output (other, self, "DIA_Pacho_HuntingFinished_15_02"); //
	B_StopProcessInfos(self);
	AI_PlayAni(self, "T_PLUNDER");
};

//*************************************************

INSTANCE DIA_Pacho_HuntingFinishedOk (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 15;
	condition		= DIA_Pacho_HuntingFinishedOk_Condition;
	information		= DIA_Pacho_HuntingFinishedOk_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingFinishedOk_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_Pacho_HuntingFinished))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingFinishedOk_Info()
{
	var C_NPC hark; hark = Hlp_GetNpc(RBL_2618_HARK);

	B_FullStop (other);
	AI_TurnToNpc (self, other);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Pacho_HuntingFinishedOk_11_01"); //No i po wszystkim!
	AI_Output (other, self, "DIA_Pacho_HuntingFinishedOk_15_02"); //To nie by�o takie proste, jak my�la�em...
	AI_Output (self, other, "DIA_Pacho_HuntingFinishedOk_11_03"); //Wa�ne, �e przyw�dca stada nie �yje. Zrobi�em z k��w piszcza�ki, jedna jest dla Ciebie.
	B_GiveInvItems (self, other, ItAt_BlackWolfTeeth, 1);
	AI_Output (other, self, "DIA_Pacho_HuntingFinishedOk_15_04"); //Dzi�ki, Pacho. Ciekawe czy to rzeczywi�cie zadzia�a?
	AI_TurnToNpc (self, hark);
	AI_Output (self, other, "DIA_Pacho_HuntingFinishedOk_11_05"); //Chyba mamy go�cia...
	AI_TurnToNpc (hero, hark);
	B_StopProcessInfos	(self);
	AI_GotoNpc(hark, hero);
};

//*************************************************

INSTANCE DIA_Pacho_HuntingEnd (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 16;
	condition		= DIA_Pacho_HuntingEnd_Condition;
	information		= DIA_Pacho_HuntingEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hark_Tooth))&&(Npc_GetDistToNpc(self, hero) < 1000) && (pacho_heroservedhark)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingEnd_Info()
{
	B_FullStop (other);
	AI_TurnToNpc (self, other);
	AI_GotoNpc(self, other);

	AI_Output(self, other, "DIA_Pacho_HuntingEnd_11_00"); //Ale z Ciebie mi�czak. Po co ja Ci� zabra�em na polowanie?
	AI_Output(other, self, "DIA_Pacho_HuntingEnd_15_01"); //Czasami mam do�� przemocy...
	Log_SetTopicStatus(CH2_RBL_WhiteTeeth, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_WhiteTeeth, "I po sprawie. Odda�em kie� Harkowi. Zdaje si�, �e straci�em przez to w oczach Pacho.");

	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self, "OR");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_HuntingEnd2 (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 16;
	condition		= DIA_Pacho_HuntingEnd2_Condition;
	information		= DIA_Pacho_HuntingEnd2_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingEnd2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hark_Tooth_after_fight))&&(Npc_GetDistToNpc(self, hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingEnd2_Info()
{
	B_FullStop (other);
	AI_TurnToNpc (self, other);
	AI_GotoNpc(self, other);

	AI_Output(self, other, "DIA_Pacho_HuntingEnd2_11_00"); //Dobrze, �e si� postawi�e�. Tacy jak Hark to najgorsze m�ty, �eruj�ce na s�abszych.
	AI_Output(other, self, "DIA_Pacho_HuntingEnd2_15_01"); //Te� tak uwa�am. Bywaj.
	Log_SetTopicStatus(CH2_RBL_WhiteTeeth, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_WhiteTeeth, "Ju� po wszystkim. Czas wypr�bowa� kie�!");

	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self, "OR");
	B_StopProcessInfos(self);
};