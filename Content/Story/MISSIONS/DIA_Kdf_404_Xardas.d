//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	B_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##						CZ story
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	return TRUE;
};

FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output(self, hero,"Info_Xardas_DISTURB_14_01"); //KTO �MIE PRZESZKADZA� MI W MOICH STUDIACH?!
	AI_Output(hero, self,"Info_Xardas_DISTURB_15_02"); //Nazywam si�...
	AI_Output(self, hero,"Info_Xardas_DISTURB1_14_03"); //Nie interesuje mnie Twoje imi�. To nieistotne.
	AI_Output(self, hero,"Info_Xardas_DISTURB1_14_04"); //Liczy si� tylko to, �e jeste� drug� osob� od wielu lat, kt�ra zak��ca m�j spok�j!
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "Czyli kto� tu jeszcze zagl�da�?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output(hero, self,"Info_Xardas_OTHERS1_15_01"); //Czyli kto� tu jeszcze zagl�da�?
	AI_Output(self, hero,"Info_Xardas_OTHERS1_14_02"); //By� mo�e, ale to nie Twoja sprawa, �miertelniku.
	AI_Output(hero, self,"Info_Xardas_OTHERS1_15_03"); //Wolisz wie�� �ywot samotnika, czy� nie?
	AI_Output(self, hero,"Info_Xardas_OTHERS1_14_04"); //Ale� sk�d. Szczeg�lnie istoty, kt�re przyzywam bardzo ceni� sobie towarzystwo nieproszonych go�ci!
}; 

//---------------------------------------------------------------------
//	Info Leren
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "Przysy�a mnie Leren. Potrzebujemy Twojej pomocy!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_Xardas_DISTURB))&&(Npc_KnowsInfo(hero, DIA_Leren_RuneSwd1))
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_01"); //Przysy�a mnie Leren. Potrzebujemy Twojej pomocy!
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_02"); //Znalaz�em pewne ostrze, ale aby przywr�ci� mu pierwotn� moc, nale�y odby� rytua�, kt�ry musz� przeprowadzi� kap�ani trzech b�stw.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_03"); //I �askawie pomy�la�e� o mnie?
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_04"); //No c�... Nie znam innego czciciela Beliara, kt�ry nie chcia�by od razu urwa� mi g�owy.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_05"); //Sk�d przypuszczenie, �e s�u�� Beliarowi?
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_06"); //Przecie� jeste� nekromant�.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_07"); //Powiedz mi przyb��do, co TY wiesz o Beliarze? Jak my�lisz co to za b�g?
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_08"); //Na pewno wredny.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_09"); //C� za wnikliwa analiza.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_10"); //Beliar to pot�ny sukinsyn, dla kt�rego �ycie jego czcicieli nie znaczy wi�cej ni� grobowe pr�chno.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_11"); //Wykorzystuje wyznawc�w do osi�gni�cia w�asnych cel�w. Wszyscy jeste�my jego narz�dziami.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_12"); //A ja bardzo nie lubi� ulega�... manipulacji.
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_13"); //Komu wi�c s�u�ysz? 
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_14"); //Samemu sobie. Oczywi�cie moje zamiary, jak i zamiary Beliara cz�sto s� zbie�ne, dlatego jeszcze �yj�.
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_15"); //Interesuje mnie tylko to, czy zechcesz mi pom�c.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_16"); //By� mo�e. Ale nic za darmo.
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_17"); //Co proponujesz?
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_18"); //Pomog� przeprowadzi� rytua�, a Ty w niedalekiej przysz�o�ci odwdzi�czysz mi si� w... podobny spos�b.
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_19"); //Powiedz mi, co dok�adnie masz na my�li.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_20"); //Nie mog�. Zreszt�, Ty i tak by� tego nie zrozumia�.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_21"); //Rytua� w zamian za przysz�� przys�ug�. I pami�taj, �e decyzja, kt�r� podejmiesz b�dzie ostateczna!
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_22"); //Co postanowisz?

	B_LogEntry(CH4_GRD_RuneSwd, "Xardas pomo�e mi pod warunkiem, �e w niedalekiej przysz�o�ci spe�ni� jak�� jego pro�b�. Obawiam si�, �e tkwi w tym jaki� mroczny haczyk, ale nie mam wyboru - tylko w ten spos�b zdo�am przywr�ci� miecz runiczny do '�ycia'. Decyzja, kt�r� podejm� b�dzie ostateczna - nie b�dzie drugiej szansy, czy te� mo�liwo�ci zmiany postanowienia. Musz� to dobrze przemy�le�.");
}; 

//---------------------------------------------------------------------

instance  Info_Xardas_Choice (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_Choice_Condition;
	information	= Info_Xardas_Choice_Info;
	important	= 0;
	permanent	= 0;
	description = "Podj��em decyzj�.";
};

FUNC int  Info_Xardas_Choice_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_Xardas_SATURAS))
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_Choice_Info()
{
	AI_Output(hero, self,"Info_Xardas_Choice_15_01"); //Podj��em decyzj�.
	AI_Output(self, hero,"Info_Xardas_Choice_14_02"); //Wi�c co postanowi�e�?

	Info_ClearChoices (Info_Xardas_Choice);
	Info_AddChoice (Info_Xardas_Choice, "Zgadzam si�.", Info_Xardas_Choice_Yes);
	Info_AddChoice (Info_Xardas_Choice, "To za du�e ryzyko.", Info_Xardas_Choice_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID Info_Xardas_Choice_Yes()
{
	xardas_agree = TRUE;
   
	AI_Output(hero, self,"Info_Xardas_Choice_Yes_15_01"); //Zgadzam si�.
	AI_Output(self, hero,"Info_Xardas_Choice_Yes_14_02"); //Nie masz poj�cia, jak wielk� sprawi�e� mi przyjemno��.
	AI_Output(hero, self,"Info_Xardas_Choice_Yes_15_03"); //Co� mi si� wydaje, �e wkr�tce gorzko tego po�a�uj�.
	AI_Output(self, hero,"Info_Xardas_Choice_Yes_14_04"); //Wr��, kiedy wszystko b�dzie gotowe do przeprowadzenia rytua�u.
	
   B_LogEntry(CH4_RBL_Rirual, "Zgodzi�em si� na ��dania Xardasa. Wiem, �e ju� wkr�tce gorzko tego po�a�uj�, ale nie mia�em wyboru - tylko tak zdo�am przywr�ci� ostrzu jego moc.");
   
   Info_ClearChoices (Info_Xardas_Choice);
};

// ---------------------------No----------------------------------------

FUNC VOID Info_Xardas_Choice_No()
{
	AI_Output(hero, self,"Info_Xardas_Choice_No_15_01"); //To za du�e ryzyko.
	AI_Output(self, hero,"Info_Xardas_Choice_No_14_02"); //Zaskoczy�e� mnie, jeste� jednak inteligentn� istot�.
	AI_Output(self, hero,"Info_Xardas_Choice_No_14_03"); //Dobrze wi�c, nasze drogi tutaj si� rozchodz�. Nie wracaj tu wi�cej, �miertelniku!
	
   B_LogEntry(CH4_RBL_Rirual, "Nie zgodzi�em si� na propozycj� Xardasa. Bardziej ni� miecz runiczny ceni� swoje �ycie.");
   
   Info_ClearChoices (Info_Xardas_Choice);
};

// *************************************************

instance  Info_Xardas_Ritual (C_INFO)
{
	npc			=	Kdf_404_Xardas;
	nr			=	12;
	condition	=	Info_Xardas_Ritual_Condition;
	information	=	Info_Xardas_Ritual_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Wszystko jest ju� przygotowane do przeprowadzenia rytua�u."; 
};                       

FUNC int  Info_Xardas_Ritual_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Leren_Ritual))&&(xardas_agree == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Info_Xardas_Ritual_Info()
{
	AI_Output(other, self, "Info_Xardas_Ritual_15_00"); //Wszystko jest ju� przygotowane do przeprowadzenia rytua�u.
	AI_Output(self, other,"Info_Xardas_Ritual_14_01"); //Gdzie odb�dzie si� ceremonia?
	AI_Output(other, self, "Info_Xardas_Ritual_15_02"); //Leren czeka w pobli�u kamiennego kr�gu na bagnach.
	AI_Output(self, other,"Info_Xardas_Ritual_14_03"); //Dobrze, stawi� si� na miejsce. Pami�taj, �e kiedy� sp�acisz ten d�ug.
	
   B_LogEntry(CH4_RBL_Rirual, "Xardas ruszy� pom�c w odprawieniu rytua�u.");
	Npc_ExchangeRoutine(self, "RITUAL");
	B_StopProcessInfos(self);
};

// *************************************************

instance  Info_Xardas_RitualEnd (C_INFO)
{
	npc			=	Kdf_404_Xardas;
	nr			=	13;
	condition	=	Info_Xardas_RitualEnd_Condition;
	information	=	Info_Xardas_RitualEnd_Info;
	permanent	=	0;
	important	=	1;	
	description		= ""; 
};                       

FUNC int  Info_Xardas_RitualEnd_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_Ritual))&&(Npc_KnowsInfo(hero,DIA_Leren_RitualBegin))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID  Info_Xardas_RitualEnd_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);
	
   AI_Output(self, other,"Info_Xardas_RitualEnd_14_01"); //Rytua� si� zako�czy�. Pami�taj jednak, �e kiedy� upomn� si� o sp�at� d�ugu, kt�ry dzisiaj zaci�gn��e�.
	AI_Output(other, self, "Info_Xardas_RitualEnd_15_02"); //Nie obawiaj si�, mam dobr� pami��. Poza tym zawsze dotrzymuj� danego s�owa.
	AI_Output(self, other,"Info_Xardas_RitualEnd_14_03"); //To si� dopiero oka�e...

	Npc_ExchangeRoutine(self, "START");
	B_StopProcessInfos(self);
   
   Xardas_teleport_after_ritual = true;
};

/*********************
Ork nauk� i handel zostawiam, nie wiem co z ni� planujesze wi�c decyduj

********************/

/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/
/*
instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "Poszukuj� wiedzy magicznej."; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};
};

FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Poszukuj� wiedzy magicznej.
};


*/
//TODO: Wg nowego porzadku swiata (gothica) :P
//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
/*instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};

func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Mo�esz mnie czego� nauczy�?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Wprowadz� ci� w Sz�sty Kr�g Magii.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Pami�taj, �e to przywilej zarezerwowany wy��cznie dla najbieglejszych mag�w. Mog� do niego przyst�pi� ci, kt�rych ca�e �ycie jest znakiem.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Twoim znakiem jest zjednoczenie element�w.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Sz�sty Kr�g pozwala ci wykorzystywa� magi� dowolnej runy.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //I nie zapomnij: twoim zadaniem jest s�u�y� pot�dze magii, a nie j� wykorzystywa�.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() �bergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem f�r Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			B_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Jeszcze nie. Jeste� zdolny, ale brak ci niezb�dnego do�wiadczenia. Niech Saturas popracuje nad Tob� przez jaki� czas. Wtedy zobaczymy.
		
		B_StopProcessInfos	( self );
	};
};*/	


INSTANCE DIA_Xardas_CanYouTeachMe (C_INFO)
{
	npc				= Kdf_404_Xardas;
	//nr				= 71;
	condition		= DIA_Xardas_CanYouTeachMe_Condition;
	information		= DIA_Xardas_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Xardas_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Xardas_OTHERS))
	{
		return 1;
	};
};

FUNC VOID DIA_Xardas_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Xardas_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Xardas_CanYouTeachMe_12_02"); //Posiadam wiedz� o kr�gach magii.
   AI_Output (self, other, "DIA_Xardas_CanYouTeachMe_12_03"); //Ale nie ucz� nowicjuszy.
	
	Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
	B_LogEntry(GE_TeacherOW, "Xardas nauczy mnie magicznych zakl��.");
};