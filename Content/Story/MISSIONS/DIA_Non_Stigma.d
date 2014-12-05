
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Stigma_EXIT(C_INFO)
{
	npc			= Grd_614_Gardist;
	nr			= 999;
	condition			= Info_Stigma_EXIT_Condition;
	information			= Info_Stigma_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Stigma_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Stigma_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Stigma_Hello (C_INFO)
{
	npc		= Grd_614_Gardist;
	nr			= 1;
	condition		= Info_Stigma_Hello_Condition;
	information		= Info_Stigma_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia�e� o co� zapyta�?";
};                       

FUNC INT Info_Stigma_Hello_Condition()
{	

	return 1;

};
FUNC VOID Info_Stigma_Hello_Info()
{	

	AI_Output (other, self,"Info_Stigma_Hello_15_00"); //Chcia�e� o co� zapyta�?
	AI_Output (self, other,"Info_Stigma_Hello_06_01"); //...
	AI_Output (other, self,"Info_Stigma_Hello_15_02"); //Co ty, niemowa?
	AI_PlayAni(self,"T_YES");
	AI_Output (other, self,"Info_Stigma_Hello_15_03"); //Wybacz. Do zobaczenia.
};

// ************************************************************

INSTANCE Info_Stigma_Hello1 (C_INFO)
{
	npc		= Grd_614_Gardist;
	nr			= 2;
	condition		= Info_Stigma_Hello1_Condition;
	information		= Info_Stigma_Hello1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Przysy�a mnie Nia.";
};                       

FUNC INT Info_Stigma_Hello1_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Nia_Again))
	{
		return 1;
	};
};

FUNC VOID Info_Stigma_Hello1_Info()
{	
	AI_Output (other, self,"Info_Stigma_Hello1_15_00"); //Przysy�a mnie Nia.
	AI_Output (self, other,"Info_Stigma_Hello1_06_01"); //(na twarzy m�czyzny pojawia si� przera�enie)
	AI_Output (other, self,"Info_Stigma_Hello1_15_02"); //Co si� sta�o? Wygl�dasz jakby� zobaczy� ducha.
	AI_Output (other, self,"Info_Stigma_Hello1_15_03"); //Przyszed�em po szmaty na opatrunki. Masz jakie�?
	AI_PlayAni(self,"T_YES");
	AI_Output (other, self,"Info_Stigma_Hello1_15_04"); //�wietnie, dzi�ki.
	
	/**************************
Ork zr�b te banda�e z czegokolwiek. S� wa�ne bo b�da istotne dla fabu�y, to w sumie dow�d rzeczowy.

*************************/

	CreateInvItems (self, EN_Bandage,1); 
	B_GiveInvItems (self, other, EN_Bandage, 1);
	B_LogEntry		(CH4_Non_NiaHelp, "Mam szmaty dla Nii, czas wraca�.");
};

// ************************************************************

INSTANCE Info_Stigma_Hello2 (C_INFO)
{
	npc		= Grd_614_Gardist;
	nr			= 3;
	condition		= Info_Stigma_Hello2_Condition;
	information		= Info_Stigma_Hello2_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Stigma_Hello2_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Nia_Def))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};
FUNC VOID Info_Stigma_Hello2_Info()
{
	B_FullStop (hero);
	//AI_GotoNpc(other,self);
	AI_TurnToNpc (self, other);
	AI_Output (other, self,"Info_Stigma_Hello2_15_00"); //O co chodzi? Chcesz mi co� powiedzie�?
	AI_PlayAni(self,"T_YES");
	AI_Output (other, self,"Info_Stigma_Hello2_15_01"); //S�ucham.
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Stigma_Hello2_06_02"); //(m�czyzna gestykuluje r�kami, wskazuje na Ni�)
	AI_Output (other, self,"Info_Stigma_Hello2_15_03"); //Nie rozumiem...
	AI_DrawWeapon (self);
	B_StopProcessInfos	(self);

	/*******************************
Ma podej�� do Nii, tam samo Dick

*********************************/
}; 
