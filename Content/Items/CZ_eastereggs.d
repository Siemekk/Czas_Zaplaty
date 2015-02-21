/*
   Pewien z�y mag autorstwa XLukasGX.
   Pisownia oryginalna.
*/

var int przeczytane_PZM; //ksi��ki z�ego maga
var int ksiazka_PZM_01;
var int ksiazka_PZM_02;
var int ksiazka_PZM_03;
var int ksiazka_PZM_04;
var int ksiazka_PZM_05;
var int ksiazka_PZM_06;
var int ksiazka_PZM_07;
var int ksiazka_PZM_08;
var int ksiazka_PZM_09;
var int ksiazka_PZM_10;
var int ksiazka_PZM_11;
var int ksiazka_PZM_12;
var int ksiazka_PZM_13;
var int ksiazka_PZM_14;
var int ksiazka_PZM_15;
const int liczba_ksiazek_PZM = 15;

func void B_czytanie_pewnego_zlego_maga()
{
   if (przeczytane_PZM == liczba_ksiazek_PZM)
   {
      przeczytane_PZM += 1;
      
      PrintScreen("JESTE� WIELKIM FANEM 'PEWNEGO Z�EGO MAGA'!!!", -1, _YPOS_MESSAGE_LEVELUP, "font_old_20_white.tga", 5);
      PrintScreen("DOSTAJESZ +10 DO ZAJEBISTO�CI!!!", -1, _YPOS_MESSAGE_LEVELUP + 20, "font_old_20_white.tga", 5);
   };
};

prototype ItWr_Pewien_zly_mag(C_Item)
{
   name 					=	"Pewien z�y mag";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Opowiadanie - Pewien z�y mag,";
   TEXT[0]				= "co chce zniszczyc kolonie i �wiat";
   TEXT[2]				= "Bestseller";
	TEXT[3]				= "autorstwa XLukasGX";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

instance ItWr_Pewien_zly_mag_01_01(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 1, tom 1";

	on_state[0] = UseItWr_Pewien_zly_mag_01_01;
};

FUNC VOID UseItWr_Pewien_zly_mag_01_01()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 1, tom 1");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Pewnego wieczornego dnia jeden mag rozmy�la� jak zniszczy� �wiat i kolonie.Ten mag stworzy� pewnego demona kt�ry mia� mu s�u�y� i pilnowa� tajemnic zapisanych w swojej bibliotece. Mai�a jedn� ksi��k� kt�r� by�a napisane:'By stworzy� portal by wszy�y na �wiat armie ciemno�ci potrzeba 6 mag�w'Ale mag nie pos�ucha� co by�o napisane spr�bowa� bez jednego maga.");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Gdy zacz�li tworzy� portal to pojawi�o sie iskra czerwona i zgas�a . magowie byli tak s�abi jak ze drugi raz nie pr�bowali.Mag powiedzia� 'trzeba czeka� na wybra�ca kt�ry b�dzie m�g� tworzy� portal tak jak my wszyscy razem wzi�ci moc� b�dzie mia� sile mocy jak nikt inny z mag�w na ty m �wiecie i koloni.gdy pewne go dnia mag imieniem Rox widzia� to zdarzenie co sie dzia� nad niebem pojawia�a sie czerwona iskra i znik�a to go nie zaniepokoi�o ,a by� z znanym magiem wy�szej rangi.Napisa� list do Kr�la Rhobara II.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_01)
   {
      ksiazka_PZM_01 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_01_02(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 1, tom 2";

	on_state[0] = UseItWr_Pewien_zly_mag_01_02;
};

FUNC VOID UseItWr_Pewien_zly_mag_01_02()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 1, tom 2");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy list dotar� to kr�l Rohobar II on nie pos�ucha� maga Roxa i napisa� :'�e �adne g�upia iskra co pojawi�a sie w koloni nie jest naszym za gro�eniem 'Ale mag imieniem Rox ni przesta� zacz�� szuka� w bibliotece w zamku po 24 godzinach sp�dzeniu szukania ksi��ki, znalaz� ja mia�a tytu� 6 mag�w.I przewraca� strony i znalaz� tre��, dziwna iskra i by�o napisane: 'Dawno temu przed lat temu byli");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "magowie robili to w z�ej wierze gdy to chcieli by� pewien mag kt�ry dosta� sie do wie�y i zniszczy� tych mag�w by� to pot�ny od tych mag�w razem wzi�tych mag imieniem Daster kt�ry zauwa�y� dziwna iskr� zniszczy� i zapomniane w tej bibliotece.'Rox zrozumia� ze ten wybraniec ju� dawno nie �yje.i zacz�� czeka� na swoje go wybra�ca.A� pewnego dnia powi� sie na skraju pewien cz�owiek i on nie wiedzia� ze dwaj magowie czekaj� na niego. i on mia� z mieni� los ca�ego �wiata.Magowie sie obwiali po czyjej stronie stanie.... C.D.N.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_02)
   {
      ksiazka_PZM_02 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_02_01(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 2, tom 1";

	on_state[0] = UseItWr_Pewien_zly_mag_02_01;
};

FUNC VOID UseItWr_Pewien_zly_mag_02_01()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 2, tom 1");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy przyby� nasz bohater do koloni po drodze na potka� dw�ch stra�nik�w.I zacz�li go bi� i go kopa� a� nagle b�ysn�a iskra nagle znikn�li stra�nicy.To by� Rox kt�ry uratowa� nasz go bohatera.Rox nie wiedzia� ze nasz bohater to ten cz�owiek kt�ry mia� po krzy�owa� plany z�ego maga .Bezimienny spyta� :'Dlaczego mi pomog�e� przecie� mnie nie znasz.");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Rox odpowiedzia� mu na to pytanie:Wiem pomog�em ci bo ty mi sie wydajesz inny ni� wszyscy skaza�cy razem wzi�ci. Rox w my�lach: Nie wiem czy to ten cz�owiek ale zobaczymy.Bezimienny spyta� Roxa :Kto to byli za stra�nicy kt�rzy mnie zaatakowali byli inni ni� my wszyscy mieli jaki� pentagram na r�kach. Rox powiedzia� mu: To byli nowicjusze z�ego maga nie wiem dlaczego ciebie zaatakowali sie dziwie troch�. Musia�e� by� cenny dala nich.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_03)
   {
      ksiazka_PZM_03 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_02_02(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 2, tom 2";

	on_state[0] = UseItWr_Pewien_zly_mag_02_02;
};

FUNC VOID UseItWr_Pewien_zly_mag_02_02()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 2, tom 2");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Bo rzadko wysy�a nowicjuszy na tak� wypraw� z�y mag. Bezimienny spyta�: A sk�d o tym wiesz czci godny magu przecie� do nich nie nale�a�e�?? Rox odpowiedzia�: �e kiedy� nale�a�em do pewnego z�ego maga w samotnej wie�y by�em 6 magiem studiowa�em u niego kiedy� by�em u niego dobrym uczniem ale opu�ci�em go dawno temu.Ale to d�uga historia p�niej ci opowiem.");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, " Opowiem ci dalszy ci�g gdy przyjdzie odpowiedni pora. gdy bezimienny poszed� z magiem roxem. W opuszczonej wie�y z�e go mag juz poinformowali zwiadowcy ze ich wybraniec ju� jest tu.Mag ju� wiedzia� ze jego by�y ucze� zwany rox chce mu odebra� wybra�ca i nakaza� zabi� roxa jak b�dzie sprawia� k�opoty pojmanie nasze go bohatera. Pewnej nocy przy�ni�o bezimiennemu mu sie : Gdy rox opowiada� zaatakowali i sen sie urywa...C.D.N.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_04)
   {
      ksiazka_PZM_04 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_03_01(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 3, tom 1";

	on_state[0] = UseItWr_Pewien_zly_mag_03_01;
};

FUNC VOID UseItWr_Pewien_zly_mag_03_01()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 3, tom 1");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy bezimienny natychmiast sie obudzi� sie poczu� jakie� dreszcze nagle zemdla�. pewnego ranka przechodzi� tam stra�nik(imieniem goth) kt�ry sprawdza� domki .Nagle przechodzi� ko�o domku bezimiennego ze kto� le�y na ziemi. Stra�nik Goth szybko wezwa� maga Roxa bo on zna� sie na tych sprawach. Stra�nik Goth spyta� maga Roxa :Co jest z nim??");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Rox odpowiedzia�: Nie wiem ale wydaje mi sie ze co� z nim sie dzieje. Rox spojrza� swoja dawno ksi�g� kt�r� ma pod r�kom .ta ksi�ga mia�a nazw� ' Dawne i zakazane moce' i wyszuka� informacje takie: Pewnego dnia by� kiedy� mag kt�ry by� modrym alchemikiem stworzy� mikstur� kt�r� by�a zrobiona z bagiennego ziela o na dawa� moc odzysku pe�ni si� po pewnym koszmarze kt�rym sie triwia tylko nie licznym i co os�abia cz�owieka.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_05)
   {
      ksiazka_PZM_05 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_03_02(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 3, tom 2";

	on_state[0] = UseItWr_Pewien_zly_mag_03_02;
};

FUNC VOID UseItWr_Pewien_zly_mag_03_02()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 3, tom 2");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Rox sie doczyta� ile trzeba sk�adnik�w:20 sztuk bagiennego ziela i 5 fiolka krwi wilka oraz menzurka by wymiesza� sk�adniki. By stworzy� mikstur�:Pierw wrzucamy 20 sztuk bagiennego ziela mieszamy 5 minut oraz 5 fiolek trochu wlewamy fiolki krwi wilka. ");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Rox na szcz�cie mia� pod r�kom 5 fiolek krwi ale mu brakowa�o bagiennego ziela 5 sztuk. Goth obrazu ruszy� do zamku podw�dza� 5 sztuk bagiennego ziela C.D.N");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_06)
   {
      ksiazka_PZM_06 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_04(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 4";

	on_state[0] = UseItWr_Pewien_zly_mag_04;
};

FUNC VOID UseItWr_Pewien_zly_mag_04()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 4");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy w tym czasie stra�nik goth zdobywa� bagienne �ele dla maga roxa. W tym czasie z�y mag ju� knu� pewien plan. Kaza�a pewnemu stra�nikowi z obozu zwany imieniem Taz. Powiedzia� mu tak z�y mag:B�dziesz donosi� mi co robi m�j ucze� zwany rox i b�dziesz p�niej musia� zbi� moje go uczni to ci powiem jak przyjdzie pora.Rox czeka� na bagienne ziele. zacz�� sie martwic czy zd��y go uratowa�.Swojego przyjaciela.A�nagle w biegu przyby� goth");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLines	( nDocID,  1, "z zielem. Rox od razu wzi�� do roboty zacz�� miesza� sk�adniki.Stworzy� mikstur� da� popi� bezimiennemu a� nagle sie obudzi� spyta� sie roxa: rox ty �yjesz my�la�em ze nie �yjesz.Rox spyta:� ale o co chodzi?? bo ca�y czas �y�em.bezimienny od powiedzia�: Rox to by� tylko sen to dobrze �ni�o mi sie ze ty mi opowiadasz jak�� historie o z�ym magu i jego wie�y a tu nagle stwory sie pojawiaj� ci� zbijaj� tu mi sen sie urywa. Rox m�wi Wiesz co zdaje mi sie ze trzeba ci� przygotowa� walce i sztukach magi. Ja ci� nucze w sztuce magi a m�j przyjaciel goth nuczy ci� sztuki walki.C.D.N");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_07)
   {
      ksiazka_PZM_07 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_05_01(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 5, tom 1";

	on_state[0] = UseItWr_Pewien_zly_mag_05_01;
};

FUNC VOID UseItWr_Pewien_zly_mag_05_01()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 5, tom 1");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Naszego bohatera po�udniowego dnia zacz�� trenowa� Goth. Goth powiedzia� do bezimiennego:To b�dzie ci�ka walka nie spodziewaj sie ze ci dam fory. Bezimienny spyta� pewny siebie:A co jak ci� pokonam.Goth opowiedzia�:Nie b�d� taki pewny walczy�em kiedy� w oddzia�ach kr�lewskich jako dow�dca prawej flanki. Jeszcze pami�tam jak Lee walczy�");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "i dobrze kierowa� dzia�ami to by� najlepszy dow�dca i wybitny strateg. Od niego du�o sie nauczy�em walczy� raz przewidywa� zagro�enie.Bezimienny spyta� :Za co tu trafili�cie dlaczego??Goth odpowiedzia� ze z�o�ci�:Wiesz do dzisiaj jestem z�y na naszego kr�la,o skar�y� mnie i Lee o spiskowanie zab�jstwa.Napisali to s�dzi� i burmistrz.Ze my szykujemy plan zabicia kr�la i jego ca�� rodzinne .Mnie oskar�yli o spiskowanie przeciwko kr�lowi a Lee zosta� oskar�ony o zbicie �ony kr�la.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_08)
   {
      ksiazka_PZM_08 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_05_02(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 5, tom 2";

	on_state[0] = UseItWr_Pewien_zly_mag_05_02;
};

FUNC VOID UseItWr_Pewien_zly_mag_05_02()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 5, tom 2");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Do dzi� czekamy a� z st�d sie wydostaniemy zem�cimy sie na kr�la.Dobra bierzmy sie do walki p�niej ci opowiem wieczorem przy piwie.Gdy w tedy bezimienny walczy� z gothem z�y mag ju� mia� pierwsze wie�ci od stra�nika Taza:Czci godny magu mam z�e wie�ci pewien stra�nik imieniem goth uczy jakiego� cz�owieka walki mieczem. Mag z�y odpowiedzia� spokojnie.");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Przygotuj sie by zabi� Roxa lale to juz wieczorem bo on ma go nauczy� pewnej sztuki co ode mnie sie nauczy�.dam ci dobry miecza nosi� go jeszcze pewien mag kt�ry ju� dawno nie �yje. ten miecza ma taka moc ze tylko wybraniec opanowa� jego miecza.Ale dla ciebie b�dzie potrzebny do zbicia maga Roxa.Tylko go nie zgub bo to artefakt cenny.Taz odpowiada:Mistrzu ten miecz jeszcze do ciebie powr�ci. Ruszy� w drog� Taz.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_09)
   {
      ksiazka_PZM_09 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_05_03(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 5, tom 3";

	on_state[0] = UseItWr_Pewien_zly_mag_05_03;
};

FUNC VOID UseItWr_Pewien_zly_mag_05_03()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 5, tom 3");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy Goth trenowa� bezimiennego.Goth zobaczy� ze cienko mu idzie walczy� i mu odpowiedzia�:U�yj si�y woli swojego umys�u. niech twoja r�ka b�dzie jak pi�rko a miecz jak trzyma� kij to ca�a sztuczka w mojej walce.Gdy bezimienny skupi� pojawi�o mus sie nagle przysz�o�� jak goth pr�buje zrobi� pewn� sztuczk� kt�ra bezi nie wiedzia� sam.");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Nagle goth w biego robi obr�t bezimienny obroni� sie przed uderzeniem . Goth zaskoczony.sk�d wiedzia�e� ze sie zrobi� obr�t przecie� ci nie pokazywa�em.Bezimienny odpowiedzia� to co mi kaza�e� skupi�em sie i nagle pojawi� sen jak ty mnie atakujesz przed twoim uderzeniem .Goth zdziwiony widz� ze jeste� inny ni� wszyscy moi uczniowie do stanierz bron i pancerz o de mnie .Bezimienny odpowiedzia� : dzi�ki goth to spotykamy sie wieczorem przy ognisku.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_10)
   {
      ksiazka_PZM_10 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_05_04(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 5, tom 4";

	on_state[0] = UseItWr_Pewien_zly_mag_05_04;
};

FUNC VOID UseItWr_Pewien_zly_mag_05_04()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 5, tom 4");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy bezimienny poszed� spa� po treningu. Goth poszed� do roxa do zamku. Goth :Witaj Rox wiesz co sie zdarzy�o przy treningu zaskoczy� mnie swoja walkom powiedzia�em mu jedn� z moich tajemnic w walce on wykorzysta� o sto razy lepiej u�y� swoje go umys�u wiedzia� kiedy atak nast�pi. Rox odpowiedzia�:");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Wiesz ja to ju� od dawna wiedzia� ze ten cz�owiek jest inny to mo�e by� nasz wybraniec. wiedzia�em w tedy jak jak by� os�abiony itakiej mocy widzenia przez sen.Jak co Zostanie to nasz tajemnica nikt wi�cej sie nie do wie ze mamy wybra�ca. goth i nie m�w nawet naszemu cz�owiekowi kt�rego trenowa�e� dzi�.Gdy zbli�a� sie wiecz�r bezimiennemu znowu przy�ni�o. C.D.N");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_11)
   {
      ksiazka_PZM_11 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_06_01(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 6, tom 1";

	on_state[0]	= UseItWr_Pewien_zly_mag_06_01;
};

FUNC VOID UseItWr_Pewien_zly_mag_06_01()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 6, tom 1");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Pewnego wieczora zacz�o bezimiennemu sie �nic. �ni�o mu sie porwali go dwaj uczniowie z�e go maga do wie�y gdy mia� ju� gada� z�ym magiem . Nagle go budzi Rox: Wstawaj co ci� tak trening wym�czy� cho za mn�.czekamy na ciebie chyba ju� chyba godzin�.Bezimienny wiesz �ni�o mi sie zn�w. Rox za niepokojony : Co ci sie �ni�o???");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "bezimienny Odpowiedzia� pewni uczniowie mnie porwali ci kt�rzy na pocz�tku no wiesz. Zaprowadzili mnie do maga z�ego nie widzia�em jego twarzy mia� czerwone oczy za kaptura iskrzy�y moc�. I w tedy mnie obudzi�e�. Rox odpowiedzia� :Ten sen co� znaczy. bezimienny :Co znaczy??Rox ja wiem sie objawiam sie .Gdy ju� dochodz� do ogniska.Goth podochodzi m�wi :Co tak d�ugo ???Gdy by nie ja to by ca�e piwo wam wypili. Rox odpowiedzia� :posz��m go obudzi� spa�.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_12)
   {
      ksiazka_PZM_12 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_06_02(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 6, tom 2";

	on_state[0]	= UseItWr_Pewien_zly_mag_06_02;
};

FUNC VOID UseItWr_Pewien_zly_mag_06_02()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 6, tom 2");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Bezimienny spyta� przy ognisku :Pami�tasz na pocz�tku jak mnie uratowa�e� mia�e� mi opowiedzie� o sobie i tym z�y magu.Rox opowiedzia�:Dobra opowiem ci.Gdy by�em jeszcze by�em uczniem Pyrokara to by�o jeszcze gdy bariery nie by�o przyby� pewien mag .Kt�ry teraz jest z�ym magiem.Ten mag by� pos�a�cem tez nale�a� do z Rady mag�w Wy�szej.pami�tam jak to dzi�.");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Przyszed� lis od kr�la.Pyrokar wys�a� 13 mag�w by stworzyli barier�.Gdy ja zosta�em przyj�ty do rady mag�w wys�ali mnie do koloni pom�c temu magu co ci m�wi�em.Gdy przyby�em do zamku . mistrz spyta� : idziesz ze mn� do starej wie�y??ja gdy zosta�em magiem rady. Pyrokar� kaza� s�ucha� go pomaga� mu. I w tedy od powiedzia�em ze p�jd� z nim.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_13)
   {
      ksiazka_PZM_13 = true;
      
      przeczytane_PZM+=1;
   };
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_06_03(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 6, tom 3";

	on_state[0]	= UseItWr_Pewien_zly_mag_06_03;
};

FUNC VOID UseItWr_Pewien_zly_mag_06_03()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 6, tom 3");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy doszli�my do wie�y pilnowa� jeden demon.Pewien czar b�ysn�a iskra nagle demon zacz�� m�wi� s�ucha� mistrza.W tedy domy�li�em sie ze jest nekromanta wie�y w beliara.Ale chcia�em pozna� moc beliara uczy�em sie z nim.gdy pewnego latach zacz�o � sie z nim coraz gorzej stawa� sie coraz bardziej mamrota� przez sen.Zniszcz� �wiat ii kolonie .Dla tego go opu�ci�em.");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Do dzi� mnie nie na widzi.Bezimienny odpowiedzia�:czy wiedz� ze znasz ta Inoosa i Beliara. Rox odpowiedzia�: tak ale gdy na pocz�tku przyszy�em prawie magowie chcieli mnie zbi� za to chcieli. Im powiedzia�em ze nie wykorzystam na nich tej mocy i ni kogo nie b�d� uczy�.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_14)
   {
      ksiazka_PZM_14 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_06_04(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Cz�� 6, tom 4";

	on_state[0]	= UseItWr_Pewien_zly_mag_06_04;
};

FUNC VOID UseItWr_Pewien_zly_mag_06_04()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z�y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Cz�� 6, tom 4");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy wszyscy poszli spa� zosta� trojka przy ognisku.Nagle pojawi� sie Taz. Goth spyta� a ty nie nawarcie??Taz ze z�o�ciom opowiedzia�:teraz was zabije opr�cz a wsze go ucznia kt�ry nam sie przyda. Wiem ze chcecie go wykorzysta� i wiem ze ma pot�znom moc.Bezimienny Zaskoczony:Jak� moc i o co mu chodzi??Rox: nie s�ucha go bo to k�amca.");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Taz : to jest prawda od pocz�tku wiemy ze przyby�e� .Nagle przy Rozmowie pojawili sie uczniowie z�e go maga.Taz rozkazuje: bierzcie ich ucznia ja sie zajmie roxem i gothem.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_15)
   {
      ksiazka_PZM_15 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance worek(C_Item)
{
   name 					=	"Worek";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;
   
   scemeName			=	"FOOD";

	description			= "Pewien z�y mag, co chce zniszczyc kolonie i �wiat";
   TEXT[0]				= "";
   TEXT[1]				= "Bestseller";
	TEXT[2]				= "autorstwa XLukasGX";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
   
   on_state[0]	= UseWorek;
};

func void UseWorek()
{
   var c_npc hero; hero = hlp_getnpc(PC_Hero);
   
   CreateInvItem(hero, ItWr_Pewien_zly_mag_01_01);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_01_02);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_02_01);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_02_02);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_03_01);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_03_02);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_04);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_05_01);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_05_02);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_05_03);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_05_04);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_06_01);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_06_02);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_06_03);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_06_04);
};