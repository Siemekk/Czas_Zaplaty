
// **************************************************
//						 EXIT
// **************************************************

instance  Stt_2503_Ramon_Exit (C_INFO)
{
	npc			= Stt_2503_Ramon;
	nr			= 999;
	condition	= Stt_2503_Ramon_Exit_Condition;
	information	= Stt_2503_Ramon_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC int  Stt_2503_Ramon_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_2503_Ramon_Exit_Info()
{
	B_StopProcessInfos	(self);
};

// **************************************************
//					Rozdzia�: 3
//					Misja:  Fanatyk bi�uterii
// QUESTID 553
// **************************************************
instance  Stt_2503_Ramon_Chest_Quest (C_INFO)
{
	npc			= Stt_2503_Ramon;
	nr			= 1;
	condition	= Stt_2503_Ramon_Chest_Quest_Condition;
	information	= Stt_2503_Ramon_Chest_Quest_Info;
	permanent	= 0;
	description = "Ten amulet jest na zbyciu?";
};

FUNC int  Stt_2503_Ramon_Chest_Quest_Condition()
{
	if (GetTheRamonAmulet == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Stt_2503_Ramon_Chest_Quest_Info()
{
	AI_Output (other, self,"Stt_2503_Ramon_Chest_Quest_11_00"); //Ten amulet jest na zbyciu?
	AI_Output (self, other,"Stt_2503_Ramon_Chest_Quest_11_01"); //Interesuje Ci� bi�uteria? To niespotykane w tej zapchlonej dziurze.
	AI_Output (self, other,"Stt_2503_Ramon_Chest_Quest_11_02"); //Dostaniesz go, ale nie za darmo.
	AI_Output (self, other,"Stt_2503_Ramon_Chest_Quest_11_03"); //Kto� zrobi� sobie ze mnie �arty i porozrzuca� po ca�ej jaskini moje skrzynie z... niewa�ne z czym. Przynie� mi je.
	AI_Output (other, self,"Stt_2503_Ramon_Chest_Quest_11_04"); //Jak mam je znale��, skoro nie wiem co w nich jest?
	AI_Output (self, other,"Stt_2503_Ramon_Chest_Quest_11_05"); //S� podpisane moim imieniem. Wi�kszo�� ju� znalaz�em. Pozosta�y tylko cztery skrzynki.

	B_LogEntry(KeretselLookingForRamonAmulet, "Ramon odda mi amulet, je�li przynios� mu cztery skrzynie podpisane jego imieniem. Porozrzucane s� po jaskini mieszkalnej.");
	
	//uk�adamy 4 skrzynie w wybranych waypointach.. nazwa skrzy�: RamonChests
};
/******************************************************************************************/
instance  Stt_2503_Ramon_Have_All_Chests (C_INFO)
{
	npc			= Stt_2503_Ramon;
	nr			= 2;
	condition	= Stt_2503_Ramon_Have_All_Chests_Condition;
	information	= Stt_2503_Ramon_Have_All_Chests_Info;
	permanent	= 0;
	description = "Znalaz�em wszystkie Twoje skrzynie.";
};

FUNC int  Stt_2503_Ramon_Have_All_Chests_Condition()
{
	if ((Npc_HasItems(other,RamonChests)>=4) && (Npc_KnowsInfo(hero, Stt_2503_Ramon_Chest_Quest)))
	{
		return 1;
	};
};

FUNC VOID  Stt_2503_Ramon_Have_All_Chests_Info()
{
	AI_Output (other, self,"Stt_2503_Ramon_Have_All_Chests_11_00"); //Znalaz�em wszystkie Twoje skrzynie.
	AI_Output (self, other,"Stt_2503_Ramon_Have_All_Chests_11_01"); //Dawaj je tu.
	
	B_GiveInvItems(self,hero,RamonChests,4);
	
	AI_Output (self, other,"Stt_2503_Ramon_Have_All_Chests_11_02"); //Tak, to te. Co Ty w ko�cu chcia�e�?
	AI_Output (other, self,"Stt_2503_Ramon_Have_All_Chests_11_03"); //Amulet.
	AI_Output (self, other,"Stt_2503_Ramon_Have_All_Chests_11_04"); //Racja, racja. Wy�wiadczy�e� mi przys�ug�. Je�li chcesz to prosz�, bierz. Ale nie za darmo.
	AI_Output (other, self,"Stt_2503_Ramon_Have_All_Chests_11_05"); //To za ile?
	
	//ORC: Zdefiniu ile rudy ma ��da� 
	AI_Output (self, other,"Stt_2503_Ramon_Have_All_Chests_11_06"); //Marne 100 bry�ek rudy. 

	B_LogEntry(KeretselLookingForRamonAmulet, "Zanios�em skrzynie Ramonowi. Odda mi on amulet, je�li przynios� mu jeszcze 100 bry�ek rudy.");
};
/******************************************************************************************/
instance  Stt_2503_Ramon_Give_Payment_For_Amulet (C_INFO)
{
	npc			= Stt_2503_Ramon;
	nr			= 3;
	condition	= Stt_2503_Ramon_Give_Payment_For_Amulet_Condition;
	information	= Stt_2503_Ramon_Give_Payment_For_Amulet_Info;
	permanent	= 0;
	description = "Oto ruda.";
};

FUNC int  Stt_2503_Ramon_Give_Payment_For_Amulet_Condition()
{
	if (Npc_KnowsInfo(hero, Stt_2503_Ramon_Have_All_Chests))
	{
		return 1;
	};
};

FUNC VOID  Stt_2503_Ramon_Give_Payment_For_Amulet_Info()
{
	AI_Output (other, self,"Stt_2503_Ramon_Give_Payment_For_Amulet_11_00"); //Oto ruda.
	
	if (Npc_HasItems(other,ItMiNugget)>=100)
	{
		B_GiveInvItems(other, self, ItMiNugget, 100);
		B_GiveInvItems(self,other,RamonAmulet,1);
	
		AI_Output (self, other,"Stt_2503_Ramon_Give_Payment_For_Amulet_11_01"); //No i widzisz? Pomog�e� mi, teraz ja pomog� Tobie.
	
		B_LogEntry(KeretselLookingForRamonAmulet, "Ramon odda� mi sw�j amulet. Mog� teraz zanie�� go Keretselowi");
	}
	else
	{
		AI_Output(self,other,"Grd_2502_Witten_Final_Talk_About_Ring_Info_11_02"); //Chcesz mnie wyrolowa�!? To nie jest 100 bry�ek rudy! Wr�� gdy je zdob�dziesz!
	};	
}; 
