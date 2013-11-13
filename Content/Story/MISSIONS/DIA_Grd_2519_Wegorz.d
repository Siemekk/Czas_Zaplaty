
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Wegorz_Exit (C_INFO)
{
	npc			= Grd_2519_Wegorz;
	nr			= 999;
	condition	= DIA_Wegorz_Exit_Condition;
	information	= DIA_Wegorz_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wegorz_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Wegorz_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					
// **************************************************

INSTANCE DIA_Wegorz_First (C_INFO)
{
	npc				= Grd_2519_Wegorz;
	nr				= 1;
	condition		= DIA_Wegorz_First_Condition;
	information		= DIA_Wegorz_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Wegorz_First_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_OrnamentMap))&&(Npc_GetDistToNpc(self,hero) < 4500)&&(map3_readbydick == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Wegorz_First_Info()
{
	/************************
	Ork ten grd1 ma by� w miar� blisko w�gorza, jak si� walka rozpocznie to reszta stra�nik�w ma podej�� i wiwatowa� walcz�cy, tylko wtedy dick mo�e przej�� do miejsca gdzie ukryto klejnot, walka ma trwa� dop�ki gracz nie znajdzie kamienia i nie wr�ci, wtedy kolejny dialog si� odpali
	************************/
   var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);

	//TODO: CInematic
	B_FullStop (hero);
	AI_TurnToNpc(self, NULL);
	AI_Output (self, NULL, "DIA_Wegorz_First_11_01"); //Ern, nie �pij na warcie! Ten skurwiel mo�e si� pojawi� w ka�dej chwili.
	AI_TurnToNpc(grd1, self);
	AI_Output (NULL, self, "DIA_Wegorz_First_11_02"); //Przesta� pieprzy� W�gorz. Wiem, co mam robi�, a s�ucha� b�d� tylko Hrabiego.
	AI_Output (self, NULL, "DIA_Wegorz_First_11_03"); //Do powrotu szefa to ja m�wi� co mo�na, a czego nie! 
	AI_Output (NULL, self, "DIA_Wegorz_First_11_04"); //Jak b�d� chcia� si� odla� to te� mam pyta�? A mo�e chcesz mi potrzyma� dziecior�bk�?
	AI_DrawWeapon (self);
	AI_Output (self, NULL, "DIA_Wegorz_First_11_05"); //Uwa�aj, co m�wisz suczy synu!
	AI_Output (NULL, self, "DIA_Wegorz_First_11_06"); //Sam si� o to prosisz!
	AI_DrawWeapon (grd1);

	//AI_Output (other, other, "DIA_Wegorz_First_15_07"); //Bijcie si� idioci, to dla mnie idealny moment, �eby zdoby� kamie�!

	B_LogEntry(CH3_NON_Ornament, "Stra�nicy wdali si� mi�dzy sob� w b�jk�. To dla mnie idealny moment na zdobycie ornamentu, kt�ry musi by� ukryty gdzie� w jaskini!");
	B_StopProcessInfos(self);

	/*************************
	Czyli W�gorz i gd1 zaczynaj� walk�  - oczywiscie nie moga si� pozabija�, hp co najwy�ej do po�owy niech im zleci, a stra�nicy podchodz� i wiwatuj�. to jedyny moment, �eby gracz m�g� podej�� i ukra�� ornament

	*************************/

	Npc_SetTarget (self,grd1);
	B_StartAfterDialogFight(self,grd1,false);
	Npc_SetTarget (grd1,self);
	B_StartAfterDialogFight(grd1,self,false);

	Npc_ExchangeRoutine(grd1,"FIGHT");

	PrintScreen	("Teraz albo nigdy!", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
};

// **************************************************Dialog 2 stra�nika, nie bior�cego udzia�u w walce******************

//CINEMATIC
/*
INSTANCE DIA_Grd2_Alarm (C_INFO)
{
	npc				= GRD_2515_Guard;
	nr				= 2;
	condition		= DIA_Grd2_Alarm_Condition;
	information		= DIA_Grd2_Alarm_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Grd2_Alarm_Condition()
{

	if (Npc_KnowsInfo(hero,DIA_Wegorz_First))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(NPC_HasItems(other,orn3)>=1)
	{
		return 1;
	};


};

FUNC VOID DIA_Grd2_Alarm_Info()
{

	var C_NPC hrab; hrab = Hlp_GetNpc(GRD_4010_Hrabia);

	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC weg; weg = Hlp_GetNpc(GRD_2519_Wegorz);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);


	B_FullStop (hero);
	AI_TurnToNpc(self, hrab);
	AI_Output (self, hrab, "DIA_Grd2_Alarm_11_01"); //Co do cholery...
	AI_TurnToNpc(self, weg);
	AI_Output (self, weg, "DIA_Grd2_Alarm_11_02"); //O kur... Ch�opaki chowa� bro�, szef idzie!


	/************
	Hrabia podchodzi do stra�nika
	**************/
/*
	AI_GotoNpc(hrab,self);
*/

/***************
	albo daj doj�cie do wp mo�e b�dzie lepiej.
	AI_GotoWP (hrab, "jakis_wp");

	*****************/
/*
	B_StopProcessInfos	(self);
*/
/************************************
	
	Ork trzeba zrobi� tak, �eby grd1 i w�gorz przestali walczy� i razem z reszt� maj� si� ustawi� w szerego i czeka� na Hrabiego

	**********************************/
/*	Npc_ExchangeRoutine(weg,"Wait");
	Npc_ExchangeRoutine(grd1,"Wait");
	Npc_ExchangeRoutine(grd2,"Wait");
	Npc_ExchangeRoutine(grd3,"Wait");
	Npc_ExchangeRoutine(grd4,"Wait");
	Npc_ExchangeRoutine(grd5,"Wait");

};
*/

// **************************************************

INSTANCE DIA_Wegorz_First1 (C_INFO)
{
	npc				= Grd_2519_Wegorz;
	nr				= 1;
	condition		= DIA_Wegorz_First1_Condition;
	information		= DIA_Wegorz_First1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Wegorz_First1_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_OrnamentMapAgain))&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Wegorz_First1_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, hero);
	AI_Output (self, hero, "DIA_Wegorz_First1_11_01"); //Rusz dup�, szef czeka za drzwiami.
	AI_Output (self, hero, "DIA_Wegorz_First1_11_02"); //Tylko pami�taj, �adnych gwa�townych ruch�w, z�amasie!	
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Wegorz_Wait (C_INFO)
{
	npc				= Grd_2519_Wegorz;
	nr				= 3;
	condition		= DIA_Wegorz_Wait_Condition;
	information		= DIA_Wegorz_Wait_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Wegorz_Wait_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hrabia_LastOrn))
	{
		return 1;
	};
};

FUNC VOID DIA_Wegorz_Wait_Info()
{
	AI_Output (self, other, "DIA_Wegorz_Wait_11_01"); //Nie wracaj tu bez ornament�w, z�amasie!
	B_StopProcessInfos(self);
};

INSTANCE DIA_Wegorz_Teleport (C_INFO)
{
	npc				= Grd_2519_Wegorz;
	nr				= 3;
	condition		= DIA_Wegorz_Teleport_Condition;
	information		= DIA_Wegorz_Teleport_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Wegorz_Teleport_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Wegorz_Wait))
	{
		return 1;
	};
};

FUNC VOID DIA_Wegorz_Teleport_Info()
{
	B_StopProcessInfos(self);
   B_StopProcessInfos(hero);

	AI_Teleport(hero, "LOCATION_19_03_ROOM6_BARRELCHAMBER2");
};

// **************************************************

INSTANCE DIA_Wegorz_Wait1 (C_INFO)
{
	npc				= Grd_2519_Wegorz;
	nr				= 3;
	condition		= DIA_Wegorz_Wait1_Condition;
	information		= DIA_Wegorz_Wait1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Wegorz_Wait1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Wegorz_Wait))
	{
		return 1;
	};
};

FUNC VOID DIA_Wegorz_Wait1_Info()
{
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);

	if (ornament_wait >= Wld_GetDay())
	{
		AI_Output (self, other, "DIA_Wegorz_Wait1_11_01"); //Nie wracaj tu bez ornament�w, z�amasie!
		B_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other, "DIA_Wegorz_Wait1_11_01"); //Gdzie s� moje ornamenty?!
		AI_Output (self, other, "DIA_Wegorz_Wait1_11_01"); //Zar�n�� tego wieprza!
      
		Npc_SetTempAttitude(self, ATT_HOSTILE); Npc_SetAttitude(self, ATT_HOSTILE);
		Npc_SetTempAttitude(grd1, ATT_HOSTILE); Npc_SetAttitude(grd1, ATT_HOSTILE);
		Npc_SetTempAttitude(grd2, ATT_HOSTILE); Npc_SetAttitude(grd2, ATT_HOSTILE);
		Npc_SetTempAttitude(grd3, ATT_HOSTILE); Npc_SetAttitude(grd3, ATT_HOSTILE);
		Npc_SetTempAttitude(grd4, ATT_HOSTILE); Npc_SetAttitude(grd4, ATT_HOSTILE);
		Npc_SetTempAttitude(grd5, ATT_HOSTILE); Npc_SetAttitude(grd5, ATT_HOSTILE);
	};
};
