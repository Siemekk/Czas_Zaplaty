var int Mis_SearchForPlatesAccepted;
// **************************************************
//						 EXIT
// **************************************************

instance  Stt_2501_Keretsel_Exit (C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 999;
	condition	= Stt_2501_Keretsel_Exit_Condition;
	information	= Stt_2501_Keretsel_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC int  Stt_2501_Keretsel_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_2501_Keretsel_Exit_Info()
{
	B_StopProcessInfos	(self);
};

// **************************************************
//					Rozdzia�: 3
//					Misja:  Pier�cionek
// QUESTID 552
// **************************************************
instance  Stt_2501_Keretsel_Ring (C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 1;
	condition	= Stt_2501_Keretsel_Ring_Condition;
	information	= Stt_2501_Keretsel_Ring_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mog� Ci w czym� pom�c?";
};

FUNC int  Stt_2501_Keretsel_Ring_Condition()
{
	//if (Kapitel >= 3)
	//{
	return 1;
	//};
};

FUNC VOID  Stt_2501_Keretsel_Ring_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Ring_11_00"); //Mog� Ci w czym� pom�c?
	AI_Output (self, other,"Stt_2501_Keretsel_Ring_11_01"); //W rzeczy samej. Niejaki Witten jest w posiadaniu pewnego pier�cienia.
	AI_Output (self, other,"Stt_2501_Keretsel_Ring_11_02"); //Chc� go zdoby�. I Ty mi w tym pomo�esz, prawda?

	Info_ClearChoices	(Stt_2501_Keretsel_Ring);
	Info_AddChoice		(Stt_2501_Keretsel_Ring,"Nie ma mowy.",DIA_Stt_2501_Keretsel_Find_Decision_Ring_No);
	Info_AddChoice		(Stt_2501_Keretsel_Ring,"Oczywi�cie.",DIA_Stt_2501_Keretsel_Find_Decision_Ring_Yes);
};

FUNC void DIA_Stt_2501_Keretsel_Find_Decision_Ring_Yes()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Find_Decision_Ring_Yes_15_00"); //Oczywi�cie.
	AI_Output (self, other,"Stt_2501_Keretsel_Find_Decision_Ring_Yes_15_01"); //W takim razie po�piesz si�.
	
	B_StopProcessInfos	(self);
	
	Log_CreateTopic(KeretselLookingForWittenRing, LOG_MISSION);
	B_LogSetTopicStatus(KeretselLookingForWittenRing, LOG_RUNNING);
	B_LogEntry(KeretselLookingForWittenRing, "Keretsel chce, abym zdoby� dla niego pier�cie� Wittena.");
	
	GetTheWittenRing = LOG_RUNNING;
};

FUNC void DIA_Stt_2501_Keretsel_Find_Decision_Ring_No()
{
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Find_Decision_Ring_No_15_00"); //Nie ma mowy.
	AI_Output (self, other,"DIA_Stt_2501_Keretsel_Find_Decision_Ring_No_15_01"); //Kolejna osoba, kt�ra nie potrafi nawet gwizdn�� g�upiego kawa�ka metalu. Wypierdalaj!
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Find_Decision_Ring_No_15_02"); //Spokojnie. Ju� sobie id�.
	
	B_StopProcessInfos(self);
};  
/******************************************************************************************/
instance  Stt_2501_Keretsel_Have_The_Witten_Ring(C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 2;
	condition	= Stt_2501_Keretsel_Have_The_Witten_Ring_Condition;
	information	= Stt_2501_Keretsel_Have_The_Witten_Ring_Info;
	permanent	= 0;
	description = "Mam pier�cie� Wittena.";
};

FUNC int  Stt_2501_Keretsel_Have_The_Witten_Ring_Condition()
{
	if ((Npc_HasItems(hero,WittenRing)) && (Npc_KnowsInfo(hero,Stt_2501_Keretsel_Ring)))
	{
		return 1;
	};
};

FUNC int  Stt_2501_Keretsel_Have_The_Witten_Ring_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Have_The_Witten_Ring_Info_11_00"); //Mam pier�cie� Wittena.
	AI_Output (self, other,"Stt_2501_Keretsel_Have_The_Witten_Ring_Info_11_01"); //Czas najwy�szy! Dawaj go, oto ruda.

	B_GiveInvItems(hero,self,WittenRing,1);
	//zdefiniuj ile rudy dac (nie ma tego w scenariuszu) da�em 50 bo w scenariuszu by�o: (linia 63) "Keretsel wzamian za pier�cie� da� mi do�� niewielk� nagrod�."
	CreateInvItems(self,ItMinugget,50);
	B_GiveInvItems(self,hero,ItMinugget,50);
	
	B_LogEntry(KeretselLookingForWittenRing, "Keretsel w zamian za pier�cie� da� mi niewielk� nagrod�. Niech szlag go trafi!");
	B_LogSetTopicStatus(KeretselLookingForWittenRing, LOG_SUCCESS);
	
	GetTheWittenRing = LOG_SUCCESS;
};

// **************************************************
//					Rozdzia�: 3
//					Misja:  Fanatyk bi�uterii
// QUESTID 553
// **************************************************

instance  Stt_2501_Keretsel_Asking_About_Jewellery_Quest(C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 3;
	condition	= Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Condition;
	information	= Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Info;
	permanent	= 0;
	description = "Mog� jeszcze co� dla Ciebie zrobi�?";
};

FUNC int  Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Condition()
{
	if (GetTheWittenRing == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC int  Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Info_11_00"); //Mog� jeszcze co� dla Ciebie zrobi�?
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Info_11_01"); //Tak. Zawsze znajdzie si� jaka� robota.
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Info_11_02"); //Podoba mi si� pewien amulet, ale jest w posiadaniu Ramona. Zdob�dziesz go dla mnie?

	Info_ClearChoices	(Stt_2501_Keretsel_Asking_About_Jewellery_Quest);
	Info_AddChoice		(Stt_2501_Keretsel_Asking_About_Jewellery_Quest,"Nie.",DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_No);
	Info_AddChoice		(Stt_2501_Keretsel_Asking_About_Jewellery_Quest,"Jasne.",DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Yes);
};

FUNC void DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Yes()
{
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Yes_15_00"); //Jasne.
	AI_Output (self, other,"DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Yes_15_01"); //To dobrze. B�d� na Ciebie czeka�.
	
	B_StopProcessInfos	(self);
	
	Log_CreateTopic(KeretselLookingForRamonAmulet, LOG_MISSION);
	B_LogSetTopicStatus(KeretselLookingForRamonAmulet, LOG_RUNNING);
	B_LogEntry(KeretselLookingForRamonAmulet, "Keretsel chce zdoby� kolejny element bi�uterii do kolekcji. Tym razem jest to amulet znajduj�cy si� w posiadaniu Ramona.");

	GetTheRamonAmulet = LOG_RUNNING;
};

FUNC void DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_No()
{
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_No_15_01"); //Ju� do�� mi pomog�e�, sam sobie dam z tym rad�.
	
	B_StopProcessInfos(self);
};  
/******************************************************************************************/
instance  Stt_2501_Keretsel_Have_The_Ramon_Amulet(C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 4;
	condition	= Stt_2501_Keretsel_Have_The_Ramon_Amulet_Condition;
	information	= Stt_2501_Keretsel_Have_The_Ramon_Amulet_Info;
	permanent	= 0;
	description = "Mam amulet dla Ciebie.";
};

FUNC int  Stt_2501_Keretsel_Have_The_Ramon_Amulet_Condition()
{
	if ((Npc_HasItems(hero,RamonAmulet)) && (Npc_KnowsInfo(hero,Stt_2501_Keretsel_Asking_About_Jewellery_Quest)))
	{
		return 1;
	};
};

FUNC int  Stt_2501_Keretsel_Have_The_Ramon_Amulet_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Have_The_Ramon_Amulet_Info_11_00"); //Mam amulet dla Ciebie.
	AI_Output (self, other,"Stt_2501_Keretsel_Have_The_Ramon_Amulet_Info_11_01"); //�wietnie! Daj go tutaj. Hmm... masz. To powinno pokry� wydatki.
	
	B_GiveInvItems(hero,self,RamonAmulet,1);
	
	CreateInvItems(self,ItMinugget,300);
	B_GiveInvItems(self,hero,ItMinugget,300);
	
	//orc: musisz zdefiniowac ile kasy znow jako nagroda
	
	B_LogEntry(KeretselLookingForRamonAmulet, "Odda�em amulet Keretselowi. W nagrod� otrzyma�em 300 bry�ek rudy.");
	B_LogSetTopicStatus(KeretselLookingForRamonAmulet, LOG_SUCCESS);
	
	GetTheRamonAmulet = LOG_SUCCESS;
};

// **************************************************
//					Rozdzia�: 3
//					Misja:  Drogie talerze
// QUESTID 554
// **************************************************

/******************************************************************************************/
instance  Stt_2501_Keretsel_Asking_About_Ileum_Quest(C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 5;
	condition	= Stt_2501_Keretsel_Asking_About_Ileum_Quest_Condition;
	information	= Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info;
	permanent	= 1;
	description = "Mo�e masz jeszcze jak�� rob�tk�?";
};

FUNC int  Stt_2501_Keretsel_Asking_About_Ileum_Quest_Condition()
{
	if (Npc_KnowsInfo(hero,Stt_2501_Keretsel_Have_The_Ramon_Amulet))
	{
		return 1;
	};
};

FUNC int  Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info_11_00"); //Mo�e masz jeszcze jak�� rob�tk�?
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info_11_01"); //Owszem. Udowodni�e�, �e potrafisz zdoby� potrzebne mi przedmioty.
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info_11_02"); //Dowiedzia�em si�, i� w obozie mo�na znale�� talerze, kt�re zosta�y niegdy� skradzione Rhobarowi.
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info_11_03"); //Brzmi to mo�e absurdalnie, ale znam osob�, kt�ra ch�tnie je odkupi i to za niez�� cen�. ��da tylko wszystkich na raz - pojedynczo niewiele znacz�.
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info_11_04"); //Przyniesiesz je?
	
	Info_ClearChoices	(Stt_2501_Keretsel_Asking_About_Ileum_Quest);
	Info_AddChoice		(Stt_2501_Keretsel_Asking_About_Ileum_Quest,"Mam jeszcze mas� innej roboty.",DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_No);
	Info_AddChoice		(Stt_2501_Keretsel_Asking_About_Ileum_Quest,"Pewnie",DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_Yes);
};

FUNC void DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_Yes()
{
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_Yes_15_00"); //Pewnie.
	AI_Output (self, other,"DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_Yes_15_01"); //Ciesz� si�, ale id� ju�. Ruda czeka.
	
	Stt_2501_Keretsel_Asking_About_Ileum_Quest.permanent = FALSE;
	
	B_StopProcessInfos	(self);
	
	Log_CreateTopic(KeretselLookingForFourIleum, LOG_MISSION);
	B_LogSetTopicStatus(KeretselLookingForFourIleum, LOG_RUNNING);
	B_LogEntry(KeretselLookingForFourIleum, "Keretsel zleci� mi zdobycie srebrnych B�yszcz�cych Talerzy nale��cych do mieszka�c�w obozu. Powinienem przeszuka� ich chaty.");

	//GetTheFourIleum = LOG_RUNNING;
};

FUNC void DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_No()
{
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_No_15_00"); //Mam jeszcze mas� innej roboty.
	AI_Output (self, other,"DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_No_15_01"); //Jasne, rozumiem. Wr��, kiedy si� zdecydujesz.
	
	B_StopProcessInfos(self);
};  

/******************************************************************************************/
instance  Stt_2501_Keretsel_How_Many_Ileum_Question(C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 6;
	condition	= Stt_2501_Keretsel_How_Many_Ileum_Question_Condition;
	information	= Stt_2501_Keretsel_How_Many_Ileum_Question_Info;
	permanent	= 0;
	description = "Ile jest tych talerzy?";
};

FUNC int  Stt_2501_Keretsel_How_Many_Ileum_Question_Condition()
{
	if ((Npc_KnowsInfo(hero,Stt_2501_Keretsel_Asking_About_Ileum_Quest))&&(Stt_2501_Keretsel_Asking_About_Ileum_Quest.permanent==FALSE))
	{
		return 1;
	};
};

FUNC int  Stt_2501_Keretsel_How_Many_Ileum_Question_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_How_Many_Ileum_Question_Info_11_00"); //Ile jest tych talerzy?
	AI_Output (self, other,"Stt_2501_Keretsel_How_Many_Ileum_Question_Info_11_01"); //P� tuzina. R�wno.
	
	B_LogEntry(KeretselLookingForFourIleum, "Podobno musz� zdoby� sze�� owych talerzy.");
};

/******************************************************************************************/
instance  Stt_2501_Keretsel_Have_All_Ileums (C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 4;
	condition	= Stt_2501_Keretsel_Have_All_Ileums_Condition;
	information	= Stt_2501_Keretsel_Have_All_Ileums_Info;
	permanent	= 0;
	description = "Mam talerze.";
};

FUNC int  Stt_2501_Keretsel_Have_All_Ileums_Condition()
{
	if ((Npc_HasItems(other,KeretselIleums)>=6) && (Stt_2501_Keretsel_Asking_About_Ileum_Quest.permanent==FALSE))
	{
		return 1;
	};
};

FUNC VOID  Stt_2501_Keretsel_Have_All_Ileums_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Have_All_Ileums_11_00"); //Mam talerze.
	AI_Output (self, other,"Stt_2501_Keretsel_Have_All_Ileums_11_01"); //Poka�!
	
	B_GiveInvItems(self,hero,KeretselIleums,6);
	
	AI_Output (self, other,"Stt_2501_Keretsel_Have_All_Ileums_11_02"); //Tak, to te. Bierz rud�. Po�owa zysk�w dla Ciebie.
	
	B_StopProcessInfos(self);

	B_LogEntry(KeretselLookingForFourIleum, "Keretsel odebra� talerze i zap�aci� z g�ry. Jego kolejne zlecenie zaliczone.");
	B_LogSetTopicStatus(KeretselLookingForFourIleum, LOG_SUCCESS);
};








