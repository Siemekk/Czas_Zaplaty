
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Pluskwa_Exit (C_INFO)
{
	npc			= Grd_4086_Pluskwa;
	nr			= 999;
	condition	= DIA_Pluskwa_Exit_Condition;
	information	= DIA_Pluskwa_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pluskwa_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Pluskwa_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Pluskwa_Hi (C_INFO)
{
	npc				= Grd_4086_Pluskwa;
	nr				= 1;
	condition		= DIA_Pluskwa_Hi_Condition;
	information		= DIA_Pluskwa_Hi_Info;
	permanent		= 0;
	important		= 1;
	description		= "Czym si� zajmujesz?"; 
};

FUNC INT DIA_Pluskwa_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_Pluskwa_Hi_Info()
{
	AI_Output (other, self, "DIA_Pluskwa_Hi_15_01"); //Czym si� zajmujesz?
	AI_Output (self, other, "DIA_Pluskwa_Hi_11_02"); //G�wno Ci� to obchodzi, sp�ywaj z fekaliami.
	B_StopProcessInfos(self);
};

INSTANCE DIA_Pluskwa_First (C_INFO)
{
	npc				= Grd_4086_Pluskwa;
	nr				= 2;
	condition		= DIA_Pluskwa_First_Condition;
	information		= DIA_Pluskwa_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pluskwa_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Wolf_RBL1))
	{
		return 1;
	};
};

FUNC VOID DIA_Pluskwa_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);
   
	AI_Output (self, other, "DIA_Pluskwa_First_11_01"); //Nasz Wilczek ma nowego przyjaciela? Czego tu szukasz przyb��do?
	AI_Output (other, self, "DIA_Pluskwa_First_15_02"); //Chcia�em kupi� �uk.
	AI_Output (self, other, "DIA_Pluskwa_First_11_03"); //Nie znam Ci�...
	
   var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
	
   if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other, "DIA_Pluskwa_First_11_04"); //Zbroja stra�nika jeszcze Ci� nim nie czyni, je�eli wiesz o czym m�wi�.
	};
   
	AI_Output (other, self, "DIA_Pluskwa_First_15_05"); //Jedyne co mnie interesuje to �uk i strza�y. 
	AI_Output (self, other, "DIA_Pluskwa_First_11_06"); //Dobra, znaj �ask� pana. Kupuj i nie miel j�zorem z tym wsza�em, bo Ci go utn� przy samej dupie!
	
   B_StopProcessInfos(self);
};
// **************************************************

func void B_ExchangeRoutine_Pluskwa()
{
   B_LogEntry(CH4_NC_RBLBosses, "No to Pluskw� mam z g�owy. Czas w spokoju porozmawia� z Wilkiem.");
	B_StopProcessInfos(Grd_4086_Pluskwa);	

	/*****************
		Startowa rutyna pluska ma by� taka, �e ca�y czas stoi przy wolfie, w nocy stroi przed jego chat�, albo siedzi.
		Ta go zmienia to, niech idzie do karczmy i tam ca�y czas chleje czy co� tam
		*****************/
	
	Npc_ExchangeRoutine(Grd_4086_Pluskwa, "go");
};

INSTANCE DIA_Pluskwa_Again (C_INFO)
{
	npc				= Grd_4086_Pluskwa;
	nr				= 3;
	condition		= DIA_Pluskwa_Again_Condition;
	information		= DIA_Pluskwa_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pluskwa_Again_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Wolf_RBL2))
	{
		return 1;
	};
};

FUNC VOID DIA_Pluskwa_Again_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Pluskwa_Again_11_01"); //Wystarczy ju� tego kupowania. Zejd� mi z oczu.
	AI_Output (other, self, "DIA_Pluskwa_Again_15_02"); //Co� Ty taki nerwowy?
	AI_Output (self, other, "DIA_Pluskwa_Again_11_03"); //Nie Twoja sprawa. Spierdalaj!

	Info_ClearChoices (DIA_Pluskwa_Again);
	Info_AddChoice (DIA_Pluskwa_Again, "Powiniene� co� wypi�.", DIA_Pluskwa_Again_Drink);
	Info_AddChoice (DIA_Pluskwa_Again, "Zdaje si�, �e porz�dny wpierdol dobrze Ci zrobi!", DIA_Pluskwa_Again_Kill);
	Info_AddChoice (DIA_Pluskwa_Again, "Uwa�aj na to, co m�wisz.", DIA_Pluskwa_Again_Fear);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Kill()
{
	if (plusk_angry == FALSE)
	{
		AI_Output (other, self, "DIA_Pluskwa_Again_Kill_15_00"); //Zdaje si�, �e porz�dny wpierdol dobrze Ci zrobi!
	}
	else
	{
		AI_Output (other, self, "DIA_Pluskwa_Again_Kill_15_01"); //Wypruj� Ci flaki!
	};
   
	AI_Output (self, other, "DIA_Pluskwa_Again_Kill_11_02"); //O prosz�, trafi� si� jaki� idiota.
	AI_Output (self, other, "DIA_Pluskwa_Again_Kill_11_03"); //Ch�opaki, czas na rozrywk�!

	/*****************
		Ork chodzi o to, �eby rzucili si� na niego okoliczni stra�nicy, dick nie powinien tego prze�y� ;P
		*****************/

	B_StopProcessInfos(self);					
	B_IntruderAlert(self, other);
	B_SetAttackReason(self, AIV_AR_INTRUDER);
	B_StartAfterDialogFight(self,other,true);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Fear()
{
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_15_01"); //Uwa�aj na to, co m�wisz.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_11_02"); //A co mi zrobisz z�amasie?
	
   plusk_angry = TRUE;
	Info_ClearChoices (DIA_Pluskwa_Again);
   
	if (Npc_KnowsInfo (hero, DIA_Hrabia_Ore))||(Npc_KnowsInfo (hero, DIA_Hrabia_Trap))
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Znam kogo�, kto nie b�dzie tak cierpliwy.", DIA_Pluskwa_Again_Fear_Know);
	};
   
	Info_AddChoice (DIA_Pluskwa_Again, "Wypruj� Ci flaki!", DIA_Pluskwa_Again_Kill);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Fear_Know()
{
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_15_01"); //Znam kogo�, kto nie b�dzie tak cierpliwy.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_11_02"); //Pewnie twoja stara, he, he.


	Info_ClearChoices (DIA_Pluskwa_Again);
   
	if (Npc_KnowsInfo (hero, DIA_Hrabia_Ore))||(Npc_KnowsInfo (hero, DIA_Hrabia_Trap))
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Chyba rzeczywi�cie pogadam z Hrabi�...", DIA_Pluskwa_Again_Fear_Know_Hrabia);
	};
	if (Npc_KnowsInfo (hero, DIA_Fletcher_Hello))
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Powiem o wszystkim Fletcherowi!", DIA_Pluskwa_Again_Fear_Know_Flet);
	};
   
	Info_AddChoice (DIA_Pluskwa_Again, "Wypruj� Ci flaki!", DIA_Pluskwa_Again_Kill);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Fear_Know_Hrabia()
{
	plusk_fear = TRUE;
   
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_01"); //Chyba rzeczywi�cie pogadam z Hrabi�...
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_02"); //Co?! Zaczekaj! Nie wiedzia�em, �e znasz szefa.
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_03"); //Przecie� szefem jest Fletcher.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_04"); //Ten nad�ty b�cwa� to tylko marionetka, za sznurki poci�ga Hrabia.
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_05"); //Mamy wi�c wsp�lnych znajomych.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_06"); //Co proponujesz?
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_07"); //Dasz spok�j Wilkowi, a ja zapomn� o twojej nadgorliwo�ci.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_08"); //To nie takie proste...
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_09"); //Kto kaza� Ci pilnowa� Wilka?
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_10"); //Fletcher.
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_11"); //A kim on jest?
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_12"); //Racja. Dobra, co� wymy�l�. Tylko napomknij o mnie Hrabiemu!
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_13"); //Mo�esz by� pewien, �e nie omieszkam.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_14"); //Wypij� za to!
	
   Npc_ExchangeRoutine	(self, "GO");	
  	B_StopProcessInfos(self);	
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Fear_Know_Flet()
{
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Flet_15_01"); //Powiem o wszystkim Fletcherowi!
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Flet_11_02"); //A m�w sobie, ten cie� mo�e mi naskoczy�.
	B_StopProcessInfos(self);	
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Drink()
{
	AI_Output (other, self, "DIA_Pluskwa_Again_Drink_15_01"); //Powiniene� co� wypi�.
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_11_02"); //A masz co� godnego mojego podniebienia?

	Info_ClearChoices (DIA_Pluskwa_Again);
   
	if (NPC_HasItems(other,ItFoBooze)>=4)
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Mam kilka ry��wek.", DIA_Pluskwa_Again_Drink_Rice);
	};
	if (NPC_HasItems(other,ItFoBeer)>=6)
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Co powiesz na kilka piwek?", DIA_Pluskwa_Again_Drink_Beer);
	};
	if (NPC_HasItems(other,ItFo_Addon_Rum)>=2)
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Lubisz rum?", DIA_Pluskwa_Again_Drink_Rum);
	};
	if (NPC_HasItems(other,ItFo_Addon_Grog)>=1)
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Mam co� specjalnego!", DIA_Pluskwa_Again_Drink_Grog);
	};

	Info_AddChoice (DIA_Pluskwa_Again, "Wypruj� Ci flaki!", DIA_Pluskwa_Again_Kill);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Drink_Rice()
{
	plusk_drink = TRUE;
   
	AI_Output (other, self, "DIA_Pluskwa_Again_Drink_Rice_15_01"); //Mam kilka ry��wek.
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Rice_11_02"); //Chcesz mnie skusi� tymi szczynami?
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Rice_11_03"); //Dobra, niech b�dzie. Dawaj ry��wki i zejd� mi z drogi!
	B_GiveInvItems (self, other, ItFoBooze, 4);
	
   Npc_ExchangeRoutine	(self, "GO");	
   	B_StopProcessInfos(self);	
};

// -------------------------------------------------------------------
FUNC VOID DIA_Pluskwa_Again_Drink_Beer()
{
	plusk_drink = TRUE;
	
   AI_Output (other, self, "DIA_Pluskwa_Again_Drink_Beer_15_01"); //Co powiesz na kilka piwek?
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Beer_11_02"); //Dobre piwko nie jest z�e.
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Beer_11_03"); //Dawaj te siki i spadaj.
	
   B_GiveInvItems (self, other, ItFoBeer, 6);
  Npc_ExchangeRoutine	(self, "GO");
  	B_StopProcessInfos(self);	
};

// -------------------------------------------------------------------
FUNC VOID DIA_Pluskwa_Again_Drink_Rum()
{
	plusk_drink = TRUE;
	
   AI_Output (other, self, "DIA_Pluskwa_Again_Drink_Rum_15_01"); //Lubisz rum?
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Rum_11_02"); //Te� pytanie!
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Rum_11_03"); //Z ch�ci� przep�ukam gardzio�o...
	
   B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);
  Npc_ExchangeRoutine	(self, "GO");	
  	B_StopProcessInfos(self);	
};

// -------------------------------------------------------------------
FUNC VOID DIA_Pluskwa_Again_Drink_Grog()
{
	plusk_drink = TRUE;
	
   AI_Output (other, self, "DIA_Pluskwa_Again_Drink_Grog_15_01"); //Mam co� specjalnego!
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Grog_11_02"); //Butelkowany mocz ork�w?
	AI_Output (other, self, "DIA_Pluskwa_Again_Drink_Grog_15_03"); //Chcia�by�... Co powiesz na grog?
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Grog_11_04"); //Cz�owieku to� mi brat!
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Grog_11_05"); //Id� wypi� Twoje zdrowie, bywaj.
	
   B_GiveInvItems (self, other, ItFo_Addon_Grog, 1);
  Npc_ExchangeRoutine	(self, "GO");	
  	B_StopProcessInfos(self);	
};
