// **************************** 
//				EXIT 
// ****************************

instance Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nefarius_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// **************************** 
//			Hallo 
// ****************************

instance Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"Kim jeste�?";
};                       

FUNC int Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //Kim jeste�?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Nazywam si� Nefarius, jestem magiem Kr�gu Wody.
};

// ****************************

instance Info_Nefarius_OrnamentMap (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_OrnamentMap_Condition;
	information	=	Info_Nefarius_OrnamentMap_Info;
	permanent	=	0;
	description =	"Przyszed�em po map�.";
};                       

FUNC int Info_Nefarius_OrnamentMap_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Ornament))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_OrnamentMap_Info()
{
	AI_Output (other, self,"Info_Nefarius_OrnamentMap_15_00"); //Przyszed�em po map�.
	AI_Output (self, other,"Info_Nefarius_OrnamentMap_04_01"); //Kolejny �mia�ek... W porz�dku, w�a�nie sko�czy�em ostatnie poci�gni�cia p�dzla.
   
	CreateInvItems (self,OrnMap3,1);
	B_GiveInvItems (self, other, OrnMap3, 1);
   
	AI_Output (self, other,"Info_Nefarius_OrnamentMap_04_02"); //Tylko pilnuj pergaminu jak oka w g�owie!
	AI_Output (other, self,"Info_Nefarius_OrnamentMap_15_03"); //Bez obaw.
	AI_Output (other, self,"Info_Nefarius_OrnamentMap_15_04"); //A tak z ciekawo�ci. Dlaczego sami nie szukacie tych ornament�w? Dlaczego wys�ugujecie si� najemnikami?
	AI_Output (self, other,"Info_Nefarius_OrnamentMap_04_05"); //A czy ja, albo ktokolwiek z mag�w wygl�damy, jak zbir, albo �owca przyg�d? No, mo�e pr�cz Cronosa.
	AI_Output (self, other,"Info_Nefarius_OrnamentMap_04_06"); //W naturze istnieje odwieczna r�wnowaga pomi�dzy wszystkim, co �ywe i martwe.
	AI_Output (self, other,"Info_Nefarius_OrnamentMap_04_07"); //My szukamy wskaz�wek, najemnicy realizuj� nasze cele. To wszystko jest harmoni�, darem od samego Adanosa.
	AI_Output (other, self,"Info_Nefarius_OrnamentMap_15_08"); //Skoro tak twierdzisz. Czas nadstawi� za was karku, �eby zachowa� r�wnowag�.

	B_LogEntry(CH3_NON_Ornament, "Mam map� wskazuj�c� po�o�enie kolejnego ornamentu. Obym zd��y� przed Hrabi�.");

	/***********************
	Wsadzenie w�gorza do miejsca gdzie znajduje si� 3 kawa�ek, wa�ne dla fabu�y
	**********************/

	Wld_InsertNpc (Grd_2519_Wegorz,"OR3");//wp
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
	
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);
	
	Npc_ExchangeRoutine(weg,"START"); //PATH_CASTLE_TO_WATERFALL
	Npc_ExchangeRoutine(grd1,"OR3"); //PATH_CASTLE_TO_WATERFALL
	Npc_ExchangeRoutine(grd2,"OR3"); //OW_PATH_108
	Npc_ExchangeRoutine(grd3,"OR3"); //CASTLE_7
	Npc_ExchangeRoutine(grd4,"OR3"); //CASTLE_8
	Npc_ExchangeRoutine(grd5,"OR3"); //CASTLE_9
	
	//NEWPATH_4 - PRZED JASKINI�
	//NEWPATH_6 - WP DLA ORNAMENTU

	Wld_InsertItem(orn3, "NEWPATH_6");
	/**********************
	Hrabia ma si� zbli�y� do walcz�cych, �eby potem m�g� do�� szybko podej�� i zainicjowa� dialog
	***********************/
};

// ****************************

instance  Info_Nefarius_OrnamentMapAgain (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	3;
	condition	=	Info_Nefarius_OrnamentMapAgain_Condition;
	information	=	Info_Nefarius_OrnamentMapAgain_Info;
	permanent	=	0;
	description =	"Przyszed�em po kolejn� map�.";
};                       

FUNC int  Info_Nefarius_OrnamentMapAgain_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cronos_Ornament))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_OrnamentMapAgain_Info()
{
	AI_Output (other, self,"Info_Nefarius_OrnamentMapAgain_15_00"); //Przyszed�em po kolejn� map�.
	AI_Output (self, other,"Info_Nefarius_OrnamentMapAgain_04_01"); //Oto ona.
	
   CreateInvItems (self,OrnMap4,1);
	B_GiveInvItems (self, other, OrnMap4, 1);
	
   AI_Output (self, other,"Info_Nefarius_OrnamentMapAgain_04_02"); //Powodzenia w poszukiwaniach!
	B_LogEntry(CH3_NON_Ornament, "Mam ju� map� wskazuj�c� po�o�enie ostatniej cz�ci ornamentu. Nie ma co traci� czasu.");
	
	var C_NPC hrab; hrab = Hlp_GetNpc(GRD_4010_Hrabia);	
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);

	Npc_ExchangeRoutine(hrab, "OR4"); //OW_PATH_TEMPELRUIN07
	Npc_ExchangeRoutine(grd1,"OR4"); //OW_PATH_175_GATE1
	Npc_ExchangeRoutine(grd2,"OR4"); //OW_PATH_175_GATE2
	Npc_ExchangeRoutine(grd3,"OR4"); //OW_PATH_175_MEATBUG_GATE2
	Npc_ExchangeRoutine(grd4,"OR4"); //OW_PATH_176
	Npc_ExchangeRoutine(grd5,"OR4"); //LOCATION_28_01
	Npc_ExchangeRoutine(weg,"OR4"); //OW_PATH_TEMPELRUIN06
	
	B_StopProcessInfos(self);
};

// ****************************

instance  Info_Nefarius_All (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	4;
	condition	=	Info_Nefarius_All_Condition;
	information	=	Info_Nefarius_All_Info;
	permanent	=	0;
	description =	"Czas po��czy� ornamenty.";
};                       

FUNC int  Info_Nefarius_All_Condition()
{
	return ritual_time_ok;
};

FUNC VOID  Info_Nefarius_All_Info()
{
	AI_Output (other, self,"Info_Nefarius_All_15_00"); //Czas po��czy� ornamenty.
   
	if (ornament_wait >= Wld_GetDay())
	{
		AI_Output (self, other,"Info_Nefarius_All_04_01"); //Chwa�a niech b�dzie Adanosowi!
		AI_Output (other, self,"Info_Nefarius_All_15_02"); //Saturas czeka na dziedzi�cu.
		AI_Output (self, other,"Info_Nefarius_All_04_03"); //Ju� tam id�...
		B_LogEntry(CH3_NON_Ornament, "Poinformowa�em Nefariusa.");
		Npc_ExchangeRoutine(self,"RIT");
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_All_04_04"); //Czas min��... Co teraz Adanosie?
	};
   
	B_StopProcessInfos(self);
};

// ****************************

instance  Info_Nefarius_Stones (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	5;
	condition	=	Info_Nefarius_Stones_Condition;
	information	=	Info_Nefarius_Stones_Info;
	permanent	= 0;
	important 	= 0;
	description =	"Saturas przys�a� mnie po kamienie ogniskuj�ce.";
};                       

FUNC int  Info_Nefarius_Stones_Condition()
{
	return focus_get;
};

FUNC VOID  Info_Nefarius_Stones_Info()
{
	AI_Output (other, self,"Info_Nefarius_Stones_15_00"); //Saturas przys�a� mnie po kamienie ogniskuj�ce.
	AI_Output (self, other,"Info_Nefarius_Stones_04_01"); //Niezupe�nie. Chcia�e� powiedzie�, �e Saturas pozwoli� Ci zapyta� stra�nika o ich wydanie.
	AI_Output (other, self,"Info_Nefarius_Stones_15_02"); //Ekhm... Tak. Troch� si� przej�zyczy�em.
	AI_Output (self, other,"Info_Nefarius_Stones_04_03"); //Kamienie ogniskuj�ce... C� one mog� znaczy� dla przypadkowego skaza�ca?
	AI_Output (other, self,"Info_Nefarius_Stones_15_04"); //Wi�cej ni� m�g�by� przypuszcza�.
	AI_Output (self, other,"Info_Nefarius_Stones_04_05"); //S�ucham wi�c, mam sporo wolnego czasu.
	AI_Output (other, self,"Info_Nefarius_Stones_15_06"); //A wi�c wszystko zacz�o si�, gdy znalaz�em pewiem miecz... (Rick opowiada histori� miecza runicznego)
	AI_Output (self, other,"Info_Nefarius_Stones_04_07"); //Niesamowite. Nie s�dzi�em, �e to ostrze w og�le istnieje. Poka�esz miecz?
	
   if (NPC_HasItems(hero,ItMw_2H_RuneSWD_01)>=1)
	{
		AI_Output (other, self,"Info_Nefarius_Stones_15_08"); //Oto on.
		var c_item hero_weapon; hero_weapon = Npc_GetEquippedMeleeWeapon(hero);
		
		if (!Hlp_IsItem(hero_weapon, ItMw_2H_RuneSWD_01))
		{
			Equip_Item(hero, ItMw_2H_RuneSWD_01);
		};
		
		AI_ReadyMeleeWeapon(hero);
		AI_PlayAni(hero, "T_1HSINSPECT");
		AI_RemoveWeapon(hero);
		AI_Output (self, other,"Info_Nefarius_Stones_04_09"); //Cudowny or�!
	}
	else
	{
		AI_Output (other, self,"Info_Nefarius_Stones_15_10"); //Nie mam teraz miecza przy sobie.
		AI_Output (self, other,"Info_Nefarius_Stones_04_11"); //Szkoda...
	};
	
   AI_Output (self, other,"Info_Nefarius_Stones_04_12"); //W porz�dku, oddam Ci kamienie, ale pod jednym warunkiem.
	AI_Output (other, self,"Info_Nefarius_Stones_15_13"); //Czego ��dasz w zamian?
	AI_Output (self, other,"Info_Nefarius_Stones_04_14"); //Jestem pewien, �e na terenie obecnej Kolonii Karnej ukryto co� niezwykle warto�ciowego.
	AI_Output (self, other,"Info_Nefarius_Stones_04_15"); //Jest to skarb o niewyobra�alnej warto�ci, spu�cizna wielu narod�w, dzie�o, kt�re samym swym istnieniem wprawia w zachwyt tego, kto cho� raz na nie spojrzy!
	AI_Output (other, self,"Info_Nefarius_Stones_15_16"); //Co to za... skarb?
	AI_Output (self, other,"Info_Nefarius_Stones_04_17"); //Tego zdradzi� nie mog�. Ale odkryj� przed Tob� jedn� z tajemnic jego ukrycia.
	AI_Output (self, other,"Info_Nefarius_Stones_04_18"); //Pomo�esz mi?
	AI_Output (self, other,"Info_Nefarius_Stones_04_19"); //W zamian za kamienie ogniskuj�ce?
	AI_Output (self, other,"Info_Nefarius_Stones_04_20"); //Tak. Wi�c jak b�dzie?
	
   B_LogEntry(CH4_RBL_FocusStones, "Nefarius odda mi kamienie ogniskuj�ce w zamian za pomoc w odnalezieniu jakiego� legendarnego skarbu. Kto wie, mo�e upiek� dwie pieczenie przy jednym ogniu?");
};

// ****************************

instance  Info_Nefarius_Treasure (C_INFO)
{
	npc		=	KDW_603_Nefarius;
	nr		=	6;
	condition	=	Info_Nefarius_Treasure_Condition;
	information	=	Info_Nefarius_Treasure_Info;
	permanent	= 	0;
	important 	=	0;
	description =	"Zgoda, pomog� Ci w odnalezieniu skarbu.";
};                       

FUNC int  Info_Nefarius_Treasure_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Stones))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_Treasure_Info()
{
	AI_Output (other, self,"Info_Nefarius_Treasure_15_00"); //Zgoda, pomog� Ci w odnalezieniu skarbu.
	AI_Output (self, other,"Info_Nefarius_Treasure_04_01"); //Pomo�esz nie tylko mi przyjacielu, ale ca�ej ludzko�ci.
	AI_Output (other, self,"Info_Nefarius_Treasure_15_02"); //Od czego mam zacz��?
	AI_Output (self, other,"Info_Nefarius_Treasure_04_03"); //Musisz odnale�� pozosta�e cz�ci tej mapy. Wiem tylko, �e mog� by� rozsiane po ca�ej Kolonii.
	AI_Output (other, self,"Info_Nefarius_Treasure_15_04"); //Kto� zada� sobie sporo trudu, aby zniszczy� map� i ukry� jej kawa�ki. Dlaczego po prostu nie spali� pergaminu?
	AI_Output (self, other,"Info_Nefarius_Treasure_04_05"); //Tego nie wiem, ale wie�� niesie, �e mapy nie mo�na zniszczy�. Kiedy� spr�bowa�em j� podpali�, zala�em wod� i nic. Nie ma nawet �ladu zniszczenia czy zabrudzenia.
	AI_Output (other, self,"Info_Nefarius_Treasure_15_06"); //Magiczna mapa wskazuj�ca miejsce ukrycia niewyobra�alnego skarbu... Hmm, brzmi ciekawie. Wchodz� w to.
	AI_Output (self, other,"Info_Nefarius_Treasure_04_07"); //Dokona�e� m�drego wyboru. Przyjd� do mnie, kiedy zbierzesz pozosta�e siedem kawa�k�w mapy.
	AI_Output (self, other,"Info_Nefarius_Treasure_04_08"); //Ten we� na wz�r.
	
   CreateInvItems (self,treasure_piece1,1);
	B_GiveInvItems (self, other,treasure_piece1, 1);
	
   AI_Output (self, other,"Info_Nefarius_Treasure_04_09"); //Powodzenia w poszukiwaniach. Niech Adanos Ci sprzyja, przyjacielu.
	AI_Output (other, self,"Info_Nefarius_Treasure_15_10"); //Bez obrazy, ale wola�bym, �eby �aden b�g nie wtyka� w to swojego nosa. Bywaj.

	Log_CreateTopic(CH4_Mag_Treasure, LOG_MISSION);
	Log_SetTopicStatus(CH4_Mag_Treasure, LOG_RUNNING);
	B_LogEntry(CH4_Mag_Treasure, "Odnajd� dla Nefariusa pozosta�e siedem kawa�k�w mapy wskazuj�cej miejsce ukrycia niewyobra�alnego skarbu. Kawa�ki mapy mog� by� rozsiane po ca�ej Kolonii.");
};

// ****************************

var int nefar_prepare;

instance  Info_Nefarius_AllPieces (C_INFO)
{
	npc		=	KDW_603_Nefarius;
	nr		=	7;
	condition	=	Info_Nefarius_AllPieces_Condition;
	information	=	Info_Nefarius_AllPieces_Info;
	permanent	= 	0;
	important 	=	0;
	description =	"Odnalaz�em wszystkie kawa�ki mapy!";
};                       

FUNC int  Info_Nefarius_AllPieces_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Treasure))&&(NPC_HasItems(hero,treasure_piece1)>=1)&&(NPC_HasItems(hero,treasure_piece2)>=1)&&(NPC_HasItems(hero,treasure_piece3)>=1)&&(NPC_HasItems(hero,treasure_piece4)>=1)&&(NPC_HasItems(hero,treasure_piece5)>=1)&&(NPC_HasItems(hero,treasure_piece6)>=1)&&(NPC_HasItems(hero,treasure_piece7)>=1)&&(NPC_HasItems(hero,treasure_piece8)>=1)
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_AllPieces_Info()
{
	nefar_prepare = B_SetDayTolerance()+1;
	
   AI_Output (other, self,"Info_Nefarius_AllPieces_15_00"); //Odnalaz�em wszystkie kawa�ki mapy!
	AI_Output (self, other,"Info_Nefarius_AllPieces_04_01"); //To wspania�a nowina! Daj mi fragmenty.
	
   B_GiveInvItems (other, self, treasure_piece1, 1);
	B_GiveInvItems (other, self, treasure_piece2, 1);
	B_GiveInvItems (other, self, treasure_piece3, 1);
	B_GiveInvItems (other, self, treasure_piece4, 1);
	B_GiveInvItems (other, self, treasure_piece5, 1);
	B_GiveInvItems (other, self, treasure_piece6, 1);
	B_GiveInvItems (other, self, treasure_piece7, 1);
	B_GiveInvItems (other, self, treasure_piece8, 1);

	Npc_RemoveInvItems(self,treasure_piece1,1);
	Npc_RemoveInvItems(self,treasure_piece2,1);
	Npc_RemoveInvItems(self,treasure_piece3,1);
	Npc_RemoveInvItems(self,treasure_piece4,1);
	Npc_RemoveInvItems(self,treasure_piece5,1);
	Npc_RemoveInvItems(self,treasure_piece6,1);
	Npc_RemoveInvItems(self,treasure_piece7,1);
	Npc_RemoveInvItems(self,treasure_piece8,1);
	
   AI_Output (self, other,"Info_Nefarius_AllPieces_04_02"); //Nie tra�my czasu, natychmiast zabior� si� do scalenia mapy.
	AI_Output (self, other,"Info_Nefarius_AllPieces_04_03"); //Wr�� jutro, wtedy wybierzemy si� na poszukiwania skarbu!

	B_LogEntry(CH4_Mag_Treasure, "Odda�em Nefariusowi wszystkie kawa�ki mapy. Mam czeka� do jutra na z�o�enia tego do kupy. A p�niej wyprawa po bogactwa i s�aw�!");
};

// ****************************

instance  Info_Nefarius_Go (C_INFO)
{
	npc		=	KDW_603_Nefarius;
	nr		=	8;
	condition	=	Info_Nefarius_Go_Condition;
	information	=	Info_Nefarius_Go_Info;
	permanent	= 	0;
	important 	=	1;
	description =	"";
};                       

FUNC int  Info_Nefarius_Go_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_AllPieces))&&(nefar_prepare <= Wld_GetDay())&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_Go_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   AI_Output (self, other,"Info_Nefarius_Go_04_01"); //Dobrze, �e jeste�. Mapa ju� gotowa. Sam zobacz.
	
   CreateInvItems (self,treasure_map,1);
	B_GiveInvItems (self, other, treasure_map, 1);
	B_UseFakeScroll(other);
	
   AI_Output (other, self,"Info_Nefarius_Go_15_02"); //Tak, wiem, gdzie to jest.
	AI_Output (self, other,"Info_Nefarius_Go_04_03"); //Prowad� wi�c, ja marnie orientuj� si� w terenie.
	
   B_LogEntry(CH4_Mag_Treasure, "Dosta�em map� z lokalizacj� skarbu od Nefariusa. Mam tam zaprowadzi� maga i wykopa� skarb. Mam nadziej�, �e to nie jest pu�apka.");

	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_StopProcessInfos(self); 
};

// ****************************

instance Info_Nefarius_Get (C_INFO)
{
	npc		=	KDW_603_Nefarius;
	nr		=	9;
	condition	=	Info_Nefarius_Get_Condition;
	information	=	Info_Nefarius_Get_Info;
	permanent	= 	0;
	important 	=	1;
	description =	"";
};                       

FUNC int  Info_Nefarius_Get_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Go))&&(Npc_GetDistToWP (self,"MOVEMENT_ORCGRAVEYARD4") < 500 )
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_Get_Info()
{
   wld_insertItem(treasure_statu, "MOVEMENT_ORCGRAVEYARD4");
   Wld_InsertItem(ItMi_NuggetSack_03, "MOVEMENT_ORCGRAVEYARD4");
   Wld_InsertItem(ItMi_GoldRing, "MOVEMENT_ORCGRAVEYARD4");
   
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(other, self);
	
   AI_Output (other, self,"Info_Nefarius_Get_15_01"); //To tutaj!
	AI_Output (self, other,"Info_Nefarius_Get_04_02"); //Na co czekasz? Kop!
	
   B_LogEntry(CH4_Mag_Treasure, "Znale�li�my miejsce z zakopanym skarbem! Czas wykopa� te bogactwa!");
	B_StopProcessInfos(self);
	AI_GotoWP(other,	"MOVEMENT_ORCGRAVEYARD4");
	AI_AlignToWP(other);
	AI_PlayAni(other,	"T_PLUNDER");
};

// ****************************

/************
Ork wymy�l co to za skarb ma by�: tunika, pos��ek czy jaka� ksi�ga i wrzu� tu do skryptu. Co do reszty to dodaj co� unikatowego dla gracza
**************/

instance  Info_Nefarius_Success (C_INFO)
{
	npc		=	KDW_603_Nefarius;
	nr		=	10;
	condition	=	Info_Nefarius_Success_Condition;
	information	=	Info_Nefarius_Success_Info;
	permanent	= 	0;
	important 	=	1;
	description =	"";
};                       

FUNC int  Info_Nefarius_Success_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Get))&&(Npc_GetDistToNpc(self,hero) < 1500)&&(NPC_HasItems(hero,treasure_statu)>=1)
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_Success_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
   
	AI_Output (self, other,"Info_Nefarius_Success_04_01"); //Znalaz�e� skarb?!
	AI_Output (other, self,"Info_Nefarius_Success_15_02"); //Ekhm. Jaki skarb? Tam nie by�o nic po co warto si� schyli�!
	AI_Output (self, other,"Info_Nefarius_Success_04_03"); //Masz to! Czuj� aur� artefaktu! Daj mi to natychmiast.
	
   B_GiveInvItems (other, self, treasure_statu, 1);
	Npc_RemoveInvItems(self,treasure_statu,1);
	
   AI_Output (self, other,"Info_Nefarius_Success_04_04"); //Odnalezione po tylu latach! To cudowne!
	AI_Output (self, other,"Info_Nefarius_Success_04_05"); //Niech imi� Adaonsa nigdy nie zostanie zapomniane.
	AI_Output (self, other,"Info_Nefarius_Success_04_06"); //Wiele uczyni�e� dla Kr�gu Wody. Oto twoja nagroda.
	
   CreateInvItems (self,Focus_2,1);
	B_GiveInvItems (self, other, Focus_2, 1);
	CreateInvItems (self,Focus_3,1);
	B_GiveInvItems (self, other, Focus_3, 1);
	CreateInvItems (self,Focus_4,1);
	B_GiveInvItems (self, other, Focus_4, 1);
	CreateInvItems (self,Focus_5,1);
	B_GiveInvItems (self, other, Focus_5, 1);
   
	AI_Output (other, self,"Info_Nefarius_Success_15_07"); //Ale to tylko cztery kamienie!
	AI_Output (self, other,"Info_Nefarius_Success_04_08"); //Przykro mi, wi�cej nie mam. 
	AI_Output (self, other,"Info_Nefarius_Success_04_09"); //Pami�taj jednak, �e te artefakty zosta�y dodatkowo nasycone moc� rytua�u, podczas tworzenia bariery.
	AI_Output (self, other,"Info_Nefarius_Success_04_10"); //By� mo�e wystarcz� do przywr�cenia mieczowi runicznemu dawnej �wietno�ci.
	AI_Output (other, self,"Info_Nefarius_Success_15_11"); //Oby� mia� racj�. Bywaj, magu.
	AI_Output (self, other,"Info_Nefarius_Success_04_12"); //Powodzenia, przyjacielu. Czas wraca� do Saturasa z dobr� nowin�!
	
   B_LogEntry(CH4_RBL_FocusStones, "Mam kamienie ogniskuj�ce. Czas porozmawia� z Miltenem.");
	Log_SetTopicStatus(CH4_Mag_Treasure, LOG_SUCCESS);
	B_LogEntry(CH4_Mag_Treasure, "Odnalaz�em ten pseudo-skarb. Gdybym wiedzia�, co tam zakopano, pewnie da�bym sobie spok�j z szukaniem. Ano �ycie...");
	B_StopProcessInfos(self); 
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"START");
};
