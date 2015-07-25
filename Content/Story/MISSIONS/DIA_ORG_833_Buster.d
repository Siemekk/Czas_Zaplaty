// ************************ EXIT **************************

INSTANCE DIA_ORG_833_Buster_Exit (C_INFO)
{
	npc			= ORG_833_Buster;
	nr			= 999;
	condition	= DIA_ORG_833_Buster_Exit_Condition;
	information	= DIA_ORG_833_Buster_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_833_Buster_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_ORG_833_Buster_Hello (C_INFO)
{
	npc				= ORG_833_Buster;
	nr				= 1;
	condition		= DIA_ORG_833_Buster_Hello_Condition;
	information		= DIA_ORG_833_Buster_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jeste�?"; 
};

FUNC INT DIA_ORG_833_Buster_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_833_Buster_Hello_Info()
{
	AI_Output (other, self, "DIA_ORG_833_Buster_Hello_15_01"); //Kim jeste�?
	AI_Output (self, other, "DIA_ORG_833_Buster_Hello_11_02"); //Jestem Buster. A Ty?
	AI_Output (other, self, "DIA_ORG_833_Buster_Hello_15_03"); //Jestem Rick...
	AI_Output (self, other, "DIA_ORG_833_Buster_Hello_11_04"); //Reek? Czy�by przys�a� Ci� Ramsay?
	AI_Output (other, self, "DIA_ORG_833_Buster_Hello_15_05"); //Nikt mnie nie przys�a�. I powtarzam jestem Rick!
	AI_Output (self, other, "DIA_ORG_833_Buster_Hello_11_06"); //No dobrze, uspok�j si�. Chcia�em si� tylko upewni�. Chocia� mo�na to �atwo sprawdzi�...
	AI_Output (other, self, "DIA_ORG_833_Buster_Hello_15_07"); //�apy precz! Wszystko mam na swoim miejscu, nikt mi nic nie odci��!
	AI_Output (self, other, "DIA_ORG_833_Buster_Hello_11_08"); //Spokojnie, spokojnie. Nie chc� niczego sprawdza�. Wierz� Ci na s�owo. W ko�cu zachowujesz si� jak ch�op z jajami. 
	AI_Output (self, other, "DIA_ORG_833_Buster_Hello_11_09"); //Mo�e zmie�my temat rozmowy. Co Ty na to?
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_ORG_833_Buster_What (C_INFO)
{
	npc				= ORG_833_Buster;
	nr				= 1;
	condition		= DIA_ORG_833_Buster_What_Condition;
	information		= DIA_ORG_833_Buster_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co tu robisz?"; 
};

FUNC INT DIA_ORG_833_Buster_What_Condition()
{
	return Npc_KnowsInfo(hero, DIA_ORG_833_Buster_Hello);
};

FUNC VOID DIA_ORG_833_Buster_What_Info()
{
	AI_Output (other, self, "DIA_ORG_833_Buster_What_15_01"); //Co tu robisz?
	AI_Output (self, other, "DIA_ORG_833_Buster_What_11_02"); //A jak widzisz przebywam...
	AI_Output (other, self, "DIA_ORG_833_Buster_What_15_03"); //A co� poza samym przebywaniem?
	AI_Output (self, other, "DIA_ORG_833_Buster_What_11_04"); //Ech, rozejrzyj si� dooko�a. Jest tu idealne miejsce do trenowania akrobatyki. Mo�na rzuci� okiem na to co si� dzieje nieopodal...
	AI_Output (other, self, "DIA_ORG_833_Buster_What_15_05"); //Jeste� szpiegiem?
	AI_Output (self, other, "DIA_ORG_833_Buster_What_11_06"); //Nie, nie. Jestem akrobat� i... obserwatorem.
	AI_Output (other, self, "DIA_ORG_833_Buster_What_15_07"); //Rozumiem, akrobato. Na razie zostawi� Ci�.
	AI_Output (self, other, "DIA_ORG_833_Buster_What_11_08"); //Do zobaczenia!
};

instance DIA_ORG_833_Buster (C_INFO)
{
	npc				= ORG_833_Buster;
	condition		= DIA_ORG_833_Buster_Condition;
	information		= DIA_ORG_833_Buster_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_ORG_833_Buster_Condition()
{
	if (Npc_GetTalentSkill(hero, HACK_NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
	AI_Output (self, other,"DIA_ORG_833_Buster_02_01"); //Wiesz co, poruszasz si� tak jako� sztywno. M�g�bym Ci pom�c.
};

// *********** Talent lernen *******************
INSTANCE DIA_ORG_833_Buster3 (C_INFO)
{
	npc				= ORG_833_Buster;
	condition		= DIA_ORG_833_Buster3_Condition;
	information		= DIA_ORG_833_Buster3_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak mo�esz mi pom�c?"; 
};

FUNC INT DIA_ORG_833_Buster3_Condition()
{	
	return Npc_KnowsInfo(hero,DIA_ORG_833_Buster);
};

func VOID DIA_ORG_833_Buster3_Info()
{
	AI_Output (self, other,"DIA_ORG_833_Buster3_02_01"); //Mog� Ci pokaza�, jak nale�y balansowa� cia�em. Naucz� ci� AKROBATYKI.

	B_LogEntry(GE_TeacherOW, "Buster mo�e mnie nauczy� akrobatyki.");
};