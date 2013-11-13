// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Edwin_Exit (C_INFO)
{
	npc			= Grd_4081_Edwin;
	nr			= 999;
	condition	= DIA_Edwin_Exit_Condition;
	information	= DIA_Edwin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Edwin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Edwin_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int ed_fight;

INSTANCE DIA_Edwin_First (C_INFO)
{
	npc				= Grd_4081_Edwin;
	nr				= 1;
	condition		= DIA_Edwin_First_Condition;
	information		= DIA_Edwin_First_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak tu trafi�e�?"; 
};

FUNC INT DIA_Edwin_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Edwin_First_Info()
{
	var C_NPC pom; pom = Hlp_GetNpc(Grd_4080_Pomroka);

	AI_Output (other, self, "DIA_Edwin_First_15_01"); //Jak tu trafi�e�?
   
	if (Npc_GetAivar(pom,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Edwin_First_11_02"); //To Ty z�oi�e� Pomrok�?
		AI_Output (other, self, "DIA_Edwin_First_15_03"); //Mia�em t� w�tpliw� przyjemno��.
		AI_Output (self, other, "DIA_Edwin_First_11_04"); //Nie chc� �adnych k�opot�w!
		AI_Output (other, self, "DIA_Edwin_First_15_05"); //Wi�c odpowiedz na proste pytanie. Jak si� tu znalaz�e�?
		AI_Output (self, other, "DIA_Edwin_First_11_06"); //Nale�a�em do jednego z patroli, kt�re przepatrywa�y teren w pobli�u Starego Obozu.
		AI_Output (self, other, "DIA_Edwin_First_11_07"); //Pech chcia�, �e natkn�li�my si� na kilku rebeliant�w. Tylko ja prze�y�em, a te mendy wrzuci�y mnie do G��bi.
		AI_Output (self, other, "DIA_Edwin_First_11_08"); //Ca�y czas �a�uj�, �e nie zgin��em w walce...
		AI_Output (other, self, "DIA_Edwin_First_15_09"); //Ciekawe... Jest st�d jakie� wyj�cie?
		AI_Output (self, other, "DIA_Edwin_First_11_10"); //Wyj�cie? Gdyby by�o to od dawna bym tu nie siedzia�!
		AI_Output (self, other, "DIA_Edwin_First_11_11"); //Jeste�my jak trupy pogrzebane �ywcem...
		B_LogEntry(CH2_NON_Deep, "Podobno z G��bi nie mo�na zbiec. Ciekawe...");	
		B_StopProcessInfos(self); 
	}
	else
	{
		ed_fight = true;
		AI_Output (self, other, "DIA_Edwin_First_11_12"); //Nie wystarczy, �e Pomroka obi� Ci ryj? Chcesz wi�cej?
		AI_Output (other, self, "DIA_Edwin_First_15_13"); //Zapyta�em tylko...
		AI_Output (self, other, "DIA_Edwin_First_11_14"); //A jednak chcesz wi�cej!
		B_StopProcessInfos	(self); 
		B_StartAfterDialogFight(self,other,false);
	};
};

INSTANCE DIA_Edwin_After (C_INFO)
{
	npc				= Grd_4081_Edwin;
	nr				= 2;
	condition		= DIA_Edwin_After_Condition;
	information		= DIA_Edwin_After_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Edwin_After_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Edwin_First ))&&(ed_fight == TRUE)&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Edwin_After_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);

	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Edwin_After_07_01"); //Podoba�o si�? Chcesz wi�cej?
		AI_Output (other, self, "DIA_Edwin_After_15_02"); //Nie, dzi�ki.
		AI_Output (self, other, "DIA_Edwin_After_07_03"); //Zejd� mi z oczu, mi�czaku!
		B_StopProcessInfos(self); 
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		B_GiveXP(200);
		AI_Output (self, other, "DIA_Edwin_After_07_04"); //Ty gnoju?! Spieprzaj zanim p�jd� po kumpli...
		AI_Output (other, self, "DIA_Edwin_After_No_15_05"); //W�tpi�, �e takie �cierwo jak ty ma tu jakiego� kamrata.
		AI_Output (self, other, "DIA_Edwin_After_07_06"); //Na kosmate jaja Beliara, to nie mo�e si� tak sko�czy�...
		AI_DrawWeapon (self);
		AI_Output (other, self, "DIA_Edwin_After_No_15_07"); //Chcesz zgin�� tylko dlatego, �e zapyta�em, jak tu trafi�e�?
		AI_Output (self, other, "DIA_Edwin_After_07_08"); //Gi� popapra�cu!
		B_StopProcessInfos(self); 
      B_StartAfterDialogFight(self,other,true);
	};
};
