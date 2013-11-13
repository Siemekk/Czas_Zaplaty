// ****************************** 
//				EXIT 
// ******************************

INSTANCE   SLV_907_Lares_Exit (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 999;
	condition	= SLV_907_Lares_Exit_Condition;
	information	= SLV_907_Lares_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  SLV_907_Lares_Exit_Condition()
{
	return 1;
};

FUNC VOID  SLV_907_Lares_Exit_Info()
{
	B_StopProcessInfos(self);
};

// ****************************** 
//			hi
// ******************************

INSTANCE DIA_Lares_Hi (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 1;
	condition	= DIA_Lares_Hi_Condition;
	information	= DIA_Lares_Hi_Info;
	permanent	= 0;
	description = "Uprawiacie ry�?";
};                       

FUNC int DIA_Lares_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_Lares_Hi_Info()
{
	AI_Output (other, self,"DIA_Lares_Hi_15_00"); //Uprawiacie ry�?
	AI_Output (self, other,"DIA_Lares_Hi_11_01"); //Nie, wyrabiamy dzbanki z gliny.
	AI_Output (self, other,"DIA_Lares_Hi_11_02"); //Jestem zaj�ty, przyjd� p�niej.
};

// ******************************

INSTANCE DIA_Lares_Again (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 2;
	condition		= DIA_Lares_Again_Condition;
	information		= DIA_Lares_Again_Info;
	permanent		= 0;
	important		= 0;
	description = "Podobno nie �yczysz za dobrze stra�nikom?";
};                       

FUNC int DIA_Lares_Again_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_RebelTalk))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_Again_Info()
{
	AI_Output (other, self,"DIA_Lares_Again_15_00"); //Podobno nie �yczysz za dobrze stra�nikom?
	AI_Output (self, other,"DIA_Lares_Again_11_01"); //Ciszej cz�owieku! Nawet je�eli to prawda to si� z tym nie manifestuj�.
	AI_Output (self, other,"DIA_Lares_Again_11_02"); //Kim jeste� i czego chcesz?
	AI_Output (other, self,"DIA_Lares_Again_15_03"); //Przysy�a mnie Cavalorn. Dosz�y nas s�uchy, �e w Nowym Obozie szykuj� si�... zmiany na lepsze.
	AI_Output (self, other,"DIA_Lares_Again_11_04"); //Czyli jeste� wys�annikiem rebeliant�w. Czy�by Cavalorn i tutaj chcia� w�ciubi� nos?
	AI_Output (other, self,"DIA_Lares_Again_15_05"); //By� mo�e. Wrogowie naszych wrog�w s� naszymi przyjaci�mi.
	AI_Output (self, other,"DIA_Lares_Again_11_06"); //Ta, a �ona przyjaciela jest tak�e nasz� przyjaci�k�, he, he. 
	AI_Output (self, other,"DIA_Lares_Again_11_07"); //No to nas znalaz�e�, rozgl�daj si� do woli.
	AI_Output (other, self,"DIA_Lares_Again_15_08"); //Powiesz mi co� wi�cej o tym co szykujecie?
	AI_Output (self, other,"DIA_Lares_Again_11_09"); //Uwa�asz mnie za idiot�? Mo�e i przys�a� ci� Cavalorn, ale to za ma�o.
	AI_Output (self, other,"DIA_Lares_Again_11_10"); //Powiem Ci co� wi�cej je�eli wy�wiadczysz mi drobn� przys�ug�.
	AI_Output (other, self,"DIA_Lares_Again_15_11"); //Chyba nie mam wyboru. Co to za 'drobna' przys�uga?
	AI_Output (self, other,"DIA_Lares_Again_11_12"); //Odk�d stra�nicy zrobili tu swoj� piaskownic� mam na g�owie zbiory ry�u i dostawy paczek z ry�em do gospody na wyspie.
	AI_Output (self, other,"DIA_Lares_Again_11_13"); //Ry� to podstawowe po�ywienie niewolnik�w, jak nas nazywaj� stra�nicy. W karczmie p�dz� z niego ry��wk�, wi�c �mia�o mo�na powiedzie�, �e to Bia�e Z�oto Kolonii.
	AI_Output (self, other,"DIA_Lares_Again_11_14"); //Wykopa�em wszystkich do zbierania tego cholerstwa bo nie wyrabiamy limit�w odk�d kilku szkodnik�w da�o nog�.
	AI_Output (other, self,"DIA_Lares_Again_15_15"); //Uciekli?
	AI_Output (self, other,"DIA_Lares_Again_11_16"); //Cholerne sukinsyny upi�y mnie ry��wk� i zwin�li si� przed �witem. Od tamtego czasu mam na g�owie stra�nik�w, zwi�kszone limity na zbiory i mniej ludzi do pracy.
	AI_Output (self, other,"DIA_Lares_Again_11_17"); //Fletcher da� mi jeszcze dwa dni na to, �eby wszystko wr�ci�o do normy.
	AI_Output (self, other,"DIA_Lares_Again_11_18"); //Z limitami jako� sobie poradz�, ch�opaki dwoj� si� i troj�.
	AI_Output (self, other,"DIA_Lares_Again_11_19"); //Ale ci uciekinierzy... To dla mnie sprawa honoru.
	AI_Output (other, self,"DIA_Lares_Again_15_20"); //To ta przys�uga? Mam ich odnale�� i przyprowadzi�?
	AI_Output (self, other,"DIA_Lares_Again_11_21"); //Niezupe�nie. Masz ich odnale�� i wyr�n�� do nogi! Te sukinsyny wiedzia�y czym sko�czy si� ich ucieczka.
	AI_Output (self, other,"DIA_Lares_Again_11_22"); //Takich jak oni trzeba t�pi� jak szczury. 
	AI_Output (self, other,"DIA_Lares_Again_11_23"); //Do tego jeden z nich zwin�� m�j top�r! To ju� by� szczyt bezczelno�ci!
	AI_Output (other, self,"DIA_Lares_Again_15_24"); //Rozumiem. Znale��, zabi�, przynie�� top�r.
	AI_Output (self, other,"DIA_Lares_Again_11_25"); //Doskonale. Ale potrzebuj� jeszcze ich... g��w.
	AI_Output (other, self,"DIA_Lares_Again_15_26"); //Nie jestem rze�nikiem!
	AI_Output (self, other,"DIA_Lares_Again_11_27"); //Musz� pokaza� Fletcherowi jakie� dowody.
	AI_Output (self, other,"DIA_Lares_Again_11_28"); //Wi�c jak b�dzie?
	
   B_LogEntry		(CH4_RBL_NCRebel, "Lares wtajemniczy mnie w plany buntownik�w je�eli wy�wiadcz� mu 'drobn�' przys�ug�.");
	B_LogEntry		(CH4_NC_RBLBosses, "Lares poprosi� mnie o przys�ug�. Nie mam wyboru je�eli chc� zdoby� jego zaufanie.");
};

var int lares_wait;

// ******************************

INSTANCE DIA_Lares_AgainOk (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 3;
	condition		= DIA_Lares_AgainOk_Condition;
	information		= DIA_Lares_AgainOk_Info;
	permanent		= 0;
	important		= 0;
	description = "W porz�dku, zajm� si� uciekinierami.";
};                       

FUNC int DIA_Lares_AgainOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lares_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_AgainOk_Info()
{
	AI_Output (other, self,"DIA_Lares_AgainOk_15_00"); //W porz�dku, zajm� si� uciekinierami.
	AI_Output (self, other,"DIA_Lares_AgainOk_11_01"); //R�wny z Ciebie ch�op!
	AI_Output (self, other,"DIA_Lares_AgainOk_11_02"); //Ale masz na to tylko dwa dni. P�niej wr�ci Fletcher i skopie mi dup� je�eli nie poka�� mu, �e ukara�em tych sukinsyn�w.
	AI_Output (self, other,"DIA_Lares_AgainOk_11_03"); //Owocnych �ow�w.
	
   lares_wait = B_SetDayTolerance()+2;
	Log_CreateTopic	(CH4_NC_HeadHunter, LOG_MISSION);
	Log_SetTopicStatus	(CH4_NC_HeadHunter, LOG_RUNNING);
	B_LogEntry		(CH4_NC_HeadHunter, "W�a�nie sta�em si� �owc� G��w! Obieca�em Laresowi, �e znajd� szkodnik�w, kt�rzy zbiegli z p�l ry�owych i zabij� ich. Dowodami maj� by� ich g�owy. Jeden z uciekinier�w ma tak�e top�r Laresa.");
	
	Wld_InsertNpc				(Non_20250_Grd,"LOCATION_23_CAVE_1_IN");
	Wld_InsertNpc				(Non_20251_Run,"LOCATION_23_CAVE_1_IN");	
	Wld_InsertNpc				(Non_20252_Smoke,"LOCATION_23_CAVE_1_IN");	
	Wld_InsertNpc				(Non_20253_Stay,"LOCATION_23_CAVE_1_IN");	
};

/**********************************
Ork pami�taj, �eby usun�� Laresowi ten top�r z inventory!
Tych szkodnik�w wrzu� do jaskini w kt�rej Roscoe p�dzi� nielegaln� ry��wk�. Daj im att_hostille, chodzi tylko o zabicie, daj im do inv. g�owy - ma ich by� 5.

*********************************/

// ******************************

INSTANCE DIA_Lares_AgainOk2 (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 4;
	condition		= DIA_Lares_AgainOk2_Condition;
	information		= DIA_Lares_AgainOk2_Info;
	permanent		= 0;
	important		= 0;
	description 	= "Mam dla ciebie prezent.";
};                       

FUNC int DIA_Lares_AgainOk2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lares_Again))&&(NPC_HasItems(other,Lares_Axt)>=1)&&(NPC_HasItems(other,HEAD1_org)>=1)&&(NPC_HasItems(other,HEAD2_org)>=1)&&(NPC_HasItems(other,HEAD3_org)>=1)&&(NPC_HasItems(other,HEAD4_org)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_AgainOk2_Info()
{
	AI_Output (other, self,"DIA_Lares_AgainOk2_15_00"); //Mam dla ciebie prezent.

	if (lares_wait >= (Wld_GetDay()))
	{
		lares_done = 1;
		B_GiveXP(500);
      
		AI_Output (self, other,"DIA_Lares_AgainOk2_11_01"); //Zd��y�e� przed Fletcherem. �wietna robota.
		AI_Output (other, self,"DIA_Lares_AgainOk2_15_02"); //Najpierw g�owy...
		
      B_GiveInvItems (other, self, HEAD1_org, 1);
		B_GiveInvItems (other, self, HEAD2_org, 1);
		B_GiveInvItems (other, self, HEAD3_org, 1);
		B_GiveInvItems (other, self, HEAD4_org, 1);

		Npc_RemoveInvItems(self,HEAD1_org,1);
		Npc_RemoveInvItems(self,HEAD2_org,1);
		Npc_RemoveInvItems(self,HEAD3_org,1);
		Npc_RemoveInvItems(self,HEAD4_org,1);

		AI_Output (self, other,"DIA_Lares_AgainOk2_11_03"); //Po �mierci s� jeszcze paskudniejsi ni� za �ycia. Masz m�j top�r?
		AI_Output (other, self,"DIA_Lares_AgainOk2_15_04"); //Pewnie.
		
      B_GiveInvItems (other, self, Lares_Axt, 1);

		/********************
	Usu� weapon, kt�ry dasz Laresowi na pocz�tku
	Npc_RemoveInvItems(self,ten weapon,1);
	**********************/

		AI_EquipBestMeleeWeapon	(self);
		AI_ReadyMeleeWeapon		(self);
		AI_PlayAni				(self, "T_1HSINSPECT");
      AI_RemoveWeapon(self);
		AI_UnequipWeapons		(self);

		AI_Output (self, other,"DIA_Lares_AgainOk2_11_05"); //Jestem Twoim d�u�nikiem przyjacielu. Pytaj o co chcesz.

		Log_SetTopicStatus	(CH4_NC_HeadHunter, LOG_SUCCESS);
		B_LogEntry		(CH4_NC_HeadHunter, "Lares dosta� swoje g�owy i top�r. Mam ju� do�� zabawy w rze�nika.");
		B_LogEntry		(CH4_NC_RBLBosses, "Lares jest bardzo wdzi�czny. Ciekawe czy powie mi co� ciekawego?");
	}
	else
	{
		AI_Output (self, other,"DIA_Lares_AgainOk2_11_06"); //Sp�n�e� si�. Niech to szlag trafi, ju� po mnie...
		
      lares_done = 2;
		Log_SetTopicStatus	(CH4_NC_HeadHunter, LOG_FAILED);
		B_LogEntry		(CH4_NC_HeadHunter, "Sp�ni�em si�. Lares ma przechlapane.");
		var C_NPC flet; flet = Hlp_GetNpc(Grd_255_Fletcher);
		B_StopProcessInfos	(self);

		/***************************
	Ork Fletcher ma si� znale�� do�� blisko, �eby w kolejnym dialogu nie podchodzi� za d�ugo.
	**************************/
		Npc_ExchangeRoutine(flet,"GO");
	};
};

// ******************************

INSTANCE DIA_Lares_FletCome (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 5;
	condition		= DIA_Lares_FletCome_Condition;
	information		= DIA_Lares_FletCome_Info;
	permanent		= 0;
	important		= 1;
	description 	= ".";
};                       

FUNC int DIA_Lares_FletCome_Condition()
{
	if (lares_done == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_FletCome_Info()
{
	lares_done = 3;
	var C_NPC flet; flet = Hlp_GetNpc(Grd_255_Fletcher);
	AI_Output (self, other,"DIA_Lares_FletCome_11_01"); //O wilku mowa...
	AI_TurnToNpc(self, flet);
	AI_Output (self, other,"DIA_Lares_FletCome_11_02"); //Do licha, nie zd��� uciec.
	B_StopProcessInfos	(self);

	/*****************
	WP ze 2m od Laresa
	****************/

	AI_GotoWP (flet, "NC_PATH83_MOVEMENT");
};

// ******************************

INSTANCE DIA_Lares_Questions (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 6;
	condition		= DIA_Lares_Questions_Condition;
	information		= DIA_Lares_Questions_Info;
	permanent		= 0;
	important		= 0;
	description = "Mam kilka pyta�.";
};                       

FUNC int DIA_Lares_Questions_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lares_AgainOk2))||(Npc_KnowsInfo (hero, DIA_Fletcher_LaresPunish))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_Questions_Info()
{
	AI_Output (other, self,"DIA_Lares_Questions_15_00"); //Mam kilka pyta�.
	AI_Output (self, other,"DIA_Lares_Questions_11_01"); //Pewnie, powiem wszystko co wiem.

	Info_ClearChoices (DIA_Lares_Questions);
	Info_AddChoice (DIA_Lares_Questions, "Us�ysza�em ju� do��.", DIA_Lares_Questions_End);
	Info_AddChoice (DIA_Lares_Questions, "Czym si� zajmujesz?", DIA_Lares_Questions_What);
	Info_AddChoice (DIA_Lares_Questions, "Co zamierzasz?", DIA_Lares_Questions_Future);
	Info_AddChoice (DIA_Lares_Questions, "Jaka jest sytuacja w obozie?", DIA_Lares_Questions_Situation);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Lares_Questions_What()
{
	AI_Output (other, self,"DIA_Lares_Questions_What_15_00"); //Czym si� zajmujesz?
	AI_Output (self, other,"DIA_Lares_Questions_What_11_01"); //Odk�d Ry�owy Ksi��� zawis� na sznurze to na mnie spad� w�tpliwy zaszczyt dogl�dania zbior�w.
	AI_Output (self, other,"DIA_Lares_Questions_What_11_02"); //Stra�nicy postanowili wykorzysta� moje naturalne... zdolno�ci. Rzeczywi�cie jako� sobie radz�, ale to �ycie na kraw�dzi.
	AI_Output (self, other,"DIA_Lares_Questions_What_11_03"); //Sam widzia�e� jak niewiele brakowa�o, �eby Fletcher powiesi� mnie obok Ksi�cia.
	//Info_ClearChoices (DIA_Lares_Questions);
};


// -------------------------------------------------------------------

FUNC VOID DIA_Lares_Questions_Future()
{
	AI_Output (other, self,"DIA_Lares_Questions_Future_15_00"); //Co zamierzasz?
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_01"); //Hmm, to do�� skomplikowane.
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_02"); //Przede wszystkim nikt nie chce da� si� zabi� tym sukinsynom w czerwonych pancerzach.
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_03"); //Nie b�dziemy te� wiecznie tolerowa� takiego �ycia. 
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_04"); //Stra�nicy wzi�li nas z zaskoczenia. Powoli przygotowujemy si� na ma�y pucz.
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_05"); //Ale do tego jeszcze nam daleko. Najpierw musimy zrobi� porz�dki na w�asnym podw�rku.
	AI_Output (other, self,"DIA_Lares_Questions_Future_15_06"); //Co masz na my�li?
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_07"); //Niestety niekt�rym najemnikom czy szkodnikom odpowiada taka sytuacja. Bez szemrania pracuj� dla stra�nik�w.
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_08"); //Brakuje nam jednego przyw�dcy, kogo� silnego i bezwzgl�dnego.
	AI_Output (other, self,"DIA_Lares_Questions_Future_15_09"); //Lee?
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_10"); //Dok�adnie. Jestem pewien, �e genera� zdo�a�by skrzykn�� wszystkich razem.
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_11"); //A wtedy daliby�my stra�nikom t�giego kopa mi�dzy nogi.
	lee_back = lee_back + 1;
	B_LogEntry		(CH4_NC_RBLBosses, "Lares ma ju� do�� stra�nik�w, twierdzi jednak, �e tylko jeden, silny przyw�dca zdo�a po��czy� wszystkich buntownik�w w walce z lud�mi Gomeza. Wyb�r jest do�� oczywisty - Lee.");
	//Info_ClearChoices (DIA_Lares_Questions);
};


// -------------------------------------------------------------------

FUNC VOID DIA_Lares_Questions_Situation()
{
	lares_cooperate = TRUE;
	AI_Output (other, self,"DIA_Lares_Questions_Situation_15_00"); //Jaka jest sytuacja w obozie?
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_01"); //Napi�ta i nerwowa.
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_02"); //Nikt nikomu nie ufa. W obozie wida� podzia� na trzy grupy.
	AI_Output (other, self,"DIA_Lares_Questions_Situation_15_03"); //Jedn� z nich Ty przewodzisz?
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_04"); //Mo�na tak powiedzie�. Pozostali to Wilk i Torlof. 
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_05"); //Powiem szczerze, �e nie jestem pewien co oni kombinuj�. Nie zamierzam te� sam odkrywa� przed nimi kart.
	AI_Output (other, self,"DIA_Lares_Questions_Situation_15_06"); //Hmm. W jedno�ci si�a. Oddzielnie nic nie zwojujecie.
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_07"); //Wiem, ale ryzyko jest zbyt du�e. Musz� mie� pewno��, �e Wilk i Torlof my�l� podobnie. 
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_08"); //Nie mam okazji, �eby porozmawia� z kt�rym� z nich na osobno�ci. Wilka ci�gle kto� pilnuje, a Torlofa nie wypuszczaj� z kopalni.
	AI_Output (other, self,"DIA_Lares_Questions_Situation_15_09"); //Rozumiem. Mo�e b�d� m�g� co� na to zaradzi�.
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_10"); //Tylko b�d� ostro�ny i nie wymawiaj za szybko mojego imienia.
	AI_Output (other, self,"DIA_Lares_Questions_Situation_15_11"); //Bez obaw, to tak�e gra o moje �ycie.
	B_LogEntry		(CH4_NC_RBLBosses, "Przyw�dcy ognisk rebelii s� rozproszeni i nie maj� ze sob� bezpo�redniego kontaktu. Mo�e zdo�am porozmawia� z ka�dym z nich i wp�yn� na to aby po��czyli swoje wysi�ki w walce o wolno��.");
	//Info_ClearChoices (DIA_Lares_Questions);
};


FUNC VOID DIA_Lares_Questions_End()
{
	AI_Output (other, self,"DIA_Lares_Questions_End_15_01"); //To mi wystarczy.
	Info_ClearChoices (DIA_Lares_Questions);			
	B_StopProcessInfos	(self);
};

// ******************************

INSTANCE DIA_Lares_LeeBack (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 7;
	condition		= DIA_Lares_LeeBack_Condition;
	information		= DIA_Lares_LeeBack_Info;
	permanent		= 0;
	important		= 0;
	description = "Co si� dzieje?";
};                       

FUNC int DIA_Lares_LeeBack_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_RBLBegin))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_LeeBack_Info()
{
	AI_Output (other, self,"DIA_Lares_LeeBack_15_00"); //Co si� dzieje?
	AI_Output (self, other,"DIA_Lares_LeeBack_11_01"); //Jak to co? Lee wr�ci�!
	AI_Output (self, other,"DIA_Lares_LeeBack_11_02"); //Pod jego komend� wykopiemy stra�nik�w a� pod samo Khorinis.
	AI_Output (other, self,"DIA_Lares_LeeBack_15_03"); //To ju� zauwa�y�em, bardziej interesuje mnie aktualna sytuacja w obozie.
	AI_Output (self, other,"DIA_Lares_LeeBack_11_04"); //No to faktycznie sporo si� wydarzy�o. Co chcesz wiedzie�?
	B_LogEntry		(CH5_NO_Rebel, "Lares wprowadzi mnie w sytuacj� panuj�c� w Nowym Obozie.");
};

var int situation_know;


// ******************************

INSTANCE DIA_Lares_LeeBackGuards (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 8;
	condition		= DIA_Lares_LeeBackGuards_Condition;
	information		= DIA_Lares_LeeBackGuards_Info;
	permanent		= 0;
	important		= 0;
	description 		= "Opowiedz mi o stra�nikach.";
};                       

FUNC int DIA_Lares_LeeBackGuards_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lares_LeeBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_LeeBackGuards_Info()
{
	situation_know = situation_know + 1;
   
	AI_Output (other, self,"DIA_Lares_LeeBackGuards_15_00"); //Opowiedz mi o stra�nikach.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_01"); //To chyba najbardziej niesamowita historia.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_02"); //Trudno w to uwierzy�, ale w�r�d tych ment te� wybuch�a rebelia.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_03"); //Poplecznicy Hrabiego z nim na czele zaj�li Orle Gniazdo i nie maj� zamiaru opu�ci� kasztelu.
	AI_Output (other, self,"DIA_Lares_LeeBackGuards_15_04"); //Przecie� stamt�d nie ma wyj�cia. Po co sami zamkn�li si� w pu�apce?
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_05"); //Tego nie wiem, ale jak znam Hrabiego to nie zrobi�by niczego g�upiego.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_06"); //Ten skurczybyk jeszcze mo�e nas zaskoczy�.
	AI_Output (other, self,"DIA_Lares_LeeBackGuards_15_07"); //A druga strona?
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_08"); //Fletcher i wszyscy, kt�rzy bardziej boj� si� Gomeza ni� Hrabiego bawi� si� w regularne obl�enie.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_09"); //Dzi�ki temu mog�em bez problem�w usun�� stra�nik�w na ry�owych polach.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_10"); //Reszta walczy w Kotle i Nowej Kopalni.
	B_LogEntry		(CH5_NO_Rebel, "A� mi szcz�ka opad�a kiedy dowiedzia�em si�, �e w�r�d stra�nik�w powsta� roz�am! Garstka z Hrabim na czele zamkn�a si� w Orlim Gnie�dzie. Pozostali pod wodz� Fletchera oblegaj� kasztel. Ciekawe co tu jest grane?");

	Log_CreateTopic	(CH5_NO_Guards, LOG_MISSION);
	Log_SetTopicStatus	(CH5_NO_Guards, LOG_RUNNING);
	B_LogEntry		(CH5_NO_Guards, "Stra�nicy pod wodz� Hrabiego zaj�li Orle Gniazdo i broni� si� tam przed reszt� ludzi Fletchera. Jestem pewien, �e Hrabia knuje co� nieprzyjemnego. Mog� si� te� za�o�y�, �e robi to w porozumieniu z Krukiem. Musz� spr�bowa� dosta� si� do kasztelu, ciekawe czego si� tam dowiem?");
};

// ******************************

INSTANCE DIA_Lares_LeeBackMine (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 9;
	condition		= DIA_Lares_LeeBackMine_Condition;
	information		= DIA_Lares_LeeBackMine_Info;
	permanent		= 0;
	important		= 0;
	description = "Co si� dzieje w kopalni?";
};                       

FUNC int DIA_Lares_LeeBackMine_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lares_LeeBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_LeeBackMine_Info()
{
	situation_know = situation_know + 1;
	AI_Output (other, self,"DIA_Lares_LeeBackMine_15_00"); //Co si� dzieje w kopalni?
	AI_Output (self, other,"DIA_Lares_LeeBackMine_11_01"); //Tam jest najgorzej.
	AI_Output (self, other,"DIA_Lares_LeeBackMine_11_02"); //Torlof opiera si� ju� resztkami si�. Fakt, �e stra�nicy te� nabrali przed jego lud�mi respektu, ale to ju� nie potrwa d�ugo.
	AI_Output (self, other,"DIA_Lares_LeeBackMine_11_03"); //Dosz�y mnie s�uchy, �e stra�nicy szykuj� si� do ostatecznego uderzenia.
	AI_Output (self, other,"DIA_Lares_LeeBackMine_11_04"); //Jestem pewien, �e stary Torlof b�dzie walczy� do ostatniej kropli krwi.

	B_LogEntry		(CH5_NO_Rebel, "Torlof opiera si� ju� resztkami si��, to ju� nie potrwa d�ugo.");

	Log_CreateTopic	(CH5_NO_Mine, LOG_MISSION);
	Log_SetTopicStatus	(CH5_NO_Mine, LOG_RUNNING);
	B_LogEntry		(CH5_NO_Mine, "Torlof ca�y czas walczy ze stra�nikami w kopalni. Jednak Lares twierdzi, �e to ju� nie potrwa d�ugo. Musz� co� zrobi�!");
};

// ******************************

INSTANCE DIA_Lares_LeeBackWolf (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 10;
	condition		= DIA_Lares_LeeBackWolf_Condition;
	information		= DIA_Lares_LeeBackWolf_Info;
	permanent		= 0;
	important		= 0;
	description 		= "Co s�ycha� w Kotle?";
};                       

FUNC int DIA_Lares_LeeBackWolf_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lares_LeeBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_LeeBackWolf_Info()
{
	situation_know = situation_know + 1;
	AI_Output (other, self,"DIA_Lares_LeeBackWolf_15_00"); //Co s�ycha� w Kotle?
	AI_Output (self, other,"DIA_Lares_LeeBackWolf_11_01"); //Wilk porz�dnie nadgryz� stra�nik�w i zabarykadowa� si� ze swoj� sfor� w siedzibie Mag�w Wody.
	AI_Output (self, other,"DIA_Lares_LeeBackWolf_11_02"); //Z tego co wiem radz� sobie nie�le, a stra�nicy co� nie pal� si� do kontrataku. Ka�dego zbyt odwa�nego lub g�upiego trafiaj� celnie wymierzone szypy.
	AI_Output (self, other,"DIA_Lares_LeeBackWolf_11_03"); //Kto� zaradny m�g�by si� tam przedosta� pod os�on� nocy i porozmawia� z Wilkiem. Ten wylinia�y pies powinien dowiedzie� si�, �e Lee wr�ci�.
	
   B_LogEntry		(CH5_NO_Rebel, "Wilk zabarykadowa� si� w siedzibie mag�w i radzi sobie ca�kiem nie�le.");

	Log_CreateTopic	(CH5_NO_Wolf, LOG_MISSION);
	Log_SetTopicStatus	(CH5_NO_Wolf, LOG_RUNNING);
	B_LogEntry		(CH5_NO_Wolf, "Wilk zabarykadowa� si� w siedzibie Mag�w Wody. Jak na razie trzyma stra�nik�w w szachu. Lares uwa�a, �e pod os�on� nocy mo�na by si� przedrze� poza barykad� i powiedzie� Wilkowi o powrocie Lee. Mam tylko nadziej�, �e Wilk i jego sfora potrafi� odr�ni� rebelianta od stra�nika.");
};

// ******************************

INSTANCE DIA_Lares_LeeBackSub (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 11;
	condition		= DIA_Lares_LeeBackSub_Condition;
	information		= DIA_Lares_LeeBackSub_Info;
	permanent		= 0;
	important		= 0;
	description 		= "Obozuje tu ma�a armia.";
};                       

FUNC int DIA_Lares_LeeBackSub_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lares_LeeBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_LeeBackSub_Info()
{
	situation_know = situation_know + 1;
	
   AI_Output (other, self,"DIA_Lares_LeeBackSub_15_00"); //Obozuje tu ma�a armia.
	AI_Output (self, other,"DIA_Lares_LeeBackSub_11_01"); //Kiedy zobaczy�em Lee pozby�em si� stra�nik�w i kontrolujemy teraz ca�e podobozie.
	AI_Output (self, other,"DIA_Lares_LeeBackSub_11_02"); //Najwy�sza pora skopa� dupska tych pasterskich ps�w!
	
   B_LogEntry(CH5_NO_Rebel, "Lares kontroluje ca�e podobozie. To tutaj Lee urz�dzi� kwater� g��wn�.");
};

// ******************************

INSTANCE DIA_Lares_WhatNext (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 12;
	condition		= DIA_Lares_WhatNext_Condition;
	information		= DIA_Lares_WhatNext_Info;
	permanent		= 0;
	important		= 1;
	description 	= "";
};                       

FUNC int DIA_Lares_WhatNext_Condition()
{
	if (situation_know == 4)&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_WhatNext_Info()
{
	AI_Output (self, other,"DIA_Lares_WhatNext_11_01"); //Wiesz ju� wszystko o sytuacji w obozie. Co planuje Lee?
	AI_Output (other, self,"DIA_Lares_WhatNext_15_02"); //Tego musz� si� dowiedzie�. Ale jestem pewien, �e jego plany nie przypadn� stra�nikom do gustu.
	
   B_LogEntry		(CH5_NO_Rebel, "Wiem ju� wystarczaj�co du�o o sytuacji panuj�cej w Nowym Obozie. Czas porozmawia� z Lee o szczeg�ach ataku.");
	B_StopProcessInfos	(self);
};
