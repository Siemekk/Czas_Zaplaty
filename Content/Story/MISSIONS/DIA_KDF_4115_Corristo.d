// **************************************************
// 						 EXIT 
// **************************************************
var int Corristo_dead;

instance  DIA_Coristo_Exit (C_INFO)
{
	npc			=  KDF_4115_Corristo;
	nr			=  999;
	condition	=  DIA_Coristo_Exit_Condition;
	information	=  DIA_Coristo_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Coristo_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_Coristo_Exit_Info()
{
	B_StopProcessInfos(self);
};

/*********************
Gomez ma kl�cze� w komnacie i b�aga� Coristo o pomoc, ale raczej ma pecha. Czarny Mag go zabije i zacznie gada� z Dickiem.
**********************/

//--------------------------------------------------------------------------
// 					
//--------------------------------------------------------------------------
instance  DIA_Coristo_Hi (C_INFO)
{
	npc				= KDF_4115_Corristo;
	condition		= DIA_Coristo_Hi_Condition;
	information		= DIA_Coristo_Hi_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int  DIA_Coristo_Hi_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Cav_DungeonInside1111))&&(Npc_GetDistToNpc(self,hero) < 2000)
	{
		return TRUE;
	};
};

FUNC void  DIA_Coristo_Hi_Info()
{
	var C_NPC gom;	gom = Hlp_GetNpc(EBR_4114_GomezD);

	//B_FullStop (hero);
	AI_TurnToNpc(self, gom);

	AI_Output (self, other,"DIA_Coristo_Hi_Info_14_01"); //�miesz prosi� MNIE o pomoc?
	AI_PlayAni(gom,"T_YES");
	AI_Output (self, other,"DIA_Coristo_Hi_Info_14_02"); //Gomez, jeste� jak w�ciek�y pies, kt�ry gryzie r�k� w�asnego Pana!
	AI_Output (self, other,"DIA_Coristo_Hi_Info_14_03"); //Zawiod�e� mnie, nie jeste� mi ju� potrzebny...
	
   B_LogEntry(CH6_RBL_PayDay, "Odnalaz�em Gomeza, ale nie by�em pierwszy w kolejce do zabijania. Chyba mam nie�le przechlapane...");
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, self, 1, 0, DAM_MAGIC, FALSE);	
	AI_PlayAni(gom, "T_PSI_VICTIM");
	Npc_ChangeAttribute(gom, ATR_HITPOINTS, -gom.attribute[ATR_HITPOINTS_MAX]);
   
   B_StopProcessInfos(self);
};  

//--------------------------------------------------------------------------
instance DIA_Coristo_Dick (C_INFO)
{
	npc				= KDF_4115_Corristo;
	condition		= DIA_Coristo_Dick_Condition;
	information		= DIA_Coristo_Dick_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int DIA_Coristo_Dick_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Coristo_Hi))&&(Npc_GetDistToNpc(self,hero) < 2000)
	{
		return TRUE;
	};
};

FUNC void DIA_Coristo_Dick_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_01"); //Zbli� si�, rebeliancie.
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_02"); //Powiedz mi, dlaczego Gomez tak si� Ciebie obawia�, �e zawar� ze mn� pakt?
	AI_Output (other, self,"DIA_Coristo_Dick_Info_15_03"); //Kim Ty jeste�?
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_04"); //Kiedy� by�em magiem ognia, zwa�em si� Corristo. Wybra�em drog� Xardasa, posmakowa�em nekromancji i zmusi�em Gomeza do pos�usze�stwa.
	AI_Output (other, self,"DIA_Coristo_Dick_Info_15_05"); //To dlatego jego decyzje wydawa�y si� tak... chaotyczne. Dlaczego zabi� twych braci?
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_06"); //Braci? Byli za s�abi i zbyt aroganccy. Pozostali wierni Innosowi i to by� ich b��d.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_07"); //Posiad�em pot�g�, kt�ra... Co si� dzieje?! NIE!
	AI_PlayAni		(self,	"T_PSI_VICTIM");
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_08"); //ZAMILKNIJ BEZCZELNY ROBAKU. JESTE� TYLKO NARZ�DZIEM. TO TY �MIERTELNA ISTOTO ZWR�CI�A� MOJ� UWAG�.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_09"); //DOSTRZEGAM W TOBIE WIELKIE MO�LIWO�CI. JE�ELI ZECHCESZ, KR�LESTWA PADN� U TWYCH ST�P, A ZIEMIA SP�YNIE KRWI� TWYCH WROG�W.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_10"); //STA� U MEGO BOKU, A B�DZIESZ W�ADA� �WIATEM �MIERTELNIK�W!
	AI_Output (other, self,"DIA_Coristo_Dick_Info_15_11"); //Kim jeste�?
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_12"); //JESTEM AWATAREM BELIARA, UPAD�YM W�ADC�, KT�RY UNU�A� PRZED WIEKAMI �WIAT LUDZI W KRWI I OGNIU.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_13"); //TEN CZ�OWIEK CHCIA� POSI��� ZBYT WIELK� MOC, KT�RA NIM W KO�CU ZAW�ADNʣA. TO DZI�KI NIEMU DOSZED�E� A� TUTAJ, A JEGO POCZYNANIAMI KIEROWA�A MA WOLA.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_14"); //GOMEZ I MAGNACI BYLI TYLKO NARZ�DZIAMI. JEDYNIE KRUK OKAZA� SI� GODNYM UWAGI MEGO PANA. I TY MO�ESZ P�J�� T� DROG�.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_15"); //CO WYBIERZESZ �MIERTELNA ISTOTO?
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_16"); //POT�G�, W�ADZ� I WIECZNE �YCIE, CZY BOLESN� �MIER� Z MOICH R�K?
	AI_Output (other, self,"DIA_Coristo_Dick_Info_15_17"); //Nie jestem idiot�. Ka�dy cz�owiek jest Ci potrzebny tylko do osi�gni�cia okre�lonego celu.
	AI_Output (other, self,"DIA_Coristo_Dick_Info_15_18"); //P�niej pozbywasz si� takich jak ja, tak jak wyrzuca si� zu�yte onuce.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_19"); //NIE KA�DY TAK KO�CZY. NAJSILNIEJSI TRWAJ� I WYPE�NIAJ� WOL� BELIARA PO WSZE CZASY.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_20"); //DECYDUJ, CZ�OWIEKU I NIE TRWO� MEGO CZASU!

   /***************
   Wsadzamy Nekrosa, wejdzie we w�a�ciwym momencie...

   ****************/

	Wld_InsertNpc(Non_4116_Nekroman,"DUNG_TRAP51");
   
	Info_ClearChoices (DIA_Coristo_Dick);
	Info_AddChoice (DIA_Coristo_Dick, "W�adza, bogactwa... Tak, pod��� �cie�k� Beliara.", DIA_Coristo_Dick_Yes);
	Info_AddChoice (DIA_Coristo_Dick, "Nie dam si� omota� �adnemu bogu!", DIA_Coristo_Dick_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Coristo_Dick_Yes()
{
	var C_NPC nek;	nek = Hlp_GetNpc(Non_4116_Nekroman);
	necro_appear = 1;
	AI_Output (other, self,"DIA_Coristo_Dick_Yes_Info_15_01"); //W�adza, bogactwa. Tak, pod��� �cie�k� Beliara.
	AI_Output (self, other,"DIA_Coristo_Dick_Yes_Info_14_02"); //M�DRZE WYBRA�E�. A TERAZ...
	AI_TurnToNpc(self, nek);
	AI_Output (self, other,"DIA_Coristo_Dick_Yes_Info_14_03"); //TY?! JAK �MIESZ TU PRZYCHODZI�...
	AI_Output (self, other,"DIA_Coristo_Dick_Yes_Info_14_04"); //NIE!

	/**********************
Ork mo�esz to zrobi� bardziej spektakularnie, wchodzi nekro, rzuca jaki� fajny spell i coristo szlag trafia

***********************/

	Corristo_dead = true;

	B_LogEntry(CH6_RBL_PayDay, "Wybra�em drog� Beliara, w ko�cu czego si� nie robi dla w�adzy i bogactw? Ale co� mi m�wi, �e �le zrobi�em.");
	B_StopProcessInfos(self);
};	

// ---------------------------No----------------------------------------

FUNC VOID DIA_Coristo_Dick_No()
{
	necro_appear = 2;
	AI_Output (other, self,"DIA_Coristo_Dick_No_Info_15_01"); //Nie dam si� omota� �adnemu bogu!
	AI_Output (self, other,"DIA_Coristo_Dick_No_Info_14_02"); //TO B�DZIE BOLESNA �MIER�!
   
	B_LogEntry(CH6_RBL_PayDay, "Sprzeciwi�em si� awatorowi samego Beliara. To chyba b�dzie bola�o...");
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);
};

//--------------------------------------------------------------------------
instance  DIA_Coristo_DickDead (C_INFO)
{
	npc				= KDF_4115_Corristo;
	condition		= DIA_Coristo_DickDead_Condition;
	information		= DIA_Coristo_DickDead_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int  DIA_Coristo_DickDead_Condition()
{	
	/*****************
   Zagada jak dick b�dzie mia� 1/10 ca�ego hp - nie wiem czy dobrze to zrobi�em ;P

   ****************/

	if (necro_appear == 3)
	{
		return TRUE;
	};
};
FUNC void  DIA_Coristo_DickDead_Info()
{
	var C_NPC nek;	nek = Hlp_GetNpc(Non_4116_Nekroman);
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Coristo_DickDead_Info_14_01"); //JESTE� S�ABSZY NI� MY�LA�EM...
	AI_TurnToNpc(self, nek);
	AI_Output (self, other,"DIA_Coristo_DickDead_Info_14_02"); //TY?! JAK �MIESZ TU PRZYCHODZI�...
	AI_Output (self, other,"DIA_Coristo_DickDead_Info_14_03"); //NIE!

	/**********************
Ork mo�esz to zrobi� bardziej spektakularnie, wchodzi nekro, rzuca jaki� fajny spell i coristo szlag trafia

***********************/

	Corristo_dead = true;
   
	B_StopProcessInfos(self);
};

instance DIA_Corirsto_Dead (C_INFO)
{
	npc				= KDF_4115_Corristo;
	condition		= DIA_Corirsto_Dead_Condition;
	information		= DIA_Corirsto_Dead_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int DIA_Corirsto_Dead_Condition()
{	
	return Corristo_dead;
};

FUNC void DIA_Corirsto_Dead_Info()
{
   AI_PlayAni(self, "T_PSI_VICTIM");
	Wld_PlayEffect("spellFX_INCOVATION_BLUE", self, self, 1, 0, DAM_MAGIC, FALSE);	
	Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
	B_StopProcessInfos(self);
   B_StopProcessInfos(other);
};  
/*
TODO:
Moja wersja, cinematic koniecznie szybko sprawdzic dzialanie PrintDialog
1.Wchodzimy do komnaty
2.Widzimy Corristo i gomeza, gomeza zabija corristo
3.Corristo zaczyna z nami rozmowe
4.Wybieramy drog� - nekro wpada odrazu albo...
5.Corristo zaczyna nasz atakowa� zdejmuje nam 2ma czarami staly damage do okrl liczby hp
6.Po drugim czarze corristo zagaduje nas ponownie, kiedy chce rzucic czar wpada nekro i go zabija
7.Rozmowa z nekro...
Ein moment, wtedy cinematic aragorna nie mial by sensu(2 wybory) - do obgadania
*/
