
/***************************************************

CHAPTER 2 ITEMS

***************************************************/

//Items by Sher

INSTANCE ItMw_2h_Post (WeaponsMelee) 
{	
	name 				=	"Mary";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	75;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	  visual 				=	"ItMw_2H_Sword_Heavy_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/**************************
Itemy by Sher
****************************/
var int nikolas_list;

INSTANCE debt_list(C_Item)
{	
	name 					=	"Lista d�u�nik�w";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseDebt_List;
	description				=	"Lista d�u�nik�w od Nikolasa";

	TEXT[0]					=	"Nikolas spisa� na tej kartce";
	TEXT[1]					=	"list� wszystkich d�u�nik�w.";
};
func void UseDebt_List ()
{   
	var int nDocID;
		
	nDocID = Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
				Doc_PrintLine	( nDocID,  0, "K�amliwe sukinsyny, kt�re wisz� mi rud�:"					);
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, "Leaf - 200 bry�ek + 50 bry�ek odsetek"					);
				Doc_PrintLine	( nDocID,  0, "Lewy - 150 bry�ek + 30 bry�ek odsetek"	);
				Doc_PrintLine	( nDocID,  0, "Prawy - chyba 250 bry�ek, bez odsetek"					);
				Doc_PrintLine	( nDocID,  0, "Aidan - 400 bry�ek + 200 bry�ek odsetek"					);
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLine	( nDocID,  0, "Lewy i Prawy to bracia, obozuj� na szlaku"					);
				Doc_PrintLines	( nDocID,  0, "z prze��czy. Nieopodal Starego Obozu - to �wiry uwa�aj."					);
				Doc_PrintLine	( nDocID,  0, "Leaf i Aidan to cwaniaki z twojego obozu, wi�c"					);
				Doc_PrintLine	( nDocID,  0, "nie powiniene� mie� problemu z odzyskaniem"					);
				Doc_PrintLine	( nDocID,  0, "rudy."					);
				Doc_PrintLine	( nDocID,  0, "Nie zapomnij o odsetkach!"					);
				Doc_PrintLine	( nDocID,  0, "Powodzenia."					);
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
				Doc_Show		( nDocID );

				if (nikolas_list == FALSE)
				{
                 nikolas_list = TRUE;
                 debt_read = TRUE;
                 B_LogEntry		(CH2_TRL_Debt, "Przeczyta�em list� d�u�nik�w: Leaf 200 bry�ek + 50 odsetki, Lewy 150 bry�ek + 30 odsetki, Prawy 250 bry�ek i Aidan 400 bry�ek + 200 odsetki. Ciekawe jak im si� spodobaj� odsetki...");
				};
};

var int Know_DrunkmanSecret;

/**********************
Paczka ziela od Gilberta
*************************/

INSTANCE package_stuff (C_Item)
{
	name 				=	"Paczka ziela";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	text[2] = "Paczka napchana jest";
	text[3] = "zielskiem. A� mi si�";
	text[4] = "kr�ci w g�owie...";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItWrPiwoszNote(C_Item)
{	
	name 					=	"Notatki Piwosza";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	ItWrPiwoszNote_List;
	description				=	"Notatki Piwosza";

	TEXT[0]					=	"Kto by pomysla� �e";
	TEXT[1]					=	"Piwosz potrafi pisa�.";
};
func void ItWrPiwoszNote_List ()
{   
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "..."					);
					Doc_PrintLines	( nDocID,  0, "Nie wiem, co mnie dzi� trafi�o, ale wlaz�em do opuszczonej jaskini na skraju lasu."					);
					Doc_PrintLine	( nDocID,  0, "..."					);
					Doc_PrintLines	( nDocID,  0, "W jaskini musia� mieszka� jaki� alchemik, postanowi�em, �e to jako� wykorzystam, u�yj� jego sprz�tu do p�dzenia bimbru, he he."	);
					Doc_PrintLine	( nDocID,  0, "..."					);
					Doc_PrintLines	( nDocID,  0, "Nie mam poj�cia ile tego nap�dzi�em, ale na pewno od cholery, wezm� cz�� do obozu, reszt� zostawi� sobie na p�niej.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pr�bowa�em wr�ci� po jeszcze kilka sztuk lazurowego trzmiela, ale zrobi�o si� tam cholernie niebezpiecznie..."					);

					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );

					if (Know_DrunkmanSecret == FALSE)
					{
                  Know_DrunkmanSecret = TRUE;
                  Log_CreateTopic	(CH2_RBL_DrunkmanSecret, LOG_MISSION);
                  B_LogSetTopicStatus	(CH2_RBL_DrunkmanSecret, LOG_RUNNING);
                  B_LogEntry		(CH2_RBL_DrunkmanSecret, "W skrzyni Piwosza znalaz�em notatki. Wed�ug tego co tam napisano ten pijak produkowa� alkohol w jakiej� jaskini na skraju lasu.");
					};
};
/******************************************************************************************/
INSTANCE ItKeLeftChest(C_Item)
{
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schl�ssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schl�ssel;
};

// INSTANCE	ItAt_BlackTroSkin	(ItAt_Troll_01)
// {
// 	name				=	"Futro Czarnego Trola";
// 	
// 	value				=	500;
// 	
// 	description			= name;
// 	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
// };

/*******************************************
Katr'akanat
*******************************************/

//**********************Inkunabu�y*********************************
INSTANCE Katrakanat_book(C_Item)
{	
	name 					=	"Zmursza�y inkunabu�";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	500;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Stara ksi�ga";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Katrakanat_book;
};

FUNC VOID Use_Katrakanat_book()
{   
	var int nDocID;
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //Ilo�� stron

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1 Strona
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "(Ksi�ga oprawiona jest w... ludzk� sk�r�!)"			);
					Doc_PrintLine	( nDocID,  0, "(Pod spodem, kto� napisa� co� nier�wnym pismem)");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Ten, kt�ry zechce wyrzec si� �cie�ki mroku i pod��y drog� �wiat�a, pozna prawdziwe �r�d�o pradawnej pot�gi. Dane mu b�dzie u�y� jej, aby skruszy� �a�cuchy zapomnienia i zg��bi� tajemnic� przekl�tego imienia, z pierwszych znak�w s��w spisanych winem �ycia...");

					//2 Strona
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "(ten tekst napisany jest w jakim� nieznanym jezyku)");
					Doc_PrintLine	( nDocID,  1, "Ekh'r angh Irr'atis moones seghill derthan got'h...");
					Doc_PrintLine	( nDocID,  1, "(reszta napisana jest czerwonym inkaustem, albo krwi�)");
					Doc_PrintLine	( nDocID,  1, "Khatar'Egh I'omin Urthen'Ghat est Perths Unisath.");
					Doc_PrintLine	( nDocID,  1, "A'nistur mightr E'night ynerth urthang Mooreth.");
					Doc_PrintLine	( nDocID,  1, "Tehir Un'Athor Methum iseth Yther klothhs.");
					Doc_PrintLine	( nDocID,  1, "Regtun Moostern Inass'Arn erst Ethill Minns Prooth's.");
					Doc_PrintLine	( nDocID,  1, "Anub Is'Artheng Mythn Enis gorth porthal.");
					Doc_PrintLine	( nDocID,  1, "Kenis Broth Innas meriath Vesierth'Sithen urgath.");
					Doc_PrintLine	( nDocID,  1, "Anestor Omin'th Erhran Veris Bhorn tylhr Cethl Enis.");
					Doc_PrintLine	( nDocID,  1, "Nesth Omines Urghat!");
					Doc_PrintLine	( nDocID,  1, "Aestor Nethis Verthon Morrthes Illath...");
					Doc_PrintLine	( nDocID,  1, "T'henn aris!");
					Doc_Show		( nDocID );
				
					
					
					//	Snd_Play 		("FoundRiddler");
					if (katar_rytual == FALSE)
					{
						Wld_PlayEffect("spellFX_MassDeath_GROUND", self, null, 0, 0, 0, true);
                  
						if (!open_kart)
						{
							Wld_SpawnNpcRange (self, Skeleton,4,800);
							Wld_SpawnNpcRange (self, SkeletonWarrior, 2, 800);
							Wld_SpawnNpcRange (self, SkeletonMage, 1, 800);
							Npc_RemoveInvItems(self, Katrakanat_book,1);
						}
						else
						{
							self.attribute[ATR_HITPOINTS] -= self.attribute[ATR_HITPOINTS_MAX] / 4;
						};
					};	
               
               open_kart = TRUE;
};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE KatarMap_Tomb(C_Item)
{	
	name 					=	"Mapa do grobowca";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	10;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseKatarMap_Tomb;

	description				= "Mapa do grobowca";

	TEXT[0]				= "Ratford zaznaczy� na niej grobowiec.";

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

FUNC VOID UseKatarMap_Tomb()
{
	var int nDocID;
		
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_MIS_WORLD_TOMB_KATRAKANAT.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE KatarMap(C_Item)
{	
	name 					=	"Mapa Katrakanat";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	200;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseKatarMap;

	description				= "Mapa Katrakanat";

	TEXT[0]					= "Mapa wskazuj�ca miejsca ukrycia cz�ci Katrakanat.";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]				= ;
	//TEXT[3] 				= "";
	//COUNT[3]				= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseKatarMap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_MIS_WORLD_KATRAKANAT2.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};
	
	
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE JackMap1(C_Item)
{	
	name 					=	"Mapa Aligatora";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	200;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseJackMap1;

	description				= "Mapa Aligatora";

	TEXT[0]					= "Brakuje du�ej cz�ci.";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]				= ;
	//TEXT[3] 				= "";
	//COUNT[3]				= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseJackMap1()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_ALIGATOR_1.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};	
/*****************************
Jaki� model ork trzeba zrobi� do tego
*****************************/


PROTOTYPE Proto_Katrakanat_piece (C_Item)
{
	name 				=	"Kawa�ek kamienia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_M�nze;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
INSTANCE Katrakanat_piece(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
INSTANCE Katrakanat_piece2(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
INSTANCE Katrakanat_piece3(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
INSTANCE Katrakanat_piece4(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
INSTANCE Katrakanat_piece5(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
INSTANCE Katrakanat_piece6(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
//#############################################
//			Grog
//#############################################
	
INSTANCE ItFo_Innos_Booz(C_Item)
{
	name 			=	"�wi�cony bimber";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Grog;	

	visual 			=	"ItMi_Rum_01.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHolybooze;
	scemeName		=	"POTIONFAST";

	description		= 	"�wi�cony bimber";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Grog;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Grog;
};

FUNC VOID UseHolybooze()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS, HP_Grog);
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",90000);
	
   if(Npc_IsPlayer(self))
	{
		PutMsg("Ale ten samogon ma kopa!","font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_LOGENTRY,"");
	};
};		

//#############################################
	
INSTANCE ItFo_Lazur(C_Item)
{
	name 			=	"Lazurowy trzmiel";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	2*Value_Grog;	

	visual 			=	"ItMi_Rum_01.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLazur;
	scemeName		=	"POTIONFAST";

	description		= 	"Legendarny lazurowy trzmiel";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	(2*HP_Grog);
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	(2*Value_Grog);

};

FUNC VOID UseLazur()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS, 2*HP_Grog);
};

//******************pos��ek inosa*****************
instance innos_statue(C_ITEM)
{
	name = "Pos��ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Pi�knie wykonany";
	text[3] = "pos��ek Innosa.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

//tritiera
instance tri_innos_statue(C_ITEM)
{
	name = "Pos��ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 250;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
 	text[2] = "Pi�knie wykonany";
 	text[3] = "pos��ek Innosa,";
 	text[4] = "boga ognia.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance tri_adan_statue(C_ITEM)
{
	name = "Pos��ek Adanosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 250;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Elegancko zdobiony";
	text[3] = "pos��ek Adanosa,";
	text[4] = "boga r�wnowagi.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance tri_beliar_statue(C_ITEM)
{
	name = "Pos��ek Beliara";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 250;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "";
	text[3] = "Pos��ek Beliara,";
	text[4] = "boga ciemno�ci.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

//---------------------------------------------------------------------
INSTANCE Katrakanat(C_Item)
{	
	name 				=	"Katrakanat";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	//hp 					=	1;
	//hp_max 				=	1;
//	//weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Katrakanat - mroczny kamie�";
	TEXT[2]				=	"z zakl�tem jestestwem.";
};

INSTANCE GRD_Prl_Swd (WeaponsMelee)
{	
	name 				=	"Miecz patrolowca";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	150; 	

	damageTotal			= 	58;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40; //12 
	cond_value[2]  		=	(3*cond_value[2])/2; 
	visual 				=	"ITMW_1H_SWORD_LONG_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE magpass(C_Item)
{	
	name 					=	"Przepustka";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	Usemagpass;
	description				=	"Przepustka do mag�w";

	TEXT[0]					=	"Papier jest zniszczony, ale woskowa";
	TEXT[1]					=	"piecz�� jest w dobrym stanie";

};
func void Usemagpass ()
{   
		var int nDocID;
		
		nDocID = Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLines	( nDocID,  0, "(wielka, zalakowana piecz�� i dziwny tekst)"					);
					Doc_PrintLines	( nDocID,  0, "powtarzaj stare zakl�cia ludzko�ci bajki i legendy,"					);
					Doc_PrintLines	( nDocID,  0, "bo tak zdob�dziesz dobro, kt�rego nie zdob�dziesz,"					);
					Doc_PrintLines	( nDocID,  0, "powtarzaj wielkie s�owa, powtarzaj je z uporem,"					);
					Doc_PrintLines	( nDocID,  0, "jak ci co szli przez pustyni� i gin�li w piasku,"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "a nagrodz� ci� za to tym, co maj� pod r�k�"					);
					Doc_PrintLines	( nDocID,  0, "ch�ost� �miechu, zab�jstwem na �mietniku,"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "id�, bo tylko tak b�dziesz przyj�ty do grona zimnych czaszek,"					);
					Doc_PrintLines	( nDocID,  0, "do grona twoich przodk�w..."					);
					Doc_PrintLines	( nDocID,  0, "obro�c�w kr�lestwa bez kresu i miasta popio��w"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "B�d� wierny, Id� i przejd�! "					);
					
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

INSTANCE milten_list(C_Item)
{	
	name 					=	"Lista ingrediencji";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	Usemilten_list;
	description				=	"Lista ingrediencji od Miltena";

	TEXT[0]					=	"Na tym pergaminie Milten spisa�";
	TEXT[1]					=	"list� ro�lin, kt�rych potrzebuje";
};

func void Usemilten_list ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLines	( nDocID,  0, "Spis sk�adnik�w niezb�dnych do stworzenia eliksir�w:"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "- 3 serafisy, no�nik."					);
					Doc_PrintLines	( nDocID,  0, "- 5 piekielnik�w, wzmacniacz."					);
					Doc_PrintLines	( nDocID,  0, "- 3 orkowych zielsk, wyt�umiacz."					);
					Doc_PrintLines	( nDocID,  0, "- 5 wilczych k��w, absorben."					);
					Doc_PrintLines	( nDocID,  0, "- smoczy korze�, zespalacz."					);
					Doc_PrintLines	( nDocID,  0, "- czysty alkohol, destylant."					);
					Doc_PrintLines	( nDocID,  0, "- ��d�o krwiopijcy, neutralizator."					);
					Doc_PrintLines	( nDocID,  0, "- 2 krucze ziela, do smaku."					);
					Doc_PrintLines	( nDocID,  0, "- li�� d�bu, identyfikator."					);
					Doc_PrintLines	( nDocID,  0, "- nasienie czerwonego buka, ???"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Prosz� nie prze�uwa� niczego z tej listy!"					);
					
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );

					if (milten_inged == FALSE)
					{
                  milten_inged = TRUE;
                  B_LogEntry		(CH2_RBL_Plants, "Lista ingrediencji: 3 serafisy, 5 piekielnik�w, 3 orkowe ziela, 5 wilczych k��w, smoczy korze�, czysty alkohol, ��d�o krwiopilcy, li�� d�bu i nasienie czerwonego buka. Lista jest imponuj�ca i gdzie ja do cholery znajd� d�b i czerwony buk?");
					};
};

INSTANCE dragon_root(C_Item)
{	
	name 				=	"Smoczy korze�";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	200;

	visual 				=	"ItFo_Plants_OrcHerb_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	USE_dragon_root1;
	scemeName			=	"FOOD";

	description			= 	name;

	TEXT[1]				= 	NAME_Bonus_Str;				
	COUNT[1]			= 	1;

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	200;
};

FUNC VOID USE_dragon_root1 ()
{
	B_AddAttributePoints(self,ATR_STRENGTH,1);
};

INSTANCE Mis_Jack_BlackPearl(C_Item)
{	
	name 				=	"Czarna per�a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;	

	value 				=	1000;

	visual 				=	"ItMi_DarkPearl.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;

// 	TEXT[1]				= 	NAME_Bonus_Str;				
// 	COUNT[1]			= 	1;

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	200;
};	

//---------------------------------------------------------------------
INSTANCE dusk_power (C_Item) 
{	
	name 				=	"Zorza pot�gi";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	10;

	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Ten miecz nale�a� do zamienionego w o�ywie�ca";
	TEXT[1]				=	"kap�ana ork�w.";
	TEXT[2]				=	"Niestety, po tych wszystkich latach";
	TEXT[3]				=	"nie nadaje si� ju� do u�ytku!";
	TEXT[4]				=	"Zimne �elazo emanuje mroczn� moc�";
	TEXT[5]				=	"i dziwnie pulsuje.";
};

instance akw_ring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_akw_ring;
	on_unequip				=	UnEquip_akw_ring;

	description		= "Pier�cie� z akwamarynem";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Prot_Fire;
	COUNT[3]		= 10;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_akw_ring()
{
	self.protection [PROT_MAGIC] 		+=  5;
	self.protection [PROT_FIRE]		+=  10;
};

FUNC VOID UnEquip_akw_ring()
{
	self.protection [PROT_MAGIC] 		-=  5;
	self.protection [PROT_FIRE]		-=  10;
};

instance poor_sack(C_ITEM)
{
	name = "Sakiewka �wistaka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = "Sakiewka z rud� nale��ca do �wistaka.";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

/******************************************************************************************/
	INSTANCE Adan_Ring(C_ITEM)
{
	name 					=	"Pier�cie�";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItRi_Prot_Mage_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Adan_Ring;
	on_unequip				=	UnEquip_Adan_Ring;

	description		= "Pier�cie� duchowej r�wnowagi";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 1;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Adan_Ring()
{
	self.protection [PROT_MAGIC] 		+=  10;
};

FUNC VOID UnEquip_Adan_Ring()
{
	self.protection [PROT_MAGIC] 		-=  10;
};
	
/******************************************************************************************/
INSTANCE Rat_ring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	300;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Rat_ring;
	on_unequip				=	UnEquip_Rat_ring;

	description		= "Pier�cie� si�y wojownika";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Bonus_Dex;
	COUNT[3]		= 5;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Rat_ring()
{
	B_ChangeAttribute(self,ATR_STRENGTH, 5);
	B_ChangeAttribute(self,ATR_DEXTERITY, 5);
};

FUNC VOID UnEquip_Rat_ring()
{
	B_ChangeAttribute(self,ATR_STRENGTH,- 5);
	B_ChangeAttribute(self,ATR_DEXTERITY, -5);
};

	