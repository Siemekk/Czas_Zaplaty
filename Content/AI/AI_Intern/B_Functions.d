
/*************************************************************************
**																		**
**		B_Functions.D													**
**		=============													**
**																		**
**		Enth�lt kleinere, universell verwendbare Befehle f�r die		**
**		Master-AI														**
**																		**
*************************************************************************/

FUNC VOID B_PRINTDEBUG(VAR STRING MSG)
{
	IF(DEBUGPRINTS)
	{
		PRINT(MSG);
	};
};

/*************************************************************************
**																		**
**		Hlp_GetDistBetweenTrafoPoints2D									**
**		=============													**
**																		**
**		Get dist between 2 2DVEC poinst, convert result					**
**		into CM units.													**
*************************************************************************/
Func int Hlp_GetDistBetweenTrafoPoints2D(var int x1, var int y1, var int x2, var int y2)
{//Trafo
	var int x;  var int z; var int dist;
	x1 = x1 - x2;
	
	if(x1<0){x1=x1*(-1);};
	
	y1 = y1 - y2;
	
	if(y1<0){y1=y1*(-1);};		
	x1 = x1+y1; /*Return in cm's*/ x1 = x1/1000; x1 = (x1) - (x1%1);	
	
	return x1;			
};

/*************************************************************************
**																		**
**		R_GetItem													**
**		=============													**
**																		**
**		Iteminstance to Item(C_Item).									**
**																		**
*************************************************************************/
FUNC VOID R_GetItem(Var Int Itminstance)
{
	VAR C_NPC ITMMAST;
	ITMMAST=HLP_GETNPC(MOD_ItemMASTER);
	CREATEInvItem(ITMMAST,ITMINSTANCE);
	NPC_GETInvItem(ITMMAST,ITMINSTANCE);
};

/*************************************************************************
**																		**
**		R_GetEquipingItem													**
**		=============													**
**																		**
**		Get instance of Item(C_Item).									**
**																		**
*************************************************************************/
FUNC int R_GetEquipingItemID(var c_npc slf,var int cat)
{
	var int a; var int offset;
	a = oCNPC_GetPointer(slf);//is someone changed player by cheats
	offset = MEM_ReadInt(a+1372);//+InvENTORY2_SELECTEDItem;
	Npc_GetInvItemBySlot    	(slf,cat,offset);
	a = Hlp_Getinstanceid(Item);
	return a;
};

/*************************************************************************
**																		**
**		B_HeroEquipItem														**
**		=============													**
**																		**
**		Equip Item like EquipItem, but working!							**
**																		**
*************************************************************************/
VAR INT GIVEBACKWEAPONS;
FUNC VOID B_HEROEQUIPItem(VAR INT ITM)
{
	R_GETItem(ITM);
	VAR INT A;VAR INT WEAPONTYPE;VAR INT ID;VAR INT I;VAR C_Item EQUIPEDWEAPON;VAR C_NPC ITMMAST;
	ID=HLP_GETINSTANCEID(Item);
	A=Item.DAMAGETOTAL;
	I=NPC_HASItemS(HERO,ID);
	ITMMAST=HLP_GETNPC(MOD_ItemMASTER);
	
	IF(I==0)
	{
		RETURN;
	};
	IF(Item.MAINFLAG==Item_KAT_FF)
	{
		WEAPONTYPE=0;//ranged
	}
	ELSE
	{
		WEAPONTYPE=1;//melee
	};

	NPC_REMOVEInvItem(HERO,ID);
	B_ClearCategory(ITMMAST,1);
	B_TransferCategory(HERO,1,ITMMAST);
	CREATEInvItem(HERO,ID);
	
	IF(WEAPONTYPE==0)
	{
		AI_EQUIPBESTRANGEDWEAPON(HERO);
	}
	ELSE
	{
		AI_EQUIPBESTMELEEWEAPON(HERO);
	};

	GIVEBACKWEAPONS=TRUE;
	WLD_SENDTRIGGER("DUALTRIGGER2");
};

/*************************************************************************
**																		**
**		B_NumToString													**
**		=============													**
**																		**
**		Number int to string number.									**
**																		**
*************************************************************************/
FUNC STRING B_NUMTOSTRING(VAR INT N)
{
	VAR STRING M;
	VAR INT OP;
	IF(N==0){M="zero";}
	ELSE IF(N==1){M="jeden";}
	ELSE IF(N==2){M="dwa";}
	ELSE IF(N==3){M="trzy";}
	ELSE IF(N==4){M="cztery";}
	ELSE IF(N==5){M="pi��";}
	ELSE IF(N==6){M="sze��";}
	ELSE IF(N==7){M="siedem";}
	ELSE IF(N==8){M="osiem";}
	ELSE IF(N==9){M="dziewi��";}
	ELSE IF(N==10){M="dziesi��";}
	ELSE IF(N==11){M="jedena�cie";}
	ELSE IF(N==12){M="dwana�cie";}
	ELSE IF(N==13){M="trzyna�cie";}
	ELSE IF(N==14){M="czterna�cie";}
	ELSE IF(N==15){M="pietna�cie";}
	ELSE IF(N==16){M="szesna�cie";}
	ELSE IF(N==17){M="siedemna�cie";}
	ELSE IF(N==18){M="osiemna�cie";}
	ELSE IF(N==19){M="dziewietna�cie";}
	ELSE IF(N==20){M="dwadzie�cia";}
	ELSE IF(N==21){M="dwadzie�cia jeden";}
	ELSE IF(N==22){M="dwadzie�cia dwa";}
	ELSE IF(N==23){M="dwadzie�cia trzy";}
	ELSE IF(N==24){M="dwadzie�cia cztery";}
	ELSE IF(N==25){M="dwadzie�cia pi��";}
	ELSE IF(N==26){M="dwadzie�cia sze��";}
	ELSE IF(N==27){M="dwadzie�cia siedem";}
	ELSE IF(N==28){M="dwadzie�cia osiem";}
	ELSE IF(N==29){M="dwadzie�cia dziewi��";}
	ELSE IF(N==30){M="trzydzie�ci";}
	ELSE IF(N==31){M="trzydzie�ci jeden";}
	ELSE IF(N==32){M="trzydzie�ci dwa";}
	ELSE IF(N==33){M="trzydzie�ci trzy";}
	ELSE IF(N==34){M="trzydzie�ci cztery";}
	ELSE IF(N==35){M="trzydzie�ci pi��";}
	ELSE IF(N==36){M="trzydzie�ci sze��";}
	ELSE IF(N==37){M="trzydzie�ci siedem";}
	ELSE IF(N==38){M="trzydzie�ci osiem";}
	ELSE IF(N==39){M="trzydzie�ci dziewi��";}
	ELSE IF(N==40){M="czterdzie�ci";}
	ELSE IF(N==41){M="czterdzie�ci jeden";}
	ELSE IF(N==42){M="czterdzie�ci dwa";}
	ELSE IF(N==43){M="czterdzie�ci trzy";}
	ELSE IF(N==44){M="czterdzie�ci cztery";}
	ELSE IF(N==45){M="czterdzie�ci pi��";}
	ELSE IF(N==46){M="czterdzie�ci sze��";}
	ELSE IF(N==47){M="czterdzie�ci siedem";}
	ELSE IF(N==48){M="czterdzie�ci osiem";}
	ELSE IF(N==49){M="czterdzie�ci dziewi��";}
	ELSE IF(N==50){M="pi��dziesi�t";}
	ELSE IF(N==51){M="pi��dziesi�t jeden";}
	ELSE IF(N==52){M="pi��dziesi�t dwa";}
	ELSE IF(N==53){M="pi��dziesi�t trzy";}
	ELSE IF(N==54){M="pi��dziesi�t cztery";}
	ELSE IF(N==55){M="pi��dziesi�t pi��";}
	ELSE IF(N==56){M="pi��dziesi�t sze��";}
	ELSE IF(N==57){M="pi��dziesi�t siedem";}
	ELSE IF(N==58){M="pi��dziesi�t osiem";}
	ELSE IF(N==59){M="pi��dziesi�t dziewi��";}
	ELSE IF(N==60){M="sze��dziesi�t";}
	ELSE IF(N==61){M="sze��dziesi�t jeden";}
	ELSE IF(N==62){M="sze��dziesi�t dwa";}
	ELSE IF(N==63){M="sze��dziesi�t trzy";}
	ELSE IF(N==64){M="sze��dziesi�t cztery";}
	ELSE IF(N==65){M="sze��dziesi�t pi��";}
	ELSE IF(N==66){M="sze��dziesi�t sze��";}
	ELSE IF(N==67){M="sze��dziesi�t siedem";}
	ELSE IF(N==68){M="sze��dziesi�t osiem";}
	ELSE IF(N==69){M="sze��dziesi�t dziewi��";}
	ELSE IF(N==70){M="siedemdziesi�t";}
	ELSE IF(N==71){M="siedemdziesi�t jeden";}
	ELSE IF(N==72){M="siedemdziesi�t dwa";}
	ELSE IF(N==73){M="siedemdziesi�t trzy";}
	ELSE IF(N==74){M="siedemdziesi�t cztery";}
	ELSE IF(N==75){M="siedemdziesi�t pi��";}
	ELSE IF(N==76){M="siedemdziesi�t sze��";}
	ELSE IF(N==77){M="siedemdziesi�t siedem";}
	ELSE IF(N==78){M="siedemdziesi�t osiem";}
	ELSE IF(N==79){M="siedemdziesi�t dziewi��";}
	ELSE IF(N==80){M="osiemdziesi�t";}
	ELSE IF(N==81){M="osiemdziesi�t jeden";}
	ELSE IF(N==82){M="osiemdziesi�t dwa";}
	ELSE IF(N==83){M="osiemdziesi�t trzy";}
	ELSE IF(N==84){M="osiemdziesi�t cztery";}
	ELSE IF(N==85){M="osiemdziesi�t pi��";}
	ELSE IF(N==86){M="osiemdziesi�t sze��";}
	ELSE IF(N==87){M="osiemdziesi�t siedem";}
	ELSE IF(N==88){M="osiemdziesi�t osiem";}
	ELSE IF(N==89){M="osiemdziesi�t dziewi��";}
	ELSE IF(N==90){M="dziewi��dziesi�t";}
	ELSE IF(N==91){M="dziewi��dziesi�t jeden";}
	ELSE IF(N==92){M="dziewi��dziesi�t dwa";}
	ELSE IF(N==93){M="dziewi��dziesi�t trzy";}
	ELSE IF(N==94){M="dziewi��dziesi�t cztery";}
	ELSE IF(N==95){M="dziewi��dziesi�t pi��";}
	ELSE IF(N==96){M="dziewi��dziesi�t sze��";}
	ELSE IF(N==97){M="dziewi��dziesi�t siedem";}
	ELSE IF(N==98){M="dziewi��dziesi�t osiem";}
	ELSE IF(N==99){M="dziewi��dziesi�t dziewi��";}
	ELSE IF(N==100){M="sto";}
	ELSE IF(N==110){M="sto dziesi��";}
	ELSE IF(N==120){M="sto dwadzie�cia";}
	ELSE IF(N==130){M="sto trzydzie�ci";}
	ELSE IF(N==140){M="sto czterdzie�ci";}
	ELSE IF(N==150){M="sto pi��dziesi�t";}
	ELSE IF(N==160){M="sto sze��dziesi�t";}
	ELSE IF(N==170){M="sto siedemdziesi�t";}
	ELSE IF(N==180){M="sto osiemdziesi�t";}
	ELSE IF(N==190){M="sto dziewi��dziesi�t";}
	ELSE IF(N==200){M="dwie�cie";}
	ELSE IF(N==210){M="dwie�cie dziesi��";}
	ELSE IF(N==220){M="dwie�cie dwadzie�cia";}
	ELSE IF(N==230){M="dwie�cie trzydzie�ci";}
	ELSE IF(N==240){M="dwie�cie czterdzie�ci";}
	ELSE IF(N==250){M="dwie�cie pi��dziesi�t";}
	ELSE IF(N==260){M="dwie�cie sze��dziesi�t";}
	ELSE IF(N==270){M="dwie�cie siedemdziesi�t";}
	ELSE IF(N==280){M="dwie�cie osiemdziesi�t";}
	ELSE IF(N==290){M="dwie�cie dziewi��dziesi�t";}
	ELSE IF(N==300){M="trzysta";}
	ELSE IF(N==310){M="trzysta dziesi��";}
	ELSE IF(N==320){M="trzysta dwadzie�cia";}
	ELSE IF(N==330){M="trzysta trzydzie�ci";}
	ELSE IF(N==340){M="trzysta czterdzie�ci";}
	ELSE IF(N==350){M="trzysta pi��dziesi�t";}
	ELSE IF(N==360){M="trzysta sze��dziesi�t";}
	ELSE IF(N==370){M="trzysta siedemdziesi�t";}
	ELSE IF(N==380){M="trzysta osiemdziesi�t";}
	ELSE IF(N==390){M="trzysta dziewi��dziesi�t";}
	ELSE IF(N==400){M="czterysta";}
	ELSE IF(N==410){M="czterysta dziesi��";}
	ELSE IF(N==420){M="czterysta dwadzie�cia";}
	ELSE IF(N==430){M="czterysta trzydzie�ci";}
	ELSE IF(N==440){M="czterysta czterdzie�ci";}
	ELSE IF(N==450){M="czterysta pi��dziesi�t";}
	ELSE IF(N==460){M="czterysta sze��dziesi�t";}
	ELSE IF(N==470){M="czterysta siedemdziesi�t";}
	ELSE IF(N==480){M="czterysta osiemdziesi�t";}
	ELSE IF(N==490){M="czterysta dziewi��dziesi�t";}
	ELSE IF(N==500){M="pi�cset";}
	ELSE IF(N==510){M="pi�cset dziesi��";}
	ELSE IF(N==520){M="pi�cset dwadzie�cia";}
	ELSE IF(N==530){M="pi�cset trzydzie�ci";}
	ELSE IF(N==540){M="pi�cset czterdzie�ci";}
	ELSE IF(N==550){M="pi�cset pi��dziesi�t";}
	ELSE IF(N==560){M="pi�cset sze��dziesi�t";}
	ELSE IF(N==570){M="pi�cset siedemdziesi�t";}
	ELSE IF(N==580){M="pi�cset osiemdziesi�t";}
	ELSE IF(N==590){M="pi�cset dziewi��dziesi�t";}
	ELSE IF(N==600){M="sze��set";}
	ELSE IF(N==610){M="sze��set dziesi��";}
	ELSE IF(N==620){M="sze��set dwadzie�cia";}
	ELSE IF(N==630){M="sze��set trzydzie�ci";}
	ELSE IF(N==640){M="sze��set czterdzie�ci";}
	ELSE IF(N==650){M="sze��set pi��dziesi�t";}
	ELSE IF(N==660){M="sze��set sze��dziesi�t";}
	ELSE IF(N==670){M="sze��set siedemdziesi�t";}
	ELSE IF(N==680){M="sze��set osiemdziesi�t";}
	ELSE IF(N==690){M="sze��set dziewi��dziesi�t";}
	ELSE IF(N==700){M="siedemset";}
	ELSE IF(N==710){M="siedemset dziesi��";}
	ELSE IF(N==720){M="siedemset dwadzie�cia";}
	ELSE IF(N==730){M="siedemset trzydzie�ci";}
	ELSE IF(N==740){M="siedemset czterdzie�ci";}
	ELSE IF(N==750){M="siedemset pi��dziesi�t";}
	ELSE IF(N==760){M="siedemset sze��dziesi�t";}
	ELSE IF(N==770){M="siedemset siedemdziesi�t";}
	ELSE IF(N==780){M="siedemset osiemdziesi�t";}
	ELSE IF(N==790){M="siedemset dziewi��dziesi�t";}
	ELSE IF(N==800){M="osiemset";}
	ELSE IF(N==810){M="osiemset dziesi��";}
	ELSE IF(N==820){M="osiemset dwadzie�cia";}
	ELSE IF(N==830){M="osiemset trzydzie�ci";}
	ELSE IF(N==840){M="osiemset czterdzie�ci";}
	ELSE IF(N==850){M="osiemset pi��dziesi�t";}
	ELSE IF(N==860){M="osiemset sze��dziesi�t";}
	ELSE IF(N==870){M="osiemset siedemdziesi�t";}
	ELSE IF(N==880){M="osiemset osiemdziesi�t";}
	ELSE IF(N==890){M="osiemset dziewi��dziesi�t";}
	ELSE IF(N==900){M="dziewi��set";}
	ELSE IF(N==910){M="dziewi��set dziesi��";}
	ELSE IF(N==920){M="dziewi��set dwadzie�cia";}
	ELSE IF(N==930){M="dziewi��set trzydzie�ci";}
	ELSE IF(N==940){M="dziewi��set czterdzie�ci";}
	ELSE IF(N==950){M="dziewi��set pi��dziesi�t";}
	ELSE IF(N==960){M="dziewi��set sze��dziesi�t";}
	ELSE IF(N==970){M="dziewi��set siedemdziesi�t";}
	ELSE IF(N==980){M="dziewi��set osiemdziesi�t";}
	ELSE IF(N==990){M="dziewi��set dziewi��dziesi�t";}
	ELSE IF(N==1000){M="tysi��";}
	ELSE IF(N==1100){M="tysi�� sto";}
	ELSE IF(N==1200){M="tysi�� dwie�cie";}
	ELSE IF(N==1300){M="tysi�� trzysta";}
	ELSE IF(N==1400){M="tysi�� czterysta";}
	ELSE IF(N==1500){M="tysi�� pi��set";}
	ELSE IF(N==1600){M="tysi�� sze��set";}
	ELSE IF(N==1700){M="tysi�� siedemset";}
	ELSE IF(N==1800){M="tysi�� osiemset";}
	ELSE IF(N==1900){M="tysi�� dziewi��set";}
	ELSE IF(N==2000){M="dwa tysi�ce";}
	ELSE IF(N==2100){M="dwa tysi�ce sto";}
	ELSE IF(N==2200){M="dwa tysi�ce dwie�cie";}
	ELSE IF(N==2300){M="dwa tysi�ce trzysta";}
	ELSE IF(N==2400){M="dwa tysi�ce czterysta";}
	ELSE IF(N==2500){M="dwa tysi�ce pi��set";}
	ELSE IF(N==2600){M="dwa tysi�ce sze��set";}
	ELSE IF(N==2700){M="dwa tysi�ce siedemset";}
	ELSE IF(N==2800){M="dwa tysi�ce osiemset";}
	ELSE IF(N==2900){M="dwa tysi�ce dziewi��set";}
	ELSE IF(N==3000){M="trzy tysi�ce";}
	ELSE IF(N==3500){M="trzy tysi�ce pi��set";}
	ELSE IF(N==4000){M="cztery tysi�ce";}
	ELSE IF(N==4500){M="cztery tysi�ce pi��set";}
	ELSE IF(N==5000){M="pi�� tysi�cy";}
	ELSE IF(N==5500){M="pi�� tysi�cy pi��set";}
	ELSE IF(N==6000){M="sze�� tysi�cy";}
	ELSE IF(N==6500){M="sze�� tysi�cy pi��set";}
	ELSE IF(N==7000){M="siedem tysi�cy";}
	ELSE IF(N==7500){M="siedem tysi�cy pi��set";}
	ELSE IF(N==8000){M="osiem tysi�cy";}
	ELSE IF(N==8500){M="osiem tysi�cy pi��set";}
	ELSE IF(N==9000){M="dziewi�� tysi�cy";}
	ELSE IF(N==9500){M="dziewi�� tysi�cy pi��set";}
	ELSE IF(N==10000){M="dzie�i�� tysi�cy";}
	ELSE IF(N==15000){M="pi�tna�cie tysi�cy";}
	ELSE IF(N==20000){M="dwadzie�cia tysi�cy";}
	ELSE IF(N==25000){M="dwadzie�cia pi�� tysi�cy";}
	ELSE IF(N==30000){M="trzydzie�ci tysi�cy";}
	ELSE IF(N==50000){M="pi��dziesi�t tysi�cy";}
	ELSE IF(N==100000){M="sto tysi�cy";}
	ELSE{M=INTTOSTRING(N);};
	RETURN M;
};

///////////////////////////////////////////////////////////////////////////////
///             GOTO WP NEXT TO NPC
//  ======================
//
//////////
//////////////////////////////////////////////////////////////////////////////
FUNC VOID B_GOTOWPNEXTTONPC(VAR C_NPC SLF,VAR C_NPC OTH)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_GotoWPNextToNpc");

	VAR STRING WAYPOINT;
	WAYPOINT=NPC_GETNEXTWP(OTH);
	AI_GOTOWP(SLF,WAYPOINT);
};
//////////////////////////////////////////////////////////////////////////
//B_CantSeeTurn
//=============
//
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_CANTSEETURN()
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_CantSeeTurn");

	IF((!C_BODYSTATECONTAINS(SELF,BS_SIT))&& !NPC_CANSEENPC(SELF,OTHER))
	{
		////PrintDebugNpc(PD_ZS_CHECK,"B_CantSeeTurn If");
		AI_TURNTONPC(SELF,OTHER);
	};
};

//------------------------------------------------------------------- //
//---- Ruft AI_LookAtNpc auf wenn der slf nicht in AIV_ISLOOKING ---- //
//------------------------------------------------------------------- //

//19.09.00 (SN): VORSICHT, ich habe die Abfrage auf AI-Variable herausgenommen, da das a) Probleme bereitete, und b) nach einem Bugfix auch nicht mehr n�tig ist! -> getestet und funktioniert!!!
FUNC INT C_LOOKATNPC(VAR C_NPC SLF,VAR C_NPC OTH)
{
	//if (!Npc_GetAivar( slf, AIV_ISLOOKING ) )
	//{
	AI_LOOKATNPC(SLF,OTH);
	////PrintDebugNpc(PD_ZS_DETAIL,"C_LookAtNpc");	//...dann, glotzen lassen...
	//Npc_SetAivar(slf,AIV_ISLOOKING,  1);								// ...und merken, da� es glotzt
	RETURN 1;
	//};
	//return 0;
};
//G2
//***********
//B_LookAtNpc
//***********

FUNC VOID B_LOOKATNPC(VAR C_NPC SLF,VAR C_NPC OTH)
{
	AI_STOPLOOKAT(SLF);
	AI_LOOKATNPC(SLF,OTH);
};
//---------------------------------------------------------------- //
//---- Stopt AI_LookAtNpc wenn der slf nicht in AIV_ISLOOKING ---- //
//---------------------------------------------------------------- //

//FIXME: Recover AIV
FUNC INT C_STOPLOOKAT(VAR C_NPC SLF)
{
	//if ( Npc_GetAivar(slf, AIV_ISLOOKING ) )								// schaut das Monster �berhaupt?
	//{																// ...ja!
	AI_STOPLOOKAT(SLF);
	////PrintDebugNpc(PD_ZS_DETAIL,"C_StopLookAt");	//...dann aufh�ren lassen...
	//Npc_SetAivar(slf, AIV_ISLOOKING ,  0);								// ...Npc_SetAivar(und merken, da� es aufgeh�rt hat!
	RETURN 1;
	//};
	//return 0;
};

//////////////////////////////////////////////////////////////////////////
//B_SmartTurnToNpc
//================
//Der NSC versucht erst zum Ziel hinzusehen. Wenn ds Ziel nicht im
//Blickwinkel liegt, dreht sich der NSC richtig zum Ziel.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_SMARTTURNTONPC(VAR C_NPC SLF,VAR C_NPC OTH)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_SmartTurnToNpc");

	IF(!(C_BODYSTATECONTAINS(SLF,BS_SIT)
	||		C_BODYSTATECONTAINS(SLF,BS_ItemINTERACT)
	||		C_BODYSTATECONTAINS(SLF,BS_MOBINTERACT)
	||		C_BODYSTATECONTAINS(SLF,BS_MOBINTERACT_INTERRUPT)))
	{
		////PrintDebugNpc(PD_ZS_DETAIL,"...sitzt nicht und ist nicht am Mobsi");
		IF(!NPC_CANSEENPC(SLF,OTH))
		{
			////PrintDebugNpc(PD_ZS_DETAIL,"...kann Ziel nicht sehen!");
			AI_TURNTONPC(SLF,OTH);
		}
		ELSE
		{
			C_LOOKATNPC(SLF,OTH);
		};
	};
};
//////////////////////////////////////////////////////////////////////////
//B_Say
//=====
//L��t den Nsc 'slf' einen SVM-Satz 'text' zum Nsc 'oth' sagen. Der
//Sprecher sieht den Gespr�chspartner dabei an, bzw. dreht sich, falls
//er den Hals zu sehr verrenken m�sste.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_SAY(VAR C_NPC SLF,VAR C_NPC OTH,VAR STRING TEXT)
{
	VAR STRING PIPE;
	Npc_PercDisable	(self,	PERC_NPCCOMMAND);
	PIPE=CONCATSTRINGS("B_Say: ",TEXT);
	////PrintDebugNpc(PD_ZS_FRAME,PIPE);

	B_SMARTTURNTONPC(SLF,OTH);
	AI_OUTPUTSVM(SLF,OTH,TEXT);
};

//////////////////////////////////////////////////////////////////////////
//B_SayOverlay
//===========
//Wie B_Say() benutzt allerdings AI_OutputSVMOverlay(), welches mit
//der Ausf�hrung der folgenden AI-Befehle NICHT wartet, bis der Satz
//zu Ende gesprochen wurde.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_SAYOVERLAY(VAR C_NPC SLF,VAR C_NPC OTH,VAR STRING TEXT)
{
	VAR STRING PIPE;
	Npc_PercDisable	(self,	PERC_NPCCOMMAND);

	PIPE=CONCATSTRINGS("B_SayOverlay: ",TEXT);
	////PrintDebugNpc(PD_ZS_FRAME,PIPE);

	B_SMARTTURNTONPC(SLF,OTH);

	//SN: VORSICHT: Bug #3046, w�rgt das SVM-Sample beim Zustandswechsel ab. Soll in v1.01 behoben sein.
	AI_OUTPUTSVM_OVERLAY(SLF,OTH,TEXT);
};

//////////////////////////////////////////////////////////////////////////
//B_StandUp
//=========
//Beendet alle m�glichen Sitzstellungen.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_STANDUP(VAR C_NPC SLF)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_StandUp");

	IF C_BODYSTATECONTAINS(SLF,BS_SIT)
	{
		IF(Npc_GetAivar(SLF,AIV_HANGAROUNDSTATUS)==1)
		{
			AI_PLAYANI(SLF,"T_SIT_2_STAND");
			Npc_SetAivar(SLF,AIV_HANGAROUNDSTATUS,0);
		}
		ELSE IF(Npc_GetAivar(SLF,AIV_HANGAROUNDSTATUS)==4)
		{
			AI_USEMOB(SLF,"SMALL THRONE",-1);
			Npc_SetAivar(SLF,AIV_HANGAROUNDSTATUS,0);
		}
		ELSE IF(Npc_GetAivar(SLF,AIV_HANGAROUNDSTATUS)==2)
		{
			AI_USEMOB(SLF,"BENCH",-1);
			Npc_SetAivar(SLF,AIV_HANGAROUNDSTATUS,0);
		}
		ELSE IF(Npc_GetAivar(SLF,AIV_HANGAROUNDSTATUS)==3)
		{
			AI_USEMOB(SLF,"CHAIR",-1);
			Npc_SetAivar(SLF,AIV_HANGAROUNDSTATUS,0);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//B_CallComrades
//==============
//Ruft die in der N�he befindlichen Kameraden heran.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_CALLCOMRADES()
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_CallComrades");

	B_SAYOVERLAY(SELF,NULL,"$COMRADESHELP");
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSWARN,SELF,OTHER);
};

//////////////////////////////////////////////////////////////////////////
//B_CallGuards
//============
//Ruft die in der N�he befindlichen Wachen heran.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_CALLGUARDS()
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_CallGuards");

	B_SAYOVERLAY(SELF,NULL,"$HELP");
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSWARN,SELF,OTHER);
};

//////////////////////////////////////////////////////////////////////////
//B_IntruderAlert
//===============
//Warnt vor Eindringling und ruft die in der N�he befindlichen
//Kameraden heran.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_INTRUDERALERT(VAR C_NPC SLF,VAR C_NPC OTH)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_IntruderAlert");

	B_SAYOVERLAY(SLF,NULL,"$IntruderAlert");
	NPC_SENDPASSIVEPERC(SLF,PERC_ASSESSWARN,SLF,OTH);
};

//////////////////////////////////////////////////////////////////////////
//B_FullStop
//==========
//Unterbricht jegliche Animation des NSCs. Hier wurde fr�her AI_Standup()
//verwendet. Dieser Befehl ist in einigen Situationen jedoch zu tr�ge
//und wurde durch AI_StandUpQuick() ersetzt
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_FULLSTOP(VAR C_NPC NPC)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_FullStop");

	NPC_ClearAIQUEUE(NPC);
	AI_STANDUPQUICK(NPC);
};

//////////////////////////////////////////////////////////////////////////
//B_ResetTempAttitude
//===================
//Setzt den Wert der Tempor�ren Attit�de auf den der Permanenten!
//Symbolisiert die Beruhigung des NSCs.
//
//Voraussetzungen:
//- 'slf' mu� ein NSC sein
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_RESETTEMPATTITUDE(VAR C_NPC SLF)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_ResetTempAttitude");

	NPC_SETTEMPATTITUDE(SLF,NPC_GETPERMATTITUDE(SLF,HERO));
};

//////////////////////////////////////////////////////////////////////////
//B_WhirlAround
//=============
//Wirbelt nur herum, wenn der NSC 'slf' das Ziel 'oth' nicht sehen kann.
//Wenn er das Ziel sehen kann, wird nur ein einfacher AI_TurnTo ausgef�hrt.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_WHIRLAROUND(VAR C_NPC SLF,VAR C_NPC OTH)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_WhirlAround");

	IF(NPC_CANSEENPC(SLF,OTH))
	{
		////PrintDebugNpc(PD_ZS_DETAIL,"...KANN Ziel sehen!");
		AI_TURNTONPC(SLF,OTH);
	}
	ELSE
	{
		////PrintDebugNpc(PD_ZS_DETAIL,"...kann Ziel NICHT sehen!");
		AI_WHIRLAROUND(SLF,OTH);
	};
};

//////////////////////////////////////////////////////////////////////////
//B_DropWeapon
//=============
//L��t die derzeit gezogene Waffe fallen. Wenn keine gezogen ist,
//passiert nichts.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_DROPWEAPON(VAR C_NPC SLF)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_DropWeapon");

	VAR C_Item	ITM;
	VAR INT ItemID;

	ITM=NPC_GETREADIEDWEAPON(SLF);
	IF(HLP_ISVALIDItem(ITM))
	{
		ItemID=HLP_GETINSTANCEID(ITM);
		////PrintDebugNpc(PD_ZS_DETAIL,ITM.NAME);
		AI_DROPItem(SLF,ItemID);
	};
};

//////////////////////////////////////////////////////////////////////////
//B_RegainDroppedWeapon
//=====================
//Guckt sich um und sammelt die Waffe, die am n�chsten liegt wieder auf.
//VORSICHT: L�scht die globale Variable 'Item' !
//NEWS,NEWS-22:36 2006-06-08
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_RegainDroppedWeapon(VAR C_NPC SLF)
{
	//-------- fallgelassene Waffe aufheben... --------
	NPC_PERCEIVEALL(SLF);
	IF(WLD_DETECTItem(SLF,Item_KAT_NF)|| WLD_DETECTItem(SLF,Item_KAT_FF))
	{
		IF	!NPC_ISPLAYER(SLF)
		&&	NPC_CANSEEItem(SLF,Item)
		{
			////PrintDebugNpc(PD_ZS_CHECK,"...NSC hebt seine Waffen wieder auf!");
			AI_TakeItem(SLF,Item);
			AI_EQUIPBESTMELEEWEAPON(SLF);
			AI_EQUIPBESTRANGEDWEAPON(SLF);
			return;
		};
	};
	//No weapon regained, create def weapon
	//I had some oth weapon?  (MW CAT)
	if(!Npc_GetInvItembyslot(slf,1,0))
	{
		if(NPC_GetTalentSkill(SLF,NPC_TALENT_2H)>NPC_GetTalentSkill(SLF,NPC_TALENT_1H))
		{
			CreateInvItem(slf,DEF_MW_2H);
		}
		else
		{
			CreateInvItem(slf,DEF_MW_1H);		
		};   
	};  
	AI_EQUIPBESTMELEEWEAPON(SLF);
	AI_EQUIPBESTRANGEDWEAPON(SLF);	
};
//////////////////////////////////////////////////////////////////////////
//B_RegainDroppedArmor
//=====================
//Guckt sich um und sammelt die R�stung, die am n�chsten liegt wieder auf.
//VORSICHT: L�scht die globale Variable 'Item' !
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_REGAINDROPPEDARMOR(VAR C_NPC SLF)
{
	//-------- fallgelassene Waffe aufheben... --------
	NPC_PERCEIVEALL(SLF);
	IF(WLD_DETECTItem(SLF,Item_KAT_ARMOR))
	{
		IF(!NPC_ISPLAYER(SLF))
		{
			////PrintDebugNpc(PD_ZS_CHECK,"...NSC hebt seine R�stung wieder auf!");
			AI_TAKEItem(SLF,Item);
			AI_EQUIPBESTARMOR(SLF);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//B_GotoFP
//========
//Geht zum n�chsten freien Freepoint. Checkt, ob der NSC nicht schon
//dort steht!
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_GOTOFP(VAR C_NPC SLF,VAR STRING FP)
{
	////PrintDebugNpc(PD_TA_LOOP,"B_GotoFP");

	IF !(NPC_ISONFP(SELF,FP))
	{
		//PrintDebugString(PD_TA_CHECK,"...nicht auf passendem Freepoint ",FP);

		IF(WLD_ISNEXTFPAVAILABLE(SELF,FP))
		{
			//PrintDebugString(PD_TA_CHECK,"Gehe zu Freepoint ",FP);
			AI_SETWALKMODE(SELF,NPC_WALK);
			AI_GOTONEXTFP(SELF,FP);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//B_StopGotoHero
//==============
//Diese Funktion kann benutzt werden um durch ein PERC_MOVENPC ein
//AI_GotoNpc(self, hero) vorzeitig abzubrechen, bevor der NSC in den SC
//hineinl�uft!
//- benutzt 'self' und 'hero'
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_STOPGOTOHERO()
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_StopGotoHero");

	IF(NPC_ISPLAYER(OTHER))
	{
		////PrintDebugNpc(PD_ZS_DETAIL,"...Kollision mit Spieler!");
		NPC_PERCDISABLE(SELF,PERC_MOVENPC);
		B_FULLSTOP(SELF);
	};
};

//////////////////////////////////////////////////////////////////////////
//B_SetAttackReason
//=================
//Setzt den Grund des Angriffs eines NSCs, damit sp�ter darauf
//abgefragt werden kann.
//Konstanten sind in AI_CONSTANTS.D zu finden
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_SetAttackReason(VAR C_NPC SLF,VAR INT REASON)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_SetAttackReason");

	Npc_SetAivar(SLF,AIV_ATTACKREASON,REASON);
};

//////////////////////////////////////////////////////////////////////////
//B_KillNpc
//=========
//Setzt die Lebenspunkte des angegebenen NSCs auf 0.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_KILLNPC(VAR INT NPCINSTANCE)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_KillNpc");

	VAR C_NPC NPC;	NPC=HLP_GETNPC(NPCINSTANCE);
	VAR INT ItemINSTANCE;

	NPC.FLAGS=0;

	CREATEInvItem(NPC,ITMI_STUFF_OLDCOIN_02);	//Mission-Item, das verhindert, da� die Toten entfernt werden

	NPC_CHANGEATTRIBUTE(NPC,ATR_HITPOINTS,-NPC.ATTRIBUTE[ATR_HITPOINTS_MAX]);

	IF(NPC_GETInvItemBYSLOT(NPC,Inv_WEAPON,1))
	{
		////PrintDebugNpc(PD_ZS_DETAIL,"...Waffe in Slot 1 gefunden!");
		ItemINSTANCE=HLP_GETINSTANCEID(Item);
		NPC_REMOVEInvItem(NPC,ItemINSTANCE);
	};

	IF(NPC_GETInvItemBYSLOT(NPC,Inv_WEAPON,2))
	{
		////PrintDebugNpc(PD_ZS_DETAIL,"...Waffe in Slot 2 gefunden!");
		ItemINSTANCE=HLP_GETINSTANCEID(Item);
		NPC_REMOVEInvItem(NPC,ItemINSTANCE);
	};
};
FUNC VOID B_DISPEARNPC(VAR INT NPCINSTANCE)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_DispearNPC");

	VAR C_NPC	NPC;	NPC=HLP_GETNPC(NPCINSTANCE);
	VAR INT ItemINSTANCE;

	NPC.FLAGS=0;

	NPC_CHANGEATTRIBUTE(NPC,ATR_HITPOINTS,-NPC.ATTRIBUTE[ATR_HITPOINTS_MAX]);

	IF(NPC_GETInvItemBYSLOT(NPC,Inv_WEAPON,1))
	{
		////PrintDebugNpc(PD_ZS_DETAIL,"...Waffe in Slot 1 gefunden!");
		ItemINSTANCE=HLP_GETINSTANCEID(Item);
		NPC_REMOVEInvItem(NPC,ItemINSTANCE);
	};

	IF(NPC_GETInvItemBYSLOT(NPC,Inv_WEAPON,2))
	{
		////PrintDebugNpc(PD_ZS_DETAIL,"...Waffe in Slot 2 gefunden!");
		ItemINSTANCE=HLP_GETINSTANCEID(Item);
		NPC_REMOVEInvItem(NPC,ItemINSTANCE);
	};
	AI_TELEPORT(NPC,"InvISIBLE");
};
//Visualisierung: Schriftst�ck lesen -> 'self' zieht ein St�ck Pergament aus der Tasche und wirft einen Blick drauf
FUNC VOID B_USEFAKESCROLL(VAR C_NPC SLF)
{
	IF(C_BODYSTATECONTAINS(SELF,BS_SIT))
	{
		AI_STANDUP(SLF);
		AI_TURNTONPC(SLF,HERO);
	};

	CREATEInvItem(SLF,FAKESCROLL);//Fire Letter after use dispear!
	AI_USEItemTOSTATE(SLF,FAKESCROLL,1);
	B_PRINTDEBUG("useit");
	AI_WAIT(SLF,1);
	AI_USEItemTOSTATE(SLF,FAKESCROLL,-1);
	//Npc_RemoveInvItem		(slf,	Fakescroll);//Fire Letter after use dispear!

	//Npc_RemoveInvItem(self,	Myrtanas_Lyrik);
};

//////////////////////////////////////////////////////////////////////////
//B_ChangeGuild
//=============
//�ndert die Gilde des angegebenen NSCs
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_CHANGEGUILD(VAR INT NPCINSTANCE,VAR INT NEWGUILD)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_ChangeGuild");

	VAR C_NPC	NPC;
	NPC=HLP_GETNPC(NPCINSTANCE);

	NPC_SETTRUEGUILD(NPC,NEWGUILD);
	NPC.GUILD=NEWGUILD;
};

//////////////////////////////////////////////////////////////////////////
//B_ExchangeRoutine
//=================
//�ndert den Tagesablauf des angegebenen NSCs
//
//VORSICHT:	Auf KEINEN Fall f�r 'self' innerhalb eines Dialoges
//benutzen, da AI_ContinueRoutine() den Dialog freezed!!!
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_EXCHANGEROUTINE(VAR INT NPCINSTANCE,VAR STRING NEWROUTINE)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_ExchangeRoutine");

	VAR C_NPC	NPC;
	NPC=HLP_GETNPC(NPCINSTANCE);

	IF(C_BODYSTATECONTAINS(NPC,BS_SIT))
	{
		NPC_ClearAIQUEUE(NPC);
		AI_STANDUP(NPC);
	};

	NPC_EXCHANGEROUTINE(NPC,NEWROUTINE);
	AI_CONTINUEROUTINE(NPC);
};

//////////////////////////////////////////////////////////////////////////
//B_SetPermAttitude
//=================
//�ndert die permamente Attit�de des angegebenen NSCs zum SC
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_SETPERMATTITUDE(VAR INT NPCINSTANCE,VAR INT NEWATTITUDE)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_SetPermAttitude");

	VAR C_NPC	NPC;
	NPC=HLP_GETNPC(NPCINSTANCE);

	NPC_SETATTITUDE(NPC,NEWATTITUDE);
	NPC_SETTEMPATTITUDE(NPC,NEWATTITUDE);
};

//////////////////////////////////////////////////////////////////////////
//B_LogEntry
//==========
//Kapselt die Funktion Log_AddEntry und gibt eine Bildschirmmeldung
//aus.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_LOGENTRY(VAR STRING TOPIC,VAR STRING ENTRY)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_LogEntry");

	LOG_ADDENTRY(TOPIC,ENTRY);
	PutMsg(NAME_NewLogEntry,"font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_LOGENTRY,"");
	
	Snd_Play("LogEntry");
};

//////////////////////////////////////////////////////////////////////////
//B_LogEntry
//==========
//Kapselt die Funktion Log_AddEntry und gibt eine Bildschirmmeldung
//aus.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_LOGSETTOPICSTATUS(VAR STRING TOPIC,VAR INT STATUS)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_LogSetTopicStatus");

	LOG_SETTOPICSTATUS(TOPIC,STATUS);

	IF(STATUS==LOG_SUCCESS)
	{
		PutMsg(concatstrings("Wykonano zadanie: ",TOPIC),"font_default.tga",RGBAToZColor(100,255,100,255),_TIME_MESSAGE_LOGENTRY,"");
		//Snd_Play 		("MisSuccess");
	}
	ELSE IF(STATUS==LOG_FAILED)
	{
		//Snd_Play 		("MisFail");
		PutMsg(concatstrings("Popsute zadanie: ",TOPIC),"font_default.tga",RGBAToZColor(255,100,100,255),_TIME_MESSAGE_LOGENTRY,"");
	};
};

//////////////////////////////////////////////////////////////////////////
//B_ClearImmortal
//===============
//L�scht sas Immortal-Flag eines NPCs
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_ClearIMMORTAL(VAR INT NPCINSTANCE)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_ClearImmortal");

	VAR C_NPC	NPC;
	NPC=HLP_GETNPC(NPCINSTANCE);

	NPC.FLAGS=0;
};

//////////////////////////////////////////////////////////////////////////
//B_SetNpcType
//============
//Setzt den NpcTyp auf den angegebenen Wert
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_SETNPCTYPE(VAR INT NPCINSTANCE,VAR INT NEWNPCTYPE)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_SetNpcType");

	VAR C_NPC	NPC;
	NPC=HLP_GETNPC(NPCINSTANCE);

	NPC.NPCTYPE=NEWNPCTYPE;
};

//////////////////////////////////////////////////////////////////////////
//B_GiveInvItems
//==============
//�bergibt ein Item von 'giver' an 'taker' und gibt eine Meldung
//auf dem Bildschirm aus.
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_GIVEInvItems(VAR C_NPC GIVER,VAR C_NPC TAKER,VAR INT ItemINSTANCE,VAR INT AMOUNT)
{
	////PrintDebugNpc(PD_ZS_DETAIL,"B_GiveInvItems");

	//-------- Gegenstand �bertragen --------
	NPC_REMOVEInvItemS(GIVER,ItemINSTANCE,AMOUNT);
	CREATEInvItemS(TAKER,ItemINSTANCE,AMOUNT);

	//-------- Meldung ausgeben --------
	VAR STRING MSG;
	NPC_GETInvItem(TAKER,ItemINSTANCE);

	IF NPC_ISPLAYER(GIVER)
	{
		IF(ItemINSTANCE==ITMINUGGET)
		{
			MSG=CONCATSTRINGS("Odda�e� bry�ek: ",INTTOSTRING(AMOUNT));
		}
		ELSE
		{
			MSG=CONCATSTRINGS("Odda�e�: ",Item.DESCRIPTION);

			IF (AMOUNT > 1)
			{
				MSG=CONCATSTRINGS(MSG," (");
				MSG=CONCATSTRINGS(MSG,inttostring(AMOUNT));
				MSG=CONCATSTRINGS(MSG,")");
			};
		};
		
		PutMsg(MSG,"font_default.tga",RGBAToZColor(255,160,100,255),_TIME_MESSAGE_GIVEN,"");
	}
	ELSE IF NPC_ISPLAYER(TAKER)
	{
		IF(ItemINSTANCE==ITMINUGGET)
		{
			MSG=CONCATSTRINGS("Otrzyma�e� bry�ek: ",INTTOSTRING(AMOUNT));
			PutMsg(MSG,"font_default.tga",RGBAToZColor(255,230,100,255),_TIME_MESSAGE_TAKEN,"");
		}
		ELSE
		{
			MSG=CONCATSTRINGS("Otrzyma�e�: ",Item.DESCRIPTION);
			
			IF (AMOUNT==1)
			{
				PutMsg(MSG,"font_default.tga",RGBAToZColor(255,230,100,255),_TIME_MESSAGE_TAKEN,"");
			}
			ELSE
			{
				MSG=CONCATSTRINGS(MSG," (");
				MSG=CONCATSTRINGS(MSG,inttostring(AMOUNT));
				MSG=CONCATSTRINGS(MSG,")");
				PutMsg(MSG,"font_default.tga",RGBAToZColor(255,160,100,255),_TIME_MESSAGE_TAKEN,"");				
			};
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//B_CheckForImportantInfo
//=======================
//Startet eine Important-Info wenn:
//- der NSC eine solche Info parat hat
//- der SC in keinem unp��lichen Bodystate ist
//- der SC gerade ein Mensch ist
//- der SC nicht gerade spricht
//////////////////////////////////////////////////////////////////////////
FUNC INT B_CHECKFORIMPORTANTINFO(VAR C_NPC SLF,VAR C_NPC OTH)
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_CheckForImportantInfo");

	//-------- Auf Vergabe von Infos & Missionen checken --------
	IF((Npc_GetAivar(OTH,AIV_InvINCIBLE)==FALSE)
	&&		C_NPCISHUMAN(OTH))//SC k�nnte verwandelt sein
	{
		////PrintDebugNpc(PD_ZS_CHECK,"...SC spricht nicht!");

		//----------- SC ist ein HumanControlled-Npc ---------------
		VAR C_NPC HER;	HER=HLP_GETNPC(PC_HERO);
		VAR C_NPC ROCK;ROCK=HLP_GETNPC(PC_ROCKEFELLER);

		IF((HLP_GETINSTANCEID(HER)!=HLP_GETINSTANCEID(HERO))&&(HLP_GETINSTANCEID(ROCK)!=HLP_GETINSTANCEID(HERO)))
		{
			RETURN FALSE;
		};

		IF	NPC_CHECKINFO(SLF,1)
		{
			////PrintDebugNpc(PD_ZS_CHECK,"...wichtige Info zu vergeben!");
			//if	(!C_BodyStateContains(oth,BS_JUMP))
			//||	Npc_IsInState(slf, ZS_GuardPassage)
			//||	Npc_WasInState(slf,ZS_GuardPassage)
			//{
			////PrintDebugNpc(PD_ZS_CHECK,"...SC springt nicht oder NSC ist Durchgangswache!");
			IF(!C_BODYSTATECONTAINS(OTH,BS_FALL))
			{
				////PrintDebugNpc(PD_ZS_CHECK,"...f�llt nicht!");
				IF(!C_BODYSTATECONTAINS(OTH,BS_SWIM))
				{
					////PrintDebugNpc(PD_ZS_CHECK,"...schwimmt nicht!");
					IF(!C_BODYSTATECONTAINS(OTH,BS_DIVE))
					{
						////PrintDebugNpc(PD_ZS_CHECK,"...taucht nicht!");
						Npc_SetAivar(HERO,AIV_IMPORTANT,TRUE);//Dialog KOMMT aufgrund einer Important-Info zustande
						B_FULLSTOP(OTH);

						IF(C_BODYSTATECONTAINS(SLF,BS_SIT))||(!NPC_CANSEENPC(SELF,HERO))
						{
							NPC_ClearAIQUEUE(SLF);
							AI_STANDUP(SLF);
						}
						ELSE
						{
							B_FULLSTOP(SLF);
						};

						AI_STARTSTATE(SLF,ZS_TALK,0,"");
						NPC_PERCDISABLE(SLF,PERC_ASSESSFIGHTER);
						RETURN			TRUE;
					};
				};
			};
			//};
		};
	};

	RETURN FALSE;
};

//////////////////////////////////////////////////////////////////////////
//B_InitGuildAttitudes
//====================
//Setzt bzw. resettet die Attit�de unter den Menschengilden
//und ber�cksichtigt dabei den Storyverlauf
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_INITGUILDATTITUDES()
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_InitGuildAttitudes");
	WLD_EXCHANGEGUILDATTITUDES("GIL_ATTITUDES");
};

//////////////////////////////////////////////////////////////////////////
//B_PracticeCombat
//================
//Spielt eine Lernanimation am angegebenen Waypoint ab.
//'hero': der lernende Spielercharakter
//'self': der lehrende NSC
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_PRACTICECOMBAT(VAR STRING WAYPOINT)
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_PracticeCombat");

	//SN: Manchmal ist die Kamera stur auf den Lehrer gerichtet und verliert den SC aus dem Bild -> sehr verwirrend, daher erst mal raus!
	/*
	if	(Npc_GetDistToWP(self, waypoint) < 1000)
	{
		AI_SetWalkmode			(hero,	NPC_WALK);
		AI_GotoWP				(hero,	waypoint);
		AI_TurnToNpc			(self,	hero);
		AI_EquipBestMeleeWeapon	(hero);
		AI_DrawWeapon			(hero);	
		AI_PlayAni				(hero,	"T_1HSFREE");
		AI_RemoveWeapon			(hero);
		AI_SetWalkmode			(hero,	NPC_WALK);
		AI_GotoNpc				(hero,	self);
		AI_TurnToNpc			(self,	hero);
	};
*/
};

//////////////////////////////////////////////////////////////////////////
//B_PrintGuildCondition
//=====================
//Gibt eine Bildschirmmeldung mit der Mindestaufnahmestufe aus
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_PRINTGUILDCONDITION(VAR INT LEVEL)
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_PrintGuildCondition");

	VAR STRING MSG;

	MSG=CONCATSTRINGS(_STR_MESSAGE_JOINCAMP,INTTOSTRING(LEVEL));

	PutMsg(MSG,"font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_JOINCAMP,"");
};
/*************************************************************************
**																		**
**		B_GetWeaponSimple													**
**		=============													**
**																		**
**		Zbieranie broni z "ziemi"		**
**		some like down but more simple											**
**																		**
*************************************************************************/
FUNC VOID B_GETWEAPONSIMPLE(VAR C_NPC SLF)
{
	AI_GOTOItem(SLF,Item);
	AI_TAKEItem(SLF,Item);
	AI_EQUIPBESTMELEEWEAPON(SLF);
	AI_READYMELEEWEAPON(SLF);
	AI_EQUIPBESTRANGEDWEAPON(SLF);
	AI_READYRANGEDWEAPON(SLF);
};
/*************************************************************************
**																		**
**		B_GetWeapon													**
**		=============													**
**																		**
**		Zbieranie broni z "ziemi"		**
**		wybredno�� slf.aiviar[AIV_LAWFULLNES]  = 0-100;												**
**																		**
*************************************************************************/
FUNC INT B_GETWEAPON(VAR C_NPC SLF,VAR INT WYBREDNOSC)
{
	///////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	///// MELEE
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////
	///////////////////
	//slfweapon = Npc_GetEquippedRangedWeapon (self);
	//if ( (Npc_GetTalentValue(self, NPC_TALENT_1H) <  Npc_GetTalentValue(self, NPC_TALENT_BOW)-25) || (Npc_GetTalentValue(self, NPC_TALENT_2H)  <  Npc_GetTalentValue(self, NPC_TALENT_BOW)-25) &&(Npc_GetTalentValue(self, NPC_TALENT_1H)  <  Npc_GetTalentValue(self, NPC_TALENT_CROSSBOW)-25) || (Npc_GetTalentValue(self, NPC_TALENT_2H)  <  Npc_GetTalentValue(self, NPC_TALENT_CROSSBOW)-25))
	IF((NPC_GETTALENTVALUE(SLF,NPC_TALENT_1H)> 10)||(NPC_GETTALENTVALUE(SLF,NPC_TALENT_2H)> 10))
	{
		VAR C_Item SLFWEAPON;
		SLFWEAPON=NPC_GETEQUIPPEDMELEEWEAPON(SLF);
		IF(WLD_DETECTItem(SLF,Item_KAT_NF))
		{
			IF((Item.DAMAGETOTAL > SLFWEAPON.DAMAGETOTAL-10))
			{
				IF(NPC_GETTALENTVALUE(SLF,NPC_TALENT_1H)-10 < NPC_GETTALENTVALUE(SLF,NPC_TALENT_2H))
				{
					AI_GOTOItem(SLF,Item);
					AI_TAKEItem(SLF,Item);
					AI_EQUIPBESTMELEEWEAPON(SLF);
					AI_READYMELEEWEAPON(SLF);
					B_SAY(SLF,NULL,"$ITakeYourWeapon");
					NPC_SETTALENTVALUE(SLF,NPC_TALENT_2H,NPC_GETTALENTVALUE(SLF,NPC_TALENT_2H)+5);
					IF(NPC_GETTALENTSKILL(SLF,NPC_TALENT_2H)< 1 && NPC_GETTALENTVALUE(SLF,NPC_TALENT_2H)> 29)
					{
						NPC_SETTALENTSKILL(SLF,NPC_TALENT_2H,1);
					}
					ELSE IF(NPC_GETTALENTSKILL(SLF,NPC_TALENT_2H)< 2 && NPC_GETTALENTVALUE(SLF,NPC_TALENT_2H)> 59)
					{
						NPC_SETTALENTSKILL(SLF,NPC_TALENT_2H,2);
					};
				}
				ELSE IF(NPC_GETTALENTVALUE(SLF,NPC_TALENT_2H)-10 < NPC_GETTALENTVALUE(SLF,NPC_TALENT_1H))
				{
					AI_GOTOItem(SLF,Item);
					AI_TAKEItem(SLF,Item);
					AI_EQUIPBESTMELEEWEAPON(SLF);
					AI_READYMELEEWEAPON(SLF);
					B_SAY(SLF,NULL,"$ITakeYourWeapon");
					NPC_SETTALENTVALUE(SLF,NPC_TALENT_1H,NPC_GETTALENTVALUE(SLF,NPC_TALENT_1H)+5);
					IF(NPC_GETTALENTSKILL(SLF,NPC_TALENT_1H)< 1 && NPC_GETTALENTVALUE(SLF,NPC_TALENT_1H)> 29)
					{
						NPC_SETTALENTSKILL(SLF,NPC_TALENT_1H,1);
					}
					ELSE IF(NPC_GETTALENTSKILL(SLF,NPC_TALENT_1H)< 2 && NPC_GETTALENTVALUE(SLF,NPC_TALENT_1H)> 59)
					{
						NPC_SETTALENTSKILL(SLF,NPC_TALENT_1H,2);
					};
				};
			};
		};
	};

	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	///// RANGED
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////
	///////////////////

	IF((NPC_GETTALENTVALUE(SLF,NPC_TALENT_BOW)> 10)||(NPC_GETTALENTVALUE(SLF,NPC_TALENT_CROSSBOW)> 10))
	{
		SLFWEAPON=NPC_GETEQUIPPEDRANGEDWEAPON(SLF);
		IF(WLD_DETECTItem(SLF,Item_KAT_FF))
		{
			IF((Item.DAMAGETOTAL > SLFWEAPON.DAMAGETOTAL-10))
			{
				IF(NPC_GETTALENTVALUE(SLF,NPC_TALENT_BOW)-10 < NPC_GETTALENTVALUE(SLF,NPC_TALENT_CROSSBOW))
				{
					AI_TAKEItem(SLF,Item);
					AI_EQUIPBESTRANGEDWEAPON(SLF);
					AI_READYRANGEDWEAPON(SLF);
					B_SAY(SLF,NULL,"$ITakeYourWeapon");
					NPC_SETTALENTVALUE(SLF,NPC_TALENT_CROSSBOW,NPC_GETTALENTVALUE(SLF,NPC_TALENT_CROSSBOW)+5);
					IF(NPC_GETTALENTSKILL(SLF,NPC_TALENT_CROSSBOW)< 1 && NPC_GETTALENTVALUE(SLF,NPC_TALENT_CROSSBOW)> 29)
					{
						NPC_SETTALENTSKILL(SLF,NPC_TALENT_CROSSBOW,1);
					}
					ELSE IF(NPC_GETTALENTSKILL(SLF,NPC_TALENT_CROSSBOW)< 2 && NPC_GETTALENTVALUE(SLF,NPC_TALENT_CROSSBOW)> 59)
					{
						NPC_SETTALENTSKILL(SLF,NPC_TALENT_CROSSBOW,2);
					};
				}
				ELSE IF(NPC_GETTALENTVALUE(SLF,NPC_TALENT_CROSSBOW)-10 < NPC_GETTALENTVALUE(SLF,NPC_TALENT_BOW))
				{
					AI_GOTOItem(SLF,Item);
					AI_TAKEItem(SLF,Item);
					AI_EQUIPBESTRANGEDWEAPON(SLF);
					AI_READYRANGEDWEAPON(SLF);
					B_SAY(SLF,NULL,"$ITakeYourWeapon");
					NPC_SETTALENTVALUE(SLF,NPC_TALENT_BOW,NPC_GETTALENTVALUE(SLF,NPC_TALENT_BOW)+5);
					IF(NPC_GETTALENTSKILL(SLF,NPC_TALENT_BOW)< 1 && NPC_GETTALENTVALUE(SLF,NPC_TALENT_BOW)> 29)
					{
						NPC_SETTALENTSKILL(SLF,NPC_TALENT_BOW,1);
					}
					ELSE IF(NPC_GETTALENTSKILL(SLF,NPC_TALENT_BOW)< 2 && NPC_GETTALENTVALUE(SLF,NPC_TALENT_BOW)> 59)
					{
						NPC_SETTALENTSKILL(SLF,NPC_TALENT_BOW,2);
					};
				};
			};
		};
		////////////////////////////////////////////////////////////////////////////////
		//Expensive weapons
		///////////////////////////////////////////////////////////////////////////////
		IF(WLD_DETECTItem(SLF,Item_KAT_FF)|| WLD_DETECTItem(SLF,Item_KAT_NF))
		{
			IF(Item.VALUE < 10*WYBREDNOSC)
			{
				AI_GOTOItem(SLF,Item);
				AI_TAKEItem(SLF,Item);
				AI_EQUIPBESTRANGEDWEAPON(SLF);
				AI_EQUIPBESTMELEEWEAPON(SLF);
			};
		};
	};
};

FUNC VOID B_PERCGETWEAPON()
{
	B_GETWEAPON(SELF,10);
};

FUNC STRING B_SECONDSTOFULLTIME(VAR INT A)
{
	VAR INT HOUR;
	VAR INT MIN;
	VAR INT SEC;
	VAR INT OP;
	VAR INT OP2;
	VAR STRING STR1;
	VAR STRING STR2;
	VAR STRING STR3;
	OP=A%3600;
	OP=A-OP;
	HOUR=OP/3600;
	OP2=A-OP;
	OP=OP2%60;
	OP=OP2-OP;
	MIN=OP/60;
	SEC=OP2-OP;
	IF(HOUR !=0)
	{
		IF(HOUR==1)
		{
			STR1="Godzina ";
		}
		ELSE
		{
			STR1=CONCATSTRINGS(INTTOSTRING(HOUR)," Godzin(a)");
		};
	}
	ELSE
	{
		STR1="";
	};
	IF(MIN !=0)
	{
		IF(MIN==1)
		{
			STR2="Minuta ";
		}
		ELSE
		{
			STR2=CONCATSTRINGS(INTTOSTRING(MIN)," Minut(y)");
		};
	}
	ELSE
	{
		STR2="";
	};
	IF(SEC !=0)
	{
		IF(SEC==1)
		{
			STR3="Sekunda ";
		}
		ELSE
		{
			STR3=CONCATSTRINGS(INTTOSTRING(SEC)," Sekund(y)");
		};
	}
	ELSE
	{
		STR2="";
	};
	RETURN CONCATSTRINGS(STR1,CONCATSTRINGS(STR2,STR3));
};

//Added Bugfix no use Npc_ChangeAttribute!


FUNC VOID B_NPCDISABLEPERC(VAR C_NPC SLF)
{

	//Wahrnehmungen aktiv
	NPC_PERCENABLE(SLF,PERC_ASSESSENEMY,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSPLAYER,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSFIGHTER,B_NOREACT);

	//SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
	//Npc_PercEnable  	(self,	PERC_ASSESSItem			,	B_AssessItem 				);

	//* Wahrnehmungen passiv *
	NPC_PERCENABLE(SLF,PERC_ASSESSDAMAGE,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSMAGIC,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSCASTER,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSTHREAT,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_DRAWWEAPON,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSWARN,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSMURDER,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSDEFEAT,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSFIGHTSOUND,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSQUIETSOUND,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_CATCHTHIEF,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSTHEFT,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSSURPRISE,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_OBSERVESUSPECT,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_OBSERVEINTRUDER,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSTALK,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSCALL,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSUSEMOB,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_ASSESSENTERROOM,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_MOVEMOB,B_NOREACT);
	NPC_PERCENABLE(SLF,PERC_MOVENPC,B_NOREACT);

	NPC_SETPERCTIME(SLF,0);
};
FUNC VOID RTN_GLOBAL_InvISIBLE()
{
	TA_MIN(SELF,07,35,07,34,ZS_STAY,"InvISIBLE");
};
//------------------------------------------
//B_NpcRemoveFromWorld
//------------------------------------------
//Don't use on multi same id NPCs!
//------------------------------------------
FUNC VOID B_NPCREMOVEFROMWORLD(VAR C_NPC SLF)
{
	SLF.ATTRIBUTE[ATR_HITPOINTS]-=SLF.ATTRIBUTE[ATR_HITPOINTS_MAX];//kill
	//B_ClearInventory(slf);//remove Inv (MIS)- so npc can dispears
	//if(Npc_GetDistToPlayer(self)<4110)
	//{
	//Npc_ClearAIQueue(slf);
	//AI_Teleport(slf,"InvISIBLE");//Hided WP - add on every world
	//B_NpcDisablePerc(slf);//To be sure - disable any perceptions(attack near wp npcs etc.
	//
	//};
	NPC_EXCHANGEROUTINE(SLF,"DEAD");//ExchangeRoutine
	SLF.DAILY_ROUTINE=RTN_GLOBAL_InvISIBLE;//ExchangeRoutine

};
FUNC VOID B_NPCIDREMOVEFROMWORLD(VAR INT SLFID)
{
	VAR C_NPC NPC;NPC=HLP_GETNPC(SLFID);
	B_NPCREMOVEFROMWORLD(NPC);

};
FUNC INT B_GETMONSTERABOVE10LVL()
{
	VAR INT RND;RND=HLP_RANDOM(10);
	IF(RND==0){RETURN YOUNG_ALIGATOR;}
	ELSE IF(RND==1){RETURN BLOODFLY;}
	ELSE IF(RND==2){RETURN GREENGOBBOSWORD;}
	ELSE IF(RND==3){RETURN MOLERAT;}
	ELSE IF(RND==4){RETURN SCAVENGER;}
	ELSE IF(RND==5){RETURN WARAN;}
	ELSE IF(RND==6){RETURN WOLF;}
	ELSE IF(RND==7){RETURN WISP;}
	ELSE IF(RND==8){RETURN WOLF;}
	ELSE IF(RND==9){RETURN WARAN;};
};

/////////////////////
//------------TurnToGhost------------------------
//(Duch w Gothic 1)
//Pomys� i wykonanie funkcji Zysk & Orcwarrior.
//id = Instancja npc'ta
//visibility = widoczno�� ducha 0 = calkiem niewidoczny 19 = przeswitywanie prawie niezauwazalne
//
//Znane problemy:
//-U�ywaj�c funkcji w startupie powoduje �e cie� pod duchem nadal wyst�puje, aby cie� znik�
//funkcje najlepiej doda� w timetriggerze, tak aby uruchamia�a co kilka chwil.
//Pazdziernik 10, 2009 The Modders
//
//Funkcja bez problem�w dziala na kazdym C_NPC, przeznaczona do dowolnego u�ytku w modyfikacjach
//mi�o by jednak by�o wspomnie� gdzie� o jej autorach
//-----------------------------------------------
FUNC VOID TURNTOGHOST(VAR INT ID,VAR INT VISIBILITY)
{
	VAR ZCVOB VOB;VOB=HLP_GETNPC(ID);

	VOB.VOB_BITFIELD[0]=VOB.VOB_BITFIELD[0] & ~ZCVOB_BITFIELD0_CASTDYNSHADOW;
	VOB.VOB_BITFIELD[0]=VOB.VOB_BITFIELD[0] & ~ZCVOB_BITFIELD0_COLLDETECTIONDYNAMIC;
	VOB.VOB_BITFIELD[0]=VOB.VOB_BITFIELD[0] |(1<<2);
	//Bugfix, no longer needed, it comes with knowledge ;)

	VOB.VISUALALPHA=fracf(VISIBILITY*5,100);
};

func int B_HasReadiedRangedWeaponWithAmmo(var c_npc slf)
{//4 ammunition check use
	if(!Npc_HasReadiedRangedWeapon(slf))
	{	return 0; };
	var int ammu_id; var c_Item rw;
	rw = Npc_GetReadiedWeapon(hero);
	ammu_id = rw.munition;
	return Npc_HasItems(slf,ammu_id); 
};

var int AfterDialogFight_slf;
var int AfterDialogFight_oth;
var int AfterDialogFight_Kill;

func void B_StartAfterDialogFight(var c_npc slf, var c_npc oth,var int Kill)
{
	AfterDialogFight_slf  = Hlp_GetInstanceID(slf);
	AfterDialogFight_oth  = Hlp_GetInstanceID(oth);
	AfterDialogFight_Kill = KILL;
	//Rest will be done in Do_AfterDialogEvents;		
};

func void B_DoDialogFight()
{
	var c_npc slf;
	var c_npc oth;
	slf = Hlp_GetNpc(AfterDialogFight_slf);
	oth = Hlp_GetNpc(AfterDialogFight_oth);
	
	Npc_SetTarget(slf,oth); 
	AI_StartState(slf,ZS_ATTACK,1,"");

	if(AfterDialogFight_Kill)
	{
		B_SetAttackReason(slf,AIV_AR_NONE);
		Npc_SetPermAttitude	(slf, ATT_HOSTILE);	
	}
	else
	{
		B_SetAttackReason(slf,AIV_AR_PERSONALAFFAIRS);
		Npc_SendPassivePerc	(slf, PERC_ASSESSFIGHTSOUND,	oth, slf);
	};

	//reset defeats aivars;
	Npc_SetAivar(slf,AIV_WASDEFEATEDBYSC,	 false);
	Npc_SetAivar(slf,AIV_HASDEFEATEDSC, 	 false);
	Npc_SetAivar(oth,AIV_WASDEFEATEDBYSC, 	 false);
	Npc_SetAivar(oth,AIV_HASDEFEATEDSC, 	 false);
	
	AfterDialogFight_slf  = 0;
	AfterDialogFight_oth  = 0;
	AfterDialogFight_Kill = 0;	
};

//return number of hitpoints that can be restored
func int Npc_HasHPPotions(var c_npc slf)
{
	return 	Npc_HasItems(slf,ItFo_Potion_Health_01)*hp_Essenz  +
	Npc_HasItems(slf,ItFo_Potion_Health_02)*hp_Extrakt +
	Npc_HasItems(slf,ItFo_Potion_Health_03)*hp_Elixier +
	Npc_HasItems(slf,ItFo_Potion_Health_04)*slf.attribute[ATR_HITPOINTS_MAX];
	
};
//return number of mana points that can be restored
func int Npc_HasManaPotions(var c_npc slf)
{
	return 	Npc_HasItems(slf,ItFo_Potion_Mana_01)*Mana_Essenz  +
	Npc_HasItems(slf,ItFo_Potion_Mana_02)*Mana_Extrakt +
	Npc_HasItems(slf,ItFo_Potion_Mana_03)*Mana_Elixier +
	Npc_HasItems(slf,ItFo_Potion_Mana_04)*slf.attribute[ATR_MANA_MAX];
	
};

// Remove mob items when npc was taken down
func void B_RemoveMobItems(var c_npc slf)
{
	var int iAmount;
	
	iAmount = Npc_HasItems(slf,ItMiSwordraw);
	if(iAmount)
	{
		Npc_RemoveInvItems(slf,ItMiSwordraw,iAmount);		
	};	
	
	iAmount = Npc_HasItems(slf,ItMiSwordrawhot);
	if(iAmount)
	{
		Npc_RemoveInvItems(slf,ItMiSwordrawhot,iAmount);		
	};
	
	iAmount = Npc_HasItems(slf,ItMiSwordbladehot);
	if(iAmount)
	{
		Npc_RemoveInvItems(slf,ItMiSwordbladehot,iAmount);	
	};
	
	iAmount = Npc_HasItems(slf,ItMiSwordblade);
	if(iAmount)
	{
		Npc_RemoveInvItems(slf,ItMiSwordblade,iAmount);	
	};
};