
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_SmithX_EXIT(C_INFO)
{
	npc			= Grd_631_Smith;
	nr			= 999;
	condition			= Info_SmithX_EXIT_Condition;
	information			= Info_SmithX_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_SmithX_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SmithX_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_SmithX_Hello (C_INFO)
{
	npc		= Grd_631_Smith;
	nr			= 1;
	condition		= Info_SmithX_Hello_Condition;
	information		= Info_SmithX_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Jeste� kowalem?";
};                       

FUNC INT Info_SmithX_Hello_Condition()
{	


	return 1;


};
FUNC VOID Info_SmithX_Hello_Info()
{	

	AI_Output (other, self,"Info_SmithX_Hello_15_00"); //Jeste� kowalem?
	AI_Output (self, other,"Info_SmithX_Hello_06_01"); //Nie, trudni� si� nierz�dem, a fartuch to tylko przykrywka.
	AI_Output (other, self,"Info_SmithX_Hello_15_02"); //Ekhm...
	AI_Output (self, other,"Info_SmithX_Hello_06_03"); //Pewnie, �e jestem kowalem! 
	AI_Output (self, other,"Info_SmithX_Hello_06_04"); //Dlaczego zagl�daj� tu tylko idioci?
};




// ************************************************************

INSTANCE Info_SmithX_Again (C_INFO)
{
	npc			= Grd_631_Smith;
	nr			= 2;
	condition		= Info_SmithX_Again_Condition;
	information		= Info_SmithX_Again_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Zna�e� niemow�?";
};                       

FUNC INT Info_SmithX_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_SmithX_Hello))&& (Npc_KnowsInfo (hero, Info_Nia_Def1))
	{
		return 1;
	};

};
FUNC VOID Info_SmithX_Again_Info()
{	
	AI_Output (other, self,"Info_SmithX_Again_15_01"); //Zna�e� niemow�?
	AI_Output (self, other,"Info_SmithX_Again_06_02"); //Tak, czasem pomaga� mi w ku�ni. A co Tobie do tego?
	AI_Output (other, self,"Info_SmithX_Again_15_03"); //Szkoda go. Georg nie musia� go zabija�...
	AI_Output (self, other,"Info_SmithX_Again_06_04"); //Wtedy Znami� zabi�by Ni�. W�tpi�, �e Hrabia by�by szcz�liwy z tego powodu.
	AI_Output (self, other,"Info_SmithX_Again_06_05"); //Wol� nie my�le�, co wtedy by nas czeka�o...

	B_LogEntry		(CH4_Non_Eagle, "Kowal uwa�a, �e �mier� niemowy to mniejsze z�o. Gdyby co� sta�o si� Nii, Hrabia rozp�ta�by w Gnie�dzie prawdziwe piek�o.");
};



// ************************************************************

INSTANCE Info_SmithX_Again1 (C_INFO)
{
	npc			= Grd_631_Smith;
	nr			= 2;
	condition		= Info_SmithX_Again1_Condition;
	information		= Info_SmithX_Again1_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Chcia�em o co� zapyta�...";
};                       

FUNC INT Info_SmithX_Again1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_SmithX_Again1_Info()
{	
	AI_Output (other, self,"Info_SmithX_Again1_15_01"); //Chcia�em o co� zapyta�...
	AI_Output (self, other,"Info_SmithX_Again1_06_02"); //Nie musisz ko�czy�. Wiem, do czego zmierzasz.
	AI_Output (self, other,"Info_SmithX_Again1_06_03"); //Dosz�y mnie s�uchy, �e namawiasz ch�opak�w na nocne harce. Ale beze mnie.
	AI_Output (self, other,"Info_SmithX_Again1_06_04"); //Nie mam zamiaru wchodzi� w drog� Krisowi.
	B_LogEntry		(CH4_Non_Eagle, "Kowal nie b�dzie w tym uczestniczy�.");
	B_StopProcessInfos	(self);

}; 
