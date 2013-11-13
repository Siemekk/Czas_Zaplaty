// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_ArtifactGuardian_EXIT (C_INFO)
{
	npc			= ArtifactGuardian;
	nr			= 999;
	condition	= DIA_ArtifactGuardian_EXIT_Condition;
	information	= DIA_ArtifactGuardian_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ArtifactGuardian_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_ArtifactGuardian_EXIT_Info()
{	
	B_StopProcessInfos(self);
	Npc_SetAivar(self,AIV_MM_TALKEDAFTERATTACK,  TRUE);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_ArtifactGuardian_Hello (C_INFO)
{
	npc			= ArtifactGuardian;
	nr			= 1;
	condition	= DIA_ArtifactGuardian_Hello_Condition;
	information	= DIA_ArtifactGuardian_Hello_Info;
	important	= 1;
	description	= "Ciu� ciu� Sher nie uzywaj wi�cej gothic sourcera :D";//Spadaj Ork :D
};                       

FUNC INT DIA_ArtifactGuardian_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_ArtifactGuardian_Hello_Info()
{	
	AI_Output(self, other,"DIA_ArtifactGuardian_Hello_19_00"); //WY N�DZNE �MIERTELNE STWORZONKA, NIE WIECIE KIEDY PRZESTA�!
	Info_ClearChoices(DIA_ArtifactGuardian_Hello );
	Info_AddChoice(DIA_ArtifactGuardian_Hello,"Zejd� mi z drogi umarlaku!"	,DIA_ArtifactGuardian_GoAway);
	Info_AddChoice(DIA_ArtifactGuardian_Hello,"Gadaj�cy truposz?"	,DIA_ArtifactGuardian_StopWhat);
};
FUNC VOID DIA_ArtifactGuardian_GoAway()
{	
	AI_Output(other, self,"DIA_ArtifactGuardian_GoAway_15_00"); //Zejd� mi z drogi umarlaku!
	AI_Output(self, other,"DIA_ArtifactGuardian_GoAway_19_01"); //TEN ARTEFAKT CZEKA NA WYBRA�CA, KT�RY B�DZIE W STANIE POJ�� JEGO POT�G� I ROZWA�NIE JEJ...
	AI_Output(other, self,"DIA_ArtifactGuardian_GoAway_15_02"); //Znowu jakie� pierdolenie o wybra�cach. Rozumiem, �e nie oddasz �wiecide�ka po dobroci?
	AI_Output(self, other,"DIA_ArtifactGuardian_GoAway_19_03"); //ON NIE JEST TOBIE PRZEZNACZONY!
	AI_Output(other, self,"DIA_ArtifactGuardian_GoAway_15_04"); //Dobra, miejmy to ju� za sob�.
	B_StopProcessInfos(self);	
	Npc_SetTarget(self,other);
	AI_Attack(self);	
	Npc_SetAivar(self,AIV_MM_TALKEDAFTERATTACK,  TRUE);
};
FUNC VOID DIA_ArtifactGuardian_StopWhat()
{	
	AI_Output(other, self,"DIA_ArtifactGuardian_StopWhat_15_00"); //Gadaj�cy truposz?
	AI_Output(self, other,"DIA_ArtifactGuardian_StopWhat_19_01"); //PR�BUJESZ POSI��� MOC, KT�REJ NIE POJMUJESZ, TA POT�GA NIE DO CIEBIE NALE�E� B�DZIE.
	Info_ClearChoices(DIA_ArtifactGuardian_Hello );
	Info_AddChoice(DIA_ArtifactGuardian_Hello,"A ja chcia�em po dobroci..."	,DIA_ArtifactGuardian_BelongToMe);
	Info_AddChoice(DIA_ArtifactGuardian_Hello,"Sporo gadasz jak na truposza."	,DIA_ArtifactGuardian_UAreStupid);

};
FUNC VOID DIA_ArtifactGuardian_BelongToMe()
{	
	AI_Output(other, self,"DIA_ArtifactGuardian_BelongToMe_15_00"); //A ja chcia�em po dobroci...
	B_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_Attack(self);	
	Npc_SetAivar(self,AIV_MM_TALKEDAFTERATTACK,  TRUE);
};
FUNC VOID DIA_ArtifactGuardian_UAreStupid()
{	
	AI_Output(other, self,"DIA_ArtifactGuardian_UAreStupid_15_00"); //Sporo gadasz jak na truposza.
	AI_Output(self, other,"DIA_ArtifactGuardian_UAreStupid_19_01"); //MILCZ �MIERTELNIKU! NIE JESTE� W STANIE POJ�� POT�GI MAGII BELIARA!
	AI_Output(other, self,"DIA_ArtifactGuardian_UAreStupid_15_02"); //Do tego od rzeczy. Mo�emy mie� to ju� za sob�?
	AI_Output(self, other,"DIA_ArtifactGuardian_UAreStupid_19_03"); //ARGH!!! ZAMILKNIJ NA WIEKI!
	B_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_Attack(self);	
	Wld_PlayEffect("spellFX_MassDeath_GROUND", self, self, 1, 0, DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
	Wld_SpawnNpcRange(self,	Skeleton, 1, 200);
	Wld_SpawnNpcRange(self,	Skeleton, 1, 200);	
	Npc_SetAivar(self,AIV_MM_TALKEDAFTERATTACK,  TRUE);
};
