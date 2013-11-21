// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kam_Exit (C_INFO)
{
	npc			= GRD_2512_Kam;
	nr			= 999;
	condition	= DIA_Kam_Exit_Condition;
	information	= DIA_Kam_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kam_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kam_Exit_Info()
{
	B_StopProcessInfos(self);
};

func void B_Kam_Fight()
{
   var c_npc thug1; 
   var c_npc thug2;
   var c_npc kam;
   
	thug1 = hlp_getnpc(GRD_2520_Thug);	
	thug2 = hlp_getnpc(GRD_2521_Thug);
   kam = hlp_getnpc(GRD_2512_Kam);
   
	B_StopProcessInfos(kam);
	
   B_StartAfterDialogFight(thug1, other, true);
	B_StartAfterDialogFight(thug2, other, true);
	B_StartAfterDialogFight(kam, other, true);
   Npc_SetPermAttitude	(kam, ATT_HOSTILE);
   Npc_SetPermAttitude	(thug1, ATT_HOSTILE);
   Npc_SetPermAttitude	(thug2, ATT_HOSTILE);
};

INSTANCE DIA_Kam_First (C_INFO)
{
	npc				= GRD_2512_Kam;
	nr				= 1;
	condition		= DIA_Kam_First_Condition;
	information		= DIA_Kam_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Kam_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)//&&(!Npc_KnowsInfo (hero, DIA_Gorn_RebelTalk))
	{
		return 1;
	};
};

FUNC VOID DIA_Kam_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);
	//TODO: Modyfy that crappy dialog
	AI_Output (self, other, "DIA_Kam_First_11_01"); //Ej ty!
	AI_Output (self, other, "DIA_Kam_First_11_02"); //My�la�e�, �e tak po prostu t�dy przejdziesz?
	AI_Output (self, other, "DIA_Kam_First_11_03"); //Spacer po obozie b�dzie Ci� kosztowa� 100 bry�ek rudy. 
	AI_Output (self, other, "DIA_Kam_First_11_04"); //P�a�, albo b�dziesz wybiera� w�asne z�by z b�ota.
	
	Info_ClearChoices (DIA_Kam_First);
	Info_AddChoice (DIA_Kam_First, "Nie mam rudy!", DIA_Kam_First_ORly);
	Info_AddChoice (DIA_Kam_First, "Lepiej zejd� mi z drogi!", DIA_Kam_First_FuckU);
	
   if(NPC_HasItems(other,ItMiNugget)>=100)
	{
		Info_AddChoice (DIA_Kam_First, "Prosz�, oto 100 bry�ek rudy. ", DIA_Kam_First_TakeIt);
	};
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kam_First_ORly()
{
	AI_Output (other, self, "DIA_Kam_First_ORly_15_01"); //Nie mam rudy!
	AI_Output (self, other, "DIA_Kam_First_ORly_11_02"); //To si� jeszcze oka�e!
	
   B_Kam_Fight();
};

FUNC VOID DIA_Kam_First_FuckU()
{
	AI_Output (other, self, "DIA_Kam_First_FuckU_15_01"); //Lepiej zejd� mi z drogi!
	AI_Output (self, other, "DIA_Kam_First_FuckU_11_02"); //Mniej bole�nie by�oby odda� rud�.
	
   B_Kam_Fight();
};

FUNC VOID DIA_Kam_First_TakeIt()
{
	AI_Output (other, self, "DIA_Kam_First_TakeIt_15_01"); //Prosz�, oto 100 bry�ek rudy.
	AI_Output (self, other, "DIA_Kam_First_TakeIt_11_02"); //Mi�czak, mo�esz przej��.
	
   B_GiveInvItems(other,self,ItmiNugget,100);
	Npc_Removeinvitems(self,ItmiNugget,100);
	B_StopProcessInfos(self);
};
