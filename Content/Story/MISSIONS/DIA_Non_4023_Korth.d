
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Korth_Exit (C_INFO)
{
	npc			= Non_4023_Korth;
	nr			= 999;
	condition	= DIA_Korth_Exit_Condition;
	information	= DIA_Korth_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Korth_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Korth_Exit_Info()
{
	B_StopProcessInfos	( self );
};

var int Korth_ok;
var int Korth_know;
var int Korth_warn;

// **************************************************
// 				
// **************************************************

INSTANCE DIA_Korth_Hello (C_INFO)
{
	npc				= Non_4023_Korth;
	nr				= 2;
	condition		= DIA_Korth_Hello_Condition;
	information		= DIA_Korth_Hello_Info;
	permanent		= 1;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Korth_Hello_Condition()
{
	//todo: ok, but check onceagain
	if (Korth_ok==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Korth_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Korth_Hello_11_01"); //Czego tu szukasz?
	
   if (TH_hero_knowpwd == TRUE)
	{
		if (Korth_know==FALSE)
		{
			Korth_know=TRUE;
			AI_DrawWeapon (self);
			
         AI_Output (other, self,"DIA_Korth_Hello_15_02"); //Rozmawia�em z Leafem. Podobno was zna.
			AI_Output (self, other,"DIA_Korth_Hello_11_03"); //Leaf? Tak, by� tu kilka razy.
			AI_Output (self, other,"DIA_Korth_Hello_11_04"); //Ale �eby wej�� musisz zna� has�o.
			AI_RemoveWeapon (self);
		}
		else
		{	
			AI_Output (self, other,"DIA_Korth_Hello_11_05"); //To jak b�dzie z tym has�em? Znasz je czy nie?
		};
	}
	else
	{
		if (Korth_warn==FALSE)
		{
			Korth_warn = TRUE;
			AI_DrawWeapon (self);
         
			AI_Output (other, self,"DIA_Korth_Hello_15_06"); //Witaj. Co to za miejsce?
			AI_Output (self, other,"DIA_Korth_Hello_11_07"); //Miejsce, w kt�rym nikt nie lubi obcych - spadaj.
		}
		else
		{
			AI_DrawWeapon (self);
         
			AI_Output (other, self,"DIA_Korth_Hello_15_08"); //Chcia�em tylko...
			AI_Output (self, other,"DIA_Korth_Hello_11_09"); //Powiedzia�em zje�d�aj st�d!
		};
      
		AI_RemoveWeapon (self);
		B_StopProcessInfos	(self);
		AI_GotoWP		(other, "OW_PATH_185");
	};

	if (TH_hero_knowpwd == TRUE)
	{
		Info_ClearChoices (DIA_Korth_Hello);
		Info_AddChoice (DIA_Korth_Hello, "'Nigdy nie odwracaj si� ty�em do stra�nika'.", Korth_Hello_1);
		Info_AddChoice (DIA_Korth_Hello, "'�ycie up�ywa w strugach g�wna'.", Korth_Hello_2);
		Info_AddChoice (DIA_Korth_Hello, "'Gomez woli owce'.", Korth_Hello_3);
		Info_AddChoice (DIA_Korth_Hello, "'Dobry troll, to martwy troll'.", Korth_Hello_4);
	}
	else
	{
		Info_AddChoice (DIA_Korth_Hello, "To ja ju� sobie p�jd�.", Korth_Hello_5);
	};
};

// ---------------------------1----------------------------------------

FUNC VOID Korth_Hello_1()
{
	Korth_ok = TRUE; //hero entered camp
	AI_Output (other,self,"Korth_Hello_1_Info_15_01"); //'Nigdy nie odwracaj si� ty�em do stra�nika'.
	AI_Output (self, other,"Korth_Hello_1_Info_11_02"); //�wi�te s�owa, bo on mo�e woli ch�opc�w, he, he. �apisz? Ty�em...
	AI_Output (self, other,"Korth_Hello_1_Info_11_03"); //Niewa�ne, w�a�. Tylko uwa�aj na siebie, nikt tu nie przepada za obcymi.
	
   B_LogEntry		(CH2_Rbl_BlackTroll, "Uda�o mi si� wej�� do obozu �owc�w trolli. Ale to by�a ta �atwiejsza cz��.");
	Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
	B_SetTimedATT(self,30*events_per_sec,(-70),(-70),(-100));		
};

// ------------------2----------------

FUNC VOID Korth_Hello_2()
{
	AI_Output (other,self,"Korth_Hello_2_Info_15_01"); //'�ycie up�ywa w strugach g�wna'.
	AI_Output (self, other,"Korth_Hello_2_Info_11_02"); //Racja, ale nie o to pyta�em.
	
   AI_GotoWP		(other, "OW_PATH_185");
	Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
};

// ------------------3----------------

FUNC VOID Korth_Hello_3()
{
	AI_Output (other,self,"Korth_Hello_3_Info_15_01"); //'Gomez woli owce'.
	AI_Output (self, other,"Korth_Hello_3_Info_11_02"); //He, he, ano jego wyb�r. Ale to nie has�o.
	
   AI_GotoWP		(other, "OW_PATH_185");
	Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
};

// ------------------4----------------

FUNC VOID Korth_Hello_4()
{
	AI_Output (other,self,"Korth_Hello_4_Info_15_01"); //'Dobry troll, to martwy troll'.
	AI_Output (self, other,"Korth_Hello_4_Info_11_02"); //�wi�ta prawda! Tylko, �e to nie has�o.
	
   AI_GotoWP		(other, "OW_PATH_185");
	Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
};

// -----------------5----------------

FUNC VOID Korth_Hello_5()
{
	AI_Output (other,self,"Korth_Hello_5_Info_15_01"); //To ja ju� sobie p�jd�.
	AI_Output (self, other,"Korth_Hello_5_Info_11_02"); //To chyba najlepszy pomys�.
	
   AI_GotoWP		(other, "OW_PATH_185");
	Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
};	

// **************************************************

INSTANCE DIA_Korth_Hello1 (C_INFO)
{
	npc				= Non_4023_Korth;
	nr				= 3;
	condition		= DIA_Korth_Hello1_Condition;
	information		= DIA_Korth_Hello1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobre miejsce na ob�z."; 
};

FUNC INT DIA_Korth_Hello1_Condition()
{
	if (Korth_ok == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Korth_Hello1_Info()
{
	AI_Output (other, self,"DIA_Korth_Hello1_15_01"); //Dobre miejsce na ob�z.
	AI_Output (self, other,"DIA_Korth_Hello1_11_02"); //Dobre jak ka�de inne. Nie lubimy, jak si� nam obcy pod nosem pa��taj�.
	AI_Output (other, self,"DIA_Korth_Hello1_15_03"); //Rozumiem.
	AI_Output (self, other,"DIA_Korth_Hello1_11_04"); //Chyba jednak nie rozumiesz, skoro z Tob� rozmawiam. Zejd� mi z drogi ch�opcze i dobrze Ci radz�, uwa�aj na to co m�wisz.
	AI_Output (other, self,"DIA_Korth_Hello1_15_05"); //Zapami�tam.
	
   B_StopProcessInfos	(self);
};

var int korth_day;

// **************************************************

INSTANCE DIA_Korth_Dick (C_INFO)
{
	npc				= Non_4023_Korth;
	nr				= 4;
	condition		= DIA_Korth_Dick_Condition;
	information		= DIA_Korth_Dick_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Korth_Dick_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Bukhart_Thief))&&(Npc_KnowsInfo (hero,DIA_Snow_Find))
	{
		return 1;
	};
};

FUNC VOID DIA_Korth_Dick_Info()
{
	if (snow_know == TRUE)
	{
		B_FullStop (hero);
		AI_Output (self, other,"DIA_Korth_Dick_11_01"); //Podejd� no tu �achmyto!
		AI_GotoNpc(other,self);
		AI_Output (self, other,"DIA_Korth_Dick_11_02"); //Zdaje si�, �e kto� ma za d�ugi ozor! Z ch�ci� bym go skr�ci�, ale Kira urwa�aby mi za to nogi przy samej dupie.
		AI_Output (other, self,"DIA_Korth_Dick_15_03"); //Spokojnie. Mam pewn� propozycj�.
	}
	else
	{
		AI_Output (self, other,"DIA_Korth_Dick_11_04"); //Bukhart powiedzia�, �e zaskoczy�e� go w magazynku. 
		AI_Output (self, other,"DIA_Korth_Dick_11_05"); //Ciesz� si�, �e zatrzyma�e� nasze... motywy dla siebie.
		AI_Output (other, self,"DIA_Korth_Dick_15_06"); //Mam pewn� propozycj�.
	};
   
	AI_Output (self, other,"DIA_Korth_Dick_11_07"); //M�w.
	AI_Output (other, self,"DIA_Korth_Dick_15_08"); //Wam brakuje trunk�w, a ja musz� udowodni� Kirze, �e nadaj� si� do tego i owego.
	AI_Output (self, other,"DIA_Korth_Dick_11_09"); //Hmm, dobry pomys�. Nie ma sprawy, wstawi� si� za Tob�, jak przyniesiesz zapasik na co najmniej tydzie�.
	AI_Output (other, self,"DIA_Korth_Dick_15_10"); //Ile tego ma by�?
	AI_Output (self, other,"DIA_Korth_Dick_11_11"); //Powiedzmy, �e 30 piw, 10 win i 10 ry��wek. Powinno wystarczy� na jaki� czas.
	AI_Output (other, self,"DIA_Korth_Dick_15_12"); //To ma by� zapas na tydzie�? Ju� nie dziwi� si� Kirze, �e zakaza�a wam pi�.
	AI_Output (self, other,"DIA_Korth_Dick_11_13"); //Nie m�drkuj, tylko rusz ty�ek. Zasch�o mi w gardle...
	AI_Output (self, other,"DIA_Korth_Dick_11_14"); //I niech Ci to nie zajmie wieczno�ci. Masz cztery dni, potem nakopi� Ci do ty�ka.
	
   korth_day = B_SetDayTolerance()+4;
	Log_CreateTopic	(CH2_TRL_Drinks, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Drinks, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Drinks, "Zawar�em z Korthem uk�ad. Dostarcz� mu zapas gorza�y na tydzie�: 30 piw, 10 win i 10 ry��wek, a on wstawi si� za mn� przed Kir�. Mam na to cztery dni.");

	B_StopProcessInfos	(self);
};

var int korth_check;

// **************************************************

INSTANCE DIA_Korth_DickEnd (C_INFO)
{
	npc				= Non_4023_Korth;
	nr				= 5;
	condition		= DIA_Korth_DickEnd_Condition;
	information		= DIA_Korth_DickEnd_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam gorza��."; 
};

FUNC INT DIA_Korth_DickEnd_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Korth_Dick))&&(!korth_check)//&&(korth_day <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID DIA_Korth_DickEnd_Info()
{
	AI_Output (other, self,"DIA_Korth_Dick_15_01"); //Mam gorza��.
	
   if (korth_day >= Wld_GetDay())&&(NPC_HasItems(other,ItFoBeer)>=30)&&(NPC_HasItems(other,ItFoWine)>=10)&&(NPC_HasItems(other,ItFoBooze)>=10)
	{
		TH_trust = TH_trust + 1;
		korth_check = TRUE;
		B_GiveXP (500);
		AI_PlayAni ( self, "T_SEARCH");
		AI_TurnToNpc (self, other);
      
		AI_Output (self, other,"DIA_Korth_DickEnd_11_02"); //�wietna robota przyjacielu. Trzeba przyzna�, �e nie robisz sobie dupy z mordy.
		
      B_GiveInvItems (other, self, ItFoBeer,30);
		B_GiveInvItems (other, self, ItFoWine,10);
		B_GiveInvItems (other, self, ItFoBooze,10);
		
      AI_Output (other, self,"DIA_Korth_DickEnd_15_03"); //Zawsze dotrzymuj� s�owa. Mog� na Ciebie liczy�?
		AI_Output (self, other,"DIA_Korth_DickEnd_11_04"); //Pewnie, nie powiem na Ciebie z�ego s�owa, nawet jak Kira we�mie mnie na te swoje tortury, he, he.
		AI_Output (self, other,"DIA_Korth_DickEnd_11_05"); //Masz moje poparcie. A teraz pozwolisz, �e wypij� za Twoje zdrowie...
		
      AI_UseItem (self,ItFobeer);
		Log_SetTopicStatus	(CH2_TRL_Drinks, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Drinks, "Dostarczy�em Korthowi przesy�k� z gorza��. Zdoby�em uznanie �owcy i chyba co� jeszcze - przyjaci� nigdy za wiele.");
		B_LogEntry		(CH2_TRL_Quest, "Korth mnie poprze, ba, nawet wypije za moje zdrowie!");
	}
	else if (korth_day >= Wld_GetDay())&&(korth_check == FALSE)
	{
		AI_Output (self, other,"DIA_Korth_DickEnd_11_06"); //Chyba waln��e� si� w g�ow�. Wr�� z ca�ym zapasem albo wcale!
	};
   
   B_StopProcessInfos	(self); 
};

//Added by orc
INSTANCE DIA_Korth_DickEnd_TimesUP (C_INFO)
{
	npc				= Non_4023_Korth;
	nr				= 6;
	condition		= DIA_Korth_DickEnd_TimesUP_Condition;
	information		= DIA_Korth_DickEnd_TimesUP_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Korth_DickEnd_TimesUP_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Korth_Dick))&&(korth_day < Wld_GetDay())&&(!korth_check)
	{
		return 1;
	};
};

FUNC VOID DIA_Korth_DickEnd_TimesUP_Info()
{
	DIA_Korth_DickEnd.permanent = 0;
   
	AI_Output (self, other,"DIA_Korth_DickEnd_TimesUP_11_01"); //No prosz�, kogo to ja widz�?
	AI_Output (self, other,"DIA_Korth_DickEnd_TimesUP_11_02"); //To� to ta szumowina, kt�ra co� mi obieca�a!
	AI_Output (other, self,"DIA_Korth_DickEnd_TimesUP_15_03"); //Wynik�y pewne komplikacje...
	AI_Output (self, other,"DIA_Korth_DickEnd_TimesUP_11_04"); //Komplikacje powiadasz? C�, nie �ywi� urazy, powiem Kirze co z Ciebie za �ajno.
	AI_Output (self, other,"DIA_Korth_DickEnd_TimesUP_11_05"); //A to nagroda za Twoj� nieudolno��...
	
   Log_SetTopicStatus	(CH2_TRL_Drinks, LOG_FAILED);
	B_LogEntry		(CH2_TRL_Drinks, "Cholera wiedzia�em, �e o czym� zapomnia�em. Nie dostarczy�em Korthowi gorza�y w um�wionym czasie. Przed Kir� na pewno mnie nie poprze, a do tego chcia� mnie spra�.");
	B_LogEntry		(CH2_TRL_Quest, "Ola�em zlecenie od Kortha, wi�c poparcie z jego strony mi nie grozi.");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};
