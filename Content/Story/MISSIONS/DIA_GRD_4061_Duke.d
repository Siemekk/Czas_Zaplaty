FUNC VOID Rtn_PatrolAttack_2600 () 
{ 
	TA_STAND(0,00,12,00,"MIS_GRDPATROL1_2"); 
	TA_STAND (12,00,0,00,"MIS_GRDPATROL1_2"); 
}; 
FUNC VOID Rtn_PatrolAttack_2601 () 
{ 
	TA_STAND(0,00,12,00,"MIS_GRDPATROL1_2"); 
	TA_STAND (12,00,0,00,"MIS_GRDPATROL1_2"); 
}; 
FUNC VOID Rtn_PatrolAttack_2602 () 
{ 
	TA_STAND(0,00,12,00,"MIS_GRDPATROL1_2"); 
	TA_STAND (12,00,0,00,"MIS_GRDPATROL1_2"); 
};            

FUNC VOID DIA_Duke_Negotaite_Info()
{
	AI_Output (self, other, "DIA_Duke_Negotaite_11_01"); //W sumie zawsze zd��� Ci� zabi�. M�w, co to za informacja. 
	AI_Output (other, self, "DIA_Duke_Negotaite_15_02"); //Na waszym miejscu nie pcha�bym si� w gniazdo trolli.
	AI_Output (self, other, "DIA_Duke_Negotaite_11_03"); //O czym Ty gadasz? Przecie� w tej norze chowaj� si� tylko rebelianci.
	AI_Output (other, self, "DIA_Duke_Negotaite_15_04"); //Niezupe�nie. Pozna�em sekret ich przyw�dcy.
	AI_Output (self, other, "DIA_Duke_Negotaite_11_05"); //Co to za tajemnica?

	Info_ClearChoices (DIA_Duke_Hello);
	Info_AddChoice (DIA_Duke_Hello, "Cavalorn hoduje w�ciek�e... �cierwojady!", DIA_Duke_Negotaite_Scavenger);
	Info_AddChoice (DIA_Duke_Hello, "Cavalorn oswoi� kilka cieniostwor�w.", DIA_Duke_Negotaite_Shadow);
	Info_AddChoice (DIA_Duke_Hello, "Cavalorn ma tresowanego... trolla!", DIA_Duke_Negotaite_Trol);
};

// ---------------------------Scavenger----------------------------------------

FUNC VOID DIA_Duke_Negotaite_Scavenger()
{
	patrol_trial = 8;

	AI_Output (other, self, "DIA_Duke_Negotaite_Scavenger_15_01"); //Cavalorn hoduje w�ciek�e... �cierwojady!
	AI_Output (self, other, "DIA_Duke_Negotaite_Scavenger_11_02"); //W�ciek�e �cierwojady?!
	AI_TurnToNpc(self, CH2_Patrol_g2);
	AI_Output (self, other, "DIA_Duke_Negotaite_Scavenger_11_03"); //To rzeczywi�cie ju� po nas...
	AI_Output (self, other, "DIA_Duke_Negotaite_Scavenger_11_04"); //Ch�opaki, zabijcie tego idiot�.
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_TurnToNpc(self, other);
	AI_Output (other, self, "DIA_Duke_Negotaite_Scavenger_15_05"); //Angus - teraz wasza kolej!

	B_MisPatrolGRDChoiceNegotiatie_Failure();

	B_LogEntry(CH2_RBL_GuardCamp, "Stra�nicy nie nabrali si� na moj� prowokacj�.");
	B_StopProcessInfos(self);
};

// ---------------------------Shadow----------------------------------------

FUNC VOID DIA_Duke_Negotaite_Shadow()
{
	patrol_trial = 8;

	AI_Output (other, self, "DIA_Duke_Negotaite_Shadow_15_01"); //Cavalorn oswoi� kilka cieniostwor�w. Wszystkie czaj� si� w g�szczu dooko�a obozu.
	AI_Output (self, other, "DIA_Duke_Negotaite_Shadow_11_02"); //Cieniostwory? Ju� kilka zabi�em. Mog�e� wymy�li� lepsz� bajeczk�.
	AI_TurnToNpc (self, CH2_Patrol_g2);
	AI_Output (self, other, "DIA_Duke_Negotaite_Shadow_11_03"); //Ch�opaki poka�my temu durniowi co warta jest nasza stal!
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_TurnToNpc(self, other);
	AI_Output (other, self, "DIA_Duke_Negotaite_Shadow_15_04"); //Angus - teraz wasza kolej!

	B_LogEntry(CH2_RBL_GuardCamp, "Stra�nicy nie nabrali si� na moj� prowokacj�.");
	B_StopProcessInfos(self);
};

// ---------------------------Trol----------------------------------------

FUNC VOID DIA_Duke_Negotaite_Trol()
{
	patrol_trial = 6;
   
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_15_01"); //Cavalorn ma tresowanego... trolla!
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_11_02"); //To niemo�liwe, nie mo�na oswoi� trolla. Uwa�asz nas za idiot�w?
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_15_03"); //Nigdy tego nie powiedzia�em. Cavalorn z�apa� trolla po tym, jak �owcy zabili jego matk�.
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_15_04"); //Chowa� zwierzaka od ma�ego, dlatego bestia jest mu we wszystkim pos�uszna. 
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_15_05"); //Troll ca�y czas patroluje obszar dooko�a obozu - pr�dzej lub p�niej si� na niego natkniecie, a wtedy nie chcia�bym by� w waszej sk�rze.	
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_11_06"); //Troll? Hmm, to niezbyt fortunna wiadomo��, o ile jest prawdziwa.
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_15_07"); //A dlaczego mia�bym was wprowadzi� w b��d?
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_11_08"); //Cho�by dlatego, �eby si� nas st�d pozby�.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_11_09"); //Sk�d ta prawdom�wno�� i troska o nasze �ycie?


	Info_ClearChoices (DIA_Duke_Hello);
	if (Npc_KnowsInfo (hero, DIA_Hrabia_ore))
	{
		Info_AddChoice (DIA_Duke_Hello, "Pracuj� dla Hrabiego.", DIA_Duke_Negotaite_Trol_Hrabia);
	};
	Info_AddChoice (DIA_Duke_Hello, "Jestem jednym z was.", DIA_Duke_Negotaite_Trol_Camper);
	Info_AddChoice (DIA_Duke_Hello, "Mam do wyr�wnania rachunki z Cavalornem.", DIA_Duke_Negotaite_Trol_Revange);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Hrabia()
{
	B_GiveXP (500);

	patrol_trial = 10;
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Hrabia_15_01"); //Pracuj� dla Hrabiego.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Hrabia_11_02"); //Niech to szlag, mog�e� od razu m�wi�, �e jeste� jego szponem.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Hrabia_11_03"); //Chocia� z drugiej strony nigdy Ci� nie widzia�em w obozie...
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Hrabia_15_04"); //To tylko dobrze �wiadczy o Hrabim, nie s�dzisz?
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Hrabia_11_05"); //To fakt, jego ludzie s� jak cholerne widma.
	AI_TurnToNpc(self, CH2_Patrol_g2);
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Hrabia_11_06"); //Ch�opaki schowajcie �elazo - to jeden z naszych.
	AI_RemoveWeapon (CH2_Patrol_g1);	
	AI_RemoveWeapon (CH2_Patrol_g2);	
	AI_RemoveWeapon (CH2_Patrol_g3);	
	AI_RemoveWeapon (CH2_Patrol_g4);	
	AI_RemoveWeapon (CH2_Patrol_g5);	
	AI_TurnToNpc(self, other);

	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Hrabia_15_07"); //Zmiatajcie st�d, p�ki jeszcze mo�ecie.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Hrabia_11_08"); //Dzi�ki za ostrze�enie, mam u Ciebie d�ug.
	B_LogEntry(CH2_RBL_GuardCamp, "Postraszy�em stra�nik�w Hrabi� i zadzia�a�o. Ten Hrabia musi wzbudza� niez�y strach w Starym Obozie. Piraci te� wr�cili do obozu - czas porozmawia� z Ratfordem.");

	B_StopProcessInfos(self);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Revange()
{
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_15_01"); //Mam do wyr�wnania rachunki z Cavalornem.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_11_02"); //Zemsta? Zawsze m�wi�em, �e nie ma to jak zwyczajna ludzka zawi��.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_11_03"); //Co to za rachunki?

	Info_ClearChoices (DIA_Duke_Hello);

	Info_AddChoice (DIA_Duke_Hello, "Posz�o o kobiet�.", DIA_Duke_Negotaite_Trol_Revange_1);
	Info_AddChoice (DIA_Duke_Hello, "Zes�a� mnie do tej swojej kopalni.", DIA_Duke_Negotaite_Trol_Revange_2);
	Info_AddChoice (DIA_Duke_Hello, "To nie wasza sprawa!", DIA_Duke_Negotaite_Trol_Revange_3);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Revange_1()
{
	patrol_trial = 8;
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_1_15_01"); //Posz�o o kobiet�.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_1_11_02"); //Z tego co wiem w obozie tych obszczymurk�w nie ma kobiet.
	AI_TurnToNpc(self, CH2_Patrol_g2);
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_1_11_03"); //Zabijcie tego cholernego k�amc�!
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_TurnToNpc(self, other);
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_1_15_04"); //Angus - teraz wasza kolej!

	B_LogEntry		(CH2_RBL_GuardCamp, "Stra�nicy nie nabrali si� na moj� prowokacj�.");
	B_StopProcessInfos(self);
};


FUNC VOID DIA_Duke_Negotaite_Trol_Revange_2()
{
	B_GiveXP (500);
	patrol_trial = 10;

	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_2_15_01"); //Zes�a� mnie do tej swojej kopalni.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_2_11_02"); //Rozumiem, te� bym si� w�ciek�. Kto chcia�by z w�asnej woli umiera� przy wydobyciu rudy?
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_2_11_03"); //Musia�e� porz�dnie mu zaj�� za sk�r�. Powiniene� przy��czy� si� do nas. Gomez z otwartymi r�koma wita ka�dego zaradnego cz�eka.
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_2_15_04"); //Przemy�l� to.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_2_11_05"); //Przekona�e� mnie.
	AI_TurnToNpc(self, CH2_Patrol_g2);
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_2_11_06"); //Ch�opaki chowa� bro�, zwijamy si� st�d.
	AI_RemoveWeapon (CH2_Patrol_g1);	
	AI_RemoveWeapon (CH2_Patrol_g2);	
	AI_RemoveWeapon (CH2_Patrol_g3);	
	AI_RemoveWeapon (CH2_Patrol_g4);	
	AI_RemoveWeapon (CH2_Patrol_g5);	
	AI_TurnToNpc (self, other);
	B_LogEntry(CH2_RBL_GuardCamp, "Przekona�em stra�nik�w, piraci te� wr�cili do obozu. Czas porozmawia� z Ratfordem.");

	B_StopProcessInfos(self);
};


FUNC VOID DIA_Duke_Negotaite_Trol_Revange_3()
{
	patrol_trial = 8;

	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_3_15_01"); //To nie wasza sprawa!
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_3_11_02"); //Bezczelno�� Ci �ycia nie uratuje.

	AI_TurnToNpc(self, CH2_Patrol_g2);
   
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_3_11_03"); //Zabijcie tego cwaniaka.
   
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_TurnToNpc(self, other);
   
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_3_15_04"); //Angus - teraz wasza kolej!
   
	B_LogEntry(CH2_RBL_GuardCamp, "Stra�nicy nie nabrali si� na moj� prowokacj�.");
	B_StopProcessInfos(self);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Camper()
{
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Camper_15_01"); //Jestem jednym z was.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_11_02"); //Jeste� ze Starego Obozu? To dlaczego Ci� tam nigdy nie widzia�em?

	Info_ClearChoices (DIA_Duke_Hello);

	Info_AddChoice (DIA_Duke_Hello, "By�em kurierem mag�w ognia.", DIA_Duke_Negotaite_Trol_Camper_1);
	Info_AddChoice (DIA_Duke_Hello, "To nie wasza sprawa!", DIA_Duke_Negotaite_Trol_Revange_3);
	Info_AddChoice (DIA_Duke_Hello, "Jestem... handlarzem.", DIA_Duke_Negotaite_Trol_Camper_2);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Camper_2()
{
	patrol_trial = 8;

	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Camper_2_15_01"); //Jestem... handlarzem.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_2_11_02"); //Handlarzem? Nie wydaje mi si�, znam wszystkich sprzedawc�w i ich pomocnik�w w Starym Obozie.

	AI_TurnToNpc(self, CH2_Patrol_g2);
   
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_2_11_03"); //Zabijcie tego idiot�.
   
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_TurnToNpc(self, other);
   
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Camper_2_15_04"); //Angus - teraz wasza kolej!

	B_LogEntry(CH2_RBL_GuardCamp, "Stra�nicy nie nabrali si� na moj� prowokacj�.");
	B_StopProcessInfos(self);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Camper_1()
{
	B_GiveXP (500);
	patrol_trial = 10;

	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Camper_1_15_01"); //By�em kurierem mag�w ognia.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_1_11_02"); //Rozumiem. Po tym jak Gomez pozby� si� mag�w, nie mia�e� po co wraca�.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_1_11_03"); //B�d� z Tob� szczery, te� nie uwa�am, �eby zabicie mag�w by�o dobrym rozwi�zaniem.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_1_11_04"); //W porz�dku, przekona�e� mnie.
   
	AI_TurnToNpc(self, CH2_Patrol_g2);
   
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_1_11_05"); //Ch�opaki chowa� �elastwo, wracamy ogrza� ty�ki w obozie.
   
	AI_RemoveWeapon (CH2_Patrol_g1);	
	AI_RemoveWeapon (CH2_Patrol_g2);	
	AI_RemoveWeapon (CH2_Patrol_g3);	
	AI_RemoveWeapon (CH2_Patrol_g4);	
	AI_RemoveWeapon (CH2_Patrol_g5);	
	AI_TurnToNpc (self, other);
	B_LogEntry(CH2_RBL_GuardCamp, "Przekona�em stra�nik�w, piraci te� wr�cili do obozu. Czas porozmawia� z Ratfordem.");

	B_StopProcessInfos(self);
};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Duke_Exit (C_INFO)
{
	npc			= GRD_4061_Guard;
	nr			= 999;
	condition	= DIA_Duke_Exit_Condition;
	information	= DIA_Duke_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Duke_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Duke_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// Za�o�y�em, �e Dick nie da rady sam tych stra�nik�w roz�o�y�, wi�c je�eli nie pogada z piratami to stra�nicy go zaatakuj�.
// **************************************************

INSTANCE DIA_Duke_Hello (C_INFO)
{
	npc				= GRD_4061_Guard;
	nr				= 1;
	condition		= DIA_Duke_Hello_Condition;
	information		= DIA_Duke_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Duke_Hello_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_IwillBecameHunter))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Duke_Hello_Info()
{
	B_FullStop(other);
	var C_NPC CH2_Patrol_g1; CH2_Patrol_g1 = Hlp_GetNpc(GRD_4056_Guard);
	var C_NPC CH2_Patrol_g2; CH2_Patrol_g2 = Hlp_GetNpc(GRD_4057_Guard);
	var C_NPC CH2_Patrol_g3; CH2_Patrol_g3 = Hlp_GetNpc(GRD_4058_Guard);
	var C_NPC CH2_Patrol_g4; CH2_Patrol_g4 = Hlp_GetNpc(GRD_4059_Guard);
	var C_NPC CH2_Patrol_g5; CH2_Patrol_g5 = Hlp_GetNpc(GRD_4060_Guard);	

	AI_Output (self, other, "DIA_Duke_Hello_11_01"); //Do broni!
	B_FullStop(CH2_Patrol_g1);
	B_FullStop(CH2_Patrol_g2);
	B_FullStop(CH2_Patrol_g3);
	B_FullStop(CH2_Patrol_g4);
	B_FullStop(CH2_Patrol_g5);
	
	B_SmartTurnToNpc	(CH2_Patrol_g1,other);	
	B_SmartTurnToNpc	(CH2_Patrol_g2,other);	
	B_SmartTurnToNpc	(CH2_Patrol_g3,other);	
	B_SmartTurnToNpc	(CH2_Patrol_g4,other);	
	B_SmartTurnToNpc	(CH2_Patrol_g5,other);							
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_Wait(CH2_Patrol_g1,2);
	AI_Wait(CH2_Patrol_g2,2);
	AI_Wait(CH2_Patrol_g3,2);
	AI_Wait(CH2_Patrol_g4,2);
	AI_Wait(CH2_Patrol_g5,2);	
	AI_Output (self, other, "DIA_Duke_Hello_11_02"); //Zbli� si� w��cz�go - tylko bez gwa�townych ruch�w!
	Mdl_ApplyOverlayMds(other,"Humans_Militia.mds");//niech dick wolno podejdzie, tak b�dzie fajniej 
	//Nie w ten spos�b
	//TOFIX: Remove sprint ani
	AI_SetWalkmode (other,NPC_WALK);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Duke_Hello_11_03"); //Czego tu szukasz? Tylko pami�taj, �e od tej odpowiedzi zale�y Twoje �ycie.
	Mdl_RemoveOverlayMds(other,"Humans_Militia.mds");//zmiana �a�enia na normalny

	if (Npc_KnowsInfo (hero, DIA_Angus_Patrol1))
	{
		if (dick_patrol_choice == 1)//rozwi�zanie si�owe
		{
			AI_Output (other, self, "DIA_Duke_Hello_15_04"); //Poczu�em straszny smr�d i przyszed�em zobaczy� co tak cuchnie.
			AI_Output (self, other, "DIA_Duke_Hello_11_05"); //Ty skurwielu!
			AI_TurnToNpc(self, CH2_Patrol_g2);
			AI_Output (self, other, "DIA_Duke_Hello_11_06"); //S�yszeli�cie to! Ten pastuch owiec nas obra�a!
			AI_TurnToNpc(self, other);
			patrol_trial = 2;
			/**************************
	Stra�nicy maj� si� patrze� na dicka, �eby potem piraci mogli niepostrze�enie zaj�� ich od ty�u
	**************************/
			AI_TurnToNpc(CH2_Patrol_g1, other);
			AI_TurnToNpc(CH2_Patrol_g2, other);
			AI_TurnToNpc(CH2_Patrol_g3, other);
			AI_TurnToNpc(CH2_Patrol_g4, other);
			AI_TurnToNpc(CH2_Patrol_g5, other);
			AI_Output (self, other, "DIA_Duke_Hello_11_07"); //Zap�acisz za to krwi�, durniu.
			AI_Output (other, self, "DIA_Duke_Hello_15_08"); //Nie s�dz�!

			B_LogEntry(CH2_RBL_GuardCamp, "Szkoda s��w na tych sukinsyn�w, czas skopa� im ty�ki!");
			B_StopProcessInfos(self);

			/*****************************
	Stra�nicy s� odwr�ceni ty�em do pirat�w, Ci podchodz� i 
	zajmuj� dogodne stanowiska do ataku za nimi - mo�e ma�� kamerk� by tu zrobi�?
	******************************/
		} 
		else if (dick_patrol_choice == 2)
		{
			/*******************
	Mo�e da� warunek, �e jak dick nosi pancerz rebeliant�w to stra�nicy nie daj� si� zrobi� w ciula i go atakuj�?
	********************/
			AI_Output (other, self, "DIA_Duke_Hello_15_09"); //Widzia�em rebeliant�w...
			AI_Output (self, other, "DIA_Duke_Hello_11_10"); //Co?! Ilu i gdzie?
			AI_Output (other, self, "DIA_Duke_Hello_15_11"); //Tylko dw�ch, k��cili si� o rzeczy zabitego stra�nika.
			AI_Output (self, other, "DIA_Duke_Hello_11_12"); //Niech to szlag trafi. Gdzie oni s�?
			AI_Output (other, self, "DIA_Duke_Hello_15_13"); //To niedaleko, zaprowadz� was.
			AI_Output (self, other, "DIA_Duke_Hello_11_14"); //Tylko nic nie kombinuj, bo ze�resz m�j miecz!
			AI_Output (other, self, "DIA_Duke_Hello_15_15"); //Nie jestem idiot�, przecie� jest was sze�ciu.
			AI_Output (self, other, "DIA_Duke_Hello_11_16"); //Ruszaj!
			patrol_trial = 4;
			/**************
	Ork dodaj te rutyny stra�nikom i przygotuj jakie� fajne miejsce na zasadzk�, gdzie w pobli�u czekaj� piraci
	**************/
			B_LogEntry(CH2_RBL_GuardCamp, "Stra�nicy po�kn�li przyn�t� i p�jd� za mn� prosto w zasadzk� - mam nadziej�, �e Angus i ch�opaki tego nie skrewi�.");
			B_StopProcessInfos(self);
			B_MisPatrolGRDChoiceTrap();
		}
		else if (dick_patrol_choice == 3)
		{
			AI_Output (other, self, "DIA_Duke_Hello_15_17"); //Na waszym miejscu bra�bym st�d nogi za pas.
			AI_Output (self, other, "DIA_Duke_Hello_11_18"); //Nie b�d� �mieszny. Po co ja w og�le z Tob� rozmawiam? Ch�opaki zabijcie tego...
			AI_Output (other, self, "DIA_Duke_Hello_15_19"); //Zaczekaj, mam pewne informacje!
			patrol_trial = 5;
			B_LogEntry		(CH2_RBL_GuardCamp, "Spr�buj� przekona� stra�nik�w, �eby odeszli.");
			DIA_Duke_Negotaite_Info();
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Duke_Hello_15_20"); //Poczu�em straszny smr�d i przyszed�em zobaczy�, co tak cuchnie.
		AI_Output (self, other, "DIA_Duke_Hello_11_21"); //Ty skurwielu!
		AI_TurnToNpc(self, CH2_Patrol_g2);
		AI_Output (self, other, "DIA_Duke_Hello_11_22"); //S�yszeli�cie to! Ten pastuch owiec nas obra�a!
		AI_TurnToNpc(self, other);
		patrol_trial = 1;
		AI_TurnToNpc(CH2_Patrol_g1, other);
		AI_TurnToNpc(CH2_Patrol_g2, other);
		AI_TurnToNpc(CH2_Patrol_g3, other);
		AI_TurnToNpc(CH2_Patrol_g4, other);
		AI_TurnToNpc(CH2_Patrol_g5, other);
		AI_Output (self, other, "DIA_Duke_Hello_11_23"); //Zap�acisz za to krwi� durniu.
		AI_Output (other, self, "DIA_Duke_Hello_15_24"); //Nie s�dz�!
		B_LogEntry(CH2_RBL_GuardCamp, "Obrzuci�em stra�nik�w obelgami - teraz musz� 'tylko' ich zabi�.");

		B_StopProcessInfos(self);

		B_MisSetPatrolGRDToHostile();	
	};
};

/**************************************************/


// INSTANCE DIA_Duke_Trap (C_INFO)
// {
// 	npc				= GRD_4061_Guard;
// 	nr				= 2;
// 	condition		= DIA_Duke_Trap_Condition;
// 	information		= DIA_Duke_Trap_Info;
// 	permanent		= 0;
// 	important		= 1;
// 	description		= ""; 
// };

// FUNC INT DIA_Duke_Trap_Condition()
// {

//	if (patrol_trial == 4)&&(Npc_GetDistToWP (self,"LOCATION_15_IN_2") < 600 )//jak zbli�� si� do zasadzki
// 	{
// 		return 1;
// 	};


// // };

// FUNC VOID DIA_Duke_Trap_Info()
// {


// 	patrol_trial = 3;
// 	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
// 	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);
// 	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);		
// 	Npc_SetAivar(angus,AIV_PARTYMEMBER,		TRUE);
// 	Npc_SetAivar(hank,AIV_PARTYMEMBER,		TRUE);
// 	Npc_SetAivar(rodney,AIV_PARTYMEMBER,		TRUE);
// 	AI_DrawWeapon(angus);
// 	AI_DrawWeapon(rodney);
// 	AI_DrawWeapon(hank);
// 	AI_Output (self, NULL, "DIA_Duke_Trap_11_01"); //To pu�apka! Zabi� tego skurwiela!

// 	B_LogEntry		(CH2_RBL_GuardCamp, "Stra�nicy wpadli w zasadzk� - czas sko�czy� t� fars�.");
// 	B_StopProcessInfos	(self);

// 	/***********
// 	Atak w miejscu zasadzki
// 	***********/

// 			
// 		B_ExchangeRoutine(hank,"InHC");
// 		B_ExchangeRoutine(rodney,"InHC");
// 		B_ExchangeRoutine(angus,"InHC");
// 	B_MisSetPatrolGRDToHostile();			
// };



/**************************************************/


// INSTANCE DIA_Duke_Negotaite (C_INFO)
// {
// 	npc				= GRD_4061_Guard;
// 	nr				= 3;
// 	condition		= DIA_Duke_Negotaite_Condition;
// 	information		= DIA_Duke_Negotaite_Info;
// 	permanent		= 0;
// 	important		= 1;
// 	description		= ""; 
// };

// FUNC INT DIA_Duke_Negotaite_Condition()
// {

// 	if (patrol_trial == 5)
// 	{
// 		return 1;
// 	};


// };
