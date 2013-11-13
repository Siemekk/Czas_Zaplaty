// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// ************************************************************

instance DIA_Fletcher_Hi (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 12;
	condition		= DIA_Fletcher_Hi_Condition;
	information		= DIA_Fletcher_Hi_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};

FUNC int  DIA_Fletcher_Hi_Condition()
{	
	if (grd_NC_pass == FALSE)
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hi_Info()
{
	AI_Output (self, other,"DIA_Fletcher_Hi_06_01"); //A Ty� co za jeden? Zejd� mi z oczu.
	B_StopProcessInfos(self);
};

// ************************************************************
//		
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gro�nie wygl�dasz.";
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (grd_NC_pass)
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //Gro�nie wygl�dasz.
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Bo jestem niebezpiecznym cz�owiekiem. Nie znam Ci�. Sk�d si� tu wzi��e�?
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //By�em na patrolu, mieli�my pecha, napatoczyli�my si� na band� z Obozu Rebeliant�w. I oto jestem...
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Hmm. Rzeczywi�cie czekali�my na wsparcie, ale nie jednoosobowe.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_04"); //Na razie musz� Ci wystarczy�.
	AI_Output (self, other,"DIA_Fletcher_Hello_06_05"); //Co� jeszcze?
	AI_Output (other, self,"DIA_Fletcher_Hello_15_06"); //Nic, p�jd� si� czego� napi�, mia�em ci�ki dzie�.
};	

// ************************************************************

instance DIA_Fletcher_LaresPunish (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 3;
	condition		= DIA_Fletcher_LaresPunish_Condition;
	information		= DIA_Fletcher_LaresPunish_Info;
	permanent		= 0;
	description		= ".";
};

FUNC int  DIA_Fletcher_LaresPunish_Condition()
{	
	if (lares_done == 3)&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

func void  DIA_Fletcher_LaresPunish_Info()
{
	lares_done = 4;
	var C_NPC lar; lar = Hlp_GetNpc(SLV_907_Lares);
	B_FullStop (hero);
	AI_GotoNpc(self, lar);
	AI_TurnToNpc(self, lar);
   
	AI_Output (self, lar,"DIA_Fletcher_LaresPunish_06_01"); //Zdaje si�, �e o czym� zapomnia�e� szkodniku.
	AI_TurnToNpc(lar, self);
	AI_Output (lar, self,"DIA_Fletcher_LaresPunish_11_02"); //To nie tak jak my�lisz...
	AI_TurnToNpc(other, self);
	AI_Output (other, self,"DIA_Fletcher_LaresPunish_15_03"); //Sprawa z uciekinierami jest ju� za�atwiona.
	AI_TurnToNpc(self, other);
   
	if (Npc_KnowsInfo (hero, DIA_Fletcher_Hello))
	{
		AI_Output (self, other,"DIA_Fletcher_LaresPunish_06_04"); //To znowu Ty...
	}
	else
	{
		AI_Output (self, other,"DIA_Fletcher_LaresPunish_06_05"); //A Ty� kto?
	};
   
	AI_Output (other, self,"DIA_Fletcher_LaresPunish_15_06"); //To ich �by.

	B_GiveInvItems (other, self, HEAD1_org, 1);
	B_GiveInvItems (other, self, HEAD2_org, 1);
	B_GiveInvItems (other, self, HEAD3_org, 1);
	B_GiveInvItems (other, self, HEAD4_org, 1);

	Npc_RemoveInvItems(self,HEAD1_org,1);
	Npc_RemoveInvItems(self,HEAD2_org,1);
	Npc_RemoveInvItems(self,HEAD3_org,1);
	Npc_RemoveInvItems(self,HEAD4_org,1);

	AI_Output (self, other,"DIA_Fletcher_LaresPunish_06_07"); //Rzeczywi�cie to tym sukinsynom Lares da� zbiec.
	AI_Output (self, other,"DIA_Fletcher_LaresPunish_06_08"); //No nic, lepiej p�no ni� wcale.
	AI_TurnToNpc(self, lar);
	AI_Output (self, other,"DIA_Fletcher_LaresPunish_06_09"); //Tym razem upiek�o Ci si� szkodniku. Ale b�d� czeka�, a� powinie Ci si� noga. Wtedy nie b�dziesz ju� mia� tyle szcz�cia.
	AI_TurnToNpc(other, lar);
	AI_Output (other, self,"DIA_Fletcher_LaresPunish_15_10"); //A to Twoja zguba.
	B_GiveInvItems (other, lar, Lares_Axt, 1);
	AI_EquipBestMeleeWeapon	(lar);
	AI_Output (lar, other,"DIA_Fletcher_LaresPunish_11_11"); //Dzi�ki przyjacielu... Za wszystko. Jestem Ci winien co� wi�cej ni� przys�ug�.
	B_LogEntry(CH4_NC_RBLBosses, "Mimo sp�nienia uratowa�em ty�ek Laresowi. Ciekawe, czy powie mi co� ciekawego?");	
	B_StopProcessInfos(self);

	/***************************
	Fletcher wraca na swoj� pocz�tkow� rutyn�.
	**************************/

	Npc_ExchangeRoutine(self,"start");
};

// ************************************************************

instance DIA_Fletcher_TheRock (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 4;
	condition		= DIA_Fletcher_TheRock_Condition;
	information		= DIA_Fletcher_TheRock_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};

FUNC int  DIA_Fletcher_TheRock_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Gorn_TheRock))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

func void  DIA_Fletcher_TheRock_Info()
{
	/******************************

Ork niech Fletcher siedzi pod drzewem i kona xD

*****************************/

	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_01"); //No prosz�, kolejny idiota chcia� zosta� bohaterem... (kaszel)
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_02"); //Co tu si� sta�o?!
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_03"); //Mieli�my go�cia... Wyr�n�� wszystkich moich ludzi w nocy...
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_04"); //Mi rozpru� brzuch... Nie masz poj�cia jakie to uczucie le�e� we w�asnych flakach i wdycha� smr�d g�wna... (kaszel)
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_05"); //Kto to by�?
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_06"); //Pupilek Kruka... Ch�do�ony demon. To ten skurwiel wyr�n�� ludzi Hrabiego w Orlim Gnie�dzie. Kiedy zobaczy�em Kruka na blankach wiedzia�em, �e ze mn� ju� koniec.
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_07"); //Boisz si� jednego cz�owieka?
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_08"); //Kruk to nie cz�owiek... Kto� kto brata si� z Beliarem nie jest cz�owiekiem!
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_09"); //Musz� dosta� si� do Orlego Gniazda.
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_10"); //No to masz pecha. Nikt nie wejdzie do sto�pu i nikt z niego nie wyjdzie.
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_11"); //A jak Kruk si� tam dosta�?
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_12"); //A sk�d ja mam to wiedzie�? Pewnie ma swoje sposoby.
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_13"); //M�w, albo sko�cz� to co zacz�� ten demon!
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_14"); //Cz�owieku, ja ju� jestem martwy, rozmawiasz z trupem... (kaszel)
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_15"); //Do cholery, musz� dorwa� Hrabiego!
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_16"); //Nie wiem dlaczego Kruk wys�a� swoje bestie przeciwko ludziom Hrabiego, ale w�tpi�, �eby ten jeszcze �y�. Sp�ni�e� si�...
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_17"); //Nie wiadomo, dopiero jak dostan� si� do Orlego Gniazda, b�d� mia� pewno��.
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_18"); //Niech Ci� szlag. Nawet umrze� nie dasz w spokoju!
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_19"); //Dobra. Mam przy sobie klucz do skrzyni Hrabiego. Znajdziesz j� w siedzibie mag�w.
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_20"); //Jest tam jaka� runa, kt�rej ba�em si� u�y�. Mo�e to Ci pomo�e. 
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_21"); //Mimo wszystko... Dzi�ki.
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_22"); //Zaczekaj! Pom� mi... Dobij mnie do cholery!
   
   CreateInvItem(self, Duck_key);
   
	B_StopProcessInfos(self);
};

instance DIA_Fletcher_TheRock1 (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 4;
	condition		= DIA_Fletcher_TheRock1_Condition;
	information		= DIA_Fletcher_TheRock1_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};

FUNC int  DIA_Fletcher_TheRock1_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Fletcher_TheRock))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

func void  DIA_Fletcher_TheRock1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);

   AI_PlayAni(self, "s_woundedb");
	AI_PlayAni(other,"T_YES");
	AI_DrawWeapon (other);
	AI_GotoNpc(other,self);

   AI_PlayAni(other, "T_1HSFINISH");
   
   B_StopProcessInfos(self);
   B_StopProcessInfos(hero);
	Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
	AI_RemoveWeapon (other);
	B_LogEntry(CH5_NC_TheRock, "Znalaz�em Fletchera, wszyscy jego ludzie le�� martwi. Podobno za�atwi� ich demon nas�any przez Kruka. Fletcher twierdzi, �e Kruk nas�a� demony na ludzi Hrabiego, to w�a�nie jego stra�nicy widzieli na blankach Orlego Gniazda. Dobi�em konaj�cego stra�nika, chocia� na to nie zas�u�y�. Przy ciele Fletchera znajd� klucz do kufra Hrabiego, kt�rego mam poszuka� w opuszczonej siedzibie Mag�w Wody w Nowym Obozie. Mo�e w kufrze znajd� co�, co pomo�e mi dosta� si� do kasztelu.");
};