// ************************************************************************************************
// Wert von Kram
// ************************************************************************************************

// Items f�r Objektbenutzung und Item-Interaktion...
// z.B. Krautstampfer, Hammer, Koch�ffel, Laborflasche, Roheisen (Schmiede)
const int	Value_MobsiItem			=	3;

// mit 80% kann bei einem kompletten Durchgang ca. 10 Erz verdient werden
const int	Value_SwordBlade		= 	(Value_1H_Sword_01	*8)/10;	// 80% des Fertigen Schwerts
const int	Value_SwordBladeHot		= 	(Value_SwordBlade	*8)/10;	// 80% der geschliffenen Klinge
const int	Value_SwordRawHot		= 	(Value_SwordBladeHot*8)/10; // 80% der geschmiedeten Klinge
const int	Value_SwordRaw			= 	(Value_SwordRawHot	*8)/10; // 80% des erhitzen Rohstahls

const int	Value_Dietrich			=	10;
const int	Value_Schl�ssel			=	3;

const int	Value_Joint1			=	8;
const int	Value_Joint2			=	15;
const int	Value_Joint3			=	20;
const int	Value_Laute				=	10;

const int	Value_Erzbrocken		=	1;// UNBEDINGT SO LASSEN!!! M.F.
const int	Value_Fackel			=	2;

const int	Value_Sumpfkraut		=	8;
const int	Value_Pfeife			=	10;
const int	Value_Rasiermesser		=	5;// EX 25 NIEDRIGER WERT WEIL ES VIEL DAVON GIBT!!! 
const int	Value_M�nze				=	0;// BITTE AUF 0 LASSEN, DAF�R IST SIE DA, F�R SONST NIX!!!!! M.F.
const int	Value_Sch�ssel			=	4;
const int	Value_Kerzenst�nder		=	10;
const int	Value_Becher			=	 4;
const int	Value_Pokal				=	50;
const int	Value_Besteck			=	15;
const int	Value_Pfanne			=	10;
const int	Value_Krug				=	10; //35
const int	Value_Amphore			=	15; //EX 45
const int	Value_Statue			=	15;

// Alchemie-Ingredienzien
// FIXME: noch benutzen? // NEin, aber liegen �berall ind er Welt, von daher als Ambient Items drinlassen!M.F.
const int	Value_Schwefel			=	20;
const int	Value_Quecksilber		=	25;
const int	Value_Salz				=	10;
const int	Value_�l				=	15;
const int	Value_Moleratfett		=	5;
const int	Value_Alcohol			=	18;

func void UseBlackOre()
{
//if(KnowUpadteRuneSWD)
//{
	PutMsg("Trafienie krytyczne miecza runicznego +1%","font_default.tga",RGBAToZColor(255,75,75,255),8,"");
	RuneSwdCriticalChance=RuneSwdCriticalChance+1;
//};	
};

/*******************************************************************************************
**	Items f�r Mobsi-Benutzung               					  		  				  **
*******************************************************************************************/
INSTANCE ChestTest (C_Item)
{
	name 				=	"test";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	1<<13;

	value 				=	200;

	visual 				=	"PACHOTREASURE.zen";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Dietrich;
};
INSTANCE ItKe_Secret_CM_Enter (C_Item)
{
	name 				=	"Stary klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};	
/******************************************************************************************/
//	Pi�a

INSTANCE ItMi_Saw (C_Item)
{
	name 				=	"Pi�a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	5;

	visual 				=	"ItMi_Saw.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};	

/******************************************************************************************/
//	Dietrich
INSTANCE ItKeLockpick (C_Item)
{
	name 				=	"Wytrych";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Dietrich;

	visual 				=	"ItKe_Lockpick_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Dietrich;
};


INSTANCE ItMi_Broom (C_Item)
{
	name 				=	"Miot�a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Broom.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"BROOM";
	on_state[0]			= 	Use_Broom;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
func void Use_Broom()
{

};
/******************************************************************************************/
//	Schl�ssel

// FIXME: aussagekr�ftigere Schl�sselnamen?
INSTANCE ItKeKey1(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

/******************************************************************************************/
INSTANCE ItKeKey2(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

/******************************************************************************************/
INSTANCE ItKeKey3(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

/******************************************************************************************/
INSTANCE ItKeKey4(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

/******************************************************************************************/
INSTANCE ItKeCavalorn01(C_Item)
{
	name 				=	"Klucz Cavalorna";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};



INSTANCE ItKePiwoszKey (C_Item)
{
	name 				=	"Klucz Piwosza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};	
/******************************************************************************************/
// Krautstampfen
INSTANCE ItMiStomper (C_Item)
{
	name 				=	"Rozdrabniacz";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Stomper_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// Reparieren
INSTANCE ItMiHammer (C_Item)
{
	name 				=	"M�otek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Hammer_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// im Topf r�hren
INSTANCE ItMiScoop (C_Item)
{
	name 				=	"Drewniana �y�ka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Scoop_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// Labor benutzen
// Fixme: wird dabei ein anderes Item generiert?
INSTANCE ItMiFlask(C_Item)
{
	name 				=	"Kolba";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItFo_Potion_Mana_02.3ds";
	material 			=	MAT_GLAS;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};


/******************************************************************************************/
//	SMITH ITEMS
/******************************************************************************************/
INSTANCE ItMiTongs (C_Item)
{
	name 				=	"Szczypce";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItMI_Smith_tongs_wihout_steel.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
INSTANCE ItMi_NotUsed_Tongs_Steel (C_Item)
{
	name 				=	"Szczypce z kawa�kiem �elaza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItMI_Smith_tongs.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
INSTANCE ItMiSwordraw (C_Item)
{
	name 				=	"Stalowy pr�t";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordraw;

	visual 				=	"ItMi_SmithSword_Raw_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMiSwordrawhot (C_Item)
{
	name 				=	"Rozgrzany stalowy pr�t";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordrawhot;

	visual 				=	"ItMi_SmithSword_Rawhot_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMiSwordbladehot (C_Item)
{
	name 				=	"Rozgrzane ostrze";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordbladehot;

	visual 				=	"ItMi_SmithSword_Bladehot_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMiSwordblade	(C_Item)
{
	name 				=	"Ostrze";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordblade;

	visual 				=	"ItMi_SmithSword_Blade_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};




/*******************************************************************************************
**	Items f�r Item-Interaktionen (ohne Mobsi benutzbar)               		 		  	  **
*******************************************************************************************/

// f�r Feuerspucker
INSTANCE ItLsTorchFirespit(C_Item)
{
	name 				=	"Pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH;

	value 				=	Value_MobsiItem;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;

	scemeName			=	"FIRESPIT";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
// zum Rumklimpern
INSTANCE ItMiLute (C_Item)
{
	name 				=	"Lutnia";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	Value_Laute;

	visual 				=	"ItMi_Lute_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"LUTE";
	on_state[0]			= UseLute;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseLute()
{
	if (Play_Lute == FALSE)
	&& Npc_IsPlayer (self)
	{
		B_GiveXP (10);
		Play_Lute = TRUE;
	};
};


/******************************************************************************************/
// F�r Babe-Luftzuf�cheln
INSTANCE ItMiWedel(C_Item)
{
	name 				=	"Li�� palmowy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual				=	"ItMi_Wedel_01.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"COOLAIR";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
// F�r Babe-Putzen
INSTANCE ItMiBrush(C_Item)
{
	name 				=	"Szczotka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual				=	"ItMi_Brush_01.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"BRUSH";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
INSTANCE ItMiJoint_1(C_Item)
{
	name 				=	"Zielony nowicjusz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint1;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_1;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_1()
{

	if Npc_IsPlayer (self)
	{
		if(Firstjoint == FALSE)
		{
		B_GiveXP (25);
		Firstjoint = TRUE;		
		};	
		var int halfOfWay;
		if(Joint_Counter<Joint_Needed/2)
		{
			halfOfWay=true;	//before smoke half still wasn't reached
		};
		Joint_Counter+=1;
		if(Joint_Counter==Joint_Needed)
		{
			B_AddAttributePoints(hero,ATR_MANA_MAX,Joint_MANA_Incease);
			halfOfWay=false;
			Joint_Counter=0;
			
		}
		else if(Joint_Counter>=Joint_Needed/2)&&(halfOfWay)
		{
			//Sher, zrob cos z tym :D
			PutMsg("Czujesz oczyszczenie umys�u...","font_default.tga",RGBAToZColor(155,155,255,255),_TIME_MESSAGE_LOGENTRY,"");
		};
	};
};
/******************************************************************************************/
INSTANCE ItMiJoint_2(C_Item)
{
	name 				=	"Mrok p�nocy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint2;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_2;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_2()
{
	if Npc_IsPlayer (self)
	{
		if(secondjoint == FALSE)
		{
		B_GiveXP (50);
		secondjoint = TRUE;		
		};	
		var int halfOfWay;
		if(Joint_Counter<Joint_Needed/2)
		{
			halfOfWay=true;	//before smoke half still wasn't reached
		};
		Joint_Counter+=2;
		if(Joint_Counter==Joint_Needed)
		{
			B_AddAttributePoints(hero,ATR_MANA_MAX,Joint_MANA_Incease);
			halfOfWay=false;
			Joint_Counter=0;
		}
		else if(Joint_Counter>=Joint_Needed/2)&&(halfOfWay)
		{
			//Sher, zrob cos z tym :D
			PutMsg("Czujesz oczyszczenie umys�u...","font_default.tga",RGBAToZColor(155,155,255,255),_TIME_MESSAGE_LOGENTRY,"");
		};
	};
};
/******************************************************************************************/
INSTANCE ItMiJoint_3(C_Item)
{
	name 				=	"Zew nocy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint3;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_3;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_3()
{
	if Npc_IsPlayer (self)
	{
		if(Thirdjoint == FALSE)
		{
         B_GiveXP (50);
         Thirdjoint = TRUE;		
		};	
		var int halfOfWay;
		if(Joint_Counter<Joint_Needed/2)
		{
			halfOfWay=true;	//before smoke half still wasn't reached
		};
		Joint_Counter+=3;
		if(Joint_Counter==Joint_Needed)
		{
			B_AddAttributePoints(hero,ATR_MANA_MAX,Joint_MANA_Incease);
			halfOfWay=false;
			Joint_Counter=0;
		}
		else if(Joint_Counter>=Joint_Needed/2)&&(halfOfWay)
		{
			//Sher, zrob cos z tym :D
			PutMsg("Czujesz oczyszczenie umys�u...","font_default.tga",RGBAToZColor(155,155,255,255),_TIME_MESSAGE_LOGENTRY,"");
		};
	};
};

/******************************************************************************************/
INSTANCE ItMiNugget(C_Item)
{
	name 				=	"Bry�ka rudy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Erzbrocken;

	visual 				=	"ItMi_Nugget_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
INSTANCE ItMiBlackOre(C_Item)
{
	name 				=	"Czarna ruda";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_BlackNugget_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	on_state[0]			= UseBlackOre;
	scemeName			=	"MAPSEALED";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};



/******************************************************************************************/
//	Fackel			                					  **

INSTANCE ItLsTorch(C_Item)
{
	name 				=	"Pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH|ITEM_MULTI;

	value 				=	Value_Fackel;

	visual 				=	"ItLs_Torch_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};

/******************************************************************************************/
INSTANCE ItLsTorchburning(C_Item)
{
	name 				=	"P�on�ca pochodnia";
	id					= ItLsTorchburning;
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH;

	value 				=	3;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;
//	weight 				=	 1/10;
	description			= name;
	//	TEXT[4]				= NAME_Value;					COUNT[4]	= 3;
};

INSTANCE ItLsTorchburning_2(C_Item)
{
	name 				=	"P�on�ca pochodnia";
	id					= ItLsTorchburning;
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH;

	value 				=	100;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;
	description			= name;
		TEXT[4]				= "Pono� p�onie magicznym ogniem";
};


/******************************************************************************************/
INSTANCE ItLsTorchburned(C_Item)
{
	name 				=	"Pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItLs_Torchburned_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	//	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};




/******************************************************************************************/
//STUFF//
/******************************************************************************************/

// Sumpfkraut (f�r Joints)
INSTANCE ItMi_Plants_Swampherb_01(C_Item)
{
	name 				=	"Bagienne ziele";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sumpfkraut;

	visual 				=	"ItMi_Plants_Swampherb_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Pipe_01 (C_Item)
{
	name 				=	"Fajka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pfeife;

	visual 				=	"ItMi_Stuff_Pipe_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Barbknife_01 (C_Item)
{
	name 				=	"Brzytwa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Rasiermesser;

	visual 				=	"ItMi_Stuff_Barbknife_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_OldCoin_01 (C_Item)
{
	name 				=	"Moneta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_M�nze;

	visual 				=	"ItMi_Stuff_OldCoin_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//	M�nze mit Mission Flag um tote liegenzulassen
INSTANCE ItMi_Stuff_OldCoin_02 (C_Item)
{
	name 				=	"Moneta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_M�nze;

	visual 				=	"ItMi_Stuff_OldCoin_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Plate_01 (C_Item)
{
	name 				=	"Talerz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sch�ssel;

	visual 				=	"ItMi_Stuff_Plate_01CZ.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Candel_01 (C_Item)
{
	name 				=	"�wiecznik";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Kerzenst�nder;

	visual 				=	"ItMi_Stuff_Candel_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Cup_01 (C_Item)
{
	name 				=	"Kubek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Becher;

	visual 				=	"ItMi_Stuff_Cup_01CZ.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Cup_02 (C_Item)
{
	name 				=	"Puchar";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pokal;

	visual 				=	"ItMi_Stuff_Cup_02.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Silverware_01 (C_Item)
{
	name 				=	"Sztu�ce";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Besteck;

	visual 				=	"ItMi_Stuff_Silverware_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Pan_01 (C_Item)
{
	name 				=	"Patelnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pfanne;

	visual 				=	"ItMi_Stuff_Pan_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Mug_01 (C_Item)
{
	name 				=	"Dzban";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Krug;

	visual 				=	"ItMi_Stuff_Mug_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Amphore_01 (C_Item)
{
	name 				=	"Amfora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Amphore;

	visual 				=	"ItMi_Stuff_Amphore_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Idol_Ogront_01 (C_Item)
{
	name 				=	"Pos��ek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Statue;

	visual 				=	"ItMi_Stuff_Idol_Ogront_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
//ALCHIMIE//
/******************************************************************************************/
INSTANCE ItMi_Alchemy_Sulphur_01 (C_Item)
{
	name 				=	"Siarka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Schwefel;

	visual 				=	"ItMi_Alchemy_Sulphur_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Quicksilver_01 (C_Item)
{
	name 				=	"Rt��";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Quecksilber;

	visual 				=	"ItMi_Alchemy_Quicksilver_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Salt_01 (C_Item)
{
	name 				=	"S�l";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Salz;

	visual 				=	"ItMi_Alchemy_Salt_01CZ.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Syrianoil_01 (C_Item)
{
	name 				=	"Olej syrianiczny";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_�l;

	visual 				=	"ItMi_Alchemy_Syrianoil_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Moleratlubric_01 (C_Item)
{
	name 				=	"Sad�o kretoszczura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Moleratfett;

	visual 				=	"ItMi_Alchemy_Moleratlubric_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Alcohol_01 (C_Item)
{
	name 				=	"Czysty alkohol";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Alcohol;

	visual 				=	"ItMi_Alchemy_Alcohol_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};




/*******************************************************************************************
**	Musikinstrumente InExtremo    					  		  							  **
*******************************************************************************************/

// Werden nicht gebraucht, wenn den Jungs die Instrumente in der Hand "kleben"!
/*
INSTANCE ItMiLuteIE (C_Item)
{
	name 				=	"Laute";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Lute_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

INSTANCE ItMiBluepipe(C_Item)
{
	name 				=	"Dudelsack";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Bagpipe_Blue_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

INSTANCE ItMiYellowpipe (C_Item)
{
	name 				=	"Dudelsack";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Bagpipe_Yellow_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

INSTANCE ItMiDrumscheit (C_Item)
{
	name 				=	"Drumscheit";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Drumscheit_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

INSTANCE ItMiDrumstick (C_Item)
{
	name 				=	"Trommelst�cke";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Drumstick_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

INSTANCE ItMiCello (C_Item)
{
	name 				=	"Cello";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Cello_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

INSTANCE ItMiCellobow (C_Item)
{
	name 				=	"Cello Bogen";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Cellobow_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

INSTANCE ItMiHarp (C_Item)
{
	name 				=	"Harfe";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Harp_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

*/
INSTANCE Fakescroll(C_Item)
{	
	name 					=	"List";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

// 	hp 						=	5;
// 	hp_max 					=	5;
// 	weight 					=	1;
	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAPSEALED";	
	on_state[0]			= UseFakescroll;
	
	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};
func void UseFakescroll()
{
		Snd_Play ("MAP_UNFOLD");

};

INSTANCE ItKe_deep_01(C_Item)
{
	name 				=	"Stary klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

INSTANCE ItKe_deep_02(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};