// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_RBL_2613_VAM_Hello (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 1;
	condition		= DIA_RBL_2613_VAM_Hello_Condition;
	information		= DIA_RBL_2613_VAM_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "�adna dzi� pogoda."; 
};

FUNC INT DIA_RBL_2613_VAM_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_RBL_2613_VAM_Hello_Info()
{
	AI_Output (other, self, "DIA_RBL_2613_VAM_Hello_15_01"); //�adna dzi� pogoda.
	AI_Output (self, other, "DIA_RBL_2613_VAM_Hello_11_02"); //Rzeczywi�cie. �liczna bariera ponad g�ow�, a b�oto i ko�ci pod stopami.
	AI_Output (self, other, "DIA_RBL_2613_VAM_Hello_11_03"); //Istny raj.
};

INSTANCE DIA_RBL_2613_VAM_GoBring (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 2;
	condition		= DIA_RBL_2613_VAM_GoBring_Condition;
	information		= DIA_RBL_2613_VAM_GoBring_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jeste� tu jedynym drwalem?"; 
};

FUNC INT DIA_RBL_2613_VAM_GoBring_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RBL_2613_VAM_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2613_VAM_GoBring_Info()
{
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_01"); //Jeste� tu jedynym drwalem?
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_02"); //Niestety tak. Cavalorn chyba zg�upia�, je�eli my�li, �e dam rad� wyci�� ten cholerny las w pojedynk�!
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_03"); //Oczywi�cie 'ch�tnych' do pomocy jest tylu, �e nie spos�b zdecydowa� kogo wybra�.
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_04"); //W�a�nie widz�.
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_05"); //Ale zaraz. Mo�e Tobie si� nudzi, h�?
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_06"); //Niestety nie. 
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_07"); //Tak my�la�em. Ech, przyda�yby si� zwi�zki zawodowe...
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_08"); //Wiesz co, mam dzie� dobroci dla takich jak Ty. Mo�e znajd� kogo�, kto pomo�e Ci przy wyr�bie i docinaniu.
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_09"); //Mo�esz spr�bowa�, ale czarno to widz�. Jak dot�d nie uda�o mi si� nikogo zwerbowa�.
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_10"); //Mo�e zbyt grzecznie prosi�e�?
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_11"); //Staram si� �y� w zgodzie z bli�nimi. Ale jak tak na Ciebie patrz�, to w�tpi�, �e robisz cokolwiek bezinteresownie.
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_12"); //Wystarczy, �e szepniesz za mn� s��wko Cavalornowi. Nic wi�cej.
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_13"); //Rozumiem. Kolejny ch�tny do nadziania si� na miecz czerwonych. 
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_14"); //Ale nie ma sprawy. Je�eli przyprowadzisz mi pomocnika, to wstawi� si� za Tob� u Cavalorna.
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_15"); //Do zobaczenia wkr�tce.
	
   Log_CreateTopic	(CH1_Rbl_Wood, LOG_MISSION);
	B_LogSetTopicStatus	(CH1_Rbl_Wood, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Wood, "Drwal Vam szuka kogo� ch�tnego do pomocy przy wyr�bie i docinaniu. Popytam darmozjad�w z obozu i mo�e uda si� kogo� 'przekona�'. Je�eli znajd� jakiego� 'ochotnika', to mam g�os Vama w kieszeni.");
};

INSTANCE RBL_2613_Vam_Ok (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 3;
	condition		= RBL_2613_Vam_Ok_Condition;
	information		= RBL_2613_Vam_Ok_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przyprowadzi�em Ci pomocnika."; 
};

FUNC INT RBL_2613_Vam_Ok_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RBL_2605_GARRY_After2))&&(garry_out == TRUE)
	{
		return 1;
	};
};

FUNC VOID RBL_2613_Vam_Ok_Info()
{
	vam_trust = TRUE;
	B_GiveXP(150);
	rebel_camp_trust = rebel_camp_trust + 1; 
	var C_NPC garry; garry = Hlp_GetNpc(RBL_2605_GARRY);
   
	AI_Output (other, self, "RBL_2613_Vam_Ok_15_01"); //Przyprowadzi�em Ci pomocnika.
	AI_Output (self, other, "RBL_2613_Vam_Ok_11_02"); //Niech no na niego spojrz�.
	
   AI_TurnToNpc			(other,garry);	
	AI_TurnToNpc			(self,garry);	
	Ai_wait(self,1);
	AI_TurnToNpc			(other,self);
	AI_TurnToNpc			(self,other);	
	//Bugfix: U can't saw by hand o.O
	CreateInvItem			(garry,ItMi_Saw);
	garry.attribute[ATR_HITPOINTS] = 	garry.attribute[ATR_HITPOINTS_MAX];	
   
	AI_Output (other, self, "RBL_2613_Vam_Ok_15_03"); //I co, mo�e by�?
	AI_Output (self, other, "RBL_2613_Vam_Ok_11_04"); //Nie wygl�da na si�acza, co prawda z�by ma prawie wszystkie. Niech si� nachyli, �ci�gnie portki i zakaszle!
	AI_Output (other, self, "RBL_2613_Vam_Ok_15_05"); //Bez przesady. Wystarczy, �e wie, kt�rym ko�cem siekiery trzeba uderza� w pie� drzewa.	
	AI_Output (other, self, "RBL_2613_Vam_Ok_15_06"); //Jak widzisz dotrzyma�em s�owa. Teraz Twoja kolej.
	AI_Output (self, other, "RBL_2613_Vam_Ok_11_07"); //Nie obawiaj si� przyjacielu, s�owo nie dym. Szepn� Cavalornowi za Tob� to i tamto.
   AI_Output (self, other, "RBL_2613_Vam_Ok_11_08"); //W nagrod� mog� pom�c ci zwi�kszy� krzep� i nauczy� otwierania zamk�w.
	AI_Output (self, other, "RBL_2613_Vam_Ok_11_09"); //Aha, jak chcesz mog� te� zaopatrzy� Ci� w r�nego rodzaju drewno. Przyda Ci si� na trzonki do topor�w, do wyrobu �uk�w, b�d� strza� i brzechw.
	AI_Output (other, self, "RBL_2613_Vam_Ok_15_10"); //Dobrze wiedzie�. Bywaj.
	
   B_LogSetTopicStatus	(CH1_Rbl_Wood, LOG_SUCCESS);
	B_LogEntry		(CH1_Rbl_Wood, "Vamowi spodoba� si� nowy pomocnik. Powiedzia� te�, �e zaopatrzy mnie w drewno.");
	B_LogEntry		(CH1_Rbl_RebelCampTrust, "Vam bardzo ucieszy� si� z nowego pomocnika. Dobrze, �e nie wie jaki z Garrego pata�ach. W ka�dym razie poprze mnie przed Cavalornem.");
	B_LogEntry(GE_TeacherOR, "Vam mo�e pom�c zwi�kszy� mi si�� oraz mo�e nauczy� mnie otwierania zamk�w.");
   B_LogEntry(GE_TraderOR, "U Vama mog� zaopatrzy� si� w drewno.");
	B_StopProcessInfos	(self); 
	Party_RemoveNpc(garry);
	B_ExchangeRoutine (rbl_2605_garry,"LUMBERMILL");
};

/***********************
Ork a co z tym drewnem, jak to ma wygl�da�?

*************************/

INSTANCE DIA_Vam_Attack (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 11;
	condition		= DIA_Vam_Attack_Condition;
	information		= DIA_Vam_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Vam_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Vam_Attack_Info()
{
	AI_Output (self, other, "DIA_Vam_Attack_11_01"); //�le si� sta�o... Ale ka�dy mo�e zb��dzi�.
	AI_Output (self, other, "DIA_Vam_Attack_11_02"); //Twoja decyzja mo�e zabi� nas wszystkich.
	B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Vam_Stew (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 12;
	condition		= DIA_Vam_Stew_Condition;
	information		= DIA_Vam_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz ochot� na gulasz?"; 
};

FUNC INT DIA_Vam_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Vam_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_Vam_Stew_15_01"); //Masz ochot� na gulasz?
	AI_Output (self, other, "DIA_Vam_Stew_11_02"); //Wola�bym porz�dn� piecze�, ale niech b�dzie.
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Vam zjad� misk� gulaszu i nawet podzi�kowa�."); 
};

INSTANCE DIA_VAM_Spy (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 13;
	condition		= DIA_VAM_Spy_Condition;
	information		= DIA_VAM_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak tu trafi�e�?"; 
};

FUNC INT DIA_VAM_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_VAM_Spy_Info()
{
	spy_count = spy_count + 1;
   
	AI_Output (other, self, "DIA_VAM_Spy_15_01"); //Jak tu trafi�e�?
	AI_Output (self, other, "DIA_VAM_Spy_11_02"); //Najpierw jaki� idiota pos�dzi� mnie o kradzie� drzewa z kr�lewskiego lasu.
	AI_Output (self, other, "DIA_VAM_Spy_11_03"); //P�niej s�dzia skaza� mnie, nie czekaj�c na dowody, a w ko�cu stra�nicy miejscy wykopali mnie przez barier�.
	AI_Output (other, self, "DIA_VAM_Spy_15_04"); //Mia�em na my�li ten ob�z.
	AI_Output (self, other, "DIA_VAM_Spy_11_05"); //Aha. Tylko tutaj mog�em sam o sobie decydowa�. Dlatego tu zosta�em.
	AI_Output (self, other, "DIA_VAM_Spy_11_06"); //Nie lubi�, jak kto� m�wi mi, co mam robi�.
	AI_Output (other, self, "DIA_VAM_Spy_15_07"); //Doskonale to rozumiem.
	
   B_LogEntry		(CH2_Rbl_Spy, "Vam wygl�da na jedyn� osob�, kt�ra nic nie ukrywa. Ale mo�e tym bardziej powinienem zwr�ci� na niego uwag�.");

	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od ciebie chcia�.
		B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_VAM_Spy1 (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 14;
	condition		= DIA_VAM_Spy1_Condition;
	information		= DIA_VAM_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wolisz by� kowalem w�asnego losu."; 
};

FUNC INT DIA_VAM_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_VAM_Spy1_Info()
{
	tony_spy = tony_spy + 1;
	AI_Output (other, self, "DIA_VAM_Spy1_15_01"); //Wolisz by� kowalem w�asnego losu.
	AI_Output (self, other, "DIA_VAM_Spy1_11_02"); //Ogl�dnie m�wi�c, tak.
	AI_Output (self, other, "DIA_VAM_Spy1_11_03"); //Teraz robi� to, co kiedy� i robi� to dobrze, wi�cej mi nie trzeba.
	AI_Output (other, self, "DIA_VAM_Spy1_15_04"); //Nie zauwa�y�e� w obozie czego� podejrzanego?	
	AI_Output (self, other, "DIA_VAM_Spy1_11_05"); //Kto� kto wi�kszo�� czasu sp�dza na pracy nie ma czasu na w�szenie i podgl�danie.
	AI_Output (self, other, "DIA_VAM_Spy1_11_06"); //Pogadaj z pozosta�ymi, mo�e kto� Ci pomo�e bardziej ni� ja.
	B_LogEntry		(CH2_Rbl_Spy, "Od Vama nie dowiedzia�em si� nic nowego.");
	
	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta�, nie daj mu czeka�.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};

	B_StopProcessInfos	(self);
}; 
