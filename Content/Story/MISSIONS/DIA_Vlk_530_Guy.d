// **************************************************
//                    EXIT 
// **************************************************

INSTANCE DIA_Guy_Exit (C_INFO)
{
   npc         = Vlk_530_Guy;
   nr         = 999;
   condition   = DIA_Guy_Exit_Condition;
   information   = DIA_Guy_Exit_Info;
   permanent   = 1;
   description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guy_Exit_Condition()
{
   return 1;
};

FUNC VOID DIA_Guy_Exit_Info()
{
   B_StopProcessInfos   (self );
};

// **************************************************
//             
// **************************************************

INSTANCE DIA_Guy_Hello (C_INFO)
{
   npc            = Vlk_530_Guy;
   nr            = 2;
   condition      = DIA_Guy_Hello_Condition;
   information      = DIA_Guy_Hello_Info;
   permanent      = 0;
   description    = "Witam!";
};

FUNC INT DIA_Guy_Hello_Condition()
{   
   return 1;
};

FUNC VOID DIA_Guy_Hello_Info()
{
   AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Witam!
   AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Mhm? Nie widzia�em Ci� tutaj. Jeste� nowy, prawda?
   AI_Output (other, self,"DIA_Guy_Hello1_15_02"); //Przyby�em niedawno. Mo�esz powiedzie� mi co� wi�cej o tym obozie?
   AI_Output (self, other,"DIA_Guy_Hello1_03_03"); //A co tutaj jest do opowiadania? Ca�ym burdelem rz�dz� stra�nicy i magnaci.
   AI_Output (self, other,"DIA_Guy_Hello_03_04"); //Jak chcesz �y�, to s�uchasz i robisz wszystko czego od Ciebie za��daj�.
   AI_Output (other, self,"DIA_Guy_Hello1_15_05"); //I wy si� na to godzicie?
   AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Ciszej! Jeszcze nas kto� us�yszy... Musz� ju� i��.
   B_StopProcessInfos   (self);
};

var int guy_again;
var int guy_pers1;
var int guy_pers;
var int guy_pers2;
// **************************************************

INSTANCE DIA_Guy_Rebel (C_INFO)
{
   npc            = Vlk_530_Guy;
   nr            = 3;
   condition      = DIA_Guy_Rebel_Condition;
   information      = DIA_Guy_Rebel_Info;
   important      = 0;
   permanent      = 0;
   description    = "Nie chcia�by� postawi� si� stra�nikom?";
};

FUNC INT DIA_Guy_Rebel_Condition()
{   
   if (Npc_KnowsInfo (hero,DIA_Guy_Hello ))&&(Npc_KnowsInfo (hero,DIA_Urt_Packages)) 
   {
      return 1;
   };
};

FUNC VOID DIA_Guy_Rebel_Info()
{
   AI_Output (other, self,"DIA_Guy_Rebel_15_00"); //Nie chcia�by� postawi� si� stra�nikom?
   AI_Output (self, other,"DIA_Guy_Rebel_03_01"); //Co Ty wygadujesz?! Nie jestem idiot�. To prowokacja? Nie dam si� nabra�!
   AI_Output (other, self,"DIA_Guy_Rebel_15_02"); //Nie jestem stra�nikiem. Nale�� do rebeliant�w...
   AI_Output (self, other,"DIA_Guy_Rebel_03_03"); //Nie chc� mie� z tym nic wsp�lnego - odejd� albo zawo�am stra�e!
   B_StopProcessInfos   (self);
};

var int belief_Guy;

INSTANCE DIA_Guy_Rebel1 (C_INFO)
{
   npc            = Vlk_530_Guy;
   nr            = 3;
   condition      = DIA_Guy_Rebel1_Condition;
   information      = DIA_Guy_Rebel1_Info;
   important      = 0;
   permanent      = 1;
   description    = "Porozmawiajmy jeszcze raz.";
};

FUNC INT DIA_Guy_Rebel1_Condition()
{   
   if (Npc_KnowsInfo (hero,DIA_Guy_Rebel) && !belief_Guy) 
   {
      return 1;
   };
};

FUNC VOID DIA_Guy_Rebel1_Info()
{
   AI_Output (other, self,"DIA_Guy_Rebel1_15_01"); //Porozmawiajmy jeszcze raz.
   AI_Output (self, other,"DIA_Guy_Rebel1_03_02"); //Jak chcesz mnie przekona�?

   Info_ClearChoices (DIA_Guy_Rebel1);
   Info_AddChoice (DIA_Guy_Rebel1, "Nie b�d� tch�rzem!", DIA_Guy_Rebel_Coward);
   Info_AddChoice (DIA_Guy_Rebel1, "Musimy walczy�!", DIA_Guy_Rebel_Fight);
   if (buddler_join > 0)
   {
      Info_AddChoice (DIA_Guy_Rebel1, "Nie jeste� sam.", DIA_Guy_Rebel_Alone);
   };
   Info_AddChoice (DIA_Guy_Rebel1, "Porozmawiamy o tym p�niej.", DIA_Guy_Rebel_Later);
};

// ---------------------------coward----------------------------------------

FUNC VOID DIA_Guy_Rebel_Coward()
{
   if (guy_pers1 == FALSE)
   {
      guy_pers = TRUE;
      AI_Output (other, self,"DIA_Guy_Rebel_Coward_15_00"); //Nie b�d� tch�rzem!
      AI_Output (self, other,"DIA_Guy_Rebel_Coward_03_01"); //A co w tym z�ego, przynajmniej d�u�ej po�yj�.
      AI_Output (self, other,"DIA_Guy_Rebel_Coward_03_02"); //Zejd� mi z oczu, a zapomn� o tym co powiedzia�e�.
   }
   else
   {
      AI_Output (other, self,"DIA_Guy_Rebel_Coward_15_03"); //Nie b�d� tch�rzem!
      AI_Output (self, other,"DIA_Guy_Rebel_Coward_03_04"); //Nie b�d� tego s�ucha� - stra�!
      /***************************
      Ork tutaj atak stra�y trzeba zrobi�, jak�� funkcje, etc.
      ***************************/
      B_CallComrades();
   };
   B_StopProcessInfos   (self);
};

// ---------------------------fight----------------------------------------

FUNC VOID DIA_Guy_Rebel_Fight()
{
   if (guy_pers2 == FALSE)
   {
      guy_pers = TRUE;
      AI_Output (other, self,"DIA_Guy_Rebel_Fight_15_00"); //Musimy walczy�!
      AI_Output (self, other,"DIA_Guy_Rebel_Fight_03_01"); //Ze stra�nikami? Nie b�d� idiot�, nie mamy szans.
      AI_Output (self, other,"DIA_Guy_Rebel_Fight_03_02"); //Odejd� i nigdy ju� o tym nie rozmawiajmy.
   }
   else
   {
      AI_Output (other, self,"DIA_Guy_Rebel_Fight_15_03"); //Musimy walczy�!
      AI_Output (self, other,"DIA_Guy_Rebel_Fight_03_04"); //Nie b�d� tego s�ucha� - stra�!
      /***************************
      Ork tutaj atak stra�y trzeba zrobi�, jak�� funkcje, etc.
      ***************************/
      B_CallComrades();
   };
   B_StopProcessInfos   (self);
};

// ---------------------------later----------------------------------------

FUNC VOID DIA_Guy_Rebel_Later()
{
   AI_Output (other, self,"DIA_Guy_Rebel_Later_15_00"); //Porozmawiamy o tym p�niej.
   AI_Output (self, other,"DIA_Guy_Rebel_Later_03_01"); //A niby po co. Szkoda Twojego czasu.
   B_StopProcessInfos   (self);
};


// ---------------------------alone----------------------------------------

FUNC VOID DIA_Guy_Rebel_Alone()
{
   B_GiveXP(250);
   buddler_join = buddler_join + 1;
   belief_Guy = true;
   AI_Output (other, self,"DIA_Guy_Rebel_Alone_15_00"); //Nie jeste� sam.
   AI_Output (self, other,"DIA_Guy_Rebel_Alone_03_01"); //O czym Ty m�wisz?
   AI_Output (other, self,"DIA_Guy_Rebel_Alone_15_02"); //S� inni, kt�rzy maj� do�� stra�nik�w. Wi�c jak b�dzie?
   AI_Output (self, other,"DIA_Guy_Rebel_Alone_03_03"); //Inni? I oni chc� walczy�?
   AI_Output (other, self,"DIA_Guy_Rebel_Alone_15_04"); //Nie tylko walczy�, ale i zwyci�y�. Dni stra�nik�w s� ju� policzone.
   AI_Output (self, other,"DIA_Guy_Rebel_Alone_03_05"); //Ja... Ja te� stan� u waszego boku. Porozmawiam z innymi kopaczami.
   AI_Output (other, self,"DIA_Guy_Rebel_Alone_15_06"); //S�uszna decyzja.
   B_LogEntry      (CH3_RBL_Buddler, "Guy zgodzi� si� stan�� przeciwko stra�nikom.");
   B_StopProcessInfos   (self);
}; 
