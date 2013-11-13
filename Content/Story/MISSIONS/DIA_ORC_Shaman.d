//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_DOrcShaman_EXIT (C_INFO)
{
	npc			= ORC_4031_Shaman;
	nr			= 999;
	condition	= Info_DOrcShaman_EXIT_Condition;
	information	= Info_DOrcShaman_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_DOrcShaman_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_DOrcShaman_EXIT_Info()
{
	B_StopProcessInfos	( self );
};

//---------------------------------------------------------------------
instance  Info_DOrcShaman_Kill (C_INFO)
{
	npc			= ORC_4031_Shaman;
	condition	= Info_DOrcShaman_Kill_Condition;
	information	= Info_DOrcShaman_Kill_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_DOrcShaman_Kill_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Leren_Mag1))
	{
		return 1;
	};
};
FUNC void  Info_DOrcShaman_Kill_Info()
{
	AI_Output 	(self, hero,"Info_DOrcShaman_Kill_17_01"); //�miertelna Morra przysz�a zabra� co�, co nie nale�e� do ten �wiat!
	AI_Output 		(other,self,"Info_DOrcShaman_Kill_15_02"); //Nie do��, �e martwy to jeszcze gada.
	AI_Output 	(self, hero,"Info_DOrcShaman_Kill_17_03"); //Akhr'Ustah by� stra�nik �wiat�w, nie pozwoli� odej�� �ywa Mora.
	AI_Output 	(other,self,"Info_DOrcShaman_Kill_15_04"); //Cholera czy nawet martwi magowie musz� tyle gada�?!
	AI_Output 	(self, hero,"Info_DOrcShaman_Kill_17_05"); //Syn Ognia zabi� teraz Morra, uwi�zi� nie�miertelna dusza i...
	AI_Output 	(other,self,"Info_DOrcShaman_Kill_15_06"); //Zr�b w ko�cu, co obiecujesz i przesta� gada� cholerna kupo truch�a!
	B_LogEntry		(CH2_RBL_Artefact, "W �wi�tyni dopad� mnie nieumar�y szaman. Zdaje si�, �e to stra�nik. Musz� si� go pozby�, �eby zabra� artefakt.");

	B_StopProcessInfos	(self); 
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget(self,other); 
	AI_StartState(self,ZS_ATTACK,1,"");
}; 

//---------------------------------------------------------------------
instance  Info_DOrcShaman_Kill1 (C_INFO)
{
	npc			= ORC_4031_Shaman;
	condition	= Info_DOrcShaman_Kill1_Condition;
	information	= Info_DOrcShaman_Kill1_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_DOrcShaman_Kill1_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_DOrcShaman_Kill))&&(self.attribute[ATR_HITPOINTS] <= 20)//ma si� inicjowa� jak hp mu spadnie do 20
	{
		return 1;
	};
};
FUNC void  Info_DOrcShaman_Kill1_Info()
{
	AI_Output 	(self, hero,"Info_DOrcShaman_Kill1_17_01"); //Morra mnie uwolni�. Morra zas�ugiwa� na pot�ga zorzy. 
	AI_Output 	(other,self,"Info_DOrcShaman_Kill1_15_02"); //Mi�o by�o Ci� pozna� o�ywie�cu.
	AI_Output 	(self, hero,"Info_DOrcShaman_Kill1_17_03"); //Akhr'Ustah w ko�cu odej�� do bracia...
	B_LogEntry		(CH2_RBL_Artefact, "Zabi�em szamana, zorza pot�gi jest teraz moja.");

	B_StopProcessInfos(self);

	/****************************
	Szaman ma znikn�c w jakim� fajnym pfxie, mo�e tak by�?
	wp pozmieniaj i zobacz jak z t� rutyn�
	*****************************/

	Wld_PlayEffect("INCOVATION_RED",self,self,0,0,0,FALSE);
	AI_WAIT (self,0.1);
	Npc_ExchangeRoutine (self, "WP");
	AI_Teleport  (self, "WP");
	B_KillNpc (self);
};
