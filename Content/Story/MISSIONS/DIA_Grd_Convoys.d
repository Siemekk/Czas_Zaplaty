// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Convoy1_Exit (C_INFO)
{
	npc			= Grd_4096_Convoy1;
	nr			= 999;
	condition	= DIA_Convoy_Exit_Condition;
	information	= DIA_Convoy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Convoy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Convoy_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_Convoy2_Exit (C_INFO)
{
	npc			= Grd_4097_Convoy2;
	nr			= 999;
	condition	= DIA_Convoy_Exit_Condition;
	information	= DIA_Convoy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                    

INSTANCE DIA_ConvoyCommander_Exit (C_INFO)
{
	npc			= Grd_4102_Convoy;
	nr			= 999;
	condition	= DIA_Convoy_Exit_Condition;
	information	= DIA_Convoy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

INSTANCE DIA_Convoy1_First (C_INFO)
{
	npc				= Grd_4096_Convoy1;
	nr				= 1;
	condition		= DIA_Convoy1_First_Condition;
	information		= DIA_Convoy1_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Convoy1_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Cord_ConvoysHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_Convoy1_First_Info()
{
	var C_NPC con; con = Hlp_GetNpc(Grd_4097_Convoy2);
	CreateInvItems (self,foodpackage,2);
	CreateInvItems (con,foodpackage,2);
	B_FullStop (hero);
	AI_GotoNpc(other, self);

	var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
   
	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other, "DIA_Convoy1_First_11_01"); //Ej, Ty! Sk�d� Ci� znam...
		AI_Output (other, self, "DIA_Convoy1_First_15_02"); //Mo�liwe, niedawno Gomez wys�a� mnie zreszt� ludzi do Fletchera. Mia�em wyj�� wam naprzeciw i sprawdzi�, czy aby nie ze�arli�cie ca�ego towaru.
		AI_Output (self, other, "DIA_Convoy1_First_11_03"); //Za kogo nas masz!
		AI_Output (other, self, "DIA_Convoy1_First_15_04"); //Za wiecznie g�odnych sukinsyn�w, kt�rym nie chce si� dupy ruszy� na czas.
		AI_Output (self, other, "DIA_Convoy1_First_11_05"); //Dobra, ju� dobra. Zaraz...
		AI_Output (self, other, "DIA_Convoy1_First_11_06"); //Ju� wiem, gdzie Ci� widzia�em! To Ty brata�e� si� z tym zdrajc� Urtem!
		AI_Output (self, other, "DIA_Convoy1_First_11_07"); //To pies rebeliant�w, zar�n�� sukinsyna!
	}
	else
	{
		AI_Output (self, other, "DIA_Convoy1_First_11_08"); //Parszywy pies rebeliant�w przyszed� po swoj� �mier�!
	};

	B_LogEntry(CH5_NC_Convoys, "Znalaz�em konwojent�w. Musz� zabra� im paczki zanim wszystko ze�r�!");
	B_StopProcessInfos(self);

	B_StartAfterDialogFight(self,other,true);
   B_StartAfterDialogFight(con,other,true);
};           

INSTANCE DIA_ConvoyCommander_First (C_INFO)
{
	npc				= Grd_4102_Convoy;
	nr				= 1;
	condition		= DIA_ConvoyCommander_First_Condition;
	information		= DIA_ConvoyCommander_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_ConvoyCommander_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Cord_ConvoysPeople))
	{
		return 1;
	};
};

FUNC VOID DIA_ConvoyCommander_First_Info()
{
	var C_NPC con1; con1 = Hlp_GetNpc(Grd_4103_Convoy);
	var C_NPC con2; con2 = Hlp_GetNpc(Grd_4104_Convoy);
	var C_NPC con3; con3 = Hlp_GetNpc(Grd_4105_Convoy);
	
	CreateInvItems (self,convoy_list,1);	
	
	B_FullStop (hero);
	AI_GotoNpc(other, self);

	var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
   
	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other, "DIA_ConvoyCommander_First_11_01"); //Kto� ty?
		AI_Output (other, self, "DIA_ConvoyCommander_First_15_02"); //Tw�j najgorszy koszmar.
	};

	AI_Output (self, other, "DIA_ConvoyCommander_First_11_03"); //No prosz�, kolejne �cierwo wchodzi pod n�.	

	B_LogEntry(CH5_NC_Convoys, "Znalaz�em konwojent�w. Czas wys�a� ich do Beliara.");
	B_StopProcessInfos(self);

	B_StartAfterDialogFight(self,other,true);
	B_StartAfterDialogFight(con1,other,true);
	B_StartAfterDialogFight(con2,other,true);
	B_StartAfterDialogFight(con3,other,true);
};