var int MOB_REPAIR_1;
var int MOB_REPAIR_2;
var int MOB_REPAIR_3;
var int MOB_REPAIR_4;
var int MOB_REPAIR_5;
const float time_repair_Fingers_Fence = 6;

//TODO: Sher, moglbys poprawic:	(wpis pojawiajacy sie po naprawieniu wszystkich czesci plota
const string Fingers_FenceOK = "'Palisada' R�czki powinna teraz wytrzyma� atak w�ciek�ego dzika.";
const string Fingers_PartOK = "To prz�s�o wygl�da ju� ca�kiem nie�le.";
//Sprawdzenie czy wsztystkie czesci plota sa juz naprawione:
// uzywane w dialogi i przy interakcji z mobami desek
func int MIS_FINGER_REPAIRDONE()
{
	if(MOB_REPAIR_1)&&(MOB_REPAIR_2)&&(MOB_REPAIR_3)&&(MOB_REPAIR_5)
	{
      return true;
   };

   return false;
};

func void Repair_Fingers_Fence(var float time) //dodane przez Adanosa 2012-03-07
{
   AI_Wait(hero, time);

	PutMsg(Fingers_PartOK, "font_default.tga", RGBAToZColor(255,255,255,255), 8*2, "");
	AI_UseMob(self, "REPAIR", -1);

	if(MIS_FINGER_REPAIRDONE())
	{
		B_LogEntry(CH1_Rbl_Fingers, Fingers_FenceOK);
	};
};

func void MIS_FINGER_WOOD_1_S1()
{
	if(!MOB_REPAIR_1)&&(Npc_IsPlayer(self))
	{
      Repair_Fingers_Fence(time_repair_Fingers_Fence);
		MOB_REPAIR_1=TRUE;
	};
};
func void MIS_FINGER_WOOD_2_S1()
{
	if(!MOB_REPAIR_2)&&(Npc_IsPlayer(self))
	{
      Repair_Fingers_Fence(time_repair_Fingers_Fence);
		MOB_REPAIR_2=TRUE;
	};
};
func void MIS_FINGER_WOOD_3_S1()
{
	if(!MOB_REPAIR_3)&&(Npc_IsPlayer(self))
	{
      Repair_Fingers_Fence(time_repair_Fingers_Fence);
		MOB_REPAIR_3=TRUE;
	};
};

//THIS MOB DON'T EXIST NO LONGER
func void MIS_FINGER_WOOD_4_S1()
{
	if(!MOB_REPAIR_4)&&(Npc_IsPlayer(self))
	{
      Repair_Fingers_Fence(8);
		MOB_REPAIR_4=TRUE;
	};
};

func void MIS_FINGER_WOOD_5_S1()
{
	if(!MOB_REPAIR_5)&&(Npc_IsPlayer(self))
	{
		Repair_Fingers_Fence(7);
		MOB_REPAIR_5=TRUE;
	};
};
// **************************************************
// 						 EXIT
// **************************************************

INSTANCE DIA_Fingers_Exit (C_INFO)
{
	npc			= RBL_331_FINGERS;
	nr			= 999;
	condition	= DIA_Fingers_Exit_Condition;
	information	= DIA_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Fingers_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Fingers_Hello (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 1;
	condition		= DIA_Fingers_Hello_Condition;
	information		= DIA_Fingers_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl�dasz na strapionego.";
};

FUNC INT DIA_Fingers_Hello_Condition()
{
	//if(Npc_GetDistToWP(self,"PATH_OR22") < 250)
	if(!FingersCine_Played)
	{
		return true;
	};
};

FUNC VOID DIA_Fingers_Hello_Info()
{
	AI_Output (other, self, "DIA_Fingers_Hello_15_01"); //Wygl�dasz na strapionego.
	AI_Output (self, other, "DIA_Fingers_Hello_11_02"); //Wszystko przez ten ch�do�ony p�ot!
	AI_Output (other, self, "DIA_Fingers_Hello_15_03"); //Nie rozumiem...
	AI_Output (self, other, "DIA_Fingers_Hello_11_04"); //Nie mog� zmru�y� oka przez ten cholerny p�ot nad moim dachem.
	AI_Output (self, other, "DIA_Fingers_Hello_11_05"); //Jaki� idiota spartoli� robot� i dr�gi w ka�dej chwili mog� mi si� zwali� na g�ow�.
	AI_Output (self, other, "DIA_Fingers_Hello_11_06"); //Zaraz... Co to by�o...
	AI_Output (self, other, "DIA_Fingers_Hello_11_07"); //S�ysza�e�?!
	AI_Output (other, self, "DIA_Fingers_Hello_15_08"); //Co?
	AI_Output (self, other, "DIA_Fingers_Hello_11_09"); //Jak to co?! Trzaskaj�ce ogrodzenie!
	//TODO: Prawdopodobnie rutyna do zrobienia, nawet cinematic
	/*************************
Ork trzeba by to zrobi� bo to ciulowo wygl�da. Musi wybiec z chatki R�czka.
*************************/

	AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	Snd_Play("OW_ShipWrekOrBridge_A3");//odg�osy drewna - problem dzwiek odtwarza sie przy rozpoczynaniu funkcji budzis

 	AI_TurnToNpc(fingers,hero);

	//ork chodzi o to, �e oni maj� odbiec od chatki, odwr�ci� si� i spojrze� w jej stron�. a da si� zrobi�, � ejak oni odbiegaj� faktycznie jaka� belka czy deska spadnie z sufitu, czy tam z ogrodzenia na chat�?
};

INSTANCE DIA_Fingers_AfterRun (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 2;
	condition		= DIA_Fingers_AfterRun_Condition;
	information		= DIA_Fingers_AfterRun_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_AfterRun_Condition()
{
	if (FingersCine_Played)
	//&&(Npc_GetDistToWP(self,"RACZKA_SLEEP") > 100)//z�y warunek po cut scenie walenia sie domu raczka nie bedzie blisko wp RACZKA_SLEEP | budzis
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_AfterRun_Info()
{
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_01"); //Niewiele brakowa�o! �eby ca�y ten burdel spad� mi na g�ow�!
	//AI_Output (other, self, "DIA_Fingers_AfterRun_15_02"); //Do czego?
	// widzielismy co sie sta�o wiec po co sie pytac ? budzis
	//AI_Output (self, other, "DIA_Fingers_AfterRun_11_03"); //�eby ca�y ten burdel spad� mi na g�ow�!
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_04"); //Mam ju� tego do��. Wracam do Starego Obozu.
	AI_Output (other, self, "DIA_Fingers_AfterRun_15_05"); //Poczekaj, przecie� to tylko zwyk�y, trzeszcz�cy p�ot.
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_06"); //To nie jest zwyk�y p�ot. On czyha na moje �ycie... Ten p�ot to... pomiot Beliara!
	AI_Output (other, self, "DIA_Fingers_AfterRun_15_07"); //Czy Ty si� dobrze czujesz?
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_08"); //Wczoraj jedna deska spad�a mi na g�ow�... Zaraz o czym to ja m�wi�em...
	AI_Output (other, self, "DIA_Fingers_AfterRun_15_09"); //Pos�uchaj. Pomog� Ci.
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_10"); //Niby jak? Potrafisz odegna� demony �yj�ce w tym p�ocie?
	AI_Output (other, self, "DIA_Fingers_AfterRun_15_11"); //Odprawi� specjalny rytua� za pomoc�... m�otka.
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_12"); //Naprawd�? To mo�e si� uda�... To musi si� uda�!
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_13"); //S�ysz� g�osy... One m�wi�, �e m�ot Innosa zwalczy groz� Beliara!
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_14"); //Id� i zniszcz z�o czyhaj�ce na moje �ycie!
	
   Log_CreateTopic	(CH1_Rbl_Fingers, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_Fingers, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Fingers, "Nie wszyscy z rebeliant�w s� zdrowi na umy�le. R�czka wierzy, �e p�ot nad jego chat� jest op�tany przez demona i czyha na jego �ycie. Obieca�em mu, �e wygnam to 'z�o'. Solidny m�otek i kilka dobitych gwo�dzi powinno za�atwi� spraw�.");
	B_StopProcessInfos	(self);
	//Npc_ExchangeRoutine	(self, "start");// nie tak szybko ? budzis
};

INSTANCE DIA_Fingers_Finish (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 3;
	condition		= DIA_Fingers_Finish_Condition;
	information		= DIA_Fingers_Finish_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_Finish_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_AfterRun))&& (MIS_FINGER_REPAIRDONE())
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Finish_Info()
{
	B_GiveXP(200);
   
	AI_Output (self, other, "DIA_Fingers_Finish_11_01"); //Wr�ci�e�! S�ysz�, �e duchy ju� nie zawodz� nad moj� g�ow�!
	AI_Output (other, self, "DIA_Fingers_Finish_15_02"); //Tak, naprawi�em p�ot... Znaczy odprawi�em rytua� odegnania demon�w z ogrodzenia.
	AI_Output (self, other, "DIA_Fingers_Finish_11_03"); //Moja g�owa... Czuj� spok�j i ukojenie...
	AI_Output (self, other, "DIA_Fingers_Finish_11_04"); //Aaa...
	
   B_FullStop (self);
	AI_PlayAni		(self,	"T_HEADACHE");
	PrintScreen	("Co� si� sta�o z g�ow� R�czki.", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Fingers_FinishEnd (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 4;
	condition		= DIA_Fingers_FinishEnd_Condition;
	information		= DIA_Fingers_FinishEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_FinishEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_Finish))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_FinishEnd_Info()
{
	fingers_trust = TRUE;
	rebel_camp_trust = rebel_camp_trust + 1;
	
   AI_Output (self, other, "DIA_Fingers_FinishEnd_11_01"); //Moja g�owa... Kim Ty jeste�?
	AI_Output (other, self, "DIA_Fingers_FinishEnd_15_02"); //Jestem Rick. Naprawi�em p�ot nad Twoj� chat�.
	AI_Output (self, other, "DIA_Fingers_FinishEnd_11_03"); //Jaki p�ot? O czym Ty bredzisz?
	AI_Output (self, other, "DIA_Fingers_FinishEnd_11_04"); //Kolejny idiota szukaj�cy pretekstu, �eby dosta� w mord�.
	AI_Output (self, other, "DIA_Fingers_FinishEnd_11_05"); //Zejd� mi z oczu, �achmyto!
	
   Log_SetTopicStatus(CH1_Rbl_Fingers, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Fingers, "R�czka chyba wr�ci� do normy. Niestety nie pami�ta, �e naprawi�em mu p�ot. Z drugiej strony wszystkie te prze�ycia sprawi�y, �e odzyska� rozum i Cavalorn powinien wzi�� to pod uwag�.");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "start");//zmiana na normalna rutyne budzis
};

// **************************************************

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 0;
	description		= "Czego mo�esz mnie nauczy�?";
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_FinishEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Czego mo�esz mnie nauczy�?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //To zale�y tylko od tego, co chcia�by� wiedzie�.
   AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Chcia�bym zosta� zr�cznym kieszonkowcem!
   AI_Output (self, other,"DIA_Fingers_Lehrer_05_03"); //No dobrze, mog� ci� zapozna� z tajnikami tej sztuki...

   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "R�czka mo�e mnie nauczy� okradania innych.");
};

INSTANCE DIA_Fingers_Stew (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 12;
	condition		= DIA_Fingers_Stew_Condition;
	information		= DIA_Fingers_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla ciebie potrawk�.";
};

FUNC INT DIA_Fingers_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_Fingers_Stew_15_01"); //Mam dla ciebie potrawk�.
	AI_Output (self, other, "DIA_Fingers_Stew_11_02"); //Daj to paskudztwo. Mo�e tym razem w�osy mi nie powypadaj� od tej breji...
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "R�czka marudzi� co� o wypadaniu w�os�w, ale te� zjad�.");
};

INSTANCE DIA_FINGERS_Spy (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 13;
	condition		= DIA_FINGERS_Spy_Condition;
	information		= DIA_FINGERS_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jeste� tu jedynym z�odziejem?";
};

FUNC INT DIA_FINGERS_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_FINGERS_Spy_Info()
{
	spy_count = spy_count + 1;
	
   AI_Output (other, self, "DIA_FINGERS_Spy_15_01"); //Jeste� tu jedynym z�odziejem?
	AI_Output (self, other, "DIA_FINGERS_Spy_07_02"); //Jedynym z�odziejem w Kolonii Karnej?
	AI_Output (self, other, "DIA_FINGERS_Spy_07_03"); //Nie s�dz�. Ale na pewno jestem jednym z najlepszych w tym fachu.
	AI_Output (other, self, "DIA_FINGERS_Spy_15_04"); //Wcze�niej nale�a�e� do Starego Obozu?
	AI_Output (self, other, "DIA_FINGERS_Spy_07_05"); //Tak jak i wi�kszo�� z rebeliant�w: Cavalorn, Fisk, �wistak i pozostali.
	AI_Output (self, other, "DIA_FINGERS_Spy_07_06"); //Do czego zmierzasz?
	AI_Output (other, self, "DIA_FINGERS_Spy_15_07"); //Zastanawia�em si� co z�odziej mo�e robi� w Obozie Rebeliant�w?
	AI_Output (self, other, "DIA_FINGERS_Spy_07_08"); //Powiedzmy, �e manifestuj� zdrowy rozs�dek. A teraz id� zrobi� co� po�ytecznego.
	
   B_LogEntry		(CH2_Rbl_Spy, "R�czka jest z�odziejem, podobno jednym z najlepszych. Nale�a� te� do Starego Obozu. Nie wiem czy mo�na mu zaufa�...");

	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //Id� porozmawia� z Cavalornem, zdaje si�, �e co� od ciebie chcia�.
		B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawia� z Cavalornem, podobno mnie szuka�.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_FINGERS_Spy1 (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 14;
	condition		= DIA_FINGERS_Spy1_Condition;
	information		= DIA_FINGERS_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "R�ne rzeczy s�yszy si� na Tw�j temat.";
};

FUNC INT DIA_FINGERS_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_FINGERS_Spy1_Info()
{
   AI_Output (other, self, "DIA_FINGERS_Spy1_15_01"); //R�ne rzeczy s�yszy si� na Tw�j temat.
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_02"); //Ju� si� do tego przyzwyczai�em. A co o mnie m�wi�?
	AI_Output (other, self, "DIA_FINGERS_Spy1_15_03"); //Jedni dziwi� si�, �e odszed�e� ze Starego Obozu. Inni nie wierz� w powody, dla kt�rych opu�ci�e� Gomeza.
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_04"); //Mo�e wszyscy maj� racj�.
	AI_Output (other, self, "DIA_FINGERS_Spy1_15_05"); //Co przez to rozumiesz?
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_06"); //Niech b�dzie, powiem Ci prawd�. Przynajmniej sko�cz� si� te idiotyczne plotki na m�j temat.
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_07"); //Rzeczywi�cie nie odszed�em ze Starego Obozu ze strachu przed Gomezem, czy dlatego, �e popar�em tego skaza�ca.
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_08"); //Pow�d by� inny, ale uwa�a�em, �e nikogo to nie powinno obchodzi�.
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_09"); //Jestem z�odziejem, ukrad�em co� czego nie powinno wynosi� si� poza Ob�z i wola�em nie ryzykowa�, �e stra�nicy znajd� przy mnie to co�.
	AI_Output (other, self, "DIA_FINGERS_Spy1_15_10"); //M�g�by� ja�niej?
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_11"); //Nie m�g�bym, a teraz zje�d�aj.

   B_LogEntry		(CH2_Rbl_Spy, "R�czka przyzna� si�, �e ukrad� z Obozu 'co�' i ba� si�, �e stra�nicy mog� go z tym 'czym�' nakry�. Brzmi jeszcze bardziej absurdalnie ni� pozosta�e historie. Mo�e powinienem z niego wydusi� co to za 'co�'?");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Fingers_Fight (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 15;
	condition		= DIA_Fingers_Fight_Condition;
	information		= DIA_Fingers_Fight_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jeszcze z Tob� nie sko�czy�em!";
};

FUNC INT DIA_Fingers_Fight_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_FINGERS_Spy1))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Fight_Info()
{
	AI_Output (other, self, "DIA_Fingers_Fight_15_01"); //Jeszcze z Tob� nie sko�czy�em!
	AI_Output (self, other, "DIA_Fingers_Fight_11_02"); //Ale ja tak. Sam si� o to prosi�e�!
	
   B_StopProcessInfos	(self);
	B_StartAfterDialogFight(self,other,false);
};

INSTANCE DIA_Fingers_AfterFight (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 17;
	condition		= DIA_Fingers_AfterFight_Condition;
	information		= DIA_Fingers_AfterFight_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_AfterFight_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_Fight))&&(Npc_HasItems(hero, ItKe_Gomez_01) >= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_AfterFight_Info()
{
	tony_spy = tony_spy + 1;
	
   AI_Output (self, other, "DIA_Fingers_AfterFight_11_01"); //Ty cholerny z�odzieju!
	AI_Output (other, self, "DIA_Fingers_AfterFight_15_02"); //I kto to m�wi...
	AI_Output (self, other, "DIA_Fingers_AfterFight_11_03"); //Teraz jeste� zadowolony?! To w�a�nie ten klucz ukrad�em z zamku.
	AI_Output (other, self, "DIA_Fingers_AfterFight_15_04"); //Klucz Gomeza... Ty naprawd� jeste� dobry R�czka.
	AI_Output (self, other, "DIA_Fingers_AfterFight_11_05"); //Jestem najlepszy!
	AI_Output (other, self, "DIA_Fingers_AfterFight_15_06"); //Je�eli pozwolisz, zatrzymam ten klucz.
	AI_Output (self, other, "DIA_Fingers_AfterFight_11_07"); //Ud�aw si� nim! Mam nadziej�, �e Gomez przy�apie Ci� na grzebaniu w skrzyniach i upierdoli Ci r�czki przy samej dupie!
	AI_Output (self, other, "DIA_Fingers_AfterFight_11_08"); //Zejd� mi z oczu... z�odzieju!
	
   B_LogEntry		(CH2_Rbl_Spy, "No prosz� R�czka ukrad� Gomezowi klucz do jego prywatnych skrzy�, niez�a robota. Mog� R�czk� spokojnie skre�li� z listy podejrzanych.");

	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Aha. Cavalorn o Ciebie pyta�, nie daj mu czeka�.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta�, powinienem si� z nim zobaczy�.");
	};

	B_StopProcessInfos	(self);
};

//*******************************

INSTANCE DIA_Fingers_NewSword (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 18;
	condition		= DIA_Fingers_NewSword_Condition;
	information		= DIA_Fingers_NewSword_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_NewSword_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_WeaponDev))&&(NPC_HasItems(other,HUN_MW_03)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_NewSword_Info()
{
	B_GiveXP(100);
   
	AI_Output (self, other, "DIA_Fingers_NewSword_11_01"); //A niech to, w�a�nie z�ama�em miecz! Chcia�em go naostrzy�, a to dziadostwo p�k�o.
	AI_Output (other, self, "DIA_Fingers_NewSword_15_02"); //Widz�, �e Fox dobrze wybra�. To tw�j nowy miecz.
	AI_Output (self, other, "DIA_Fingers_NewSword_11_03"); //Cholera nie po to z�ama�em miecz, �eby dosta� nowy!
	AI_Output (other, self, "DIA_Fingers_NewSword_15_04"); //Nie rozumiem...
	AI_Output (self, other, "DIA_Fingers_NewSword_11_05"); //Z�ama�em to zardzewia�e ostrze, �eby mie� dobr� wym�wk� kiedy przyjd� stra�nicy. Przez Ciebie nie wywin� si� od walki!
	AI_Output (other, self, "DIA_Fingers_NewSword_15_06"); //Zawsze mo�esz na mnie liczy�.
	AI_Output (self, other, "DIA_Fingers_NewSword_11_07"); //Bardzo �mieszne. Zejd� mi z oczu!
	
   B_GiveInvItems (other, self, HUN_MW_03, 1);
	B_LogEntry		(CH3_RBL_DelivWeapon, "R�czka niezbyt si� ucieszy� z nowego ostrza.");
	B_StopProcessInfos	(self);
};

/**********************

SIDE QUEST

***********************/

//*******************************

INSTANCE DIA_Fingers_Kuva (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 20;
	condition		= DIA_Fingers_Kuva_Condition;
	information		= DIA_Fingers_Kuva_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno wykupi�e� d�ug Kuvy.";
};

FUNC INT DIA_Fingers_Kuva_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_Kuva))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Kuva_Info()
{
	AI_Output (other, self, "DIA_Fingers_Kuva_15_01"); //Podobno wykupi�e� d�ug Kuvy.
	AI_Output (self, other, "DIA_Fingers_Kuva_11_02"); //Podobno nic nie jest za darmo.
	AI_Output (other, self, "DIA_Fingers_Kuva_15_03"); //Ile?
	AI_Output (self, other, "DIA_Fingers_Kuva_11_04"); //50 bry�ek.
	
   B_LogEntry		(CH1_RBL_Cage, "R�czka powie mi dlaczego wykupi� d�ug Kuvy je�eli zap�ac� mu 50 bry�ek.");
};

//*******************************
INSTANCE DIA_Fingers_KuvaOk (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 21;
	condition		= DIA_Fingers_KuvaOk_Condition;
	information		= DIA_Fingers_KuvaOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam rud�, m�w.";
};

FUNC INT DIA_Fingers_KuvaOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_Kuva))&&(NPC_HasItems(other,ItMiNugget)>=50)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_KuvaOk_Info()
{
	AI_Output (other, self, "DIA_Fingers_KuvaOk_15_01"); //Mam rud�, m�w.
	
   B_GiveInvItems (other, self, ItMiNugget, 50);
	
   AI_Output (self, other, "DIA_Fingers_KuvaOk_11_02"); //Z r�czki do r�czki, �licznie.
	AI_Output (self, other, "DIA_Fingers_KuvaOk_11_03"); //Bry�ki na wykup d�ugu da� mi Tony.
	AI_Output (other, self, "DIA_Fingers_KuvaOk_15_04"); //Nie wiesz dlaczego?
	AI_Output (self, other, "DIA_Fingers_KuvaOk_11_05"); //A co mnie to obchodzi? Ruda to ruda, reszta to nie moja sprawa.
	
   B_LogEntry		(CH1_RBL_Cage, "R�czka twierdzi, �e rud� na wykup d�ugu dosta� od Toniego. Ciekawe...");
};

//*******************************

INSTANCE DIA_Fingers_Martin (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 22;
	condition		= DIA_Fingers_Martin_Condition;
	information		= DIA_Fingers_Martin_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno Martin 'zgubi�' pier�cionek.";
};

FUNC INT DIA_Fingers_Martin_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_FISK_MartinRing))&&(Help_Martin)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Martin_Info()
{
	AI_Output (other, self, "DIA_Fingers_Martin_15_01"); //Podobno Martin 'zgubi�' pier�cionek.
	AI_Output (self, other, "DIA_Fingers_Martin_11_02"); //Musia� by� nieuwa�ny. To si� zdarza.
	AI_Output (other, self, "DIA_Fingers_Martin_15_03"); //A Ty go przypadkiem nie znalaz�e�?
	AI_Output (self, other, "DIA_Fingers_Martin_11_04"); //Nie wiem o czym m�wisz. Spadaj.
	
   B_LogEntry		(CH2_RBL_Feelings, "Oczywi�cie od R�czki nic si� nie dowiedzia�em. Powinienem popyta� w obozie.");
};

//*******************************

INSTANCE DIA_Fingers_WhereRingDigged (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 22;
	condition		= DIA_Fingers_WhereRingDigged_Condition;
	information		= DIA_Fingers_WhereRingDigged_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gdzie zakopa�e� pier�cie�?!";
};

FUNC INT DIA_Fingers_WhereRingDigged_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_Martin))&&(fingers_proofs == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereRingDigged_Info()
{
	AI_Output (other, self, "DIA_Fingers_WhereRingDigged_15_01"); //Gdzie zakopa�e� pier�cie�?!
	AI_Output (self, other, "DIA_Fingers_WhereRingDigged_11_02"); //Sk�d... Nie wiem o czym m�wisz!
	AI_Output (other, self, "DIA_Fingers_WhereRingDigged_15_03"); //To ciekawe, bo Quentin widzia� Ci� jak z kilofem i pier�cieniem wychodzisz z obozu.
	AI_Output (other, self, "DIA_Fingers_WhereRingDigged_15_04"); //Abel powiedzia� mi, �e �ledzi�e� Martina, a Snaf by� �wiadkiem kradzie�y pier�cienia.
	AI_Output (other, self, "DIA_Fingers_WhereRingDigged_15_05"); //M�w, gdzie go zakopa�e�!
	AI_Output (self, other, "DIA_Fingers_WhereRingDigged_11_06"); //Nigdy go nie znajdziesz! To moje skarby! Moje!
	AI_Output (other, self, "DIA_Fingers_WhereRingDigged_15_07"); //To si� jeszcze oka�e.
	
   B_LogEntry		(CH2_RBL_Feelings, "R�czka przyzna� si� do kradzie�y, nie zdradzi� jednak miejsca ukrycia pier�cienia. Musz� rozejrze� si� po Kolonii, mo�e b�d� mia� szcz�cie i znajd� jego �upy.");
	B_StopProcessInfos	(self);
};

/*****************************
Ork skrytka niech b�dzie w jaskini tam gdzie nek le�a�. Oczywi�cie skarby mo�na odkopa� tylko kilofem.
A tu lista item�w:
ItMi_Martin_Ring - pier�cie� Martina [questowy]
troch� rudy,
kilka pier�cieni i amulat�w, mo�e jaki� puchar, skrzynka z klejnotami
jaki� nienajgorszy przepis

Mo�na kopa� od pocz�tku gry, pier�cie� b�dzie mo�na odda� i tak po zrobieniu zadania, bo sk�d gracz ma wiedzie� do kogo ten ring nale�y ;)

********************************/

/***************************
****************************/

INSTANCE DIA_Fingers_Task (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 333;
	condition		= DIA_Fingers_Task_Condition;
	information		= DIA_Fingers_Task_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_Task_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_AfterFight) && Npc_KnowsInfo (hero, DIA_Cavalorn_SpyEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Task_Info()
{
	AI_Output (self, other, "DIA_Fingers_Task_11_01"); //Zaczekaj cwaniaczku!
	AI_Output (other, self, "DIA_Fingers_Task_15_02"); //Masz jaki� problem?
	AI_Output (self, other, "DIA_Fingers_Task_11_03"); //Nie taki jak my�lisz. Nie chodzi o Ciebie.
	AI_Output (self, other, "DIA_Fingers_Task_11_04"); //Chcia�bym co� odzyska�, ale to wymaga� b�dzie zr�czno�ci i sprytu. Co Ty na to?
};

//*************************************

INSTANCE DIA_Fingers_TaskOk (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 334;
	condition		= DIA_Fingers_TaskOk_Condition;
	information		= DIA_Fingers_TaskOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "M�w o co chodzi.";
};

FUNC INT DIA_Fingers_TaskOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_Task))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_TaskOk_Info()
{
	AI_Output (other, self, "DIA_Fingers_TaskOk_15_01"); //M�w o co chodzi.
	AI_Output (self, other, "DIA_Fingers_TaskOk_11_02"); //Jednak masz jaja. To �wietnie.
	AI_Output (self, other, "DIA_Fingers_TaskOk_11_03"); //Musia�em do�� szybko opu�ci� Stary Ob�z. Zostawi�em w skrzyni co� na czym bardzo mi zale�y. Chc� to odzyska�.
	AI_Output (other, self, "DIA_Fingers_TaskOk_15_04"); //Co to za przedmiot?
	AI_Output (self, other, "DIA_Fingers_TaskOk_11_05"); //Zorientujesz si�, jak go znajdziesz.
	AI_Output (other, self, "DIA_Fingers_TaskOk_15_06"); //Gdzie znajd� twoj� chat�?
	AI_Output (self, other, "DIA_Fingers_TaskOk_11_07"); //W Starym Obozie, na lewo od wej�cia do zamku. Powodzenia z�odzieju.

	Mob_CreateItems ("OC_CHEST_FINGERS", Fingers_Lockpick, 1);

	Log_CreateTopic	(CH3_Rbl_Suveinr, LOG_MISSION);
	Log_SetTopicStatus	(CH3_Rbl_Suveinr, LOG_RUNNING);
	B_LogEntry		(CH3_Rbl_Suveinr, "R�czka da� mi dziwne zlecenie. Mam odzyska� z jego chaty w Starym Obozie jaki� przedmiot, kt�ry do niego nale�a�. Tylko co to niby ma by�?");
};

//*************************************

INSTANCE DIA_Fingers_TaskOk1 (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 335;
	condition		= DIA_Fingers_TaskOk1_Condition;
	information		= DIA_Fingers_TaskOk1_Info;
	permanent		= 0;
	important		= 0;
	description		= "To ten wytrych zostawi�e� w obozie?";
};

FUNC INT DIA_Fingers_TaskOk1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_TaskOk))&&(NPC_HasItems(other, Fingers_Lockpick)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_TaskOk1_Info()
{
	AI_Output (other, self, "DIA_Fingers_TaskOk1_15_01"); //To ten wytrych zostawi�e� w obozie?
	AI_Output (self, other, "DIA_Fingers_TaskOk1_11_02"); //Tak! Daj mi go!
	
   B_GiveInvItems (other, self, Fingers_Lockpick, 1);
	
   AI_Output (other, self, "DIA_Fingers_TaskOk1_15_03"); //Brak podzi�kowania jako� prze�yj�, ale wyrazami uznania w formie rudy nie pogardz�.
	AI_Output (self, other, "DIA_Fingers_TaskOk1_11_04"); //We� te bry�ki i zje�d�aj.
	
   CreateInvItems (self, ItMiNugget,100);
	B_GiveInvItems (self, other, ItMiNugget, 100);
	
   AI_Output (other, self, "DIA_Fingers_TaskOk1_15_05"); //Ach ta ludzka wdzi�czno��...
	
   Log_SetTopicStatus	(CH3_Rbl_Suveinr, LOG_SUCCESS);
	B_LogEntry		(CH3_Rbl_Suveinr, "R�czka odzyska� sw�j suwenir - okaza� si� nim solidny wytrych.");
};
