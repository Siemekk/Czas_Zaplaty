
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_859_AIDAN_Exit (C_INFO)
{
	npc			= HUN_859_AIDAN;
	nr			= 999;
	condition	= DIA_HUN_859_AIDAN_Exit_Condition;
	information	= DIA_HUN_859_AIDAN_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_859_AIDAN_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_859_AIDAN_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_HUN_859_AIDAN_Hello (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 1;
	condition		= DIA_HUN_859_AIDAN_Hello_Condition;
	information		= DIA_HUN_859_AIDAN_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jeste�?"; 
};

FUNC INT DIA_HUN_859_AIDAN_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_859_AIDAN_Hello_Info()
{
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Hello_15_01"); //Kim jeste�?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_02"); //Przyrodnim bratem Rhobara. 
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_03"); //Zes�a� mnie do Kolonii, bo kr�lowa wola�a m�j... miecz, he, he.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_04"); //Jestem Aidan. My�liwy z zami�owania, kowal z konieczno�ci.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_05"); //Ale Ciebie widz� tu pierwszy raz. 
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Hello_15_06"); //Trafi�em do Kolonii kilka dni temu.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_07"); //To od razu wida�. Jaki� taki wypacykowany jeste�.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_08"); //U niekt�rych ch�opak�w mia�by� niez�e branie.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Hello_15_09"); //Mo�e i jestem nowy, ale nie zwyk�em znosi� obelg z ust pierwszego lepszego �achudry.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_10"); //A jednak �le Ci� oceni�em. Niech b�dzie, mo�e i pasujesz tu bardziej ni� ja.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_11"); //Dobra, po�miali�my si�, czas wraca� do pracy.
};

INSTANCE DIA_HUN_859_AIDAN_GoBring (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 2;
	condition		= DIA_HUN_859_AIDAN_GoBring_Condition;
	information		= DIA_HUN_859_AIDAN_GoBring_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jeste� tu jedynym kowalem?"; 
};

FUNC INT DIA_HUN_859_AIDAN_GoBring_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_GoBring_Info()
{
	var C_NPC garry; garry = Hlp_GetNpc(RBL_2605_GARRY);
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_01"); //Jeste� tu jedynym kowalem?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_02"); //Na to wygl�da.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_03"); //Jak znam �ycie, to nie przyszed�e� uci�� sobie mi�ej pogaw�dki bez powodu.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_04"); //Musz� przekona� Cavalorna, �e nadaj� si� na jednego z was.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_05"); //Aha. Czyli biegasz po obozie i robisz za kap�ana Adanosa.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_06"); //Tak si� sk�ada, �e mam co�, w czym mo�esz mi pom�c.
   
   if (Wld_IsTime (00,00,09,00))
   {
      AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_07"); //Mam problem z pewnym typkiem. Na razie go nie wida�, ale jak go zobaczysz od razu b�dziesz wiedzia�, �e to najwi�kszy partacz.
      AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_08"); //Co z nim nie tak?
   }
   else
   {
      AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_09"); //Widzisz tego idiot� Garrego?
      AI_TurnToNpc(other,garry);	
      AI_TurnToNpc(self,garry);	
      Ai_wait(hero,1);//Orc: 6 sekund to masa czasu!
      Ai_wait(self,1);//Orc: 6 sekund to masa czasu!
      AI_TurnToNpc(other,self);
      AI_TurnToNpc(self,other);	
      AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_10"); //Chyba lubi swoj� prac�?
      AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_11"); //Niestety. Ju� dawno nie widzia�em wi�kszego partacza.
   };
   
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_12"); //Garry nie zrobi� jeszcze ani jednego porz�dnego ostrza.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_13"); //Problem tkwi w tym, �e on uwa�a inaczej. Wydaje mu si�, �e wykuwa pierdolone dzie�a sztuki.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_14"); //Mo�e dam mu w �eb i zakopiemy �cierwo pod palisad�?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_15"); //Nieg�upi pomys�, ale Cavalorn urwa�by nam za to jaja.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_16"); //Wystarczy, �e nam�wisz go do zmiany profesji.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_17"); //Mog� spr�bowa�.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_18"); //Je�eli uda Ci si� uwolni� mnie od tego nieudacznika, to wstawi� si� za Tob� u Cavalorna.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_19"); //A teraz wracam do roboty.
	
   Log_CreateTopic(CH1_Rbl_AidanHelp, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_AidanHelp, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_AidanHelp, "Aidan jest kowalem. Zdaje si�, �e woli polowa�, ale miecze te� potrafi wykuwa�. Poprosi� mnie o to, �ebym przekona� jego pomocnika Garrego do zmiany profesji. Garry jest podobno strasznym nieudacznikiem i partaczy wszystko, co zrobi.");
};

INSTANCE DIA_Aidan_CanYouTeachMe (C_INFO)
{
	npc				=  HUN_859_AIDAN;
	nr				= 4;
	condition		= DIA_Aidan_CanYouTeachMe_Condition;
	information		= DIA_Aidan_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Aidan_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_HUN_859_AIDAN_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Aidan_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Aidan_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
   AI_Output (self, other, "DIA_Aidan_CanYouTeachMe_15_02"); //Jak chcesz mog� ci� co nieco nauczy� o kowalstwie.
   AI_Output (self, other, "DIA_Aidan_CanYouTeachMe_15_03"); //Ale ostrzegam! To bardzo ci�ka robota.
   AI_Output (self, other, "DIA_Aidan_CanYouTeachMe_15_04"); //Wiem te� jak wyci�� r�g, �eby go nie uszkodzi�.	
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Aidan jest kowalem i mo�e mnie naucza� swojego rzemios�a. Potrafi te� wyci�� r�g.");
};

INSTANCE DIA_HUN_859_AIDAN_GarryCome (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 3;
	condition		= DIA_HUN_859_AIDAN_GarryCome_Condition;
	information		= DIA_HUN_859_AIDAN_GarryCome_Info;
	permanent		= 0;
	important		= 0;
	description		= "Garry ju� nie b�dzie Ci bru�dzi�."; 
};

FUNC INT DIA_HUN_859_AIDAN_GarryCome_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_GoBring))&&(garry_out == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_GarryCome_Info()
{
	aidan_trust = TRUE;
	B_GiveXP(250);
	rebel_camp_trust = rebel_camp_trust + 1; 
   
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GarryCome_15_01"); //Garry ju� nie b�dzie Ci bru�dzi�.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GarryCome_11_02"); //Gdzie go zakopa�e�?
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GarryCome_15_03"); //Nigdzie. Po prostu stwierdzi�, �e ma ju� do�� ogl�dania Twojej paskudnej mordy.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GarryCome_11_04"); //�wietna robota. 
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GarryCome_15_05"); //Wi�c jak b�dzie? Co powiesz Cavalornowi?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GarryCome_11_06"); //Powiem, �e drugiego takiego jak Ty, to z pochodni� szuka�.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GarryCome_11_07"); //Masz moje poparcie, przyjacielu.
   
	Log_SetTopicStatus(CH1_Rbl_AidanHelp, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_AidanHelp, "Aidan by� bardzo rad kiedy us�ysza�, �e Garry ju� mu nie b�dzie przeszkadza�. Na pewno poprze mnie przed Cavalornem.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "Dzi�ki za�atwieniu problemu z Garrym, zdoby�em poparcie Aidana.");
};

var int aidan_sword;
var int aidan_smith;
var int aidan_jurnal;

INSTANCE DIA_HUN_859_AIDAN_Sword (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 4;
	condition		= DIA_HUN_859_AIDAN_Sword_Condition;
	information		= DIA_HUN_859_AIDAN_Sword_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam przesy�k� od �wistaka."; 
};

FUNC INT DIA_HUN_859_AIDAN_Sword_Condition()
{
	if (whistler_last_approve==TRUE)&&(NPC_HasItems(other,whistler_pack)>=1)&&(aidan_smith == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_Sword_Info()
{
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword_15_01"); //Mam przesy�k� od �wistaka.

	if (Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_GarryCome))
	{
		//TODO: USTAWIANIE W TEN SPOSOB PERMAMENT NIE DZIALA - DO ZROBIENIA BEDA OSOBNE DIALOGI!!! PO SAVIE I LOADZIE ODPALA SIE DIALOG JESZCZE RAZ NAWET JEZELI PERMAMENT JEST FALSE.
		DIA_HUN_859_AIDAN_Sword.permanent = 0;
		aidan_smith = TRUE;
		
      AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_02"); //Co to za z�om?
		AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword_15_03"); //Sk�adniki niezb�dne do wykucia miecza jego marze�.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_04"); //Dobra daj to.  
		
      B_GiveInvItems (other, self, whistler_pack, 1);
		Npc_RemoveInvItems(self,whistler_pack,1);
		
      AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_05"); //Pomog�e� mi pozby� si� Garrego, wi�c odwdzi�cz� si� podobn� monet�.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_06"); //Nie wezm� od Ciebie nawet bry�ki rudy za wykucie tego �wiecide�ka.
		AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword_15_07"); //�wiecide�ka?
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_08"); //No c�, miecze wykuwane dla �wistaka rzadko wygl�daj� jak... miecze.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_09"); //Najcz�ciej s� to wymuskane b�yskotki, na kt�rych prawdziwy wojownik nawet nie zawiesi wzroku.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_10"); //Ale �wistak dobrze p�aci za swoje dziwactwa, wi�c wykuwam wszystko, co sobie ubzdura.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_11"); //Wr�� jutro, wtedy miecz b�dzie gotowy.
		
      aidan_sword = B_SetDayTolerance()+1;
		B_LogEntry(CH1_Rbl_Sword, "Aidan zgodzi� si� wyku� dla mnie pawie pi�ro, ale zrobi� to tylko ze wzgl�du na przys�ug�, kt�r� mu wy�wiadczy�em, namawiaj�c Garrego do zmiany profesji. Mam wr�ci� po miecz na drugi dzie�.");
	}
	else
	{
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_12"); //To �wietnie, ale nie wykuj� �adnego miecza, dop�ki Garry t�pi mi ose�k�.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_13"); //Pozb�d� si� Garrego, to wtedy pogadamy.	
		
      if (aidan_jurnal == FALSE)
		{
			aidan_jurnal = TRUE;	
			B_LogEntry(CH1_Rbl_Sword, "Aidan nie wykuje �adnego miecza, dop�ki nie pomog� mu rozwi�za� problemu z Garrym.");
		};
	};
};

INSTANCE DIA_HUN_859_AIDAN_Sword12 (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 4;
	condition		= DIA_HUN_859_AIDAN_Sword12_Condition;
	information		= DIA_HUN_859_AIDAN_Sword12_Info;
	permanent		= 0;
	important		= 0;
	description		= "Sko�czy�em z Garrym."; 
};

FUNC INT DIA_HUN_859_AIDAN_Sword12_Condition()
{
	if (whistler_last_approve)&&(NPC_HasItems(other, whistler_pack)>=1)&&(!aidan_smith)&&(aidan_jurnal)&&(aidan_trust)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_Sword12_Info()
{
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword12_15_01"); //Sko�czy�em z Garrym. Pomo�esz mi ze zleceniem od �wistaka?

	aidan_smith = TRUE;
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_02"); //Dobra, co tam masz?
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword12_15_03"); //Sk�adniki niezb�dne do wykucia miecza jego marze�.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_04"); //Daj ten z�om.  
      
	B_GiveInvItems (other, self, whistler_pack, 1);
	Npc_RemoveInvItems(self,whistler_pack,1);
		
   AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_05"); //Pozby�e� si� Garrego.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_06"); //Nie wezm� od Ciebie nawet bry�ki rudy za wykucie tego �wiecide�ka.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword12_15_07"); //�wiecide�ka?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_08"); //No c�, miecze wykuwane dla �wistaka rzadko wygl�daj� jak... miecze.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_09"); //Najcz�ciej s� to wymuskane b�yskotki, na kt�rych prawdziwy wojownik nawet nie zawiesi wzroku.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_10"); //Ale �wistak dobrze p�aci za swoje dziwactwa, wi�c wykuwam wszystko, co sobie ubzdura.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_11"); //Wr�� jutro, wtedy miecz b�dzie gotowy.
		
   aidan_sword = B_SetDayTolerance()+1;
	B_LogEntry(CH1_Rbl_Sword, "Aidan zgodzi� si� wyku� dla mnie pawie pi�ro, ale zrobi� to tylko ze wzgl�du na przys�ug�, kt�r� mu wy�wiadczy�em, namawiaj�c Garrego do zmiany profesji. Mam wr�ci� po miecz na drugi dzie�.");
};

INSTANCE DIA_HUN_859_AIDAN_SwordOk (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 5;
	condition		= DIA_HUN_859_AIDAN_SwordOk_Condition;
	information		= DIA_HUN_859_AIDAN_SwordOk_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_859_AIDAN_SwordOk_Condition()
{
	if (aidan_smith) && (aidan_sword <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_SwordOk_Info()
{
	B_GiveXP(100);

	AI_Output (self, other, "DIA_HUN_859_AIDAN_SwordOk_11_01"); //Miecz ju� gotowy.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_SwordOk_11_02"); //Zanie� to cacko �wistakowi z pozdrowieniami ode mnie.
	
   CreateInvItems (self,whistler_toy,1);
	B_GiveInvItems (self, other, whistler_toy, 1);
	
   AI_Output (other, self, "DIA_HUN_859_AIDAN_SwordOk_15_03"); //Ten miecz faktycznie wygl�da, jakby mia� si� rozpa�� przy pierwszym uderzeniu.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_SwordOk_11_04"); //Ale za to b�yszczy si� jak psu jajca.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_SwordOk_15_05"); //To fakt, dzi�ki Aidan.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_SwordOk_11_06"); //Bywaj przyjacielu.
	
   B_LogEntry(CH1_Rbl_Sword, "Aidan w ko�cu wyku� miecz dla �wistaka. To cacko nie nadaje si� do walki, ale to ju� nie moje zmartwienie.");
};

INSTANCE DIA_Aidan_Attack (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 11;
	condition		= DIA_Aidan_Attack_Condition;
	information		= DIA_Aidan_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Aidan_Attack_Condition()
{
	return q_n_again;
};

FUNC VOID DIA_Aidan_Attack_Info()
{
	AI_Output (self, other, "DIA_Aidan_Attack_11_01"); //To nie by� dobry wyb�r. Cavalorn Ci zaufa�.
	AI_Output (self, other, "DIA_Aidan_Attack_11_02"); //I o co posz�o? O kilka bry�ek cholernej rudy...
	AI_Output (self, other, "DIA_Aidan_Attack_11_03"); //Niech Ci� szlag, piracie!
	B_StopProcessInfos(self); 
};
// **************************************************

INSTANCE DIA_Aidan_Stew (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 12;
	condition		= DIA_Aidan_Stew_Condition;
	information		= DIA_Aidan_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam ciep�y gulasz."; 
};

FUNC INT DIA_Aidan_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Aidan_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_Aidan_Stew_15_01"); //Mam ciep�y gulasz.
	AI_Output (self, other, "DIA_Aidan_Stew_11_02"); //To �wietnie, pora rozgrza� brzuch.
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Aidan wyliza� misk� do czysta."); 
};

// **************************************************
var int steel_count;

INSTANCE DIA_AIDAN_Steel (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 13;
	condition		= DIA_AIDAN_Steel_Condition;
	information		= DIA_AIDAN_Steel_Info;
	permanent		= 0;
	important		= 0;
	description		= "Fox powiedzia�, �e potrzebujesz pomocy."; 
};

FUNC INT DIA_AIDAN_Steel_Condition()
{
	//TODO: Unknown
	if (Npc_KnowsInfo (hero, DIA_Fox_Stew))
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_Steel_Info()
{
	AI_Output (other, self, "DIA_AIDAN_Steel_15_01"); //Fox powiedzia�, �e potrzebujesz pomocy.
	AI_Output (self, other, "DIA_AIDAN_Steel_11_02"); //Pomoc zawsze si� przyda. Zaczyna mi brakowa� stali na ostrza, a Cavalorn potrzebuje coraz to wi�cej mieczy i topor�w.
	AI_Output (self, other, "DIA_AIDAN_Steel_11_03"); //Przynie� mi troch� stali, powiedzmy 10 pr�t�w. To mi wystarczy na jaki� czas.
	AI_Output (self, other, "DIA_AIDAN_Steel_11_04"); //W sumie jak ju� tu jeste�, to rozejrzyj si� te� za moim... m�otkiem.
	AI_Output (other, self, "DIA_AIDAN_Steel_15_05"); //Zgubi�e� m�ot kowalski?
	AI_Output (self, other, "DIA_AIDAN_Steel_11_06"); //Co si� tak patrzysz? By�o p�no, wraca�em z karczmy... Wi�cej nie pami�tam...
	AI_Output (other, self, "DIA_AIDAN_Steel_15_07"); //Ale masz czym ku� miecze?
	AI_Output (self, other, "DIA_AIDAN_Steel_11_08"); //Pewnie, �e mam. Przecie� Cavalorn by mi jaja urwa�, gdybym przerwa� prac�.
	AI_Output (self, other, "DIA_AIDAN_Steel_11_09"); //Tylko, �e przyzwyczai�em si� do tamtego m�ota, by� lepiej wywa�ony i robota szybciej mi sz�a.
	AI_Output (other, self, "DIA_AIDAN_Steel_15_10"); //Stal i m�ot... A co ja b�d� z tego mia�?
	AI_Output (self, other, "DIA_AIDAN_Steel_11_11"); //Wykuj� Ci porz�dn� kling� i specjalnie podostrz�. Takiej broni tu nie znajdziesz.
	AI_Output (other, self, "DIA_AIDAN_Steel_15_12"); //Niech b�dzie. Nied�ugo wr�c�.

	Log_CreateTopic(CH2_Rbl_Steel, LOG_MISSION);
	Log_SetTopicStatus(CH2_Rbl_Steel, LOG_RUNNING);
	B_LogEntry(CH2_Rbl_Steel, "Mam przynie�� Aidanowi 10 stalowych pr�t�w. Potrzebuje ich do wykucia ostrzy dla Cavalorna. Musz� rozejrze� si� po Kolonii.");

	Log_CreateTopic(CH2_Rbl_Hammer, LOG_MISSION);
	Log_SetTopicStatus(CH2_Rbl_Hammer, LOG_RUNNING);
	B_LogEntry(CH2_Rbl_Hammer, "Aidan zgubi� gdzie� sw�j m�ot kowalski. Powiedzia�, �e jak go znajd� i przynios� stal, to wykuje mi porz�dny or�.");

	B_LogEntry(CH2_Rbl_RebelCampLife, "Aidan poprosi� mnie o przyniesienie 10 stalowych pr�t�w i o odnalezienie m�ota kowalskiego.");
	steel_count=10;
	aidan_sword=0;
	Wld_InsertItem(Aidan_Hammer,"FP_MIS_AIDAN_HAMMER"); 	
};

// **************************************************
var int Wait4Hammer;//jezeli zdecydowalismy �e znajdziemy jeszcze mlotek

FUNC VOID DIA_AIDAN_SteelOk1_Info()
{
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_12"); //Przynios�e� stal. Miecz mo�e by� gotowy na jutro.
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_13"); //Ale wola�bym �eby� znalaz� dla mnie m�j m�otek.
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_14"); //To jak b�dzie?
	Info_ClearChoices (DIA_AIDAN_SteelOk);
	Info_AddChoice (DIA_AIDAN_SteelOk, "Wykonaj miecz.", DIA_AIDAN_SteelOk1_Yes);
	Info_AddChoice (DIA_AIDAN_SteelOk, "Przynios� ten m�otek.", DIA_AIDAN_SteelOk1_No);			
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_AIDAN_SteelOk1_YES()
{
	aidan_sword = B_SetDayTolerance()+1;
	Wait4Hammer=FALSE;
   
	AI_Output (other, self, "DIA_AIDAN_SteelOk_15_15"); //Wykonaj miecz.
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_16"); //W takim razie zabieram si� do roboty. 
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_17"); //Miecz b�dzie gotowy na jutro.
	AI_Output (other, self, "DIA_AIDAN_SteelOk_15_18"); //Wi�c wr�c� nazajutrz.	
   
	B_LogEntry(CH2_Rbl_RebelCampLife, "Przynios�em Aidanowi stal. Kowal zabra� si� do roboty. Mam wr�ci� po miecz nast�pnego dnia.");
	Info_ClearChoices (DIA_AIDAN_SteelOk);
};

// ------------------No----------------

FUNC VOID DIA_AIDAN_SteelOk1_No()
{
	AI_Output (other, self, "DIA_AIDAN_SteelOk_15_19"); //Przynios� ten m�otek.
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_20"); //Dobry wyb�r. 
	Info_ClearChoices (DIA_AIDAN_SteelOk);
	Wait4Hammer=TRUE;
};		

var int aid_steel;
var int aid_hammer;

INSTANCE DIA_AIDAN_SteelOk (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 14;
	condition		= DIA_AIDAN_SteelOk_Condition;
	information		= DIA_AIDAN_SteelOk_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam to czego potrzebujesz."; 
};

FUNC INT DIA_AIDAN_SteelOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_AIDAN_Steel))&&(!aidan_sword)&&(!Npc_KnowsInfo (hero, DIA_AIDAN_Debt))//nie zostalo zlecone
	//bugfix: dialog pojawial sie przy zadaniu z dlugiem, tak sie konczy recykling zmiennych ;p
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_SteelOk_Info()
{
	var int steel_be4;
	steel_be4=steel_count;
	AI_Output (other, self, "DIA_AIDAN_SteelOk_15_01"); //Mam to, czego potrzebujesz.
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_02"); //Zobaczmy...

	if (NPC_HasItems(other,ItMiSwordraw)>=steel_count)&&(aid_steel == FALSE)
	{
		aid_steel = TRUE;
		B_GiveXP(250);
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_03"); //Rzeczywi�cie, to stalowe pr�ty! W ko�cu mam z czego ku� miecze.
		B_GiveInvItems (other, self, ItMiSwordraw, steel_count);
		Log_SetTopicStatus(CH2_Rbl_Steel, LOG_SUCCESS);
		B_LogEntry(CH2_Rbl_Steel, "Przynios�em Aidanowi 10 stalowych pr�t�w. Teraz nie b�dzie ju� narzeka� na nud�.");
		steel_count=0;
	}
	else if ((NPC_HasItems(other,ItMiSwordraw)<steel_count)&&(NPC_HasItems(other,ItMiSwordraw)>1))&&(aid_steel == FALSE)
	{
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_04"); //Wezm� to, co masz.
		steel_count = steel_count - NPC_HasItems(other,ItMiSwordraw);
		B_GiveInvItems(other,self,ItMiSwordraw,NPC_HasItems(other,ItMiSwordraw));

		if (steel_count >=10)
		{
			B_GiveXP(250);
			aid_steel = TRUE;
			AI_Output (self, other, "DIA_AIDAN_SteelOk_11_05"); //Tyle stali mi wystarczy. W ko�cu mog� zabra� si� za kucie.
			Log_SetTopicStatus(CH2_Rbl_Steel, LOG_SUCCESS);
			B_LogEntry(CH2_Rbl_Steel, "Przynios�em Aidanowi 10 stalowych pr�t�w. Teraz nie b�dzie ju� narzeka� na nud�.");
		};
	}
	else if (aid_steel == TRUE)
	{
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_06"); //Stal ju� przynios�e�. Na razie wi�cej nie potrzebuj�.
	};

	if (NPC_HasItems(other,Aidan_Hammer)>=1)&&(aid_hammer == FALSE)
	{
		aid_hammer = TRUE;
		B_GiveXP(250);
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_07"); //Znalaz�e� m�j m�otek! Wielkie dzi�ki.
		B_GiveInvItems(other,self,Aidan_Hammer,1);
		Log_SetTopicStatus(CH2_Rbl_Hammer, LOG_SUCCESS);
		B_LogEntry(CH2_Rbl_Hammer, "Znalaz�em m�otek Aidana. Kowal ucieszy� si� jak dziecko.");
	}
	else if (aid_hammer == TRUE)
	{
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_08"); //M�otek ju� mi zwr�ci�e�.
	};

	if (aid_hammer == TRUE)&&(aid_steel == TRUE)
	{
		DIA_AIDAN_SteelOk.permanent = FALSE;
		//
		aidan_sword = B_SetDayTolerance()+1;
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_09"); //Przynios�e� stal i m�otek. W takim razie zabieram si� do roboty. 
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_10"); //Miecz b�dzie gotowy na jutro.
		AI_Output (other, self, "DIA_AIDAN_SteelOk_15_11"); //Wi�c wr�c� nazajutrz.
		B_LogEntry(CH2_Rbl_RebelCampLife, "Przynios�em Aidanowi stal i m�otek. Kowal zabra� sie do roboty. Mam wr�ci� po miecz nast�pnego dnia. ");
	}
	else if(aid_steel)&&(!Wait4Hammer)
	{
		DIA_AIDAN_SteelOk1_Info();//OnlySteel		
	}
	else if(steel_be4==steel_count)&&(aid_hammer==FALSE)//orc: added
	{
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_12"); //Nast�pnym razem przynie� chocia� jeden pr�t.
	};
};

INSTANCE DIA_AIDAN_SteelOk2 (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 16;
	condition		= DIA_AIDAN_SteelOk2_Condition;
	information		= DIA_AIDAN_SteelOk2_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_AIDAN_SteelOk2_Condition()
{
	if (aid_steel) && ((!Wait4Hammer) || (aid_hammer)) && (aidan_sword <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_SteelOk2_Info()
{
	B_GiveXP(100);
   
	AI_Output (self, other, "DIA_AIDAN_SteelOk2_11_01"); //Miecz ju� gotowy. Mam nadziej�, �e zrobisz z niego dobry u�ytek.
	
   if(aid_hammer)
	{
		CreateInvItem (self, RBL_AIDAN_SWORD);
		B_GiveInvItems (self, other, RBL_AIDAN_SWORD, 1);
	}
	else
	{
		CreateInvItem (self,RBL_AIDAN_SWORD2);            
		B_GiveInvItems (self, other, RBL_AIDAN_SWORD2, 1);				
	};
   
	AI_Output (other, self, "DIA_AIDAN_SteelOk2_15_02"); //O to si� nie musisz obawia�.
   AI_Output (self, other, "DIA_AIDAN_SteelOk2_15_03"); //No c�, czas wraca� do swych obowi�zk�w...
	AI_Output (self, other, "DIA_AIDAN_SteelOk2_11_03"); //Rozmawia�em z Cavalornem. Powiedzia�, �e jak ju� odbierzesz miecz, to masz go odwiedzi�.
	AI_Output (other, self, "DIA_AIDAN_SteelOk2_15_04"); //Nie wiesz, co chcia�?
	AI_Output (self, other, "DIA_AIDAN_SteelOk2_11_05"); //Pewnie sam Ci powie. Bywaj.

   Log_SetTopicStatus(CH2_Rbl_RebelCampLife, LOG_SUCCESS);
	B_LogEntry(CH2_Rbl_RebelCampLife, "Aidan dotrzyma� s�owa. Miecz by� gotowy nazajutrz i trzeba przyzna�, �e warto by�o czeka�.");
	B_LogEntry(CH2_Rbl_RebelCampLife, "My�liwy powiedzia� te�, �e Cavalorn chce ze mn� porozmawia�. Powinienem zobaczy� si� z przyw�dc� rebeliant�w.");
};

INSTANCE DIA_AIDAN_Spy (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 13;
	condition		= DIA_AIDAN_Spy_Condition;
	information		= DIA_AIDAN_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Lubisz samotno��?"; 
};

FUNC INT DIA_AIDAN_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_Spy_Info()
{
	spy_count = spy_count + 1;
	
   AI_Output (other, self, "DIA_AIDAN_Spy_15_01"); //Lubisz samotno��?
	AI_Output (self, other, "DIA_AIDAN_Spy_07_02"); //Wszyscy my�liwi chadzaj� w�asnymi �cie�kami przyjacielu. Jak cieniostwory.
	AI_Output (self, other, "DIA_AIDAN_Spy_07_03"); //A te �cie�ki czasem prowadz� do miejsc, kt�re lepiej omija� szerokim �ukiem.
	AI_Output (other, self, "DIA_AIDAN_Spy_15_04"); //Twoja �cie�ka te� zaprowadzi�a Ci� do takiego miejsca?
	AI_Output (self, other, "DIA_AIDAN_Spy_07_05"); //�eby tylko raz. Ci�gle czuj� na barkach brzemi�... przesz�o�ci.
	AI_Output (other, self, "DIA_AIDAN_Spy_15_06"); //M�g�by� mi to wyt�umaczy�?
	AI_Output (self, other, "DIA_AIDAN_Spy_07_07"); //M�g�bym, ale nie wiem, czy chc� przyjacielu. Mo�e kiedy�...
	
   B_LogEntry(CH2_Rbl_Spy, "Aidan jest jak cieniostw�r - cichy i nieprzewidywalny. Chadza w�asnymi �cie�kami, kt�re prowadz� do niebezpiecznych miejsc. Co ukrywa by�y my�liwy?");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od Ciebie chcia�.
		B_LogEntry(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_AIDAN_Spy1 (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 14;
	condition		= DIA_AIDAN_Spy1_Condition;
	information		= DIA_AIDAN_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "S�ysza�em, �e lubisz nocne w�dr�wki."; 
};

FUNC INT DIA_AIDAN_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_Spy1_Info()
{
	tony_spy = tony_spy + 1;
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_01"); //S�ysza�em, �e lubisz nocne w�dr�wki.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_02"); //Kto� w�cibia nos w nie swoje sprawy.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_03"); //Wol� samotno��, ludzie mnie m�cz�.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_04"); //Pewnie sporo widzisz podczas tych wypad�w.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_05"); //Czasami a� nazbyt wiele.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_06"); //Dziwne, �e akurat Ty o to pytasz.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_07"); //Dlaczego?
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_08"); //Tak si� sk�ada, �e widzia�em was, zanim dotarli�cie do naszego obozu.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_09"); //�ledzi�e� nas?
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_10"); //Dziwisz si�? Kilku kolesi w dziwnych pancerzach, kt�rzy wzi�li si� nie wiadomo sk�d.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_11"); //Jednak zanim was zauwa�y�em, by�em �wiadkiem dziwnej sceny.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_12"); //Tak?
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_13"); //Natkn��em si� na Toniego i stra�nik�w.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_14"); //Wiem, zaatakowali go i chcieli zaci�gn�� do Starego Obozu.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_15"); //Hmm, ja widzia�em co� innego. Tony z nimi rozmawia� i wygl�da�o na to, �e dobrze si� znaj�.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_16"); //To ciekawe, m�w dalej.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_17"); //Poza tym stra�nicy nigdy nie bior� je�c�w, wol� nas zabija�. Tak jest pro�ciej.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_18"); //Rozumiem. Czyli uwa�asz, �e Tony nadal brata si� ze stra�nikami?
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_19"); //Na to wygl�da. Ale mo�e to tylko starzy znajomi. Sam nie wiem.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_20"); //P�niej, kiedy wy rzucili�cie si� na stra�nik�w, ju� nie zaprz�ta�em tym sobie g�owy.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_21"); //Powiedzia�e� Cavalornowi?
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_22"); //Nie, wola�em si� upewni�. Ale p�niej tak mnie zawali� robot�, �e nie mia�em ju� czasu na nocne wypady.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_23"); //To sporo t�umaczy. Bywaj.
	
   B_LogEntry(CH2_Rbl_Spy, "Chyba ju� wiem, kto jest szpiegiem Gomeza. Aidan widzia�, jak Tony rozmawia ze stra�nikami, zanim pos�ali�my ich do Beliara.");
	
   if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta�, nie daj mu czeka�.
		B_LogEntry(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};
   
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_AIDAN_Debt (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 15;
	condition		= DIA_AIDAN_Debt_Condition;
	information		= DIA_AIDAN_Debt_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynosz� pozdrowienia od Nikolasa."; 
};

FUNC INT DIA_AIDAN_Debt_Condition()
{
	return debt_read;
};

FUNC VOID DIA_AIDAN_Debt_Info()
{
	AI_Output (other, self, "DIA_AIDAN_Debt_15_01"); //Przynosz� pozdrowienia od Nikolasa.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_02"); //Tak szybko? My�la�em, �e jeszcze troch� poczeka.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_03"); //Obawiam si�, �e chce z powrotem odzyska� ca�� rud�. Razem z odsetkami to b�dzie... 600 bry�ek.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_04"); //�adnie sobie policzy�, cholerny lichwiarz. A jaki Ty masz w tym interes?
	AI_Output (other, self, "DIA_AIDAN_Debt_15_05"); //To nie tylko m�j interes, ale ca�ego obozu. Cavalorn poleci� mi znale�� sojusznik�w w�r�d �owc�w trolli.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_06"); //Rozumiem. To troch� komplikuje sprawy...
	AI_Output (self, other, "DIA_AIDAN_Debt_11_07"); //B�d� z tob� szczery - nie mam tej rudy.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_08"); //Po�yczy�em na procent tylko po to, �eby zdoby� pewn� recept�.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_09"); //By�em pewien, �e dzi�ki recepturze wykuj� or�, kt�ry szybko sprzedam w du�ych ilo�ciach.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_10"); //Czyli nie znalaz�e� recepty?
	AI_Output (self, other, "DIA_AIDAN_Debt_11_11"); //Niestety nie. Cz�owiek, kt�ry mia� j� dla mnie zdoby�, nigdy nie wr�ci�.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_12"); //Albo ulotni� si� z rud�, w co w�tpi�. Pewnie jego ko�ci bielej� gdzie� na szlaku.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_13"); //Dobra, m�w, co mam zrobi�.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_14"); //Musisz odnale�� tego, kogo pos�a�em po recept�.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_15"); //Nazywa si� Skrzek. Z tego co wiem, m�wi�, �e recepta powinna znajdowa� si� gdzie� w starej cytadeli, na wzg�rzu nieopodal Starego Obozu.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_16"); //W porz�dku. Poszukam cia�a i recepty. Wtedy dasz mi rud�, tak?
	AI_Output (self, other, "DIA_AIDAN_Debt_11_17"); //Ekhm... Oczywi�cie, przyjacielu. Im szybciej wyruszysz, tym szybciej odnajdziesz recept�.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_18"); //Aha, a co to za przepis?
	AI_Output (self, other, "DIA_AIDAN_Debt_11_19"); //To recepta na dobry miecz albo top�r. Bez obaw, znajdziesz t� co trzeba.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_20"); //Czas na kolejny spacerek.
   
	Log_CreateTopic(CH2_TRL_Recept, LOG_MISSION);
	Log_SetTopicStatus(CH2_TRL_Recept, LOG_RUNNING);
	B_LogEntry(CH2_TRL_Recept, "Aidan odda mi rud�, je�eli odnajd� dla niego jak�� recept�. Wcze�niej Aidan wys�a� na poszukiwania jakiego� Skrzeka - rud� od Nikolasa po�yczy� w�a�nie na zorganizowanie wyprawy. Recepta ma si� znajdowa� w starej cytadeli ork�w. Czeka mnie sporo zabawy...");
	B_LogEntry(CH2_TRL_Debt, "�eby odzyska� d�ug od Aidana, musz� odnale�� dla niego jak�� recept�. Cholera ci�gle co�...");

	Wld_InsertNpc(RBL_4030_Skrzek,"BRIDGE_CASTLE_TO_PLATEAU");
	Wld_InsertNpc(OrcBiter,"CASTLE_20");
	Wld_InsertNpc(OrcBiter,"OW_PATH_108");	
	var C_NPC nik; nik = Hlp_GetNpc(RBL_4030_Skrzek);
	Npc_ChangeAttribute(nik, ATR_HITPOINTS, -nik.attribute[ATR_HITPOINTS_MAX]);	
};

var int aidan_paydebt;
INSTANCE DIA_AIDAN_DebtEnd (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 16;
	condition		= DIA_AIDAN_DebtEnd_Condition;
	information		= DIA_AIDAN_DebtEnd_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz�em t� recept� przy ciele Skrzeka."; 
};

FUNC INT DIA_AIDAN_DebtEnd_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_AIDAN_Debt)) && (NPC_HasItems(other,Recept_ItMw_1H_Sword_Long_02)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_DebtEnd_Info()
{
	B_GiveXP(400);
	
   AI_Output (other, self, "DIA_AIDAN_DebtEnd_15_01"); //Znalaz�em t� recept� przy ciele Skrzeka.
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_02"); //Poka� pergamin.
	
   B_GiveInvItems (other, self, Recept_ItMw_1H_Sword_Long_02, 1);
	Npc_RemoveInvItems(self,Recept_ItMw_1H_Sword_Long_02,1);
	
   AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_03"); //No prosz�, trzeba doda� inne proporcje rudy i d�u�ej wykuwa� g�owni�...
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_04"); //B�d� te� potrzebowa� kilku sk�adnik�w...
	AI_Output (other, self, "DIA_AIDAN_DebtEnd_15_05"); //Nawet o tym nie my�l! Ja wywi�za�em si� z umowy, teraz Twoja kolej. Gdzie ruda?
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_06"); //Ekhm... Daj mi tylko kilka dni...
	AI_Output (other, self, "DIA_AIDAN_DebtEnd_15_07"); //Co?! Powiedzia�e�, �e gdy dostaniesz recept�, ja dostan� rud�!
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_08"); //Wiem, nie chcia�em Ci� denerwowa�...
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_09"); //S�uchaj, dzi�ki tej recepcie zdo�am wyku� porz�dny or�. Jestem pewien, �e dobrze sprzedam ka�dy miecz.
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_10"); //Wr�� za... trzy dni. Wtedy dostaniesz d�ug z odsetkami i premi� ode mnie.
	AI_Output (other, self, "DIA_AIDAN_DebtEnd_15_11"); //Chyba nie mam wyboru.
	AI_Output (other, self, "DIA_AIDAN_DebtEnd_15_12"); //Niech b�dzie, trzy dni i ani chwili d�u�ej.
	
   aidan_paydebt = Wld_GetDay()+3;
	Log_SetTopicStatus(CH2_TRL_Recept, LOG_SUCCESS);
	B_LogEntry(CH2_TRL_Recept, "Odda�em recept� Aidanowi. Obieca�, �e jak tylko wykuje miecze, zap�aci mi za trud i dorzuci premi�.");
	B_LogEntry(CH2_TRL_Debt, "Aidan wzi�� recept�, ale na rud� musz� poczeka� trzy dni. Powiedzia�, �e najpierw musi wyku� or� i sprzeda� miecze, wtedy odda mi rud� i dorzuci jak�� premi�. Lepiej dla niego, �eby to by�a prawda.");
	B_StopProcessInfos(self);
	//Npc_ExchangeRoutine(self,"Start");//ma ku� te miecze dzie� i noc najlepiej, zr�b mu na to rutyn� Ork
};

INSTANCE DIA_AIDAN_SwordAfter (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 117;
	condition		= DIA_AIDAN_SwordAfter_Condition;
	information		= DIA_AIDAN_SwordAfter_Info;
	permanent		= 0;
	important		= 1;
	description		= "hejo"; 
};

FUNC INT DIA_AIDAN_SwordAfter_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_AIDAN_DebtEnd)) && (aidan_paydebt <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_SwordAfter_Info()
{
	debt_counter = debt_counter + 1;
	B_GiveXP(250);
	
   AI_Output (self, other, "DIA_AIDAN_SwordAfter_11_01"); //Sprzeda�em miecze! Zarobi�em wi�cej, ni� si� spodziewa�em.
	AI_Output (other, self, "DIA_AIDAN_SwordAfter_15_02"); //Mi�o mi to s�ysze�.	
	AI_Output (self, other, "DIA_AIDAN_SwordAfter_11_03"); //Oto d�ug z odsetkami i twoje 400 bry�ek premii!
	
   CreateInvItems (self, ItMiNugget,1000); 
	B_GiveInvItems (self, other, ItMiNugget, 1000);
	
   AI_Output (other, self, "DIA_AIDAN_SwordAfter_15_04"); //Rzeczywi�cie musia�e� sporo zarobi� na mieczach.
	AI_Output (self, other, "DIA_AIDAN_SwordAfter_11_05"); //To by� strza� w sam �rodek dupy orka! Op�aca�o si� poczeka�, h�?
	AI_Output (other, self, "DIA_AIDAN_SwordAfter_15_06"); //Raczej tak, no i nie musia�em wyrywa� rudy z twojego gard�a.
	AI_Output (self, other, "DIA_AIDAN_SwordAfter_11_07"); //To by� �art, tak? 
	AI_Output (self, other, "DIA_AIDAN_SwordAfter_11_08"); //Nie �artowa�e�?! Ekhm... Mam co� do zrobienia, bywaj.
	
   B_LogEntry(CH2_TRL_Debt, "Odzyska�em d�ug od Aidana, zarobi�em przy okazji 400 bry�ek - czasami warto poczeka�, zamiast d�ga� mieczem.");
	B_StopProcessInfos(self);
};

/***************************************

SIDE QUEST

***************************************/

// **************************************************

INSTANCE DIA_AIDAN_Eqquipment(C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 18;
	condition		= DIA_AIDAN_Eqquipment_Condition;
	information		= DIA_AIDAN_Eqquipment_Info;
	permanent		= 0;
	important		= 0;
	description		= "Cavalorn powiedzia�, �e co� dla mnie masz."; 
};

FUNC INT DIA_AIDAN_Eqquipment_Condition()
{
	if (hero.guild == GIL_HUN)
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_Eqquipment_Info()
{
	B_GiveXP(100);
	AI_Output (other, self, "DIA_AIDAN_Eqquipment_15_01"); //Cavalorn powiedzia�, �e co� dla mnie masz.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_11_02"); //A mam, pewnie. Ale najpierw wy�wiadczysz mi przys�ug�...
	AI_Output (other, self, "DIA_AIDAN_Eqquipment_15_03"); //Mam ju� do�� biegania na posy�ki!
	AI_Output (other, self, "DIA_AIDAN_Eqquipment_15_04"); //Mam propozycj�. Ty dasz mi co�, co pomo�e mi zabi� kilku skurwieli ze Starego Obozu, a ja zapomn� o tej 'przys�udze'.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_11_05"); //Niech b�dzie, to uczciwa propozycja. Wybacz, ale zapomnia�em, z kim mam do czynienia.
	AI_Output (other, self, "DIA_AIDAN_Eqquipment_15_06"); //Pochlebc�w te� nie lubi�...
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_11_07"); //Tak, oczywi�cie. To co wybierasz?
	
   Info_ClearChoices (DIA_AIDAN_Eqquipment);
	Info_AddChoice (DIA_AIDAN_Eqquipment, "Wezm� bro� jednor�czn�.", DIA_AIDAN_Eqquipment_sword);
	Info_AddChoice (DIA_AIDAN_Eqquipment, "Daj mi jakiego� dwur�czniaka.", DIA_AIDAN_Eqquipment_sword2h);
	Info_AddChoice (DIA_AIDAN_Eqquipment, "Przyda�by si� jaki� �uk.", DIA_AIDAN_Eqquipment_bow);
	Info_AddChoice (DIA_AIDAN_Eqquipment, "Potrzebuj� kuszy.", DIA_AIDAN_Eqquipment_crossbow);
};

// ---------------------------sword----------------------------------------

FUNC VOID DIA_AIDAN_Eqquipment_sword()
{
	AI_Output (other, self,"DIA_AIDAN_Eqquipment_sword_15_01"); //Wezm� bro� jednor�czn�.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_sword_11_02"); //Ta b�dzie w sam raz.

	CreateInvItems (self,HUN_MW_03AXE,1);
	B_GiveInvItems (self, other, HUN_MW_03AXE, 1);
   
	B_eqquip_check();
   
	B_LogEntry(CH3_RBL_Choose, "Dosta�em od Aidana dobry miecz.");
	B_StopProcessInfos(self);
};

// ---------------------------sword 2h----------------------------------------

FUNC VOID DIA_AIDAN_Eqquipment_sword2h()
{
	AI_Output (other, self,"DIA_AIDAN_Eqquipment_sword2h_15_01"); //Daj mi jakiego� dwur�czniaka.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_sword2h_11_02"); //Wypr�buj ten miecz, nadal jest ostry i dobrze wywa�ony.

	CreateInvItems (self,HUN_MW_04,1);
	B_GiveInvItems (self, other, HUN_MW_04, 1);
   
	B_eqquip_check();
   
	B_LogEntry(CH3_RBL_Choose, "Dosta�em od Aidana dobry miecz dwur�czny.");
	B_StopProcessInfos(self);
};

// ------------------------------bow-------------------------------------

FUNC VOID DIA_AIDAN_Eqquipment_bow()
{
	AI_Output (other, self,"DIA_AIDAN_Eqquipment_bow_15_01"); //Przyda�by si� jaki� �uk.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_bow_08_02"); //Mam co�, co powinno Ci si� spodoba�.

	CreateInvItems (self,HUN_RW_01,1);
	B_GiveInvItems (self, other, HUN_RW_01, 1);
   
	B_eqquip_check();
   
	B_LogEntry		(CH3_RBL_Choose, "Dosta�em od Aidana dobry �uk.");
	B_StopProcessInfos	(self);
};

// ------------------------------crossbow-------------------------------------

FUNC VOID DIA_AIDAN_Eqquipment_crossbow()
{
	AI_Output (other, self,"DIA_AIDAN_Eqquipment_crossbow_15_01"); //Potrzebuj� kuszy.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_crossbow_08_02"); //To �wietna decyzja, akurat mam wy�mienit� kusz�.

	CreateInvItems (self,HUN_RW_03,1);
	B_GiveInvItems (self, other, HUN_RW_03, 1);
	
   B_eqquip_check();
	
   B_LogEntry(CH3_RBL_Choose, "Dosta�em od Aidana dobr� kusz�.");
	B_StopProcessInfos(self);
};

var int help_choice;

// **************************************************

INSTANCE DIA_AIDAN_SWD_Help (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 19;
	condition		= DIA_AIDAN_SWD_Help_Condition;
	information		= DIA_AIDAN_SWD_Help_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam Ci pom�c z mieczami."; 
};

FUNC INT DIA_AIDAN_SWD_Help_Condition()
{
	return ratford_help;
};

FUNC VOID DIA_AIDAN_SWD_Help_Info()
{
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_15_01"); //Mam Ci pom�c z mieczami.
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_11_02"); //Prosi�em Ratforda o pomoc, ale nie s�dzi�em, �e przy�le Ciebie.
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_15_03"); //Ka�dy ma chwil� s�abo�ci. No dobra, m�w, co mam robi�.
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_11_04"); //Dam ci wyb�r. Wykujesz 10 mieczy, albo przyniesiesz 10 sztabek �elaza i 5 sztabek stali.
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_11_05"); //Co wybierasz?

	Info_ClearChoices (DIA_AIDAN_SWD_Help);
	Info_AddChoice (DIA_AIDAN_SWD_Help, "Wykuj� miecze.", DIA_AIDAN_SWD_Help_SWDS);
	Info_AddChoice (DIA_AIDAN_SWD_Help, "Przynios� sztabki.", DIA_AIDAN_SWD_Help_PRBS);
};

// -------------------------------------------------------------------

FUNC VOID DIA_AIDAN_SWD_Help_SWDS()
{
	help_choice = 1;
	
   AI_Output (other, self, "DIA_AIDAN_SWD_Help_SWDS_15_01"); //Wykuj� miecze.
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_SWDS_11_02"); //To �wietnie. Nie spodziewa�em si� tego po Tobie.
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_SWDS_15_03"); //Nie rozklejaj si�, bo si� rozmy�l�. Jakie to maj� by� miecze?
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_SWDS_11_04"); //We� t� receptur�. Wykuj 10 mieczy i daj mi zna�.
	
   CreateInvItems (self,Recept_ItMw_1H_Sword_Long_04,1); //zmie� na recept� jak��
	B_GiveInvItems (self, other, Recept_ItMw_1H_Sword_Long_04, 1);
	
   AI_Output (other, self, "DIA_AIDAN_SWD_Help_SWDS_15_05"); //W porz�dku, bior� si� do roboty...
	
   B_LogEntry(CH3_RBL_AidanHelp, "Wykuj� dla Aidana 10 mieczy. Da� mi recept�, wed�ug kt�rej mam przygotowa� 10 mieczy zwyci�stwa. To do roboty...");
	B_StopProcessInfos(self);
};

// -------------------------------------------------------------------

FUNC VOID DIA_AIDAN_SWD_Help_PRBS()
{
	help_choice = 2;
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_PRBS_15_01"); //Przynios� sztabki.
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_PRBS_11_02"); //Nie dziwi mnie to, jak zawsze po najmniejszej linii oporu.
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_PRBS_15_03"); //Przesta� biadoli�, bo si� rozmy�l�.
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_PRBS_15_04"); //Nied�ugo wr�c� ze sztabkami.

	B_LogEntry(CH3_RBL_AidanHelp, "Przynios� Aidanowi 10 sztabek �elaza oraz 5 sztabek stali, po co si� przem�cza�?");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_AIDAN_SWD_HelpEnd (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 20;
	condition		= DIA_AIDAN_SWD_HelpEnd_Condition;
	information		= DIA_AIDAN_SWD_HelpEnd_Info;
	permanent		= 1;
	important		= 0;
	description		= "Jestem z powrotem."; 
};

FUNC INT DIA_AIDAN_SWD_HelpEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_AIDAN_SWD_Help) && (help_choice < 5))
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_SWD_HelpEnd_Info()
{
	AI_Output (other, self, "DIA_AIDAN_SWD_HelpEnd_15_01"); //Jestem z powrotem.
	AI_Output (self, other, "DIA_AIDAN_SWD_HelpEnd_11_02"); //Co tak d�ugo?
   
	if (help_choice == 1)&&(NPC_HasItems(other,ItMw_1H_Sword_Long_04)>=10)//to te miecze maj� by�
	{
		others_help = others_help + 1;
		B_GiveXP(500);
		help_choice = 5;
      
		AI_Output (other, self, "DIA_AIDAN_SWD_HelpEnd_15_03"); //Twoje miecze. Mam nadziej�, �e ju� wkr�tce posmakuj� krwi stra�nik�w.
		AI_Output (self, other, "DIA_AIDAN_SWD_HelpEnd_11_04"); //B�d� tego pewien.
		AI_Output (self, other, "DIA_AIDAN_SWD_HelpEnd_11_05"); //A to wyku�em dla Ciebie. Zatopi�em w amulecie star� run�, powinien da� Ci jak�� ochron�.
		
      Give_and_remove(ItMw_1H_Sword_Long_04, 10);
      Create_and_give(Amulett_der_Macht, 1);
		
      AI_Output (other, self, "DIA_AIDAN_SWD_HelpEnd_15_06"); //Dzi�ki, na pewno si� przyda.
		
		Log_SetTopicStatus(CH3_RBL_AidanHelp, LOG_SUCCESS);
		B_LogEntry(CH3_RBL_AidanHelp, "Wyku�em miecze dla Aidana, or� przys�u�y si� sprawie.");
	}
	else if (help_choice == 2)&&(NPC_HasItems(other, ItMa_Iron)>=10) && (NPC_HasItems(other, ItMa_Steel)>=5)
	{
		others_help = others_help + 1;
		B_GiveXP(200);
		help_choice = 5;
      
		AI_Output (other, self, "DIA_AIDAN_SWD_HelpEnd_15_07"); //Bierz sztabki i zabieraj si� do roboty!
		AI_Output (self, other, "DIA_AIDAN_SWD_HelpEnd_11_08"); //Wiem, co mam robi�. Zejd� mi z oczu!

      Give_and_remove(ItMa_Iron, 10);
      Give_and_remove(ItMa_Steel, 5);

		Log_SetTopicStatus	(CH3_RBL_AidanHelp, LOG_SUCCESS);

		B_LogEntry(CH3_RBL_AidanHelp, "Odda�em Aidanowi sztabki, kolejne nudne zadanie zaliczone!");
	}
	else
	{
		AI_Output (other, self, "DIA_AIDAN_SWD_HelpEnd_15_09"); //Cholera nie mam wszystkiego! Wkr�tce wr�c�...
	};
   
	B_StopProcessInfos(self);
};

INSTANCE DIA_Aidan_armor (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 12;
	condition		= DIA_Aidan_armor_Condition;
	information		= DIA_Aidan_armor_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mi wyku� pewien pancerz ze sk�ry..."; 
};

FUNC INT DIA_Aidan_armor_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kira_HuntFinalEnd))&&(NPC_HasItems(other,ItAt_BlackTroSkin)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Aidan_armor_Info()
{
   AI_Output (other, self, "DIA_Aidan_armor_15_01"); //Mo�esz mi wyku� pewien pancerz ze sk�ry....
   AI_Output (self, other, "DIA_Aidan_armor_11_02"); //Zaczekaj no, ja tylko wykuwam bro�, nie jestem �adnym p�atnerzem.
   AI_Output (self, other, "DIA_Aidan_armor_11_03"); //Tak, a te wszystkie pancerze rebeliant�w pojawi�y si� ni st�d, ni zow�d?
   AI_Output (self, other, "DIA_Aidan_armor_11_04"); //Przesta� mi zawraca� dup�, mam pe�ne r�ce roboty.
};

INSTANCE DIA_HUN_859_AIDAN_Repair_Axe (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 3;
	condition		= DIA_HUN_859_AIDAN_Repair_Axe_Condition;
	information		= DIA_HUN_859_AIDAN_Repair_Axe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czy m�g�by� podostrzy� mi m�j top�r?"; 
};

FUNC INT DIA_HUN_859_AIDAN_Repair_Axe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_GarryCome)) && (!repaired_axe_Rick) && (NPC_HasItems(other, Rick_Axe_1)>=1) 
		&& (NPC_GetDistToWP(self, "OM_SMITH_03") < 1000)
	{
		B_unequip_current_mweapon_hero(Rick_Axe_1);
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_Repair_Axe_Info()
{
	repaired_axe_Rick = TRUE; 
   
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Repair_Axe_15_01"); //Czy m�g�by� podostrzy� mi m�j top�r?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Repair_Axe_11_02"); //Jasne! Daj mi go, a po chwili zn�w b�dziesz m�g� posieka� kogo� na kawa�ki.
   
	AI_GotoWP(self, "OM_SMITH_03");
	B_StartUseMob(self, "BSSHARP");
	AI_Wait(self, 1);
	B_StopUseMob(self, "BSSHARP");
	Give_and_remove(Rick_Axe_1, 1);
   Create_and_give(Rick_Axe_2a, 1);
	AI_GotoNPC(self, other);
	AI_TurnToNPC(self, other);
	
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Repair_Axe_15_03"); //Prosz�, niech ci dobrze s�u�y. 
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Repair_Axe_15_04"); //Dzi�ki.
};