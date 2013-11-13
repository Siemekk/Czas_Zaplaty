
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Georg_EXIT(C_INFO)
{
	npc			= Grd_611_Gardist;
	nr			= 999;
	condition			= Info_Georg_EXIT_Condition;
	information			= Info_Georg_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Georg_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Georg_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Georg_Hello (C_INFO)
{
	npc		= Grd_611_Gardist;
	nr			= 1;
	condition		= Info_Georg_Hello_Condition;
	information		= Info_Georg_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Wielki z Ciebie ch�op!";
};                       

FUNC INT Info_Georg_Hello_Condition()
{	

	return 1;

};
FUNC VOID Info_Georg_Hello_Info()
{	

	AI_Output (other, self,"Info_Georg_Hello_15_00"); //Wielki z Ciebie ch�op!
	AI_Output (self, other,"Info_Georg_Hello_06_01"); //�ama�em karki nie takim jak Ty. Zejd� mi z drogi.

};




// ************************************************************

INSTANCE Info_Georg_Again (C_INFO)
{
	npc			= Grd_611_Gardist;
	nr			= 2;
	condition			= Info_Georg_Again_Condition;
	information			= Info_Georg_Again_Info;
	important			= 1;
	permanent			= 0;
	description 		= "";
};                       

FUNC INT Info_Georg_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Again))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};

};
FUNC VOID Info_Georg_Again_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"Info_Georg_Again_06_01"); //Trzymaj si� wymoczku z dala od kobiety Hrabiego bo...
	AI_Output (other, self,"Info_Georg_Again_15_02"); //Wiem, skr�cisz mi kark.
	AI_Output (self, other,"Info_Georg_Again_06_03"); //Dok�adnie. B�d� mia� na Ciebie oko, m�dralo.
};



// ************************************************************

INSTANCE Info_Georg_Again1 (C_INFO)
{
	npc			= Grd_611_Gardist;
	nr			= 2;
	condition			= Info_Georg_Again1_Condition;
	information			= Info_Georg_Again1_Info;
	important			= 1;
	permanent			= 0;
	description 		= "";
};                       

FUNC INT Info_Georg_Again1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Stigma_Hello2))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};

};
FUNC VOID Info_Georg_Again1_Info()
{	
	var C_NPC sti; sti = Hlp_GetNpc(Grd_614_Gardist);
	var C_NPC nia; nia = Hlp_GetNpc(Non_660_Nia);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"Info_Georg_Again1_06_01"); //Dawno na to czeka�em �wirze!
	AI_DrawWeapon (self);
	AI_Output (other, self,"Info_Georg_Again1_15_02"); //Co tu si� dzieje?!
	AI_Output (self, other,"Info_Georg_Again1_06_03"); //Zdychaj!

	B_StopProcessInfos	(self);
	
	sti.attribute[ATR_HITPOINTS] = (sti.attribute[ATR_HITPOINTS_MAX] - sti.attribute[ATR_HITPOINTS_MAX]);

	Npc_SetPermAttitude	(sti, ATT_HOSTILE);
	Npc_SetTarget (self,sti);
	Npc_SetTarget (sti,nia);
	AI_StartState (sti,ZS_ATTACK,1,"");
	B_StartAfterDialogFight(self,sti,true);
	B_StartAfterDialogFight(sti,nia,true);


	/****************************
Ork trzeba by zrobi� tak, �eby Znami� rzuci� si� na Ni� a Georg na Znami�. Georg musi zabi� Znami� zanim ten zabije Ni�, ale Znami� musi j� co najmniej rani�.
Dick niech robi wtedy co chce, ale mo�e zaatakowa� tylko Znami�.


****************************/


};


// ************************************************************

INSTANCE Info_Georg_Again2 (C_INFO)
{
	npc			= Grd_611_Gardist;
	nr			= 2;
	condition			= Info_Georg_Again2_Condition;
	information			= Info_Georg_Again2_Info;
	important			= 1;
	permanent			= 0;
	description 		= "";
};                       

FUNC INT Info_Georg_Again2_Condition()
{	
	var C_NPC sti; sti = Hlp_GetNpc(Grd_614_Gardist);

	if (Npc_KnowsInfo (hero, Info_Georg_Again1))&& (Npc_GetDistToNpc(self,hero) < 600)&&(Npc_IsDead(sti))
	{
		return 1;
	};

};
FUNC VOID Info_Georg_Again2_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"Info_Georg_Again2_06_01"); //I po sprawie. Kolejny idiota gryzie ziemi�.
	AI_Output (other, self,"Info_Georg_Again2_15_02"); //Co to ma znaczy�?
	AI_Output (self, other,"Info_Georg_Again2_06_03"); //Ka�dy kto �le spojrzy na kobiet� mojego Pana, zginie. Jasne?!
	AI_Output (other, self,"Info_Georg_Again2_15_04"); //Oczywi�cie.
	AI_Output (self, other,"Info_Georg_Again2_06_05"); //Lepiej wbij to sobie do g�owy, obdartusie. I uwa�aj co robisz, bo b�d� Ci� mia� na oku.
	Npc_ExchangeRoutine	(self,"start");	
};



/********************
Georg stoi na stra�y, wpu�ci Dicka dopiero jak minie ten dzie� z dialogu Nii.

*********************/

// ************************************************************

INSTANCE Info_Georg_Guard (C_INFO)
{
	npc			= Grd_611_Gardist;
	nr			= 2;
	condition			= Info_Georg_Guard_Condition;
	information			= Info_Georg_Guard_Info;
	important			= 1;
	permanent			= 1;
	description 		= "";
};                       

FUNC INT Info_Georg_Guard_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Def1))&&(GEORG_GUARD==0)
	{
		return 1;
	};

};
FUNC VOID Info_Georg_Guard_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"Info_Georg_Guard_06_01"); //Czego tu szukasz?
	AI_Output (other, self,"Info_Georg_Guard_15_02"); //Chcia�em porozmawia� z Ni�.
	if (nia_rest <= (Wld_GetDay()))
	{
		GEORG_GUARD = 1;
		AI_Output (self, other,"Info_Georg_Guard_06_03"); //Nie wiem dlaczego, ale pozwoli�a Ci wej��.
		AI_Output (self, other,"Info_Georg_Guard_06_04"); //Ruszaj dup�!
	}
	else
	{
		AI_Output (self, other,"Info_Georg_Guard_06_05"); //Spierdalaj!
		B_StopProcessInfos	(self);
		AI_GotoWP		(other, "NC_EN_PATH3_06");
	};
};



// ************************************************************

INSTANCE Info_Georg_Meet (C_INFO)
{
	npc		= Grd_611_Gardist;
	nr			= 1;
	condition		= Info_Georg_Meet_Condition;
	information		= Info_Georg_Meet_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Witaj przydupasie.";
};                       

FUNC INT Info_Georg_Meet_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_Georg_Meet_Info()
{	
	AI_Output (other, self,"Info_Georg_Meet_15_00"); //Witaj przydupasie.
	AI_Output (self, other,"Info_Georg_Meet_06_01"); //�e co?!
	AI_Output (other, self,"Info_Georg_Meet_15_02"); //Widz�, �e robienie za ch�opca na posy�ki na us�ugach dziwki wesz�o Ci w krew.
	AI_Output (self, other,"Info_Georg_Meet_06_03"); //Ty skurwielu! Urw� Ci g�ow� i naszczam do pyska!
	B_LogEntry		(CH4_Non_Eagle, "Po co ja w og�le zacz��em rozmow� z Georgiem?");
	B_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
}; 
