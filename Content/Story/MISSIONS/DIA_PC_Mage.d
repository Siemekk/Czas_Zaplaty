//*********************************************
//					 EXIT
//*********************************************
instance DIA_Milten_EXIT (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 999;
	condition	= DIA_Milten_EXIT_Condition;
	information	= DIA_Milten_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Milten_EXIT_Condition()
{
	return 1;
};

func VOID DIA_Milten_EXIT_Info()
{
	if (Npc_GetAivar(self,AIV_PARTYMEMBER))
	{
		AI_Output (self, hero,"DIA_Milten_EXIT_02_00"); //Ruszamy w drog�.
	}
	else
	{
		AI_Output (self, hero,"DIA_Milten_EXIT_02_01"); //Do zobaczenia.
	};
   
	B_StopProcessInfos(self);
};

var int milten_think;
var int mil_ok;

//*********************************************

instance DIA_Milten_Guard (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 997;
	condition	= DIA_Milten_Guard_Condition;
	information	= DIA_Milten_Guard_Info;
	permanent	= 0;
	important	= 1;
	description 	= "";
};                       

FUNC INT DIA_Milten_Guard_Condition()
{
	return 1;
};

func VOID DIA_Milten_Guard_Info()
{
	AI_Output (self, other,"DIA_Milten_Guard_02_00"); //Czego tu szukasz przyb��do?
	AI_Output (other, self,"DIA_Milten_Guard_15_01"); //Co za mi�e przywitanie. I to w ustach faceta, kt�ry ubiera si� w sukienki.
	AI_Output (self, other,"DIA_Milten_Guard_02_02"); //Jak �miesz! To Szata Ognia, ornament samego Innosa!
	AI_Output (other, self,"DIA_Milten_Guard_15_03"); //Bogowie ma�o mnie interesuj�. Mo�na powiedzie�, �e oddaj� im tak� sam� cze�� jak� oni okazuj� ludziom. 
	AI_Output (other, self,"DIA_Milten_Guard_15_04"); //Jak dla mnie w odchodach �cierwojada mo�na znale�� wi�cej bosko�ci ni� w twoich ornamentach.
	AI_Output (self, other,"DIA_Milten_Guard_02_05"); //Blu�nisz! Zejd� mi z oczu!
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Milten_CanYouTeachMe (C_INFO)
{
	npc				=  PC_MAGE;
	nr				= 4;
	condition		= DIA_Milten_CanYouTeachMe_Condition;
	information		= DIA_Milten_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Milten_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Milten_Guard))
	{
		return 1;
	};
};

FUNC VOID DIA_Milten_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Milten_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
   AI_Output (self, other, "DIA_Milten_CanYouTeachMe_15_02"); //Hmm, mog� pom�c Ci lepiej zapami�ta� to z czym zetkniesz si� na co dzie�.
   AI_Output (self, other, "DIA_Milten_CanYouTeachMe_15_03"); //Wtedy rzadziej b�dziesz si� uczy� na w�asnych b��dach.
   AI_Output (self, other, "DIA_Milten_CanYouTeachMe_15_04"); //Znam te� sporo tajnik�w alchemii i wiem jak zwi�kszy� moc duchow�. 
   AI_Output (self, other, "DIA_Milten_CanYouTeachMe_15_05"); //Znam te� kilka zakl��, cho� nie wiem czy to dobry pomys�, �eby ci� tego uczy�... 
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Milten mo�e mi pom�c szybciej si� uczy�. Wie te� sporo o alchemii i mocy duchowej. No i zna sporo magicznych formu�.");
};
//*********************************************
instance DIA_Milten_Teleport (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 978;
	condition	= DIA_Milten_Teleport_Condition;
	information	= DIA_Milten_Teleport_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Znasz spos�b na to, by dosta� si� do Starego Obozu?";
};                     

FUNC INT DIA_Milten_Teleport_Condition()
{
	if(Npc_KnowsInfo(hero,STT_Balam_Diego))
	{
		return 1;
	};
};

func VOID DIA_Milten_Teleport_Info()
{
	AI_Output (other, self,"DIA_Milten_Teleport_02_00"); //Znasz spos�b na to, by dosta� si� do Starego Obozu?
	AI_Output (self, other,"DIA_Milten_Teleport_02_01"); //Do Starego Obozu. A pr�bowa�e� bram�?
	AI_Output (other, self,"DIA_Milten_Teleport_15_02"); //Bardzo zabawne. A znasz jaki� spos�b, kt�ry nie sko�czy si� rozsiekaniem albo powieszeniem?
	AI_Output (self, other,"DIA_Milten_Teleport_02_03"); //To zale�y kto chcia�by si� dosta� do obozu.
	AI_Output (other, self,"DIA_Milten_Teleport_15_04"); //To cie�, nazywa si� Diego.
	AI_Output (self, other,"DIA_Milten_Teleport_02_05"); //Diego... Tak, stary lis chce wr�ci� do kurnika. Jako� mnie to nie dziwi.
	AI_Output (self, other,"DIA_Milten_Teleport_02_06"); //We� ten zw�j. To czar teleportacji, powinien jeszcze dzia�a�.
	AI_Output (self, other,"DIA_Milten_Teleport_02_07"); //Tylko powiedz Diego, �e nie wiem, gdzie dok�adnie go przeniesie. Musi by� przygotowany na ka�d� ewentualno��.
	AI_Output (other, self,"DIA_Milten_Teleport_15_08"); //Oby tylko nie trafi� do sali tronowej.
	AI_Output (self, other,"DIA_Milten_Teleport_02_09"); //Chcia�bym zobaczy� min� Gomeza, gdyby nagle Diego spad� mu na g�ow�...
	AI_Output (self, other,"DIA_Milten_Teleport_02_10"); //Aha i powiedz Diego, �e to prezent od starego przyjaciela.
	CreateInvItem(self,ItArScrollTeleport1);
	B_GiveInvItems(self,other,ItArScrollTeleport1,1);
	B_LogEntry		(CH3_RBL_Diego, "Milten odda� mi zakl�cie, dzi�ki kt�remu Diego przeniesie sie do Starego Obozu omijaj�c bramy i by� mo�e stra�nik�w.");
};

//*********************************************

instance DIA_Milten_KatrakanatCollected (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 996;
	condition	= DIA_Milten_KatrakanatCollected_Condition;
	information	= DIA_Milten_KatrakanatCollected_Info;
	permanent	= 0;
	important	= 1;
	description 	= "";
};                       

FUNC INT DIA_Milten_KatrakanatCollected_Condition()
{
	if(Katrakanat_collected==TRUE)
	{
		return 1;
	};
};

func VOID DIA_Milten_KatrakanatCollected_Info()
{
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_00"); //Jak sobie radzisz ze z�o�eniem Katrakanatu?
	AI_Output (other, self,"DIA_Milten_KatrakanatCollected_15_01"); //Zdoby�em wszystkie cz�ci.
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_02"); //Niemo�liwe!
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_03"); //Nadszed� czas, by to co rozdarte, zn�w po��czy�o si� w ca�o��.
	AI_Output (other, self,"DIA_Milten_KatrakanatCollected_15_04"); //W takim razie nie przeszkadzam, bywaj.
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_05"); //Nie tak szybko. Potrzebujemy jeszcze kilku przedmiot�w do rytua�u.
	AI_Output (other, self,"DIA_Milten_KatrakanatCollected_15_06"); //Po prostu �wietnie.
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_07"); //Wr�� na miejsce, w kt�rym znalaz�e� Katrakanat ze wszystkimi fragmentami, a tak�e z pos��kiem Innosa i wod� �wi�con�.
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_08"); //Porozmawiaj o tym z Ratfordem.	
	AI_Output (other, self,"DIA_Milten_KatrakanatCollected_15_09"); //Tak, jest! Znowu robi� za cholernego pos�a�ca.
	Katrakanat_collected=3;
	B_LogEntry(CH2_RBL_MysteryBook, "�wietnie, znowu robi� za ch�opca na posy�ki. Tym razem musz� magom przynie�� pos��ek Innosa i wod� �wi�con�. Musz� porozmawia� z Ratfordem.");
};

//*********************************************

instance DIA_Milten_RickPassage (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 996;
	condition	= DIA_Milten_RickPassage_Condition;
	information	= DIA_Milten_RickPassage_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Sp�jrz na ten pergamin.";
};                       

FUNC INT DIA_Milten_RickPassage_Condition()
{
	if(NPC_HasItems(hero,magpass)>=1)
	{
		return 1;
	};
};

func VOID DIA_Milten_RickPassage_Info()
{
	AI_Output (other, self,"DIA_Milten_RickPassage_15_00"); //Sp�jrz na ten pergamin.
	AI_Output (self, other,"DIA_Milten_RickPassage_02_01"); //Kr�lewska piecz��. No dobra, skoro Cavalorn Ci ufa, to chyba nie mam wyboru.
	AI_Output (other, self,"DIA_Milten_RickPassage_15_02"); //Mog� wej�� do �rodka?
	AI_Output (self, other,"DIA_Milten_RickPassage_02_03"); //Wchod�, Leren na pewno si� ucieszy.
	AI_Output (self, other,"DIA_Milten_RickPassage_02_04"); //Mo�esz te� skorzysta� z naszych zapas�w zwoj�w i ro�lin.
	AI_Output (other, self,"DIA_Milten_RickPassage_15_05"); //Wielkie dzi�ki. Mo�e co� da si� wymieni� na rud�...
	AI_Output (self, other,"DIA_Milten_RickPassage_02_06"); //Tak, pewnie, przecie� i tak by� to ukrad�. Cholerni z�odzieje!
	Log_SetTopicStatus	(CH2_RBL_Mags, LOG_SUCCESS);
	B_LogEntry		(CH2_RBL_Mags, "W ko�cu magowie traktuj� mnie powa�nie. Najwy�sza pora rozejrze� si� po tej ich wie�y.");
	ENTER_TO_MAGTOWER=TRUE;
	Npc_ExchangeRoutine	(self,"start");
};

//*********************************************
//					 hallo
//*********************************************

instance DIA_Milten_Hello1 (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Hello1_Condition;
	information	= DIA_Milten_Hello1_Info;
	permanent	= 0;
	important	= 0;
	description 	= "�adnie si� tutaj urz�dzili�cie.";
};                       

FUNC INT DIA_Milten_Hello1_Condition()
{
	if (CAVALORN_ASK_TRAIL==2)
	{
		return 1;
	};
};

func VOID DIA_Milten_Hello1_Info()
{
	AI_Output (other, self,"DIA_Milten_Hello1_15_00"); //�adnie si� tutaj urz�dzili�cie.
	AI_Output (self, other,"DIA_Milten_Hello1_02_01"); //Miejsce dobre jak ka�de inne, przynajmniej mieli�my spok�j. A� do dzisiaj...
	AI_Output (self, other,"DIA_Milten_Hello1_02_02"); //Kim jeste� i czego tu szukasz?
	AI_Output (other, self,"DIA_Milten_Hello1_15_03"); //Niewa�ne kim jestem, wa�ne co mog� Ci zaoferowa�.
	AI_Output (self, other,"DIA_Milten_Hello1_02_04"); //Ty?! Nie b�d� �mieszny, jeste� kolejnym g�upcem, kt�ry uwa�a si� za sprytnego, tylko dlatego, �e zdoby� przepustk�.

	AI_PlayAni (self,"T_PRACTICEMAGIC3");
	/********************************

	Tutaj mo�naby da� animacj� wyci�gni�cia kuli ognia
	*******************************/

	AI_Output (self, other,"DIA_Milten_Hello1_02_05"); //Daj mi chocia� jeden dobry pow�d, dla kt�rego nie mia�bym zamieni� Ci� w kup� popio�u.
	
	AI_PlayAni (self,"R_SCRATCHHEAD");

	/****************************
	Schowanie kuli i ta animacja z otrzepywaniem poparzonego r�kawa 
	****************************/

	AI_Output (other, self,"DIA_Milten_Hello1_15_06"); //Zamierzam zg��bi� magiczne sztuki!
	AI_Output (self, other,"DIA_Milten_Hello1_02_07"); //Co?! Nie do��, �e g�upi to jeszcze szalony! To nie jest szk�ka niedzielna!
	AI_Output (other, self,"DIA_Milten_Hello1_15_08"); //Wiem, dlatego przyby�em zaoferowa� wam swoje us�ugi.
	AI_Output (self, other,"DIA_Milten_Hello1_02_09"); //W zamian za co?
	AI_Output (other, self,"DIA_Milten_Hello1_15_10"); //Za nauk� oczywi�cie.
	AI_Output (self, other,"DIA_Milten_Hello1_02_11"); //A dlaczego uwa�asz, �e Twoje us�ugi mog� si� nam przyda�? Sk�d pomys�, �e w og�le potrzebujemy jakiejkolwiek pomocy?

	Info_ClearChoices (DIA_Milten_Hello1);
	//ToFix: Hero na tamten czas ani wogole nie mog� scalic katrakanatu - katra to scie�ka �owcy
	if (Npc_KnowsInfo(hero,DIA_Cavalorn_Demon))
	{
		Info_AddChoice (DIA_Milten_Hello1, "To ja scali�em Katrakanat!", DIA_Milten_Hello1_Katra);
	};

	Info_AddChoice (DIA_Milten_Hello1, "Magia to pot�ga, kt�ra zwalczy... moich wrog�w.", DIA_Milten_Hello1_Power);
	Info_AddChoice (DIA_Milten_Hello1, "Chc� pod��y� �cie�k� pokory.", DIA_Milten_Hello1_Ok);
	Info_AddChoice (DIA_Milten_Hello1, "A dlaczego nie?", DIA_Milten_Hello1_Why);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Hello1_Katra()
{
	milten_think = B_SetDayTolerance()+1;
	mil_ok = TRUE;
	AI_Output (other, self,"DIA_Milten_Hello1_Katra_15_00"); //To ja scali�em Katrakanat!
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_01"); //I uwa�asz, �e to pow�d do dumy?
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_02"); //Nie, ale nie mia�em wyboru. Musia�em spr�bowa� i... przegra�em.
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_03"); //Hmm, to nie cel jest wa�ny, lecz droga, kt�ra ku niemu zmierza...
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_04"); //Mimo to przekona�e� mnie. Jest w Tobie co�... Iskra, kt�r� ju� w kim� widzia�em.
	AI_Output (other, self,"DIA_Milten_Hello1_Katra_15_05"); //Kim on by�?
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_06"); //Kim jest. To przyjaciel, kt�ry sam wybra� swoje przeznaczenie. Niewa�ne, mo�e go kiedy� poznasz...
	AI_Output (other, self,"DIA_Milten_Hello1_Katra_15_07"); //Od czego zaczniemy?
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_08"); //Od pokory oczywi�cie.
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_09"); //Staram si� zg��bi� sztuk� alchemii i uzdrawiania. Jednak potrzebuj� do tego wielu sk�adnik�w i wiedzy spisywanej w uczonych zwojach.
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_10"); //Dam Ci list� sk�adnik�w, kt�rych b�d� potrzebowa�.
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_11"); //Przyjd� po ni� jutro, musz� zdecydowa�, kt�re ingrediencje s� dla mnie najwa�niejsze...
	if (mag_knows == FALSE)
	{
		mag_knows = TRUE;
		Log_CreateTopic	(CH2_RBL_Magic, LOG_MISSION);
		Log_SetTopicStatus	(CH2_RBL_Magic, LOG_RUNNING);
	};

	B_LogEntry		(CH2_RBL_Magic, "Milten zgodzi� si� zosta� moim... przewodnikiem. Nauczy mnie magii, ale musz� by� pos�uszny i jak znam �ycie spe�nia� ka�d� zachciank� mag�w. My�l�, �e jednak warto si� tak po�wi�ca�...");
	B_StopProcessInfos	(self);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Hello1_Power()
{
	AI_Output (other, self,"DIA_Milten_Hello1_Power_15_00"); //Magia to pot�ga, kt�ra zwalczy... moich przeciwnik�w.
	AI_Output (self, other,"DIA_Milten_Hello1_Power_02_01"); //Tak, a przyjaci� zamieni we wrog�w.
	AI_Output (self, other,"DIA_Milten_Hello1_Power_02_02"); //Magia nie mo�e by� tylko narz�dziem zniszczenia, musi tak�e tworzy� i dawa� �ycie. Magia to r�wnowaga wszystkich si� jakie w�adaj� �wiatem �miertelnik�w.
	AI_Output (self, other,"DIA_Milten_Hello1_Power_02_03"); //Zapami�taj to, je�eli chcesz wst�pi� na �cie�k� Ognia.
	Info_ClearChoices (DIA_Milten_Hello1);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Hello1_Ok()
{
	milten_think = B_SetDayTolerance()+1;
	mil_ok = TRUE;
	AI_Output (other, self,"DIA_Milten_Hello1_Ok_15_00"); //Chc� pod��y� �cie�k� pokory.
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_01"); //Dlaczego?
	AI_Output (other, self,"DIA_Milten_Hello1_Ok_15_02"); //Chc� pozna� samego siebie, chc� zapanowa� nad ogniem gniewu i zamieni� go w l�d spokoju. To jest m�j cel.
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_03"); //Nie cel jest wa�ny, lecz droga, kt�ra ku niemu zmierza...
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_04"); //Mimo to przekona�e� mnie. Jest w tobie co�... Iskra, kt�r� ju� w kim� widzia�em.
	AI_Output (other, self,"DIA_Milten_Hello1_Ok_15_05"); //Kim on by�?
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_06"); //Kim jest. To przyjaciel, kt�ry sam wybra� swoje przeznaczenie. Niewa�ne, mo�e go jeszcze poznasz...
	AI_Output (other, self,"DIA_Milten_Hello1_Ok_15_07"); //Od czego zaczniemy?
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_08"); //Od pokory oczywi�cie.
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_09"); //Staram si� zg��bi� sztuk� alchemii i uzdrawiania. Jednak potrzebuj� do tego wielu sk�adnik�w i wiedzy spisywanej na uczonych zwojach.
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_10"); //Dam Ci list� sk�adnik�w, kt�rych b�d� potrzebowa�.
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_11"); //Przyjd� jutro, musz� zdecydowa�, kt�re ingrediencje s� dla mnie najwa�niejsze...
	Log_CreateTopic	(CH2_RBL_Magic, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Magic, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Magic, "Milten zgodzi� si� zosta� moim... przewodnikiem. Nauczy mnie magii, ale musz� by� pos�uszny i jak znam �ycie spe�nia� ka�d� zachciank� mag�w. My�l�, �e jednak warto si� tak po�wi�ca�...");
	B_StopProcessInfos	(self);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Hello1_Why()
{
	AI_Output (other, self,"DIA_Milten_Hello1_Why_15_00"); //A dlaczego nie?
	AI_Output (self, other,"DIA_Milten_Hello1_Why_02_01"); //Nie pozna magii ten, kt�ry nie zdaje sobie sprawy z tego, czemu ona s�u�y.
	AI_Output (self, other,"DIA_Milten_Hello1_Why_02_02"); //Jeste� jak wypalone naczynie, sito, przez kt�re przelewa si� woda �ycia.
	AI_Output (self, other,"DIA_Milten_Hello1_Why_02_03"); //Musisz wiedzie�, co chcesz osi�gn��, aby pozna� samego siebie i cel swej podr�y.
	AI_Output (self, other,"DIA_Milten_Hello1_Why_02_04"); //Magia to �cie�ka wyboru, nie przypadku.
	Info_ClearChoices (DIA_Milten_Hello1);
};

//*********************************************

instance DIA_Milten_Plants (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_Plants_Condition;
	information	= DIA_Milten_Plants_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Prosi�e� mnie, �ebym przyszed� po list�.";
};                       

FUNC INT DIA_Milten_Plants_Condition()
{
	if (mil_ok == TRUE)&&(milten_think <= (Wld_GetDay()))
	{
		return 1;
	};
};

func VOID DIA_Milten_Plants_Info()
{
	AI_Output (other, self,"DIA_Milten_Plants_15_00"); //Prosi�e� mnie, �ebym przyszed� po list�.
	AI_Output (self, other,"DIA_Milten_Plants_02_01"); //W rzeczy samej. To nie by�o �atwe, ale w ko�cu zdecydowa�em, kt�re ro�liny s� mi najbardziej potrzebne.
	AI_Output (self, other,"DIA_Milten_Plants_02_02"); //Oto lista ingrediencji.
	CreateInvItems (self, milten_list,1); 
	B_GiveInvItems (self, other, milten_list, 1);
	AI_Output (self, other,"DIA_Milten_Plants_02_03"); //Musisz przynie�� wszystkie sk�adniki i staraj si� ich nie zniszczy�. Musz� by� w idealnym stanie!
	AI_Output (other, self,"DIA_Milten_Plants_15_04"); //Zrobi� co w mojej mocy, magu.
	AI_Output (self, other,"DIA_Milten_Plants_02_05"); //Ruszaj wi�c i... umyj si�, bo strasznie cuchniesz.
	Log_CreateTopic	(CH2_RBL_Plants, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Plants, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Plants, "Dosta�em list� sk�adnik�w od Miltena. A� si� boj� do niej zagl�da�. Ten mag zaczyna mi dzia�a� na nerwy.");
};

//*********************************************

instance DIA_Milten_Plantsd (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 3;
	condition	= DIA_Milten_Plantsd_Condition;
	information	= DIA_Milten_Plantsd_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Gdzie mog� znale�� smoczy korze�?";
};                       

FUNC INT DIA_Milten_Plantsd_Condition()
{
	if (milten_inged == TRUE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Plantsd_Info()
{
	AI_Output (other, self,"DIA_Milten_Plantsd_15_00"); //Gdzie mog� znale�� smoczy korze�?	
	AI_Output (self, other,"DIA_Milten_Plantsd_02_01"); //Mo�liwe, �e na terenach ork�w, ale nie jestem pewien.
	AI_Output (self, other,"DIA_Milten_Plantsd_02_02"); //Kiedy� gdy potrzebowa�em smoczego korzenia, przyni�s� mi go Leaf. Porozmawiaj z nim, mo�e dowiesz si� czego� wi�cej.
	B_LogEntry(CH2_RBL_Plants, "Smoczy korze� mo�e rosn�� na terenach ork�w. Podobno wcze�niej Leaf przyni�s� korze� Miltenowi - powinienem pogada� z tym rebeliantem.");
};

//*********************************************

instance DIA_Milten_Plantsda (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 4;
	condition	= DIA_Milten_Plantsda_Condition;
	information	= DIA_Milten_Plantsda_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Nie wiedzia�em, �e w Kolonii rosn� d�by.";
};                       

FUNC INT DIA_Milten_Plantsda_Condition()
{
	if (milten_inged == TRUE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Plantsda_Info()
{
	AI_Output (other, self,"DIA_Milten_Plantsda_15_00"); //Nie wiedzia�em, �e w Kolonii rosn� d�by.
	AI_Output (self, other,"DIA_Milten_Plantsda_02_01"); //Nie ma ich wiele, ale rzeczywi�cie mo�na je tu spotka�. 
	AI_Output (self, other,"DIA_Milten_Plantsda_02_02"); //Wiem, �e jaki� idiota w obozie p�dzi z li�ci i �o��dzi d�bu samogon.
	AI_Output (other, self,"DIA_Milten_Plantsda_15_03"); //Dlaczego od razu idiota?
	AI_Output (self, other,"DIA_Milten_Plantsda_02_04"); //Bo w takim st�eniu i w po��czeniu z alkoholem, z takiego samogonu robi si� wypalaj�ca trzewia trucizna.
	AI_Output (other, self,"DIA_Milten_Plantsda_15_05"); //I w�a�nie o to chodzi, magu.
	AI_Output (self, other,"DIA_Milten_Plantsda_02_06"); //Co? Wszyscy jeste�cie niespe�na rozumu. Id� ju�!

	B_LogEntry(CH2_RBL_Plants, "D�by rosn� w tutejszych lasach, jednak nie ma ich zbyt wiele. Podobno kto� w obozie p�dzi z li�ci i �o��dzi bimber. Hmm, przychodzi mi na my�l tylko Piwosz.");
};

//*********************************************

instance DIA_Milten_Plantsdb (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 5;
	condition	= DIA_Milten_Plantsdb_Condition;
	information	= DIA_Milten_Plantsdb_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Nasienie czerwonego buku?";
};                       

FUNC INT DIA_Milten_Plantsdb_Condition()
{
	if (milten_inged == TRUE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Plantsdb_Info()
{
	AI_Output (other, self,"DIA_Milten_Plantsdb_15_00"); //Nasienie czerwonego buku?
	AI_Output (self, other,"DIA_Milten_Plantsdb_02_01"); //Wiem, brzmi dziwnie, ale to prawda. To ma�e cholerstwo mo�na znale�� w tutejszych lasach.
	AI_Output (self, other,"DIA_Milten_Plantsdb_02_02"); //Kilka dni temu zap�aci�em Harkowi 200 bry�ek za jedno z nasion. M�wi�, �e przyniesie mi wi�cej, ale od tego czasu ucieka na m�j widok.
	AI_Output (other, self,"DIA_Milten_Plantsdb_15_03"); //W porz�dku, porozmawiam z nim.	
	B_LogEntry		(CH2_RBL_Plants, "Hark podobno wie, gdzie mo�na znale�� nasiona czerwonego buku.");
};

//*********************************************
var int Milten_has_plants;
instance DIA_Milten_PlantsAll (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 5;
	condition	= DIA_Milten_PlantsAll_Condition;
	information	= DIA_Milten_PlantsAll_Info;
	permanent	= 1;
	important	= 0;
	description 	= "Mam ju� wszystkie ingrediencje.";
};                       

FUNC INT DIA_Milten_PlantsAll_Condition()
{
	if (milten_inged == TRUE) && (!Milten_has_plants) && (Npc_KnowsInfo(hero,DIA_Milten_Plantsdb))
   && (Npc_KnowsInfo(hero,DIA_Milten_Plantsda)) && (Npc_KnowsInfo(hero,DIA_Milten_Plantsd))
	{
		return 1;
	};
};

func VOID DIA_Milten_PlantsAll_Info()
{
	AI_Output (other, self,"DIA_Milten_PlantsAll_15_00"); //Mam ju� wszystkie ingrediencje.
	AI_Output (self, other,"DIA_Milten_PlantsAll_02_01"); //Naprawd�?
	if ((NPC_HasItems(other,dragon_root)>=1)&&
		(NPC_HasItems(other,ItFo_Plants_OrcHerb_02)>=1)&&
		(NPC_HasItems(other,ItFo_Plants_Bloodwood_01)>=1)&&
		(NPC_HasItems(other,ItFo_Plants_Seraphis_01)>=3)&&
		(NPC_HasItems(other,ItFo_Plants_mushroom_01)>=5)&&
		(NPC_HasItems(other,ItMi_Alchemy_Alcohol_01)>=1)&&
		(NPC_HasItems(other,ItAt_WolfTeeth)>=5)&&
		(NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=3)&&
		(NPC_HasItems(other,ItAt_Bloodfly_02)>=1)&&
		(NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=2)&&
		(NPC_HasItems(other,ItFo_Plants_Bloodwood_01)>=1))
	//TODO: Check it (UP)
	{
      Milten_has_plants = true;
		mag_prove = mag_prove + 1;
		B_GiveXP(750);
		AI_Output (self, other,"DIA_Milten_PlantsAll_02_02"); //Rzeczywi�cie zebra�e� wszystkie sk�adniki!
		B_GiveInvItems (other, self, dragon_root,1);
		B_GiveInvItems (other, self, ItFo_Plants_OrcHerb_02,1);
		B_GiveInvItems (other, self, ItFo_Plants_Bloodwood_01,1);
		B_GiveInvItems (other, self, ItFo_Plants_Seraphis_01,3);
		B_GiveInvItems (other, self, ItFo_Plants_mushroom_01,5);
		B_GiveInvItems (other, self, ItMi_Alchemy_Alcohol_01,1);
		B_GiveInvItems (other, self, ItAt_WolfTeeth,5);
		B_GiveInvItems (other, self, ItFo_Plants_OrcHerb_01,3);
		B_GiveInvItems (other, self, ItAt_Bloodfly_02,1);
		B_GiveInvItems (other, self, ItFo_Plants_RavenHerb_01,2);
		B_GiveInvItems (other, self, ItFo_Plants_Bloodwood_01,1);

		Npc_RemoveInvItems(self,dragon_root,1);
		Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Bloodwood_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,3);
		Npc_RemoveInvItems(self,ItFo_Plants_mushroom_01,5);
		Npc_RemoveInvItems(self,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(self,ItAt_WolfTeeth,5);
		Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_01,3);
		Npc_RemoveInvItems(self,ItAt_Bloodfly_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,2);
		Npc_RemoveInvItems(self,ItFo_Plants_Bloodwood_01,1);
		AI_Output (self, other,"DIA_Milten_PlantsAll_02_03"); //Jestem pod wra�eniem. We� to, naprawd� zas�u�y�e� na te mikstury.

		CreateInvItems (self,  ItFo_Potion_HP_2_temp,1);
		CreateInvItems (self,  ItFo_Potion_MP_2_temp,1);
		CreateInvItems (self,  ItFo_Potion_DEX_2_temp,1);
		CreateInvItems (self,  ItFo_Potion_Str_2_temp,1);
		CreateInvItems (self,  ItFo_Potion_HP_MP_2_temp,1);
		CreateInvItems (self,  ItFo_Potion_Prot_Total_2_temp,1);	
		
		B_GiveInvItems (self, other, ItFo_Potion_HP_2_temp,1);
		B_GiveInvItems (self, other, ItFo_Potion_MP_2_temp,1);
		B_GiveInvItems (self, other, ItFo_Potion_DEX_2_temp,1);
		B_GiveInvItems (self, other, ItFo_Potion_Str_2_temp,1);
		B_GiveInvItems (self, other, ItFo_Potion_HP_MP_2_temp,1);
		B_GiveInvItems (self, other, ItFo_Potion_Prot_Total_2_temp,1);
		/*********************************
	Ork niech milten da mu te mikstury czasowo zmieniaj�ce atrybuty, kilka r�nych.

	*********************************/
		AI_Output (other, self,"DIA_Milten_PlantsAll_15_04"); //A co z nauk�?
		AI_Output (self, other,"DIA_Milten_PlantsAll_02_05"); //Na to przyjdzie jeszcze czas.
		AI_Output (other, self,"DIA_Milten_PlantsAll_15_06"); //Powiedzia�e�, �e...
		AI_Output (self, other,"DIA_Milten_PlantsAll_02_07"); //Wybacz, jestem bardzo zaj�tym cz�owiekiem. W ko�cu mam wszystkie sk�adniki...
		Log_SetTopicStatus	(CH2_RBL_Plants, LOG_SUCCESS);
		B_LogEntry		(CH2_RBL_Plants, "Dostarczy�em Miltenowi wszystkich sk�adnik�w, a on najzwyczajniej w �wiecie poszed� miesza� w kotle te cholerne mikstury! Powiedzia�, �e przyjdzie jeszcze czas na nauk� - mam nadziej�, �e do�yj� tej chwili.");
		B_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_PlantsAll_02_08"); //Nie masz wszystkiego, wr�� jak uzbierasz sk�adniki.
		B_StopProcessInfos	(self);
	};
};

//*********************************************

instance DIA_Milten_Ask (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 6;
	condition	= DIA_Milten_Ask_Condition;
	information	= DIA_Milten_Ask_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Co dalej?";
};                       

FUNC INT DIA_Milten_Ask_Condition()
{
	if (mag_prove == 2)
	{
		return 1;
	};
};

func VOID DIA_Milten_Ask_Info()
{
	AI_Output (other, self,"DIA_Milten_Ask_15_00"); //Co dalej?
	AI_Output (self, other,"DIA_Milten_Ask_02_01"); //A co ma by�?
	AI_Output (other, self,"DIA_Milten_Ask_15_02"); //Wykona�em wasze zlecenia. Nadal chc� pozna� tajniki magii. Mo�e by�cie mnie w ko�cu czego� nauczyli!
	AI_Output (self, other,"DIA_Milten_Ask_02_03"); //Porozmawiaj z Lerenem, on na pewno co� wymy�li, �eby utrudni� Ci �ycie.

	// akw_ring

	// powi�zanie z magami wody, kr�giem i zniszczeniem bariery
};

//*********************************************

instance DIA_Milten_Eqquipment (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 7;
	condition	= DIA_Milten_Eqquipment_Condition;
	information	= DIA_Milten_Eqquipment_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Wybra�em drog� magii.";
};                       

FUNC INT DIA_Milten_Eqquipment_Condition()
{
	if (other.guild == GIL_MAG)
	{
		return 1;
	};
};

func VOID DIA_Milten_Eqquipment_Info()
{
	AI_Output (other, self,"DIA_Milten_Eqquipment_15_00"); //Wybra�em drog� magii.
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_01"); //No prosz�, konkurencja mi ro�nie. Masz si� nie tyka� alchemii, zrozumiano?!
	AI_Output (other, self,"DIA_Milten_Eqquipment_15_02"); //Ekhm, dobrze. Przyda�oby mi si� jakie� wyposa�enie godne... maga.
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_03"); //Tak, oczywi�cie. Mam tu gdzie� Wielki Kostur Ognistych Zamieci i Szat� Pijanego Arcymistrza.
	AI_Output (other, self,"DIA_Milten_Eqquipment_15_04"); //Naprawd�?
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_05"); //Nie do cholery! A mia�em Ci� za bardziej rozgarni�tego.
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_06"); //Ka�dy my�li, �e magowie to kasta wybra�c�w, �e to pomaza�cy boga i takie tam bzdury.
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_07"); //Ale to nie szata czyni magiem, ale umys� i serce. 
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_08"); //To nie kostur da Ci si��, ale wiara i silna wola.
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_09"); //Zapami�taj to, a po�yjesz d�u�ej ni� przeci�tny idiota w Kolonii.
	AI_Output (other, self,"DIA_Milten_Eqquipment_15_10"); //To dostan� w ko�cu jakie� szmaty?
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_11"); //Od razu lepiej. Tak, mam dla Ciebie kostur i jedn� z run. Wybierz t�, kt�ra bardziej Ci odpowiada.
	
	/*************************
	ork to ma by� kostur, ale co� �adnego nie znalaz�em
	*************************/

	CreateInvItems (self, MAG_MW_01, 1);
	B_GiveInvItems (self, other, MAG_MW_01, 1);	
	AI_Output (other, self,"DIA_Milten_Eqquipment_15_12"); //A co mam do wyboru?
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_13"); //Sopel lodu albo ognisty pocisk.
	Info_ClearChoices (DIA_Milten_Eqquipment);
	Info_AddChoice (DIA_Milten_Eqquipment, "Niech b�dzie ognisty pocisk.", DIA_Milten_Eqquipment_Fire);
	Info_AddChoice (DIA_Milten_Eqquipment, "Wybieram sopel lodu.", DIA_Milten_Eqquipment_Ice);
};


// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Eqquipment_Fire()
{
	CreateInvItems (self,ItArRuneFirebolt,1);
	B_GiveInvItems (self, other, ItArRuneFirebolt, 1);
	AI_Output (other, self,"DIA_Milten_Eqquipment_Fire_15_00"); //Niech b�dzie ognisty pocisk.
	AI_Output (self, other,"DIA_Milten_Eqquipment_Fire_02_01"); //To �wietny wyb�r, b�dziesz m�g� bez u�ywania m�zgu rozpali� ognisko, albo przypali� dup� jakiemu� idiocie.
	AI_Output (self, other,"DIA_Milten_Eqquipment_Fire_02_02"); //Tylko nie rzucaj tym w orka, bo nawet si� nie zorientujesz, co Ci� zabi�o.
	AI_Output (other, self,"DIA_Milten_Eqquipment_Fire_15_03"); //Bardzo �mieszne...
	
   B_eqquip_check_mag();
   
	B_LogEntry		(CH3_RBL_Choose, "Dosta�em od Miltena kostur i ognisty pocisk.");
	B_StopProcessInfos	(self);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Eqquipment_Ice()
{
	CreateInvItems (self,ItArRuneThunderbolt,1);
	B_GiveInvItems (self, other, ItArRuneThunderbolt, 1);
	AI_Output (other, self,"DIA_Milten_Eqquipment_Ice_15_00"); //Wybieram sopel lodu.
	AI_Output (self, other,"DIA_Milten_Eqquipment_Ice_02_01"); //Tak, to �wietny wyb�r, b�dziesz m�g� skutecznie sch�odzi� piwo albo wino. Wszystkie opoje w obozie b�d� Ci� za to nosi� na r�kach.
	AI_Output (self, other,"DIA_Milten_Eqquipment_Ice_02_02"); //Tylko nie rzucaj tym w orka, bo nawet si� nie zorientujesz, co Ci� zabi�o.
	AI_Output (other, self,"DIA_Milten_Eqquipment_Ice_15_03"); //Bardzo �mieszne...

	B_eqquip_check_mag();
   
	B_LogEntry		(CH3_RBL_Choose, "Dosta�em od Miltena kostur i sopel lodu.");
	B_StopProcessInfos	(self);
};

//*********************************************

instance DIA_Milten_Cristals (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 8;
	condition	= DIA_Milten_Cristals_Condition;
	information	= DIA_Milten_Cristals_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Przysy�a mnie Leren.";
};                       

FUNC INT DIA_Milten_Cristals_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Leren_AlmanachReadAfter))
	{
		return 1;
	};
};

func VOID DIA_Milten_Cristals_Info()
{
	AI_Output (other, self,"DIA_Milten_Cristals_15_00"); //Przysy�a mnie Leren.
	AI_Output (self, other,"DIA_Milten_Cristals_02_02"); //Chodzi o gwiezdne kryszta�y?
	AI_Output (other, self,"DIA_Milten_Cristals_15_03"); //Dok�adnie.
	AI_Output (self, other,"DIA_Milten_Cristals_02_04"); //Rozwi�zanie jest do�� proste.
	AI_Output (self, other,"DIA_Milten_Cristals_02_05"); //Jaszczurka, kt�ra opisa�a t� histori� mia�a na my�li kryszta�y niewiadomego pochodzenia, kt�re czasami spadaj� na ziemi� w deszczu meteoryt�w.
	AI_Output (self, other,"DIA_Milten_Cristals_02_06"); //S� to bardzo rzadkie minera�y, ale dla mag�w s� bezcenne, gdy� potrafi� skumulowa� niewyobra�alne pok�ady energii.
	AI_Output (self, other,"DIA_Milten_Cristals_02_07"); //Do tego masz szcz�cie, bo to czego szukasz jest na wyci�gni�cie r�ki.
	AI_Output (other, self,"DIA_Milten_Cristals_15_08"); //Czyli?
	AI_Output (self, other,"DIA_Milten_Cristals_02_09"); //Niedawno kilku takich kryszta��w szuka� m�j przyjaciel, w Kolonii nazywaj� go Bezimiennym.
	AI_Output (other, self,"DIA_Milten_Cristals_15_10"); //Znalaz� je?
	AI_Output (self, other,"DIA_Milten_Cristals_02_11"); //Z tego co wiem, tak. Wszystkie trafi�y w r�ce Saturasa. Kryszta�y te zosta�y u�yte przez nas podczas tworzenia magicznej Bariery.
	AI_Output (self, other,"DIA_Milten_Cristals_02_12"); //Nazywaj� si� Kamieniami Ogniskuj�cymi.
	AI_Output (self, other,"DIA_Milten_Cristals_02_13"); //Jednak do zaabsorbowania tak ogromnej mocy jak� mo�e w sobie nosi� Bestia b�dziesz potrzebowa� czego� wi�cej.
	AI_Output (other, self,"DIA_Milten_Cristals_15_14"); //M�w ja�niej.
	AI_Output (self, other,"DIA_Milten_Cristals_02_15"); //Wszystkiego dowiesz si� w swoim czasie. Przynie� mi Kamienie Ogniskuj�ce, a wtedy powiem Ci co dalej.
	AI_Output (other, self,"DIA_Milten_Cristals_15_16"); //Chyba nie mam wyboru.
	Log_CreateTopic	(CH4_RBL_FocusStones, LOG_MISSION);
	Log_SetTopicStatus	(CH4_RBL_FocusStones, LOG_RUNNING);
	B_LogEntry		(CH4_RBL_FocusStones, "Milten twierdzi, �e Gwiezdnymi Kryszta�ami mog� by� Kamienie Ogniskuj�ce, kt�rych magowie u�yli do stworzenia Magicznej Bariery. Jaki� Bezimienny odnalaz� wszystkie kamienie i odda� je Saturasowi.");

	B_LogEntry		(CH4_RBL_Almanach, "Gwiezdne Kryszta�y to nic wi�cej jak Kamienie Ogniskuj�ce, kt�re podobno posiada Saturas. Musz� je zdoby�!");
};

//*********************************************

instance DIA_Milten_Stones (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 9;
	condition	= DIA_Milten_Stones_Condition;
	information	= DIA_Milten_Stones_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Zdoby�em kamienie ogniskuj�ce.";
};                       

FUNC INT DIA_Milten_Stones_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Nefarius_Success))&&(NPC_HasItems(other,Focus_2)>=1)&&(NPC_HasItems(other,Focus_3)>=1)&&(NPC_HasItems(other,Focus_4)>=1)&&(NPC_HasItems(other,Focus_5)>=1)
	{
		return 1;
	};
};

func VOID DIA_Milten_Stones_Info()
{
	AI_Output (other, self,"DIA_Milten_Stones_15_01"); //Zdoby�em kamienie ogniskuj�ce.
	AI_Output (self, other,"DIA_Milten_Stones_02_02"); //To �wietnie, daj mi je.
	B_GiveInvItems (other, self, Focus_2, 1);
	B_GiveInvItems (other, self, Focus_3, 1);
	B_GiveInvItems (other, self, Focus_4, 1);
	B_GiveInvItems (other, self, Focus_5, 1);
	AI_Output (self, other,"DIA_Milten_Stones_02_03"); //A jednak mia�em racj�!
	AI_Output (other, self,"DIA_Milten_Stones_15_04"); //Co si� sta�o?
	AI_Output (self, other,"DIA_Milten_Stones_02_05"); //D�ugo zastanawia�em si� dlaczego Bariera wymkn�a si� nam spod kontroli.
	AI_Output (self, other,"DIA_Milten_Stones_02_06"); //W ko�cu doszed�em do wniosku, �e jaka� tajemnicza si�a musia�a rozsynchronizowa� kryszta�y podczas rytua�u.
	AI_Output (self, other,"DIA_Milten_Stones_02_07"); //Teraz mam na to dow�d. Kryszta�y rzeczywi�cie emituj� energi� na r�nych poziomach.
	AI_Output (self, other,"DIA_Milten_Stones_02_08"); //Je�eli chcemy ich u�y� w rytuale, to musz� by� jak jedno. Daj mi chwil�, musz� si� skoncentrowa�...
	Ai_Wait (self,2.0);	
	AI_PlayAni (self,"T_PRACTICEMAGIC4");
	AI_TurnToNpc 			(self,other);	
	AI_Output (self, other,"DIA_Milten_Stones_02_09"); //I jeszcze tylko to...
	Wld_PlayEffect("spellFX_INCOVATION_GREEN", self, self, 1, 0, DAM_MAGIC, FALSE);
	AI_PlayAni (self,"T_PRACTICEMAGIC2");
	B_WhirlAround		(self, hero);
	AI_Output (self, other,"DIA_Milten_Stones_02_10"); //W porz�dku, kamienie s� ju� zsynchronizowane. Oddaj je Lerenowi i powodzenia podczas rytua�u.
	B_GiveInvItems (self, other, Focus_2, 1);
	B_GiveInvItems (self, other, Focus_3, 1);
	B_GiveInvItems (self, other, Focus_4, 1);
	B_GiveInvItems (self, other, Focus_5, 1);
	AI_Output (other, self,"DIA_Milten_Stones_15_11"); //Dzi�ki, Milten. Bardzo mi pomog�e�.
	AI_Output (self, other,"DIA_Milten_Stones_02_12"); //Ca�a przyjemno�� po mojej stronie, przyjacielu.

	Log_SetTopicStatus	(CH4_RBL_FocusStones, LOG_SUCCESS);
	B_LogEntry		(CH4_RBL_FocusStones, "Milten zsynchronizowa� kryszta�y teraz pulsuj� jak jeden tw�r. Szanse na powodzenie rytua�u zdecydowanie wzros�y.");
};

INSTANCE Dia_Milten_meeting (C_INFO)
{
	npc				= PC_MAGE;
	nr				= 40;
	condition		= Dia_Milten_meeting_Condition;
	information		= Dia_Milten_meeting_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT Dia_Milten_meeting_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Meeting2))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

func void Dia_Milten_meeting_Info()
{
   AI_Output (self, other, "DIA_Milten_Meeting_07_05"); //Zrobimy wszystko, co w naszej mocy.
   
   B_StopProcessInfos(self);
};