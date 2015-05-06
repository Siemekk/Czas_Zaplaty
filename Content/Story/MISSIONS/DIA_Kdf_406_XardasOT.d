//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_XardasOT_EXIT (C_INFO)
{
	npc			= KDF_406_OTXardas;
	nr			= 999;
	condition	= Info_XardasOT_EXIT_Condition;
	information	= Info_XardasOT_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_XardasOT_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_XardasOT_EXIT_Info()
{
	B_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

instance  Info_XardasOT_OT (C_INFO)
{
	npc				= KDF_406_OTXardas;
	condition		= Info_XardasOT_OT_Condition;
	information		= Info_XardasOT_OT_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int  Info_XardasOT_OT_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero,DIA_Necromanus_Again))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_XardasOT_OT_Info()
{
	var C_NPC non;	non = Hlp_GetNpc(Nameless_Temple);

	AI_TurnToNpc(other, self);
   
	AI_Output(self, other,"Info_XardasOT_OT_14_01"); //Nie s�uchaj go! Ten �garz chce wpl�ta� Ci� w sie� w�asnego szale�stwa!
	AI_Output(other, self,"Info_XardasOT_OT_15_02"); //Czy�by?
	AI_Output(self, other,"Info_XardasOT_OT_14_03"); //Jak m�g�bym wch�on�� moc �ni�cego? Przecie� tego demona nie spos�b zabi�!

	AI_Output(self, other,"Info_XardasOT_OT_14_04"); //Bezimienny musi go odes�a�, tylko tak mo�emy zniszczy� barier�!
	AI_Output(self, other,"Info_XardasOT_OT_14_05"); //To jedyna szansa dla nas wszystkich...
	AI_TurnToNpc(self, non);
	AI_Output(self, other,"Info_Xardas_OT_14_01"); //Nie mamy wiele czasu, wi�c s�uchaj uwa�nie.
	AI_Output(self, other,"Info_Xardas_OT_14_03"); //�ni�cy jest ju� blisko. Wykorzysta�em ca�� swoj� moc, �eby si� tu dosta�.
	AI_Output(self, other,"Info_Xardas_OT_14_04"); //Przet�umaczy�em staro�ytne przepowiednie ork�w i odkry�em o co chodzi z pi�cioma sercami.
	AI_Output(self, other,"Info_Xardas_OT_14_05"); //Pi�� serc nale��cych do kap�an�w, kt�rych pokona�e�, z�o�ono w pi�ciu kapliczkach.
	AI_Output(self, other,"Info_Xardas_OT_14_06"); //Kapliczki mo�na otworzy�, ale tylko staro�ytne sztylety kap�an�w s� w stanie je zniszczy�.
	AI_Output(self, other,"Info_Xardas_OT_14_07"); //Musisz przebi� serca kap�an�w pi�cioma sztyletami. Tylko w ten spos�b uda Ci si� wygna� �ni�cego z tego �wiata.
	AI_PlayAni(non,"T_YES");
	AI_Output(self, other,"Info_Xardas_OT_14_08"); //Spiesz si�. Przebudzenie demona odb�dzie si� ju� wkr�tce. Szalony Cor Kalom i jego poplecznicy s� ju� tutaj.
	AI_Output(self, other,"Info_Xardas_OT_14_09"); //Zebrali si� w krypcie �ni�cego.
	AI_Output(self, other,"Info_XardasOT_OT_14_06"); //Ruszaj przyjacielu...
	AI_PlayAni(non,"T_YES");
	B_StopProcessInfos(self);
};

//#####################################################################

instance  Info_XardasOT_Final (C_INFO)
{
	npc				= KDF_406_OTXardas;
	condition		= Info_XardasOT_Final_Condition;
	information		= Info_XardasOT_Final_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int Info_XardasOT_Final_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero,DIA_NonameT_Hi))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_XardasOT_Final_Info()
{
	AI_TurnToNpc(other, self);
	AI_Output(self, other,"Info_XardasOT_Final_14_01"); //Decyduj, piracie. Nie mamy wiele czasu, �ni�cy jest coraz silniejszy, a Tw�j mistrz jest czym� wi�cej ni� tylko czarnym magiem...
	AI_Output(other, self,"Info_XardasOT_Final_15_02"); //Z�o mo�na zwalczy� tylko innym z�em. Ju� podj��em decyzj�, nekromanto.
	AI_Output(other, self,"Info_XardasOT_Final_15_03"); //Spraw, abym nie �a�owa� tego wyboru!
	AI_Output(self, other,"Info_XardasOT_Final_14_04"); //Zabij go szybko! On zaraz si� zmieni...
	AI_PlayAni(other,"T_YES");
	AI_Output(self, other,"Info_XardasOT_Final_14_05"); //Co si� ze mn� dziej�...
	AI_Output(self, other,"Info_XardasOT_Final_14_06"); //On... Musisz...	
	Npc_ExchangeRoutine	(self, "DRAINED"); 	
	//Party_AddNpc(self);
	B_StopProcessInfos(self);
	
	//Ork: Pora na final battle!!!
	BOSSFIGHT_CURRENT = BOSSFIGHT_FGT5;
};
