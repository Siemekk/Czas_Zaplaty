
/************************

Merc officer 1
************************/



// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Merc1_Exit (C_INFO)
{
	npc			= SLD_4094_Merc_Off1;
	nr			= 999;
	condition	= DIA_Merc1_Exit_Condition;
	information	= DIA_Merc1_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Merc1_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Merc1_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************

INSTANCE DIA_Merc1_Hi (C_INFO)
{
	npc				= SLD_4094_Merc_Off1;
	nr				= 1;
	condition		= DIA_Merc1_Hi_Condition;
	information		= DIA_Merc1_Hi_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jeste�?"; 
};

FUNC INT DIA_Merc1_Hi_Condition()
{

	return 1;

};

FUNC VOID DIA_Merc1_Hi_Info()
{

	AI_Output (other, self, "DIA_Merc1_Hi_15_01"); //Kim jeste�?
	AI_Output (self, other, "DIA_Merc1_Hi_11_02"); //Kim� kto pr�buje zrobi� z tej bandy moczymord porz�dnych �o�nierzy.
	B_StopProcessInfos	(self);
};




// **************************************************
// 					
// **************************************************


INSTANCE DIA_Merc1_First (C_INFO)
{
	npc				= SLD_4094_Merc_Off1;
	nr				= 2;
	condition		= DIA_Merc1_First_Condition;
	information		= DIA_Merc1_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Merc1_First_Condition()
{

	if (task_choice == 3)
	{
		return 1;
	};


};

FUNC VOID DIA_Merc1_First_Info()
{

	/****************************
Ork wrzu� tu z 5 najemnik�w, niech po dialogu przy��cz� si� do dicka razem z dow�dc�

	var C_NPC merc1; merc1 = Hlp_GetNpc(SLD_???_Merc);
.
.
.
.

*************************************/
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Merc1_First_11_01"); //M�j oddzia� jest ju� got�w do drogi.
	AI_Output (other, self, "DIA_Merc1_First_15_02"); //W porz�dku, ruszajmy do Gniazda.
	//AI_TurnToNpc(self, merc1);
	//AI_Output (self, other, "DIA_Merc1_First_11_03"); //Ruszcie dupy, chyba nie chcecie �y� wiecznie?!
	//AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Merc1_First_11_04"); //Ty przodem.
	B_LogEntry		(CH5_NO_Guards, "Do��czy� do mnie pierwszy oddzia� najemnik�w.");
	B_NC_1MERC();
	B_StopProcessInfos	(self);

};



// **************************************************


INSTANCE DIA_Merc1_Done (C_INFO)
{
	npc				= SLD_4094_Merc_Off1;
	nr				= 3;
	condition		= DIA_Merc1_Done_Condition;
	information		= DIA_Merc1_Done_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Merc1_Done_Condition()
{
	var C_NPC g1; g1 = Hlp_GetNpc(GRD_900_Scatty);
	var C_NPC g2; g2 = Hlp_GetNpc(Grd_2539_PatrolGRD);	

	if (Npc_KnowsInfo(hero,DIA_Merc1_First))&&(Npc_IsDead(g1))&&(Npc_IsDead(g2))
	{
		return 1;
	};
};

FUNC VOID DIA_Merc1_Done_Info()
{

	/****************************
Ork tu ma sprawdza� czy stra�nicy z tego posterunku �yj� czy nie
Mo�e z 5-6 stra�nik�w

	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_???_Grd1);
.
.
.
.
.
.

Na ko�cu dow�dca i jego oddzia� maj� obsadzi� 1 plac�wk�

*************************************/

	merc_done = merc_done + 1;

	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Merc1_Done_11_01"); //To nasz posterunek.
	//if 
	//{
	AI_Output (self, other, "DIA_Merc1_Done_11_02"); //Skoro stra�nicy nie �yj� zabezpieczymy teren. 
	//}
	//else
	//{
	//AI_Output (self, other, "DIA_Merc1_Done_11_03"); //Wyr�niemy reszt� stra�nik�w i zabezpieczymy plac�wk�. 
	//};
	AI_Output (other, self, "DIA_Merc1_Done_15_04"); //Uwa�ajcie na siebie.

	B_LogEntry		(CH5_NO_Guards, "Pierwszy oddzia� dotar� na miejsce.");

	if (merc_done == 2)
	{
		B_LogEntry		(CH5_NO_Guards, "Misja sko�czona, czas wr�ci� do Lee.");
	};
	B_NC_1AMERC();
	B_StopProcessInfos	(self);
};

/************************

Merc officer 2
************************/

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Merc2_Exit (C_INFO)
{
	npc			= SLD_4095_Merc_Off2;
	nr			= 999;
	condition	= DIA_Merc2_Exit_Condition;
	information	= DIA_Merc2_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Merc2_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Merc2_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************

INSTANCE DIA_Merc2_Hi (C_INFO)
{
	npc				= SLD_4095_Merc_Off2;
	nr				= 1;
	condition		= DIA_Merc2_Hi_Condition;
	information		= DIA_Merc2_Hi_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czym si� zajmujesz?"; 
};

FUNC INT DIA_Merc2_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_Merc2_Hi_Info()
{
	AI_Output (other, self, "DIA_Merc2_Hi_15_01"); //Czym si� zajmujesz?
	AI_Output (self, other, "DIA_Merc2_Hi_11_02"); //Kopaniem w dup� rekrut�w! Zejd� mi z oczu.
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Merc2_First (C_INFO)
{
	npc				= SLD_4095_Merc_Off2;
	nr				= 1;
	condition		= DIA_Merc2_First_Condition;
	information		= DIA_Merc2_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Merc2_First_Condition()
{
	if (task_choice == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_Merc2_First_Info()
{

	/****************************
Ork wrzu� tu z 5 najemnik�w, niech po dialogu przy��cz� si� do dicka razem z dow�dc�

	var C_NPC merc6; merc6 = Hlp_GetNpc(SLD_???_Merc);
.
.
.
.

*************************************/
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Merc2_First_11_01"); //Podobno to Ty masz nas poprowadzi� do Orlego Gniazda.
	AI_Output (other, self, "DIA_Merc2_First_15_02"); //Niestety. Jeste�cie gotowi?
	//AI_TurnToNpc(self, merc6);
	AI_Output (self, other, "DIA_Merc2_First_11_03"); //Nie mniej ni� zawsze, co nie ch�opaki!
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Merc2_First_11_04"); //Prowad�.
	B_LogEntry		(CH5_NO_Guards, "Do��czy� do mnie drugi oddzia� najemnik�w.");
	B_NC_2MERC();
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Merc2_Done (C_INFO)
{
	npc				= SLD_4095_Merc_Off2;
	nr				= 3;
	condition		= DIA_Merc2_Done_Condition;
	information		= DIA_Merc2_Done_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Merc2_Done_Condition()
{
	/******************
place2 to wp w tym 2 posterunku do wyrzni�cia
*****************/

	if  (Npc_GetDistToWP (self,"NC_EN1_CROSSING") < 500 )&&(Npc_KnowsInfo(hero,DIA_Merc2_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Merc2_Done_Info()
{

	/****************************
Ork tu ma sprawdza� czy stra�nicy z tego posterunku �yj� czy nie
Mo�e z 5-6 stra�nik�w

	var C_NPC grd7; grd7 = Hlp_GetNpc(GRD_???_Grd7);
.
.
.
.
.
.

Na ko�cu dow�dca i jego oddzia� maj� obsadzi� 2 plac�wk�

*************************************/


	merc_done = merc_done + 1;

	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Merc2_Done_11_01"); //�mierdzi szczynami, to w�a�ciwe miejsce.
	//if (Npc_IsDead(grd7))&&(Npc_IsDead(grd8))&&(Npc_IsDead(grd9))&&(Npc_IsDead(grd10))&&(Npc_IsDead(grd11))&&(Npc_IsDead(grd12))
	//{
	AI_Output (self, other, "DIA_Merc2_Done_11_02"); //obsadzimy posterunek.
	//}
	//else
	//{
	//AI_Output (self, other, "DIA_Merc2_Done_11_03"); //Wyr�niemy sukinsyn�w i obsadzimy posterunek. 
	//};
	AI_Output (other, self, "DIA_Merc2_Done_15_04"); //Nie dajcie si� zabi�.

	B_LogEntry		(CH5_NO_Guards, "Drugi oddzia� dotar� na miejsce.");

	if (merc_done == 2)
	{
		B_LogEntry		(CH5_NO_Guards, "Misja sko�czona, czas wr�ci� do Lee.");
	};
   
	B_NC_2AMERC();

	B_StopProcessInfos	(self);
}; 
