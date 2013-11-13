// ********************************
// 				EXIT
// ********************************

instance DIA_Torlof_EXIT (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_EXIT_Condition;
	information	= DIA_Torlof_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Torlof_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_EXIT_Info()
{
	B_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Torlof_Hallo (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 1;
	condition	= DIA_Torlof_Hallo_Condition;
	information	= DIA_Torlof_Hallo_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Nazywam si� Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Bra�em udzia� w buncie za�ogi na pok�adzie kr�lewskiego okr�tu.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //To chyba nie by� najlepszy pomys�. Wi�ksza cz�� za�ogi by�a po stronie kapitana.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //W ten spos�b wyl�dowa�em tutaj.
};

// ********************************

instance DIA_Torlof_Here (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 2;
	condition	= DIA_Torlof_Here_Condition;
	information	= DIA_Torlof_Here_Info;
	permanent	= 0;
	description = "A jak trafi�e� do kopalni?";
};                       

FUNC int DIA_Torlof_Here_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Torlof_Hallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Here_Info()
{
	AI_Output (other, self,"DIA_Torlof_Here_15_00"); //A jak trafi�e� do kopalni?
	AI_Output (self, other,"DIA_Torlof_Here_04_01"); //Do ko�ca walczy�em ze stra�nikami, wtedy zepchn�li nas do kopalni, to by� nasz ostatni bastion.
	AI_Output (self, other,"DIA_Torlof_Here_04_02"); //Przeprowadzili kilka atak�w, ale wszystkie odparli�my. Kopalnia to dobre miejsce do obrony.
	AI_Output (self, other,"DIA_Torlof_Here_04_03"); //W ko�cu zawarli�my co� na kszta�t rozejmu. Mogli nas wzi�� g�odem wi�c i tak nie mieli�my wyj�cia.
	AI_Output (self, other,"DIA_Torlof_Here_04_04"); //Odpowiadam teraz za wszystkich skaza�c�w z kopalni i za te cholerne limity.
	AI_Output (other, self,"DIA_Torlof_Here_15_05"); //Jakie limity?
	AI_Output (self, other,"DIA_Torlof_Here_04_06"); //Limity wydobycia rudy. Znowu je podnie�li, teraz to ju� sto dwadzie�cia funt�w czystej rudy.
	AI_Output (self, other,"DIA_Torlof_Here_04_07"); //Kiedy wydobywamy mniej, zabijaj� jednego z kopaczy i nie dostajemy wtedy racji �ywno�ciowych.
	AI_Output (other, self,"DIA_Torlof_Here_15_08"); //Sukinsyny. Cz�sto to si� zdarza?
	AI_Output (self, other,"DIA_Torlof_Here_04_09"); //Niestety za cz�sto. A co najgorsze jest nas coraz mniej, trudniej o wi�kszy urobek.
	AI_Output (other, self,"DIA_Torlof_Here_15_10"); //Mo�e nied�ugo si� to zmieni.
	B_LogEntry		(CH4_GRD_NewMine, "W ko�cu znalaz�em Torlofa. To on przewodzi skaza�cami w kopalni. Maj� spory problem z dotrzymaniem limit�w wydobycia rudy.");
};

// ********************************

instance DIA_Torlof_RBL (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 3;
	condition	= DIA_Torlof_RBL_Condition;
	information	= DIA_Torlof_RBL_Info;
	permanent	= 0;
	description = "Na g�rze szykuje si� co� wi�kszego.";
};                       

FUNC int DIA_Torlof_RBL_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_RebelTalk))&&(Npc_KnowsInfo (hero, DIA_Torlof_Here))
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_RBL_Info()
{
	AI_Output (other, self,"DIA_Torlof_RBL_15_00"); //Na g�rze szykuje si� co� wi�kszego.
	AI_Output (self, other,"DIA_Torlof_RBL_04_01"); //O czym m�wisz?
	AI_Output (other, self,"DIA_Torlof_RBL_15_02"); //Wi�kszo�� najemnik�w i szkodnik�w ma ju� do�� stra�nik�w.
	AI_Output (self, other,"DIA_Torlof_RBL_04_03"); //To by�o do przewidzenia. Co planuj�?
	AI_Output (other, self,"DIA_Torlof_RBL_15_04"); //Najpierw musimy mie� pewno�� co do Ciebie i Twoich ludzi.
	AI_Output (self, other,"DIA_Torlof_RBL_04_05"); //Jestem z wami do kro�set! Dajcie tylko znak, a zrobimy tu krwaw� jatk�!
	AI_Output (other, self,"DIA_Torlof_RBL_15_06"); //Nie tak szybko.	
	AI_Output (self, other,"DIA_Torlof_RBL_04_07"); //Kiedy planujecie atak?
	AI_Output (other, self,"DIA_Torlof_RBL_15_08"); //No w�a�nie to jest najwi�kszy problem. Nikt nie chce wykona� pierwszego ruchu.
	AI_Output (self, other,"DIA_Torlof_RBL_04_09"); //Cholera, gdyby tu by� Lee nie by�oby �adnego problemu.
	AI_Output (self, other,"DIA_Torlof_RBL_04_10"); //Musisz go odnale�� i powiedzie� co si� kroi.
	lee_back = lee_back + 1;
	AI_Output (other, self,"DIA_Torlof_RBL_15_11"); //W porz�dku. Dam Ci zna� kiedy wszystko b�dzie gotowe.
	B_LogEntry		(CH4_NC_RBLBosses, "Torlof ruszy do boju, kiedy Lee stanie na czele rebelii w Nowym Obozie.");
};

// ********************************

instance DIA_Torlof_Hlp (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 4;
	condition	= DIA_Torlof_Hlp_Condition;
	information	= DIA_Torlof_Hlp_Info;
	important		= 1;
	permanent		= 0;
	description = ".";
};                       

FUNC int DIA_Torlof_Hlp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Torlof_RBL))
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Hlp_Info()
{
	AI_Output (self, other,"DIA_Torlof_Hlp_04_01"); //Zaczekaj. Mam do Ciebie pro�b�. Chodzi o urobek.
	AI_Output (other, self,"DIA_Torlof_Hlp_15_02"); //Tak?
	AI_Output (self, other,"DIA_Torlof_Hlp_04_03"); //Mam tu kilku malkontent�w. Trzeba ich przekona�, �eby ci�ej pracowali.
	AI_Output (self, other,"DIA_Torlof_Hlp_04_04"); //Ja nie mam ju� do nich cierpliwo�ci, a nie chc�, �eby rozmowa sko�czy�a si� czyim� zgonem.
	AI_Output (self, other,"DIA_Torlof_Hlp_04_05"); //Oni musz� �y�, bo martwi na nic si� nie przydadz�. Mo�e Ty znajdziesz jaki� spos�b, �eby przekona� do pracy tych darmozjad�w?
	AI_Output (self, other,"DIA_Torlof_Hlp_04_06"); //Pomo�esz mi z urobkiem, to ja pomog� Ci wydosta� si� z kopalni.
	AI_Output (other, self,"DIA_Torlof_Hlp_15_07"); //W porz�dku. Co to za malkontenci?
	AI_Output (self, other,"DIA_Torlof_Hlp_04_08"); //Homer, Cipher i Butch. Ale pami�taj, potrzebuj� ich �ywych!
	AI_Output (other, self,"DIA_Torlof_Hlp_15_09"); //B�d� mia� to na uwadze. Co� jeszcze?
	AI_Output (self, other,"DIA_Torlof_Hlp_04_10"); //Porozmawiaj z Sherem. On zna tu ka�dego, a ludzie go szanuj�. Mo�e co� Ci doradzi.
	AI_Output (other, self,"DIA_Torlof_Hlp_15_11"); //W porz�dku.
	B_LogEntry		(CH4_GRD_NewMine, "Torlof pomo�e mi wydosta� si� z kopalni, je�eli ja przekonam Homera, Ciphera i Butcha do ci�szej pracy. Mo�e Sher jako� mi pomo�e. Aha - �aden ze skaza�c�w nie mo�e zgin��!");
};

// ********************************

instance DIA_Torlof_HlpEnd (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 5;
	condition	= DIA_Torlof_HlpEnd_Condition;
	information	= DIA_Torlof_HlpEnd_Info;
	important		= 0;
	permanent		= 0;
	description = "Co do twoich kopaczy...";
};                       

FUNC int DIA_Torlof_HlpEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Sher_Hlp))&&(miners_work >= 1)
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_HlpEnd_Info()
{
	var C_NPC jurg; jurg = Hlp_GetNpc(Grd_4090_Jurgen);
   
	AI_Output (other, self,"DIA_Torlof_HlpEnd_15_01"); //Co do twoich kopaczy...
	AI_Output (self, other,"DIA_Torlof_HlpEnd_04_02"); //Jak ci posz�o?
	
   if (miners_work == 3)
	{
		AI_Output (other, self,"DIA_Torlof_HlpEnd_15_03"); //Przekona�em wszystkich trzech do bardziej wyt�onej pracy.
		AI_Output (other, self,"DIA_Torlof_HlpEnd_15_04"); //Ale nie da�bym rady bez pomocy Shera.
	}
	else if (miners_work >= 1)&&(miners_work < 3)
	{
		AI_Output (other, self,"DIA_Torlof_HlpEnd_15_05"); //Pracuj� nad tym, s� ju� spore post�py, ale nie przekona�em jeszcze wszystkich.
		AI_Output (other, self,"DIA_Torlof_HlpEnd_15_06"); //Na szcz�cie Sher bardzo mi pom�g�.
	};
   
	AI_Output (self, other,"DIA_Torlof_HlpEnd_04_07"); //Dobra robota, mo�e jeszcze zd��ymy...
	AI_TurnToNpc(self, jurg);
	AI_Output (self, other,"DIA_Torlof_HlpEnd_04_08"); //Cholera tylko nie to!
	AI_Output (other, self,"DIA_Torlof_HlpEnd_15_09"); //Co si� dzieje?
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Torlof_HlpEnd_04_10"); //Ju� za p�no. Jurgen idzie odebra� urobek.
	B_StopProcessInfos	(self);
   
	AI_GotoWP(jurg, "FM_151");
   Npc_ExchangeRoutine(jurg, "TalkingWithTorlof");
};

// ********************************

instance DIA_Torlof_TalkingWithJurgen (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 1;
	condition	= DIA_Torlof_TalkingWithJurgen_Condition;
	information	= DIA_Torlof_TalkingWithJurgen_Info;
	permanent		= 0;
	important		= 1;
	description		= "...";
};                       

FUNC int DIA_Torlof_TalkingWithJurgen_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Jurgen_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Torlof_TalkingWithJurgen_Info()
{
   var C_NPC jurgen; jurgen = Hlp_GetNpc(Grd_4090_Jurgen);
	B_FullStop (hero);
	AI_TurnToNpc(self, jurgen);
   
   AI_Output (self, other, "DIA_Jurgen_First_11_00"); //Daj mi jeszcze kilka chwil...
   
   B_StopProcessInfos(self);
};

instance DIA_Torlof_Fight (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 6;
	condition	= DIA_Torlof_Fight_Condition;
	information	= DIA_Torlof_Fight_Info;
	important		= 1;
	permanent		= 0;
	description = "...";
};                       

FUNC int DIA_Torlof_Fight_Condition()
{
	var C_NPC sher; sher = Hlp_GetNpc(Non_4088_Sher);

	if (Npc_KnowsInfo (hero, DIA_Jurgen_Third))&&(Npc_IsDead(sher))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Fight_Info()
{
	/**************************
Wsadzamy Bezia do kopalnii. W��czy mu si� gadka po tej torlofa
*************************/
	//Third/or four nameless?
	//	Wld_InsertNpc (Non_4125_NoName,"Mine_Entr");
	var C_NPC jur; jur = Hlp_GetNpc(Grd_4090_Jurgen);

	B_FullStop (hero);
	AI_TurnToNpc(self, jur);
	AI_GotoNpc(self, jur);
	AI_TurnToNpc(jur, self);

	AI_Output (self, other,"DIA_Torlof_Fight_04_01"); //Wystarczy ju� krwi i morderstw! Jestem odpowiedzialny za tych ludzi.
	AI_Output (self, other,"DIA_Torlof_Fight_04_02"); //Najwy�sza pora zrobi� porz�dek ze stra�nikami.
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Torlof_Fight_04_05"); //Uciekaj Rick, opowiedz o tym co si� wydarzy�o Lee i wr��cie tak szybko jak tylko zdo�acie.
	AI_Output (self, other,"DIA_Torlof_Fight_04_06"); //Niech �mier� Shera nie p�jdzie na marne.
	AI_Output (other, self,"DIA_Torlof_Fight_15_07"); //Mo�esz by� tego pewien!
	AI_TurnToNpc(self, jur);
	AI_DrawWeapon (self);
	AI_Output (self, other,"DIA_Torlof_Fight_04_08"); //Czas na ma�y rozpierdol!
	Log_SetTopicStatus	(CH4_GRD_NewMine, LOG_SUCCESS);
	B_LogEntry		(CH4_GRD_NewMine, "Dopiero �mier� Shera sk�oni�a Torlofa do otwartej walki. Musz� jak najszybciej przekona� Lee, �eby wr�ci� do obozu i poprowadzi� swoich ludzi do walki o wolno��. Torlof powinien utrzyma� si� przez jaki� czas - kopalni� �atwo broni� do tego zgromadzili spore zapasy �ywno�ci.");
	B_StopProcessInfos	(self);

	/************************
	Ork niech ci dwaj si� na siebie rzuc�. Reszta kopaczy nie zaatakuje tych 2 stra�nik�w a Dick ma ucieka� z kopalni - przyda�aby si� kamerka prosta tutaj
	***********************/

	B_StartAfterDialogFight(self,jur,false);
	B_StartAfterDialogFight(jur,self,false);

	/*************
	Dick ma uciec z kopalni
	**************/

	AI_GotoWP		(other, "FM_02");
	
	/*****************
	
	niech stra�nicy walcz�
		Grd_20271_GRD
	Grd_20272_GRD
	Grd_20273_GRD
******************/

	Npc_SetTempAttitude(jur,ATT_HOSTILE); Npc_SetAttitude(jur,ATT_HOSTILE);
	var C_NPC g2;	g2 = Hlp_GetNpc(Grd_20272_GRD); Npc_SetTempAttitude(g2,ATT_HOSTILE); Npc_SetAttitude(g2,ATT_HOSTILE);
	var C_NPC g3;	g3 = Hlp_GetNpc(Grd_20273_GRD); Npc_SetTempAttitude(g3,ATT_HOSTILE); Npc_SetAttitude(g3,ATT_HOSTILE);
	var C_NPC g1;	g1 = Hlp_GetNpc(Grd_20271_GRD); Npc_SetTempAttitude(g1,ATT_HOSTILE); Npc_SetAttitude(g1,ATT_HOSTILE);
};

// ********************************

instance DIA_Torlof_Save (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 7;
	condition	= DIA_Torlof_Save_Condition;
	information	= DIA_Torlof_Save_Info;
	important		= 1;
	permanent		= 0;
	description = ".";
};                       

FUNC int DIA_Torlof_Save_Condition()
{
	/*************************************
Ork trzeba zrobi� tak, �e gracz musi przebi� si� do kopalni i najlepiej by�oby jakby portal do kopalni by� aktywny dopiero po zabiciu wszystkich stra�nik�w. Ma nie by� �atwo, niech gracz troch� pomy�li zanim rzuci si� na stra�nik�w

***********************************/

	if (task_choice == 2)&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Save_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);

	AI_Output (self, other,"DIA_Torlof_Save_04_01"); //Wr�ci�e�! Na ow�osione jaja Beliara, nie s�dzi�em, �e jeszcze zobacz� t� paskud� mord�.
	AI_Output (other, self,"DIA_Torlof_Save_15_02"); //Ja te� si� ciesz�, �e nie da�e� si� poszatkowa�. Kto by mi wtedy postawi� kolejk�?
	AI_Output (self, other,"DIA_Torlof_Save_04_03"); //He, he. �wi�te s�owa, jak tylko wykopiemy z obozu stra�nik�w masz u mnie anta�ek ry��wki.
	AI_Output (other, self,"DIA_Torlof_Save_15_04"); //Trzymam Ci� za s�owo. A poza tym - Lee wr�ci�.
	AI_Output (self, other,"DIA_Torlof_Save_04_05"); //I to w�a�nie chcia�em us�ysze�! No to na co jeszcze czekamy?
	AI_Output (other, self,"DIA_Torlof_Save_15_06"); //Na razie zabezpiecz kopalni�. Lee pode�le tu najemnik�w, obejmiesz nad nimi dow�dztwo.
	AI_Output (other, self,"DIA_Torlof_Save_15_07"); //Czekaj na sygna� do ataku. Wtedy b�dziesz m�g� dokopa� ka�demu napotkanemu stra�nikowi o ile ja Ci� nie uprzedz�.
	AI_Output (self, other,"DIA_Torlof_Save_04_08"); //O to si� nie obawiaj. W porz�dku, ogarn� ten burdel.
	AI_Output (self, other,"DIA_Torlof_Save_04_09"); //Pozdr�w ode mne Lee. Powiedz mu, �e stary Trolof nie w�tpi� nawet przez chwil� w jego powr�t.
	AI_Output (other, self,"DIA_Torlof_Save_15_10"); //Bywaj, brachu.

	B_LogEntry		(CH5_NO_Mine, "Przebi�em si� do Torlofa! Ten stary wyga nadal �yje. Ogarnie burdel w kopalni i b�dzie czeka� na znak od Lee. Czas przekaza� genera�owi pozdrowienia od Torlofa.");
}; 

INSTANCE DIA_Torlof_CanYouTeachMe (C_INFO)
{
	npc				= Sld_737_Torlof;
	nr				= 71;
	condition		= DIA_Torlof_CanYouTeachMe_Condition;
	information		= DIA_Torlof_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo�esz mnie czego� nauczy�?"; 
};

FUNC INT DIA_Torlof_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Torlof_Hallo))
	{
		return 1;
	};
};

FUNC VOID DIA_Torlof_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Torlof_CanYouTeachMe_15_01"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Torlof_CanYouTeachMe_12_02"); //Je�eli w czym� ci to pomo�e, to wiem co nieco o pe�zaczach.
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Torlof nauczy mnie jak pokroi� pe�zacze.");
};