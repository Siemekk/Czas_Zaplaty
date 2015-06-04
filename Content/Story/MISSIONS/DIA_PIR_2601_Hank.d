
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_PIR_2601_Hank_Exit (C_INFO)
{
	npc			= PIR_2601_Hank;
	nr			= 999;
	condition	= DIA_PIR_2601_Hank_Exit_Condition;
	information	= DIA_PIR_2601_Hank_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PIR_2601_Hank_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_PIR_2601_Hank_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_PIR_2601_Hank_Hello (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 1;
	condition		= DIA_PIR_2601_Hank_Hello_Condition;
	information		= DIA_PIR_2601_Hank_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_PIR_2601_Hank_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 350)&&(Kapitel<=1)
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2601_Hank_Hello_Info()
{
	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);

	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_01"); //Rick... to Ty?!
	AI_Output (other, self,"DIA_PIR_2601_Hank_Hello_15_02"); //A kogo si� spodziewa�e�? Syreny morskiej z cyckami do pasa?
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_03"); //Byli�my pewni, �e Twoje ko�ci bielej� na dnie.
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_04"); //Niech mnie! A to si� ch�opaki uciesz�!
	AI_TurnToNpc			(self,rodney);			
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_05"); //Hej, darmozjady! Rick �yje!
	B_Kapitelwechsel(1);	 	
	CreateInvItems	(self, ItFoBeer, 4);
	AI_TurnToNpc			(self,other);	
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_06"); //Naprawd� dobrze Ci� znowu widzie�. Ten paskudny sztorm kompletnie nas zaskoczy�.
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_07"); //To nie mog�a by� zwyczajna burza. Ale mniejsza o to, wa�ne, �e jeste� w jednym kawa�ku, bez �lad�w po z�bach rekina na ty�ku.
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_08"); //Trzymaj flaszk� i wyp�ucz gard�o z piasku. Smakuje du�o lepiej ni� s�ona woda.
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_09"); //Twoje zdrowie, brachu!
	B_GiveInvItems (self, other,ItFoBeer, 1);
   
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
   
	AI_UseItem (other,ItFobeer);
	AI_UseItem (self,ItFobeer);
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_10"); //He, he, jak zawsze do dna. Ale pami�taj - nast�pnym razem Ty stawiasz!
	Npc_ExchangeRoutine	(self,"START");	
};

INSTANCE DIA_PIR_2601_Hank_WhereAreWe (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 2;
	condition		= DIA_PIR_2601_Hank_WhereAreWe_Condition;
	information		= DIA_PIR_2601_Hank_WhereAreWe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gdzie my jeste�my?"; 
};

FUNC INT DIA_PIR_2601_Hank_WhereAreWe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_PIR_2601_Hank_Hello))
	{
		return 1;
	};
};
FUNC VOID DIA_PIR_2601_Hank_WhereAreWe_Info()
{
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_01"); //Gdzie jeste�my?
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_02"); //Nie jestem pewien, ale to chyba wybrze�e wyspy Khorinis. Niestety nie rozbili�my si� po tej stronie co trzeba.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_03"); //Czyli jak zawsze mamy przechlapane.	
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_04"); //Mniej wi�cej. Chocia� raczej wi�cej ni� mniej.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_05"); //Khorinis to du�a wyspa, ze �licznym portowym miastem, z bogatymi kupcami gotowymi odda� nam swoje z�oto i c�rki.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_06"); //To gdzie tkwi haczyk?
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_07"); //Khorinis to te� kopalnie, gdzie l�duj� najwi�ksze m�ty z ca�ej Myrtany.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_08"); //No tak, Kolonia Karna.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_09"); //W rzeczy samej, a my trafili�my w sam �rodek tego �ajna. Do tego otacza nas jaka� magiczna bariera.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_10"); //Buk�ak pr�bowa� j� sforsowa�. Uczepi� si� takielunku i zanim go powstrzymali�my zamieni� si� w �liczn� skwark�.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_11"); //Czyli jeste�my udupieni?
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_12"); //Nie inaczej, brachu.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_13"); //A ruszyli�cie ju� t�uste zadki, �eby pospacerowa� po okolicy?
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_14"); //To samo powiedzia� Angus. Musimy zbada� wysp� i mo�e wyniuchamy jak st�d prysn�� zanim narazimy si� niew�a�ciwej osobie.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_15"); //Mam tylko nadziej�, �e reszta skaza�c�w nie jest taka nerwowa jak Ci idioci w czerwonych zbrojach.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_16"); //Kto� was zaatakowa�?	
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_17"); //Mo�na tak powiedzie�. W ka�dym razie pr�bowali. Nie posz�o im za dobrze, ale lepiej, �eby ich kumple nas nie znale�li.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_18"); //Spotkali�cie innych skaza�c�w?			
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_19"); //Na razie tylko tych w czerwonych pancerzach. Dalej si� nie zapuszczali�my. Angus m�wi, �e lepiej nie rzuca� si� w oczy.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_20"); //Poczekamy a� zapadnie zmrok i wtedy obejrzymy sobie okolic�.								
	
   Log_CreateTopic(CH1_Pir_Colony, LOG_NOTE);
	B_LogEntry(CH1_Pir_Colony, "Po tym jak dopad� nas paskudny sztorm trafili�my do Kolonii Karnej na wyspie Khorinis. Do tego ca�� Koloni� otacza jaka� magiczna bariera. Trzeba b�dzie znale�� spos�b, �eby si� st�d wyrwa� i to jak najszybciej.");
};

INSTANCE DIA_PIR_2601_Hank_WhatDo (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 3;
	condition		= DIA_PIR_2601_Hank_WhatDo_Condition;
	information		= DIA_PIR_2601_Hank_WhatDo_Info;
	permanent		= 0;
	important		= 0;
	description		= "Uda�o si� uratowa� co� z �adowni okr�tu?"; 
};

FUNC INT DIA_PIR_2601_Hank_WhatDo_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_PIR_2601_Hank_WhereAreWe))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2601_Hank_WhatDo_Info()
{
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhatDo_15_01"); //Uda�o si� uratowa� co� z �adowni okr�tu?
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_02"); //Niestety nie. Ocali�em tylko to co mia�em na sobie. No i kilka flaszek, kt�re przezornie schowa�em za pazuch�.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhatDo_15_03"); //Niech to szlag trafi! Ca�e uczciwie zrabowane z�oto posz�o na dno! 
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_04"); //Takie �ycie brachu. Raz na dziewce, raz pod ch�opem.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_05"); //Ale mog�o by� gorzej. Mamy szcz�cie, kt�rego sporo z braci nie mia�o.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhatDo_15_06"); //Nie wiem, kto mia� wi�ksze szcz�cie. Oni przynajmniej nie musz� my�le�, jak si� st�d wydosta�.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_07"); //Ja tam wol� umrze� z kutasem w ustach dziwki i flaszk� w d�oni, ni� w szcz�kach rekina.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_08"); //Angus na pewno co� wymy�li. Wychodzili�my ca�o z gorszych opresji.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhatDo_15_09"); //To si� dopiero oka�e. Ja wol� bra� los we w�asne r�ce.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_10"); //Spokojnie. Jak chcemy wynie�� st�d �ycie to musimy mocno pog��wkowa�. A ja kurde nie potrafi� my�le� na trze�wo...
	AI_UseItem (self,ItFobeer);
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_11"); //Od razu lepiej, wr�ci�a mi trze�wo�� umys�u. Na czym to ja sko�czy�em...
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhatDo_15_12"); //Jak zawsze na butelce.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_13"); //Id� lepiej pogadaj z Angusem. I pami�taj - bra� zawsze trzyma si� razem!							
};

/********************************
Nauki nie rusza�em tylko ten dialog jako info zosta�
**********************************/

INSTANCE DIA_PIR_2601_Hank_CanUTeachMe (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 4;
	condition		= DIA_PIR_2601_Hank_CanUTeachMe_Condition;
	information		= DIA_PIR_2601_Hank_CanUTeachMe_Info;
	permanent		= 0;
	//important		= 1;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_PIR_2601_Hank_CanUTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_PIR_2601_Hank_WhatDo))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2601_Hank_CanUTeachMe_Info()
{
	AI_Output (other, self,"DIA_PIR_2601_Hank_CanUTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_02"); //Oczywi�cie! W ko�cu tym si� zajmuj�.
	//Orc: Poprawione - zla nazwa zmiennej tematy brak create topic'a
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);	
	B_LogEntry(GE_TeacherOW, "Pirat Hank nauczy mnie pos�ugiwa� si� broni� dwur�czn� i poka�e mi, jak zwi�kszy� si��.");
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_03"); //Ech, nie ma to jak t�uc kordelasem kr�lewskie �by.	
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_04"); //Mog� nauczy� Ci� porz�dnie macha� dwur�cznym or�em. Poka�� Ci te�, jak zwi�kszy� si��.
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_05"); //Co� marnie wygl�dasz, troch� �wicze� Ci nie zaszkodzi.
	AI_Output (other, self,"DIA_PIR_2601_Hank_CanUTeachMe_15_06"); //Cholera, nie mam sakiewki.	
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_07"); //Bez obaw przyjacielu. Nauka nic Ci� nie b�dzie kosztowa�.
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_08"); //Koniec ko�c�w tkwimy w tym bagnie razem. Kto wie, mo�e od tego jak dobrze b�dziesz d�ga� sztychem zale�e� b�dzie te� i moje �ycie.
	AI_Output (other, self,"DIA_PIR_2601_Hank_CanUTeachMe_15_09"); //Dzi�kuj�, ale ja zawsze sp�acam zaci�gni�te d�ugi.
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_10"); //W swoim czasie, przyjacielu. W swoim czasie...
};

INSTANCE DIA_Hank_KillAligator (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 10;
	condition		= DIA_Hank_KillAligator_Condition;
	information		= DIA_Hank_KillAligator_Info;
	permanent		= 0;
	important		= 0;
	description		= "Widz�, �e si� nudzisz."; 
};

FUNC INT DIA_Hank_KillAligator_Condition()
{
	if (jack_yes==TRUE)&&(!Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Hank_KillAligator_Info()
{
	B_GiveXP(100);
	AI_Output (other, self, "DIA_Hank_KillAligator_15_01"); //Widz�, �e si� nudzisz. 
	AI_Output (self, other, "DIA_Hank_KillAligator_11_02"); //Schn� jak �led� w w�dzarni, w tym obozie nic si� nie dzieje.
	AI_Output (other, self, "DIA_Hank_KillAligator_15_03"); //Wybieram si� na polowanie, co Ty na to?
	AI_Output (self, other, "DIA_Hank_KillAligator_11_04"); //Jeszcze si� pytasz?! Id� z Tob�, przyjacielu.
	B_LogEntry		(CH1_Rbl_Aligator, "Hank wyruszy� ze mn� na polowanie.");
	Party_AddNpc(self);
   
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};	
   
	Npc_ExchangeRoutine	(self,"FOLLOWALLIGATOR");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Hank_KillAligatorOut (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 11;
	condition		= DIA_Hank_KillAligatorOut_Condition;
	information		= DIA_Hank_KillAligatorOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hank_KillAligatorOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hank_KillAligator))&&(Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Hank_KillAligatorOut_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(100);
   
	AI_Output (self, other,"DIA_Hank_KillAligatorOut_11_01"); //Polowanie sko�czone. Znowu b�d� musia� zarzuci� kotwic� w tym cholernym obozie.
	AI_Output (other, self,"DIA_Hank_KillAligatorOut_15_02"); //Dzi�ki za pomoc Hank.
	
   B_LogEntry(CH1_Rbl_Aligator, "Hank po zabiciu aligatora wr�ci� do obozu.");
	B_StopProcessInfos(self);
   Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"INHC");
};

// /************************

// Po ataku na ork�w przy que�cie z Carlsonem
// ************************/

// INSTANCE DIA_Hank_KillOrc (C_INFO)
// {
// 	npc				= PIR_2601_Hank;
// 	nr				= 12;
// 	condition		= DIA_Hank_KillOrc_Condition;
// 	information		= DIA_Hank_KillOrc_Info;
// 	permanent		= 0;
// 	important		= 1;
// 	description		= "..."; 
// };

// FUNC INT DIA_Hank_KillOrc_Condition()
// {

// 	if (orc_appear == TRUE)&&(Npc_IsDead(Orc1))&&(Npc_IsDead(Orc2))&&(Npc_IsDead(Orc3))&&(Npc_IsDead(Orc4))
// 	{
// 		return 1;
// 	};
// 		
// };

// FUNC VOID DIA_Hank_KillOrc_Info()
// {
// 	B_FullStop (hero);
// 	AI_GotoNpc(self,other);
// 	B_GiveXP(100);
// 	AI_Output (self, other,"DIA_Hank_KillOrc_11_01"); //By�o gor�co, ale za to jaki ubaw, he, he.
// 	AI_Output (other, self,"DIA_Hank_KillOrc_15_02"); //Bywaj, Hank.
// 	Npc_SetAivar(self,AIV_PARTYMEMBER,  FALSE);
// 	Npc_ExchangeRoutine	(self,"INHC");
// 	B_StopProcessInfos	(self);
// };

INSTANCE DIA_Hank_KillPatrol (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 13;
	condition		= DIA_Hank_KillPatrol_Condition;
	information		= DIA_Hank_KillPatrol_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz ochot� na ma�� rozr�b�?"; 
};

FUNC INT DIA_Hank_KillPatrol_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Quest1))&&(!Npc_KnowsInfo (hero, DIA_Duke_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Hank_KillPatrol_Info()
{
	AI_Output (other, self,"DIA_Hank_KillPatrol_15_01"); //Masz ochot� na ma�� rozr�b�?
   
	if (!Npc_KnowsInfo (hero, DIA_Angus_Patrol))
	{
		AI_Output (self, other,"DIA_Hank_KillPatrol_11_02"); //Znasz mnie, z ch�ci� obij� jakie� pyski. Ale najpierw pogadaj z Angusem, wol� nie robi� nic za jego plecami.
		AI_Output (other, self,"DIA_Hank_KillPatrol_15_03"); //W porz�dku.
		B_LogEntry		(CH2_RBL_GuardCamp, "Hank mi pomo�e w za�atwieniu stra�nik�w, ale najpierw musz� pogada� o tym z Angusem.");
	}
	else
	{
		AI_Output (self, other,"DIA_Hank_KillPatrol_11_04"); //Jak zawsze, sterniku!
	};
   
	B_StopProcessInfos	(self);
};

INSTANCE DIA_PIR_2601_Hank_Stew (C_INFO)
{
	npc				= PIR_2601_Hank;
	//nr				= 12;
	condition		= DIA_PIR_2601_Hank_Stew_Condition;
	information		= DIA_PIR_2601_Hank_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie gulasz."; 
};

FUNC INT DIA_PIR_2601_Hank_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2601_Hank_Stew_Info()
{
	fox_stew += 1;
   
	AI_Output (other, self, "DIA_PIR_2601_Hank_Stew_15_01"); //Mam dla Ciebie gulasz.
	AI_Output (self, other, "DIA_PIR_2601_Hank_Stew_11_02"); //Dobra, daj mi go. Przynajmniej zaspokoj� sw�j g��d.
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Hankowi bez problemu wcisn��em gulasz."); 
};