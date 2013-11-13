
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Felos_Exit (C_INFO)
{
	npc			= STT_343_Felos;
	nr			= 999;
	condition	= DIA_Felos_Exit_Condition;
	information	= DIA_Felos_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Felos_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Felos_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Felos_Hello (C_INFO)
{
	npc				= STT_343_Felos;
	nr				= 1;
	condition		= DIA_Felos_Hello_Condition;
	information		= DIA_Felos_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co� Ci marnie idzie."; 
};

FUNC INT DIA_Felos_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Felos_Hello_Info()
{
	AI_Output (other, self, "DIA_Felos_Hello_15_01"); //Co� Ci marnie idzie.
	AI_Output (self, other, "DIA_Felos_Hello_07_02"); //Mam ju� do�� tej cholernej areny. Od ka�dego dostaj� ci�gi.
	AI_Output (other, self, "DIA_Felos_Hello_15_03"); //To po co walczysz?
	AI_Output (self, other, "DIA_Felos_Hello_07_04"); //Na arenie t�uk� mnie rzadziej ni� w obozie, do tego Gomez lubi ogl�da� walki wi�c mam ma�e przywileje.
	AI_Output (other, self, "DIA_Felos_Hello_15_05"); //Hmm, wybra�e� mniejsze z�o.
	AI_Output (self, other, "DIA_Felos_Hello_07_06"); //Mniej, wi�cej. 
};

//***************************************

instance DIA_Felos_Arena (C_INFO)
{
	npc				= STT_343_Felos;
	condition		= DIA_Felos_Arena_Condition;
	information		= DIA_Felos_Arena_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jakie jest �ycie gladiatora?";
};

FUNC int  DIA_Felos_Arena_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Felos_Hello))
	{
		return 1;
	};
};
func void  DIA_Felos_Arena_Info()
{
	AI_Output (other, self,"DIA_Felos_Arena_Info_15_01"); //Jakie jest �ycie gladiatora?
	AI_Output (self, other,"DIA_Felos_Arena_Info_07_02"); //Je�eli jeste� dobry, to ca�kiem przyjemne.
	AI_Output (self, other,"DIA_Felos_Arena_Info_07_03"); //Stra�nicy schodz� Ci z drogi, ka�dy chce si� z Tob� napi�. Ba nawet czasami magnaci pozwalaj� zabawi� si� z jak�� panienk�.
	AI_Output (self, other,"DIA_Felos_Arena_Info_07_04"); //Ale przeci�tniacy dostaj� ostre baty. Krew, pot i �zy.
	AI_Output (self, other,"DIA_Felos_Arena_Info_07_05"); //Cho� to i tak lepsze ni� praca w kopalni.
};

//***************************************

instance DIA_Felos_ArenaFight (C_INFO)
{
	npc				= STT_343_Felos;
	condition		= DIA_Felos_ArenaFight_Condition;
	information		= DIA_Felos_ArenaFight_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_Felos_ArenaFight_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Felos_Arena))
	{
		return 1;
	};
};
func void  DIA_Felos_ArenaFight_Info()
{
	AI_Output (self, other,"DIA_Felos_ArenaFight_Info_07_01"); //Zaczekaj!
	AI_Output (other, self,"DIA_Felos_ArenaFight_Info_15_02"); //Tak?
	AI_Output (self, other,"DIA_Felos_ArenaFight_Info_07_03"); //Mam dla Ciebie propozycj�. Zarobisz kilka bry�ek i skopiesz czyje� dupsko. Co Ty na to?
	AI_Output (other, self,"DIA_Felos_ArenaFight_Info_15_04"); //Co to za szcz�ciarz?
	AI_Output (self, other,"DIA_Felos_ArenaFight_Info_07_05"); //Ci dwaj idioci na arenie. Ci�gle obrywam od nich �omot.
	AI_Output (self, other,"DIA_Felos_ArenaFight_Info_07_06"); //Chcia�bym cho� raz zobaczy�, jak kt�ry� z nich zbiera ci�gi.
};

//***************************************

instance DIA_Felos_ArenaOk (C_INFO)
{
	npc				= STT_343_Felos;
	condition		= DIA_Felos_ArenaOk_Condition;
	information		= DIA_Felos_ArenaOk_Info;
	important		= 0;
	permanent		= 0;
	description		= "Da si� za�atwi�.";
};

FUNC int  DIA_Felos_ArenaOk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Felos_ArenaFight))
	{
		return 1;
	};
};
func void  DIA_Felos_ArenaOk_Info()
{
	AI_Output (other, self,"DIA_Felos_ArenaOk_Info_15_01"); //Da si� za�atwi�.
	AI_Output (self, other,"DIA_Felos_ArenaOk_Info_07_02"); //Wystarczy, �e dokopiesz jednemu z nich. Dam Ci za to 200 bry�ek bo i tak nie mam co robi� z rud�.
	Log_CreateTopic	(CH3_Grd_Arena, LOG_MISSION);
	Log_SetTopicStatus	(CH3_Grd_Arena, LOG_RUNNING);
	B_LogEntry		(CH3_Grd_Arena, "Felos poprosi� mnie, �ebym z�oi� Trupismroda b�d� Aresa - gladiator�w z areny w Starym Obozie. To powinno by� �atwe.");
};

//***************************************

instance DIA_Felos_ArenaOk1 (C_INFO)
{
	npc				= STT_343_Felos;
	condition		= DIA_Felos_ArenaOk1_Condition;
	information		= DIA_Felos_ArenaOk1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ju� po sprawie.";
};

FUNC int  DIA_Felos_ArenaOk1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Dead_Provoke))&&(Npc_KnowsInfo(hero,DIA_Felos_ArenaOk))
	{
		return 1;
	};
};
func void  DIA_Felos_ArenaOk1_Info()
{
	var C_NPC dead; dead = Hlp_GetNpc(STT_344_Warrior);

	AI_Output (other, self,"DIA_Felos_ArenaOk1_Info_15_01"); //Ju� po sprawie.
	AI_Output (self, other,"DIA_Felos_ArenaOk1_Info_07_02"); //I jak Ci posz�o?

	if (Npc_GetAivar(dead,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (other, self,"DIA_Felos_ArenaOk1_Info_15_03"); //Niewiele zabrak�o, ju� prawie go mia�em...
		AI_Output (self, other, "DIA_Felos_ArenaOk1_Info_07_04"); //Prawie robi ogromn� r�nic�. Jeste� takim samym nieudacznikiem jak ja. Zejd� mi z oczu!
		Log_SetTopicStatus	(CH3_Grd_Arena, LOG_FAILED);
		B_LogEntry		(CH3_Grd_Arena, "Nie pokona�em Trupismroda. Felos nie by� zadowolony, z nagrod� mog� si� po�egna�");
		B_StopProcessInfos	( self );
	}
	else if (Npc_GetAivar(dead,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		AI_Output (other, self,"DIA_Felos_ArenaOk1_Info_15_04"); //To by� kr�tki spacerek. Trupismr�d �mierdzi jeszcze bardziej.
		AI_Output (self, other, "DIA_Felos_ArenaOk1_Info_07_06"); //W ko�cu kto� mu pokaza� gdzie jest miejsce takiego g�wna!
		AI_Output (self, other, "DIA_Felos_ArenaOk1_Info_07_07"); //To Twoja ruda - zas�u�y�e�.
		CreateInvItems (self, ItMiNugget,200);
		B_GiveInvItems (self, other, ItMiNugget, 200);
		AI_Output (self, other, "DIA_Felos_ArenaOk1_Info_07_08"); //Solidnie zapracowa�e� na te bry�ki. Mo�e teraz w ko�cu wygram jak�� walk�...
		AI_Output (other, self,"DIA_Felos_ArenaOk1_Info_15_09"); //Powodzenia na arenie.
		Log_SetTopicStatus	(CH3_Grd_Arena, LOG_SUCCESS);
		B_LogEntry		(CH3_Grd_Arena, "Pokona�em Trupismroda. Felos dotrzyma� s�owa. Szkoda, �e nie mog� cz�ciej powalczy� na arenie.");
	};
};
