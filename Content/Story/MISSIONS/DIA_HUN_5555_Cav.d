//********************************************************
instance DIA_Cav_Dungeon_Exit (C_INFO)
{
   npc         =  HUN_5555_Cav;
   nr          =  999;
   condition   =  DIA_Cav_Dungeon_Exit_Condition;
   information =  DIA_Cav_Dungeon_Exit_Info;
   important   =  0;   
   permanent   =  1;
   description = DIALOG_ENDE;
};                       

FUNC int DIA_Cav_Dungeon_Exit_Condition()
{
   return TRUE;
};

FUNC VOID DIA_Cav_Dungeon_Exit_Info()
{
   B_StopProcessInfos(self);
};

INSTANCE DIA_Cav_TooEarlyDungeon (C_INFO)
{
   npc         = HUN_5555_Cav;
   //nr         = 66;
   condition   = DIA_Cav_TooEarlyDungeon_Condition;
   information = DIA_Cav_TooEarlyDungeon_Info;
   permanent   = 0;
   important   = 1;
   description = "."; 
};

FUNC INT DIA_Cav_TooEarlyDungeon_Condition()
{
   if (Kapitel < 6)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_TooEarlyDungeon_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_TooEarlyDungeon_12_01"); //Co ty tu robisz? Dlaczego uzy�e� kod�w?!
   AI_Output (hero, self, "DIA_Cav_TooEarlyDungeon_15_02"); //Ja...
   AI_Output (self, other, "DIA_Cav_TooEarlyDungeon_12_03"); //GI�, WSTR�TNY OSZU�CIE!

   B_StopProcessInfos(self);
   
   Npc_ChangeAttribute   (hero, ATR_HITPOINTS, -hero.attribute[ATR_HITPOINTS_MAX]);
};

INSTANCE DIA_Cav_Dungeon (C_INFO)
{
   npc         = HUN_5555_Cav;
   //nr         = 66;
   condition   = DIA_Cav_Dungeon_Condition;
   information = DIA_Cav_Dungeon_Info;
   permanent   = 0;
   important   = 1;
   description = "."; 
};

FUNC INT DIA_Cav_Dungeon_Condition()
{
   if (Npc_GetDistToWP (self,"DUNG1") < 500) && C_IsChapter(6)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_Dungeon_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_Dungeon_12_01"); //Twoi kompani zostali na g�rze, os�aniaj� nasze plecy.
   AI_Output (hero, self, "DIA_Cav_Dungeon_15_02"); //Randka we dwoje?
   AI_Output (self, other, "DIA_Cav_Dungeon_12_03"); //Mniej wi�cej. Widzia�em jak Gomez zszed� na d�. Co ty na to, �eby dopa�� tego szczura?
   AI_Output (hero, self, "DIA_Cav_Dungeon_15_04"); //Tylko ten skurwiel stoi mi�dzy mn� a ucieczk� z tego szamba. B�d� tu� za tob�.   
   AI_Output (self, other, "DIA_Cav_Dungeon_12_05"); //Tylko ostro�nie, nie podoba mi si� to miejsce. Miej oczy szeroko otwarte.
   
   B_LogEntry(CH6_RBL_PayDay, "Podziemia cuchn� truposzami, musimy zachowa� ostro�no��, �eby nie zosta� tu na zawsze.");
   Npc_ExchangeRoutine(self, "GUIDE");

   B_StopProcessInfos(self);
};

//********************************************************

INSTANCE DIA_Cav_DungeonInside (C_INFO)
{
   npc         = HUN_5555_Cav;
   //nr         = 67;
   condition   = DIA_Cav_DungeonInside_Condition;
   information = DIA_Cav_DungeonInside_Info;
   permanent   = 0;
   important   = 1;
   description = "."; 
};

FUNC INT DIA_Cav_DungeonInside_Condition()
{
   /****************************
wp w podziemiach, przy ciele pierwszego martwego stra�nika i szcz�tkach szkieleciora

****************************/

   if (Npc_KnowsInfo (hero,DIA_Cav_Dungeon))&&(Npc_GetDistToWP (self,"DUNG5") < 500)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_DungeonInside_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_DungeonInside_12_01"); //Sukinsyny maj� ci�k� przepraw� z umarlakami.
   AI_Output (other, self, "DIA_Cav_DungeonInside_15_02"); //I dobrze, niech ich ko�cieje wykrwawi�, zanim si� do nich dobierzemy.
   AI_Output (self, other, "DIA_Cav_DungeonInside_12_03"); //Uwa�ajmy, �eby i nas nie poharatali.
   AI_Output (self, other, "DIA_Cav_DungeonInside_12_04"); //Co to za d�wi�k?
   AI_Output (self, other, "DIA_Cav_DungeonInside_12_05"); //To ko�ciaki, do broni!   
   
   B_LogEntry(CH6_RBL_PayDay, "Idziemy dobrym �ladem. Cia�a stra�nik�w i szcz�tki umarlak�w �wiadcz�, �e Gomez nie ma �atwej ucieczki.");
   Npc_ExchangeRoutine(self, "GUIDE2");
   B_StopProcessInfos(self);

   Wld_InsertNpc(Skeleton2HSwdWarrior,"DUNG6");
   Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG8");
   Wld_InsertNpc(SkeletonWarrior,"DUNG6");
   Wld_InsertNpc(SkeletonIceRanger,"DUNG8");
   Wld_InsertNpc(SkeletonFireRanger,"DUNG6");
};

//********************************************************

INSTANCE DIA_Cav_DungeonInside1 (C_INFO)
{
   npc         = HUN_5555_Cav;
   //nr         = 67;
   condition   = DIA_Cav_DungeonInside1_Condition;
   information = DIA_Cav_DungeonInside1_Info;
   permanent   = 0;
   important   = 1;
   description = "."; 
};

FUNC INT DIA_Cav_DungeonInside1_Condition()
{
   if (Npc_KnowsInfo (hero,DIA_Cav_DungeonInside))&&(Npc_GetDistToWP (self,"DUNG22") < 500)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_DungeonInside1_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_DungeonInside1_12_01"); //Co� mi tu �mierdzi, trzymaj r�k� na broni!
   
   Npc_ExchangeRoutine(self, "GUIDE3");
   B_StopProcessInfos(self);
   
   Wld_InsertNpc(Skeleton2HSwdWarrior,"DUNG24");
   Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG25");
   Wld_InsertNpc(Skeleton2HSwdWarrior,"DUNG26");
   Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG23");
   Wld_InsertNpc(SkeletonPoisonranger,"DUNG27");
   Wld_InsertNpc(SkeletonMage,"DUNG23");   
};

//********************************************************

INSTANCE DIA_Cav_DungeonInside11 (C_INFO)
{
   npc            = HUN_5555_Cav;
   //nr            = 67;
   condition      = DIA_Cav_DungeonInside11_Condition;
   information      = DIA_Cav_DungeonInside11_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cav_DungeonInside11_Condition()
{
   if (Npc_KnowsInfo (hero,DIA_Cav_DungeonInside1))&&(Npc_GetDistToWP (self,"DUNG32") < 500)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_DungeonInside11_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_DungeonInside11_12_01"); //Za cicho jak na m�j gust, miej oczy dooko�a g�owy.
   
   Npc_ExchangeRoutine(self, "GUIDE4");
   B_StopProcessInfos(self);
   
   Wld_InsertNpc(Skeleton2HSwdWarrior,"DUNG31");
   Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG31");
   Wld_InsertNpc(Skeleton2HSwdWarrior,"DUNG50");
   Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG50");
   Wld_InsertNpc(SkeletonPoisonranger,"DUNG51");
   
   Wld_InsertNpc(EBR_101_ScarD,"DUNG39");
   Wld_InsertNpc(EBR_102_ArtoD,"DUNG40");   
};   
   
//********************************************************

INSTANCE DIA_Cav_DungeonInside111 (C_INFO)
{
   npc            = HUN_5555_Cav;
   //nr            = 67;
   condition      = DIA_Cav_DungeonInside111_Condition;
   information      = DIA_Cav_DungeonInside111_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cav_DungeonInside111_Condition()
{
   if (Npc_KnowsInfo (hero,DIA_Cav_DungeonInside11))&&(Npc_GetDistToWP (self,"DUNG36") < 500)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_DungeonInside111_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_DungeonInside111_12_01"); //Chyba zbli�amy si� do celu, mam z�e przeczucia...
   
   Npc_ExchangeRoutine(self, "GUIDE5");
   B_StopProcessInfos(self);   
   Wld_InsertNpc(RBL_4108_UrtD,"DUNG41");
};   

//********************************************************

INSTANCE DIA_Cav_DungeonInside1111 (C_INFO)
{
   npc            = HUN_5555_Cav;
   //nr            = 67;
   condition      = DIA_Cav_DungeonInside1111_Condition;
   information      = DIA_Cav_DungeonInside1111_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cav_DungeonInside1111_Condition()
{
   if (Npc_KnowsInfo (hero,DIA_Cav_DungeonInside111))&&(Npc_GetDistToWP (self,"DUNG46") < 400)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_DungeonInside1111_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   
   AI_Output (self, other, "DIA_Cav_DungeonInside1111_12_01"); //Dopadli�my skurwiela! Kto to?
   AI_Output (self, other, "DIA_Cav_DungeonInside1111_12_02"); //O kurwa, przecie� to niemo�liwe!    
   AI_Output (self, other, "DIA_Cav_DungeonInside1111_12_03"); //Ty nie �yjesz!   
   B_StopProcessInfos(self);   
   Npc_ExchangeRoutine(self, "DEAD");
   
   Wld_InsertNpc(KDF_4115_Corristo,"DUNG48");
   Wld_InsertNpc(Ebr_4114_GomezD,"DUNG47");
};   