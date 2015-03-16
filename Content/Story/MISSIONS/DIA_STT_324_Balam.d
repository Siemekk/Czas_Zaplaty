// ************************ EXIT **************************

instance  STT_Balam_Exit (C_INFO)
{
	npc			=  STT_324_Balam;
	nr			=  999;
	condition	=  STT_Balam_Exit_Condition;
	information	=  STT_Balam_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int STT_Balam_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_Balam_Exit_Info()
{
	B_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance  STT_Balam_Hello (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_Hello_Condition;
	information		= STT_Balam_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witam."; 
};

FUNC int  STT_Balam_Hello_Condition()
{
	return 1;
};

FUNC void  STT_Balam_Hello_Info()
{
	AI_Output (other, self,"STT_Balam_Hello_Info_15_01"); //Witam.
	AI_Output (self, other,"STT_Balam_Hello_Info_07_02"); //Zejd� mi z oczu. Mam pe�ne r�ce roboty!
	B_StopProcessInfos	(self);	
};  

// ***************** diego find *****************************

instance  STT_Balam_Again (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_Again_Condition;
	information		= STT_Balam_Again_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int  STT_Balam_Again_Condition()
{
	if (Npc_KnowsInfo(hero,STT_Balam_Hello))&&(Npc_KnowsInfo(hero,DIA_Urt_Buddler))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Again_Info()
{	
	AI_Output (self, other,"STT_Balam_Again_Info_07_01"); //Zaraz... Ty nie jeste� stra�nikiem, znam ich wszystkich, a Twoja morda nijak mi nie pasuje do tej zbroi.
	AI_Output (self, other,"STT_Balam_Again_Info_07_02"); //Kim Ty do cholery jeste�?
	AI_Output (other, self,"STT_Balam_Again_Info_15_03"); //Zagram w otwarte karty. Przyby�em z obozu rebeliant�w...
	AI_Output (self, other,"STT_Balam_Again_Info_07_04"); //Ciszej cz�owieku!
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"STT_Balam_Again_Info_07_05"); //Po jak� choler� tutaj przylaz�e�? �ycie Ci niemi�e? I dlaczego nie mia�bym zawo�a� stra�nik�w?
	AI_Output (other, self,"STT_Balam_Again_Info_15_06"); //Mam zamiar z Twoj� pomoc� przekona� cienie, �eby w decyduj�cym momencie stan�li po naszej stronie.
	AI_Output (self, other,"STT_Balam_Again_Info_07_07"); //W decyduj�cym momencie? Co Ty gadasz? Chyba nie chcesz mi powiedzie�, �e rebelianci planuj� atak na Stary Ob�z? To by�oby szale�stwo i skrajny idiotyzm!
	AI_Output (other, self,"STT_Balam_Again_Info_15_08"); //Najlepsz� obron� jest atak, a my nie mamy wyboru. Przej�li�my Star� Kopalni�...
	AI_Output (self, other,"STT_Balam_Again_Info_07_09"); //Na jaja Beliara, Gomeza pewnie ju� krew zalewa. Zaczynasz mi si� podoba� ch�opcze. M�w dalej.
	AI_Output (other, self,"STT_Balam_Again_Info_15_10"); //Stra�nicy nied�ugo uderz� na nasz ob�z, zdajemy sobie spraw�, �e nie mieliby�my szans. Atak na Star� Kopalni� przyspieszy decyzj� Gomeza i da nam wi�ksz� szans� na atak z zaskoczenia.
	AI_Output (other, self,"STT_Balam_Again_Info_15_11"); //Sami nie pokonamy stra�nik�w, jednak maj�c przy boku cienie zniszczymy magnat�w!
	AI_Output (self, other,"STT_Balam_Again_Info_07_12"); //Hmm, plan nieg�upi, ale powiem szczerze, �e cienie mnie nie pos�uchaj�.
	AI_Output (self, other,"STT_Balam_Again_Info_07_13"); //Za to co mi powiedzia�e�, Gomez by mnie oz�oci�. Ale bez obaw, b�d� trzyma� j�zyk za z�bami. To nasza wsp�lna szansa...
	AI_Output (self, other,"STT_Balam_Again_Info_07_14"); //Jest jednak kto� komu cienie ufaj� bezgranicznie i za kim p�jd� w ogie�.
	AI_Output (other, self,"STT_Balam_Again_Info_15_15"); //Kto to?
	AI_Output (self, other,"STT_Balam_Again_Info_07_16"); //To Diego. Twardy z niego sukinsyn. Jednak po ataku na mag�w ognia ju� nie pojawi� si� w obozie.
	AI_Output (other, self,"STT_Balam_Again_Info_15_17"); //W takim razie musz� z nim porozmawia�. Gdzie go znajd�?
	AI_Output (self, other,"STT_Balam_Again_Info_07_18"); //Nie mam bladego poj�cia. Ale rozejrzyj si� po Kolonii, pewnie gdzie� si� zaszy� i czeka na lepsze czasy.
	AI_Output (self, other,"STT_Balam_Again_Info_07_19"); //Powiedz mu, �e Balam przesy�a pozdrowienia. Powiedz te�, �e jeste�my gotowi, �eby nas poprowadzi�.
	AI_Output (self, other,"STT_Balam_Again_Info_07_20"); //Aha i Diego musi pokaza� si� w obozie, inaczej cienie nie uwierz� w to, �e wr�ci�.
	AI_Output (other, self,"STT_Balam_Again_Info_15_21"); //Dobra, zobacz� co da si� zrobi�.
	
   WLD_InsertNPC(PC_Thief,"OC1");
	B_LogEntry		(CH3_RBL_Shadows, "Rozmawia�em z Balamem. Kucharz powiedzia� mi, �e tylko Diego jest w stanie przekona� cienie do walki przeciwko stra�nikom. Musz� znale�� Diego i nam�wi� go na powr�t do obozu.");
	B_StopProcessInfos	(self);	
};  

// ******************************************

instance  STT_Balam_Diego (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_Diego_Condition;
	information		= STT_Balam_Diego_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz�em Diego."; 

};

FUNC int  STT_Balam_Diego_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Rebel))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Diego_Info()
{
	AI_Output (other, self,"STT_Balam_Diego_Info_15_01"); //Znalaz�em Diego.
	AI_Output (self, other,"STT_Balam_Diego_Info_07_02"); //To �wietnie. Teraz go przyprowad�!
	AI_Output (other, self,"STT_Balam_Diego_Info_15_03"); //To nie takie proste. Najpierw musz� znale�� na to jaki� spos�b. 
	AI_Output (self, other,"STT_Balam_Diego_Info_07_04"); //W takim razie po�piesz si� do cholery! Mamy coraz mniej czasu...
	AI_Output (self, other,"STT_Balam_Diego_Info_07_05"); //Jak tylko co� wymy�lisz, to daj mi zna�.
	//TODO:/CORRECT: Crappy dialog added by orc
	AI_Output (self, other,"STT_Balam_Diego_Info_07_06"); //Poczekaj! Mam pomys�.
	AI_Output (self, other,"STT_Balam_Diego_Info_07_07"); //Magowie ognia potrafili teleportowa� si� poza mury zamku i wr�ci� kiedy przysz�a im na to ochota.
	AI_Output (self, other,"STT_Balam_Diego_Info_07_08"); //Niestety Gomez wszystkich zar�n��.
	AI_Output (other, self,"STT_Balam_Diego_Info_15_09"); //Chyba jednak nie wszystkich, wiem gdzie znale�� jednego z nich.
	AI_Output (self, other,"STT_Balam_Diego_Info_07_10"); //W takim razie powodzenia.
	B_LogEntry		(CH3_RBL_Shadows, "Znalaz�em spos�b na przemycenie Diego do Starego Obozu. Musz� porozmawia� z Miltenem, mo�e zosta�a mu jaka� runa teleportacyjna.");
	B_StopProcessInfos	(self);	
};  

// *********************************************

instance  STT_Balam_DiegoCome (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_DiegoCome_Condition;
	information		= STT_Balam_DiegoCome_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int  STT_Balam_DiegoCome_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Entrence))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_DiegoCome_Info()
{
	AI_Output (self, other,"STT_Balam_DiegoCome_Info_07_01"); //Przyprowadzi�e� Diego?
	AI_Output (other, self,"STT_Balam_DiegoCome_Info_15_02"); //Tak, nied�ugo powinien do Ciebie zajrze�.
	AI_Output (self, other,"STT_Balam_DiegoCome_Info_07_03"); //No to nadszed� czas na zmiany.
	AI_Output (self, other,"STT_Balam_DiegoCome_Info_07_04"); //Teraz cienie na pewno wezm� udzia� w buncie.
	AI_Output (self, other,"STT_Balam_DiegoCome_Info_07_05"); //�wietna robota.
	Log_SetTopicStatus	(CH3_RBL_Shadows, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_Shadows, "Diego jest ju� w obozie. Balam jest pewien, �e zdo�a przekona� cienie do walki z Gomezem.");
	B_LogEntry(CH3_RBL_OldCampSpy, "Cienie s� z nami!");
	
	B_StopProcessInfos	(self);	
};

// *********************************************
// CHAPTER 6
instance  STT_Balam_Spy (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_Spy_Condition;
	information		= STT_Balam_Spy_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak wygl�da sytuacja?"; 
};

FUNC int  STT_Balam_Spy_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Urt_DiegoJail))&&(Npc_KnowsInfo(hero,STT_Balam_DiegoCome))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Spy_Info()
{
	AI_Output (other, self,"STT_Balam_Spy_Info_15_01"); //Jak wygl�da sytuacja?
	AI_Output (self, other,"STT_Balam_Spy_Info_07_02"); //�le.
	AI_Output (self, other,"STT_Balam_Spy_Info_07_03"); //Dorwali Diego. Cienie straci�y pewno�� siebie i poszli w rozsypk�. W�tpi�, �e chocia� co drugi chwyci za miecz, kiedy uderzymy na stra�nik�w. 
	AI_Output (self, other,"STT_Balam_Spy_Info_07_04"); //Nie wiem jak kopacze. Jaki� skurwiel musia� wypapla� stra�nikom, �e Diego wr�ci�.
	AI_Output (self, other,"STT_Balam_Spy_Info_07_05"); //Musimy znale�� i uciszy� t� gnid� jak najszybciej!
	AI_Output (other, self,"STT_Balam_Spy_Info_15_06"); //Tu si� z tob� zgadzam.
	AI_DrawWeapon (hero);
	AI_Output (self, other,"STT_Balam_Spy_Info_07_07"); //Schowaj �elazo, to nie ja idioto! Jaki mia�bym w tym interes?
	AI_Output (other, self,"STT_Balam_Spy_Info_15_08"); //Tylko Ty i Urt wiedzieli�cie o powrocie Diego. W sumie to by� Tw�j pomys�. Masz sta�y kontakt z magnatami. Mam m�wi� dalej?
	AI_Output (self, other,"STT_Balam_Spy_Info_07_09"); //Wiem, jak to wygl�da, ale czasami pod latarni� jest najciemniej. Nie ufam Urtowi, ta jego 'szlachetna' walka to tylko pozory. Wiem, co m�wi�.
	AI_RemoveWeapon (hero);
	AI_Output (other, self,"STT_Balam_Spy_Info_15_10"); //Sk�d te podejrzenia?
	AI_Output (self, other,"STT_Balam_Spy_Info_07_11"); //Znam kogo�, kto zna� Urta przed tym jak trafi� do Kolonii. Kiedy� pogadali�my sobie od serca, by�em wtedy jeszcze szkodnikiem w Nowym Obozie.
	AI_Output (other, self,"STT_Balam_Spy_Info_15_12"); //Szkodnikiem? To jak trafi�e� tutaj?
	AI_Output (self, other,"STT_Balam_Spy_Info_07_13"); //Mia�em ju� do�� s�uchania Laresa. A w zamku akurat zwolni� si� etat kucharza. Zawsze lubi�em pichci�, wi�c zaryzykowa�em i nie �a�uj�.
	AI_Output (other, self,"STT_Balam_Spy_Info_15_14"); //Sprawdz� Twoj� wersj�. Kim jest ten znajomy?
	AI_Output (self, other,"STT_Balam_Spy_Info_07_15"); //To Cipher. Znajdziesz go w Nowym Obozie. Nie wiem co teraz robi, ale wiem co rozwi��e mu j�zyk. Ziele.
	AI_Output (self, other,"STT_Balam_Spy_Info_07_16"); //We� ze sob� co� do palenia, to si� dogadacie.
	AI_Output (other, self,"STT_Balam_Spy_Info_15_17"); //Lepiej dla Ciebie, �eby� m�wi� prawd�.
	B_LogEntry		(CH6_RBL_Spy, "Sytuacja przybra�a ciekawy obr�t. Balam twierdzi, �e zdrajc� mo�e by� Urt, w co nie chce mi si� wierzy� po tym, ile wcze�niej razem zdzia�ali�my w Starym Obozie. Nauczy�em si� jednak, �e w Kolonii nikomu nie mo�na zaufa�. Musz� porozmawia� z Cipherem o Urcie. Aha i przyda si� ziele dla Ciphera, �eby mu rozwi�za� j�zyk.");
};

// *********************************************

instance STT_Balam_FeedDiego (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_FeedDiego_Condition;
	information		= STT_Balam_FeedDiego_Info;
	important		= 0;
	permanent		= 0;
	description		= "Podobno to Ty zanosisz jedzenie do celi Diego?"; 
};

FUNC int STT_Balam_FeedDiego_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Bullit_Guard))
	{
		return 1;
	};
};

FUNC void STT_Balam_FeedDiego_Info()
{
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_01"); //Podobno to Ty zanosisz jedzenie do celi Diego?
	AI_Output (self, other,"STT_Balam_FeedDiego_Info_07_02"); //Chyba za kar�. Jak widz� twarz Diego to a� mnie skr�ca. Ale nie mam szans ze stra�nikiem, poza tym jak by�my uciekli?
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_03"); //Nie ma wiele czasu, Diego wkr�tce zostanie stracony. Musimy go stamt�d wyrwa�, a ja nie mog� si� kr�ci� po lochach, �eby nie wzbudzi� podejrze�.
	AI_Output (self, other,"STT_Balam_FeedDiego_Info_07_04"); //Niby jak mamy to zrobi�?
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_05"); //Bulit twierdzi, �e stra�nik zawsze zabiera mi�so, kt�re zanosisz Diego.
	AI_Output (self, other,"STT_Balam_FeedDiego_Info_07_06"); //To prawda - cholerny �ar�ok.
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_07"); //Bardzo dobrze, zach�anno�� go zgubi. Musimy po cichu za�atwi� stra�nika. Zatrujesz mi�so i zaniesiesz jedzenie do celi Diego.
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_08"); //Jakby stra�nik zapyta� si� dlaczego o tej porze to powiesz, �e to ostatni posi�ek skaza�ca.
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_09"); //�e na t� okazj� przyrz�dzi�e� specjalne pieczyste z szynki - na pewno si� skusi.
	AI_Output (self, other,"STT_Balam_FeedDiego_Info_07_10"); //Nie�le to wymy�li�e�. Ale nie mam szynki, o truci�nie nawet nie wspominaj�c.
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_11"); //Tym ja si� zajm�. Nied�ugo wr�c� z mi�sem i trutk�, wtedy zabierzesz si� za pichcenie.
	
   B_LogEntry(CH6_RBL_Diego, "Balam przyrz�dzi zatrut� szynk�. Musz� mu jednak dostarczy� mi�so i trucizn�. Z szynk� nie powinno by� problem�w, ale trucizna? Hmm, mo�e m�j 'mistrz' mi jak�� odst�pi. Czas nas goni, wi�c musz� si� po�pieszy�!");
};

// *********************************************

instance  STT_Balam_Ham (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 10;
	condition		= STT_Balam_Ham_Condition;
	information		= STT_Balam_Ham_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mam szynk�."; 
};

FUNC int  STT_Balam_Ham_Condition()
{
	if (Npc_KnowsInfo(hero, STT_Balam_FeedDiego))&&(NPC_HasItems(other,ItFo_mutton_01)>=1)&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Ham_Info()
{
	AI_Output (other, self,"STT_Balam_Ham_Info_15_01"); //Mam szynk�.
	AI_Output (self, other,"STT_Balam_Ham_Info_07_02"); //Zaraz j� przyrz�dz�.
	B_GiveInvItems (other, self, ItFo_mutton_01, 1);
	Npc_RemoveInvItems(self,ItFo_mutton_01,1);
	AI_Output (other, self,"STT_Balam_Ham_Info_15_03"); //Tylko jej nie zjedz.
	AI_Output (self, other,"STT_Balam_Ham_Info_07_04"); //Bez obaw. Zaraz si� tym zajm�.
	B_LogEntry		(CH6_RBL_Diego, "Odda�em szynk� Balamowi.");
	B_FullStop (hero);
	AI_SetWalkmode (self,NPC_WALK);
	AI_GotoWP	(self, "ROAST");

	/**************************
Ma podej�� do patelni, �e niby piecze.

*************************/

	AI_UseMob(self,"PAN",1);	
	B_InterruptMob ("PAN");
	AI_UseMob (self,"PAN",-1);
	B_StopProcessInfos	(self);
};

// *********************************************

instance  STT_Balam_Poison (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 11;
	condition		= STT_Balam_Poison_Condition;
	information		= STT_Balam_Poison_Info;
	important		= 0;
	permanent		= 0;
	description		= "We� trucizn�."; 
};

FUNC int  STT_Balam_Poison_Condition()
{
	if (Npc_KnowsInfo(hero, STT_Balam_FeedDiego))&&((NPC_HasItems(other,ItFo_Potion_Poison)>=1)||(NPC_HasItems(other,ItFo_Nabil_Poison)>=1))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Poison_Info()
{
	AI_Output (other, self,"STT_Balam_Poison_Info_15_01"); //We� trucizn�.
	AI_Output (self, other,"STT_Balam_Poison_Info_07_02"); //Jak Ty to zdoby�e�?
	
   if (NPC_HasItems(other,ItFo_Potion_Poison)>=1)
	{
		B_GiveInvItems (other, self, ItFo_Potion_Poison, 1);
		Npc_RemoveInvItems(self,ItFo_Potion_Poison,1);
	}
	else if (NPC_HasItems(other,ItFo_Nabil_Poison)>=1)
	{
		B_GiveInvItems (other, self, ItFo_Nabil_Poison, 1);
		Npc_RemoveInvItems(self,ItFo_Nabil_Poison,1);
	};

	AI_Output (other, self,"STT_Balam_Poison_Info_15_03"); //Niewa�ne. Tylko uwa�aj, to zabija szybciej ni� cieniostw�r.
	AI_Output (self, other,"STT_Balam_Poison_Info_07_04"); //B�d� o tym pami�ta�.
	B_LogEntry		(CH6_RBL_Diego, "Balam dosta� trucizn�.");
	//B_FullStop (hero);
	//AI_SetWalkmode (self,NPC_WALK);
	//AI_GotoWP	(self, "ROAST");

	/**************************
Ma podej�� do patelni, �e niby piecze.
-trucizne piecze? ;d /orc
-nie, ale musi ni� pola� mi�s �osiu ;P /sher
*************************/
	/*
		AI_UseMob(self,"PAN",1);	
		B_InterruptMob ("PAN");
		AI_UseMob (self,"PAN",-1);
		B_StopProcessInfos	(self);
*/
};

// *********************************************

instance  STT_Balam_GoDiego (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 12;
	condition		= STT_Balam_GoDiego_Condition;
	information		= STT_Balam_GoDiego_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int  STT_Balam_GoDiego_Condition()
{
	if (Npc_KnowsInfo(hero,STT_Balam_Poison))&&(Npc_KnowsInfo(hero,STT_Balam_Ham))&&(Npc_GetDistToNpc(self,hero) < 600)&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_GoDiego_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"STT_Balam_GoDiego_Info_07_01"); //Mamy ju� wszystko. Id�.
	AI_Output (other, self,"STT_Balam_GoDiego_Info_15_02"); //Obszukaj cia�o stra�nika, musi mie� przy sobie klucz do celi.
	AI_Output (other, self,"STT_Balam_GoDiego_Info_15_03"); //Nie baw si� w bohatera. Przynie� klucz, a ja zajm� si� reszt�.
	AI_Output (other, self,"STT_Balam_GoDiego_Info_15_04"); //Tylko nie rzucaj si� w oczy.
	AI_Output (self, other,"STT_Balam_GoDiego_Info_07_05"); //Poradz� sobie. Czekaj tu na mnie, nied�ugo b�d� z powrotem.
	B_StopProcessInfos	(self);

	/*************************
Nie musi i�� do samej celi, ale niech zniknie Dickowi z oczu i niech to chwilk� potrwa zanim wr�ci

*************************/
   AI_SetWalkmode (self, NPC_RUN);
	AI_GotoWP		(self, "OCC_MERCS_ENTRANCE");
	AI_GotoWP		(self, hero.wp);
};

// *********************************************

instance  STT_Balam_GoBackDiego (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 13;
	condition		= STT_Balam_GoBackDiego_Condition;
	information		= STT_Balam_GoBackDiego_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int  STT_Balam_GoBackDiego_Condition()
{
	if (Npc_KnowsInfo(hero,STT_Balam_GoDiego))&&(Npc_GetDistToNpc(self,hero) < 600)&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_GoBackDiego_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   if (diego_dead >= (Wld_GetDay()))
	{

		/********************
Killing stra�nika �ar�oka

*********************/

		var C_NPC grd; grd = Hlp_GetNpc(Grd_4107_Guard);
		Npc_ChangeAttribute	(grd, ATR_HITPOINTS, -grd.attribute[ATR_HITPOINTS_MAX]);

		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_01"); //Cholera, uda�o si�! Pad� jak k�oda.
		AI_Output (other, self,"STT_Balam_GoBackDiego_Info_15_02"); //Obszuka�e� cia�o?
		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_03"); //Tak, znalaz�em przy nim klucz.
		CreateInvItems (self,DUNGEONKEY,1);
		B_GiveInvItems (self, other, DUNGEONKEY, 1);
		AI_Output (other, self,"STT_Balam_GoBackDiego_Info_15_04"); //�wietna robota, Balam.
		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_05"); //Zrobi�em to dla Diego. Po�piesz si�.
		B_LogEntry		(CH6_RBL_Diego, "Stra�nik nie �yje, mam klucz do celi Diego. Musz� jak najszybciej go uwolni�.");
	}
	else
	{
		var C_NPC thf; thf = Hlp_GetNpc(PC_Thief);
		AI_PlayAni		(thf,	"T_PSI_VICTIM");
		Npc_ChangeAttribute	(thf, ATR_HITPOINTS, -thf.attribute[ATR_HITPOINTS_MAX]);

		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_06"); //Sp�nili�my si�, Diego nie �yje...
		AI_Output (other, self,"STT_Balam_GoBackDiego_Info_15_07"); //Kurwa ma�! Co teraz?
		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_08"); //Cienie na pewno nie pomog� w rebelii...
		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_09"); //Kto� tu idzie... To stra�nicy, pewnie przyszli za mn�...
		Log_SetTopicStatus	(CH6_RBL_Diego, LOG_FAILED);
		B_LogEntry		(CH6_RBL_Diego, "Skrewi�em, Diego nie �yje...");
		/**********************
Nie wiem czy dodasz kilku nowych grds czy przyjd� jacy� z obozu, ale niech ich b�dzie tylu, �eby dick nie mia� szans.
Mo�esz wykorzysta� tych martwych stra�nik�w z poprzednich zada�, gracz si� nie po�apie - tu ich instancje:

B_Attack_OC_GuardsGate();

GRD_2514_Guard
GRD_2515_Guard
GRD_2516_Guard
GRD_2517_Guard
GRD_2518_Guard

GRD_4056_Guard
GRD_4057_Guard
GRD_4058_Guard
GRD_4059_Guard
GRD_4060_Guard
GRD_4061_Guard

GRD_4065_Guard
GRD_4066_Guard
GRD_4067_Guard
GRD_4068_Guard


Tylu powinno wystarczy� ;P
**********************/

		/*********************
Troch� ciulowo bo Diego by� w G2 i G3 wi�c musi prze�y�. Mo�e niech jednak gracz MUSI go uratowa�, �eby nie by�o niezgodno�ci.
Dlatego doda�em atak stra�nik�w - aha musi ich by� tylu, �eby zabi� dicka xD

******************/

	};
};

// *********************************************

instance  STT_Balam_Urthos (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 14;
	condition		= STT_Balam_Urthos_Condition;
	information		= STT_Balam_Urthos_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mia�e� racj�."; 
};

FUNC int  STT_Balam_Urthos_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cipher_Urt))&&(Npc_KnowsInfo(hero,DIA_Lee_Urt))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Urthos_Info()
{
	AI_Output (other, self,"STT_Balam_Urthos_Info_15_01"); //Mia�e� racj�.
	AI_Output (self, other,"STT_Balam_Urthos_Info_07_02"); //O czym m�wisz?
	AI_Output (other, self,"STT_Balam_Urthos_Info_15_03"); //Urt to podejrzany typ. Ale musz� zdoby� niezbite dowody jego zdrady. Na razie musimy ta�czy� tak jak nam zagra.
	AI_Output (self, other,"STT_Balam_Urthos_Info_07_04"); //Jestem pewien, �e Diego mo�e Ci w tym pom�c. Ten niby atak i uwi�zienie Diego to musia�a by� robota Urta.
	AI_Output (other, self,"STT_Balam_Urthos_Info_15_05"); //Mo�e masz racj�. Diego powinien wiedzie� co� wi�cej.
	
   B_LogEntry		(CH6_RBL_Spy, "Balam trafnie zauwa�y�, �e powinienem porozmawia� z Diego o Urcie. Mo�e on b�dzie mia� konkretny dow�d zdrady Urthosa.");
};

// *********************************************

instance  STT_Balam_UrthosFinish (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 15;
	condition		= STT_Balam_UrthosFinish_Condition;
	information		= STT_Balam_UrthosFinish_Info;
	important		= 0;
	permanent		= 0;
	description		= "Uwolni�em Diego."; 
};

FUNC int  STT_Balam_UrthosFinish_Condition()
{
	if (Npc_KnowsInfo(hero,STT_Balam_Urthos))&&(Npc_KnowsInfo(hero,Info_Diego_Prison))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_UrthosFinish_Info()
{
	AI_Output (other, self,"STT_Balam_UrthosFinish_Info_15_01"); //Uwolni�em Diego. Musisz zorganizowa� cieni i kopaczy, nied�ugo zaatakujemy.
	AI_Output (self, other,"STT_Balam_UrthosFinish_Info_07_02"); //Uff, kamie� spad� mi z p�cherza. Ba�em si�, �e cienie strac� zapa� do walki. Zajm� si� wszystkim. Mam nadziej�, �e Diego wr�ci kiedy nadejdzie Czas Zap�aty.
	AI_Output (other, self,"STT_Balam_UrthosFinish_Info_15_03"); //Mo�esz by� tego pewien. Diego potwierdzi� Twoje s�owa, to Urt od samego pocz�tku nas sabotowa�.
	AI_Output (self, other,"STT_Balam_UrthosFinish_Info_07_04"); //Musisz raz na zawsze pozby� si� tego skurwiela! Przez niego zgin�� Kelvin i wielu innych porz�dnych ludzi.
	AI_Output (other, self,"STT_Balam_UrthosFinish_Info_15_05"); //Na wszystko przyjdzie w�a�ciwy czas. 
	AI_Output (self, other,"STT_Balam_UrthosFinish_Info_07_06"); //Jak zobacz� Urta, to osobi�cie wypruj� mu flaki.
	AI_Output (other, self,"STT_Balam_UrthosFinish_Info_15_07"); //Uwa�aj na siebie, Balam.
   
	Log_SetTopicStatus	(CH6_RBL_Spy, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_Spy, "Tak, Urt zas�u�y� na d�ug� i powoln� �mier�, ale na wszystko przyjdzie w�a�ciwy czas.");
	B_LogEntry		(CH6_RBL_Recognise, "Urt nas zdradzi�, to on doprowadzi� do �mierci Kelvina i od pocz�tku sterowa� nasz� siatk� w Starym Obozie. Trzeba go raz na zawsze uciszy�.");
   
   var c_npc urt; urt = Hlp_GetNPC(RBL_4062_Urt);
	B_ExchangeRoutine(urt, "GONE");
}; 
