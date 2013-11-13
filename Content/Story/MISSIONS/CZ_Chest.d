//**************************************************************
// Made by Shergar			       *
//**************************************************************

func void chestout()
{
	Npc_SetAivar(self,AIV_INVINCIBLE,  FALSE);
	Snd_Play("LevelUp");
	MOBUSE = 0;
	//PRINTGlobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
};

func void chest_s1()
{
	var C_Npc him;
	var C_Npc rocker;
	MOBUSE = CHEST_USED;
	him = Hlp_GetNpc(PC_Hero);
	rocker = Hlp_GetNpc(PC_Rockefeller);
	
   if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(him)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rocker)))
	{
		Npc_SetAivar(self,AIV_INVINCIBLE,  TRUE);
		B_ProcessInfos(him);
	};
};

instance NOchest1(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = nochest1_condition;
	information = nochest1_info;
	important = 0;
	permanent = 1;
	description = "Zabieraj brudne �apska - skrzynia jest pusta!";
};


func int nochest1_condition()
{
	if (MOBUSE == CHEST_USED) && (CHEST_KNOW == FALSE)
	{
		return 1;
	};
};

func void nochest1_info()
{
	B_StopProcessInfos (self);
	MOBUSE = 0;
	Npc_SetAivar(self,AIV_INVINCIBLE,  FALSE);
};

instance NOchest(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = nochest_condition;
	information = nochest_info;
	important = 0;
	permanent = 1;
	description = "Zostaw skrzyni� w spokoju.";
};

func int nochest_condition()
{
	if (MOBUSE == CHEST_USED) && (CHEST_KNOW == TRUE)
	{
		return 1;
	};
};

func void nochest_info()
{
	B_StopProcessInfos (self);
	MOBUSE = 0;
	Npc_SetAivar(self,AIV_INVINCIBLE,  FALSE);
};

instance Shadows_Write (C_Info)
{
	npc = PC_Hero;
	condition = Shadows_Write_condition;
	information = Shadows_Write_info;
	important = 0;
	permanent = 1;
	description = "Cienie.";
};

func int Shadows_Write_condition()
{
	if (MOBUSE == CHEST_USED) && (CHEST_KNOW == TRUE)&&(chest_conf < 2)
	{
		return 1;
	};
};

func void Shadows_Write_info()
{
	AI_Output (other, self,"Shadows_Write_15_00"); //Po wnikliwym rozpoznaniu rozmieszczenia posterunk�w stra�nik�w i ustaleniu cz�stotliwo�ci zmiany wart...
	AI_Output (other, self,"Shadows_Write_15_01"); //A pieprzy� to g�wno! Zr�bcie to, co teraz napisz�...

	Info_ClearChoices (Shadows_Write);
	Info_AddChoice (Shadows_Write, "Zaatakujcie zewn�trzne bramy.", Shadows_Write_Gate);
	Info_AddChoice (Shadows_Write, "Zajmijcie si� stra�nikami w pier�cieniu.", Shadows_Write_Guards);
	Info_AddChoice (Shadows_Write, "Zaatakujcie bram� zamkow�.", Shadows_Write_Castle);
	Info_AddChoice (Shadows_Write, "R�bcie, co chcecie.", Shadows_Write_Nothing);
};

// --------------------------------------------------------------
/*********************
Kurde jednak nie zrobi� tego sam bo nie wiem, kt�rzy z cienii s� w obozie no i jak to zrobi� najoptymalniej.
Chodzi o to, �eby wszystkie cienie w tej opcji podczas ataku [nie po wybraniu opcji, wi�c jaki� trigger chyba b�dzie potrzebny albo wywo�anie funkcji inicjuj�cej podczas dialogu przed atakiem]
ustawili si� w pobli�u zewn�trznych bram, czyli 2 oddzia�y z nich trzeba zrobi�.
**********************/


/****************
Ta zmienna jak = 2 to znaczy, �e i Cienie i Kopacze ju� s� skonfigurowani
******************/

FUNC VOID Shadows_Write_Gate()
{
	chest_conf = chest_conf + 1;
	shadows_exterior_gates ();
	Info_ClearChoices (Shadows_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Cienie zaatakuj� wewn�trzne bramy.");
};


// --------------------------------------------------------------

FUNC VOID Shadows_Write_Guards()
{
	chest_conf = chest_conf + 1;
	shadows_ring_attack ();
	Info_ClearChoices (Shadows_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Cienie zajm� si� stra�nikami w pier�cieniu.");
};

// --------------------------------------------------------------

FUNC VOID Shadows_Write_Castle()
{
	chest_conf = chest_conf + 1;
	shadows_interior_gate ();
	Info_ClearChoices (Shadows_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Cienie uderz� na bram� zamkow�.");
};

// --------------------------------------------------------------

FUNC VOID Shadows_Write_Nothing()
{
	chest_conf = chest_conf + 1;
	shadows_what_want ();
	Info_ClearChoices (Shadows_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Niech Cienie robi�, co chc�.");
};

instance Diggers_Write (C_Info)
{
	npc = PC_Hero;
	condition = Diggers_Write_condition;
	information = Diggers_Write_info;
	important = 0;
	permanent = 1;
	description = "Kopacze.";
};

func int Diggers_Write_condition()
{
	if (MOBUSE == CHEST_USED) && (CHEST_KNOW == TRUE)&&(chest_conf < 2)
	{
		return 1;
	};
};

func void Diggers_Write_info()
{
	AI_Output (other, self,"Diggers_Write_15_00"); //To wasza jedyna szansa na odzyskanie wolno�ci.
	AI_Output (other, self,"Diggers_Write_15_01"); //Zr�bcie, co napisz�, a by� mo�e po�yjecie wystarczaj�co d�ugo, aby nacieszy� si� zwyci�stwem.

	Info_ClearChoices (Diggers_Write);
	Info_AddChoice (Diggers_Write, "Zaatakujcie zewn�trzne bramy.", Diggers_Write_Gate);
	Info_AddChoice (Diggers_Write, "Zajmijcie si� stra�nikami w pier�cieniu.", Diggers_Write_Guards);
	Info_AddChoice (Diggers_Write, "Zaatakujcie bram� zamkow�.", Diggers_Write_Castle);
	Info_AddChoice (Diggers_Write, "R�bcie, co chcecie.", Diggers_Write_Nothing);
};


// --------------------------------------------------------------

FUNC VOID Diggers_Write_Gate()
{
	chest_conf = chest_conf + 1;
	Diggers_exterior_gates ();
	Info_ClearChoices (Diggers_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Kopacze zaatakuj� zewn�trzne bramy.");
};

// --------------------------------------------------------------

FUNC VOID Diggers_Write_Guards()
{
	chest_conf = chest_conf + 1;
	Diggers_ring_attack ();
	Info_ClearChoices (Diggers_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Kopacze zajm� si� stra�nikami w pier�cieniu.");
};

// --------------------------------------------------------------

FUNC VOID Diggers_Write_Castle()
{
	chest_conf = chest_conf + 1;
	Diggers_interior_gate ();
	Info_ClearChoices (Diggers_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Kopacze uderz� na bram� zamkow�.");
};

// --------------------------------------------------------------

FUNC VOID Diggers_Write_Nothing()
{
	chest_conf = chest_conf + 1;
	Diggers_what_want ();
	Info_ClearChoices (Diggers_Write);
	B_LogEntry		(CH6_RBL_Coordinate, "Niech Kopacze robi� co chc�.");
};

/*********************

Og�lnie mo�na to zrobi� tak, �eby by� realny wp�yw na walk�. Dam kilku stra�nikom dialogi z infem, gdzie ich b�dzie najwi�cej podczas ewentualnego ataku.
W NWN2 do�� fajnie zrobili obron� twierdzy. Rzeczywi�cie wyb�r mia� wp�yw na przebieg walki, fakt, �e nie drastyczny, ale fajnie by�o mie� tak� �wiadomo��, �e jednak mo�na kogo� rozstawia� po k�tach xD

Chyba, �e macie lepsze pomys�y co do miejsc ataku, etc. to si� pozmienia/

********************************/
