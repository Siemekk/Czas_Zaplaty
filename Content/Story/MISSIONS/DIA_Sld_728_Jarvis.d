// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Uwa�aj na siebie!
	B_StopProcessInfos	(self);
};

// ************************************************************
// 						Hello
// ************************************************************

INSTANCE DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= 0;
	important 	= 1;
	description		= "."; 
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Hello_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc 	(self, other);
	
   AI_Output (self, other,"DIA_Jarvis_Hello_08_00"); //Hej, Ty!
	AI_Output (other, self,"DIA_Jarvis_Hello_15_01"); //Czego chcesz?
	AI_Output (self, other,"DIA_Jarvis_Hello_08_02"); //Zbli� si�...
	AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Jarvis_Hello_08_03"); //Cholera pomyli�em Ci� z kim� innym.
	AI_Output (other, self,"DIA_Jarvis_Hello_15_04"); //I co z tym zrobimy?
	AI_Output (self, other,"DIA_Jarvis_Hello_08_05"); //Niech to szlag, my�la�em, �e jeste� skaza�cem, kt�ry tyle namiesza� w Kolonii.
	AI_Output (self, other,"DIA_Jarvis_Hello_08_06"); //To dziwne, ale w sumie nikt nie wie, jak on si� nazywa...
	AI_Output (other, self,"DIA_Jarvis_Hello_15_07"); //Rzeczywi�cie to fascynuj�ce, ale nie mam czasu na takie pierdo�y.
	AI_Output (self, other,"DIA_Jarvis_Hello_08_08"); //Wybacz jestem troch� nerwowy, odk�d stra�nicy wbili nam n� w plecy.
	AI_Output (other, self,"DIA_Jarvis_Hello_15_09"); //O czym Ty m�wisz?
	AI_Output (self, other,"DIA_Jarvis_Hello_08_10"); //O tych skurwielach w czerwonych zbrojach, kt�rzy zaj�li Nowy Ob�z.
	AI_Output (self, other,"DIA_Jarvis_Hello_08_11"); //By�em najemnikiem na us�ugach mag�w wody. Walczyli�my do ko�ca... Ale to stare dzieje.
	AI_Output (self, other,"DIA_Jarvis_Hello_08_12"); //Pos�uchaj, potrzebuj� czyjej� pomocy. Tylko Ty mnie tu znalaz�e�, wi�c nie mam wyboru.
	AI_Output (other, self,"DIA_Jarvis_Hello_15_13"); //A dlaczego mia�bym Ci pom�c? Troch� si� spiesz�...
	AI_Output (self, other,"DIA_Jarvis_Hello_08_14"); //Zaczekaj! Nie po�a�ujesz. Dostaniesz tyle rudy, ile zdo�asz ud�wign��, je�eli zaniesiesz komu� moj� wiadomo��.
};

// ************************************************************

INSTANCE DIA_Jarvis_Help (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Help_Condition;
	information	= DIA_Jarvis_Help_Info;
	permanent	= 0;
	important 	= 0;
	description		= "Dobra, m�w o co chodzi."; 
};                       

FUNC INT DIA_Jarvis_Help_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Help_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Help_15_01"); //Dobra, m�w o co chodzi.
	AI_Output (self, other,"DIA_Jarvis_Help_08_02"); //Ruda zn�ci ka�dego, he, he.
	AI_Output (self, other,"DIA_Jarvis_Help_08_03"); //Zadanie jest proste.
	AI_Output (self, other,"DIA_Jarvis_Help_08_04"); //Musisz odnale�� Corda. Powiesz mu tylko, �e znalaz�em zgub� i czekam na reszt�.
	AI_Output (self, other,"DIA_Jarvis_Help_08_05"); //Zapami�tasz?
	AI_Output (other, self,"DIA_Jarvis_Help_08_06"); //Czy ja wygl�dam na idiot�?
	AI_Output (self, other,"DIA_Jarvis_Help_08_07"); //Ekhm, no c�...
	
   AI_DrawWeapon (hero);
	
   AI_Output (self, other,"DIA_Jarvis_Help_08_08"); //Pewnie, �e nie!
	
   AI_RemoveWeapon (hero);
	
   AI_Output (other, self,"DIA_Jarvis_Help_15_09"); //Gdzie znajd� tego Corda?
	AI_Output (self, other,"DIA_Jarvis_Help_08_10"); //To jest w�a�nie najtrudniejsza cz�� zadania. Nie wiem dok�adnie, gdzie si� zaszy�.
	AI_Output (self, other,"DIA_Jarvis_Help_08_11"); //Ostatni raz spotka�em go w okolicach obozu sekciarzy na bagnach. By� mo�e zaszyli si� w ruinach cytadeli.
	AI_Output (self, other,"DIA_Jarvis_Help_08_12"); //Tam poszukaj. Zapami�taj...
	AI_Output (other, self,"DIA_Jarvis_Help_15_13"); //Tak, wiem 'Znalaz�e� zgub� i czekasz na reszt�'.
	AI_Output (self, other,"DIA_Jarvis_Help_08_14"); //Powodzenia i postaraj si� nie zwleka� zbyt d�ugo.
	
   Log_CreateTopic	(CH3_NON_Mercenary, LOG_MISSION);
	Log_SetTopicStatus	(CH3_NON_Mercenary, LOG_RUNNING);
	B_LogEntry		(CH3_NON_Mercenary, "Spotka�em najemnika imieniem Jarvis. Prosi� mnie abym odnalaz� innego najemnika imieniem Cord i przekaza� mu te s�owa, �e 'Znalaz� zgub� i czeka na reszt�'. Troch� dziwna ta sytuacja, ale co mi szkodzi, tym bardziej, �e zap�at� ma by� ruda. Cord m�g� zaszy� si� w jakiej� cytadeli niedaleko obozu sekciarzy na bagnach.");
	B_StopProcessInfos	(self);	

	/************************
	Zmiana rutyny, �eby Dick troszk� si� pom�czy� jak znowu b�dzie go szuka�. Najlepiej niech to b�dzie jakie� skryte miejsce bo Jarvis b�dzie ranny, tam si� w�asnie ukrywa
	************************/
	Npc_ExchangeRoutine(self,"HIDE");
};

//ukrywa si�, hrabia go znalaz� i zabra� 'zgub�', szuka wzorc�w... [kawa�ki ornamentu]
// ************************************************************

INSTANCE DIA_Jarvis_Help2 (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Help2_Condition;
	information	= DIA_Jarvis_Help2_Info;
	permanent	= 0;
	important 	= 0;
	description		= "Tu si� schowa�e�!"; 
};                       

FUNC INT DIA_Jarvis_Help2_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_Cord))&&(lee_offer_condition == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Help2_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Help2_15_01"); //Tu si� schowa�e�!
	AI_Output (self, other,"DIA_Jarvis_Help2_08_02"); //Cholera to Ty! Chyba znowu pojawi�e� si� we w�a�ciwym czasie.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_03"); //Najpierw pogadamy o rudzie, kt�r� mi jeste� winien.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_04"); //A sk�d mam wiedzie�, �e dostarczy�e� wiadomo�� Cordowi?
	AI_Output (other, self,"DIA_Jarvis_Help2_15_05"); //St�d, �e Lee kaza� mi co� przekaza�. Dowiesz si� co to za wiadomo�� kiedy dostan�... 1000 bry�ek.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_06"); //Nie mam tyle! 
	AI_Output (other, self,"DIA_Jarvis_Help2_15_07"); //No to masz problem, na razie...
	AI_Output (self, other,"DIA_Jarvis_Help2_08_08"); //Zaczekaj! Nie mam rudy, ale mam co� r�wnie cennego.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_09"); //M�w.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_10"); //Wiem gdzie mo�esz znale�� kosztowno�ci, kt�re s� zaledwie wierzcho�kiem g�ry bogactw.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_11"); //Nie jestem idiot�, nie nabierzesz mnie na te bajki ze skarbami.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_12"); //M�wi� prawd�! Zreszt� poczekam tu na Ciebie. 
	AI_Output (other, self,"DIA_Jarvis_Help2_15_13"); //A dlaczego mia�bym Ci zaufa�? Teraz te� si� przed czym� ukrywasz.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_14"); //Sk�d taki pomys�... Ja tylko wola�em nie rzuca� si� w oczy. Kolonia sta�a si� ostatnio bardzo niebezpiecznym miejscem.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_15"); //Powiedzmy, �e ci wierz�. To gdzie mam szuka� tych 'skarb�w'?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_16"); //We� t� map�. Jest zniszczona, ale to �wiadczy o jej autentyczno�ci.
	
	/************************
	Ork mapa by si� przyda�a jaka� zniszczona. W sumie trzeba b�dzie zrobi� kilka takich map.
	**********************/

	CreateInvItems (self,JarvisMap,1);
	B_GiveInvItems (self, other, JarvisMap, 1);
	
	AI_Output (self, other,"DIA_Jarvis_Help2_08_17"); //Zaznaczono tam miejsce ukrycia skarbu.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_18"); //Niech b�dzie. Ale je�eli mnie oszuka�e�, to znajd� Ci� nawet w ty�ku Beliara.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_19"); //Bez obaw, nie jestem idiot�. Teraz Twoja kolej. Co Lee chcia� mi przekaza�?
	AI_Output (other, self,"DIA_Jarvis_Help2_15_20"); //Lee powiedzia�, �e potrzebuj� jeszcze jednego 'wzorca'. Podobno wiesz o co chodzi.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_21"); //Hmm... Tak, wiem. Dobra p�d� po te skarby i powiedz mi co tam znalaz�e�.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_22"); //Aha, gdyby� odnalaz� tam kawa�ek ornamentu, to znam kogo� kto hojnie za to zap�aci.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_23"); //Co� mi si� wydaje, �e od pocz�tku chodzi�o o ten ornament. Sam sobie szukaj tego kamola.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_24"); //Zaczekaj! Lee mnie zabije jak powiem Ci co� wi�cej...
	AI_Output (other, self,"DIA_Jarvis_Help2_15_25"); //Albo b�dziesz ze mn� szczery, albo wracam tam sk�d przyszed�em.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_26"); //Dobra. Powiem Ci tyle ile sam wiem.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_27"); //Od kilku dni szukamy dla Mag�w Wody fragment�w ornamentu. Jeden kawa�ek zagin�� niedawno razem z najemnikiem, kt�ry mia� go przy sobie.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_28"); //Wczoraj znalaz�em tego pechowca. By� paskudnie poharatany i oczywi�cie martwy. Ornamentu przy nim nie by�o.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_29"); //To by�a ta zguba, o kt�rej mia�em powiedzie� Cordowi?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_30"); //Ta sama.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_31"); //M�w dalej.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_32"); //Nied�ugo po tym kiedy odszed�e� ruszy�em po kolejn� cz��. Mapa od mag�w wskazuje miejsca ukrycia niekt�rych cz�ci ornamentu.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_33"); //Magowie przygotowali kilka map, ka�da wskazuje miejsce ukrycia innego fragmentu.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_34"); //Po co ta ostro�no��?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_35"); //Magowie obawiaj� si�, �e kto� m�g�by ukra�� map� i odnale�� ornamenty. Dlatego orygina� ma przy sobie Saturas.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_36"); //Jeden z nas wyruszy� z pierwsz� map�. Znalaz� ornament. Saturas w jaki� spos�b to wyczu�, a tak�e to, �e grozi mu �miertelne niebezpiecze�stwo.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_37"); //Lee wys�a� mnie po kamie�, ale znalaz�em tylko zimnego trupa. Potem napatoczy�e� si� Ty. 
	AI_Output (self, other,"DIA_Jarvis_Help2_08_38"); //Ruszy�em po kolejny fragment ze swoj� map� i... prawie przep�aci�em to �yciem.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_39"); //Co si� sta�o?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_40"); //Nie tylko magowie szukaj� ornament�w. Zaatakowali mnie stra�nicy, w ka�dym razie nosili zbroje stra�nik�w Gomeza.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_41"); //Ledwie uszed�em z �yciem. Pozna�em tylko jednego z nich - nazywaj� go Hrabi�. Zdaje si�, �e to on przewodzi� poszukiwaniom.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_42"); //Ciekawa historyjka. Dlaczego nie powiedzia�e� o tym Lee i magom?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_43"); //Ukry�em si� i chcia�em przeczeka� a� zrobi si� bezpieczniej, a wtedy pojawi�e� si� Ty.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_44"); //Czyli chcia�e� mnie wys�a� do miejsca gdzie pewnie czeka�by na mnie ten Hrabia?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_45"); //Ekhm... No wiesz, gdyby� wr�ci� to by oznacza�o, �e ju� ich tam nie ma, albo �e jeste� wi�kszym sukinsynem ni� oni.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_46"); //Wiem jak to wygl�da, ale wola�em nie ryzykowa�...
	AI_Output (self, other,"DIA_Jarvis_Help2_08_47"); //Pos�uchaj! Nadal istnieje szansa na odnalezienie ukrytego fragmentu ornamentu. Mapa wskazuje na jaskini�, ale za choler� nie znalaz�em tam wzorca...
	AI_Output (self, other,"DIA_Jarvis_Help2_08_48"); //Mo�e oni te� jej nie odnale�li...
	AI_Output (other, self,"DIA_Jarvis_Help2_15_49"); //Rozbrajasz mnie. Najpierw mnie wykorzystujesz, p�niej nie chcesz mi zap�aci�, k�amiesz, a w ko�cu wysy�asz mnie na pewn� �mier�. Masz tupet!
	AI_Output (other, self,"DIA_Jarvis_Help2_15_50"); //Sam nie wiem dlaczego jeszcze Ci� nie zabi�em.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_51"); //Postaw si� na moim miejscu. Pewnie post�pi�by� podobnie. Nie mia�em wyboru... Magom zale�y na czasie, a Lee ma wzgl�dem nich d�ug do sp�acenia.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_52"); //To dlatego im pomagamy. Im szybciej znajdziemy ornamenty tym szybciej zajmiemy si� w�asnymi sprawami.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_53"); //Za��my, �e co� znajd�, co wtedy?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_54"); //Przynie� to do mnie. W tym czasie dowiem si� czego� wi�cej o stra�nikach, kt�rzy te� szukaj� ornament�w.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_55"); //Dobra, zobaczymy co z tego wyniknie.
	B_LogEntry		(CH3_NON_Mercenary, "Odnalaz�em Jarvisa. D�ugo gaw�dzili�my i sporo si� dowiedzia�em. Najemnicy pomagaj� Magom Wody w odnalezieniu jaki� ornament�w. Miejsce ukrycia ka�dego kawa�ka wskazuje jedna mapa. Ale nie tylko magowie szukaj� ornametn�w. Hrabia tak�e macza w tym palce i zdoby� ju� jeden kawa�ek kamienia. Dosta�em od Jarvisa map� z zaznaczonym miejscem ukrycia kolejnej cz�ci ornamentu. Musz� uwa�a� bo mog� tam spotka� stra�nik�w a nawet samego Hrabiego.");

	Log_CreateTopic	(CH3_NON_Ornament, LOG_MISSION);
	Log_SetTopicStatus	(CH3_NON_Ornament, LOG_RUNNING);
	B_LogEntry		(CH3_NON_Ornament, "Jarvis powiedzia� mi, �e Magowie Wody szukaj� jaki� ornametn�w. Musz� dowiedzie� si� czego� wi�cej.");
	Wld_InsertItem			(orn2, "GOBBO_MASTERCAVE8");

};

// ************************************************************

INSTANCE DIA_Jarvis_Help21 (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Help21_Condition;
	information	= DIA_Jarvis_Help21_Info;
	permanent	= 0;
	important 	= 1;
	description		= ""; 
};                       

FUNC INT DIA_Jarvis_Help21_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_Help2))&&(NPC_HasItems(hero,orn2)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Help21_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_Help21_08_00"); //Czuj�, �e masz fragment!
	AI_Output (other, self,"DIA_Jarvis_Help21_15_01"); //Nie by�o �atwo, to ci� b�dzie kosztowa� kolejny 1000 bry�ek...
	AI_Output (self, other,"DIA_Jarvis_Help21_08_02"); //S�ysza�e� ten ha�as przed jaskini�? Czuj�, �e nadchodz� k�opoty!

	B_StopProcessInfos	(self);	

	//OW_PATH_225 Hrabia
	var C_NPC hrabia; hrabia = Hlp_GetNpc(GRD_4010_Hrabia);
	AI_Teleport(hrabia, "OW_PATH_225");
	Npc_ExchangeRoutine(hrabia,"TRAP1");
	
	Wld_InsertNpc (Grd_2513_Kasacz,"OW_PATH_224"); //OW_PATH_224
	Wld_InsertNpc (GRD_2514_Guard,"OW_PATH_223"); //OW_PATH_223
	Wld_InsertNpc (GRD_2515_Guard,"OW_PATH_222"); //OW_PATH_222
	Wld_InsertNpc (GRD_2516_Guard,"OW_PSIWOOD_MOVEMENT8"); //OW_PSIWOOD_MOVEMENT8
	Wld_InsertNpc (GRD_2517_Guard,"OW_PSIWOOD_MOVEMENT7"); //OW_PSIWOOD_MOVEMENT7
	Wld_InsertNpc (GRD_2518_Guard,"OW_PATH_222"); //OW_PATH_222
};

var int jar_guide;

// ************************************************************

INSTANCE DIA_Jarvis_AfterTrap (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_AfterTrap_Condition;
	information	= DIA_Jarvis_AfterTrap_Info;
	permanent	= 0;
	important 	= 1;
	description		= "..."; 
};                       

FUNC INT DIA_Jarvis_AfterTrap_Condition()
{
	var C_NPC kasacz; kasacz = Hlp_GetNpc(Grd_2513_Kasacz);

	if (Npc_KnowsInfo(hero,DIA_Hrabia_TrapEnd))&&(Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_IsDead(kasacz))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_AfterTrap_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc 	(self, other);
		
   AI_Output (self, other,"DIA_Jarvis_AfterTrap_08_00"); //Jednak zd��y�em!
   AI_GotoNpc(self, other);
	AI_Output (other, self,"DIA_Jarvis_AfterTrap_15_01"); //Uciek� skurwiel!
	AI_Output (self, other,"DIA_Jarvis_AfterTrap_08_02"); //Jeszcze go dopadniemy. Musimy powiedzie� Lee co si� tutaj sta�o.
	AI_Output (other, self,"DIA_Jarvis_AfterTrap_15_03"); //Ten Hrabia to cwany typ. Wydaje si�, �e doskonale wie co robi i ca�y czas jest o krok przed nami.
	AI_Output (self, other,"DIA_Jarvis_AfterTrap_08_04"); //Tak, ten cz�owiek mnie przera�a. Nawet Lee si� go obawia.
	AI_Output (self, other,"DIA_Jarvis_AfterTrap_08_05"); //Idziemy?
};

//************************************************************

INSTANCE DIA_Jarvis_AfterTrap1 (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_AfterTrap1_Condition;
	information	= DIA_Jarvis_AfterTrap1_Info;
	permanent	= 0;
	important 	= 0;
	description		= "Czas w drog�."; 
};                       

FUNC INT DIA_Jarvis_AfterTrap1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_AfterTrap))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_AfterTrap1_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_AfterTrap1_15_06"); //Mo�emy rusza�.
	AI_Output (self, other,"DIA_Jarvis_AfterTrap1_08_07"); //Jeste� pewien?

	Info_ClearChoices (DIA_Jarvis_AfterTrap1);
	Info_AddChoice (DIA_Jarvis_AfterTrap1, "Prowad�.", DIA_Jarvis_AfterTrap1_Yes);
	Info_AddChoice (DIA_Jarvis_AfterTrap1, "Sam tam trafi�.", DIA_Jarvis_AfterTrap1_Alone);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Jarvis_AfterTrap1_Yes()
{
	Npc_ExchangeRoutine(self,"JOIN");

	Party_AddNpc(self);
	AI_Output (other, self,"DIA_Jarvis_AfterTrap1_Yes_15_01"); //Prowad�.
	AI_Output (self, other,"DIA_Jarvis_AfterTrap1_Yes_08_02"); //Trzymaj si� blisko, to b�dzie d�uga droga.

	B_LogEntry		(CH3_NON_Mercenary, "Za�atwi�em K�sacza, ale Hrabia uciek�. Czas porozmawia� z Lee.");
	B_LogEntry		(CH3_NON_Ornament, "Czas porozmawia� z Magami Wody i dowiedzie� si� czego� wi�cej o tych ornamentach.");
	B_StopProcessInfos	(self);
};

// ---------------------------Alone----------------------------------------

FUNC VOID DIA_Jarvis_AfterTrap1_Alone()
{
   Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"GUARD");
	AI_Output (other, self,"DIA_Jarvis_AfterTrap_Alone1_15_01"); //Sam tam trafi�.
	AI_Output (self, other,"DIA_Jarvis_AfterTrap_Alone1_08_02"); //Jak chcesz. Zobaczymy si� na miejscu.

	B_LogEntry		(CH3_NON_Mercenary, "Za�atwi�em K�sacza, ale Hrabia uciek�. Czas porozmawia� z Lee.");
	B_LogEntry		(CH3_NON_Ornament, "Czas porozmawia� z Magami Wody i dowiedzie� si� czego� wi�cej o tych ornamentach.");
	B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE DIA_Jarvis_LeeCamp (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_LeeCamp_Condition;
	information	= DIA_Jarvis_LeeCamp_Info;
	permanent	= 0;
	important 	= 1;
	description		= "..."; 
};                       

FUNC INT DIA_Jarvis_LeeCamp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_AfterTrap1))&&(Npc_GetDistToWP (self, "LOCATION_19_03_PATH_RUIN6") < 1000 )
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_LeeCamp_Info()
{	
	if (Npc_GetAivar(self,AIV_PARTYMEMBER) == TRUE)
	{
		Party_RemoveNpc(self);
		Npc_ExchangeRoutine(self,"GUARD");
	};
   
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_TurnToNpc 	(self, other);
   
	AI_Output (self, other,"DIA_Jarvis_LeeCamp_08_01"); //Cuchnie tu wilgoci�, ale ma�o kto zagl�da na takie odludzie.
	AI_Output (other, self,"DIA_Jarvis_LeeCamp_15_02"); //Prawie jak w domu...
	AI_Output (self, other,"DIA_Jarvis_LeeCamp_08_03"); //Porozmawiaj z Lee. Mo�e dowiesz si� czego� wi�cej.
	AI_Output (self, other,"DIA_Jarvis_LeeCamp_08_04"); //Bywaj i... dzi�ki za pomoc.
	
   B_StopProcessInfos	(self);
}; 
