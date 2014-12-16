INSTANCE Recept_ItFo_Potion_HP_1_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_HP_1_temp;
	needitm[0]				=	ItFo_Plants_mushroom_02; needitm_amount[0]	=1;//Gorzki chleb[9]
	needitm[1]				=	ItFo_Plants_Herb_02; needitm_amount[1]	=1;//Melisa lekarska[19]
	value 				=	50;
	range 				=	15;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"eliksir po�wi�cenia";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_MP_1_temp(C_Item)                                     
{                                                                                 
	name 					=	"Recepta";                                                           
	mainflag 				=	ITEM_KAT_DOCS;                                                    
	makingmob				=	R_LAB_PSI;                                                        
	product_amount			=	1;                                                            
	product				=	ItFo_Potion_MP_1_temp;                                              
	needitm[0]				=	ItFo_Plants_mushroom_02; needitm_amount[0]	=1;//Gorzki chleb[9]  
	needitm[1]				=	ItFo_Plants_RavenHerb_01; needitm_amount[1]	=1;//Krucze ziele[28]
	value 				=	50;                                                                  
	range 				=	15;                                                                  
                                                                                  
	visual 				=	"ItWr_Scroll_01.3ds";                                               
	material 				=	MAT_LEATHER;                                                      
	scemeName 				=	"NONE";                                                          
	text[1]  				=	"eliksir mocy";                  
	on_state[0]				=	UseRecept;	    
   description = name;
};                

INSTANCE Recept_ItFo_Potion_DEX_1_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_DEX_1_temp;
	needitm[0]				=	ItFo_Plants_mushroom_02; needitm_amount[0]	=1;//Gorzki chleb[9]
	needitm[1]				=	ItFo_Plants_Nightshadow_02; needitm_amount[1]	=1;//Kocianka[11]
	value 				=	50;
	range 				=	15;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"z�odziejsk� gorza��";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Str_1_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Str_1_temp;
	needitm[0]				=	ItFo_Plants_mushroom_02; needitm_amount[0]	=1;//Gorzki chleb[9]
	needitm[1]				=	ItFo_Plants_Nightshadow_01; needitm_amount[1]	=1;//Psianka[11]
	value 				=	50;
	range 				=	15;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"gniew golema";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Edg_1_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Edg_1_temp;
	needitm[0]				=	ItFo_Plants_mushroom_02; needitm_amount[0]	=1;//Gorzki chleb[9]
	needitm[1]				=	ItFo_Plants_Bloodherb_01; needitm_amount[1]	=1;//Krwawe Ziele[9]
	value 				=	50;
	range 				=	10;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"d�bowy wyci�g";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_pnt_1_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_pnt_1_temp;
	needitm[0]				=	ItFo_Plants_mushroom_02; needitm_amount[0]	=1;//Gorzki chleb[9]
	needitm[1]				=	ItFo_Plants_Hop_01; needitm_amount[1]	=1;//Chmiel[8]
	value 				=	50;
	range 				=	10;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wywar halucynogenny";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_fir_1_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_fir_1_temp;
	needitm[0]				=	ItFo_Plants_mushroom_02; needitm_amount[0]	=1;//Gorzki chleb[9]
	needitm[1]				=	ItFo_Plants_Flameberry_01; needitm_amount[1]	=1;//Ogniocier�[6]
	value 				=	50;
	range 				=	10;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"l�d Nordmaru";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_mag_1_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_mag_1_temp;
	needitm[0]				=	ItFo_Plants_mushroom_02; needitm_amount[0]	=1;//Gorzki chleb[9]
	needitm[1]				=	ItFo_Plants_mountainmoos_02; needitm_amount[1]	=1;//Mech nagrobny[10]
	value 				=	50;
	range 				=	10;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"p�omyk ognika";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Prot_Total_1_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Prot_Total_1_temp;
	needitm[0]				=	ItFo_Plants_OrcHerb_02; needitm_amount[0]	=1;//lisc debu[14]
	needitm[1]				=	ItFo_Plants_mountainmoos_02; needitm_amount[1]	=1;//Mech nagrobny[10]
	needitm[2]				=	ItFo_Plants_Flameberry_01; needitm_amount[2]	=1;//Ogniocier�[6]
	protection[0]			=	ItFo_Plants_Hop_01; damage[0]	=1;//Chmiel[8]
	protection[1]			=	ItFo_Plants_Bloodherb_01; damage[1]	=1;//Krwawe Ziele[9]
	value 				=	50;
	range 				=	20;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wol� przetrwania";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Prot_Total_2_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Prot_Total_2_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_mountainmoos_02; needitm_amount[1]	=1;//Mech nagrobny[10]
	needitm[2]				=	ItFo_Plants_Flameberry_01; needitm_amount[2]	=1;//Ogniocier�[6]
	protection[0]			=	ItFo_Plants_Hop_01; damage[0]	=1;//Chmiel[8]
	protection[1]			=	ItFo_Plants_Bloodherb_01; damage[1]	=1;//Krwawe Ziele[9]
	value 				=	50;
	range 				=	30;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"krew tytan�w";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Str_Dex_1_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Str_Dex_1_temp;
	needitm[0]				=	ItFo_Plants_OrcHerb_02; needitm_amount[0]	=1;//Li�� d�bu[14]
	needitm[1]				=	ItFo_Plants_Nightshadow_01; needitm_amount[1]	=1;//Psianka[11]
	needitm[2]				=	ItFo_Plants_Nightshadow_02; needitm_amount[2]	=1;//Kocianka[11]
	value 				=	50;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wywar wojownika";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Str_Dex_2_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Str_Dex_2_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_Nightshadow_01; needitm_amount[1]	=1;//Psianka[11]
	needitm[2]				=	ItFo_Plants_Nightshadow_02; needitm_amount[2]	=1;//Kocianka[11]
	value 				=	50;
	range 				=	40;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"dusz� Varantczyka";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_HP_MP_1_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_HP_MP_1_temp;
	needitm[0]				=	ItFo_Plants_OrcHerb_02; needitm_amount[0]	=1;//Li�� d�bu[14]
	needitm[1]				=	ItFo_Plants_Herb_02; needitm_amount[1]	=1;//Melisa lekarska[19]
	needitm[2]				=	ItFo_Plants_RavenHerb_01; needitm_amount[2]	=1;//Krucze ziele[28]
	value 				=	50;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wywar o�wiecenia";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_HP_MP_2_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_HP_MP_2_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_Herb_02; needitm_amount[1]	=1;//Melisa lekarska[19]
	needitm[2]				=	ItFo_Plants_RavenHerb_01; needitm_amount[2]	=1;//Krucze ziele[28]
	value 				=	50;
	range 				=	40;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"�ask� bog�w";
	on_state[0]				=	UseRecept;	
   description = name;
};
                                                       
INSTANCE Recept_ItFo_Potion_HP_2_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_HP_2_temp;
	needitm[0]				=	ItFo_Plants_OrcHerb_02; needitm_amount[0]	=1;//Li�� d�bu[14]
	needitm[1]				=	ItFo_Plants_Herb_02; needitm_amount[1]	=1;//Melisa lekarska[19]
	value 				=	50;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"dar �ycia";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_MP_2_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_MP_2_temp;
	needitm[0]				=	ItFo_Plants_OrcHerb_02; needitm_amount[0]	=1;//Li�� d�bu[14]
	needitm[1]				=	ItFo_Plants_RavenHerb_01; needitm_amount[1]	=1;//Krucze ziele[28]
	value 				=	50;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"�wiat�o Adanosa";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_DEX_2_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_DEX_2_temp;
	needitm[0]				=	ItFo_Plants_OrcHerb_02; needitm_amount[0]	=1;//Li�� d�bu[14]
	needitm[1]				=	ItFo_Plants_Nightshadow_02; needitm_amount[1]	=1;//Kocianka[11]
	value 				=	50;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"nap�j my�liwego";
	on_state[0]				=	UseRecept;	
   description = name;
};


INSTANCE Recept_ItFo_Potion_STR_2_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_STR_2_temp;
	needitm[0]				=	ItFo_Plants_OrcHerb_02; needitm_amount[0]	=1;//Li�� d�bu[14]
	needitm[1]				=	ItFo_Plants_Nightshadow_01; needitm_amount[1]	=1;//Psianka[11]
	value 				=	50;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"krew trolla";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Str_3_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Str_3_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_Nightshadow_01; needitm_amount[1]	=1;//Psianka[11]
	value 				=	50;
	range 				=	45;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"furi� berserkera";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_DEX_3_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_DEX_3_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_Nightshadow_02; needitm_amount[1]	=1;//Kocianka[11]
	value 				=	50;
	range 				=	45;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"nektar �owcy";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_MP_3_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_MP_3_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_RavenHerb_01; needitm_amount[1]	=1;//Krucze ziele[28]
	value 				=	50;
	range 				=	45;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"nektar bog�w";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_HP_3_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_HP_3_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_Herb_02; needitm_amount[1]	=1;//Melisa lekarska[19]
	value 				=	50;
	range 				=	45;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"nektar paladyna";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_Edg_3_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_Edg_3_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_Bloodherb_01; needitm_amount[1]	=1;//Krwawe Ziele[9]
	value 				=	50;
	range 				=	35;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"skaln� wod�";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_pnt_3_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_pnt_3_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_Hop_01; needitm_amount[1]	=1;//Chmiel[8]
	value 				=	50;
	range 				=	35;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"eliksir asasyna";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_fir_3_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_fir_3_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_Flameberry_01; needitm_amount[1]	=1;//Ogniocier�[6]
	value 				=	50;
	range 				=	35;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"wol� Adanosa";
	on_state[0]				=	UseRecept;	
   description = name;
};

INSTANCE Recept_ItFo_Potion_mag_3_temp(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Potion_mag_3_temp;
	needitm[0]				=	ItFo_Plants_Bloodwood_01; needitm_amount[0]	=1;//Nasienie czerwonego buka[18]
	needitm[1]				=	ItFo_Plants_mountainmoos_02; needitm_amount[1]	=1;//Mech nagrobny[10]
	value 				=	50;
	range 				=	35;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[1]  				=	"smocz� ���";
	on_state[0]				=	UseRecept;	
   description = name;
};  
