/***************************************************

CHAPTER 4 ITEMS

***************************************************/

//Items by Sher

//****************G�owy szkodnik�w************
prototype head_org(c_item)
{
   name = "G�owa szkodnika";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual 				=	"Sly_Head.3DS";
	material = MAT_LEATHER;
	description			= 	name;
	text[2] = "To makabryczne trofeum";
	text[3] = "to g�owa jednego z uciekinier�w,";
	text[4] = "kt�rych mia�em zabi� dla Laresa.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

instance HEAD1_org(head_org)
{
};

instance HEAD2_org(head_org)
{
};

instance HEAD3_org(head_org)
{
};

instance HEAD4_org(head_org)
{
};

/************************
Orle gniazdo
*************************/
INSTANCE EN_Bandage (WeaponsMelee)
{	
	name 				=	"Banda�";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
INSTANCE almanach_res (C_Item)
{	
	name 					=	"Almanach odrodzenia";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	500;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Almanach odrodzenia";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usealmanach_res;
};

FUNC VOID Usealmanach_res()
{   
   var int nDocID;
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
            
            //1.Seite
               Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Almanach odrodzenia"			);
            Doc_PrintLine	( nDocID,  0, "-----------");
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Ksi�ga jest oprawiona w �elazo i mied�. Na ok�adzinach wyryto insygnia trzech bog�w. Ta ksi�ga musi by� niezwykle stara. Ciekawe kto j� napisa�?");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Nie rozumiem nic z tego co tu napisano. To jaki� dziwny, archaiczny j�zyk.");
            Doc_Show		( nDocID );
         
            if (alman_read == FALSE)
            {
               Snd_Play("FoundRiddler");
               B_LogEntry(CH4_GRD_RuneSwd, "Znalaz�em almanach! Nic nie zrozumia�em z zapisanego tam be�kotu. Musz� czym pr�dzej zanie�� ksi�g� Lerenowi.");
            
               alman_read = TRUE;
            };
};

INSTANCE alm_log (C_Item)
{	
	name 					=	"Kartka od Lerena";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	Usealm_log;
	description				=	"Kartka od Lerena";

	TEXT[0]					=	"Mag spisa� tu ca�y tekst, kt�ry zdo�a�";
	TEXT[1]					=	"odczyta� z almanachu.";
};
func void Usealm_log ()
{
   var int nDocID;
   
   nDocID = 	Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
            Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
            Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
            
            Doc_PrintLines	( nDocID,  0, "Formu�a rytua�u"					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, "W zasadzie jest to opowie��, a nie konkretna odpowied� na nasze pytania."					);
            Doc_PrintLines	( nDocID,  0, ""	);
            Doc_PrintLines	( nDocID,  0, "Tylko ja pozosta�em po pogromie... Bestia po�ar�a cia�a i dusze mych przyjaci�... Kiedy objawi� si� sam Beliar, nie mia�em ju� �adnych z�udze� - nasta� kres naszej rasy, orkowie zalali nas niczym mo�e w�ciek�o�ci... Dusze i pragnienia najm�niejszych spo�r�d mych braci zosta�y po wsze czasy uwi�zione w plugawym sercu Bestii! Moi bracia odzyskaj� wolno�� tylko wtedy, gdy Bestia zostanie zg�adzona, a jej serce zniszczone z pomoc� mocy gwiezdnych kryszta��w... Jednak moc jaka wtedy zostanie wyzwolona, musi zosta� zamkni�ta w pot�nym artefakcie, inaczej zniszczy ca�� krain�, w kt�rej zosta�a uwolniona! Strze�cie si� Bestii, lecz nie tra�cie nadziei, bo ka�de z�o mo�na zwyci�y�..."					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
         
            Doc_Show		( nDocID );
		
   if (!alm_log_read)
   {
      alm_log_read = TRUE;
      Log_CreateTopic	(CH4_RBL_Almanach, LOG_MISSION);
      Log_SetTopicStatus	(CH4_RBL_Almanach, LOG_RUNNING);
      B_LogEntry		(CH4_RBL_Almanach, "W ko�cu pozna�em histori� spisan� w 'Almanachu odrodzenia'. Aby przywr�ci� ostrzu jego moc, musz� zg�adzi� jak�� Besti� i zniszczy� jej serce za pomoc� gwiezdnych kryszta��w - czymkolwiek by one nie by�y. Musz� porozmawia� z Lerenem, mo�e on rozwik�a t� zagadk�.");
   };
};

/******************************************************************************************/
INSTANCE ItMiJoint_Lester(C_Item)
{
	name 				=	"Podejrzany narkotyk od Lestera";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	2*Value_Joint3;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_4;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_4()
{
	if (!lester_joint)
	&& Npc_IsPlayer (self)
	{
		AI_PlayAni(self,	"T_PSI_VICTIM");
		PutMsg("Moja g�owa!","font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_LOGENTRY,"");
		lester_joint = TRUE;
      
      DreamID = DREAM_BLOODYSWAMP;

	/******************
	Ork nie mam poj�cia jak to chcesz zrobi� tu masz opis od aragorna

   Opis snu:

   Podbiega do nas wiarus. W tle ma miejsce walka mi�dzy templariuszami a besti�. Ob�z p�onie

   wiarus- Nie st�j tak! Dob�d� broni i ruszaj ku chwale �ni�cego!

   Wiarus do��cza do walki, a my zostajemy sami po�r�d rzezi
   Nie mo�emy da� si� zabi� ( m�wi nam o tym Lester we wcze�niejszym dialogu).
   Death = game over
   Trwa walka, w kt�rej potw�r wyrzyna kolejne zast�py wiarus�w. Walczymy z pomocnikami bestii, staraj�c si� do niej nie zbli�a�.
   Po jakim� czasie zjawia si� przy nas Baal Tondral>

   Baal Tondral- �ni�cy o�wieci� m�j umys�! Bestia z�o�y mu pok�on, a ty b�dziesz tym, kt�ry ugnie jej kolana!
   Rick- Cz�owieku, dobrze si� czujesz?
   Baal...- Milcz psubracie! Wypij ten wywar i do boju!!!
   Rick- Oszala�e�? przecie� to trucizna!
   Baal...- Powiedzia�em pij! Nie sprzeciwiaj si� woli �ni�cego!

   Budzimy si� ze snu. Stoi przy nas Lester i rozpoczyna dialog 

   L- Ma�o brakowa�o, a przyp�aci�by� ten eksperyment �yciem. Zauwa�y�e� co� szczeg�lnego? 
   R- Wiem ju� jak zabi� besti�... Potrzebujemy trucizny, bardzo silnego wywaru... 
   L- Zastan�w si� troch�! Sk�d we�miesz odpowiedni� trucizn� i w jaki spos�b nakarmisz ni� potwora?
   R- O to si� nie martw. W obu przypadkach pomo�e nam Baal kt�ry przyby� ostatnio do naszego obozu.
   L- Nie rozumiem...
   R- Zrozumiesz gdy z nim pogadam. Za mn�.

   DZIENNIK
   Zabi� smoka
   3. Mia�em dziwny sen... Dzi�ki niemu dowiedzia�em si� jak zabi� besti�. Potrzebuj� silnej trucizny i kogo� kto dostarczy j� kreaturze. W obu przypadkach pomo�e mi Baal Tondral

   *********************************/
	};
};


/*******************************

Ork dor�b te itemy bo nie wiem jaki model:
beast_heart - serce Bestii
bal_heart - serce Tondrala

Ork zr�b knif, �e jak dick zje serce bestii to si� zamieni w jakiego� ochydnego potwora, mo�e nawet w t� besti�. To oczywi�cie b�dzie game over, chyba, �e gracz b�dzie chcia� zabi� wszystko co �yje w kolonii pod now� postaci� ;)
******************************/

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/**************
Ork trzeba stworzy� ��cznie 10 takich kawa�k�w, czyli 9 bez tego od nefariusa. To b�dzie taki nasz Chromanin xD
Porozsiewaj je gdzie si� da, to moje propozycje:
- wie�a gomeza, jedna ze skrzy�, albo rzucona gdzie� za pakami, �eby nie da�o si� �atwo znale��.
- zatopiona wie�a Xardasa, jedna ze skrzy�.
- chata Cavalorne'a, prywatna skrzynia szefa rblw�.
- szczyt klasztoru zmiennokszta�tnych tam gdzie jest ta skrzynia i trol
- karczma w Nowym Obozie, jedna ze skrzy�, tam gdzie si� p�dzi bimber
- 2 kawa�ki w skrzyniach wie� na terenie ork�w
- �wi�tynia na bagnach, jedna ze skrzy�
- jak si� idzie do ork�w, mija si� Pacho, po prawej s� te kamienne wyst�py p[o kt�rych mo�na wej�� wy�ej. Tam jest jaskinia po drodze, wrzu� tam skrzyni� i jeden kawa�ek mapy


Te kawa�ki to powinny by� puzle, po z�o�eniu wska�� jakie� charakterystyczne miejsce ukrycia tego "skarbu". Oczywi�cie skarb to nie jest g�ra diament�w, super pancerz z kosmosu czy 5m miecz, ale bezcenny dla kap�an�w adanosa Kilt Pierwszego Kap�ana [szat� s�dziego mo�na do tego wykorzysta� czy t� zdobion� szat� mag�w co chyba nie by�a wykorzystana w grze], albo jaka� ksi�ga czy tam pos��ek, sam zdecyduj.
oczywi�cie mo�esz tam te� wrzuci� jak�� super recept�, czarn� rud�, mo�e jak�� run�, etc. Chodzi o to, �eby zrekompensowa� graczowi poszukiwania tego "skarbu"

Jak dick przyniesie nefariusowi wszystkie kawa�ki to ten skleci z tego map� do skarbu i razem rusz� na wypraw�

**************/
prototype treasure_piece(c_item)
{
   name 					=	"Kawa�ek mapy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION|ITEM_MULTI;

	value 					=	10;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseTRM1;

	description				= "Kawa�ek starej mapy";

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

INSTANCE treasure_piece1(treasure_piece)
{	
	on_state[0]				=	UseTRM1;
};

FUNC VOID UseTRM1()
{
   var int nDocID;
   //TODO:
   //Jedna funkcja kt�ra �aczy wszstkie kawa�ki jezeli je posiadasz
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_1.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece2(treasure_piece)
{		
	on_state[0]				=	UseTRM2;
};

FUNC VOID UseTRM2()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_2.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece3(treasure_piece)
{	
	on_state[0]				=	UseTRM3;
};

FUNC VOID UseTRM3()
{
   var int nDocID;
   
   nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_3.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece4(treasure_piece)
{	
	on_state[0]				=	UseTRM4;
};

FUNC VOID UseTRM4()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_4.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece5(treasure_piece)
{	
	on_state[0]				=	UseTRM5;
};

FUNC VOID UseTRM5()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_5.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece6(treasure_piece)
{		
	on_state[0]				=	UseTRM6;
};

FUNC VOID UseTRM6()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_6.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece7(treasure_piece)
{	
	on_state[0]				=	UseTRM7;
};

FUNC VOID UseTRM7()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_7.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece8(treasure_piece)
{		
	on_state[0]				=	UseTRM8;
};

FUNC VOID UseTRM8()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_8.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_map(treasure_piece)
{	
	name 					=	"Mapa do skarbu";

	value 					=	1000;

	on_state[0]				=	UseTRM11;

	description				= name;
};

FUNC VOID UseTRM11()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TREASURE.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

instance treasure_statu(C_ITEM)
{
	name = "Pos��ek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 250;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
// 	text[2] = "Pi�knie wykonany";
// 	text[3] = "pos��ek Innosa,";
// 	text[4] = "boga Ognia.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

//------------------------------
// FOCI
//------------------------------
prototype Focus(C_Item)
{
	name 				=	"Kamie� ogniskuj�cy";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Jeden z pi�ciu artefakt�w u�ytych";
	TEXT[2]				=	"przy tworzeniu Bariery.";
};

INSTANCE Focus_1(Focus)
{	
	name 				=	"Kamie� z morskiego klifu";
};
INSTANCE Focus_2(Focus)
{	
	name 				=	"Kamie� z kanionu trolli";
};
INSTANCE Focus_3(Focus)
{	
	name 				=	"Kamie� z g�rskiej fortecy";
};
INSTANCE Focus_4(Focus)
{	
	name 				=	"Kamie� ze starego klasztoru";
};
INSTANCE Focus_5(Focus)
{	
	name 				=	"Kamie� z kamiennego kr�gu";
};

INSTANCE beast_heart (C_Item)
{
	name 				=	"Serce";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	1000;

	visual 				=	"ItAt_FireGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "To serce pochodzi ze szcz�tk�w";
	TEXT[1]				= "bestii kt�ra pokona�em na bagnach.";
// 	TEXT[2]				= "Jego magiczna moc pozwala";
// 	TEXT[3]				= "podpali� przeciwnika.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Feuerherz;
};
INSTANCE baal_heart (C_Item)
{
	name 				=	"Serce";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	1;

	visual 				=	"ItAt_Molerat_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "Wyj�te z Baala Tondrala!";
// 	TEXT[2]				= "Jego magiczna moc pozwala";
// 	TEXT[3]				= "podpali� przeciwnika.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Feuerherz;
};
