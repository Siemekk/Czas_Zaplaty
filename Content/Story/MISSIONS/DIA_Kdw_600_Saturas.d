// ************************ EXIT **************************

instance Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Saturas_EXIT_Info()
{

	B_StopProcessInfos(self);
};

// ************************ Intruder **************************

instance Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	0;
	important	=	1;	
	description		= "."; 
};                       

FUNC int Info_Saturas_Intruder_Condition()
{
	return 1;
};

FUNC VOID Info_Saturas_Intruder_Info()
{
	AI_Output(self, other,"Info_Saturas_Intruder_14_00"); //Co Ty tu robisz? Nie masz tu czego szuka�! Precz!

	B_StopProcessInfos(self);
};

// *************************************************

instance Info_Saturas_Ornament (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	2;
	condition	=	Info_Saturas_Ornament_Condition;
	information	=	Info_Saturas_Ornament_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Przysy�a mnie Lee."; 
};                       

FUNC int Info_Saturas_Ornament_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_Agree))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Ornament_Info()
{
	AI_Output(other, self, "Info_Saturas_Ornament_15_00"); //Przysy�a mnie Lee.
	AI_Output(self, other,"Info_Saturas_Ornament_14_01"); //Kolejny najemnik. Za ka�dym razem przysy�a kogo� innego. Co� marnie wam idzie...
	AI_Output(other, self, "Info_Saturas_Ornament_15_02"); //Zabija nas to, czego szukamy, magu.
	AI_TurnToNpc 	(self, other);
	Ai_Wait (self,1.0);
	AI_Output(self, other,"Info_Saturas_Ornament_14_03"); //Pos�uchaj mnie uwa�nie! Lee da� s�owo, �e pomo�e nam w poszukiwaniach, chyba nie zamierzasz splugawi� honoru swego przyw�dcy?
	AI_Output(other, self, "Info_Saturas_Ornament_15_04"); //Nikt za mn� nie stoi. 
	AI_Output(self, other,"Info_Saturas_Ornament_14_05"); //Wi�c co tutaj robisz?!
	AI_Output(other, self, "Info_Saturas_Ornament_15_06"); //Powiedzmy, �e Lee bardzo przekonuj�co prosi� o pomoc.
	AI_Output(self, other,"Info_Saturas_Ornament_14_07"); //Sko�czmy t� rozmow�. Id� do Nefariusa, przygotowa� map� z zaznaczon� lokalizacj� kolejnego ornamentu.
	AI_Output(self, other,"Info_Saturas_Ornament_14_08"); //Raporty z poszukiwa� sk�adaj Cronosowi. Je�eli potrzebujesz jakiego� ekwipunku, to on tak�e Ci w tym pomo�e.
	AI_Output(self, other,"Info_Saturas_Ornament_14_09"); //A teraz zejd� mi z oczu, bo trac� przez ciebie cenny czas.
	AI_Output(other, self, "Info_Saturas_Ornament_15_10"); //Jeszcze jedno.
	AI_Output(self, other,"Info_Saturas_Ornament_14_11"); //M�w!
	AI_Output(other, self, "Info_Saturas_Ornament_15_12"); //Kawa� z ciebie bezdusznego sukinsyna!
	AI_Output(self, other,"Info_Saturas_Ornament_14_13"); //To co robi�, robi� tylko i wy��cznie dla zachowania r�wnowagi. �mier� kilku �miertelnik�w to znikoma cena za to, czemu mo�e zdo�amy zapobiec w przysz�o�ci.
	AI_Output(self, other,"Info_Saturas_Ornament_14_14"); //A teraz precz z moich oczu! Nast�pnym razem zamieni� Ci� w bry�� lodu!
	B_LogEntry(CH3_NON_Ornament, "Rozmowa z Saturasem nie by�a zbyt przyjemna. Od Nefariusa otrzymam kolejn� map�. Raport z poszukiwa� mam sk�ada� Cronosowi, tak�e od niego b�d� m�g� co� kupi�. Wida�, �e Saturas jest got�w zap�aci� ka�d� cen� za odnalezienie ornament�w.");
	B_StopProcessInfos(self);
};

// *************************************************

instance Info_Saturas_SaveDick (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	3;
	condition	=	Info_Saturas_SaveDick_Condition;
	information	=	Info_Saturas_SaveDick_Info;
	permanent	=	0;
	important	=	1;	
	description		= "."; 
};                       

FUNC int Info_Saturas_SaveDick_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hrabia_FindThief1))&&(Npc_GetDistToWP (hero,"LOCATION_19_03_ROOM6_BARRELCHAMBER2") < 500 ) 
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_SaveDick_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other, self);
	AI_Output(self, other,"Info_Saturas_SaveDick_14_01"); //Uda�o si�!
	AI_Output(other, self, "Info_Saturas_SaveDick_15_02"); //Jak ja si� tu znalaz�em?
	AI_Output(self, other,"Info_Saturas_SaveDick_14_03"); //Wyczu�em, �e grozi Ci niebezpiecze�stwo. To nie by�o �atwe, ale uda�o si� sprowadzi� Ci� �ywego.
	AI_Output(other, self, "Info_Saturas_SaveDick_15_04"); //Zbytek �aski, poradzi�bym sobie sam. 
	AI_Output(self, other,"Info_Saturas_SaveDick_14_05"); //Ale z Ciebie uparte bydl�!
	AI_Output(other, self, "Info_Saturas_SaveDick_15_06"); //Nie oszukujmy si�, uratowa�e� mnie tylko dlatego, �e mia�em przy sobie ornament.
	AI_Output(self, other,"Info_Saturas_SaveDick_14_07"); //�le mnie oceniasz... Twoje �ycie jest r�wnie wa�ne, jak nie wa�niejsze. Zbyt wielu ju� zgin�o, pr�buj�c nam pom�c.
	AI_Output(other, self, "Info_Saturas_SaveDick_15_08"); //Sk�d te nag�e wyrzuty sumienia? Wcze�niej ich nie zauwa�y�em.
	AI_Output(self, other,"Info_Saturas_SaveDick_14_09"); //Nie jest �atwo wype�nia� rozkazy boga. To co czynimy, nie robimy dla siebie, ale dla Adanosa.
	AI_Output(other, self, "Info_Saturas_SaveDick_15_10"); //Chcesz mi wm�wi�, �e rozmawiasz z bogiem?!
	AI_Output(self, other,"Info_Saturas_SaveDick_14_11"); //Nie rozmawiam, ale s�ysz� jego nakazy i zawsze je wype�niam, nawet wbrew w�asnej woli. Jestem tylko narz�dziem... Nie mia�em wyboru...
	AI_Output(self, other,"Info_Saturas_SaveDick_14_12"); //Gdybym m�g� ocali� �ycie twoich poprzednik�w, zrobi�bym to!
	AI_Output(other, self, "Info_Saturas_SaveDick_15_13"); //Hmm... Mo�e oceni�em Ci� zbyt pochopnie.
	AI_Output(self, other,"Info_Saturas_SaveDick_14_14"); //To co robimy oceni� kiedy� potomni i sama historia...
	AI_Output(self, other,"Info_Saturas_SaveDick_14_15"); //Przeka� Cronosowi ornament i id� po kolejn� map� do Nefariusa. Mamy coraz mniej czasu...
	AI_Output(self, other,"Info_Saturas_SaveDick_14_16"); //Niech Adanos nad Tob� czuwa.
	B_LogEntry(CH3_NON_Ornament, "To Saturas mnie uratowa�. Teleportowa� mnie w ostatniej chwili. Wydaje si�, �e nawet on jest tylko narz�dziem. Troch� pochopnie go oceni�em. Czas odda� ornament Cronosowi i p�j�� po kolejn� map� do Nefariusa.");
};

// *************************************************

instance Info_Saturas_Konwer (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	4;
	condition	=	Info_Saturas_Konwer_Condition;
	information	=	Info_Saturas_Konwer_Info;
	permanent	=	0;
	important	=	1;	
	description		= "..."; 
};                       

FUNC int Info_Saturas_Konwer_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hrabia_LastOrn))&&(Npc_GetDistToWP (hero,"LOCATION_19_03_ROOM6_BARRELCHAMBER2") < 500 ) //wp gdzie si� dick teleportn�
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Konwer_Info()
{
	AI_Output(other, self, "Info_Saturas_Konwer_15_01"); //Mog�e� chwil� zaczeka�. Mamy spory problem.
	AI_Output(self, other,"Info_Saturas_Konwer_14_02"); //Ornament znikn��.
	AI_Output(other, self, "Info_Saturas_Konwer_15_03"); //Sk�d wiesz?
	AI_Output(self, other,"Info_Saturas_Konwer_14_04"); //Ornamenty zosta�y konsekrowane na o�tarzu Adanosa. Potrafi� wyczu� ich aur�, a tak�e tych, kt�rzy s� w ich posiadaniu.
	AI_Output(self, other,"Info_Saturas_Konwer_14_05"); //Niestety potrafi� wyczu� tylko najprostsze emocje czy instynkty.
	AI_Output(other, self, "Info_Saturas_Konwer_15_06"); //Wiesz, gdzie ukryto ornamenty?
	AI_Output(self, other,"Info_Saturas_Konwer_14_07"); //Niestety nie. Nie potrafi� wyczu� aury... Kto� musi j� blokowa�. 
	AI_Output(other, self, "Info_Saturas_Konwer_15_08"); //Jaki� mag?
	AI_Output(self, other,"Info_Saturas_Konwer_14_09"); //Niekoniecznie. Wystarczy miejsce po�wi�cone innemu bogu, aby st�umi� aur�.
	AI_Output(other, self, "Info_Saturas_Konwer_15_10"); //Stawiasz na Innosa czy Beliara?
	AI_Output(self, other,"Info_Saturas_Konwer_14_11"); //W�tpi�, aby s�udzy Innosa stawali nam na drodze.
	AI_Output(other, self, "Info_Saturas_Konwer_15_12"); //Co teraz zrobimy?
	AI_Output(self, other,"Info_Saturas_Konwer_14_13"); //Musimy odnale�� pozosta�e fragmenty. I musimy zrobi� to w przeci�gu trzech dni.
	AI_Output(other, self, "Info_Saturas_Konwer_15_14"); //O co chodzi z tymi trzema dniami? Hrabia m�wi� to samo.
	AI_Output(self, other,"Info_Saturas_Konwer_14_15"); //Co to za Hrabia?
	AI_Output(other, self, "Info_Saturas_Konwer_15_16"); //Typek, kt�ry ci�gle mnie uprzedza. Mam wam przekaza�, �e je�eli w przeci�gu trzech dni nie oddacie po dobroci ornamentu, to znajdzie was i sam go sobie we�mie.
	AI_Output(self, other,"Info_Saturas_Konwer_14_17"); //Za trzy dni odb�dzie si� konwergerencja sfer. Wtedy pierwotna moc wszystkich bog�w po��czy si�...
	AI_Output(self, other,"Info_Saturas_Konwer_14_18"); //To zjawisko zdarza si� raz na dziesi�� lat. Jest niezwykle pot�ne, ale kr�tkotrwa�e.
	AI_Output(self, other,"Info_Saturas_Konwer_14_19"); //Jego moc os�abi barier� na tyle, �e b�dzie mo�na si� poza ni� teleportowa�.
	AI_Output(other, self, "Info_Saturas_Konwer_15_16"); //B�dzie mo�na przez ni� przej��?
	AI_Output(self, other,"Info_Saturas_Konwer_14_20"); //Niestety nie, tylko magia zdo�a si� przedrze� przez os�on�.
	AI_Output(self, other,"Info_Saturas_Konwer_14_20"); //To dla nas jedyna szansa, aby odnale�� drog� do Jarkendaru.
	AI_Output(other, self, "Info_Saturas_Konwer_15_21"); //Gdzie?
	AI_Output(self, other,"Info_Saturas_Konwer_14_22"); //Do miejsca, gdzie ju� wkr�tce narodzi si� pot�ne z�o. Wi�cej wiedzie� nie musisz.
	AI_Output(other, self, "Info_Saturas_Konwer_15_23"); //Czyli mam trzy dni na znalezienie ornament�w?
	AI_Output(self, other,"Info_Saturas_Konwer_14_24"); //Tak. 
	AI_Output(other, self, "Info_Saturas_Konwer_15_25"); //Rozumiem, �e zwr�cenie ornamentu nie wchodzi w rachub�?
	AI_Output(self, other,"Info_Saturas_Konwer_14_26"); //Oczywi�cie. Porozmawiaj z Merdarionem, on mo�e Ci pom�c. A teraz ruszaj, musz� wr�ci� do pracy.
	
   B_LogEntry(CH3_NON_Ornament, "Mam trzy dni na odnalezienie pozosta�ych cze�ci ornamentu. Wtedy nadejdzie jaka� konwergerencja i magowie b�d� mogli si� teleportowa� poza barier�. Musz� porozmawia� z Merdarionem, podobno mo�e mi pom�c.");
};

// *************************************************

instance Info_Saturas_Find (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	5;
	condition	=	Info_Saturas_Find_Condition;
	information	=	Info_Saturas_Find_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Mam pozosta�e ornamenty!"; 
};                       

FUNC int Info_Saturas_Find_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hrabia_LastOrn))&&(NPC_HasItems(hero,orn1)>=1)&&(NPC_HasItems(hero,orn2)>=1)&&(NPC_HasItems(hero,orn4)>=1)
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Find_Info()
{
	AI_Output(other, self, "Info_Saturas_Find_15_01"); //Mam pozosta�e ornamenty!
   
	if (ornament_wait >= (Wld_GetDay()))
	{
		ritual_time_ok = TRUE;
		B_GiveXP(2500);
      
		AI_Output(self, other,"Info_Saturas_Find_14_02"); //Zd��ymy jeszcze przeprowadzi� rytua�!
		AI_Output(self, other,"Info_Saturas_Find_14_03"); //Natychmiast zanie� fragmenty Cronosowi. Powiedz te� pozosta�ym magom, �eby wyszli na dziedziniec.
		AI_Output(self, other,"Info_Saturas_Find_14_04"); //B�d� tam na nich czeka�. Porozmawiaj ze mn�, kiedy sprowadzisz wszystkich mag�w.
		AI_Output(self, other,"Info_Saturas_Find_14_05"); //Nie tra� czasu, ruszaj natychmiast! 
		
      B_LogEntry(CH3_NON_Ornament, "Musz� natychmiast zanie�� ornamenty Cronosowi i powiedzie� wszystkim magom, aby stawili si� na dziedzi�cu, gdzie Saturas b�dzie ju� na nich czeka�. Gdy przyjd� wszyscy, musz� porozmawia� z Saturasem.");
		B_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RIT");	
	}
	else
	{
		AI_Output(self, other,"Info_Saturas_Find_14_06"); //Ju� za p�no... Zejd� mi z oczu.
		AI_Output(self, other,"Info_Saturas_Find_14_07"); //Powiedz Lee, �e mo�e odej��.
		
      lee_free = TRUE;
		Log_SetTopicStatus(CH3_NON_Ornament, LOG_FAILED);
		B_LogEntry(CH3_NON_Ornament, "Sp�ni�em si�... Magowie Wody nie odprawi� ju� rytua�u, a ja nie dowiem si�, czy im si� to uda. Niech to szlag, nie lubi� przegrywa�...");
	};
};

// *************************************************

instance Info_Saturas_Rytual (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	6;
	condition	=	Info_Saturas_Rytual_Condition;
	information	=	Info_Saturas_Rytual_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Gotowe. Co teraz?"; 
};                       

FUNC int Info_Saturas_Rytual_Condition()
{
	if (ritual_time_ok == TRUE)&&(Npc_KnowsInfo(hero,KDW_605_Riordian_All))&&(Npc_KnowsInfo(hero,Info_Nefarius_All))&&(Npc_KnowsInfo(hero,DIA_Myxir_All))&&(Npc_KnowsInfo(hero,DIA_Merdarion_FindAll))&&(Npc_KnowsInfo(hero,DIA_Cronos_OrnamentAll))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Rytual_Info()
{
	var C_NPC cron; cron = Hlp_GetNpc(KDW_604_Cronos);

	AI_Output(other, self, "Info_Saturas_Rytual_15_01"); //Gotowe. Co teraz?
	
   if (ornament_wait >= Wld_GetDay())
	{
		AI_Output(self, other,"Info_Saturas_Rytual_14_02"); //Odsu� si� i czekaj.
		AI_Output(self, other,"Info_Saturas_Rytual_14_03"); //Czas dokona� po��czenia!
		AI_TurnToNpc(self, cron);
		AI_Output(self, other,"Info_Saturas_Rytual_14_04"); //Ruszaj Cronosie...
		
      AI_PlayAni(cron,"T_YES");

		B_LogEntry(CH3_NON_Ornament, "Rytua� si� rozpocz��...");
		B_StopProcessInfos(self);
		AI_GotoWP (cron, "RIT7");
		AI_AlignToWP(cron);
		AI_PlayAni(self, "T_PLUNDER");

		/***********************
      Ork to twoja dzia�a. Trzeba jako� zajebi�cie zrobi� ten rytua�. Opisz� jakby to mog�o wygl�da�.

   Oczywi�cie z kamerk� ;P

   0. Na pocz�tku zamykaj� si� wrota, czy tam opuszcza si� karata do sali, �eby nikt magom nie przeszkadza�
   1. Cronos podchodzi do jakiego� miejsca, rzuca kawa�ki ornamentu w g�r� czy tam w ogie�, etc.
   2. Cronos wraca na swoje miejsce.
   3. Wszyscy magowie zaczynaj� inkantowa�, �apki w g�r�, etc.
   4. Zaczyna si� co� dzia� z ornamentami, ��cz� si� i klucz unosi si� w g�r�.
   5. Mo�e jakie� �wiat�o z tego klucza pada na martwy portal.
   6. Portal zaczyna si� tworzy�, trz�sienie ziemi, jaki� fajny pfxa.
   7. H�e, hle. Krata si� podnosi, do komnaty wpadaj� siepacze Hrabiego i przeyrwaj� rytua�. Portal eksploduje, klucz zostaje zniszczony i mamy unhuppy end ;)
   To ich instancje:
      var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
      var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
      var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
      var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
      var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
      var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);

   Zmie� im te� nastawienie, ale niech nie rzucaj� si� tylko na dicka, ale te� na mag�w i najemnik�w:

      Npc_SetTempAttitude(weg, ATT_HOSTILE); Npc_SetAttitude(weg, ATT_HOSTILE);
      Npc_SetTempAttitude(grd1, ATT_HOSTILE); Npc_SetAttitude(grd1, ATT_HOSTILE);
      Npc_SetTempAttitude(grd2, ATT_HOSTILE); Npc_SetAttitude(grd2, ATT_HOSTILE);
      Npc_SetTempAttitude(grd3, ATT_HOSTILE); Npc_SetAttitude(grd3, ATT_HOSTILE);
      Npc_SetTempAttitude(grd4, ATT_HOSTILE); Npc_SetAttitude(grd4, ATT_HOSTILE);
      Npc_SetTempAttitude(grd5, ATT_HOSTILE); Npc_SetAttitude(grd5, ATT_HOSTILE);

   8. Za siepaczami wpadaj� najemnicy, zaczyna si� rze�nia. Mo�esz od razu u�mierci� Myxira podczas walki, a cia�o Jarvisa niech le�y na zewn�trz, to on mia� wart� kiedy ude�yli stra�nicy, dlatego reszta da�a si� zaskoczy�.
   9. 
   10. na ko�cu funkcji niech zmienna rytual_break = TRUE;
	*************************/

		B_RitualBreak();
	}
	else
	{
		AI_Output(self, other,"Info_Saturas_Rytual_14_05"); //Dlaczego tyle zwleka�e�?! Precz mi z oczu.
		AI_Output(self, other,"Info_Saturas_Rytual_14_06"); //Powiedz Lee, �e jeste�my ju� kwita.
		
      lee_free = TRUE;
		Log_SetTopicStatus(CH3_NON_Ornament, LOG_FAILED);
		B_LogEntry(CH3_NON_Ornament, "Sp�ni�em si�... Magowie wody nie odprawi� ju� rytua�u, a ja nie dowiem si�, czy im si� to uda. Niech to szlag, nie lubi� przegrywa�...");
	};
};

// *************************************************

instance Info_Saturas_RytualFinished (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	7;
	condition	=	Info_Saturas_RytualFinished_Condition;
	information	=	Info_Saturas_RytualFinished_Info;
	permanent	=	0;
	important	=	1;	
	description		= "..."; 
};                       

FUNC int Info_Saturas_RytualFinished_Condition()
{
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);

	if (rytual_break == TRUE)&&(Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo(hero,Info_Saturas_Rytual))
   &&((Npc_IsDead(grd1))&&(Npc_IsDead(grd2))&&(Npc_IsDead(grd3))&&(Npc_IsDead(grd4))&&(Npc_IsDead(grd5))&&(Npc_IsDead(weg)))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_RytualFinished_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other, self);
   
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_01"); //To niemo�liwe... Portal zniszczony... Ornament przepad�... Tyle przygotowa�...
	AI_Output(other, self, "Info_Saturas_RytualFinished_15_02"); //Trzeba przyzna�, �e Hrabia dotrzyma� s�owa. Co teraz?
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_03"); //Adanos wystawia nas na ci�k� pr�b�. To musia� by� znak...
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_04"); //Tak, Adanos nas sprawdza. Musi by� inny spos�b... Znajdziemy go, a wtedy z�o w Jarkendarze zadr�y...
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_05"); //Co do Ciebie...
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_06"); //Bardzo nam pomog�e�, to nie zostanie zapomniane.

	/****************
	Ork co do nagrody to nie wiem, sam co� wymy�l. Mo�e niech kt�ry� z mag�w uczy te� bezia zakl�� po tym rytuale
	****************/

	AI_Output(self, other,"Info_Saturas_RytualFinished_14_07"); //Powiedz Lee, �e jego d�ug zosta� sp�acony.
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_08"); //A teraz odejd� i niech Adanos czuwa nad Tob�.
	lee_free = TRUE;	
	Log_SetTopicStatus(CH3_NON_Ornament, LOG_SUCCESS);
	B_LogEntry(CH3_NON_Ornament, "Rytua� zako�czy� si� krwawym fiaskiem. Portal zosta� zniszczony, magowie musz� poszuka� innej drogi ku wolno�ci.");	
	B_StopProcessInfos(self);

	var C_NPC mag1; mag1 = Hlp_GetNpc(KDW_601_Myxir);
	var C_NPC mag2; mag2 = Hlp_GetNpc(KDW_602_Merdarion);
	var C_NPC mag3; mag3 = Hlp_GetNpc(KDW_603_Nefarius);
	var C_NPC mag4; mag4 = Hlp_GetNpc(KDW_604_Cronos);
	var C_NPC mag5; mag5 = Hlp_GetNpc(KDW_605_Riordian);

	Npc_ExchangeRoutine(self,"start");
	Npc_ExchangeRoutine(mag1,"start");
	Npc_ExchangeRoutine(mag2,"start");
	Npc_ExchangeRoutine(mag3,"start");
	Npc_ExchangeRoutine(mag4,"start");
	Npc_ExchangeRoutine(mag5,"start");
};

// *************************************************

instance Info_Saturas_Ritual (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	8;
	condition	=	Info_Saturas_Ritual_Condition;
	information	=	Info_Saturas_Ritual_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Potrzebuj� pomocy."; 
};                       

FUNC int Info_Saturas_Ritual_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_RuneSwd1))&&(Npc_KnowsInfo(hero,Info_Saturas_Intruder))&&(!Npc_KnowsInfo(hero,Info_Saturas_RytualFinished))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Ritual_Info()
{
	AI_Output(other, self, "Info_Saturas_Ritual_15_00"); //Potrzebuj� pomocy.
	AI_Output(self, other,"Info_Saturas_Ritual_14_01"); //Jak my wszyscy.
	AI_Output(other, self, "Info_Saturas_Ritual_15_02"); //Ale to bardzo wa�ne! Znalaz�em miecz i...
	AI_Output(self, other,"Info_Saturas_Ritual_14_03"); //Odejd�!
	B_LogEntry(CH4_GRD_RuneSwd, "Saturas pomo�e mi tylko wtedy, jak zdob�d� jego zaufanie. Musz� pokr�ci� si� w pobli�u tych mag�w.");
};

// *************************************************

var int satur_ritual;

instance Info_Saturas_RitualOk (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	9;
	condition	=	Info_Saturas_RitualOk_Condition;
	information	=	Info_Saturas_RitualOk_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Potrzebuj� pomocy."; 
};                       

FUNC int Info_Saturas_RitualOk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_RuneSwd1))&&(Npc_KnowsInfo(hero,Info_Saturas_RytualFinished))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_RitualOk_Info()
{
	var C_NPC myxir; myxir = Hlp_GetNpc(KDW_601_Myxir);

	AI_Output(other, self, "Info_Saturas_RitualOk_15_00"); //Potrzebuj� pomocy.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_01"); //Magowie maj� wobec Ciebie d�ug wdzi�czno�ci. Co to za problem?
	AI_Output(other, self, "Info_Saturas_RitualOk_15_02"); //Znalaz�em runiczny miecz i...
	AI_Output(self, other,"Info_Saturas_RitualOk_14_03"); //To niemo�liwe, ten miecz zagin�� wieki temu!
	AI_Output(other, self, "Info_Saturas_RitualOk_15_04"); //Jak wida� to ju� przesz�o��. Teraz miecz nale�y do mnie.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_05"); //Gdyby powiedzia� mi to kto� inny, bez zastanowienia odebra�bym mu to ostrze.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_06"); //Miecz runiczny to przekl�ty or�. Zawsze prowadzi� do zguby swego posiadacza. Jego moc jest zbyt pot�na dla zwyk�ego �miertelnika.
	AI_Output(other, self, "Info_Saturas_RitualOk_15_07"); //Nie obawiaj si�, miecz jest 'martwy'. 
	AI_Output(self, other,"Info_Saturas_RitualOk_14_08"); //A Ty zapewne chcesz przebudzi� drzemi�ce w ostrzu moce?
	AI_Output(other, self, "Info_Saturas_RitualOk_15_09"); //Trafnie odgad�e�. Dlatego w�a�nie potrzebuj� twojej pomocy.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_10"); //Wiesz chocia�, jak si� do tego zabra�? To nie takie proste, nale�y...
	AI_Output(other, self, "Info_Saturas_RitualOk_15_11"); //...odprawi� rytua� odrodzenia przez trzech kap�an�w wyznaj�cych r�nych bog�w. Oczywi�cie musz� najpierw zdoby� 'Almanach odrodzenia'.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_12"); //Ty rzeczywi�cie chcesz to zrobi� i niestety znasz spos�b.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_13"); //W porz�dku, magowie wody zawsze sp�acaj� swoje zobowi�zania.
	
   if (Npc_IsDead(myxir))
	{
		satur_ritual = TRUE;
		AI_Output(self, other,"Info_Saturas_RitualOk_14_14"); //To Myxir by� naszym mistrzem przywo�a�. Po jego �mierci tylko ja posiadam odpowiedni� wiedz�, aby Ci pom�c.
		AI_Output(self, other,"Info_Saturas_RitualOk_14_15"); //Przyjd� do mnie, kiedy wszystko b�dzie ju� przygotowane do rytua�u.
		
		B_LogEntry(CH4_RBL_Rirual, "Sam Saturas we�mie udzia� w rytuale. Ale najpierw musz� wszystko przygotowa�, czyli musz� odnale�� ten cholerny almanach.");
	}
	else
	{
		myxir_ritual = TRUE;
		AI_Output(self, other,"Info_Saturas_RitualOk_14_17"); //To Myxir jest mistrzem przywo�a�. Porozmawiaj z nim, kiedy ju� wszystko b�dzie przygotowane do rytua�u.

		B_LogEntry(CH4_RBL_Rirual, "Myxir we�mie udzia� w rytuale. Ale najpierw musz� wszystko przygotowa�, czyli musz� odnale�� ten cholerny almanach.");
	};
   
   AI_Output(self, other,"Info_Saturas_RitualOk_14_18"); //Od tej chwili magowie wody uwa�aj� sw�j d�ug za sp�acony.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_19"); //Odejd� w pokoju, Rick.
};

instance Info_Saturas_Stones (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	10;
	condition	=	Info_Saturas_Stones_Condition;
	information	=	Info_Saturas_Stones_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Mistrzu Saturasie, szukam kamieni ogniskuj�cych."; 
};                       

FUNC int Info_Saturas_Stones_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Milten_Cristals))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Stones_Info()
{
	AI_Output(other, self, "Info_Saturas_Stones_15_00"); //Mistrzu Saturasie, szukam kamieni ogniskuj�cych.
	AI_Output(self, other,"Info_Saturas_Stones_14_01"); //Pierwszy raz nazwa�e� mnie mistrzem. Nie lubi�, jak kto� bez �oju wchodzi mi...
	AI_Output(other, self, "Info_Saturas_Stones_15_02"); //Wybacz. Bardzo zale�y mi na kamieniach. 
	AI_Output(self, other,"Info_Saturas_Stones_14_03"); //Do czego potrzebujesz tych artefakt�w?
	AI_Output(other, self, "Info_Saturas_Stones_15_04"); //S� niezb�dne do przywr�cenia mocy mieczowi runicznemu.
	AI_Output(self, other,"Info_Saturas_Stones_14_05"); //Rozumiem...
	AI_Output(self, other,"Info_Saturas_Stones_14_06"); //Jednak kamienie ogniskuj�ce to pot�ne artefakty. 
	AI_Output(self, other,"Info_Saturas_Stones_14_07"); //Dlaczego mieliby�my odda� je w twoje r�ce?

	Info_ClearChoices (Info_Saturas_Stones);
	Info_AddChoice (Info_Saturas_Stones, "Kamienie pomog� mi zachowa� r�wnowag� pomi�dzy boskimi si�ami.", Info_Saturas_Stones_Protect);
	Info_AddChoice (Info_Saturas_Stones, "Dzi�ki ostrzu zdob�d� s�aw�.", Info_Saturas_Stones_Glory);
	Info_AddChoice (Info_Saturas_Stones, "Oddaj kamienie, albo wypruj� Ci flaki!", Info_Saturas_Stones_Kill);
};

// ---------------------------kil----------------------------------------

FUNC VOID Info_Saturas_Stones_Kill()
{
	AI_Output(other, self, "Info_Saturas_Stones_Kill_15_00"); //Oddaj kamienie, albo wypruj� Ci flaki!
	AI_Output(self, other,"Info_Saturas_Stones_Kill_14_01"); //Jak �miesz grozi� mistrzowi Kr�gu Wody.
	AI_Output(self, other,"Info_Saturas_Stones_Kill_14_02"); //Zap�acisz za to w�asn� krwi�!
	Log_SetTopicStatus(CH4_RBL_FocusStones, LOG_FAILED);
	B_LogEntry(CH4_RBL_FocusStones, "No c�, chyba troch� mnie ponios�o. Mog� zapomnie� o kamieniach ogniskuj�cych.");
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);
};

// ---------------------------glr----------------------------------------

FUNC VOID Info_Saturas_Stones_Glory()
{
	AI_Output(other, self, "Info_Saturas_Stones_Glory_15_00"); //Dzi�ki ostrzu zdob�d� s�aw�.
	AI_Output(self, other,"Info_Saturas_Stones_Glory_14_01"); //Nie pomog� komu�, kim kieruj� tylko egoistyczne pobudki.
	AI_Output(self, other,"Info_Saturas_Stones_Glory_14_02"); //Miecz runiczny zosta� wykuty z my�l� o niesieniu pomocy lub szerzeniu zag�ady.
	AI_Output(self, other,"Info_Saturas_Stones_Glory_14_03"); //Jeszcze nikt nie u�ywa� ostrza, aby s�u�y� r�wnowadze tego �wiata.
	B_LogEntry(CH4_RBL_FocusStones, "Nie zdob�d� kamieni, my�l�c tylko o sobie.");
	Info_ClearChoices (Info_Saturas_Stones);
};

// --------------------------glr----------------------------------------

FUNC VOID Info_Saturas_Stones_Protect()
{
	focus_get = TRUE;
	AI_Output(other, self, "Info_Saturas_Stones_Protect_15_00"); //Kamienie pomog� mi zachowa� r�wnowag� pomi�dzy boskimi si�ami.
	AI_Output(self, other,"Info_Saturas_Stones_Protect_14_01"); //To ciekawe... By� mo�e pomyli�em si� co do Ciebie.
	AI_Output(self, other,"Info_Saturas_Stones_Protect_14_02"); //Dobrze, otrzymasz kamienie ogniskuj�ce.
	AI_Output(self, other,"Info_Saturas_Stones_Protect_14_03"); //Stra�nikiem kamieni jest Nefarius.
	AI_Output(self, other,"Info_Saturas_Stones_Protect_14_04"); //Przekonaj go tak, jak przekona�e� mnie.
	B_LogEntry(CH4_RBL_FocusStones, "Przekona�em Saturasa. Stra�nikiem kamieni jest Nefarius. Musz� natychmiast z nim porozmawia�.");
	B_StopProcessInfos(self); 
};

// *************************************************

instance Info_Saturas_StonesAgain (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	11;
	condition	=	Info_Saturas_StonesAgain_Condition;
	information	=	Info_Saturas_StonesAgain_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Wracaj�c do kamieni..."; 
};                       

FUNC int Info_Saturas_StonesAgain_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Stones))&&(!focus_get)
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_StonesAgain_Info()
{
	AI_Output(other, self, "Info_Saturas_StonesAgain_15_00"); //Wracaj�c do kamieni...
	AI_Output(self, other,"Info_Saturas_StonesAgain_14_01"); //Nie mamy do czego wraca� - odejd�!
	
   B_StopProcessInfos(self); 
};

// *************************************************

instance  Info_Saturas_Ritual2 (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	12;
	condition	=	Info_Saturas_Ritual2_Condition;
	information	=	Info_Saturas_Ritual2_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Wszystko jest ju� przygotowane do przeprowadzenia rytua�u."; 
};                       

FUNC int  Info_Saturas_Ritual2_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Ritual))&&(satur_ritual == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Ritual2_Info()
{
	AI_Output(other, self, "Info_Saturas_Ritual2_15_00"); //Wszystko jest ju� przygotowane do przeprowadzenia rytua�u.
	AI_Output(self, other,"Info_Saturas_Ritual2_14_01"); //W porz�dku, gdzie rytua� si� odb�dzie?
	AI_Output(other, self, "Info_Saturas_Ritual2_15_02"); //Leren czeka w pobli�u kamiennego kr�gu na bagnach.
	AI_Output(self, other,"Info_Saturas_Ritual2_14_03"); //Wiem, gdzie to jest, wkr�tce tam przyb�d�.
	B_LogEntry(CH4_RBL_Rirual, "Saturas wyruszy� do kamiennego kr�gu.");
	Npc_ExchangeRoutine(self, "RITUAL");
	B_StopProcessInfos(self);
};

// *************************************************

instance  Info_Saturas_WhereLee (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	13;
	condition	=	Info_Saturas_WhereLee_Condition;
	information	=	Info_Saturas_WhereLee_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Gdzie jest Lee?"; 
};                       

FUNC int  Info_Saturas_WhereLee_Condition()
{
	if (Kapitel>=5)&&(Npc_KnowsInfo(hero,DIA_Lee_RBLBosses))
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_WhereLee_Info()
{
	AI_Output(other, self, "Info_Saturas_WhereLee_15_00"); //Gdzie jest Lee?
	AI_Output(self, other,"Info_Saturas_WhereLee_14_01"); //Wyruszy� do Nowego Obozu. Pos�a�em z nim Cronosa, by�em mu to winien.
	AI_Output(other, self, "Info_Saturas_WhereLee_15_02"); //Cholera, mam nadziej�, �e nie zaczn� beze mnie!
	B_LogEntry (CH4_RBL_NCRebel, "Lee wyruszy� do Nowego Obozu, musz� tam go poszuka�.");
};

// *************************************************

instance  Info_Saturas_GoBackNC (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	14;
	condition	=	Info_Saturas_GoBackNC_Condition;
	information	=	Info_Saturas_GoBackNC_Info;
	permanent	=	0;
	important	=	0;	
	description		= "W Nowym Obozie zapanowa� stary porz�dek."; 
};                       

FUNC int  Info_Saturas_GoBackNC_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_WhereLee))&&(Npc_KnowsInfo(hero,DIA_Lee_TheRockCompleated))
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_GoBackNC_Info()
{
	AI_Output(other, self, "Info_Saturas_GoBackNC_15_00"); //W Nowym Obozie zapanowa� stary porz�dek.
	AI_Output(self, other,"Info_Saturas_GoBackNC_14_01"); //By�em pewien, �e Lee dopnie swego. Ciekawe, ile stra�nicy rozkradli z naszego mienia?
	AI_Output(other, self, "Info_Saturas_GoBackNC_15_02"); //Sami si� przekonajcie. Lee powiedzia�, �e mo�ecie wraca� do 'domu'.
	AI_Output(self, other,"Info_Saturas_GoBackNC_14_03"); //I tak te� si� stanie. Ale na razie wr�cimy tylko do Nowego Obozu.
	AI_Output(self, other,"Info_Saturas_GoBackNC_14_04"); //Emisariusz dobrego s�owa jest u nas zawsze mile widziany.
	AI_Output(self, other,"Info_Saturas_GoBackNC_14_05"); //Pod��aj drog� Adanosa.
	AI_Output(other, self, "Info_Saturas_GoBackNC_15_06"); //Nigdy nie wiadomo, gdzie si� zb��dzi... Bywaj.

	var C_NPC mag1; mag1 = Hlp_GetNpc(KDW_601_Myxir);
	var C_NPC mag2; mag2 = Hlp_GetNpc(KDW_602_Merdarion);
	var C_NPC mag3; mag3 = Hlp_GetNpc(KDW_603_Nefarius);
	var C_NPC mag4; mag4 = Hlp_GetNpc(KDW_604_Cronos);
	var C_NPC mag5; mag5 = Hlp_GetNpc(KDW_605_Riordian);

	Npc_ExchangeRoutine(self,"start");
	Npc_ExchangeRoutine(mag1,"start");
	Npc_ExchangeRoutine(mag2,"start");
	Npc_ExchangeRoutine(mag3,"start");
	Npc_ExchangeRoutine(mag4,"start");
	Npc_ExchangeRoutine(mag5,"start");
};

INSTANCE DIA_Saturas_CanYouTeachMe (C_INFO)
{
	npc				= KDW_600_Saturas;
	//nr				= 71;
	condition		= DIA_Saturas_CanYouTeachMe_Condition;
	information		= DIA_Saturas_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Saturas_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Saturas_SaveDick))
	{
		return 1;
	};
};

FUNC VOID DIA_Saturas_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Saturas_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Saturas_CanYouTeachMe_12_02"); //Posiadam wiedz� o kr�gach magii.
	
	Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
	B_LogEntry(GE_TeacherOW, "Saturas nauczy mnie magicznych zakl��, ale tylko jak zostan� magiem.");
};