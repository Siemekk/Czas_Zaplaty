// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondralDream_Exit (C_INFO)
{
	npc			= GUR_12030_BaalTondral_Dream;
	nr			= 999;
	condition	= DIA_BaalTondralDream_Exit_Condition;
	information	= DIA_BaalTondralDream_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondralDream_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondralDream_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_BaalTondralDream_Hi(C_INFO)
{
	npc			= GUR_12030_BaalTondral_Dream;
	nr			= 1;
	condition	= DIA_BaalTondralDream_Hi_Condition;
	information	= DIA_BaalTondralDream_Hi_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondralDream_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondralDream_Hi_Info()
{
	AI_Output (self, other,"DIA_BaalTondralDream_Hi_13_00"); //�ni�cy o�wieci� m�j umys�! Bestia z�o�y mu pok�on, a ty b�dziesz tym, kt�ry ugnie jej kolana!
   AI_Output (other, self, "DIA_BaalTondralDream_Hi_15_01"); //Cz�owieku, dobrze si� czujesz?
	AI_Output (self, other,"DIA_BaalTondralDream_Hi_13_02"); //Milcz psubracie! Wypij ten wywar i do boju!!!
   AI_Output (other, self, "DIA_BaalTondralDream_Hi_15_03"); //Oszala�e�? Przecie� to trucizna!
	AI_Output (self, other,"DIA_BaalTondralDream_Hi_13_04"); //Powiedzia�em pij! Nie sprzeciwiaj si� woli �ni�cego!
   CreateInvItems (other, ItFobeer, 1);
	AI_UseItem (other, ItFobeer);
   
   B_LogEntry(CH4_RBL_Beast, "To by� sen... Besti� mo�na zabi� tylko za pomoc� trucizny. Potrzebuj� te� kogo�, kto pomo�e mi w zrealizowaniu tego zamierzenia - musz� porozmawia� z Baal Tondralem.");
   B_StopProcessInfos(self);
};

INSTANCE DIA_BaalTondralDream_Dead(C_INFO)
{
	npc			= GUR_12030_BaalTondral_Dream;
	nr			= 1;
	condition	= DIA_BaalTondralDream_Dead_Condition;
	information	= DIA_BaalTondralDream_Dead_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondralDream_Dead_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTondralDream_Hi))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondralDream_Dead_Info()
{
   Dream_finished = true;
   
   B_StopProcessInfos(self);
   B_StopProcessInfos(hero);
   
   hero.attribute[ATR_HITPOINTS] = 0;
};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_BaalTondral_Hi(C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Hi_Condition;
	information	= DIA_BaalTondral_Hi_Info;
	permanent	= 0;
	important	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT DIA_BaalTondral_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_Hi_Info()
{
	AI_Output (other, self, "DIA_BaalTondral_Hi_15_01"); //Kim jeste�?
	AI_Output (self, other,"DIA_BaalTondral_Hi_13_02"); //Jestem... Kiedy� by�em Baalem w Obozie Sekty.
	AI_Output (self, other,"DIA_BaalTondral_Hi_13_03"); //Teraz jestem ju� tylko wypalon� skorup� cz�owieka...
};

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 2;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
	description = "";
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_Beast))&&(Dream_finished)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	var C_NPC lester; lester = Hlp_GetNpc(PC_Psionic);
   
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nie wygl�dasz mi na kogo�, kto chcia�by nosi� niewolnicze jarzmo nak�adane ludziom przez magnat�w.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //My�l�, �e jeste� raczej poszukiwaczem, kim�, kto szuka prawdziwej wiary. Czy czujesz, jak ogie� trawi Twoje cia�o podczas snu?
	AI_Output (other, self, "DIA_BaalTondral_FanaticTeacher1_15_02"); //Sk�d wiesz o tym �nie?!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher1_13_03"); //By�em Baalem. Potrafi� wyczu� targaj�ce Twym umys�em emocje i l�ki, kt�re po�eraj� Twego ducha.
	AI_Output (other, self, "DIA_BaalTondral_FanaticTeacher1_15_04"); //Widzia�em Ci� we �nie. Pomog�e� mi zabi� Besti�.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher1_13_05"); //Tak, by�em tam. Zobaczy�e� moje przeznaczenie i jestem got�w je wype�ni�.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher1_13_06"); //Ruszajmy. Czas nagli. Bestia z ka�d� chwil� staje si� coraz silniejsza.

	B_LogEntry(CH4_RBL_Beast, "Baal Tondral ruszy ze mn�, aby zg�adzi� Besti�. Czuj� w ko�ciach, �e znowu pakuj� si� w paszcz� Beliara.");
	B_StopProcessInfos(self);

	/************************
	ma do nich podej�� Lester
	************************/

	AI_GotoWP(lester, "GO");
   Npc_ExchangeRoutine(lester, "GoToTondral");
};

// **************************************************

INSTANCE DIA_BaalTondral_Swamp (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 3;
	condition	= DIA_BaalTondral_Swamp_Condition;
	information	= DIA_BaalTondral_Swamp_Info;
	permanent	= 0;
	important	= 1;
	description = "";
};                       

FUNC INT DIA_BaalTondral_Swamp_Condition()
{
	if (Npc_GetDistToWP (self,"PATH_OC_PSI_19") < 1000 )&&(Npc_KnowsInfo(hero,DIA_Lester_Join))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Swamp_Info()
{
	var C_NPC lest; lest = Hlp_GetNpc(PC_Psionic);
	B_FullStop (hero);
	B_FullStop (lest);
	AI_GotoNpc(other,self);
	AI_GotoNpc(lest,self);
   
	AI_Output (self, other,"DIA_BaalTondral_Swamp_13_00"); //Pami�tajcie, po co tu przybyli�my. Musimy zg�adzi� z�o i przynie�� ukojenie naszym braciom.
	AI_Output (other, self, "DIA_BaalTondral_Swamp_15_01"); //We �nie widzia�em jak�� trucizn�.
	AI_Output (self, other,"DIA_BaalTondral_Swamp_13_02"); //Tak, to by�a ta butelka.
   CreateInvItems (self, ItFobeer, 1);
	AI_UseItem (self, ItFobeer);
	AI_Output (other, self, "DIA_BaalTondral_Swamp_15_03"); //Co robisz?! Przecie� to trucizna!
	AI_Output (self, other,"DIA_BaalTondral_Swamp_13_04"); //�miertelna dla Bestii, ale dla cz�owieka to tylko odroczony wyrok �mierci. Prze�yj� wystarczaj�co d�ugo, aby rzuci� si� na potwora.
	AI_Output (self, other,"DIA_BaalTondral_Swamp_13_05"); //Kiedy wypije moj� krew zginie. Chocia� tyle mog� zrobi� dla moich braci...
	AI_Output (self, other,"DIA_BaalTondral_Swamp_13_06"); //Do ataku!
	B_LogEntry(CH4_RBL_Beast, "Baal Tondral wypi� trucizn�. Kiedy bestia go zabije i wypije krew sekciarza natychmiast zginie. Po�wi�cenie... Trudno zrozumie� ludzi, kt�rzy z w�asnej woli oddaj� �ycie za innych. Mam nadziej�, �e ja nie b�d� musia� stawa� przed podobnymi wyborami.");
	B_StopProcessInfos(self);

	AI_GotoWP(self, "PSI_START");
   Npc_ExchangeRoutine(self, "GuideToTemple");
};

// **************************************************

INSTANCE DIA_BaalTondral_End (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 4;
	condition	= DIA_BaalTondral_End_Condition;
	information	= DIA_BaalTondral_End_Info;
	permanent	= 0;
	important	= 1;
	description = "";
};                       

FUNC INT DIA_BaalTondral_End_Condition()
{
	/***************

Na placu przed wej�ciem do �wiatymi bo tam jest bestia tak?

******************************/
	if (Npc_GetDistToWP (self, "PSI_TEMPLE_COURT_GURU") < 1000 )&&(Npc_KnowsInfo(hero,DIA_Lester_Comment))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_End_Info()
{
	var C_NPC lest; lest = Hlp_GetNpc(PC_Psionic);
	B_FullStop (hero);
	B_FullStop (lest);
	AI_GotoNpc(other,self);
	AI_GotoNpc(lest,self);
   
	AI_Output (self, other,"DIA_BaalTondral_End_13_00"); //Czuj� wyziewy �mierci. Bestia czeka na nas w �rodku.
	AI_Output (other, self, "DIA_BaalTondral_End_15_01"); //B�dziemy tu� za tob�.
	AI_Output (self, other,"DIA_BaalTondral_End_13_02"); //Czas wype�ni� przeznaczenie... Argh!

	B_StopProcessInfos(self);
   Tondral_death = true;
	/***************
   Ork teraz zadanie dla ciebie.
   Ball p�dzie w stron� �wi�tyni, ale na drodze nagle pojawi si� jaki� super z�biak i go �licznie poszatkuje xD

   ****************************/
};
