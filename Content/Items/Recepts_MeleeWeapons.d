//**////////////////////////////////////////////**
//**	R E C E P T S							**
//**////////////////////////////////////////////**
//** F O R   M O R E   S E E - ReceptStuff.d	**
//**////////////////////////////////////////////**
//** - O R C W A R R I O R						**
//**////////////////////////////////////////////**

/*Jezeli 3 podstawowe zmienne poswi�cone na skladniki produktu recepty nie wystarczaj�, 
mozna uzy� protection(Instance sk�adnik�w) i damage(wymagana ilo�� sk�adnika). 
Max. dodatkowych przedmiot�w to 8 (od 0 do 7)
*/

//ALL RECEPTS PROTO
//
/*
INSTANCE Recept_$instanceproduktu(Recept_Proto)
{
	name 					=	"Recepta";//Nazwa:Nie zmienia�
	mainflag 				=	ITEM_KAT_DOCS;//Kategoria:nie zmieniac
//	makingmob				=	1;//na czym sie robi item
	product_amount			=	1;//ilo�� wyprodukowanych produkt�w np. 50 = 50 strza�
	product					=	1;//instance produktu
	needitm_amount[0]				=	1;	//wymagana ilo�c przedmiotu 1
	needitm_amount[1]				=	1;	//wymagana ilo�c przedmiotu 2	
	needitm_amount[2]				=	1;	//wymagana ilo�c przedmiotu 3
	damage[0]				=	1;	//wymagana ilo�c przedmiotu 4
	damage[1]				=	1;	//wymagana ilo�c przedmiotu 5		
	damage[2]				=	1;	//wymagana ilo�c przedmiotu 6	
	damage[3]				=	1;	//wymagana ilo�c przedmiotu 7
	damage[4]				=	1;	//wymagana ilo�c przedmiotu 8	
	damage[5]				=	1;	//wymagana ilo�c przedmiotu 9
	damage[6]				=	1;	//wymagana ilo�c przedmiotu 10	
	damage[7]				=	1;	//wymagana ilo�c przedmiotu 11	
	needitm[0]				=	1;	//instance przedmiotu 1
	needitm[1]				=	1;	//instance przedmiotu 2
	needitm[2]				=	1;	//instance przedmiotu 3	
	protection[0]				=	1;	//instance przedmiotu 4	
	protection[1]				=	1;	//instance przedmiotu 5		
	protection[2]				=	1;	//instance przedmiotu 6	
	protection[3]				=	1;	//instance przedmiotu 7
	protection[4]				=	1;	//instance przedmiotu 8	
	protection[5]				=	1;	//instance przedmiotu 9
	protection[6]				=	1;	//instance przedmiotu 10	
	protection[7]				=	1;	//instance przedmiotu 11			
	value 					=	50;    //wartosc :P raczej pozostawiac bez zmian
	range				=	1;  //wymagana ilosc umiejetnosci (umiejetnosc zalezna od //	makingmob, puki //	makingmob nie ustalony daj tylko liczby)

	visual 					=	"ItWr_Scroll_01.3ds";    //wiadomo
	material 				=	MAT_LEATHER;                      //wiadomo

	scemeName				=	"NONE";	
	text[0] 				=	"Dzi�ki tej recepcie mog� wytworzy� Przedmiot";		
	on_state[0]			=	UseRecept;		
	//zr�b tak ze jezeli nie ustalono jakiegos instance albo amounta to zeby sie nie dopisywa�, a jak nie ustalono amounta itema a instance jest to  zeby jakis alert sie pojawia�( i na odwr�t tez)
	
};*/

INSTANCE Recept_ItMw_1H_Sword_Short_01 (Recept_Proto)
{
	makingmob				=	R_BS;
	product_amount			=	1;	
	product					=	ItMw_1H_Sword_Short_01;
	
	needitm_amount[0]				=	2;//20 +...	
	needitm_amount[1]				=	1;//15 +...	
	needitm_amount[2]				=	31;//31 = 66/zarobek 8 bry�ek :D	
	
	needitm[0]						=	ItMa_Iron;
	needitm[1]						=	ItMa_Wool;		
	needitm[2]						=	ItMiNugget;				
	value 					=	50;//144 - cena miecza
	range				=	16;//na 100% szans wykucia

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[0] 				=	"Dzi�ki tej recepcie mog� wytworzy� kr�tki miecz";//Wpisana nazwa miecza!		
	on_state[0]			=	UseRecept;
   description = name;
};

INSTANCE Recept_ItMw_1H_Sword_Short_02 (Recept_Proto)
{
	makingmob				=	R_BS;
	product_amount			=	1;	
	product					=	ItMw_1H_Sword_Short_02;
	
	needitm_amount[0]				=	2;//20 +...	
	needitm_amount[1]				=	1;//15 +...	
	needitm_amount[2]				=	36;//36 +...
	damage[0]						=	1;//10 = 81//zarobek 16 bry�ek
	needitm[0]						=	ItMa_Iron;
	needitm[1]						=	ItMa_Wool;		
	needitm[2]						=	ItMiNugget;	
	protection[0]					=	ItMa_lumber;
				
	value 					=	50;//196 - cena miecza
	range				=	19;//+3 //na 100% szans wykucia

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[0] 				=	"Dzi�ki tej recepcie mog� wytworzy� ch�opski miecz";//Wpisana nazwa miecza!		
	on_state[0]			=	UseRecept;		
   description = name;
};

INSTANCE Recept_ItMw_1H_Sword_Short_03 (Recept_Proto)
{
	makingmob				=	R_BS;
	product_amount			=	1;	
	product					=	ItMw_1H_Sword_Short_03;
	
	needitm_amount[0]				=	2;//20 +...	
	needitm_amount[1]				=	1;//60 +...	
	needitm_amount[2]				=	30;//30 = 110 /zarobek 18
	needitm[0]						=	ItMa_Iron;
	needitm[1]						=	ItAt_WolfSkin;		
	needitm[2]						=	ItMiNugget;	
				
	value 					=		50;//256 - cena miecza
	range				=	22;//+3 //na 100% szans wykucia

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[0] 				=	"Dzi�ki tej recepcie mog� wytworzy� j�zyk topielca";//Wpisana nazwa miecza!		
	on_state[0]			=	UseRecept;		
   description = name;
};

INSTANCE Recept_ItMw_1H_Sword_Short_04 (Recept_Proto)
{
	makingmob				=	R_BS;
	product_amount			=	1;	
	product					=	ItMw_1H_Sword_Short_04;
	
	needitm_amount[0]				=	1;//10 +...	
	needitm_amount[1]				=	1;//60 +...	
	needitm_amount[2]				=	20;//20 +...
	damage[0]						=	1;//40=140/zarobek 22
	
	needitm[0]						=	ItMa_Iron;
	needitm[1]						=	ItAt_WolfSkin;		
	needitm[2]						=	ItMiNugget;	
	protection[0]					=	ItMa_Steel;			
	value 					=		50;//324 - cena miecza
	range				=	25;//+3 //na 100% szans wykucia

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[0] 				=	"Dzi�ki tej recepcie mog� wytworzy� k�uj�cy cier�";//Wpisana nazwa miecza!		
	on_state[0]			=	UseRecept;		
   description = name;
};

INSTANCE Recept_ItMw_1H_Sword_Short_05 (Recept_Proto)
{
	makingmob				=	R_BS;
	product_amount			=	1;	
	product					=	ItMw_1H_Sword_Short_05;
	
	needitm_amount[0]				=	1;//10 +...	
	needitm_amount[1]				=	1;//84 +...	
	needitm_amount[2]				=	36;//36 +...
	damage[0]						=	1;//40=170/zarobek 30
	
	needitm[0]						=	ItMa_Iron;
	needitm[1]						=	ItAt_SnapperSkin;		
	needitm[2]						=	ItMiNugget;	
	protection[0]					=	ItMa_Steel;			
	value 					=		50;//400 - cena miecza
	range				=	28;//+3 //na 100% szans wykucia

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[0] 				=	"Dzi�ki tej recepcie mog� wytworzy� z�b kopacza";//Wpisana nazwa miecza!		
	on_state[0]			=	UseRecept;		
   description = name;
};

INSTANCE Recept_ItMw_2H_Staff_01(Recept_Proto)
{
	product_amount			=	1;
	product				=	ItMw_2H_Staff_01;
	needitm[0]				=	ItMa_Goodlumber; needitm_amount[0]	=5;//Drewno Cisowe[25]
	needitm[1]				=	ItMa_Iron; needitm_amount[1]	=1;//Sztabka Zelaza[10]
	value 				=		50;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� kostur";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItMw_2H_Staff_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Staff_02;
	needitm[0]				=	ItMa_Goodlumber; needitm_amount[0]	=3;//Drewno Cisowe[25]
	needitm[1]				=	ItMa_Steel; needitm_amount[1]	=2;//Sztabka Stali[40]
	value 				=		50;
	range 				=	28;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� lask� s�dziowsk�";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItMw_2H_Staff_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Staff_03;
	needitm[0]				=	ItMa_Bowlumber_01; needitm_amount[0]	=3;//Drewno Akacjowe[50]
	needitm[1]				=	ItMa_Iron; needitm_amount[1]	=2;//Sztabka Zelaza[10]
	needitm[2]				=	ItMa_goldore; needitm_amount[2]	=1;//Brylka Zlota"[30]
	value 				=		50;
	range 				=	32;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� lask� kap�a�sk�";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItMw_1H_Sword_01 (Recept_Proto)
{
	makingmob				=	R_BS;
	product_amount			=	1;	
	product					=	ItMw_1H_Sword_01;
	
	needitm_amount[0]				=	4;//30 +...	
	needitm_amount[1]				=	1;//90 +...	
	needitm_amount[2]				=	53;//53 = 173 //nastepna seria, latwiej zrobic, ale mniej sie op�aca

	
	needitm[0]						=	ItMa_Iron;
	needitm[1]						=	ItAt_AligatSkin;		
	needitm[2]						=	ItMiNugget;			
	value 					=	100;//400 - cena miecza
	range				=	23;//-5(nastepna seria broni) //na 100% szans wykucia

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[0] 				=	"Dzi�ki tej recepcie mog� wytworzy� miecz";//Wpisana nazwa miecza!		
	on_state[0]			=	UseRecept;		
   description = name;
};

INSTANCE Recept_ItMw_1H_Sword_02 (Recept_Proto)
{
	makingmob				=	R_BS;//pamietaj aby p�niej zmienia�!
	product_amount			=	1;	
	product					=	ItMw_1H_Sword_02;
	
	needitm_amount[0]				=	3;//120 +...	
	needitm_amount[1]				=	1;//56 +...	
	needitm_amount[2]				=	104;//104 +...
	damage[0]						=	1;//15 +...
	damage[1]						=	1;//100 = 394
	
	needitm[0]						=	ItMa_Steel;
	needitm[1]						=	ItAt_WaranSkin;		
	needitm[2]						=	ItMiNugget;			
	protection[0]					=	ItMa_Wool;
	protection[1]					=	ItMa_GoodSteel;
	value 					=	100;//900 - cena miecza
	range				=	27;//+4//na 100% szans wykucia

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[0] 				=	"Dzi�ki tej recepcie mog� wytworzy� miecz s�dziego";//Wpisana nazwa miecza!		
	on_state[0]			=	UseRecept;		
   description = name;
};

INSTANCE Recept_ItMw_1H_Sword_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_03;
	needitm[0]				=	ItMa_GoodSteel; needitm_amount[0]	=3;//Sztabka Utwardzanej Stali[100]
	needitm[1]				=	ItMa_Bowlumber_01; needitm_amount[1]	=2;//Drewno Akacjowe[50]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=1;//Welna[15]
	protection[0]			=	ItMiNugget; damage[0]	=70;//Brylka rudy[1]
	value 				=	100;
	range 				=	30;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz stra�nika";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItMw_1H_Sword_04(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_04;
	needitm[0]				=	ItMa_GoodSteel; needitm_amount[0]	=3;//Sztabka Utwardzanej Stali[100]
	needitm[1]				=	ItMa_Goodlumber; needitm_amount[1]	=2;//Drewno Cisowe[25]
	needitm[2]				=	ItAt_WaranSkin; needitm_amount[2]	=1;//Sk�ra Jaszczura[56]
	protection[0]			=	ItMiNugget; damage[0]	=75;//Brylka rudy[1]
	value 				=	100;
	range 				=	34;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz bojowy";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItMw_1H_Sword_05(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_05;
	needitm[0]				=	ItMa_GoodSteel; needitm_amount[0]	=3;//Sztabka Utwardzanej Stali[100]
	needitm[1]				=	ItMa_Goodlumber; needitm_amount[1]	=2;//Drewno Cisowe[25]
	needitm[2]				=	ItAt_LurkerSkin; needitm_amount[2]	=1;//Sk�ra Topielca[74]
	protection[0]			=	ItMiNugget; damage[0]	=75;//Brylka rudy[1]
	value 				=	100;
	range 				=	38;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz wojenny";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItMw_1H_Mace_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Mace_01;
	needitm[0]				=	ItMa_Iron; needitm_amount[0]	=5;//Sztabka Zelaza[10]
	needitm[1]				=	ItMa_Steel; needitm_amount[1]	=1;//Sztabka Stali[40]
	needitm[2]				=	ItMa_Bowlumber_01; needitm_amount[2]	=3;//Drewno Akacjowe[50]
	value 				=	100;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� maczuga";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItMw_1H_Mace_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Mace_02;
	needitm[0]				=	ItMa_Iron; needitm_amount[0]	=5;//Sztabka Zelaza[10]
	needitm[1]				=	ItMa_Steel; needitm_amount[1]	=2;//Sztabka Stali[40]
	needitm[2]				=	ItMa_Bowlumber_01; needitm_amount[2]	=3;//Drewno Akacjowe[50]
	protection[0]			=	ItMiNugget; damage[0]	=20;//Brylka rudy[1]
	value 				=	100;
	range 				=	27;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� �wiekowana maczuga";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItMw_1H_Mace_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Mace_03;
	needitm[0]				=	ItMa_Iron; needitm_amount[0]	=5;//Sztabka Zelaza[10]
	needitm[1]				=	ItMa_Steel; needitm_amount[1]	=1;//Sztabka Stali[40]
	needitm[2]				=	ItMa_Bowlumber_01; needitm_amount[2]	=3;//Drewno Akacjowe[50]
	protection[0]			=	ItAt_Bloodfly_02; damage[0]	=2;//Zadlo Krwiopijcy[25]
	value 				=	100;
	range 				=	28;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� ��d�o krwiopijcy";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItMw_1H_Mace_04(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Mace_04;
	needitm[0]				=	ItMa_Iron; needitm_amount[0]	=5;//Sztabka Zelaza[10]
	needitm[1]				=	ItMa_Steel; needitm_amount[1]	=1;//Sztabka Stali[40]
	needitm[2]				=	ItMa_Bowlumber_01; needitm_amount[2]	=3;//Drewno Akacjowe[50]
	protection[0]			=	ItAt_RazorTeeth; damage[0]	=3;//Kly Brzytwy[33]
	value 				=	100;
	range 				=	30;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� stalowy j�zyk";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItMw_1H_Mace_War_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Mace_War_01;
	needitm[0]				=	ItMa_GoodSteel; needitm_amount[0]	=3;//Sztabka Utwardzanej Stali[100]
	needitm[1]				=	ItMa_Bowlumber_01; needitm_amount[1]	=3;//Drewno Akacjowe[50]
	needitm[2]				=	ItAt_WolfSkin; needitm_amount[2]	=1;//Futro Wilka[60]
	protection[0]			=	ItMiNugget; damage[0]	=75;//Brylka rudy[1]
	value 				=	200;
	range 				=	35;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� morgensztern";
	on_state[0]				=	UseRecept;	
   description = name;
};
INSTANCE Recept_ItMw_1H_Mace_War_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Mace_War_02;
	needitm[0]				=	ItMa_GoodSteel; needitm_amount[0]	=3;//Sztabka Utwardzanej Stali[100]
	needitm[1]				=	ItMa_Bowlumber_01; needitm_amount[1]	=3;//Drewno Akacjowe[50]
	needitm[2]				=	ItAt_SnapperSkin; needitm_amount[2]	=1;//Sk�ra Zebacza[84]
	protection[0]			=	ItMiNugget; damage[0]	=75;//Brylka rudy[1]
	value 				=	200;
	range 				=	39;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� �elazna maczuga";
	on_state[0]				=	UseRecept;	
   description = name;
};
INSTANCE Recept_ItMw_1H_Mace_War_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Mace_War_02;
	needitm[0]				=	ItMa_GoodSteel; needitm_amount[0]	=3;//Sztabka Utwardzanej Stali[100]
	needitm[1]				=	ItMa_Bowlumber_01; needitm_amount[1]	=3;//Drewno Akacjowe[50]
	needitm[2]				=	ItAt_RazorSkin; needitm_amount[2]	=1;//Sk�ra Brzytwy[96]
	protection[0]			=	ItMiNugget; damage[0]	=75;//Brylka rudy[1]
	value 				=	200;
	range 				=	43;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� �omotacz";
	on_state[0]				=	UseRecept;	
   description = name;
};
INSTANCE Recept_ItMw_1H_Mace_War_04(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Mace_War_04;
	needitm[0]				=	ItMa_GoodSteel; needitm_amount[0]	=2;//Sztabka Utwardzanej Stali[100]
	needitm[1]				=	ItMa_Goodlumber; needitm_amount[1]	=3;//Drewno Cisowe[25]
	needitm[2]				=	ItAt_BiterSkin; needitm_amount[2]	=1;//Sk�ra Kasacza[64]
	protection[0]			=	ItMiNugget; damage[0]	=75;//Brylka rudy[1]
	protection[1]			=	ItMa_ExclusiveSteel; damage[1]	=1;//Sztabka Hartowanej Stali[250]
	value 				=	200;
	range 				=	45;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie moge wytworzy� �amacz serc";
	on_state[0]				=	UseRecept;	
   description = name;
};
INSTANCE Recept_ItMw_1H_Sword_Long_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Long_01;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=2;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_SnapperSkin; needitm_amount[1]	=1;//Sk�ra Zebacza[84]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=1;//Welna[15]
	protection[0]			=	ItMiNugget; damage[0]	=100;//Brylka rudy[1]
	value 				=	200;
	range 				=	41;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� d�ugi miecz";
	on_state[0]				=	UseRecept;	
   description = name;
};
INSTANCE Recept_ItMw_1H_Sword_Long_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS|ITEM_MISSION;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Long_02;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=2;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_BloodHoundSkin; needitm_amount[1]	=1;//Sk�ra Ogara[120]
	protection[0]			=	ItMiNugget; damage[0]	=125;//Brylka rudy[1]
	value 				=	200;
	range 				=	44;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz strachu";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Sword_Long_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Long_03;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_AligatSkin; needitm_amount[1]	=1;//Sk�ra Aligatora[90]
	needitm[2]				=	ItAt_OrcTeeth; needitm_amount[2]	=1;//Orkowy Kiel[40]
	protection[0]			=	ItMiNugget; damage[0]	=45;//Brylka rudy[1]
	value 				=	200;
	range 				=	47;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz nienawi�ci";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Sword_Long_04(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Long_04;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_RazorSkin; needitm_amount[1]	=1;//Sk�ra Brzytwy[96]
	needitm[2]				=	ItAt_GobKosc; needitm_amount[2]	=1;//Kosc Goblina[30]
	protection[0]			=	ItMiNugget; damage[0]	=55;//Brylka rudy[1]
	value 				=		200;
	range 				=	50;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz zwyci�stwa";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Sword_Long_05(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Long_05;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_RazorSkin; needitm_amount[1]	=1;//Sk�ra Brzytwy[96]
	needitm[2]				=	ItAt_Kosc; needitm_amount[2]	=1;//Kosc Szkieletu[40]
	protection[0]			=	ItMiNugget; damage[0]	=93;//Brylka rudy[1]
	value 				=		200;
	range 				=	53;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz �mierci";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Warhammer_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Warhammer_01;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=1;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItAt_FireWSkin; needitm_amount[1]	=1;//Sk�ra Ognistego Jaszczura[140]
	needitm[2]				=	ItAt_Kosc; needitm_amount[2]	=3;//Kosc Szkieletu[40]
	value 				=	300;
	range 				=	50;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� m�ot Ork�w";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Warhammer_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Warhammer_02;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_YoTroSkin; needitm_amount[1]	=1;//Futro Mlodego Trolla[210]
	needitm[2]				=	ItAt_DS_Horn; needitm_amount[2]	=1;//R�g Sztyletnika[125]
	protection[0]			=	ItMiNugget; damage[0]	=60;//Brylka rudy[1]
	value 				=	300;
	range 				=	54;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� m�ot wojenny";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Warhammer_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Warhammer_03;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_SwampsharkSkin; needitm_amount[1]	=1;//Sk�ra Blotnego Weza[140]
	needitm[2]				=	ItAt_FireWaranTeeth; needitm_amount[2]	=1;//Kly Ognistego Jaszczura[55]
	protection[0]			=	ItMa_silverbillet; damage[0]	=1;//Sztabka Srebra[200]
	value 				=	300;
	range 				=	56;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� boski m�ot";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_1H_Axe_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Axe_01;
	needitm[0]				=	ItMa_Steel; needitm_amount[0]	=3;//Sztabka Stali[40]
	needitm[1]				=	ItAt_LurkerSkin; needitm_amount[1]	=1;//Sk�ra Topielca[74]
	needitm[2]				=	ItAt_SnapperClaws; needitm_amount[2]	=3;//Pazury Zebacza[32]
	protection[0]			=	ItMa_Wool; damage[0]	=1;//Welna[15]
	protection[1]			=	ItMiNugget; damage[1]	=87;//Brylka rudy[1]
	value 				=	300;
	range 				=	19;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� top�r";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Axe_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Axe_02;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_FireWSkin; needitm_amount[1]	=1;//Sk�ra Ognistego Jaszczura[140]
	needitm[2]				=	ItAt_DS_Horn; needitm_amount[2]	=1;//R�g Sztyletnika[125]
	protection[0]			=	ItMa_Wool; damage[0]	=1;//Welna[15]
	protection[1]			=	ItMiNugget; damage[1]	=150;//Brylka rudy[1]
	value 				=	300;
	range 				=	55;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� gruchotacz";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Axe_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Axe_03;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_WaranSkin; needitm_amount[1]	=1;//Sk�ra Jaszczura[56]
	needitm[2]				=	ItAt_Shadow_02; needitm_amount[2]	=1;//R�g Cieniostwora[500]
	protection[0]			=	ItMa_Wool; damage[0]	=1;//Welna[15]
	protection[1]			=	ItMiNugget; damage[1]	=70;//Brylka rudy[1]
	value 				=	300;
	range 				=	58;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� �amacz ko�ci";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Sword_Broad_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Broad_01;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_TrollSkin; needitm_amount[1]	=1;//Futro Trolla[440]
	needitm[2]				=	ItMa_Bowlumber_01; needitm_amount[2]	=2;//Drewno Akacjowe[50]
	protection[0]			=	ItMiNugget; damage[0]	=178;//Brylka rudy[1]
	value 				=	300;
	range 				=	56;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz szeroki";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Sword_Broad_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Broad_02;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=2;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_ShadowSkin; needitm_amount[1]	=1;//Futro Cieniostwora[120]
	needitm[2]				=	ItMa_Bowlumber_01; needitm_amount[2]	=2;//Drewno Akacjowe[50]
	protection[0]			=	ItMiNugget; damage[0]	=128;//Brylka rudy[1]
	protection[1]			=	ItMa_MagicBillet; damage[1]	=1;//Sztabka Magicznego Kruszcu[750]
	value 				=	300;
	range 				=	59;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� wyrok wojownika";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Sword_Broad_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Broad_03;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=2;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_WaranSkin; needitm_amount[1]	=1;//Sk�ra Jaszczura[56]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMiNugget; damage[0]	=108;//Brylka rudy[1]
	protection[1]			=	ItMa_MagicBillet; damage[1]	=1;//Sztabka Magicznego Kruszcu[750]
	protection[2]			=	ItAt_DirkTeeth; damage[2]	=2;//Kly Sztyletnika[55]
	value 				=	300;
	range 				=	62;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� szept burzy";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Sword_Broad_04(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Broad_04;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=2;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_DirkSkin; needitm_amount[1]	=1;//Sk�ra Sztyletnika[140]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMiNugget; damage[0]	=118;//Brylka rudy[1]
	protection[1]			=	ItMa_MagicBillet; damage[1]	=1;//Sztabka Magicznego Kruszcu[750]
	protection[2]			=	ItAt_DirkTeeth; damage[2]	=2;//Kly Sztyletnika[55]
	value 				=	300;
	range 				=	65;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� r�k� stra�nika";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Sword_Bastard_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Bastard_02;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=2;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItAt_FireWSkin; needitm_amount[1]	=1;//Sk�ra Ognistego Jaszczura[140]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_ExclusiveSteel; damage[0]	=1;//Sztabka Hartowanej Stali[250]
	protection[2]			=	ItAt_DirkTeeth; damage[2]	=2;//Kly Sztyletnika[55]
	value 				=	500;
	range 				=	67;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� rze�nika";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Sword_Bastard_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Bastard_03;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=2;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItAt_YoTroSkin; needitm_amount[1]	=1;//Futro Mlodego Trolla[210]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_ExclusiveSteel; damage[0]	=1;//Sztabka Hartowanej Stali[250]
	value 				=	500;
	range 				=	70;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� kata";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_1H_Sword_Bastard_04(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_1H_Sword_Bastard_04;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=2;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItAt_BloodHoundSkin; needitm_amount[1]	=1;//Sk�ra Ogara[120]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_ExclusiveSteel; damage[0]	=1;//Sztabka Hartowanej Stali[250]
	protection[1]			=	ItAt_BloodHoTeeth; damage[1]	=2;//Kly Ogara[27]
	value 				=	500;
	range 				=	70;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� wrzask berserkera";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Axe_Old_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Axe_Old_02;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=5;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_BloodHoundSkin; needitm_amount[1]	=3;//Sk�ra Ogara[120]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_Bowlumber_01; damage[0]	=4;//Drewno Akacjowe[50]
	protection[1]			=	ItAt_BloodHoTeeth; damage[1]	=2;//Kly Ogara[27]
	value 				=	500;
	range 				=	55;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� krwawego �niwiarza";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Axe_Old_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Axe_Old_03;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=4;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_WaranSkin; needitm_amount[1]	=3;//Sk�ra Jaszczura[56]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_Bowlumber_01; damage[0]	=4;//Drewno Akacjowe[50]
	protection[1]			=	ItMa_MagicBillet; damage[1]	=1;//Sztabka Magicznego Kruszcu[750]
	value 				=	500;
	range 				=	58;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� starego s�dziego";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Sword_Light_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_Light_01;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_WaranSkin; needitm_amount[1]	=1;//Sk�ra Jaszczura[56]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_MagicBillet; damage[0]	=2;//Sztabka Magicznego Kruszcu[750]
	value 				=	500;
	range 				=	61;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� lekki miecz dwur�czny";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Sword_Light_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_Light_02;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_RazorSkin; needitm_amount[1]	=1;//Sk�ra Brzytwy[96]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_MagicBillet; damage[0]	=2;//Sztabka Magicznego Kruszcu[750]
	value 				=	500;
	range 				=	64;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz nadzorcy";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Sword_Light_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_Light_03;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=3;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_AligatSkin; needitm_amount[1]	=1;//Sk�ra Aligatora[90]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_MagicBillet; damage[0]	=2;//Sztabka Magicznego Kruszcu[750]
	protection[1]			=	ItMiNugget; damage[1]	=194;//Brylka rudy[1]
	value 				=	500;
	range 				=	67;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� ostrze najemnika";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Sword_Light_04(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_Light_04;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=1;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_WaranSkin; needitm_amount[1]	=1;//Sk�ra Jaszczura[56]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_MagicBillet; damage[0]	=3;//Sztabka Magicznego Kruszcu[750]
	protection[1]			=	ItMa_GoodSteel; damage[1]	=1;//Sztabka Utwardzanej Stali[100]
	value 				=	500;
	range 				=	70;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz kr�lewski";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Sword_Light_05(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_Light_05;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=2;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_DemonHeart; needitm_amount[1]	=1;//Serce Demona[500]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_MagicBillet; damage[0]	=2;//Sztabka Magicznego Kruszcu[750]
	protection[1]			=	ItMa_GoodSteel; damage[1]	=1;//Sztabka Utwardzanej Stali[100]
	protection[2]			=	ItAt_WaranSkin; damage[2]	=1;//Sk�ra Jaszczura[56]
	value 				=	500;
	range 				=	73;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� miecz demon�w";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Axe_light_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Axe_light_01;
	needitm[0]				=	ItMa_GoodSteel; needitm_amount[0]	=2;//Sztabka Utwardzanej Stali[100]
	needitm[1]				=	ItMa_Wool; needitm_amount[1]	=2;//Welna[15]
	protection[0]			=	ItMa_MagicBillet; damage[0]	=3;//Sztabka Magicznego Kruszcu[750]
	protection[1]			=	ItMa_Bowlumber_01; damage[1]	=4;//Drewno Akacjowe[50]
	needitm[2]			=	ItAt_WaranSkin; needitm_amount[2]	=1;//Sk�ra Jaszczura[56]
	value 				=	600;
	range 				=	70;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� lekki top�r bojowy";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Axe_light_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Axe_light_02;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=2;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_ShadClaws; needitm_amount[1]	=1;//Pazury Cieniostwora[50]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_MagicBillet; damage[0]	=3;//Sztabka Magicznego Kruszcu[750]
	protection[1]			=	ItMa_Goodlumber; damage[1]	=4;//Drewno Cisowe[25]
	protection[2]			=	ItAt_WaranSkin; damage[2]	=1;//Sk�ra Jaszczura[56]
	value 				=	600;
	range 				=	73;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� grzmot";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Axe_light_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Axe_light_03;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=2;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_OrcDogClaws; needitm_amount[1]	=1;//Pazury Orkowego Psa[22]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[0]			=	ItMa_MagicBillet; damage[0]	=3;//Sztabka Magicznego Kruszcu[750]
	protection[1]			=	ItMa_Bowlumber_01; damage[1]	=4;//Drewno Akacjowe[50]
	protection[2]			=	ItAt_WolfSkin2; damage[2]	=1;//Futro Orkowego Psa[64]
	value 				=	600;
	range 				=	76;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� chrz�st";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Sword_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_01;
	needitm[0]				=	ItMa_ExclusiveSteel; needitm_amount[0]	=2;//Sztabka Hartowanej Stali[250]
	needitm[1]				=	ItAt_RazorSkin; needitm_amount[1]	=1;//Sk�ra Brzytwy[96]
	needitm[2]				=	ItAt_RazorTeeth; needitm_amount[2]	=3;//Kly Brzytwy[33]
	protection[0]			=	ItMa_MagicBillet; damage[0]	=3;//Sztabka Magicznego Kruszcu[750]
	protection[1]			=	ItMiNugget; damage[1]	=150;//Brylka rudy[1]
	value 				=	600;
	range 				=	75;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� dwur�czniaka";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Sword_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_02;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=4;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_ExclusiveSteel; needitm_amount[1]	=1;//Sztabka Hartowanej Stali[250]
	needitm[2]				=	ItMa_Wool; needitm_amount[2]	=2;//Welna[15]
	protection[1]			=	ItMiNugget; damage[1]	=150;//Brylka rudy[1]
	value 				=	600;
	range 				=	79;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� ostrze bohatera";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Sword_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_03;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=4;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_ExclusiveSteel; needitm_amount[1]	=1;//Sztabka Hartowanej Stali[250]
	needitm[2]				=	ItAt_ShadowSkin; needitm_amount[2]	=1;//Futro Cieniostwora[120]
	protection[0]			=	ItMiNugget; damage[0]	=140;//Brylka rudy[1]
	protection[1]			=	ItMiNugget; damage[1]	=150;//Brylka rudy[1]
	value 				=	600;
	range 				=	82;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� krwawe ostrze";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_2H_Sword_Heavy_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_Heavy_01;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=4;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_ExclusiveSteel; needitm_amount[1]	=2;//Sztabka Hartowanej Stali[250]
	needitm[2]				=	ItAt_WolfSkin2; needitm_amount[2]	=1;//Futro Orkowego Psa[64]
	value 				=	700;
	range 				=	80;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� ci�ki dwur�czniak";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_2H_Sword_Heavy_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_Heavy_02;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=4;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_ExclusiveSteel; needitm_amount[1]	=2;//Sztabka Hartowanej Stali[250]
	needitm[2]				=	ItAt_YoTroSkin; needitm_amount[2]	=1;//Futro Mlodego Trolla[210]
	value 				=	700;
	range 				=	83;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� gniewn� stal";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_2H_Sword_Heavy_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_Heavy_03;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=5;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_Steel; needitm_amount[1]	=1;//Sztabka Stali[40]
	value 				=	700;
	range 				=	85;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� w�ciek�� stal";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_2H_Sword_Heavy_04(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_Heavy_04;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=5;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_GoodSteel; needitm_amount[1]	=1;//Sztabka Stali[40]
	needitm[2]				=	ItAt_WaranSkin; needitm_amount[2]	=1;//Sk�ra Sztyletnika[140]
	value 				=	700;
	range 				=	88;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� m�ciw� stal";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMw_2H_Sword_Heavy_05(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Sword_Heavy_05;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=5;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_ExclusiveSteel; needitm_amount[1]	=1;//Sztabka Hartowanej Stali[250]
	needitm[2]				=	ItAt_DirkSkin; needitm_amount[2]	=1;//Sk�ra Sztyletnika[140]
	value 				=	700;
	range 				=	90;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� korsarza";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_2H_Axe_Heavy_01(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Axe_Heavy_01;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=5;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_ExclusiveSteel; needitm_amount[1]	=1;//Sztabka Hartowanej Stali[250]
	needitm[2]				=	ItMa_GoodSteel; needitm_amount[2]	=1;//Sztabka Utwardzanej Stali[100]
	protection[0]			=	ItAt_WaranSkin; damage[0]	=1;//Sk�ra Jaszczura[56]
	value 				=	800;
	range 				=	90;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� top�r wojenny";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_2H_Axe_Heavy_02(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Axe_Heavy_02;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=5;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_ExclusiveSteel; needitm_amount[1]	=2;//Sztabka Hartowanej Stali[250]
	needitm[2]				=	ItAt_WaranSkin; needitm_amount[2]	=1;//Sk�ra Jaszczura[56]
	value 				=	800;
	range 				=	94;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� krzyk wojownika";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_2H_Axe_Heavy_03(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Axe_Heavy_03;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=5;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_ExclusiveSteel; needitm_amount[1]	=2;//Sztabka Hartowanej Stali[250]
	needitm[2]				=	ItAt_SwampsharkSkin; needitm_amount[2]	=1;//Sk�ra Blotnego Weza[140]
	protection[0]			=	ItAt_ShadClaws; damage[0]	=2;//Pazury Cieniostwora[50]
	protection[1]			=	ItAt_ShadTeeth; damage[1]	=2;//Kly Cieniostwora[45]
	value 				=	800;
	range 				=	96;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� pi�� barbarzy�cy";
	on_state[0]				=	UseRecept;	
};
INSTANCE Recept_ItMw_2H_Axe_Heavy_04(Recept_Proto)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;
	product				=	ItMw_2H_Axe_Heavy_04;
	needitm[0]				=	ItMa_MagicBillet; needitm_amount[0]	=2;//Sztabka Magicznego Kruszcu[750]
	needitm[1]				=	ItMa_ExclusiveSteel; needitm_amount[1]	=5;//Sztabka Hartowanej Stali[250]
	needitm[2]				=	ItAt_KingTroSkin; needitm_amount[2]	=1;//Futro Kr�lewskiego Trolla[1040]
	protection[0]			=	ItAt_KingTroTeeth; damage[0]	=1;//Kiel Kr�lewskiego Trolla[505]
	value 				=	800;
	range 				=	100;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dzi�ki tej recepcie mog� wytworzy� pi�� trolla";
	on_state[0]				=	UseRecept;	
};