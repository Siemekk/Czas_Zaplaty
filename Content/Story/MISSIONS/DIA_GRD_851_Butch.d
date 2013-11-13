// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Butch_Exit (C_INFO)
{
	npc			= GRD_851_Butch;
	nr			= 999;
	condition	= DIA_Butch_Exit_Condition;
	information	= DIA_Butch_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Butch_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Butch_Exit_Info()
{
	B_StopProcessInfos(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance DIA_Butch_Hello (C_INFO)
{
	npc				= GRD_851_Butch;
	nr				= 1;
	condition		= DIA_Butch_Hello_Condition;
	information		= DIA_Butch_Hello_Info;
	important		= 0;
	description		= "Kim jeste�?";
};

FUNC int  DIA_Butch_Hello_Condition()
{	
	return 1;
};

func void  DIA_Butch_Hello_Info()
{
	AI_Output (other, self,"DIA_Butch_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_Butch_Hello_13_01"); //Spierdalaj, nie podoba mi si� Twoja morda!
	
   B_StopProcessInfos	(self);
};

// ****************************************

instance DIA_Butch_HelloAgain (C_INFO)
{
	npc				= GRD_851_Butch;
	nr				= 2;
	condition		= DIA_Butch_HelloAgain_Condition;
	information		= DIA_Butch_HelloAgain_Info;
	important		= 0;
	description		= "Twoja g�ba a� si� prosi o mordobicie!";
};

FUNC int  DIA_Butch_HelloAgain_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Butch_Hello))&&(Npc_KnowsInfo (hero, DIA_Sher_Hlp))
	{
		return 1;
	};
};

func void  DIA_Butch_HelloAgain_Info()
{
	AI_Output (other, self,"DIA_Butch_HelloAgain_15_00"); //Twoja g�ba a� si� prosi o mordobicie!
	AI_Output (self, other,"DIA_Butch_HelloAgain_13_01"); //�mierdzisz jak �wie�y trup!
	
   B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ****************************************

instance DIA_Butch_After (C_INFO)
{
	npc				= GRD_851_Butch;
	nr				= 3;
	condition		= DIA_Butch_After_Condition;
	information		= DIA_Butch_After_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC int  DIA_Butch_After_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Butch_HelloAgain))
	{
		return 1;
	};
};

func void  DIA_Butch_After_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE) //dick przegra�
	{
      AI_Output (self, other,"DIA_Butch_After_13_01"); //I po co ci to by�o, z�amasie?
      AI_Output (other, self,"DIA_Butch_After_15_02"); //Zaczekaj...
      AI_Output (self, other,"DIA_Butch_After_13_03"); //Spierdalaj!
      
      B_LogEntry(CH4_GRD_NewMine, "Butch mnie pokona�. Torlof nie b�dzie zadowolony.");
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)//dick wygra�
	{
      miners_work = miners_work + 1;
      
      AI_Output (self, other,"DIA_Butch_After_13_04"); //Ty sukinsynie, to jeszcze nie koniec...
      AI_Output (other, self,"DIA_Butch_After_15_05"); //Masz racj�. Teraz p�jdziesz i staniesz si� wzorem kopacza!
      AI_Output (self, other,"DIA_Butch_After_13_06"); //Chyba za mocno uderzy�em Ci� w g�ow�. Nigdy...
      AI_DrawWeapon (hero);
      AI_Output (self, other,"DIA_Butch_After_13_07"); //Dobra, ju� dobra. B�d� kopa� rud�. Ale pewnego dnia naszczam do twojej u�miechni�tej g�by!
      AI_RemoveWeapon (hero);
      AI_Output (other, self,"DIA_Butch_After_15_08"); //Kto wie. Mi�ego kopania.
      B_GiveXP(250);	
      B_LogEntry(CH4_GRD_NewMine, "Butch po dzia�aniach prewencyjnych okaza� si� do�� podatny na sugestie. W ka�dym razie Torlof powinien by� zadowolony.");
      
      B_StopProcessInfos	(self);

      /***************
      rutyna kopania rudy
      **************/
      Npc_ExchangeRoutine(self,"Pick");
      var C_NPC vlk3; vlk3 = Hlp_GetNpc(VLK_5001_Buddler);
      Npc_ExchangeRoutine(vlk3,"GO");
	};
};
