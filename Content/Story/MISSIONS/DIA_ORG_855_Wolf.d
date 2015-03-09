//****************************************
//					Hallo
//****************************************
var int Wolf_TradeInvGiven;

INSTANCE DIA_Wolf_Hello (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_Hello_Condition;
	information	= DIA_Wolf_Hello_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT DIA_Wolf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Wolf_Hello_Info()
{
	AI_Output(other, self,"DIA_Wolf_Hello_15_00"); //Kim jeste�?
	AI_Output(self, other,"DIA_Wolf_Hello_09_01"); //Jestem p�atnerzem. M�wi� na mnie Wilk.
};

var int wolf_trade_info;

//****************************************
//				TRADE
//****************************************

instance Org_855_Wolf_TRADE (C_INFO) //edytowane 2012-11-14
{
	npc				= Org_855_Wolf;
	nr				= 800;
	condition		= Org_855_Wolf_TRADE_Condition;
	information		= Org_855_Wolf_TRADE_Info;
	permanent		= 1;
	description		= "Gdzie mog� kupi� jaki� �uk?"; 
};

FUNC int Org_855_Wolf_TRADE_Condition()
{	
   if (!wolf_trade_info)
   {
      return 1;
   };
};

FUNC void  Org_855_Wolf_TRADE_Info()
{
   wolf_trade_info = TRUE;
   
   AI_Output (other, self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Gdzie mog� kupi� jaki� �uk?
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //Trafi�e� pod w�a�ciwy adres. Mam tu dobry towar za bardzo przyst�pn� cen�.
	
   AI_Output (other, self,"Org_855_Wolf_TRADE_15_03"); //Zajmujesz si� czym� jeszcze?
   AI_Output (self, other,"Org_855_Wolf_TRADE_09_04"); //Skupuj� sk�ry i futra od my�liwych. Gdyby� mia� kiedy� taki towar na zbyciu, to zg�o� si� do mnie.
   
   Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Wilk sprzedaje �uki, warto bli�ej przyjrze� si� jego ofercie.");
};

instance Wolf_Container(Npc_Default)
{
	name	=	"Magazynek Wilka";
	//trader start inventory
	CreateInvItems(self,ItMINugget, 500);
	
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems (self,ItMiNugget,12);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,1);
	CreateInvItems (self,ItLsTorch,1);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItAt_Claws_01);		
	CreateInvItem 	(self,ItMw_1H_Sword_06);

	CreateInvItems (self,ItFo_wineberrys_01,5);
   CreateInvItem(self,ItRw_Bow_Small_03);	
	CreateInvItem(self,ItRw_Bow_Long_02);	
	CreateInvItem(self,ItRw_Bow_Long_01);	
	CreateInvItem(self,ItRw_Crossbow_01);	
	CreateInvItem(self,ItRw_Crossbow_Old_01);	

	CreateInvItems(self,ItAmArrow_25,10);
	CreateInvItems(self,ItAmArrow_15,15);
	CreateInvItems(self,ItAmFireArrow,3);
	CreateInvItems(self,ItAmIceArrow,2);
   
   CreateInvItem (self,ItRw_Bow_Long_06);
	CreateInvItem (self,ItRw_Bow_Long_07);
	CreateInvItems (self,ItAmArrow,800);
	CreateInvItems (self,ItAmBolt,800);
	CreateInvItem (self,ItRw_Bow_Long_08);
	
   CreateInvItem (self,ItRw_Crossbow_01);
   CreateInvItem (self,ItRw_Crossbow_02);
   CreateInvItem (self,ItRw_Crossbow_03);

	CreateInvItem(self,ItRw_Bow_Small_01);	
	CreateInvItem(self,ItRw_Bow_Long_01);	
	CreateInvItem(self,ItRw_Crossbow_01);	

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};

INSTANCE DIA_ORG_855_Wolf_Exit (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 999;
	condition	= DIA_ORG_855_Wolf_Exit_Condition;
	information	= DIA_ORG_855_Wolf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_855_Wolf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_855_Wolf_Exit_Info()
{
	Wolf_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(Wolf_Container);
	B_ClearTraderInv(self,container);
	B_StopProcessInfos(self);
};

//-----------------------------------------------------------------
// WOLF TRADE
//-----------------------------------------------------------------
instance ORG_855_Wolf_TRADE2(C_INFO)
{
	npc				= ORG_855_Wolf;
	condition		= ORG_855_Wolf_TRADE2_Condition;
	information		= ORG_855_Wolf_TRADE2_Info;
	//important		= 1;
	permanent		= 1;
	trade 			= 1;
	nr				= 990;
	description		= DIALOG_TRADE;
};

FUNC int ORG_855_Wolf_TRADE2_Condition()
{
   return wolf_trade_info;
};
func void  ORG_855_Wolf_TRADE2_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRADE2_Info_15_01"); //Poka� mi swoje towary.
	AI_Output (self, other,"ORG_855_Wolf_TRADE2_Info_08_02"); //Zapraszam...
	
   if(!Wolf_TradeInvGiven)
	{
      var c_npc container; container = HLP_GetNpc(Wolf_Container);
      B_ClearTraderInv(container,self);		
	};
	Wolf_TradeInvGiven=TRUE;
	
	//Giving "Friendly" prices
	//BEST ONE FOR ARMORS
	Trade_EraseValue();	//BUGFIX has to be in every trade dialog
	Trade_WEAPON_Mul	= mulf(Trade_ALL_Mul,1040187392);	//0.125
	Trade_ARMOR_Mul	 	= mulf(Trade_ALL_Mul,1040187392);	//0.125
	Trade_RUNE_Mul	 	= mulf(Trade_ALL_Mul,1041865113);	//0.15
	Trade_MAGIC_Mul	 	= mulf(Trade_ALL_Mul,1045220557);	//0.20
	Trade_FOOD_Mul	 	= mulf(Trade_ALL_Mul,1049414861);	//0.275
	Trade_POTION_Mul	= mulf(Trade_ALL_Mul,1043542835);	//0.175
	Trade_DOC_Mul	 	= mulf(Trade_ALL_Mul,1045220557);	//0.20
};

//****************************************

INSTANCE DIA_Wolf_RBL2 (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 13;
	condition	= DIA_Wolf_RBL2_Condition;
	information	= DIA_Wolf_RBL2_Info;
	important		= 0;
	permanent		= 0;
	description = "'Chcia�em zapyta� o �uki.'";
	trade 			= 1;
};                       

FUNC INT DIA_Wolf_RBL2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pluskwa_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_RBL2_Info()
{
	AI_Output(other, self,"DIA_Wolf_RBL2_15_00"); //'Chcia�em zapyta� o �uki.'
	AI_Output(self, other,"DIA_Wolf_RBL2_09_01"); //Dobrze trafi�e�, mam najlepszy towar w ca�ej cholernej Kolonii.
	AI_Output(self, other,"DIA_Wolf_RBL2_09_02"); //(szeptem) Pozb�d� si� jako� Pluskwy, inaczej nie pogadamy...
	AI_Output(self, other,"DIA_Wolf_RBL2_09_03"); //To moczymorda, jaki� trunek powinien za�atwi� spraw�.
	B_LogEntry(CH4_NC_RBLBosses, "Nie us�ysz� odpowiedzi, dop�ki nie pozb�d� si� Pluskwy. Stra�nik podobno nie wylewa za kirys.");
   
   ORG_855_Wolf_TRADE2_Info();
};
//****************************************
//			RBL info
//****************************************

INSTANCE DIA_Wolf_RBL (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 11;
	condition	= DIA_Wolf_RBL_Condition;
	information	= DIA_Wolf_RBL_Info;
	important		= 0;
	permanent		= 0;
	description = "Gorn napomkn��, �e dobrze si� ustawi�e� po ataku.";
};                       

FUNC INT DIA_Wolf_RBL_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_RebelTalk))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_RBL_Info()
{
	AI_Output(other, self,"DIA_Wolf_RBL_15_00"); //Gorn napomkn��, �e dobrze si� ustawi�e� po ataku.
	AI_Output(self, other,"DIA_Wolf_RBL_09_01"); //A Tobie co do tego?
	AI_Output(other, self,"DIA_Wolf_RBL_15_02"); //Powiedzmy, �e kogo� interesuje to, co dzieje si� w Waszym obozie.
	AI_Output(self, other,"DIA_Wolf_RBL_09_03"); //Hmm... Na pierwszy rzut oka �mierdzisz stra�nikiem, ale wyczuwam te� subtelny sw�d rebelianta.
	AI_Output(self, other,"DIA_Wolf_RBL_09_04"); //Cavalorn Ci� tu przys�a�?
	AI_Output(other, self,"DIA_Wolf_RBL_15_05"); //Widz�, �e celnie strzelasz nie tylko z �uku.
	AI_Output(self, other,"DIA_Wolf_RBL_09_06"); //Masz jak�� propozycj�?
	AI_Output(other, self,"DIA_Wolf_RBL_15_07"); //Tak. Przej�cie Nowego Obozu przez Gomeza nie tylko na Was rzuci�o blady cie� strachu.
	AI_Output(other, self,"DIA_Wolf_RBL_15_08"); //W odwecie zaatakowali�my Star� Kopalni�.
	AI_Output(self, other,"DIA_Wolf_RBL_09_09"); //Nie�le. Co Gomez zrobi�?
	AI_Output(other, self,"DIA_Wolf_RBL_15_10"); //Stra�nicy zaatakowali nasz ob�z, ale odes�ali�my ich z pozdrowieniami dla Gomeza. Przynajmniej tych, kt�rzy prze�yli.
	AI_Output(self, other,"DIA_Wolf_RBL_09_11"); //Porz�dna jatka! Sporo mnie omin�o. Mamy tu marny przep�yw informacji.
	AI_Output(self, other,"DIA_Wolf_RBL_09_12"); //Rzeczywi�cie, mamy zbie�ne cele. Jak Cavalorn chce to za�atwi�?
	AI_Output(other, self,"DIA_Wolf_RBL_15_13"); //Najpierw mam si� rozejrze� w sytuacji i je�eli zajdzie taka potrzeba, mam Wam pom�c.
	AI_Output(other, self,"DIA_Wolf_RBL_15_14"); //P�niej nadejdzie pora na wykopanie st�d stra�nik�w.
	AI_Output(self, other,"DIA_Wolf_RBL_09_15"); //W porz�dku. Co chcesz wiedzie�?

	B_LogEntry(CH4_NC_RBLBosses, "Wilk z ch�ci� odpowie na moje pytania.");
};

//****************************************

INSTANCE DIA_Wolf_RBL1 (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 12;
	condition	= DIA_Wolf_RBL1_Condition;
	information	= DIA_Wolf_RBL1_Info;
	important		= 0;
	permanent		= 0;
	description = "Na pocz�tek powiesz mi jak wygl�da sytuacja.";
};                       

FUNC INT DIA_Wolf_RBL1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wolf_RBL))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_RBL1_Info()
{
	var C_NPC plus; plus = Hlp_GetNpc(Grd_4086_Pluskwa);

	AI_Output(other, self,"DIA_Wolf_RBL1_15_00"); //Na pocz�tek powiesz mi jak wygl�da sytuacja.
	AI_Output(self, other,"DIA_Wolf_RBL1_09_01"); //Nieciekawie, ale z perspektyw� na przysz�o��.
	AI_TurnToNpc(self, plus);
	AI_Output(self, other,"DIA_Wolf_RBL1_09_02"); //Cholera... Znowu ten gnojek. Udawaj, �e pytasz o �uki...
	AI_TurnToNpc(self, other);
	B_StopProcessInfos	(self);

	/*******************
	Niech do nich podejdzie Pluskwa
	****************/

	AI_GotoWP		(plus, "NC_PLACE04");
};

//****************************************

INSTANCE DIA_Wolf_Reward (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 14;
	condition	= DIA_Wolf_Reward_Condition;
	information	= DIA_Wolf_Reward_Info;
	important		= 0;
	permanent		= 0;
	description = "Pozby�em si� Pluskwy.";
};                       

FUNC INT DIA_Wolf_Reward_Condition()
{
	if (plusk_drink == TRUE)||(plusk_fear == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_Reward_Info()
{
	B_GiveXP(500);
	AI_Output(other, self,"DIA_Wolf_Reward_15_00"); //Pozby�em si� Pluskwy.
	AI_Output(self, other,"DIA_Wolf_Reward_09_01"); //Nie masz poj�cia, jaki Ci jestem wdzi�czny.
	AI_Output(self, other,"DIA_Wolf_Reward_09_02"); //Mam dla Ciebie propozycj�.
	AI_Output(other, self,"DIA_Wolf_Reward_15_03"); //Ca�y zamieniam si� w s�uch.
	AI_Output(self, other,"DIA_Wolf_Reward_09_04"); //Przynie� mi 15 p�ytek pe�zaczy, a zrobi� Ci porz�dny pancerz.
	AI_Output(other, self,"DIA_Wolf_Reward_15_05"); //Dzi�ki, Wilk. Pomy�l� o tym.

	Log_CreateTopic(CH4_MCPlateArmor, LOG_MISSION);
	Log_SetTopicStatus(CH4_MCPlateArmor, LOG_RUNNING);
	B_LogEntry(CH4_MCPlateArmor, "Wilk z wdzi�czno�ci zrobi dla mnie pancerz z p�ytek pe�zaczy. Tylko najpierw musz� si� dowiedzie� jak pozyskiwa� p�ytki i przynie�� mu co najmniej 15 sztuk.");
};

//****************************************

INSTANCE DIA_Wolf_Questions (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 15;
	condition	= DIA_Wolf_Questions_Condition;
	information	= DIA_Wolf_Questions_Info;
	important		= 0;
	permanent		= 0;
	description = "Czas zada� kilka pyta�.";
};                       

FUNC INT DIA_Wolf_Questions_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wolf_Reward))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_Questions_Info()
{
	AI_Output(other, self,"DIA_Wolf_Questions_15_00"); //Czas zada� kilka pyta�.
	AI_Output(self, other,"DIA_Wolf_Questions_09_01"); //Strzelaj, brachu!
};

//****************************************

INSTANCE DIA_Wolf_Questions1 (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 16;
	condition	= DIA_Wolf_Questions1_Condition;
	information	= DIA_Wolf_Questions1_Info;
	important		= 0;
	permanent		= 0;
	description = "Co planujesz?";
};                       

FUNC INT DIA_Wolf_Questions1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wolf_Questions))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_Questions1_Info()
{
	AI_Output(other, self,"DIA_Wolf_Questions1_15_00"); //Co planujesz?
	AI_Output(self, other,"DIA_Wolf_Questions1_09_01"); //To zale�y od rozwoju sytuacji.
	AI_Output(self, other,"DIA_Wolf_Questions1_09_02"); //W tej chwili czekam, patrz� i s�ucham.
	AI_Output(other, self,"DIA_Wolf_Questions1_15_03"); //Mo�e nadesz�a pora, �eby zrobi� pierwszy ruch?
	AI_Output(self, other,"DIA_Wolf_Questions1_09_04"); //Mo�liwe, ale ja go nie wykonam, to zbyt ryzykowne.
	AI_Output(other, self,"DIA_Wolf_Questions1_15_05"); //Rozumiem. Postaram si� znale�� jak�� zach�t�.

	B_LogEntry(CH4_NC_RBLBosses, "Wilk woli si� nie wychyla�. Musz� go przekona�, �e nie jest sam, i �e najwy�sza pora wykopa� stra�nik�w jak najdalej st�d.");
};

//****************************************

INSTANCE DIA_Wolf_Questions2 (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 17;
	condition		= DIA_Wolf_Questions2_Condition;
	information		= DIA_Wolf_Questions2_Info;
	important		= 0;
	permanent		= 0;
	description = "Mam dla Ciebie ciekaw� wiadomo��.";
};                       

FUNC INT DIA_Wolf_Questions2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wolf_Questions1))&&(lares_cooperate > 0)
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_Questions2_Info()
{
	wolf_cooperate = TRUE;

	AI_Output(other, self,"DIA_Wolf_Questions2_15_00"); //Mam dla Ciebie ciekaw� wiadomo��.
	AI_Output(self, other,"DIA_Wolf_Questions2_09_01"); //M�w.
	AI_Output(other, self,"DIA_Wolf_Questions2_15_02"); //Lares te� ma ju� do�� stra�nik�w. Mam Ci przekaza�, �e on i jego ludzie tylko czekaj� na sygna�.
	AI_Output(self, other,"DIA_Wolf_Questions2_09_03"); //No prosz�, jednak co� si� dzieje. Jestem z Wami, ale pod jednym warunkiem.
	AI_Output(other, self,"DIA_Wolf_Questions2_15_04"); //Chyba domy�lam si� do czego zmierzasz...
	AI_Output(self, other,"DIA_Wolf_Questions2_09_05"); //Do walki musi nas poprowadzi� Lee!
	AI_Output(other, self,"DIA_Wolf_Questions2_15_06"); //Zajm� si� tym. Najwa�niejsze, �e jeste� z nami.
	AI_Output(self, other,"DIA_Wolf_Questions2_09_07"); //Porozmawiam z lud�mi, przygotuj� wszystko jak nale�y. Wystarczy, �e dacie sygna�, a Kocio� sp�ynie krwi� stra�nik�w.

	lee_back = lee_back + 1;
	B_LogEntry(CH4_NC_RBLBosses, "Wilk i jego ludzie wezm� udzia� w powstaniu, ale najpierw musz� przekona� Lee, �eby stan�� na czele rebelii.");
};

//****************************************

INSTANCE DIA_Wolf_Questions3 (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 18;
	condition	= DIA_Wolf_Questions3_Condition;
	information	= DIA_Wolf_Questions3_Info;
	important		= 0;
	permanent		= 0;
	description = "Co wiesz o Hrabim?";
};                       

FUNC INT DIA_Wolf_Questions3_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wolf_Questions))&&((Npc_KnowsInfo (hero, DIA_Hrabia_Ore))||(Npc_KnowsInfo (hero, DIA_Hrabia_Trap)))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_Questions3_Info()
{
	AI_Output(other, self,"DIA_Wolf_Questions3_15_00"); //Co wiesz o Hrabim?
	AI_Output(self, other,"DIA_Wolf_Questions3_09_01"); //To i owo. Ale to do�� grz�ski temat.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_02"); //Musz� dowiedzie� si� jak najwi�cej o tym bydlaku!
	AI_Output(self, other,"DIA_Wolf_Questions3_09_03"); //Nie wiem czy to dobry pomys�. Czasami lepiej wiedzie� mniej, d�u�ej si� wtedy �yje, przyjacielu.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_04"); //Nie przyszed�em tu po dobre rady, tylko po odpowiedzi.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_05"); //W porz�dku. Powiem Ci co wiem.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_06"); //Prawdziwym przyw�dc� stra�nik�w w tym obozie jest Hrabia.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_07"); //Fletcher to tylko pionek, kt�ry w ka�dej chwili mo�e znikn�� z gry.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_08"); //Hrabia jest bezwzgl�dny, ale nie szalony. Zmierza do celu po trupach, jednak zawsze ch�odno rachuje.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_09"); //Wydaje mi si�, �e Hrabia nie dzia�a sam. Raz widzia�em go w towarzystwie Kruka. Ci dwaj znaj� si� podobno z lepszych czas�w.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_10"); //Co� Ci powiem, ten duet mo�e pogr��y� ca�� Koloni�. 
	AI_Output(self, other,"DIA_Wolf_Questions3_09_11"); //Wszyscy trz�s� portkami przed Gomezam, ale tak naprawd� trzeba ba� si� Kruka i jego poplecznik�w.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_12"); //To wszystko?
	AI_Output(self, other,"DIA_Wolf_Questions3_09_13"); //Jeszcze jedno. Hrabia... On czego� szuka. Lub raczej kogo�. Jestem pewien, �e nikt o tym nie wie, nawet Kruk.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_14"); //I m�g�bym da� sobie uci�� wszystkie cz�onki, �e dlatego znalaz� si� w Kolonii.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_15"); //Sk�d te przypuszczenia?
	AI_Output(self, other,"DIA_Wolf_Questions3_09_16"); //Hrabia rozmawia� ze mn�, tu� po ataku. Jeszcze nigdy si� tak nie spoci�em ze strachu jak w obecno�ci tego cz�owieka.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_17"); //On jest pusty od �rodka, wypalony i zimny...
	AI_Output(self, other,"DIA_Wolf_Questions3_09_18"); //Zapyta� mnie czy kiedy� s�ysza�em o Xardasie. Oczywi�cie zaprzeczy�em.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_19"); //Ale nie tylko o niego pyta�.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_20"); //Niedawno trafi� tu taki jeden, kt�ry te� zd��y� ju� sporo namiesza�.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_21"); //Nikt nie wie jak naprawd� si� nazywa, wi�c wszyscy m�wi� na niego Bezimienny.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_22"); //Bezimienny? Ma�o oryginalnie.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_23"); //Mo�liwe, ale to sw�j ch�op i te� chce si� st�d jak najszybciej wyrwa�. Powiedzia�em tylko to co i tak wiedz� wszyscy. 
	AI_Output(self, other,"DIA_Wolf_Questions3_09_24"); //Przeszy� mnie wtedy tymi swoimi zimnymi �lepiami i kaza� odej��. Brrry...
	AI_Output(self, other,"DIA_Wolf_Questions3_09_25"); //Hmm. Wy dwaj jeste�cie jakby... szalami tej samej wagi. Ty i Hrabia.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_26"); //Nie rozumiem.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_27"); //My�l�, �e dobrze wiesz o czym m�wi�. Do zobaczenia, przyjacielu.
	B_LogEntry(CH1_Rbl_Hrabia, "Stra�nikom w Nowym Obozie naprawd� przewodzi Hrabia. Wilk twierdzi te�, �e Hrabia pracuje dla Kruka. Mimo to najemnik uwa�a, �e Hrabia nie trafi� do Kolonii przez przypadek. Podobno wypytywa� go o Xardasa i jakiego� Bezimiennego. Ta historia zaczyna si� robi� coraz ciekawsza.");
	B_LogEntry(CH1_Rbl_NoName, "Wilk powiedzia� mi, �e Hrabia wypytywa� o Xardasa i Bezimiennego. Najemnik uwa�a, �e to w�a�nie ci dwaj mog� by� powodem przybycia Hrabiego do Kolonii.");
};

/*********************

Ork zostawi�em nauk� wycinania p�ytek, to b�dzie nagroda dla dicka jak pomo�e wilkowi.

*******************/

//---------------------------------------------------------------------
//	Info SKIN
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SKIN (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SKIN_Condition;
	information	= Info_Wolf_SKIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "W jaki spos�b mam oddzieli� te p�ytki od zw�ok pe�zaczy?";
};                       

FUNC INT Info_Wolf_SKIN_Condition()
{
	if	(Npc_KnowsInfo(hero, DIA_Wolf_Reward) && (!Knows_GetMCPlates))
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SKIN_Info()
{
	AI_Output(hero,self,"Info_Wolf_SKIN_15_01"); //W jaki spos�b mam oddzieli� te p�ytki od zw�ok pe�zaczy?
	AI_Output(self,hero,"Info_Wolf_SKIN_09_02"); //To proste. P�ytki na grzbiecie przymocowane s� tylko przy kraw�dziach.
	AI_Output(self,hero,"Info_Wolf_SKIN_09_03"); //Wystarczy wzi�� ostry n� i 'ci�� wzd�u� przerywanej linii'.
	AI_Output(hero,self,"Info_Wolf_SKIN_15_04"); //W porz�dku. Postaram si� przynie�� Ci kilka p�ytek z pancerzy pe�zaczy.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("Nowa umiej�tno��: Wycinanie p�ytek pancerza", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,	"Wilk, szkodnik z Nowego Obozu, zaproponowa� mi wykonanie zbroi z pancerzy pe�zaczy. Pokaza� mi, jak nale�y je usuwa� z martwych potwor�w."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� usuwania pancerzy z martwych pe�zaczy-wojownik�w.");

	B_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info MCPLATESFEW
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESFEW (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESFEW_Condition;
	information	= Info_Wolf_MCPLATESFEW_Info;
	important	= 0;	
	permanent	= 0;
	description = "Przynios�em Ci kilka p�ytek, o kt�re prosi�e�.";
};                       

FUNC INT Info_Wolf_MCPLATESFEW_Condition()
{
	if	(Knows_GetMCPlates) && (!Npc_KnowsInfo(hero, Info_Wolf_MCPLATESENOUGH))
	&& (Npc_KnowsInfo(hero, DIA_Wolf_Reward))
	&&	(Npc_HasItems(hero, ItAt_CrawlerPlate) > 0)
	&&	(Npc_HasItems(hero, ItAt_CrawlerPlate) < 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Przynios�em Ci kilka p�ytek, o kt�re prosi�e�.
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //To za ma�o, nie wystarczy na ca�� zbroj�.
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Przynie� mi wi�cej p�ytek!
};

//---------------------------------------------------------------------
//	Info MCPLATESENOUGH
//---------------------------------------------------------------------
var int wolf_armor;
INSTANCE Info_Wolf_MCPLATESENOUGH (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESENOUGH_Condition;
	information	= Info_Wolf_MCPLATESENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Zebra�em mn�stwo p�ytek z pancerzy pe�zaczy.";
};                       

FUNC INT Info_Wolf_MCPLATESENOUGH_Condition()
{
	if	(Knows_GetMCPlates)
	&& (Npc_KnowsInfo(hero, DIA_Wolf_Reward))
	&&	(Npc_HasItems(hero, ItAt_CrawlerPlate) >= 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESENOUGH_Info()
{
   wolf_armor = B_SetDayTolerance()+5;
   
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //Zebra�em mn�stwo p�ytek z pancerzy pe�zaczy.
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Fantastycznie! Natychmiast zabieram si� do roboty!
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Jak d�ugo to zajmie?
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH1_09_04"); //Troch� to potrwa, tym bardziej, �e mam te� sporo innych zlece�. Daj mi kilka dni.
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH1_15_05"); //W porz�dku.

	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,	"Da�em Wilkowi 15 tych p�ytek z pancerzy. Teraz potrzebuje troch� czasu, �eby sporz�dzi� z nich dla mnie now� zbroj�.");
	B_GiveXP			(500);
	
	Give_and_remove(ItAt_CrawlerPlate, 15);
	B_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORFINISHED
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORFINISHED (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORFINISHED_Condition;
	information	= Info_Wolf_ARMORFINISHED_Info;
	important	= 1;	
	permanent	= 0;
	description = "";
};                       

FUNC INT Info_Wolf_ARMORFINISHED_Condition()
{
	if	(MCPlatesDelivered == TRUE)
	&&(wolf_armor <= Wld_GetDay())
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED1_09_02"); //Dobrze, �e jeste�. W�a�nie sko�czy�em prac� nad pancerzem.
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED1_15_03"); //Nareszcie sam si� przekonam ile warta jest taka zbroja.
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Dok�adnie, oto i ona! Jest twardsza ni� jakikolwiek pancerz jaki widzia�em na oczy!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Dzi�ki, jestem twoim d�u�nikiem.
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //Nie ma o czym m�wi�. Na pewno na tym nie strac�. Co to, to nie!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_07"); //Teraz jeste�my ju� kwita, przyjacielu.
	
   B_LogEntry			(CH4_MCPlateArmor,	"Wilk sko�czy� ju� moj� now� zbroj�. To najlepszy pancerz, jaki w �yciu widzia�em!");
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_SUCCESS);
	B_GiveXP			(500);

	CreateInvItem		(self, CRW_ARMOR_H);
	B_GiveInvItems      (self,hero,CRW_ARMOR_H,1);
};

//---------------------------------------------------------------------
INSTANCE DIA_Wolf_Sudden (C_INFO)
{
	npc		= Org_855_Wolf;
	condition	= DIA_Wolf_Sudden_Condition;
	information	= DIA_Wolf_Sudden_Info;
	important	= 1;	
	permanent	= 0;
	description 	= "";
};                       

FUNC INT DIA_Wolf_Sudden_Condition()
{
	if (task_choice == 1)&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return TRUE;
	};
};

func VOID DIA_Wolf_Sudden_Info()
{
	B_FullStop (hero);
	AI_GotoNpc (other,self);
	AI_DrawWeapon (self);
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_01"); //Lepiej �eby� mia�... To Ty!
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_02"); //Cholera, ma�o brakowa�o, a zrobi�bym Ci dodatkow� dziur� na oko.
	AI_RemoveWeapon (self);
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_03"); //Ciesz� si�, �e masz stalowe nerwy. Poza tym dwa oczodo�y w zupe�no�ci mi wystarcz�.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_04"); //Niesamowite, przedar�e� si� tutaj noc�. Niez�a robota.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_05"); //Mia�em wa�ny pow�d. Lee wr�ci�.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_06"); //W ko�cu! Czyli nadszed� czas �eby wyj�� zza barykady.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_07"); //Spokojnie. Musimy uderzy� jednocze�nie ze wszystkich stron, wtedy zgnieciemy stra�nik�w zanim zorientuj� si� co si� sta�o.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_08"); //Kiedy wszystko b�dzie gotowe nas�uchuj krzyku harpii, to b�dzie znak do ataku.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_09"); //Przeka�� to moim ludziom.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_10"); //Jak si� tu trzymacie?
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_11"); //Ca�kiem nie�le. Magowie zostawili spore zapasy, a na brak strza�, �uk�w i ry��wki te� nie mo�emy narzeka�.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_12"); //Do tego od czasu do czasu udaje si� ustrzeli� jakiego� stra�nika.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_13"); //Ale ciesz� si�, �e Lee wr�ci�. Na d�u�sz� met� bym tu nie wytrzyma�.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_14"); //Ju� nied�ugo wyjdziecie zza barykady.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_15"); //Naprawd� mi�o by�o zobaczy� Twoj� paskud� mord�. Ale zmykaj ju�, p�ki stra�nicy rozprawiaj� si� z ry��wk�.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_16"); //Pami�taj, krzyk harpii.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_17"); //�ebym tylko nie pomyli� sygna�u ze �miechem Fletchera, he, he.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_18"); //Bywaj, Wilk i trzymaj t� swoj� sfor� na kr�tkim postronku. Przynajmniej na razie.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_19"); //Wracaj ostro�nie, przyjacielu.

	B_LogEntry(CH5_NO_Wolf, "Uda�o si�, porozmawia�em z Wilkiem. Przekaza�em mu wiadomo�� od Lee. Sfora b�dzie czeka� na krzyk harpii. Oby nie czekali za d�ugo... Musz� porozmawia� z Lee.");
};

//---------------------------------------------------------------------
INSTANCE DIA_Wolf_Trunk (C_INFO)
{
	npc		= Org_855_Wolf;
	condition	= DIA_Wolf_Trunk_Condition;
	information	= DIA_Wolf_Trunk_Info;
	important	= 1;	
	permanent	= 0;
	description 	= "";
};                       

FUNC INT DIA_Wolf_Trunk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_TheRock))
	{
		return TRUE;
	};
};

func VOID DIA_Wolf_Trunk_Info()
{
	B_FullStop (hero);
	AI_GotoNpc (other,self);
	AI_DrawWeapon (self);
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_01"); //Znowu si� zgubi�e�?
	AI_Output(hero,self,"DIA_Wolf_Trunk_15_02"); //Mniej wi�cej. Widz�, �e w ko�cu zrobili�cie porz�dek ze stra�nikami.
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_03"); //W �yciu nie s�ysza�em gorszego krzyku harpii ni� ten w wykonaniu Gorna, nawet stra�nik�w to zaskoczy�o, he, he.
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_04"); //Wystrzelali�my ilu si� da�o, a reszt� wyr�n�li�my z bliska.
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_05"); //A teraz mam tu sta� i pilnowa� szparga��w mag�w. To rozkaz Lee, a ja g�upi cieszy�em si� z jego powrotu.
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_06"); //Powinienem teraz le�e� pod �aw� w tawernie...
	AI_Output(hero,self,"DIA_Wolf_Trunk_15_07"); //To mo�e ja Ci� na chwil� zast�pi�?
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_08"); //Tak za darmo? Co� mi tu �mierdzi. Pewnie masz ochot� na magiczny szmelc, h�?
	AI_Output(hero,self,"DIA_Wolf_Trunk_15_09"); //Chc� tylko pom�c. Pomy�le� tylko jaka w tawernie p�ynie teraz rzeka ry��wki...
	
   if (DICK_CHOOSE == 1)
	{
		AI_Output(self,hero,"DIA_Wolf_Trunk_09_10"); //Na mil� �mierdzisz magiem, nie dam si� nabra� na pozorn� dobro�.
	}
	else
	{
		AI_Output(self,hero,"DIA_Wolf_Trunk_09_11"); //Jeste�my w Kolonii, nie wierz� w bezinteresowno��.
	};
	
   AI_Output(self,hero,"DIA_Wolf_Trunk_09_12"); //M�w prawd�.

	Info_ClearChoices (DIA_Wolf_Trunk);
	Info_AddChoice (DIA_Wolf_Trunk, "Po prostu chc� pom�c.", DIA_Wolf_Trunk_Help);
	Info_AddChoice (DIA_Wolf_Trunk, "Szukam pewnej skrzyni.", DIA_Wolf_Trunk_True);
	Info_AddChoice (DIA_Wolf_Trunk, "A co ci do tego?", DIA_Wolf_Trunk_What);
};

// ------------------------------------------------------------------

FUNC VOID DIA_Wolf_Trunk_Help()
{
	AI_Output(hero,self,"DIA_Wolf_Trunk_Help_15_01"); //Po prostu chc� pom�c.
	AI_Output(self,hero,"DIA_Wolf_Trunk_Help_09_02"); //Ta, a ja trafi�em do Kolonii za zbyt d�ugie w�osy.
	AI_Output(self,hero,"DIA_Wolf_Trunk_Help_09_03"); //Cz�owieku, nie jestem idiot�!
	Info_ClearChoices (DIA_Wolf_Trunk);
};

// ------------------------------------------------------------------

FUNC VOID DIA_Wolf_Trunk_What()
{
	AI_Output(hero,self,"DIA_Wolf_Trunk_What_15_01"); //A co ci do tego?
	AI_Output(self,hero,"DIA_Wolf_Trunk_What_09_02"); //Niby nic, ale jak nie powiesz prawdy, to Ci� nie przepuszcz�.
};

// ------------------------------------------------------------------

FUNC VOID DIA_Wolf_Trunk_True()
{
	AI_Output(hero,self,"DIA_Wolf_Trunk_True_15_01"); //Szukam pewnej skrzyni.
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_02"); //Wiedzia�em!
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_03"); //Ty cholerny z�odzieju, m�w co jest w tej skrzyni, podzielimy si� po po�owie.
	AI_Output(hero,self,"DIA_Wolf_Trunk_True_15_04"); //Nic ciekawego, to prywatne rzeczy Hrabiego.
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_05"); //I ty chcesz w tym dobrowolnie grzeba�?!
	AI_Output(hero,self,"DIA_Wolf_Trunk_True_15_06"); //Niezupe�nie dobrowolnie, to pomys� Lee. Mo�e znajd� tam co�, co pomo�e mi dosta� si� do Orlego Gniazda.
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_07"); //Ludzie wy jeste�cie nienormalni! Kto zdrowy na umy�le pcha�by si� do sto�pu?!
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_08"); //Pierdol�, id� si� schla� do tawerny. 
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_09"); //Jak spotkasz Lee, to pozdr�w go ode mnie i powiedz, �e mo�e sobie sam pilnowa� magicznego szmelcu.
	AI_Output(hero,self,"DIA_Wolf_Trunk_True_15_10"); //Powiedzmy, �e to przemilcz�.
	B_LogEntry (CH5_NC_TheRock, "Wilk pozwoli� mi przej��, musz� znale�� skrzyni� Hrabiego.");
	B_StopProcessInfos	(self);

	/*****************
Wilk idzie chla� do knajpy w NO

*******************/

	Npc_ExchangeRoutine(self,"DRUNK");
};

INSTANCE DIA_Wolf_CanYouTeachMe (C_INFO)
{
	npc				= Org_855_Wolf;
	//nr				= 71;
	condition		= DIA_Wolf_CanYouTeachMe_Condition;
	information		= DIA_Wolf_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Wolf_CanYouTeachMe_Condition()
{
	return wolf_trade_info;
};

FUNC VOID DIA_Wolf_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Wolf_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Wolf_CanYouTeachMe_12_02"); //Nie�le radz� sobie z �ukiem, mog� pokaza� Ci to i owo.
	
	Log_CreateTopic(GE_TeacherNC, LOG_NOTE);
	B_LogEntry(GE_TeacherNC, "Wilk nauczy mnie strzela� z �uku.");
};