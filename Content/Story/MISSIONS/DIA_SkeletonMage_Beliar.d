INSTANCE SkelMag_Helper	(Mst_Default_Skeleton)
{
	name							=	"Szkielet";
	Set_SkeletonWarrior_Visuals();
	level							=	12;
	attribute	[ATR_STRENGTH]		=	40;
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	15;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	20;		
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONWARRIOR);

	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
	CreateInvItems (self, ItAt_Kosc, 1);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
	
};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Mag_Beliar_Exit (C_INFO)
{
	npc			= SkeletonMage_Beliar;
	nr			= 999;
	condition	= DIA_Mag_Beliar_Exit_Condition;
	information	= DIA_Mag_Beliar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Mag_Beliar_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Mag_Beliar_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Mag_Beliar_Hello (C_INFO)
{
	npc				= SkeletonMage_Beliar;
	nr				= 1;
	condition		= DIA_Mag_Beliar_Hello_Condition;
	information		= DIA_Mag_Beliar_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Mag_Beliar_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Next1))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Mag_Beliar_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_00"); //Kolejny zb��kany �miertelnik. M�j Pan ucieszy si� na t� dusz�.
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_01"); //Zdaje si�, �e masz co� co jest mi potrzebne.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_02"); //Zach�anno��. M�j Pan szanuje t� przywar�. Czego pragniesz zb��kana duszo?
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_03"); //Szukam pos��ku Beliara. Bior�c pod uwag� z kim rozmawiam i kogo nazywasz swym Panem, to chyba znalaz�em si� we w�a�ciwym miejscu.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_04"); //Dociekliwo��. Tak, posiadam figurk�. Jednak wszystko ma swoj� cen�.
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_05"); //Rzeczywi�cie. Pozw�l, �e wyt�umacz� Ci to bardziej przyst�pnie.
	AI_DrawWeapon (hero);
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_06"); //Oddasz mi pos��ek, albo naprawd� staniesz si� cuchn�cym truch�em!
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_07"); //Gro�ba, szanta�. Tak, wyczuwam w Tobie potencja�. Zainteresowa�e� mojego Pana.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_08"); //Wiedz jednak, �e nie mo�na zdoby� tego czego szukasz si��. Musisz zas�u�y� na �ask� mojego Pana.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_09"); //Dostaniesz pos��ek w zamian za nie�mierteln� dusz�.
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_10"); //O czym Ty m�wisz? Nikomu nie oddam duszy!
	AI_RemoveWeapon (hero);
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_11"); //Zawzi�to��, ale nie ma takiej konieczno�ci. Niedaleko st�d znajdziesz inn� zagubion� dusz� o s�abym umy�le, kt�ry ci�gle b��dzi.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_12"); //Zabij go, uwolnij dusz� tego pot�pie�ca ku chwale mego Pana, a ofiaruj� Ci pos��ek. Dla niego to b�dzie �aska...
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_13"); //Niech ci� szlag, nie jestem morderc�!
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_14"); //Ale� jeste�, zabija�e� ju� wcze�niej, dlaczego nie mia�by� tego uczyni� ponownie?
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_15"); //B�d� tu na Ciebie czeka� �miertelniku.
	B_LogEntry		(CH2_RBL_Tritetra, "Musz� zabi� jakiego� cz�owieka, aby zdoby� pos��ek Beliara. Znajd� tego pechowca gdzie� w pobli�u brzegu.");	
	B_StopProcessInfos	(self);
	Wld_InsertNpc				(VLK_4000_Buddler,"OW_PIR_CAMPFIRE");
};

// **************************************************

INSTANCE DIA_Mag_Beliar_HelloAgain (C_INFO)
{
	npc				= SkeletonMage_Beliar;
	nr				= 1;
	condition		= DIA_Mag_Beliar_HelloAgain_Condition;
	information		= DIA_Mag_Beliar_HelloAgain_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Mag_Beliar_HelloAgain_Condition()
{
	var C_NPC mad; mad = Hlp_GetNpc(VLK_4000_Buddler);

	if (Npc_KnowsInfo(hero,DIA_Mag_Beliar_Hello))&&(Npc_GetDistToNpc(self,hero) < 500)&&(Npc_IsDead(mad))
	{
		return 1;
	};


};

FUNC VOID DIA_Mag_Beliar_HelloAgain_Info()
{
	B_GiveXP (300);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Mag_Beliar_HelloAgain_11_00"); //Dokona�o si�. Oto Twoja zap�ata, �miertelniku.
	AI_Output (other, self, "DIA_Mag_Beliar_HelloAgain_15_01"); //Nawet s�ugusy Beliara dotrzymuj� s�owa. Kto by pomy�la�?
	AI_Output (self, other, "DIA_Mag_Beliar_HelloAgain_11_02"); //Wraz z pos��kiem sp�ynie na Ciebie �aska mojego Pana!
	
	/*************************
	Przyda�o by si� zrobi� pos��ek beliara
	*************************/

	CreateInvItems (self, tri_beliar_statue,1); 	
	B_GiveInvItems (self, other, tri_beliar_statue, 1);
	/****************************
	Nie wiem, jaka� zmiana rutyny, pfx, etc.
	****************************/
	B_LogEntry		(CH2_RBL_Tritetra, "Zdoby�em pierwszy pos��ek Beliara. Musz� jak najszybciej odnie�� figurk� Lerenowi. Dziwnie si� czuj�...");
	B_StopProcessInfos	(self);

};

// **************************************************


INSTANCE DIA_Mag_Beliar_Hello2 (C_INFO)
{
	npc				= SkeletonMage_Beliar;
	nr				= 1;
	condition		= DIA_Mag_Beliar_Hello2_Condition;
	information		= DIA_Mag_Beliar_Hello2_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Mag_Beliar_Hello2_Condition()
{

	if (Npc_KnowsInfo(hero,DIA_Leren_NextStatu))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};


};

FUNC VOID DIA_Mag_Beliar_Hello2_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	CreateInvItems (self, tri_beliar_statue,1); 
	CreateInvItems (self, tri_innos_statue,1); 
	AI_Output (self, other, "DIA_Mag_Beliar_Hello2_11_00"); //Znowu si� spotykamy �miertelniku.
	AI_Output (other, self, "DIA_Mag_Beliar_Hello2_15_01"); //Przyby�em po pos��ki.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello2_11_02"); //Nie po to zagarn��em to plugactwo Innosa, �eby odda� je jakiemu� �miertelnikowi.
	AI_Output (other, self, "DIA_Mag_Beliar_Hello2_15_03"); //Jak rozumiem tym razem nie obejdzie si� bez walki.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello2_11_04"); //Tym razem czeka Ci� �mier�!
	Wld_SpawnNpcRange (self, SkelMag_Helper,2,800);
	B_LogEntry		(CH2_RBL_Tritetra, "�eby odzyska� pos��ki musz� wys�a� Ko�ca do jego Pana.");
	B_StopProcessInfos	(self); 
	Npc_ExchangeRoutine(self,"GraveyardAttack");
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget(self,other); 
	AI_StartState(self,ZS_MM_AttackMage,1,"");
}; 
