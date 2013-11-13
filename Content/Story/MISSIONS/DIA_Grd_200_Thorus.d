// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Thorus_EXIT(C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 999;
	condition	= Info_Thorus_EXIT_Condition;
	information	= Info_Thorus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Thorus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Thorus_EXIT_Info()
{	
	B_StopProcessInfos(self);
};

// ************************************************************
// 					Nur Gomez Leute in Burg
// ************************************************************

INSTANCE Info_Thorus_EnterCastle(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_EnterCastle_Condition;
	information	= Info_Thorus_EnterCastle_Info;
	permanent	= 0;
	description = "Pewnie nie b�dziesz chcia� wpu�ci� mnie do zamku?";
};                       

FUNC INT Info_Thorus_EnterCastle_Condition()
{	
	return 1;
};

FUNC VOID Info_Thorus_EnterCastle_Info()
{	
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Pewnie nie b�dziesz chcia� wpu�ci� mnie do zamku?
	AI_Output (self, other,"Info_EnterCastle1_09_01"); //A co mnie to obchodzi? R�b, co chcesz. Pod warunkiem, �e zap�acisz.
	AI_Output (other, self,"Info_EnterCastle1_15_02"); //Ile?
	AI_Output (self, other,"Info_EnterCastle1_09_03"); //Standardowa wej�ci�wka to 1000 bry�ek.
};

// ************************************************************
// 						Give1000Ore					
// ************************************************************

INSTANCE Info_Thorus_Give1000Ore (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 5;
	condition	= Info_Thorus_Give1000Ore_Condition;
	information	= Info_Thorus_Give1000Ore_Info;
	permanent	= 1;
	description = "Masz tu swoje 1000 bry�ek rudy, a teraz pozw�l mi przej��!";
};                       

FUNC INT Info_Thorus_Give1000Ore_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_EnterCastle))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Give1000Ore_Info()
{
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //Masz tu swoje 1000 bry�ek rudy, a teraz pozw�l mi przej��!
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //W porz�dku, id�. Tylko jak ju� b�dziesz w �rodku, nie wywi� czego� g�upiego, dobra?

		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		Npc_SetAivar(wache212,AIV_PASSGATE,  TRUE);
		Npc_SetAivar(wache213,AIV_PASSGATE,  TRUE);
		Npc_SetAivar(wache218,AIV_PASSGATE,  TRUE);
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Pr�bujesz mnie okpi�, ch�opcze? Nie masz 1000 bry�ek rudy!
	};
};

// ************************************************************
// 					PERM2
// ************************************************************

INSTANCE Info_Thorus_PERM2 (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_PERM2_Condition;
	information	= Info_Thorus_PERM2_Info;
	permanent	= 0;
	description = "Jak si� masz?";
};                       

FUNC INT Info_Thorus_PERM2_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_Give1000Ore))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_PERM2_Info()
{
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Jak si� masz?
	AI_Output (self, other,"Info_Thorus_PERM21_09_01"); //Bywa�o lepiej. Po prostu robi� wszystko, �eby prze�y�.
};	
