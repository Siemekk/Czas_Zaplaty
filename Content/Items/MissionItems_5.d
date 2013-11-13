
/***************************************************

CHAPTER 5 ITEMS

***************************************************/

//Items by Sher

INSTANCE Duck_key (C_Item)
{
	name 				=	"Klucz do kufra Hrabiego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	1;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 1;
};	

INSTANCE ItKe_SunkenTower (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= "Klucz z zatopionej wie�y";
	TEXT[4]				= NAME_Value;					COUNT[4]	= 1;
};	


//*******************

/*********************
Ork to ma by� runa teleportacyjna do Orlego Gniazda, wsad� j� do skrzyni Hrabiego, do kt�rej otwarcia potrzebny jest powy�szy klucz - klucz Dick dostanie od konaj�cego Fletchera
Aha Ork daj w runie teleportacyj hrabiego zmienn� duck_tp = TRUE, b�dzie mi potrzebna w dialogu
********************/

INSTANCE TheRockTP (C_Item)
{
	name 				=	"Runa Hrabiego";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_38.3ds";	//rote Rune
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORTTOTHEROCK;
//mag_circle 			= 	4;   //SN: Teleport-Spells m�ssen auch ohne Circle sprechbar sein!

	description			= 	"Runa teleportacyjna Hrabiego";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};


INSTANCE foodpackage (C_Item)
{
	name 				=	"Paczka z jedzieniem";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_Packet.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	text[2] = "Ta brudna paczka";
	text[3] = "pe�na jest cuchn�cego mi�sa";
	text[4] = "i czerstwego chleba.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


/*************************
list konwojenta
*************************/



INSTANCE convoy_list(C_Item)
{	
	name 					=	"List dow�dcy konwoju";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseConvoy_List;
	description				=	"List znaleziony przy ciele dow�dcy konwoju";

	TEXT[0]					=	"Niestety wi�kszo�� tekstu jest";
	TEXT[1]					=	"nieczytelna i zachlapana krwi�.";
};
func void UseConvoy_List ()
{   


		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "Instrukcja transportowa."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Kopacze m.... zost.. doprowadzeni"					);
					Doc_PrintLine	( nDocID,  0, "w jednym ku..wa k.....u!"	);
					Doc_PrintLine	( nDocID,  0, "Je�eli zn..u zar�niecie kt....o� zanim"					);
					Doc_PrintLine	( nDocID,  0, "dot..ec.. na mi..sc. to wszystkim pou...am j.ja!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Natychmiast po odstawieniu tych wsz..y"					);
					Doc_PrintLines	( nDocID,  0, "wr�cicie do ob..u bo brak..e nam lud.."					);
					Doc_PrintLine	( nDocID,  0, "do esko..o...ia ..anspo..u bro.i."					);
					Doc_PrintLine	( nDocID,  0, "I lepiej ku..a �eby.cie wr�..li"					);
					Doc_PrintLine	( nDocID,  0, "na czas!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Bartholo."					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );


					if (convoy_list_read == FALSE)
					{
					convoy_list_read = TRUE;
					B_LogEntry		(CH5_NC_Convoys, "Przy ciele dow�dcy konwoju kopaczy znalaz�em instrukcj� od magnata Bartholo. Stra�nicy mieli jak najszybciej wr�ci� do Starego Obozu bo magnatom brakuje ludzi do eskortowania transportu broni. M�g�bym zaryzykowa� do��czenie do eskorty, przynajmniej wiedzia�bym kt�r�dy pod���. Musz� porozmawia� o tym z Cordem.");

					};


		
};



INSTANCE weaponpackage (C_Item)
{
	name 				=	"Paczka z broni�";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	250;

	visual 				=	"ItMi_Packet.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	text[2] = "Zawini�ta w brudne szmaty";
	text[3] = "bro� to przewa�nie stary i";
	text[4] = "wyszczerbiony or�.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE itmialarmhorn (C_Item)
{
	name 				=	"Klucz do kufra Hrabiego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	1;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 1;
};	