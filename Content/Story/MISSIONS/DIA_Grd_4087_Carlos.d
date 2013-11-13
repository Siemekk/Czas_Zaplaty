// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Carlos_Exit (C_INFO)
{
	npc			= Grd_4087_Carlos;
	nr			= 999;
	condition	= DIA_Carlos_Exit_Condition;
	information	= DIA_Carlos_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Carlos_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Carlos_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					
// **************************************************

INSTANCE DIA_Carlos_First (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 1;
	condition		= DIA_Carlos_First_Condition;
	information		= DIA_Carlos_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_First_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other, "DIA_Carlos_First_11_01"); //Czego tu szukasz?
	AI_Output (other, self, "DIA_Carlos_First_15_02"); //Chcia�em si� rozejrze�. Ta okolica to...
	AI_Output (self, other, "DIA_Carlos_First_11_03"); //Na twoim miejscu poszuka�bym sobie innych zainteresowa�, ni� szwendanie si� tam, gdzie kto� mo�e skr�ci� Ci� o g�ow�.
	AI_Output (self, other, "DIA_Carlos_First_11_04"); //Zmiataj st�d.

	/*************************
Ork Carlos stoi przed bram� na pola ry�owe, daj wi�� wp gdzie dick b�dzie wraca�.

*************************/

	B_StopProcessInfos(self);
	AI_GotoWP(hero, "H_GOOUT");
};

INSTANCE DIA_Carlos_First1 (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 1;
	condition		= DIA_Carlos_First1_Condition;
	information		= DIA_Carlos_First1_Info;
	permanent		= 1;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_First1_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(Npc_KnowsInfo(hero,DIA_Carlos_First))&&(!Npc_KnowsInfo(hero,DIA_RATFORD_Raport))
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_First1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Carlos_First1_11_04"); //Wynocha!

	B_StopProcessInfos(self);
	AI_GotoWP(hero, "H_GOOUT");
};

// **************************************************

INSTANCE DIA_Carlos_Again (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 2;
	condition		= DIA_Carlos_Again_Condition;
	information		= DIA_Carlos_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Again_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Carlos_First))&&(Npc_GetDistToNpc(self,hero) < 400)&&(Npc_KnowsInfo(hero,DIA_RATFORD_Raport))
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Again_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other, "DIA_Carlos_Again_11_01"); //Widz�, �e musz� Ci r�cznie wyt�umaczy�, �e to nie miejsca dla takich jak Ty.
	AI_Output (other, self, "DIA_Carlos_Again_15_02"); //Zaczekaj! Chc� tylko wej�� do obozu i troch� si� rozejrze� - nic wi�cej.
	AI_Output (self, other, "DIA_Carlos_Again_11_03"); //A co ja z tego b�d� mia�?
	AI_Output (other, self, "DIA_Carlos_Again_15_04"); //Mam troch� rudy...
	AI_Output (self, other, "DIA_Carlos_Again_11_05"); //500 bry�ek - nie mniej, cho� mo�e by� wi�cej. Wr��, jak b�dziesz got�w je wyda�.

	B_StopProcessInfos(self);
	AI_GotoWP(hero, "H_GOOUT");

	Log_CreateTopic(CH3_Grd_Bribe, LOG_MISSION);
	Log_SetTopicStatus(CH3_Grd_Bribe, LOG_RUNNING);
	B_LogEntry(CH3_Grd_Bribe, "Carlos, stra�nik przy bramie na Pola Ry�owe, z kt�rych dostan� si� do Nowego Obozu, wpu�ci mnie pod jednym warunkiem - musz� zasili� jego fundusz emerytalny. Chce 500 bry�ek rudy.");
};

// **************************************************

var int carlos_bribe;

INSTANCE DIA_Carlos_Bribe (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 3;
	condition		= DIA_Carlos_Bribe_Condition;
	information		= DIA_Carlos_Bribe_Info;
	permanent		= 1;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Bribe_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Carlos_Again))&&(Npc_GetDistToNpc(self,hero) < 1000)&&(carlos_bribe == 0)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Bribe_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Carlos_Bribe_11_01"); //Masz rud�?
	
   if (NPC_HasItems(other,ItMiNugget)>=500)
	{
		carlos_bribe = 1;
		B_GiveInvItems (other, self, ItMiNugget, 500);
      
		AI_Output (other, self, "DIA_Carlos_Bribe_15_02"); //Mam. To twoje 500 bry�ek.
		
      AI_PlayAni ( self, "T_SEARCH");
		AI_TurnToNpc (self, other);
		
      AI_Output (self, other, "DIA_Carlos_Bribe_11_03"); //Dobra, w�a�. Ale jakby co to si� nie znamy.
		
      Log_SetTopicStatus(CH3_Grd_Bribe, LOG_SUCCESS);
		B_LogEntry(CH3_Grd_Bribe, "Przekupi�em Carlosa, stra�nika przy bramie na Pola Ry�owe. W ko�cu b�d� m�g� si� rozejrze� w sytuacji w Nowym Obozie.");
		B_StopProcessInfos(self);
	}
	else
	{
		AI_Output (other, self, "DIA_Carlos_Bribe_15_04"); //Mo�e...
		AI_Output (self, other, "DIA_Carlos_Bribe_11_05"); //Spadaj! Wr�� z rud�.
		
      B_StopProcessInfos(self);
		AI_GotoWP(hero, "H_GOOUT");
	};
};

// **************************************************

INSTANCE DIA_Carlos_Surprise (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 4;
	condition		= DIA_Carlos_Surprise_Condition;
	information		= DIA_Carlos_Surprise_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Surprise_Condition()
{
	if (grd_NC_pass)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Surprise_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Carlos_Surprise_11_01"); //No prosz�. Kogo to ja widz�?
	AI_Output (other, self, "DIA_Carlos_Surprise_15_02"); //Tylko nie m�w, �e znowu musz� zap�aci�!
	AI_Output (self, other, "DIA_Carlos_Surprise_11_03"); //Tym razem niech b�dzie na m�j koszt, przyjacielu.
	AI_Output (self, other, "DIA_Carlos_Surprise_11_04"); //Mo�e oprowadzi� Ci� po obozie?
	AI_Output (other, self, "DIA_Carlos_Surprise_15_05"); //Czemu nie. Jestem tu pierwszy raz.
	AI_Output (self, other, "DIA_Carlos_Surprise_11_06"); //�wietnie. Chod� za mn�.

	/*********************
Dick razem z Carlosem wchodz� na tam�
**********************/
   
   AI_SetWalkmode (self,NPC_RUN); 
	AI_GotoWP(self, "NC_DAM");
	AI_GotoWP(other, "NC_DAM2");
   
   B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Carlos_Dam (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 5;
	condition		= DIA_Carlos_Dam_Condition;
	information		= DIA_Carlos_Dam_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Dam_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Carlos_Surprise))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Dam_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Carlos_Dam_11_01"); //To nasza cholerna tama. Homer zbudowa� to ustrojstwo jaki� czas temu.
	AI_Output (other, self, "DIA_Carlos_Dam_15_02"); //I co si� z nim sta�o?
	AI_Output (self, other, "DIA_Carlos_Dam_11_03"); //Za zas�ugi wyl�dowa� w kopalni, he, he.
	AI_Output (self, other, "DIA_Carlos_Dam_11_04"); //Chod�my dalej.

	/****************************
Ork przyda�oby si� albo wsadzi� ze 2-3 stra�nik�w tam gdzie Cord uczy� walki mieczem i tam nas zaprowadzi Carlos.
Oni tam mog� sta� ca�y czas, czyli mo�e by� to w startupie

****************************/

	// 	Wld_InsertNpc				(grd1,"CAR_TRAP1");
	// 	Wld_InsertNpc				(grd2,"CAR_TRAP2");
	// 	Wld_InsertNpc				(grd3,"CAR_TRAP3");

	/******************
Id� przed Kocio�
******************/
   
   AI_SetWalkmode (self,NPC_RUN);
	AI_GotoWP(self, "NC_PATH75");
	AI_GotoWP(hero, "NC_PATH70");
   
   B_StopProcessInfos(self);
   Npc_ExchangeRoutine(self, "Kociol");
};

// **************************************************

INSTANCE DIA_Carlos_Caul (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 6;
	condition		= DIA_Carlos_Caul_Condition;
	information		= DIA_Carlos_Caul_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Caul_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Carlos_Dam))&&(Npc_GetDistToNpc(self,hero) < 2000)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Caul_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
   
	AI_Output (self, other, "DIA_Carlos_Caul_11_01"); //To Kocio�. S�odki dom... Chyba si� wzruszy�em.
	AI_Output (other, self, "DIA_Carlos_Caul_15_02"); //Co to za dziura?
	AI_Output (self, other, "DIA_Carlos_Caul_11_03"); //Tam sk�adujemy urobek rudy. Kiedy� magowie trzymali na tym �ap�.
	AI_Output (self, other, "DIA_Carlos_Caul_11_04"); //Poka�� Ci co�, co na pewno Ci� zainteresuje...

	/************************
Teraz id� do miejsca gdzie czekaj� tamci 3 stra�nicy, tam gdzie Cord uczy� walki
************************/

   AI_SetWalkmode (self,NPC_RUN);
	AI_GotoWP(self, "FMC_FM_ENTRANCE");
	AI_GotoWP(hero, "FMC_PATH18");
   
   B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Carlos_Trap (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 7;
	condition		= DIA_Carlos_Trap_Condition;
	information		= DIA_Carlos_Trap_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Trap_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Carlos_Caul))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Trap_Info()
{
   var c_npc carlos;
   carlos = hlp_getNpc(Grd_4087_Carlos);
   B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
   
	AI_Output (self, other, "DIA_Carlos_Trap_11_01"); //A to... A to s� ch�opaki.
	/*************
Niech rzuci okiem na jednego z grd
	AI_TurnToNpc(other, grd1);
-e po kiego ;P
*************/
	AI_Output (other, self, "DIA_Carlos_Trap_15_02"); //Co to ma znaczy�?
	AI_Output (self, other, "DIA_Carlos_Trap_11_03"); //Ano to brachu, �e w�a�nie wpad�e� w spore g�wno.
	AI_Output (self, other, "DIA_Carlos_Trap_11_04"); //Skoro tak bardzo interesuje Ci� nasz ob�z, to mo�e chcia�by� te� zwiedzi� kopalni�. Co Ty na to?
	AI_Output (other, self, "DIA_Carlos_Trap_15_05"); //Znajd� Ci� Carlos, mo�esz by� tego pewien.
	AI_Output (self, other, "DIA_Carlos_Trap_11_06"); //Zobaczymy. Mi�ego pobytu w kopalni.
	AI_Output (self, other, "DIA_Carlos_Trap_11_07"); //Ch�opcy, odprowad�cie 'pana'.

	Log_CreateTopic(CH4_GRD_NewMine, LOG_MISSION);
	Log_SetTopicStatus(CH4_GRD_NewMine, LOG_RUNNING);
	B_LogEntry(CH4_GRD_NewMine, "Stra�nik Carlos za�atwi� mi darmowy pobyt w kopalni. Jeszcze si� policz� z tym sukinsynem.");
   
   freemine_ready_to_opened = true;
   
   Wld_SendTrigger("FREEMINEGATE");
   
   var c_item my_meleeweapon;
   my_meleeweapon = Npc_GetEquippedMeleeWeapon(hero);
   
	if (NPC_HasItems(other,ItMw_1H_RuneSWD_01)>=1)||(NPC_HasItems(other,ItMw_2H_RuneSWD_01)>=1)
	{
		sword_stolen = TRUE;
      
		AI_Output (self, other, "DIA_Carlos_Trap_11_08"); //Jeszcze chwila. Co to za �elastwo?
		AI_Output (other, self, "DIA_Carlos_Trap_15_09"); //Nic Ci do tego!
		AI_Output (self, other, "DIA_Carlos_Trap_11_10"); //Chyba w�a�nie o czym� takim marzy�em. Dawaj miecz!
		
		if (NPC_HasItems(other,ItMw_1H_RuneSWD_01)>=1)
		{
         if (Hlp_IsItem(my_meleeweapon, ItMw_1H_RuneSWD_01))
         {
            AI_UnequipWeapons(hero);
         };
         
			B_GiveInvItems (other, self, ItMw_1H_RuneSWD_01, 1);
		}
		else
		{
         if (Hlp_IsItem(my_meleeweapon, ItMw_2H_RuneSWD_01))
         {
            AI_UnequipWeapons(hero);
         };
         
			B_GiveInvItems (other, self, ItMw_2H_RuneSWD_01, 1);
		};
      
      AI_EquipBestMeleeWeapon(hero);
		AI_EquipBestMeleeWeapon(carlos);
		AI_ReadyMeleeWeapon(carlos);
		AI_PlayAni(carlos, "T_1HSINSPECT");
		AI_RemoveWeapon(carlos);
      
		AI_Output (carlos, other, "DIA_Carlos_Trap_11_11"); //Co za robota! Prawdziwe cudo. Stal pakietowa, b��kitne szlify - teraz ju� si� takich nie robi.
		AI_Output (carlos, other, "DIA_Carlos_Trap_11_12"); //Ten miecz musi pami�ta� du�o lepsze czasy. Ale jakby go troch�...
		AI_Output (other, carlos, "DIA_Carlos_Trap_15_13"); //Chyba si� zap�dzi�e�. Oddaj miecz!
		AI_Output (carlos, other, "DIA_Carlos_Trap_11_14"); //Da� taki miecz nieznajomemu... Albo jeste� g�upi, albo naiwny. M�g�bym da� si� zer�n�� orkowi dla takiego cuda.
		AI_Output (other, carlos, "DIA_Carlos_Trap_15_15"); //Ty skurw...
		AI_Output (carlos, other, "DIA_Carlos_Trap_11_16"); //Jakby� zapomnia� jeste�my w Koloni Karnej. Ciesz si�, �e jestem w dobrym nastroju.
		AI_Output (carlos, other, "DIA_Carlos_Trap_11_17"); //Zamiast Ci� zabi�, spe�ni� obietnic� - witamy w kopalni, he, he...

		B_LogEntry(CH4_GRD_NewMine, "Ten sukinsyn Carlos zabra� m�j miecz i wtr�ci� mnie do kopalni! Jeszcze policz� si� z tym 'mi�o�nikiem' or�a.");
	};

	/*************************
Ork teraz twoja dzia�a. Ci 3 stra�nicy powinni Dicka zaprowadzi� do Kolalni i go do niej wykopa�. Albo po prostu zr�b to jako� inaczej - w sumie wystarczy sam ekran �adowania do kopalni.

************************/

	Npc_ExchangeRoutine(carlos,"DEAD");

	/*************
	Nowy stra�nik na miejsce Carlosa przed kopalni�
	**************/
	Wld_InsertNpc(Grd_4089_Bern,"FMC_PATH18");
   
   B_StopProcessInfos(self);
};
