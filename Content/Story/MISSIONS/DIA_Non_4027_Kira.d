// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Kira_EXIT(C_INFO)
{
	npc			= Non_4027_Kira;
	nr			= 999;
	condition			= Info_Kira_EXIT_Condition;
	information			= Info_Kira_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Kira_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Kira_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Kira_Hello (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 1;
	condition		= Info_Kira_Hello_Condition;
	information		= Info_Kira_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Co tutaj robi kobieta?!";
};                       

FUNC INT Info_Kira_Hello_Condition()
{	
	if (Korth_ok)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Hello_Info()
{	
	AI_Output (other, self,"Info_Kira_Hello_15_00"); //Co tutaj robi kobieta?!
	AI_Output (self, other,"Info_Kira_Hello_16_01"); //Myje gary, sprz�ta i przynosi piwko do ogniska znu�onym wojownikom.
	AI_Output (other, self,"Info_Kira_Hello_15_03"); //Nie chcia�em Ci� urazi�, po prostu trudno mi uwierzy� w to co widz�.
	AI_Output (self, other,"Info_Kira_Hello_16_04"); //Lepiej si� do tego przyzwyczaj, ogierze.
};

// ************************************************************

INSTANCE Info_Kira_Camp (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 3;
	condition		= Info_Kira_Camp_Condition;
	information		= Info_Kira_Camp_Info;
	important		= 0;
	permanent		= 0;
	description 	= "To ty jeste� tu... szefem?";
};                       

FUNC INT Info_Kira_Camp_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kira_Hello))&&(Npc_KnowsInfo (hero, DIA_Snow_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Camp_Info()
{	
	AI_Output (other, self,"Info_Kira_Camp_15_00"); //To ty jeste� tu... szefem?
	AI_Output (self, other,"Info_Kira_Camp_16_01"); //Masz z tym jaki� problem?
	AI_Output (other, self,"Info_Kira_Camp_15_03"); //Bynajmniej, tylko co� mi nie pasuje. Kobieta m�wi tym wszystkim zakapiorom, co maj� robi�. Niesamowite...
	AI_Output (self, other,"Info_Kira_Camp_16_04"); //Niesamowita to jest Twoja bezczelno��. Uwa�aj, �ebym Ci� nie dosiad�a ogierze, bo wtedy b�dziesz skomla� i b�aga� o lito��!
};

// ************************************************************

INSTANCE Info_Kira_Ork (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 4;
	condition		= Info_Kira_Ork_Condition;
	information		= Info_Kira_Ork_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Rozmawia�em z jakim� orkiem.";
};                       

FUNC INT Info_Kira_Ork_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kira_Hello))&&(Npc_KnowsInfo (hero, DIA_Kron_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Ork_Info()
{	
	AI_Output (other, self,"Info_Kira_Ork_15_00"); //Rozmawia�em z jakim� orkiem.
	AI_Output (self, other,"Info_Kira_Ork_16_01"); //Kron do��czy� do nas z w�asnej woli. Wbrew pozorom pod t� g�upi� min� kryje si� spora inteligencja.
	AI_Output (other, self,"Info_Kira_Ork_15_02"); //My�la�em, �e orkowie to bezm�zgie potwory, kt�re atakuj� wszystko w zasi�gu wzroku.
	AI_Output (self, other,"Info_Kira_Ork_16_03"); //Nie wszyscy tacy s�. Tam sk�d pochodz� orkowie w�adaj� sporym mocarstwem.
	AI_Output (self, other,"Info_Kira_Ork_16_04"); //S� te� wspania�ymi wojownikami. Nie radz� prowokowa� Krona, bo mo�esz gorzko tego po�a�owa�.
};

// ************************************************************

INSTANCE Info_Kira_Thangor (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 5;
	condition		= Info_Kira_Thangor_Condition;
	information		= Info_Kira_Thangor_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Ten Tablor to niemowa?";
};                       

FUNC INT Info_Kira_Thangor_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kira_Hello))&&(Npc_KnowsInfo (hero, DIA_Tablor_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Thangor_Info()
{	
	AI_Output (other, self,"Info_Kira_Thangor_15_00"); //Ten Tablor to niemowa?
	AI_Output (self, other,"Info_Kira_Thangor_16_01"); //Tablor rozmawia tylko z tymi, kt�rych szanuje, lub kt�rzy pokonaj� go w walce.
	AI_Output (other, self,"Info_Kira_Thangor_15_03"); //Dziwne. Czyli, �eby z nim pogada� musz� go st�uc?
	AI_Output (self, other,"Info_Kira_Thangor_16_04"); //Albo udowodni�, �e zas�u�y�e� na miano wojownika, co nie jest takie proste.
	AI_Output (other, self,"Info_Kira_Thangor_15_05"); //Rozumiem. Czyli zwr�ci na mnie uwag� jak kogo� st�uk�?
	AI_Output (self, other,"Info_Kira_Thangor_16_06"); //By� mo�e, ale musia�by� pokona� niez�ego wojownika, �eby Tablor si� tym zainteresowa�.
};

var int kira_quest;

// ************************************************************

INSTANCE Info_Kira_What (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 2;
	condition		= Info_Kira_What_Condition;
	information		= Info_Kira_What_Info;
	important		= 1;
	permanent		= 1;
	description 	= "Co do sojuszu...";
};                       

FUNC INT Info_Kira_What_Condition()
{	
	//TODO: statement
	if (Npc_KnowsInfo (hero, Info_Kira_Hello))&&(Korth_ok==TRUE)&&(TH_trust<1)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_What_Info()
{	
	if (kira_quest == FALSE)
	{
		kira_quest = TRUE;
		Info_Kira_What.important = 0;
      
		AI_Output (self, other,"Info_Kira_What_16_00"); //Skoro Korth ju� Ci� tu wpu�ci�, to m�w, czego chcesz.
		AI_Output (other, self,"Info_Kira_What_15_01"); //Przysy�a mnie Cavalorn. Rebelianci szukaj� sojusznik�w w nadchodz�cej walce ze Starym Obozem.
		AI_Output (self, other,"Info_Kira_What_16_02"); //I przys�a� tu Ciebie? Czy Cavalorn chcia� nas obrazi�?
		AI_Output (other, self,"Info_Kira_What_15_03"); //Dlaczego tak uwa�asz?
		AI_Output (self, other,"Info_Kira_What_16_04"); //Kto� kto pragnie sojuszu i wysy�a z propozycj� nieopierzonego kurczaka, nie zas�uguje na nasz szacunek.
		AI_Output (other, self,"Info_Kira_What_15_05"); //Nie jestem taki nieopierzony, jak Ci si� wydaje.
		AI_Output (self, other,"Info_Kira_What_16_06"); //To si� dopiero oka�e. A dlaczego Cavalorn sam tu nie przyby�?
		AI_Output (other, self,"Info_Kira_What_15_07"); //Cavalorn jest przyw�dc� obozu, kt�ry przygotowuje si� do walki. Ma sporo na g�owie...
		AI_Output (self, other,"Info_Kira_What_16_08"); //W to nie w�tpi�...
		AI_Output (self, other,"Info_Kira_What_16_09"); //Hmm, chcecie sojuszu?
		AI_PlayAni(other,"T_YES");
		AI_Output (self, other,"Info_Kira_What_16_10"); //Nie interesuj� nas problemy innych oboz�w. Dbamy tylko o w�asn� sk�r� i o trofea, kt�re zdobywamy.
		AI_Output (self, other,"Info_Kira_What_16_11"); //Kiedy upadnie bariera odejdziemy st�d, jako bardzo bogaci ludzie. Dlaczego mieliby�my zaprz�ta� sobie g�ow� waszymi problemami?
		AI_Output (other, self,"Info_Kira_What_15_12"); //A jak� masz pewno��, �e Gomez i was nie zaatakuje?
		AI_Output (self, other,"Info_Kira_What_16_13"); //To proste, nie mamy rudy. Jedyne co posiadamy to trofea zabitych zwierz�t.
		AI_Output (other, self,"Info_Kira_What_15_14"); //To sk�d pewno��, �e Gomez nie b�dzie chcia� zgarn�� trofe�w? Maj� spor� warto��...
		AI_Output (self, other,"Info_Kira_What_16_15"); //Niech tylko spr�buje po nie si�gn��, to odr�bi� mu �apska przy samej dupie!
		AI_Output (other, self,"Info_Kira_What_15_16"); //Wszystkich nie zabijecie. Wielu ze sob� zabierzecie, ale Gomez ma ca�� armi� stra�nik�w i cieni.
		AI_Output (self, other,"Info_Kira_What_16_17"); //Nie podoba mi si� to, co m�wisz. 
		AI_Output (other, self,"Info_Kira_What_15_18"); //Doskonale wiesz, �e mam racj�. Wyb�r nale�y do was.
		AI_Output (other, self,"Info_Kira_What_15_19"); //Je�eli staniecie u naszego boku w walce z Gomezem, wszyscy b�dziemy mie� wi�ksz� szans� na wygran�.
		AI_Output (self, other,"Info_Kira_What_16_20"); //Nie znam bojowej warto�ci waszych ludzi. Sk�d mam wiedzie�, czy to nie banda tch�rzy, kt�rzy uciekn� na widok stra�nik�w?
		AI_Output (other, self,"Info_Kira_What_15_21"); //Sprawd� nas.
		AI_Output (self, other,"Info_Kira_What_16_22"); //Hmm, tak te� i zrobi�. To od Ciebie zale�e� b�dzie moja decyzja.
		AI_Output (self, other,"Info_Kira_What_16_23"); //Je�eli udowodnisz nam, �e jeste� godnym wojownikiem, zastanowi� si� nad sojuszem.
		AI_Output (self, other,"Info_Kira_What_16_24"); //Je�eli oka�e si�, �e nie podo�asz wyzwaniom, rzuc� Ci� trollom na po�arcie.
		AI_Output (self, other,"Info_Kira_What_16_25"); //Co Ty na to ogierze?
	}
	else
	{
		AI_Output (other, self,"Info_Kira_What_15_26"); //Co do sojuszu...
		AI_Output (self, other,"Info_Kira_What_16_27"); //Podj��e� decyzj�?
	};
	
	Info_ClearChoices (Info_Kira_What);

	Info_AddChoice (Info_Kira_What, "Musz� si� zastanowi�.", Info_Kira_What_No);
	Info_AddChoice (Info_Kira_What, "Zgoda.", Info_Kira_What_Yes);	
};

FUNC VOID Info_Kira_What_Yes()
{
	TH_trust  = 1;	
   
	AI_Output (other,self,"Info_Kira_What_Yes_Info_15_01"); //Zgoda.
	AI_Output (self, other,"Info_Kira_What_Yes_Info_16_02"); //Zaczynasz mi si� podoba� coraz bardziej, ogierze.
	AI_Output (self, other,"Info_Kira_What_Yes_Info_16_03"); //Zanim podejm� decyzj�, przekonaj do siebie ch�opak�w.
	AI_Output (self, other,"Info_Kira_What_Yes_Info_16_04"); //Jak Ci si� powiedzie, to czeka Ci� prawdziwy sprawdzian m�stwa.
	AI_Output (other,self,"Info_Kira_What_Yes_Info_15_05"); //Zrobi�, co w mojej mocy.
	AI_Output (self, other,"Info_Kira_What_Yes_Info_16_06"); //Tylko nie daj si� posieka�. By�oby szkoda takiego przystojniaka...
	
	B_LogEntry		(CH2_Rbl_BlackTroll, "Musz� zdoby� szacunek �owc�w, �eby dowie�� swej warto�ci jak i warto�ci ca�ego obozu rebeliant�w. Wszystko w moich r�kach.");
	Log_CreateTopic	(CH2_TRL_Quest, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Quest, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Quest, "Przyw�dczyni �owc�w trolli powiedzia�a mi, �e przemy�li sojusz, je�eli udowodni�, i� rebelianci b�d� godnymi sojusznikami. Musz� dowie�� swego m�stwa i przydatno�ci. Czeka mnie sporo pr�b w obozie �owc�w trolli.");
	
	B_StopProcessInfos	(self);
};

// ------------------2----------------

FUNC VOID Info_Kira_What_No()
{
	AI_Output (other,self,"Info_Kira_What_No_Info_15_01"); //Musz� si� zastanowi�.
	AI_Output (self, other,"Info_Kira_What_No_Info_16_02"); //Po�piesz si�, Gomez nie b�dzie czeka� wiecznie.
	
   Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
};


/********************************

Seksior z Kir�

********************************/

FUNC VOID B_KiraSex()
{
	PlayVideo("LOVESCENE.BIK");
	PrintScreen	("Kira prawie Ci� wyko�czy�a!", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_HITPOINTS] = 25;
	B_StopProcessInfos	(self);
};

func void B_Kira_sojusz(var int exp)
{
   TH_trust=10;
	B_GiveXP (exp);
      
   AI_Output (self, other,"Info_Kira_After_16_02"); //Musisz by� bardzo zdeterminowany...
	AI_Output (other, self,"Info_Kira_After_15_03"); //Zale�y nam na sojuszu, Kira. Gomez jest zagro�eniem dla ca�ej Kolonii.
	AI_Output (other, self,"Info_Kira_After_15_04"); //Pr�dzej b�d� p�niej was te� czeka walka. Je�eli po��czymy si�y, mamy szans� uwolni� �wiat od kolejnego szale�ca.
	AI_Output (self, other,"Info_Kira_After_16_05"); //Ju� dawno nie s�ysza�am tak kwiecistej mowy... Zrobi�e� mi apetyt ogierze.
	AI_Output (other, self,"Info_Kira_After_15_06"); //Hmm, apetyt na co?
	AI_Output (self, other,"Info_Kira_After_16_07"); //Na Ciebie m�j drogi...
	AI_Output (other, self,"Info_Kira_After_15_08"); //Ju� dawno nie by�em z kobiet�...
	AI_Output (self, other,"Info_Kira_After_16_09"); //Ja te�, ale wol� m�czyzn. �ci�gaj �achy ogierze!
		
   Log_SetTopicStatus	(CH2_TRL_Quest, LOG_SUCCESS);
	B_LogEntry		(CH2_TRL_Quest, "Zdoby�em zaufanie wszystkich �owc�w - Kira by�a pod wra�eniem. Nawet nie wiem, kiedy zdar�a ze mnie ubranie i ma�o mnie nie zajecha�a na �mier�... Rozumiem ju� dlaczego �owcy tak si� jej boj�.");
};
// ************************************************************

INSTANCE Info_Kira_After (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 3;
	condition		= Info_Kira_After_Condition;
	information		= Info_Kira_After_Info;
	important		= 0;
	permanent		= 1;
	description 	= "Co m�wi� o mnie Twoi... m�czy�ni?";
};                       

FUNC INT Info_Kira_After_Condition()
{	
	if (TH_trust >= 1)&&(TH_trust<9)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_After_Info()
{	
	AI_Output (other, self,"Info_Kira_After_15_00"); //Co m�wi� o mnie Twoi... m�czy�ni?
   
	if (TH_trust == 8)
	{
		AI_Output (self, other,"Info_Kira_After_16_01"); //Niesamowite, zdo�a�e� przekona� wszystkich!
		
      B_Kira_sojusz(1500);
	}
	else if (TH_trust >= 5)
	{
		AI_Output (self, other,"Info_Kira_After_16_12"); //Zdo�a�e� przekona� prawie wszystkich!
      
      B_Kira_sojusz(1000);
	}	
	else if (TH_trust > 1)&&(TH_trust < 6)
	{
		AI_Output (self, other,"Info_Kira_After_16_10"); //Niekt�rzy ju� si� na Tobie poznali, ale musisz zdoby� szacunek wszystkich.
		B_StopProcessInfos	(self);
	}
	else if (TH_trust == 1)
	{
		AI_Output (self, other,"Info_Kira_After_16_11"); //Nie dra�nij mnie ogierze. Porozmawiaj z ch�opakami i zdob�d� ich szacunek.
		B_StopProcessInfos	(self);
	};
};

// ************************************************************

INSTANCE Info_Kira_AfterSex (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 4;
	condition		= Info_Kira_AfterSex_Condition;
	information		= Info_Kira_AfterSex_Info;
	important		= 1;
	permanent		= 0;
	description 	= "...";
};                       

FUNC INT Info_Kira_AfterSex_Condition()
{	
	if (TH_trust >= 10)//kira_trail can be various - orc
	{
		return 1;
	};
};

FUNC VOID Info_Kira_AfterSex_Info()
{	
   B_KiraSex ();
   
	AI_Output (self, other,"Info_Kira_AfterSex_16_01"); //Nie zawiod�am si� na Tobie, ogierze.
	AI_Output (other, self,"Info_Kira_AfterSex_15_02"); //To by�o... dog��bne doznanie.
	AI_Output (self, other,"Info_Kira_AfterSex_16_03"); //Rzeczywi�cie silny z Ciebie skurczybyk. Ju� dawno si� tak nie zmacha�am.
	AI_Output (self, other,"Info_Kira_AfterSex_16_04"); //Pozosta�a jednak ostatnia pr�ba.
	AI_Output (other, self,"Info_Kira_AfterSex_15_05"); //Sprostam jej, jak wszystkim poprzednim.
	AI_Output (self, other,"Info_Kira_AfterSex_16_06"); //To si� dopiero oka�e.
	AI_Output (self, other,"Info_Kira_AfterSex_16_07"); //�eby narodzi� si� sojusz, musisz sta� si� jednym z nas.
	AI_Output (other, self,"Info_Kira_AfterSex_15_08"); //Co powinienem zrobi�?
	AI_Output (self, other,"Info_Kira_AfterSex_16_09"); //Inicjacja jest prosta. Wyruszysz z nami na polowanie.
	AI_Output (self, other,"Info_Kira_AfterSex_16_10"); //Nie b�dzie to jednak zwyczajny troll.
	AI_Output (self, other,"Info_Kira_AfterSex_16_11"); //W Kolonii pojawi� si� czarny troll.
	AI_Output (other, self,"Info_Kira_AfterSex_15_12"); //My�la�em, �e to tylko legendy...
	AI_Output (self, other,"Info_Kira_AfterSex_16_13"); //Na szcz�cie dla nas te legendy okaza�y si� prawd�.
	AI_Output (self, other,"Info_Kira_AfterSex_16_14"); //Wyruszymy, jak tylko b�dziesz got�w.
	
   Log_CreateTopic	(CH2_TRL_BlackMotherFucker, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_BlackMotherFucker, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_BlackMotherFucker, "Czeka mnie ostateczna pr�ba - musz� towarzyszy� �owcom w polowaniu na czarnego trolla. Musz� powiedzie� Kirze, kiedy b�d� got�w.");
};

// ************************************************************

INSTANCE Info_Kira_Hunt (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 5;
	condition		= Info_Kira_Hunt_Condition;
	information		= Info_Kira_Hunt_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Jestem got�w.";
};                       

FUNC INT Info_Kira_Hunt_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kira_AfterSex))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Hunt_Info()
{	
	AI_Output (other, self,"Info_Kira_Hunt_15_02"); //Jestem got�w.
	AI_Output (self, other,"Info_Kira_Hunt_16_01"); //To �wietnie.

	/************************************
	Mo�e lepiej by�oby z tego zrobi� funkcj�? Zr�b jak uwa�asz ork
	************************************/

	var C_NPC tab; tab = Hlp_GetNpc(Non_4020_Tablor);
	var C_NPC buk; buk = Hlp_GetNpc(Non_4021_Bukhart);
	var C_NPC pos; pos = Hlp_GetNpc(Non_4022_Postronek);
	var C_NPC kor; kor = Hlp_GetNpc(Non_4023_Korth);
	var C_NPC sno; sno = Hlp_GetNpc(Non_4024_Snow);
	var C_NPC kro; kro = Hlp_GetNpc(Non_4025_Kron);
	var C_NPC nik; nik = Hlp_GetNpc(Non_4026_Nikolas);

	AI_TurnToNpc 			(self,tab);	
	AI_Output (self, other,"Info_Kira_Hunt_16_02"); //Czas ruszy� na �owy.
	
   B_FullStop(tab);
	B_FullStop(buk);
	B_FullStop(pos);
	B_FullStop(kor);
	B_FullStop(sno);
	B_FullStop(kro);
	B_FullStop(nik);
	AI_TurnToNpc(tab, self);
	AI_TurnToNpc(buk, self);
	AI_TurnToNpc(pos, self);
	AI_TurnToNpc(kor, self);
	AI_TurnToNpc(sno, self);
	AI_TurnToNpc(kro, self);
	AI_TurnToNpc(nik, self);
   
	AI_Output (self, other,"Info_Kira_Hunt_16_03"); //Wyci�gnijcie bro�, ch�opcy!
   
	tab.attribute[ATR_HITPOINTS] = tab.attribute[ATR_HITPOINTS_MAX];
	buk.attribute[ATR_HITPOINTS] = buk.attribute[ATR_HITPOINTS_MAX];
	pos.attribute[ATR_HITPOINTS] = pos.attribute[ATR_HITPOINTS_MAX];
	kor.attribute[ATR_HITPOINTS] = kor.attribute[ATR_HITPOINTS_MAX];
	sno.attribute[ATR_HITPOINTS] = sno.attribute[ATR_HITPOINTS_MAX];
	kro.attribute[ATR_HITPOINTS] = kro.attribute[ATR_HITPOINTS_MAX];
	nik.attribute[ATR_HITPOINTS] = nik.attribute[ATR_HITPOINTS_MAX];
   
	AI_Output (self, other,"Info_Kira_Hunt_16_04"); //Idziemy zabija�!

	/*******************************
	Chodzi o to, �eby potrz�sneli broni�, zasalutowali, etc - ta animacja z kusz� by�aby chyba lepsza, ale nie chce mi si� jej szuka�, zmie� jak uwa�asz Ork
	*******************************/
	//A dla mnie to niepotrzebne jest ;p

	// 	AI_PlayAni 		(tab, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(tab, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(buk, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(buk, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(pos, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(pos, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(kor, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(kor, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(sno, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(sno, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(kro, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(kro, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(nik, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(nik, "T_CLAPHANDS_2_STAND");

	Party_AddNpc(self);
	Party_AddNpc(tab);
	Party_AddNpc(buk);
	Party_AddNpc(pos);
	Party_AddNpc(kor);
	Party_AddNpc(sno);
	Party_AddNpc(kro);
	Party_AddNpc(nik);
	Npc_ClearAIQueue 			(self);
	Npc_ClearAIQueue 			(tab);
	Npc_ClearAIQueue 			(buk);
	Npc_ClearAIQueue 			(pos);
	Npc_ClearAIQueue 			(kor);
	Npc_ClearAIQueue 			(sno);
	Npc_ClearAIQueue 			(kro);
	Npc_ClearAIQueue 			(nik);

	/*************************
	Maj� zaprowadzi� Dicka do orka, mo�e da� sprawdzanie te� czy dick nie jest za daleko jak z diego w NK w kolonii? Zr�b to jak uwa�asz.
	**************************/

	B_LogEntry		(CH2_TRL_BlackMotherFucker, "Ruszyli�my zapolowa� na czarnego trolla.");
	B_StopProcessInfos	(self);

	Npc_ExchangeRoutine(self,"HUNT");
	Npc_ExchangeRoutine(tab,"HUNT");
	Npc_ExchangeRoutine(buk,"HUNT");
	Npc_ExchangeRoutine(pos,"HUNT");
	Npc_ExchangeRoutine(kor,"HUNT");
	Npc_ExchangeRoutine(sno,"HUNT");
	Npc_ExchangeRoutine(kro,"HUNT");
	Npc_ExchangeRoutine(nik,"HUNT");
	Wld_InsertNpc				(Kira_BTroll,"LOCATION_12_14"); //  
	Wld_InsertNpc				(YoungTroll,"SPAWN_BLACKGOBBO_SHRINKSCROLL"); //  

	Npc_SetAttitude(self,ATT_FRIENDLY);
	Npc_SetAttitude(tab,ATT_FRIENDLY);
	Npc_SetAttitude(buk,ATT_FRIENDLY);
	Npc_SetAttitude(pos,ATT_FRIENDLY);
	Npc_SetAttitude(kor,ATT_FRIENDLY);
	Npc_SetAttitude(sno,ATT_FRIENDLY);
	Npc_SetAttitude(kro,ATT_FRIENDLY);
	Npc_SetAttitude(nik,ATT_FRIENDLY);	
	
	Npc_SetTempAttitude(self,ATT_FRIENDLY);
	Npc_SetTempAttitude(tab,ATT_FRIENDLY);
	Npc_SetTempAttitude(buk,ATT_FRIENDLY);
	Npc_SetTempAttitude(pos,ATT_FRIENDLY);
	Npc_SetTempAttitude(kor,ATT_FRIENDLY);
	Npc_SetTempAttitude(sno,ATT_FRIENDLY);
	Npc_SetTempAttitude(kro,ATT_FRIENDLY);
	Npc_SetTempAttitude(nik,ATT_FRIENDLY);		
};

// ************************************************************

INSTANCE Info_Kira_HuntNear (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 6;
	condition		= Info_Kira_HuntNear_Condition;
	information		= Info_Kira_HuntNear_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kira_HuntNear_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kira_Hunt))&&(Npc_GetDistToWP (self,"OW_PATH_190") < 500 )//wp w pobli�u trola
	{
		return 1;
	};
};

FUNC VOID Info_Kira_HuntNear_Info()
{	
	//punkt zborny przed walk�
	AI_Output (self, other,"Info_Kira_HuntNear_16_01"); //Jeste�my ju� blisko, czuj� od�r �mierci.
	AI_Output (other,self,"Info_Kira_HuntNear_15_02"); //Jestem got�w do walki...

	B_LogEntry		(CH2_TRL_BlackMotherFucker, "Czu� ju� smr�d bestii - my albo ona!");

	B_StopProcessInfos	(self);

	/******************
	Nie dawa�em nie�miertelno�ci �owcom, bo nie wiem czy tak ma by� - jak chcesz to daj to teraz, po to te� jest punkt zborny

	*******************/

	Npc_ExchangeRoutine(self,"HUNT2");
};

// ************************************************************

INSTANCE Info_Kira_HuntFinish (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 7;
	condition		= Info_Kira_HuntFinish_Condition;
	information		= Info_Kira_HuntFinish_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Kira_HuntFinish_Condition()
{	
	var c_npc btroll;
	btroll=Hlp_GetNpc(Kira_BTroll);
   
	if (Npc_KnowsInfo (hero, Info_Kira_HuntNear))&&(Npc_IsDead(btroll))&& (Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_HuntFinish_Info()
{	
	var C_NPC tab; tab = Hlp_GetNpc(Non_4020_Tablor);
	var C_NPC buk; buk = Hlp_GetNpc(Non_4021_Bukhart);
	var C_NPC pos; pos = Hlp_GetNpc(Non_4022_Postronek);
	var C_NPC kor; kor = Hlp_GetNpc(Non_4023_Korth);
	var C_NPC sno; sno = Hlp_GetNpc(Non_4024_Snow);
	var C_NPC kro; kro = Hlp_GetNpc(Non_4025_Kron);
	var C_NPC nik; nik = Hlp_GetNpc(Non_4026_Nikolas);
	var c_npc btroll;
	btroll=Hlp_GetNpc(Kira_BTroll);

	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"Info_Kira_HuntFinish_16_00"); //Ju� po wszystkim, nie by�o �atwo, ale bestia nie �yje.
	AI_Output (self, other,"Info_Kira_HuntFinish_16_01"); //Nale�y Ci si� nagroda, zaczekaj na mnie.
	B_StopProcessInfos	(self);

	AI_GotoNpc(self,btroll);
	AI_PlayAni(self, "T_PLUNDER");
	AI_GotoNpc(self,other);
	B_ExchangeRoutine(tab,"START");
	B_ExchangeRoutine(buk,"START");
	B_ExchangeRoutine(pos,"START");
	B_ExchangeRoutine(kor,"PreStart");
	B_ExchangeRoutine(sno,"START");
	B_ExchangeRoutine(kro,"START");
	B_ExchangeRoutine(nik,"START");
	
	//fix:
	Party_RemoveNpc(self);
	Party_RemoveNpc(tab);
	Party_RemoveNpc(buk);
	Party_RemoveNpc(pos);
	Party_RemoveNpc(kor);
	Party_RemoveNpc(sno);
	Party_RemoveNpc(kro);
	Party_RemoveNpc(nik);	
};

// ************************************************************

INSTANCE Info_Kira_HuntFinalEnd (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 8;
	condition		= Info_Kira_FinalEnd_Condition;
	information		= Info_Kira_FinalEnd_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Kira_FinalEnd_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_KnowsInfo (hero, Info_Kira_HuntFinish))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_FinalEnd_Info()
{	
	B_GiveXP (1000);
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   AI_Output (self, other,"Info_Kira_FinalEnd_16_01"); //Sk�ra czarnego trolla nale�y do Ciebie.
	AI_Output (other, self,"Info_Kira_FinalEnd_15_02"); //To dla mnie... zaszczyt.
	AI_Output (self, other,"Info_Kira_FinalEnd_16_03"); //Nie udawaj fa�szywej skromno�ci, nale�y Ci si�.
	
   CreateInvItems (self, ItAt_BlackTroSkin,1); 
	B_GiveInvItems (self, other, ItAt_BlackTroSkin, 1);
	
   AI_Output (self, other,"Info_Kira_FinalEnd_16_04"); //Odt�d mo�esz si� uwa�a� za jednego z nas.
	AI_Output (self, other,"Info_Kira_FinalEnd_16_05"); //Z tej sk�ry mo�na zrobi� niez�y pancerz. 
	AI_Output (other, self,"Info_Kira_FinalEnd_15_06"); //B�d� o tym pami�ta�. A co z sojuszem?
	AI_Output (self, other,"Info_Kira_FinalEnd_16_07"); //Mo�esz uwa�a� go za obowi�zuj�cy od tej chwili.
	AI_Output (self, other,"Info_Kira_FinalEnd_16_08"); //Niestety na nas czas. Ju� t�skni� ogierze...
	AI_Output (other, self,"Info_Kira_FinalEnd_15_09"); //Ekhm... Ja te�, uwa�aj na siebie.

	/*****************
	Kira mo�e powiedzie� kto robi pancerze ze sk�ry - mo�e kto� z �owc�w by zrobi�?
	******************/
   
   B_LogEntry		(CH2_Rbl_BlackTroll, "Uda�o mi si� przekona� �owc�w. Czas wraca� do Cavalorna.");
   B_LogSetTopicStatus	(CH2_Rbl_BlackTroll, LOG_SUCCESS);
	Log_SetTopicStatus	(CH2_TRL_BlackMotherFucker, LOG_SUCCESS);
	B_LogEntry		(CH2_TRL_BlackMotherFucker, "Polowanie zako�czone - bestia nie �yje. Kira podarowa�a mi sk�r� z czarnego trolla. Sojusz zosta� zawarty - Cavalorn musi si� o tym dowiedzie�. Aha, ze sk�ry trolla mo�na zrobi� dobry pancerz, musz� poszuka� jakiego� kowala.");

	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"start");
};

// ************************************************************

INSTANCE Info_Kira_Help (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 1;
	condition		= Info_Kira_Help_Condition;
	information		= Info_Kira_Help_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Potrzebujemy waszej pomocy!";
};                       

FUNC INT Info_Kira_Help_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Rodney_BeginMag))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Help_Info()
{	
	AI_Output (other, self,"Info_Kira_Help_15_00"); //Potrzebujemy waszej pomocy!
	AI_Output (self, other,"Info_Kira_Help_16_01"); //Co si� sta�o? Zaatakowa�o Was stado �cierwojad�w, he, he.
	AI_Output (other, self,"Info_Kira_Help_15_02"); //Blisko, stra�nicy chc� nas wykopa� z Kolonii. Cavalorn prosi o pomoc.
	AI_Output (self, other,"Info_Kira_Help_16_03"); //Szybciej ni� my�la�am... No dobra, jak mamy pom�c?
	AI_Output (other, self,"Info_Kira_Help_15_04"); //Uderzycie na ty�y stra�nik�w, kiedy ci zaatakuj� ob�z. 
	AI_Output (self, other,"Info_Kira_Help_16_05"); //Dlaczego akurat na ty�y?

	Info_ClearChoices (Info_Kira_Help);
	Info_AddChoice (Info_Kira_Help, "Utoczycie krwi stra�nikom.", Info_Kira_Help_Blood);
	Info_AddChoice (Info_Kira_Help, "Dzi�ki temu zrobicie spore zamieszanie.", Info_Kira_Help_Mass);
	Info_AddChoice (Info_Kira_Help, "Zasiejecie strach w sercach stra�nik�w.", Info_Kira_Help_Fear);
	Info_AddChoice (Info_Kira_Help, "Ekhm... Dla chwa�y?", Info_Kira_Help_Glory);
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_Help_Blood()
{
	kira_help = 2;
   
	AI_Output (other, self,"Info_Kira_Help_Blood_15_00"); //Utoczycie krwi stra�nikom.
	AI_Output (self, other,"Info_Kira_Help_Blood_16_01"); //Nie jeste�my rze�nikami. Chc� by� pewna, �e moi ch�opcy nie id� na rze�.
	AI_Output (self, other,"Info_Kira_Help_Blood_16_02"); //A krwi na kaszank� nie potrzebujemy. Niezbyt dobrze z tego wybrn��e�.
	AI_Output (self, other,"Info_Kira_Help_Blood_16_03"); //Chyba jednak darujemy sobie walk�. �ycz� mi�ego 'upuszczania krwi' i pozdr�wcie od nas stra�nik�w.
	
   Log_SetTopicStatus	(CH3_RBL_TrolHelp, LOG_FAILED);
	B_LogEntry		(CH3_RBL_TrolHelp, "Nie uda�o mi si� przekona� Kiry. Lepiej o tym nie wspomina� Cavalornowi.");
	B_StopProcessInfos	(self);
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_Help_Mass()
{
	kira_help = 2;
   
	AI_Output (other, self,"Info_Kira_Help_Mass_15_00"); //Dzi�ki temu zrobicie spore zamieszanie.
	AI_Output (self, other,"Info_Kira_Help_Mass_16_01"); //Zamieszanie? To jak wtyka� kij w gniazdo os albo w ty�ek trolla. Dzi�ki, ale nie skorzystam.
	AI_Output (self, other,"Info_Kira_Help_Mass_16_02"); //Sami sobie wtykajcie, co tam chcecie w stra�nik�w. Bywaj.
	
   Log_SetTopicStatus	(CH3_RBL_TrolHelp, LOG_FAILED);
	B_LogEntry		(CH3_RBL_TrolHelp, "Nie uda�o mi si� przekona� Kiry. Lepiej o tym nie wspomina� Cavalornowi.");
	B_StopProcessInfos	(self);
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_Help_Fear()
{
	B_GiveXP(500);
	kira_help = 1;
   
	AI_Output (other, self,"Info_Kira_Help_Fear_15_00"); //Zasiejecie strach w sercach stra�nik�w.
	AI_Output (self, other,"Info_Kira_Help_Fear_16_01"); //Strach? W sumie mi�o by�oby popatrze�, jak te mendy sraj� po nogach.
	AI_Output (self, other,"Info_Kira_Help_Fear_16_02"); //Do tego nie staniemy na drodze g��wnego uderzenia, wi�c brzmi rozs�dnie.
	AI_Output (self, other,"Info_Kira_Help_Fear_16_03"); //Dobra, pogadam z ch�opakami. Masz nasze miecze i topory.
	AI_Output (other, self,"Info_Kira_Help_Fear_15_04"); //Dobrze to s�ysze�.
	AI_Output (self, other,"Info_Kira_Help_Fear_16_05"); //Uca�uj ode mnie Cavalorna, he, he.
	AI_Output (other, self,"Info_Kira_Help_Fear_15_06"); //Wymagasz zbyt wiele. Ale pozdrowi� go w Twoim imieniu.
	
	Log_SetTopicStatus	(CH3_RBL_TrolHelp, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_TrolHelp, "Uda�o mi si� przekona� Kir�. Atak na ty�y s�ugus�w Gomeza zasieje w szeregach stra�nik�w panik�, a to bardzo nam pomo�e. Musz� powiedzie� o tym Cavalornowi.");
	B_StopProcessInfos	(self);

	/******************
		Funkcje z atakiem da si� pdoczas ataku nie teraz
		*******************/
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_Help_Glory()
{
	kira_help = 2;
   
	AI_Output (other, self,"Info_Kira_Help_Glory_15_00"); //Ekhm... Dla chwa�y?
	AI_Output (self, other,"Info_Kira_Help_Glory_16_01"); //Dla chwa�y to ja mog� zer�n�� trolla.
	AI_Output (self, other,"Info_Kira_Help_Glory_16_02"); //Dla nas liczy si� tylko walka i widoki na dobry zarobek. Chwa�� mo�esz sobie wsadzi� w rzy�.
	AI_Output (self, other,"Info_Kira_Help_Glory_16_03"); //Powiedz to Cavalornowi i wyno� si� z tego obozu.
	
   Log_SetTopicStatus	(CH3_RBL_TrolHelp, LOG_FAILED);
	B_LogEntry		(CH3_RBL_TrolHelp, "Nie uda�o mi si� przekona� Kiry. Lepiej o tym nie wspomina� Cavalornowi.");
	B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE Info_Kira_OCH (C_INFO)
{
	npc			= Non_4027_Kira;
	nr			= 12;
	condition		= Info_Kira_OCH_Condition;
	information		= Info_Kira_OCH_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kira_OCH_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelp))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_OCH_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	
   AI_Output (self, other,"Info_Kira_OCH_16_01"); //D�ugo Ci� nie by�o, a mi potrzeba prawdziwego m�czyzny. �ci�gaj �achy!
	AI_Output (other, self,"Info_Kira_OCH_15_02"); //Mo�e najpierw porozmawiamy...
	AI_DrawWeapon (self);
	AI_Output (self, other,"Info_Kira_OCH_16_03"); //�ci�gaj �achy albo je z Ciebie zedr�!

	Info_ClearChoices (Info_Kira_OCH);
	Info_AddChoice (Info_Kira_OCH, "Czego si� nie robi dla... sprawy.", Info_Kira_OCH_Ok);
	Info_AddChoice (Info_Kira_OCH, "Nie jestem got�w na takie po�wi�cenie!", Info_Kira_OCH_No);
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_OCH_Ok()
{
	AI_Output (other, self,"Info_Kira_OCH_Ok_15_00"); //Czego si� nie robi dla... sprawy.
	AI_RemoveWeapon (self);
	AI_Output (self, other,"Info_Kira_OCH_Ok_16_01"); //Za du�o gadasz!
	kira_help = 3;
	B_KiraSex();
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_OCH_No()
{
	AI_Output (other, self,"Info_Kira_OCH_No_15_00"); //Nie jestem got�w na takie po�wi�cenie!
	AI_Output (self, other,"Info_Kira_OCH_No_16_01"); //Rozczarowa�e� mnie. Ale skoro ju� jeste� pod r�k�, to przynajmniej sobie odreaguj�...
	kira_help = 4;
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ************************************************************

INSTANCE Info_Kira_OCHAfter (C_INFO)
{
	npc			= Non_4027_Kira;
	nr			= 13;
	condition		= Info_Kira_OCHAfter_Condition;
	information		= Info_Kira_OCHAfter_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kira_OCHAfter_Condition()
{	
	if ((kira_help == 3)||(kira_help == 4))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_OCHAfter_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"Info_Kira_OCHAfter_16_01"); //Nadal tu jeste�?
	AI_Output (other, self,"Info_Kira_OCHAfter_15_02"); //Tak, musimy porozmawia�.
	AI_Output (self, other,"Info_Kira_OCHAfter_16_03"); //Dlaczego faceci chc� tylko gada�? No dobra, wyrzu� to z siebie.
	AI_Output (other, self,"Info_Kira_OCHAfter_15_04"); //Nied�ugo zaatakujemy Stary Ob�z. Ciekaw jestem, czy chcia�aby� si� te� troch� zabawi� ze stra�nikami.
	AI_Output (self, other,"Info_Kira_OCHAfter_16_05"); //Brzmi interesuj�co. 
	AI_Output (other, self,"Info_Kira_OCHAfter_15_06"); //Najemnicy uderz� na zewn�trzne bramy, ma�y oddzia� rebeliant�w niepostrze�enie dostanie si� do �rodka.
	AI_Output (other, self,"Info_Kira_OCHAfter_15_07"); //Podniesiemy kraty i dorwiemy Gomeza.
	AI_Output (self, other,"Info_Kira_OCHAfter_16_08"); //Nawet macie plan - imponuj�ce.
	AI_Output (other, self,"Info_Kira_OCHAfter_15_09"); //Jak jest Twoja decyzja?
	AI_Output (self, other,"Info_Kira_OCHAfter_16_10"); //Pomo�emy Wam. Ale pod jednym warunkiem.
	AI_Output (other, self,"Info_Kira_OCHAfter_15_11"); //Tak?
	AI_Output (self, other,"Info_Kira_OCHAfter_16_12"); //Siekacz musi dosta� si� w moja �apska i to �ywy!
	AI_Output (other, self,"Info_Kira_OCHAfter_15_13"); //Dlaczego akurat on?
	AI_Output (self, other,"Info_Kira_OCHAfter_16_14"); //Z wiarygodnego �r�d�a wiem, �e to prawdziwy m�czyzna. Za to co ma mi�dzy nogami niejedna kobieta odda�aby cnot� w�asnej c�rki!
	AI_Output (other, self,"Info_Kira_OCHAfter_15_15"); //...cholerna nimfomanka...
	AI_Output (self, other,"Info_Kira_OCHAfter_16_16"); //Co m�wi�e�?
	AI_Output (other, self,"Info_Kira_OCHAfter_15_17"); //Nic, nic. Przyprowadz� Ci Siekacza na po�arcie. 
	AI_Output (self, other,"Info_Kira_OCHAfter_16_18"); //Ju� nie mog� si� doczeka�, kiedy sobie na nim poje�d��...

	B_LogEntry		(CH6_RBL_OtherHelp, "Kira pomo�e w ataku, je�eli przyprowadz� do niej Siekacza.");

	Log_CreateTopic	(CH6_RBL_Horse, LOG_MISSION);
	Log_SetTopicStatus	(CH6_RBL_Horse, LOG_RUNNING);
	B_LogEntry		(CH6_RBL_Horse, "Cholerna nimfomanka! Musz� przyprowadzi� do Kiry Siekacza. Tylko wtedy �owcy pomog� nam w ataku na Stary Ob�z. Musz� porozmawia� z tym stra�nikiem.");
};

// ************************************************************

INSTANCE Info_Kira_Bring_Cutter (C_INFO)
{
	npc			= Non_4027_Kira;
	nr			= 14;
	condition		= Info_Kira_Bring_Cutter_Condition;
	information		= Info_Kira_Bring_Cutter_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kira_Bring_Cutter_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Cutter_WomanOk))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Bring_Cutter_Info()
{	
	var C_NPC cut; cut = Hlp_GetNpc(GRD_208_Cutter);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"Info_Kira_Bring_Cutter_16_01"); //To on?
	
   AI_TurnToNpc (self, cut);
	
   AI_Output (other, self,"Info_Kira_Bring_Cutter_15_02"); //To Siekacz. Je�eli o to Ci chodzi, to nie sprawdza�em czy rzeczywi�cie taki z niego ogier...
	
   AI_TurnToNpc (self, other);
	
   AI_Output (self, other,"Info_Kira_Bring_Cutter_16_03"); //Sama si� tym zajm�. Powiedz Ratfordowi, �e �owcy wespr� atak na zewn�trzne mury.
	AI_Output (self, other,"Info_Kira_Bring_Cutter_16_04"); //A teraz zmiataj, mam tu co� do zrobienia...
	
   AI_TurnToNpc (self, cut);
	B_LogEntry		(CH6_RBL_OtherHelp, "Uda�o si�! �owcy te� wezm� udzia� w polowaniu na Gomeza. Musz� powiedzie� o tym Ratfordowi.");

	Log_SetTopicStatus	(CH6_RBL_Horse, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_Horse, "Kira wesprze atak na palisad�. Szkoda Siekacza, ale sam jest sobie winien...");
};
