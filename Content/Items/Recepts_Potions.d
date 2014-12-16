INSTANCE Recept_ItFo_Potion_Mana_01(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Mana_01;
	needitm[0]				=	ItFo_Plants_mushroom_01; needitm_amount[0]	=1;//Piekielnik[3]
	needitm[1]				=	ItFo_Plants_Velayis_01; needitm_amount[1]	=1;//Velais[14]
	value 				=	50;
	range 				=	10;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"esencj� magicznej energii";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Mana_02(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Mana_02;
	needitm[0]				=	ItFoScavengerEgg; needitm_amount[0]	=1;//Li�� d�bu[14]
	needitm[1]				=	ItFo_Plants_RavenHerb_01; needitm_amount[1]	=1;//Krucze ziele[28]
	value 				=	50;
	range 				=	15;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wyci�g magicznej energii";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Mana_03(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Mana_03;
	needitm[0]				=	ItFo_Plants_Trollberrys_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_Stoneroot_02; needitm_amount[1]	=1;//Dragrot[37]
	value 				=	50;
	range 				=	20;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"eliksir magicznej energii";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Mana_04(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Mana_04;
	needitm[0]				=	ItFo_Plants_mountainmoos_01; needitm_amount[0]	=1;//G�rski mech[56]
	needitm[1]				=	ItFo_Plants_Towerwood_01; needitm_amount[1]	=1;//Nasienie wysokiego d�bu[46]
	value 				=	100;
	range 				=	35;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"pe�ni� magicznej energii";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Health_01(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Health_01;
	needitm[0]				=	ItFo_Plants_mushroom_01; needitm_amount[0]	=1;//Piekielnik[3]
	needitm[1]				=	ItFo_Plants_Herb_01; needitm_amount[1]	=1;//Ro�lina uzdrawiaj�ca[14]
	value 				=	50;
	range 				=	10;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"esencj� uzdrawiaj�c�";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Health_02(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Health_02;
	needitm[0]				=	ItFoScavengerEgg; needitm_amount[0]	=1;//Jajo �cierwojada[8]
	needitm[1]				=	ItFo_Plants_Herb_02; needitm_amount[1]	=1;//Melisa lekarska[19]
	value 				=	50;
	range 				=	15;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wyci�g uzdrawiaj�cy";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Health_03(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Health_03;
	needitm[0]				=	ItFo_Plants_Trollberrys_01; needitm_amount[0]	=1;//Trolest[30]
	needitm[1]				=	ItFo_Plants_Herb_03; needitm_amount[1]	=1;//Ziele Druidzkie[30]
	value 				=	50;
	range 				=	20;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"eliksir uzdrawiaj�cy";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Health_04(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Health_04;
	needitm[0]				=	ItFo_Plants_mountainmoos_01; needitm_amount[0]	=1;//G�rski mech[56]
	needitm[1]				=	ItFo_Plants_Herb_HpMax; needitm_amount[1]	=1;//Ziele Druidzkie[30]
	value 				=	100;
	range 				=	35;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"pe�ni� �ycia";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Strength_02(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Strength_02;
	needitm[0]				=	ItFo_Plants_Greyherb_01; needitm_amount[0]	=1;//Szare Ziele[100]
	needitm[1]				=	ItFo_Plants_strPERM_01; needitm_amount[1]	=1;//Ogrzyli��[200]
	value 				=	350;
	range 				=	75;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wyci�g si�y";
	on_state[0]				=	UseRecept;
   description = name;
};

INSTANCE Recept_ItFo_Potion_Strength_03(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Strength_03;
	needitm[0]				=	ItFo_Plants_Permherb_02; needitm_amount[0]	=1;//�arnowiec[250]
	needitm[1]				=	ItFo_Plants_strPERM_01; needitm_amount[1]	=1;//Ogrzyli��[200]
	value 				=	500;
	range 				=	100;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"eliksir si�y";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Dex_02(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Dex_02;
	needitm[0]				=	ItFo_Plants_Greyherb_01; needitm_amount[0]	=1;//Szare Ziele[100]
	needitm[1]				=	ItFo_Plants_DEXPERM_01; needitm_amount[1]	=1;//Gadzie Ziele[200]
	value 				=	350;
	range 				=	75;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wyci�g zwinno�ci";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Dex_03(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Dex_03;
	needitm[0]				=	ItFo_Plants_Permherb_02; needitm_amount[0]	=1;//�arnowiec[250]
	needitm[1]				=	ItFo_Plants_DEXPERM_01; needitm_amount[1]	=1;//Gadzie Ziele[200]
	value 				=	500;
	range 				=	100;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"eliksir zwinno�ci";
	on_state[0]				=	UseRecept;
   description = name;
};

INSTANCE Recept_ItFo_Potion_Health_Perma_02(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Health_Perma_02;
	needitm[0]				=	ItFo_Plants_Permherb_02; needitm_amount[0]	=1;//�arnowiec[250]
	needitm[1]				=	ItFo_Plants_DEXPERM_01; needitm_amount[1]	=1;//Gadzie Ziele[200]
	value 				=	350;
	range 				=	75;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wyci�g �ycia";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Health_Perma_03(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Health_Perma_03;
	needitm[0]				=	ItFo_Plants_Permherb_02; needitm_amount[0]	=1;//�arnowiec[250]
	needitm[1]				=	ItFo_Plants_Herb_HpPerm; needitm_amount[1]	=1;//Ziele �ycia[200]
	value 				=	500;
	range 				=	100;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"eliksir �ycia";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Mana_Perma_02(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Mana_Perma_02;
	needitm[0]				=	ItFo_Plants_Greyherb_01; needitm_amount[0]	=1;//Szare Ziele[100]
	needitm[1]				=	ItFo_Plants_RavenHerb_02; needitm_amount[1]	=1;//Czarne ziele[200]
	value 				=	350;
	range 				=	75;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wyci�g ducha";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Mana_Perma_03(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Mana_Perma_03;
	needitm[0]				=	ItFo_Plants_Permherb_02; needitm_amount[0]	=1;//�arnowiec[250]
	needitm[1]				=	ItFo_Plants_RavenHerb_02; needitm_amount[1]	=1;//Czarne ziele[200]
	value 				=	500;
	range 				=	100;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"eliksir ducha";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Haste_02(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Haste_02;
	needitm[0]				=	ItFo_Plants_mountainmoos_01; needitm_amount[0]	=1;//G�rski mech[56]
	needitm[1]				=	ItFo_Plants_Bloodwood_01; needitm_amount[1]	=1;//Nasienie czerwonego buka[18]
	value 				=	75;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"nap�j szybko�ci";
	on_state[0]				=	UseRecept;	
   description = name;
};