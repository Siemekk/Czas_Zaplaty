//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	B_StopProcessInfos(self);
};

//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "Spory ten zamek.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Spory ten zamek.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Chyba jeszcze Ci� tu nie widzia�em. Kim jeste�?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Nikim, chcia�em si� tylko troch� rozejrze�.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 2;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 0;
	description = "Mo�esz mi opowiedzie� co� wi�cej o zamku?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Mo�esz mi opowiedzie� co� wi�cej o zamku?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Co tu gada�. Gomez i jego zbiry zaj�li sto�p po buncie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Od pocz�tku wiedzia�em, �e bezpieczniej jest stan�� po ich stronie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Wielu z nas, jeszcze jako wi�niowie zamkni�ci w lochach lub zmuszani do pracy w kopalni, uznawa�o zwierzchnictwo Gomeza.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Czy te lochy znajduj� si� pod zamkiem?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Tak, ale teraz �wiec� pustkami. Nikt tam nie schodzi� od czasu buntu.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 3;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 0;
	description = "Jak wygl�da �ycie stra�nika?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Jak wygl�da �ycie stra�nika?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Jest spokojne. Jeste�my najwi�kszym i najsilniejszym obozem w Kolonii. Nikt nie �mie nas zaczepia�.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Rozumiem.
	B_StopProcessInfos(self);
};

//******************************************

instance  DIA_Cutter_Att (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 4;
	condition	= DIA_Cutter_Att_Condition;
	information	= DIA_Cutter_Att_Info;
	permanent	= 0;
	description = "Co s�dzisz o ataku?";
};                       

FUNC int  DIA_Cutter_Att_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_PERM))&&(CHEST_KNOW == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Att_Info()
{
	AI_Output (other, self,"DIA_Cutter_Att_15_00"); //Co s�dzisz o ataku?
	AI_Output (self, other,"DIA_Cutter_Att_08_01"); //Szybko si� wykrwawi�. A to co przejdzie przez bram� spotka m�j miecz!
	AI_Output (other, self,"DIA_Cutter_Att_15_02"); //A gdyby zaatakowali znienacka?
	AI_Output (self, other,"DIA_Cutter_Att_08_03"); //Przecie� nie spadn� z nieba! M�wi� Ci, rebelianci po�ami� sobie z�by i wr�c� z podkulonymi ogonami tam, sk�d przyszli.
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Cutter_Woman (C_INFO)
{
	npc				= GRD_208_Cutter;
	nr				= 5;
	condition		= DIA_Cutter_Woman_Condition;
	information		= DIA_Cutter_Woman_Info;
	permanent		= 0;
	description		= "Sk�d Gomez ma te wszystkie kobiety?"; 
};

FUNC INT DIA_Cutter_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Kira_OCHAfter))
	{
		return 1;
	};
};

FUNC VOID DIA_Cutter_Woman_Info()
{
	AI_Output (other, self,"DIA_Cutter_Woman_15_00"); //Sk�d Gomez ma te wszystkie kobiety?
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //C�, magnaci dostaj� wszystko, czego zapragn�.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chcesz powiedzie�, �e kr�l wymienia kobiety na rud�?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Naturalnie, one te� trafiaj� tutaj prosto z wi�zienia. Gdyby Gomez nie �ci�gn�� ich tutaj, dalej gni�yby w jakim� lochu.
	AI_Output (self, other,"DIA_Cutter_Woman_06_04"); //Ech, te� bym poch�do�y�...
	AI_Output (other, self,"DIA_Cutter_Woman_15_05"); //Mog� ci pom�c...
	AI_DrawWeapon (self);
	AI_Output (self, other,"DIA_Cutter_Woman_06_06"); //Nawet o tym nie my�l! Jak tylko zobacz� Twojego falusa, to utn� Ci ku�k� przy samej dupie!
	AI_Output (other, self,"DIA_Cutter_Woman_15_07"); //Nie m�wi�em o sobie! Nie jestem a� tak wyposzczony, �eby... Chyba si� porzygam.
	AI_RemoveWeapon (self);
	AI_Output (self, other,"DIA_Cutter_Woman_06_08"); //Ca�e szcz�cie. Ale m�wi�e� co� o pomocy. Masz jak�� babk� na boku?
	AI_Output (other, self,"DIA_Cutter_Woman_15_09"); //Mniej wi�cej. Znam kogo�, kto jest tob� �ywo zainteresowany.
	AI_Output (self, other,"DIA_Cutter_Woman_06_10"); //Kto to?
	AI_Output (other, self,"DIA_Cutter_Woman_15_11"); //To Kira, szefowa �owc�w trolli.
	AI_Output (self, other,"DIA_Cutter_Woman_06_12"); //S�ysza�em, �e to niewy�yte babsko. Hmm, brzmi ciekawie...
	AI_Output (other, self,"DIA_Cutter_Woman_15_13"); //Kiedy z ni� rozmawia�em, m�wi�a, �e masz wyj�tkowe... atrybuty.
	AI_Output (self, other,"DIA_Cutter_Woman_06_14"); //He, he, s�awa starego Siekacza dosz�a nawet do tej zawszonej Kolonii.
	AI_Output (self, other,"DIA_Cutter_Woman_06_15"); //A co mi tam. Stra�nicy to banda przyg�up�w. 
	AI_Output (self, other,"DIA_Cutter_Woman_06_16"); //Nied�ugo b�dzie tu gor�co, a nie ma to jak dobra poch�d�ka przed walk�.
	AI_Output (self, other,"DIA_Cutter_Woman_06_17"); //Prowad� do tej zdziry! 
   AI_Output (self, other,"DIA_Cutter_Woman_06_18"); //Albo czekaj... Musz� si� jeszcze odpowiednio... przygotowa�. Spotkajmy si� wieczorem za p�nocn� bram�. 
	AI_Output (other, self,"DIA_Cutter_Woman_15_19"); //Dobra, wieczorem ci� zaprowadz�.
	B_LogEntry(CH6_RBL_Horse, "Uda�o si�! Siekacz p�jdzie ze mn� do Kiry. Biedny stra�nik musi si� jeszcze przygotowa�...");

	Npc_ExchangeRoutine(self,"GateOC");
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Cutter_GoToKira (C_INFO)
{
	npc				= GRD_208_Cutter;
	nr				= 5;
	condition		= DIA_Cutter_GoToKira_Condition;
	information		= DIA_Cutter_GoToKira_Info;
	important		= 1;
};

FUNC INT DIA_Cutter_GoToKira_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Cutter_Woman)) &&(Npc_GetDistToWP (self,"OC1") < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Cutter_GoToKira_Info()
{
	AI_Output (self, other,"DIA_Cutter_GoToKira_06_00"); //Prowad�!
	AI_Output (other, self,"DIA_Cutter_GoToKira_15_01"); //Sam tego chcia�e�...

	B_LogEntry(CH6_RBL_Horse, "No to idziemy...");
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"Follow");
	B_StopProcessInfos(self); 
};
// **************************************************

INSTANCE DIA_Cutter_WomanOk (C_INFO)
{
	npc				= GRD_208_Cutter;
	nr				= 6;
	condition		= DIA_Cutter_WomanOk_Condition;
	information		= DIA_Cutter_WomanOk_Info;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Cutter_WomanOk_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Cutter_Woman))&&(Npc_GetDistToWP (self,"TH_KIRA_01") < 600 )
	{
		return 1;
	};
};

FUNC VOID DIA_Cutter_WomanOk_Info()
{
	var C_NPC kira; kira = Hlp_GetNpc(Non_4027_Kira);

	B_FullStop (hero);
	B_FullStop (self);
	AI_GotoNpc(other, self);
	AI_Output (other, self,"DIA_Cutter_WomanOk_15_00"); //Jeste�my na miejscu.
	AI_Output (self, other,"DIA_Cutter_WomanOk_06_01"); //A gdzie ta moja ladacznica?
	AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, kira);
	AI_Output (self, other,"DIA_Cutter_WomanOk_06_02"); //Tu� mi ma�a!
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"DIA_Cutter_WomanOk_06_03"); //Dzi�ki, stary. Nie wiem, jak Ci si� odwdzi�cz�.
	AI_Output (other, self,"DIA_Cutter_WomanOk_15_04"); //Wystarczy, �e staniesz na wysoko�ci zadania.
	AI_Output (self, other,"DIA_Cutter_WomanOk_06_05"); //He, he, o to si� nie b�j.
	AI_TurnToNpc (self, kira);
	B_LogEntry(CH6_RBL_Horse, "Teraz wszystko w... l�d�wiach Siekacza.");
	Party_RemoveNpc(self);

	/*********************
WP w pobli�u Kiry, tak, �eby mo�na by�o jej i siekaczowi zmieni� rutyn� na Small_Talk.
********************/

	Npc_ExchangeRoutine(self,"StayKira");
	Npc_ExchangeRoutine(kira,"KiraTalk");
	B_StopProcessInfos(self); 
};
