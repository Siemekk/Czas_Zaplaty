// **************************************
//					EXIT 
// **************************************

instance  DIA_Skip_Exit (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  999;
	condition	=  DIA_Skip_Exit_Condition;
	information	=  DIA_Skip_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Skip_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Skip_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************
//				First
// **************************************

instance  DIA_Skip_First (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_First_Condition;
	information	=  DIA_Skip_First_Info;
	permanent	=  0;
	description = "Czym si� zajmujesz?";
};                       

FUNC int  DIA_Skip_First_Condition()
{
	return 1;
};

FUNC VOID  DIA_Skip_First_Info()
{
	AI_Output (other, self,"DIA_Skip_First_15_00"); //Czym si� zajmujesz?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //Dbam o bro� stra�nik�w.
	AI_Output (other, self,"DIA_Skip_First_15_02"); //Sprzedajesz or�?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //Te�, ale tylko Gomezowi i jego ludziom.

	Log_CreateTopic(GE_TraderOC, LOG_NOTE);
	B_LogEntry(GE_TraderOC,	"Skip, stra�nik z tylnego dziedzi�ca, sprzedaje or�, ale tylko ludziom Gomeza.");

	Info_ClearChoices(DIA_Skip_First);
	Info_Addchoice(DIA_Skip_First,"Rozumiem. Do zobaczenia.",DIA_Skip_First_BACK);
	Info_Addchoice(DIA_Skip_First,"Przysy�a mnie Gomez. Podobno masz dla mnie jakie� wyposa�enie.",DIA_Skip_First_Gomez);
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Przysy�a mnie Gomez. Podobno masz dla mnie jakie� wyposa�enie.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //To co zwykle, tak? Nowy pancerz i najlepsza bro�, jak� mam na sk�adzie?
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_02"); //Dok�adnie.	
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_03"); //Wyno� si�, albo zawo�am stra�nik�w!
	Info_ClearChoices(DIA_Skip_First);
	B_StopProcessInfos(self);
};

func void DIA_Skip_First_BACK()
{
	AI_Output (other, self,"DIA_Skip_First_BACK_15_00"); //Rozumiem. Do zobaczenia.
	Info_ClearChoices(DIA_Skip_First);
	B_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
							Waffenhandel								
------------------------------------------------------------------------*/

instance GRD_211_Skip_TRADE (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_TRADE_Condition;
	information		= GRD_211_Skip_TRADE_Info;
	permanent		= 1;
	description		= "Przyda�oby mi si� kilka drobiazg�w."; 
	trade 			= 1;
};

FUNC int GRD_211_Skip_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Skip_First))
	{
		return TRUE;
	};
};

FUNC void  GRD_211_Skip_TRADE_Info()
{
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Przyda�oby mi si� kilka drobiazg�w.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Mam co nieco na sprzeda�, sam zobacz.
};  

// **************************************

instance  DIA_Skip_Warehouse (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  3;
	condition	=  DIA_Skip_Warehouse_Condition;
	information	=  DIA_Skip_Warehouse_Info;
	permanent	=  0;
	description = "Co trzymacie w magazynie?";
};                       

FUNC int  DIA_Skip_Warehouse_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Skip_First)) && (Npc_KnowsInfo(hero, Info_Diego_Prison1))
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Skip_Warehouse_Info()
{
	AI_Output (other, self,"DIA_Skip_Warehouse_15_00"); //Co trzymacie w magazynie?
	AI_Output (self, other,"DIA_Skip_Warehouse_12_01"); //A co Ci� to obchodzi?
	AI_Output (other, self,"DIA_Skip_Warehouse_15_02"); //Tak tylko pytam, z ciekawo�ci.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_03"); //A co mo�na trzyma� w magazynie zamkni�tym na klucz?
	AI_Output (other, self,"DIA_Skip_Warehouse_15_04"); //Kobitki?
	AI_Output (self, other,"DIA_Skip_Warehouse_12_05"); //He, he. Dobre.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_06"); //W sumie by�e� blisko. Co� ci zdradz�...
	AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"DIA_Skip_Warehouse_12_07"); //Jest tam ukrytych kilka '�licznotek'. Ale to stalowe dziewice, he, he.
	AI_Output (other, self,"DIA_Skip_Warehouse_15_08"); //Kto� lubi ostr� zabaw�...
	AI_Output (self, other,"DIA_Skip_Warehouse_12_09"); //To miecze, idioto! Wyku� je Stone specjalnie dla osobistych stra�nik�w Gomeza.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_10"); //Oczywi�cie Blizna i Arto wol� sw�j z�om, ale reszcie to odpowiada�o.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_11"); //Stone wytopi� na te ostrza tyle rudy, �e �wiec� w nocy jak psu jajca.
	AI_Output (other, self,"DIA_Skip_Warehouse_15_12"); //To dlaczego stra�nicy nie nosz� ich przy sobie?
	AI_Output (self, other,"DIA_Skip_Warehouse_12_13"); //Bo to cholerne ochleje.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_14"); //Jeden z tych idiot�w zastawi� miecz za w�d�. Kiedy Gomez si� o tym dowiedzia�, rozkaza� zabra� pozosta�e miecze i zamkn�� je w magazynie.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_15"); //Dostan� je, kiedy rzeczywi�cie zrobi si� gor�co.
	AI_Output (other, self,"DIA_Skip_Warehouse_15_16"); //To ile ich jest?
	AI_Output (self, other,"DIA_Skip_Warehouse_12_17"); //By�o pi��. Jeden gdzie� przepad�, zosta�y cztery. Taplaj� si� w oleju i czekaj� na lepsze czasy.
	AI_Output (other, self,"DIA_Skip_Warehouse_15_18"); //A kto ma klucz do magazynu?
	AI_Output (self, other,"DIA_Skip_Warehouse_12_19"); //Zaczynasz zadawa� niebezpieczne pytania, ch�opcze. Po co Ci to wiedza?
	AI_Output (other, self,"DIA_Skip_Warehouse_15_20"); //Te miecze... Chcia�bym je zobaczy�.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_21"); //Nie ma tak dobrze. Gomez urwa�by mi jaja, gdybym oprowadza� po magazynie ka�dego ch�tnego.
	AI_Output (other, self,"DIA_Skip_Warehouse_15_22"); //Przecie� nie musisz i�� ze mn�. Wystarczy, �e dasz mi klucz...
	AI_Output (self, other,"DIA_Skip_Warehouse_12_23"); //A Ty 'po�yczysz' sobie kilka �wiecide�ek i dasz nog�. Nie jestem idiot�!
	AI_Output (other, self,"DIA_Skip_Warehouse_15_24"); //Chc� tylko zobaczy� miecze...
	AI_Output (self, other,"DIA_Skip_Warehouse_12_25"); //Nic z tego. Spadaj.
	B_LogEntry(CH6_RBL_Thievery, "Sz�o mi ca�kiem dobrze, dop�ki nie zapyta�em o klucz. Skip nosi go ca�y czas przy sobie. Dowiedzia�em si� te�, �e w magazynie s� tylko 4 ostrza, jedno gdzie� zagin�o. Musz� jako� zw�dzi� ten klucz Skipowi...");

	/************************
Ork zmie� mu rutyn�, �eby gdzie� mi�dzy 22 a 02 sta� ko�o tych pak i chla�. Paki s� pomi�dzy siedzib� mag�w a zamkiem, pod murem.

*************************/

	Wld_InsertItem			(ITKEY_OB_SMITH_01, "OCC_CORNER_1");

	//Npc_ExchangeRoutine	(self, "Drink");
};

// **************************************

instance  DIA_Skip_Swords (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  4;
	condition	=  DIA_Skip_Swords_Condition;
	information	=  DIA_Skip_Swords_Info;
	permanent	=  0;
	description = "Chyba co� ci wypad�o.";
};                       

FUNC int  DIA_Skip_Swords_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Skip_Warehouse))&&(NPC_HasItems(other,ITKEY_OB_SMITH_01)>=1)&&(NPC_HasItems(other,ItMw_1H_Sword_Bastard_05)>=3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Skip_Swords_Info()
{
	AI_Output (other, self,"DIA_Skip_Swords_15_00"); //Chyba co� ci wypad�o.
	AI_Output (self, other,"DIA_Skip_Swords_12_01"); //O czym m�wisz?
	AI_Output (other, self,"DIA_Skip_Swords_15_02"); //Poznajesz ten klucz?
	AI_TurnToNpc 	(self,other);
	Ai_Wait (self,0.3);	
	AI_Output (self, other,"DIA_Skip_Swords_12_03"); //Sk�d go masz... To by�e� Ty!
	AI_Output (other, self,"DIA_Skip_Swords_15_04"); //Powiedzmy, �e znalaz�em przy pakach z ry��wk�, kt�r� tak zawzi�cie popijasz.
	AI_Output (other, self,"DIA_Skip_Swords_15_05"); //Ciekawe co by powiedzia� Gomez, gdyby si� dowiedzia�, �e zgubi�e� klucz po pijaku?
	AI_Output (self, other,"DIA_Skip_Swords_12_06"); //Niech Ci� szlag! Czego chcesz?
	AI_Output (other, self,"DIA_Skip_Swords_15_07"); //Powiedz mi gdzie jest czwarte ostrze?
	AI_Output (self, other,"DIA_Skip_Swords_12_08"); //Po co Ci te miecze?
	AI_Output (other, self,"DIA_Skip_Swords_15_09"); //Powiedzmy, �e lubi� b�yskotki. M�w!
	AI_Output (self, other,"DIA_Skip_Swords_12_10"); //Cholera, Arto urwie mi za to �eb...
	AI_Output (other, self,"DIA_Skip_Swords_15_11"); //Wolisz, �eby dowiedzia� si� o tym Gomez?
	AI_Output (self, other,"DIA_Skip_Swords_12_12"); //Zaczekaj. Ale dostan� klucz?
	AI_Output (other, self,"DIA_Skip_Swords_15_13"); //Oczywi�cie, s�owo 'stra�nika'.
	AI_Output (self, other,"DIA_Skip_Swords_12_14"); //Arto to zboczeniec. �pi z mieczem pod poduszk�...
	AI_Output (self, other,"DIA_Skip_Swords_12_15"); //Nie wiem dlaczego, ale strasznie spodoba�y mu si� te ostrza.
	AI_Output (self, other,"DIA_Skip_Swords_12_16"); //Nie chcia� m�wi� o tym otwarcie. Zap�aci� mi za jeden miecz. 
	AI_Output (self, other,"DIA_Skip_Swords_12_17"); //Je�eli mu o tym powiesz, to ju� po mnie...
	AI_Output (other, self,"DIA_Skip_Swords_15_18"); //Spokojnie, to nie jego sprawa. Gdzie trzyma or�?
	AI_Output (self, other,"DIA_Skip_Swords_12_19"); //Tego nie wiem, ale pewnie w skrzyni gdzie� w sto�pie.
	AI_Output (other, self,"DIA_Skip_Swords_15_20"); //Dobra, to mi wystarczy. Bywaj.
	AI_Output (self, other,"DIA_Skip_Swords_12_21"); //Zaczekaj! A klucz?
	AI_Output (other, self,"DIA_Skip_Swords_15_22"); //Jaki klucz?
	AI_Output (self, other,"DIA_Skip_Swords_12_23"); //Ty skurw...
	AI_Output (other, self,"DIA_Skip_Swords_15_24"); //Dobra, we� go. I uwa�aj, bo nast�pnym razem mo�esz si� upi�... na �mier�.
	
   B_GiveInvItems (other, self, ITKEY_OB_SMITH_01, 1);
	B_LogEntry(CH6_RBL_Thievery, "Skip sprzeda� miecz Arto. Ten schowa� go gdzie� w zamku. Musz� poszuka� miecza i zanie�� wszystkie Diego. Mam ju� do�� Starego Obozu...");
};
