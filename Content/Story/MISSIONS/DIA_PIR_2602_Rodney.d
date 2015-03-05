// **************************************************
// 						 EXIT 
// **************************************************
var int RodneyHelp;
var int weapon_package;

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_PIR_2602_Rodney_Hello (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 2;
	condition		= DIA_PIR_2602_Rodney_Hello_Condition;
	information		= DIA_PIR_2602_Rodney_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_PIR_2602_Rodney_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2601_Hank_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2602_Rodney_Hello_Info()
{
	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);

	AI_GotoNpc(self, hero);
	AI_TurnToNpc (self,hero);
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Hello_15_01"); //Co si� sta�o? �eb mi p�ka i nic nie pami�tam...
	//AI_GotoNpc(hero, self);
	AI_TurnToNpc (hero,self);
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_02"); //Widzia�em jak uderzy�e� g�ow� o pok�ad, kiedy fale rzuci�y nas na ska�y.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_03"); //Ale i tak mia�e� wi�cej szcz�cia ni� pozostali.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_04"); //Burza pojawi�a si� znik�d. Jakby na nas czeka�a...
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_05"); //Do tego ska�y i ta przekl�ta bariera.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_06"); //Znale�li�my niedaleko kilka cia�. Dwa z nich to chyba Dustin i Skip.
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Hello_15_07"); //Chyba?
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_08"); //Byli tak zmasakrowani, �e nie mia�em pewno�ci. Skipa pozna�em po chu�cie na g�owie.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_09"); //Drugi mia� na ramieniu tatua� z syren�. Pami�tam, jak Dustin po pijaku kaza� to sobie wydziarga�, mia�a mu przynie�� szcz�cie...
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_10"); //Cholerny sztorm... Do tego ca�y �adunek szlag trafi�.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_11"); //Uda�o mi si� na szcz�cie odzyska� kilka pak i skrzy�.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_12"); //Niekt�re rzeczy mog� Ci tanio odsprzeda�.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_13"); //Aha. Przyjd� do mnie, jak b�dziesz mia� chwilk�.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_14"); //B�d� mia� ma�� pro�b�. Nie po�a�ujesz.	
};

var int last_armor;

//-----------------------------------------------------------------
// Dusty abfangen
//-----------------------------------------------------------------
instance PIR_2602_Rodney_PIRARMOR_M (C_INFO)
{
	npc				= PIR_2602_Rodney;
   nr				   = 900;
	condition		= PIR_2602_Rodney_PIRARMOR_M_Condition;
	information		= PIR_2602_Rodney_PIRARMOR_M_Info;
	important		= 0;
	permanent		= 1;
   description = B_BuildBuyArmorString(NAME_PiratesArmor, value_pir_armor_m);
	//description		= "Kup zbroj� pirata (Obr. przed broni� 54, strza�ami 48, ogniem 22, koszt: 1800)";
};

FUNC int  PIR_2602_Rodney_PIRARMOR_M_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_PIR_2602_Rodney_Hello))&&(last_armor == FALSE)
	{
      return 1;
	};
};

func void  PIR_2602_Rodney_PIRARMOR_M_Info()
{
	AI_Output(other, self,"PIR_2602_Rodney_PIRARMOR_M_Info_15_01"); //Chcia�bym kupi� zbroj� pirata.
   
	if (Npc_HasItems(hero, itminugget)>=value_pir_armor_m)
	{
		last_armor = TRUE;
		AI_Output(self, other,"PIR_2602_Rodney_PIRARMOR_M_Info_08_02"); //Prosz�, lepszej zbroi tutaj nie znajdziesz!		
		CreateInvItem (hero,PIR_ARMOR_M);	
		Npc_RemoveInvItems (hero, ItMiNugget, value_pir_armor_m); 
		AI_EquipArmor(hero, PIR_ARMOR_M);
	}
	else
	{
		AI_Output(self, other,"PIR_2602_Rodney_PIRARMOR_M_Info_07_03"); //Nie masz wystarczaj�cej ilo�ci rudy, a ja nie mog� robi� tak hojnych prezent�w!
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_PIR_2602_Rodney_Junk (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 2;
	condition		= DIA_PIR_2602_Rodney_Junk_Condition;
	information		= DIA_PIR_2602_Rodney_Junk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Angus powiedzia�, �e dasz mi kilka mikstur."; 
};

FUNC INT DIA_PIR_2602_Rodney_Junk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2600_Angus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2602_Rodney_Junk_Info()
{
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Junk_15_01"); //Angus powiedzia�, �e dasz mi kilka mikstur.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Junk_08_02"); //Pewnie. Tylko nie wypij wszystkiego na raz, to drogi towar.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Junk_08_03"); //A tak w og�le... Dobrze widzie� Ci� w�r�d �ywych, Rick.
	
   CreateInvItems (self,ItFo_Potion_Health_01,2);
	B_GiveInvItems (self, other, ItFo_Potion_Health_01, 2);
	B_GiveXP(50);
	B_StopProcessInfos(self);
};

INSTANCE DIA_PIR_2602_Rodney_What (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 2;
	condition		= DIA_PIR_2602_Rodney_What_Condition;
	information		= DIA_PIR_2602_Rodney_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "M�wi�e� co� o przys�udze..."; 
};

FUNC INT DIA_PIR_2602_Rodney_What_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2602_Rodney_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2602_Rodney_What_Info()
{
	AI_Output (other, self,"DIA_PIR_2602_Rodney_What_15_01"); //M�wi�e� co� o przys�udze...
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_02"); //Tak, mam ma�� pro�b�.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_03"); //Widzisz, wi�kszo�� �adunku posz�a na dno. Ale troch� wala si� jeszcze tu i �wdzie na brzegu. 
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_04"); //Nie mam teraz czasu, �eby samemu pozbiera� to co ocala�o.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_05"); //Przynie� mi tyle paczek, ile zdo�asz.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_06"); //Szczeg�lnie interesuj� mnie paczki z ekwipunkiem, jak miecze, kusze czy �uki.
	AI_Output (other, self,"DIA_PIR_2602_Rodney_What_15_07"); //A co ja b�d� z tego mia�?
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_08"); //Moj� wdzi�czno�� oczywi�cie!
	AI_Output (other, self,"DIA_PIR_2602_Rodney_What_15_09"); //Tym si� nie najem, ani nie obroni�.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_10"); //Bez obaw, nie po�a�ujesz.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_11"); //Im wi�cej paczek przyniesiesz, tym wi�kszy dam Ci upust.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_12"); //A je�eli znajdziesz paczki z broni�, to b�dziesz m�g� sobie wybra� recept� na jaki� egzemplarz.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_13"); //Ale musisz przynie�� przynajmniej trzy paczki z or�em.
	AI_Output (other, self,"DIA_PIR_2602_Rodney_What_15_04"); //Zobacz�, co da si� zrobi�.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_15"); //Jakby co, wiesz gdzie mnie szuka�.
	
   Log_CreateTopic	(CH1_Pir_RodneyHelp, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Pir_RodneyHelp, LOG_RUNNING);
	B_LogEntry		(CH1_Pir_RodneyHelp, "Obieca�em pom�c Rodneyowi. Mam rozejrze� si� po okolicy za paczkami z �adunkiem. Do tego jak znajd� trzy paczki z or�em to Rodney pozwoli mi wybra� dla siebie recept� na jeden egzemplarz.");
	RodneyHelp=0;
	B_StopProcessInfos	(self);
};

INSTANCE DIA_PIR_2602_Rodney_Packages(C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 4;
	condition		= DIA_PIR_2602_Rodney_Packages_Condition;
	information		= DIA_PIR_2602_Rodney_Packages_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam paczki..."; 
};

FUNC INT DIA_PIR_2602_Rodney_Packages_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2602_Rodney_What))&&((NPC_HasItems(other,package1)>0)||(NPC_HasItems(other,package2)>0))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2602_Rodney_Packages_Info()
{
	var int expsum;//dont show multiple GiveXP notifications -orc
	expsum = 0;
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Packages_15_00"); //Mam paczki...
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_08_01"); //To �wietnie. Zobaczmy co tam masz...
   
	if (NPC_HasItems(other,package1)>0)
	{
		expsum += 10*Npc_HasItems(other,package1);
		
		PutMsg(ConcatStrings("Odda�e� ",ConcatStrings(IntToString(Npc_HasItems(other,package1))," paczki.")),"font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		
		//CreateInvItems		(self,	package1,	Npc_HasItems(other,package1));
		Npc_RemoveInvItems	(other,	package1,	Npc_HasItems(other,package1));
	};
   
	if (NPC_HasItems(other,package2)>0)
	{
		expsum += 25*Npc_HasItems(other,package2);
		weapon_package=weapon_package+NPC_HasItems(other,package2);
		PutMsg(ConcatStrings("Odda�e� ",ConcatStrings(IntToString(Npc_HasItems(other,package2))," paczki z broni�.")),"font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		//CreateInvItems		(self,	package2,	Npc_HasItems(other,package2));
		Npc_RemoveInvItems	(other,	package2,	Npc_HasItems(other,package2));

	};
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_08_02"); //�wietna robota.
	
	//Merged second dialog:
	if (weapon_package>=3)
	{
		expsum += 100;
		AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_08_03"); //Znalaz�e� sporo paczek z broni�, przydadz� si� na czarn� godzin�.
		AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_08_04"); //Jak powiedzia�em, w nagrod� mo�esz wybra� recept� na or�. Co potrzebujesz?
		Info_ClearChoices (DIA_PIR_2602_Rodney_Packages);
		Info_AddChoice (DIA_PIR_2602_Rodney_Packages, "Wybieram recept� na miecz.", DIA_PIR_2602_Rodney_Packages_sword);
		Info_AddChoice (DIA_PIR_2602_Rodney_Packages, "Przyda�aby mi si� recepta na �uk.", DIA_PIR_2602_Rodney_Packages_bow);
		Info_AddChoice (DIA_PIR_2602_Rodney_Packages, "Recepta na kusz� to najlepszy wyb�r.", DIA_PIR_2602_Rodney_Packages_crossbow);		
	};
   
	if(expsum)
	{
		B_GiveXP(expsum);
	};
	//B_StopProcessInfos	(self);
};
// ---------------------------sword----------------------------------------

FUNC VOID DIA_PIR_2602_Rodney_Packages_sword()
{
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Packages_sword_15_01"); //Wybieram recept� na miecz.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_sword_08_02"); //Dzi�ki tej recepcie wykujesz niez�e ostrze.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_sword_08_03"); //Niech Ci dobrze s�u�y.
	CreateInvItems (self,Recept_ItMw_1H_Sword_04,1);
	B_GiveInvItems (self, other, Recept_ItMw_1H_Sword_04, 1);
	Log_SetTopicStatus	(CH1_Pir_RodneyHelp, LOG_SUCCESS);
	B_LogEntry		(CH1_Pir_RodneyHelp, "Przynios�em Rodneyowi wszystkie paczki z broni� jakie znalaz�em na pla�y. W zamian kwatermistrz da� mi recept� na niezgorszy miecz.");
	B_StopProcessInfos	(self);
};

// ------------------------------bow-------------------------------------

FUNC VOID DIA_PIR_2602_Rodney_Packages_bow()
{
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Packages_bow_15_01"); //Przyda�aby mi si� recepta na �uk.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_bow_08_02"); //Prosz� bardzo. Dzi�ki tej recepcie stworzysz �uk, kt�ry przebije niejeden pancerz.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_bow_08_03"); //Niech ci dobrze s�u�y.
	CreateInvItems (self,Recept_ItRw_Bow_Long_02,1);
	B_GiveInvItems (self, other, Recept_ItRw_Bow_Long_02, 1);
	Log_SetTopicStatus	(CH1_Pir_RodneyHelp, LOG_SUCCESS);
	B_LogEntry		(CH1_Pir_RodneyHelp, "Przynios�em Rodneyowi wszystkie paczki z broni� jakie znalaz�em na pla�y. W zamian kwatermistrz da� mi recept� na porz�dny �uk.");
	B_StopProcessInfos	(self);
};

// ------------------------------crossbow-------------------------------------

FUNC VOID DIA_PIR_2602_Rodney_Packages_crossbow()
{
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Packages_crossbow_15_01"); //Recepta na kusz� to najlepszy wyb�r.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_crossbow_08_02"); //W rzeczy samej. Kusza, kt�r� mo�esz stworzy� przebija ci�k� zbroj� ze stu krok�w.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_crossbow_08_03"); //Niech ci dobrze s�u�y.
	CreateInvItems (self,Recept_ItRw_Crossbow_01,1);
	B_GiveInvItems (self, other, Recept_ItRw_Crossbow_01, 1);
	Log_SetTopicStatus	(CH1_Pir_RodneyHelp, LOG_SUCCESS);
	B_LogEntry		(CH1_Pir_RodneyHelp, "Przynios�em Rodneyowi wszystkie paczki z broni� jakie znalaz�em na pla�y. W zamian kwatermistrz da� mi recept� na porz�dn� kusz�.");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Rodney_KillAligator (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 10;
	condition		= DIA_Rodney_KillAligator_Condition;
	information		= DIA_Rodney_KillAligator_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak ci si� podoba ob�z?"; 
};

FUNC INT DIA_Rodney_KillAligator_Condition()
{
	if (jack_yes==TRUE)&&(!Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_KillAligator_Info()
{
	B_GiveXP(100);
	AI_Output (other, self, "DIA_Rodney_KillAligator_15_01"); //Jak ci si� podoba ob�z?
	AI_Output (self, other, "DIA_Rodney_KillAligator_11_02"); //Ujdzie. Zawsze to lepszy port ni� �aden.
	AI_Output (other, self, "DIA_Rodney_KillAligator_15_03"); //Mam problem z pewnym aligatorem...
	AI_Output (self, other, "DIA_Rodney_KillAligator_11_04"); //Prowad�, rozwi�zywanie problem�w to moja specjalno��!
	
   B_LogEntry		(CH1_Rbl_Aligator, "Rodney pomo�e mi rozwi�za� problem z aligatorem.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(PIR_2602_Rodney,"FOLLOWALLIGATOR");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Rodney_KillAligatorOut (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 11;
	condition		= DIA_Rodney_KillAligatorOut_Condition;
	information		= DIA_Rodney_KillAligatorOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Rodney_KillAligatorOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Rodney_KillAligator))&&(Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_KillAligatorOut_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(100);
	AI_Output (self, other,"DIA_Rodney_KillAligatorOut_11_01"); //Dobry aligator, to martwy aligator. Czas wraca� ogrza� dupsko przy ognisku.
	AI_Output (other, self,"DIA_Rodney_KillAligatorOut_15_02"); //Uwa�aj na siebie.
   
	B_LogEntry		(CH1_Rbl_Aligator, "Rodney pom�g� mi przy zabiciu aligatora.");
   B_StopProcessInfos	(self);
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine	(PIR_2602_Rodney,"INHC");
};

// /************************

// Po ataku na ork�w przy que�cie z Carlsonem
// ************************/

// INSTANCE DIA_Rodney_KillOrc (C_INFO)
// {
// 	npc				= PIR_2602_Rodney;
// 	nr				= 12;
// 	condition		= DIA_Rodney_KillOrc_Condition;
// 	information		= DIA_Rodney_KillOrc_Info;
// 	permanent		= 0;
// 	important		= 1;
// 	description		= "..."; 
// };

// FUNC INT DIA_Rodney_KillOrc_Condition()
// {

// 	if (orc_appear == TRUE)&&(Npc_IsDead(Orc1))&&(Npc_IsDead(Orc2))&&(Npc_IsDead(Orc3))&&(Npc_IsDead(Orc4))
// 	{
// 		return 1;
// 	};
// 		
// };

// FUNC VOID DIA_Rodney_KillOrc_Info()
// {
// 	B_FullStop (hero);
// 	AI_GotoNpc(self,other);
// 	B_GiveXP(100);
// 	AI_Output (self, other,"DIA_Rodney_KillOrc_11_01"); //Dobry ork, to martwy ork.
// 	AI_Output (other, self,"DIA_Rodney_KillOrc_15_02"); //Dzi�ki za pomoc przyjacielu.
// 	Npc_SetAivar(self,AIV_PARTYMEMBER,  FALSE);
// 	Npc_ExchangeRoutine	(self,"RBL_CAMP");
// 	B_StopProcessInfos	(self);
// };

INSTANCE DIA_Rodney_KillPatrol (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 13;
	condition		= DIA_Rodney_KillPatrol_Condition;
	information		= DIA_Rodney_KillPatrol_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrzebuj� pomocy."; 
};

FUNC INT DIA_Rodney_KillPatrol_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Quest1))&&(!Npc_KnowsInfo (hero, DIA_Duke_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_KillPatrol_Info()
{
	AI_Output (other, self,"DIA_Rodney_KillPatrol_15_01"); //Potrzebuj� pomocy.
	
   if (!Npc_KnowsInfo (hero, DIA_Angus_Patrol))
	{
		AI_Output (self, other,"DIA_Rodney_KillPatrol_11_02"); //Mo�esz na mnie liczy�. Tylko powiedz Angusowi o co chodzi.
		AI_Output (other, self,"DIA_Rodney_KillPatrol_15_03"); //Dobrze.
		B_LogEntry		(CH2_RBL_GuardCamp, "Rodney pomo�e mi - powinienem te� porozmawia� z Angusem.");
	}
	else
	{
		AI_Output (self, other,"DIA_Hank_KillPatrol_11_04"); //Nie ma sprawy.
	};
   
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_PIR_2602_Rodney_Stew (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 12;
	condition		= DIA_PIR_2602_Rodney_Stew_Condition;
	information		= DIA_PIR_2602_Rodney_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gulasz z pozdrowieniami od Snafa."; 
};

FUNC INT DIA_PIR_2602_Rodney_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2602_Rodney_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_PIR_2602_Rodney_Stew_15_01"); //Gulasz z pozdrowieniami od Snafa.
	AI_Output (self, other, "DIA_PIR_2602_Rodney_Stew_11_02"); //Pachnie dziwnie, ale nie b�d� wybrzydza�.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Rodney przyj�� gulasz Snafa."); 
};

/************************
Chapter 3
************************/
var int rodn_mag_frst;

INSTANCE DIA_Rodney_Help (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 14;
	condition		= DIA_Rodney_Help_Condition;
	information		= DIA_Rodney_Help_Info;
	permanent		= 1;
	important		= 0;
	description		= "Podobno masz jaki� problem."; 
};

FUNC INT DIA_Rodney_Help_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_MEETING1))&&(!Hero_GotoGYD)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_Help_Info()
{
	//Przed ork. cmentarzyskiem wieza mgie�
	AI_Output (other, self,"DIA_Rodney_Help_15_01"); //Podobno masz jaki� problem.
	AI_Output (self, other,"DIA_Rodney_Help_11_02"); //I to spory.
	AI_Output (other, self,"DIA_Rodney_Help_15_03"); //M�w co si� sta�o, mo�e b�d� m�g� pom�c.
	AI_Output (self, other,"DIA_Rodney_Help_11_04"); //To troch�... kr�puj�ca sytuacja, ale Tobie powiem. W ko�cu znamy si� tyle lat.
	AI_Output (self, other,"DIA_Rodney_Help_11_05"); //Chc� zosta� magiem!
	AI_Output (other, self,"DIA_Rodney_Help_15_06"); //Ty?!
	AI_Output (self, other,"DIA_Rodney_Help_11_07"); //Nie patrz tak na mnie. Zawsze o tym marzy�em... Nie zosta�em piratem z wyboru.
	AI_Output (self, other,"DIA_Rodney_Help_11_08"); //Zreszt� niewa�ne...
	AI_Output (other, self,"DIA_Rodney_Help_15_09"); //Nie, nie! M�w dalej. Ka�dy ma prawo by marzy�, przyjacielu.
	AI_Output (self, other,"DIA_Rodney_Help_11_10"); //Ciesz� si�, �e tak uwa�asz. Tylko na razie... Nie m�w o tym ch�opakom. Hank nie da�by mi �y�.
	AI_Output (other, self,"DIA_Rodney_Help_15_11"); //W porz�dku.
	AI_Output (self, other,"DIA_Rodney_Help_11_12"); //Rozmawia�em ju� z Miltenem i Lerenem. Zrobi�em kilka prostych zada� i dosta�em powa�niejsze zlecenie.
	AI_Output (self, other,"DIA_Rodney_Help_11_13"); //Leren odkry�, �e w podziemiach Klasztoru Zmiennokszta�tnych pogrzebano jaki� pot�ny artefakt.
	AI_Output (self, other,"DIA_Rodney_Help_11_14"); //Jednak klucz do podziemi znajduje si� w jakiej� orkowej cytadeli.
	AI_Output (self, other,"DIA_Rodney_Help_11_15"); //Pomijaj�c to, �e nie mam poj�cia, gdzie mo�na znale�� te ruiny to wiesz, �e ja nigdy nie nale�a�em do najodwa�niejszych.
	AI_Output (self, other,"DIA_Rodney_Help_11_16"); //Nie mam zamiaru ryzykowa� �ycia nawet za cen� spe�nienia marze�.
	AI_Output (other, self,"DIA_Rodney_Help_15_17"); //Rozumiem. Czyli szukasz idioty, kt�ry znajdzie Cytadel�, nie da si� zabi� orkom i odnajdzie klucz?
	AI_Output (self, other,"DIA_Rodney_Help_11_18"); //Gdybym szuka� idioty, to nie rozmawia�bym z Tob�. Masz wyj�tkowe zdolno�ci, zawsze spadasz na cztery �apy i wychodzisz ca�o z najgorszych opresji. To rzadka przywara...
	AI_Output (self, other,"DIA_Rodney_Help_11_19"); //To jak, pomo�esz mi?

	Info_ClearChoices (DIA_Rodney_Help);
	Info_AddChoice (DIA_Rodney_Help, "Nigdy nie opuszczam przyjaci� w biedzie.", DIA_Rodney_Help_Yes);
	Info_AddChoice (DIA_Rodney_Help, "Musz� si� zastanowi�.", DIA_Rodney_Help_No);
};
// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Rodney_Help_Yes()
{
	DIA_Rodney_Help.permanent = 0;
	Hero_GotoGYD = TRUE;
	AI_Output (other, self,"DIA_Rodney_Help_Yes_15_01"); //Nigdy nie opuszczam przyjaci� w biedzie.
	AI_Output (self, other,"DIA_Rodney_Help_Yes_11_02"); //Wiedzia�em, �e jednak si� skusisz. To dla mnie wiele znaczy, Rick.
	AI_Output (other, self,"DIA_Rodney_Help_Yes_15_03"); //Od czego mam zacz��?
	AI_Output (self, other,"DIA_Rodney_Help_Yes_11_04"); //Wiem tylko to co Ci powiedzia�em. Odpowied� znajdziesz w Orkowej Cytadeli.
	AI_Output (other, self,"DIA_Rodney_Help_Yes_15_05"); //Pewnie nied�ugo tego po�a�uj�... 
	Log_CreateTopic	(CH3_RBL_RodneyHelp, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_RodneyHelp, LOG_RUNNING);
	B_LogEntry		(CH3_RBL_RodneyHelp, "Obieca�em pom�c Rodneyowi. Stary pirat od zawsze chcia� zosta� magiem, a teraz pojawi�a si� taka mo�liwo��. Jednak zadanie inicjuj�ce go przerasta i poprosi� mnie o pomoc. Musz� odnale�� spos�b na to, aby dosta� si� do podziemi Klasztoru Zmiennokszta�tnych. Niestety poszukiwania musz� rozpocz�� od odnalezienie Orkowej Cytadeli.");
	B_StopProcessInfos	(self);
	
	/***************
		Ork o wp pami�taj dla tego orka
		***************/
	//Wld_InsertNpc	(Roderic,"OW_FOGTOWER_TOP");
	Wld_InsertNpc	(Nameless_ThirdMeet,"OR1");
};

// ---------------------------No----------------------------------------

FUNC VOID DIA_Rodney_Help_No()
{
	AI_Output (other, self,"DIA_Rodney_Help_No_15_01"); //Musz� si� zastanowi�.
	AI_Output (self, other,"DIA_Rodney_Help_No_11_02"); //Rozumiem, wiem, �e o wiele prosz�. Daj zna� gdyby� zmieni� zdanie.
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Rodney_Help2 (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 14;
	condition		= DIA_Rodney_Help2_Condition;
	information		= DIA_Rodney_Help2_Info;
	permanent		= 1;
	important		= 0;
	description		= "To trudna decyzja."; 
};

FUNC INT DIA_Rodney_Help2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Rodney_Help))&&(!Hero_GotoGYD)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_Help2_Info()
{
	AI_Output (other, self,"DIA_Rodney_Help_15_19"); //To trudna decyzja.
	AI_Output (self, other,"DIA_Rodney_Help_11_20"); //Wi�c?
	Info_ClearChoices (DIA_Rodney_Help2);
	Info_AddChoice (DIA_Rodney_Help2, "Nigdy nie opuszczam przyjaci� w biedzie.", DIA_Rodney_Help_Yes);
	Info_AddChoice (DIA_Rodney_Help2, "Musz� si� zastanowi�.", DIA_Rodney_Help_No);
};

INSTANCE DIA_Rodney_OldNote (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 314;
	condition		= DIA_Rodney_OldNote_Condition;
	information		= DIA_Rodney_OldNote_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz�em Orkow� Cytadel�."; 
};

FUNC INT DIA_Rodney_OldNote_Condition()
{
	if (Hero_GotoGYD)&&(NPC_HasItems(other,ork_oldnote)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_OldNote_Info()
{
	AI_Output (other, self,"DIA_Rodney_OldNote_15_01"); //Znalaz�em Orkow� Cytadel�.
	AI_Output (self, other,"DIA_Rodney_OldNote_11_02"); //Wiedzia�em, �e dasz sobie rad�. Wpad�o Ci w r�ce co� ciekawego?
	AI_Output (other, self,"DIA_Rodney_OldNote_15_03"); //Troch� �elastwa i rozsypuj�cy si� pergamin, napisany w dziwnym j�zyku.
	AI_Output (self, other,"DIA_Rodney_OldNote_11_04"); //Ja Ci z tym nie pomog�, poka� papier Lerenowi, mam nadziej�, �e to mnie zbli�y do wst�pienia w szeregi mag�w.
	AI_Output (other, self,"DIA_Rodney_OldNote_15_05"); //Dzi�ki, �e zapyta�e� czy nie rzuci�a si� na mnie horda krwio�erczych ork�w.
	AI_Output (self, other,"DIA_Rodney_OldNote_11_06"); //Wybacz. Czuj�, �e dzi�ki Tobie to b�dzie tylko formalno��.
	AI_Output (other, self,"DIA_Rodney_OldNote_15_07"); //Masz szcz�cie Rodney, �e ci� lubi�. Inaczej sam by� bawi� si� w kotka i myszk� z orkami.
	AI_Output (other, self,"DIA_Rodney_OldNote_15_08"); //Id� pogada� z Lerenem. Mam nadziej�, �e ten pergamin jest co� wart.
	B_LogEntry		(CH3_RBL_RodneyHelp, "Musz� zanie�� pergamin Lerenowi, mam nadziej�, �e mag potrafi go odczyta�.");
};

//****************************

var int rod_wait;

INSTANCE DIA_Rodney_Ghost (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 15;
	condition		= DIA_Rodney_Ghost_Condition;
	information		= DIA_Rodney_Ghost_Info;
	permanent		= 0;
	important		= 0;
	description		= "By�em na cmentarzu ork�w."; 
};

FUNC INT DIA_Rodney_Ghost_Condition()
{
	if (Npc_KnowsInfo (hero, Info_OrcGhost_Kill))&&(!Npc_KnowsInfo (hero, DIA_RodericMD_Thx))
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_Ghost_Info()
{
	B_GiveXP(500);
	AI_Output (other, self,"DIA_Rodney_Ghost_15_01"); //By�em na cmentarzu ork�w.
	AI_Output (self, other,"DIA_Rodney_Ghost_11_02"); //I co tam znalaz�e�?
	AI_Output (other, self,"DIA_Rodney_Ghost_15_03"); //Martwego orka, kt�ry sporo gada�.
	AI_Output (other, self,"DIA_Rodney_Ghost_15_04"); //Dowiedzia�em si� tylko tego, �e kiedy� jaki� cz�owiek zdoby� zaufanie ork�w, a potem ich zdradzi�.
	AI_Output (other, self,"DIA_Rodney_Ghost_15_05"); //Zdaje si�, �e jego jedynym celem by�o posi��� tajemnice, jakie skrywaj� podziemia klasztoru.
	AI_Output (other, self,"DIA_Rodney_Ghost_15_06"); //Niestety dopi�� swego. Wi�cej si� nie dowiedzia�em.
	AI_Output (self, other,"DIA_Rodney_Ghost_11_07"); //Hmm, zagmatwane to wszystko. To na co czekasz? Szukaj dalej!
	AI_Output (other, self,"DIA_Rodney_Ghost_15_08"); //Chyba troch� Ci� ponios�o!
	AI_Output (self, other,"DIA_Rodney_Ghost_11_09"); //Wybacz. Prosz�, dowiedz si� czego� wi�cej.
	B_LogEntry		(CH3_RBL_RodneyHelp, "Powiedzia�em o wszystkim Rodneyowi. Teraz musz� czeka� na to co powiedz� magowie. Mam si� spotka� z Rodneyem jutro.");
	Hero_GotoGYD = 3;//end of mission
};

// INSTANCE DIA_Rodney_GhostAfter (C_INFO)
// {
// 	npc				= PIR_2602_Rodney;
// 	nr				= 16;
// 	condition		= DIA_Rodney_GhostAfter_Condition;
// 	information		= DIA_Rodney_GhostAfter_Info;
// 	permanent		= 0;
// 	important		= 1;
// 	description		= "."; 
// };

// FUNC INT DIA_Rodney_GhostAfter_Condition()
// {

// 	if (Npc_KnowsInfo (hero, DIA_Rodney_Ghost))&&(rod_wait <= (Wld_GetDay()))
// 	{
// 		return 1;
// 	};
// 		
// };

// FUNC VOID DIA_Rodney_GhostAfter_Info()
// {
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_01"); //Dobrze, �e jeste�.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_02"); //Powiedzia�em Lerenowi, co niby znalaz�em na cmentarzysku. 
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_03"); //Ten gnojek pokiwa� g�ow� i mrukn��, �e tego si� spodziewa�.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_04"); //Powiedzia�, �e musz� szuka� odpowiedzi w�r�d umar�ych.
// 	AI_Output (other, self,"DIA_Rodney_GhostAfter_15_05"); //To �wietnie, �ycz� powodzenia.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_06"); //Nie r�b mi tego, bez Ciebie nigdy nie zostan� magiem!
// 	AI_Output (other, self,"DIA_Rodney_GhostAfter_15_07"); //Dobra, ju� dobra, �artowa�em. M�w czego si� jeszcze dowiedzia�e�.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_08"); //Milten twierdzi, �e widzia� kiedy� po zmierzchu zjaw� w okolicach klasztoru.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_09"); //Leren uzna�, �e to mo�e by� kolejna wskaz�wka.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_10"); //Mam ruszy� noc� do twierdzy i... porozmawia� z tym duchem.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_11"); //Ale znasz mnie...
// 	AI_Output (other, self,"DIA_Rodney_GhostAfter_15_12"); //W porz�dku. Duch�w boj� si� mniej ni� �miertelnik�w. A jak trzeba to umarlaki te� da si� zabi�.
// 	AI_Output (other, self,"DIA_Rodney_GhostAfter_15_13"); //P�jd� do klasztoru i poszukam tej zjawy.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_14"); //Odwdzi�cz� Ci si�, mo�esz by� tego pewien.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_15"); //Aha i pami�taj, �eby szuka� tego ducha po zmroku.
// 	B_LogEntry		(CH3_RBL_RodneyHelp, "Kolejna wskaz�wka ma na mnie czeka� noc� w okolicach klasztoru. Czeka mnie kolejna rozmowa z duchem.");
//
// };

INSTANCE DIA_Rodney_Sword (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 17;
	condition		= DIA_Rodney_Sword_Condition;
	information		= DIA_Rodney_Sword_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ostatni raz co� dla Ciebie zrobi�em!"; 
};

FUNC INT DIA_Rodney_Sword_Condition()
{
	var C_NPC urk; urk = Hlp_GetNpc(NON_4072_Urksh);

	/**************************
	Ork sprawd� czy dobra instancja miecza
	****************************/

	if (NPC_HasItems(other,ItMw_2H_RuneSWD_01)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_Sword_Info()
{
	var int xp;
	xp = 0;
   
	if (!Npc_KnowsInfo (hero, DIA_RodericMD_Thx))
	{
		xp = 1000;
	};
   
	xp += 500;
	B_GiveXP(xp);
	
	AI_Output (other, self,"DIA_Rodney_Sword_15_01"); //Ostatni raz co� dla Ciebie zrobi�em!
	AI_Output (self, other,"DIA_Rodney_Sword_11_02"); //Najwa�niejsze, �e �yjesz przyjacielu.
	AI_Output (other, self,"DIA_Rodney_Sword_15_03"); //Tak, pewnie. Widz�, �e a� si� trz�siesz, �eby zapyta� jak mi posz�o.
	AI_Output (self, other,"DIA_Rodney_Sword_11_04"); //Niech mnie szlag! Pewnie, �e chc� wiedzie�. By�e� w tych podziemiach?
	AI_Output (other, self,"DIA_Rodney_Sword_15_05"); //By�em.
	AI_Output (self, other,"DIA_Rodney_Sword_11_06"); //Znalaz�e� artefakt?!
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other,"DIA_Rodney_Sword_11_07"); //Daj mi go!
	AI_Output (other, self,"DIA_Rodney_Sword_15_08"); //Raczej... Nie. Zbyt wiele wysi�ku kosztowa�o mnie zdobycie tego �elastwa.
	AI_Output (other, self,"DIA_Rodney_Sword_15_09"); //Dla Ciebie to tylko artefakt, dzi�ki kt�remu przypodobasz si� facetom w kieckach i z wybuja�ym ego.
 	AI_Output (other, self,"DIA_Rodney_Sword_15_10"); //Dla mnie to nagroda, dzi�ki kt�rej zachowam pami�� o... m�stwie i po�wi�ceniu godnym lepszych czas�w.
	AI_Output (other, self,"DIA_Rodney_Sword_15_11"); //Niewa�ne. Miecza nie oddam nikomu, przynajmniej nie po dobroci.
	AI_Output (self, other,"DIA_Rodney_Sword_11_12"); //Wybacz mi. Ponios�o mnie... Tak bardzo chc� zosta� magiem... Za�lepi� mnie egoizm.
	AI_Output (other, self,"DIA_Rodney_Sword_15_13"); //W porz�dku Rodney. Pogadam z Lerenem, powiem, �e tylko pomog�em Ci zdoby� artefakt.
	AI_Output (other, self,"DIA_Rodney_Sword_15_14"); //Przekonam mag�w, �eby uznali Twoj� inicjacj� za dope�nion�.
	AI_Output (self, other,"DIA_Rodney_Sword_11_15"); //B�d� Ci wdzi�czny, Rick!
	B_LogEntry		(CH3_RBL_RodneyHelp, "Musz� pokaza� miecz Lerenowi i przekona� mag�w, �e Rodney zas�u�y� na to, aby wst�pi� w ich szeregi.");
};

INSTANCE DIA_Rodney_BeginMag (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 18;
	condition		= DIA_Rodney_BeginMag_Condition;
	information		= DIA_Rodney_BeginMag_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dobre wie�ci!"; 
};

FUNC INT DIA_Rodney_BeginMag_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_Rodney))&&(rodney_mag == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_BeginMag_Info()
{
	B_GiveXP(1500);

	AI_Output (other, self,"DIA_Rodney_BeginMag_15_01"); //Mam dobre wie�ci!
	AI_Output (self, other,"DIA_Rodney_BeginMag_11_02"); //M�w!
	AI_Output (other, self,"DIA_Rodney_BeginMag_15_03"); //Leren zaakceptowa� Twoj� inicjacj�...
	AI_Output (self, other,"DIA_Rodney_BeginMag_11_04"); //Na Adanosa, to najwspanialszy dzie� w moim �yciu! Lepiej czu�em si� tylko wtedy, kiedy przeci�gn�li�my pod kilem gubernatora Verony.
	AI_Output (other, self,"DIA_Rodney_BeginMag_15_05"); //Id� do Lerena po kieck� i run�.
	AI_Output (self, other,"DIA_Rodney_BeginMag_11_06"); //Nie dam mu czeka�! A to si� Hank zdziwi...

	Log_SetTopicStatus	(CH3_RBL_RodneyHelp, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_RodneyHelp, "Rodney w ko�cu zosta� magiem! To mnie nauczy�o, �e bezinteresowna pomoc jednak czasami pop�aca.");

	/*******************
	Ork chodzi o to, �eby rodney polaz� do Lerena, przebra� si� w szat�, dosta� run�, zmieni� fai, etc. Zr�b to inaczej jak chcesz jak to moje nie jest za dobre
	*******************/

	RodneyMage_Day = B_SetDayTolerance();
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"BeingMage");
	B_ExchangeRoutine(leren,"RodneyMage");

	//TODO IN RODNEY SCRIPT
	// 	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,2);			
	// 	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  2);
	// 	fight_tactic = FAI_HUMAN_MAGE;
};


INSTANCE DIA_Rodney_BecomeMagEnd (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 19;
	condition		= DIA_Rodney_BecomeMagEnd_Condition;
	information		= DIA_Rodney_BecomeMagEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Rodney_BecomeMagEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Rodney_BeginMag))&&(Npc_GetDistToNpc(self,hero) < 600)&&(RodneyMage_Day==1024)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_BecomeMagEnd_Info()
{
	others_help = others_help + 1;
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
	AI_Output (self, other,"DIA_Rodney_BecomeMagEnd_11_01"); //Wybacz Rick. Zapomnia�em Ci podzi�kowa�... 
	AI_Output (other, self,"DIA_Rodney_BecomeMagEnd_15_02"); //Nie szkodzi przyjacielu. Mnie ta przygoda te� wiele nauczy�a. To mi wystarczy za podzi�kowania.
	AI_Output (self, other,"DIA_Rodney_BecomeMagEnd_11_03"); //No i miecz, he, he.
	AI_Output (other, self,"DIA_Rodney_BecomeMagEnd_15_04"); //Masz racj�. Uwa�aj na siebie... magu.
	AI_Output (self, other,"DIA_Rodney_BecomeMagEnd_11_05"); //Zawsze uwa�a�em, �e by�by� najlepszym kandydatem na nowego kapitana, gdyby Ramos wykorkowa�.
	AI_Output (other, self,"DIA_Rodney_BecomeMagEnd_15_06"); //Hmm, dzi�ki Rodney. Bywaj.
};
