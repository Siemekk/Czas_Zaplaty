// **************************** 
//				EXIT 
// ****************************

instance  Info_Kafu_EXIT (C_INFO)
{
	npc			=	Non_4122_Kafu;
	nr			=	999;
	condition	=	Info_Kafu_EXIT_Condition;
	information	=	Info_Kafu_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Kafu_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Kafu_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Kafu_Hallo (C_INFO)
{
	npc			=	Non_4122_Kafu;
	nr			=	1;
	condition	=	Info_Kafu_Hallo_Condition;
	information	=	Info_Kafu_Hallo_Info;
	permanent	=	0;
	description =	"";
	important = 1;
};                       

FUNC int  Info_Kafu_Hallo_Condition()
{
	if (stone_note_read == TRUE)&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID  Info_Kafu_Hallo_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_GotoNpc(other, self);

	AI_Output (self, other,"Info_Kafu_Hallo_04_01"); //Wolny... Znowu wolny. M�c oddycha� �wie�ym powietrzem...
	AI_Output (other, self,"Info_Kafu_Hallo_15_02"); //Kim Ty jeste�?
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"Info_Kafu_Hallo_04_03"); //Nazywam si� Kafu. Onegdaj by�em jednym z mag�w ziemi. By�em jedynym, kt�ry sprzeciwi� si� Wielkiej Radzie. A Ty prze�ama�e� czar wi���cy mnie w Cytadeli Udr�ki...
	AI_Output (other, self,"Info_Kafu_Hallo_15_04"); //(mag wpatrzy� si� w przestrze� za Tob�, nie przerywasz mu, a on kontynuuje)
	AI_Output (self, other,"Info_Kafu_Hallo_04_05"); //Chcieli wykorzysta� pot�g� kamienia. Nie pozwoli�em im na to! Zniszczy�em kamie� filozoficzny i wszystkie traktuj�ce o artefakcie zapiski.
	AI_Output (self, other,"Info_Kafu_Hallo_04_06"); //Wtedy Ci starcy uwi�zili mnie pod ziemi�, kt�rej ca�e �ycie s�u�y�em. Sp�dzi�em tam wieki...
	AI_Output (other, self,"Info_Kafu_Hallo_15_07"); //Jak uda�o Ci si� prze�y� tak d�ugo?
	AI_Output (self, other,"Info_Kafu_Hallo_04_08"); //Z kamienia zosta�y tylko okruchy, ale nawet tak niewielkie fragmenty zapewniaj� d�ugowieczno��.
	AI_Output (other, self,"Info_Kafu_Hallo_15_09"); //Masz taki odprysk przy sobie?
	AI_Output (self, other,"Info_Kafu_Hallo_04_10"); //Tak. Niestety kiedy siedzisz zamkni�ty w nieprzebytych ciemno�ciach, przywalony ziemi� i kamieniami... Tw�j umys� zaczyna rodzi� koszmary...
	AI_Output (self, other,"Info_Kafu_Hallo_04_11"); //Z czasem koszmary te staj� si� cz�ci� Ciebie, rzeczywisto�ci�, bez kt�rej nie mo�esz �y�...
	AI_Output (other, self,"Info_Kafu_Hallo_15_12"); //O czym Ty m�wisz?
	AI_Output (self, other,"Info_Kafu_Hallo_04_13"); //G��boko pod ziemi� narodzi� si� potw�r, bestia �yj�ca w moim ciele...
	AI_Output (other, self,"Info_Kafu_Hallo_15_14"); //Nie rozumiem...
	AI_Output (self, other,"Info_Kafu_Hallo_04_15"); //Uwolni�e� mnie, ale bestia z�akniona jest krwi... Uciekaj, cz�owieku! 
	AI_Output (self, other,"Info_Kafu_Hallo_04_16"); //Uciekaj, p�ki jeszcze mo�esz...

	CreateInvItems (self, Fil_Stone,1); 
	B_LogEntry		(CH1_RBL_Stone, "Nieopatrznie z�ama�em czar i uwolni�em jakiego� zwariowanego maga. Z tego co m�wi�, posiada odprysk kamienia filozoficznego. Ale najpierw musz� go zabi�...");

	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);
};


