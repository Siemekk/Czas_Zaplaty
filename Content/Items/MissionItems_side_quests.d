/*
//************* Dziwny list *****************
const string strange_demon_entry_1 = "Znalaz�em dziwn� notatk�. Chyba jaki� nekromanta macza� w tym palce. Pisa� co� o Odmie�cu, kt�rego mo�e obawia� si� sam Beliar. Ciekawe co mia� na my�li? Niestety pergamin rozsypa� mi si� w r�kach.";
const string strange_demon_entry_2 = "Znalaz�em zmursza�� kartk� na kt�rej jaki� czarny mag pisa� co� o imieniu Odmnie�ca. Niestety nie wszystko by�o czytelne, uda�o mi si� odcyfrowa� tylko: Orh..gH'A.re...on Kh..th..er. Ciekawe czy to do czego� mi si� przyda?";

func void B_strange_demon_new_entry(var string text)
{
   if (STRANGE_DEMON_KNOW == 1)
	{
      STRANGE_DEMON_KNOW = STRANGE_DEMON_KNOW + 1;
      Log_CreateTopic(Strange_DemonStory, LOG_MISSION);
      Log_SetTopicStatus(Strange_DemonStory, LOG_RUNNING);
      B_LogEntry(Strange_DemonStory, text);
	}
	else if (STRANGE_DEMON_KNOW == 2)
	{
      B_LogEntry(Strange_DemonStory, text);
	};
};

INSTANCE Strange_Letter1 (C_Item)
{	
	name 				=	"Stary pergamin";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ITWR_SCROLL_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseStrange_Letter;
	scemeName			=	"MAPSEALED";
	description			= "Zmursza�y pergamin";
};
func void UseStrange_Letter ()
{   
   STRANGE_DEMON_KNOW = 1;

	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Arcymistrzu,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Odnalaz�em zbiega. Nie mog�em go zwi�za�, cho� poprawnie wypowiedzia�em jego imi�. Zdo�a�em uwi�zi� Odmie�ca w kopalni wraz z dziesi�tkami kopaczy. B�dzie karmi� si� ich duszami przez jaki� czas i mo�e zapomni o nas. Je�eli jednak kto� zbudzi Besti�, nawet sam Beliar mo�e odczu� jego gniew. List posy�am przez nieumar�ego s�ug�, tak b�dzie najbezpieczniej. Wracam do studi�w bo pot�ga �ni�cego zbyt szybko ro�nie w si��..."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Tw�j pokorny s�uga,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "            X.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
	
	
					Doc_Show		(nDocID);
					
	B_strange_demon_new_entry(strange_demon_entry_1);
};

//************* *****************

INSTANCE Strange_Letter2 (C_Item)
{	
	name 				=	"Zmursza�a kartka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseStrange_Letter2;
	scemeName			=	"MAPSEALED";
	description			= "Zmursza�a kartka";
};
func void UseStrange_Letter2 ()
{   
   STRANGE_DEMON_KNOW = 1;
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "W...ki Mi..r.,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Poz...em i.i� Odmi..ca, zwie s..: Orh..gH'A.re...on Kh..th..er"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Niech gniew Beliara spopieli naszych wrog�w!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "            Ur..has, Cza..y Mag");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show(nDocID);
					
	B_strange_demon_new_entry(strange_demon_entry_2);
};

INSTANCE ItFo_Strange_Potion(C_Item)
{
	name 			=	"Dziwna fiolka";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxElixier;	

	visual 			=	"ItFo_Potion_Mana_Perma_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrange_Potion;
	scemeName		=	"POTIONFAST";

	description			= "Dziwna fiolka";
	text[0] = "Od tej niewielkiej butelki,";
	text[1] = "a� emanuje mroczn� energi�.";
	text[2] = "Mo�e lepiej jej nie u�ywa�?";
};

FUNC VOID UseStrange_Potion()
{
	AI_PlayAni (self, "T_PSI_VICTIM");
 	Wld_SpawnNpcRange (self,	StrangeDemon, 1, 300);
 	PrintScreen	("Otwar�e� wrota �mierci...", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
   Party_AddNpc(StrangeDemon);
};*/

/************************
Side quests chapter 1-3

*************************/

INSTANCE Nia_Knif (WeaponsMelee)
{	
	name 				=	"N� Nii";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	510;//80;//40

	damageTotal			= 	60;
	damagetype 			=	DAM_EDGE;		
	range    			=  	60;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	36;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	6;
   visual 				=	"ItMw_1H_Sword_Short_06.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si�a 6";
	TEXT[3] 			= "Wymagana zr�czno�� 36";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//---------------------------------------------------------------------
instance arrow_cristal(C_Item)
{
	name 					=	"Kryszta�";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MULTI;

	value 					=	250;

	visual 					=	"crystalred_part.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;

	description		= "Kawa�ek kryszta�u.";
		
	TEXT[1]				=	"Ten dziwny kamie� nadal";
	TEXT[2]				=	"pulsuje energi�.";
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

INSTANCE konfitury_fake (C_Item)
{
	name 				=	"Cuchn�ce konfitury";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"ItMi_Alchemy_Moleratlubric_01.3DS";

	material 			=	MAT_WOOD;
	on_state [0]		=   UseFakeKonfitury;
	scemeName			=	"FOOD";

	description			= "Ohydne konfitury";
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 25;
};

func void UseFakeKonfitury ()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	-20);
	//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Beeren");
};

INSTANCE konfitury_chest (C_Item)
{
	name 				=	"Konfitury ze skrzyni Draxa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Alchemy_Moleratlubric_01.3DS";

	material 			=	MAT_WOOD;
	on_state [0]		=   UsechestKonfitury;
	scemeName			=	"FOOD";

	description			= "Pyszne konfitury prosto ze skrzyni Draxa";
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 25;
};

func void UsechestKonfitury ()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	15);
	//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Beeren");
};

INSTANCE ItMw_Whistler_Toy (WeaponsMelee)
{	
	name 				=	"Perliste ber�o";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	3200;

	damageTotal			=   45;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	visual 				=	"ItMw_1H_Mace_War_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE stone_note (C_Item)
{	
	name 					=	"Stary pergamin";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemename			 = "MAPSEALED";
	on_state[0]				=	UseStoneLetter;
	description				=	"Zbutwia�a kartka pergaminu";

	TEXT[0]					=	"Kartka wygl�da jakby mia�a si� rozsypa�";
	TEXT[1]					=	"przy pr�bie roz�o�enia.";
};

func void UseStoneLetter ()
{   
	stone_note_read = TRUE;
	//ToDO: nie wiem ;p
	//Snd_Play 		("FoundRiddler");
	PrintScreen	("Odzyska�em wolno��!", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Wld_SpawnNpcRange (self, Non_4122_Kafu, 1, 300);

	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "Zupe�nie nieczytelne pismo."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "(Kartka rozsypuje si� w Twoich d�oniach.)"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

//---------------------------------------------------------------------
INSTANCE Fil_Stone(C_Item)
{	
	name 				=	"Odprysk kamienia filozoficznego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	//hp 					=	1;
	//hp_max 				=	1;
//	//weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Odprysk legendarnego kamienia";
	TEXT[2]				=	"filozoficznego zapewniaj�cy d�ugowieczno��.";
};

INSTANCE kuva_key (C_Item)
{
	name 				=	"Klucz Nabila";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};	

INSTANCE ItFo_Nabil_Poison (C_Item)
{
	name 			=	"Trucizna";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	200;	

	visual 			=	"ItFo_Potion_Master_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UsePoisonNamib;
	scemeName		=	"POTIONFAST";

	description			= "M�tna i cuchn�ca trucizna";
};

FUNC VOID UsePoisonNamib()
{
	//TODO: Zamienic animacje, lub zostawic jak teraz
	//AI_PlayAni		(self,	"T_PSI_VICTIM");
	B_KillNpc			(self);
	Npc_ChangeAttribute	(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
};

INSTANCE ItMi_Martin_Ring (C_Item)
{
	name 				=	"Pi�kny z�oty sygnet";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_RING;

	value 				=	2*Value_GoldRing;

	visual 				=	"ItMi_GoldRing.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE	ItAt_BlackWolfTeeth	(ItAt_Teeth_01)
{
	name				=	"Bia�y kie�";
	
	value				=	250;
	on_state[0] 		= BlackWolfTeeth_use;
	scemename = "MAP";
	description			=	name;
	text[0] = "Ten gwizdek przywo�uje wilka,";
	text[1] = "kt�ry b�dzie walczy� u Twego boku.";
	text[2] = "Chyba, �e zg�odnieje...";

	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

func void BlackWolfTeeth_use()
{
   if (Npc_isdead(My_Wolf))
   {
      AI_PlayAni(self, "T_HEASHOOT_2_STAND" );
      Wld_SpawnNpcRange (self, My_Wolf, 1, 300);
      PrintScreen	("Co to za warczenie?", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
      Party_AddNpc(My_Wolf);
   }
   else
   {
      PrintScreen	("Masz ju� swojego pupila!", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
   };
};

INSTANCE Raven_bottle (C_Item)
{
	name 			=	"Butelka od Kruka";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	1;	

	visual 			=	"ItFo_Potion_Elixier_Egg.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseRavenBot;
	scemeName		=	"POTIONFAST";

	description			= "Butelka od Kruka";
	TEXT[0]				= "W �rodku co� jest...";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_ElixierEgg;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ElixierEgg;
};

func void  UseRavenBot ()
{
	AI_PlayAni		(self,	"T_PSI_VICTIM");
	PutMsg("M�wi�em - nie otwiera�!","font_default.tga",RGBAToZColor(255,100,100,255),_TIME_MESSAGE_LOGENTRY,"");
	CreateInvItem (self, raven_letter);
};

INSTANCE raven_letter (C_Item)
{	
	name 					=	"Zakup latarnii w Khorinis";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseRavenLetter;
	description				=	"List od Kruka do gubernatora Khorinis";

	TEXT[0]					=	"Chyba nie powinienem czyta�";
	TEXT[1]					=	"tego listu...";
};

var int raven_secret_letter;

func void UseRavenLetter ()
{   
	raven_list = TRUE;
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "Pos�uchaj skurwielu!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Nie po to wysy�a�em Ci cholern� rud�, �eby� mia� jeszcze jakie� w�tpliwo�ci! Stary Jack musi znikn�� z latarnii, albo ty znikniesz z tej wyspy. Latarnia b�dzie mi wkr�tce potrzebna. I nie zapominaj, kto wie o twoich machlojkach ze z�otem podatnik�w. Nigdy wi�cej mi si� nie sprzeciwiaj! Kiedy m�wi� skacz, Ty pytasz jak wysoko. Oby to by�o jasne..."					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Kruk, tw�j senny koszmar."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
					if (raven_secret_letter == FALSE)
					{
                  raven_secret_letter = TRUE;
                  B_LogEntry		(CH2_RBL_Lighthouse, "Kruk chce szanta�em wymusi� na gubernatorze Khorinis prawo w�asno�ci do latarnii! Niez�y szwindel.");
					};
};
