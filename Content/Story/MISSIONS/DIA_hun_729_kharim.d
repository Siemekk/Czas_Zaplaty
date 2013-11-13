
// **************************************************
// 						 EXIT 
// **************************************************
//TODO: W 3cim rozdziale jakis dialog, moze misja w ktorej informacja ze kharim wyrusza do NO
INSTANCE DIA_hun_729_kharim_Exit (C_INFO)
{
	npc			= hun_729_kharim;
	nr			= 999;
	condition	= DIA_hun_729_kharim_Exit_Condition;
	information	= DIA_hun_729_kharim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_hun_729_kharim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_hun_729_kharim_Exit_Info()
{
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_hun_729_kharim_Stew (C_INFO)
{
	npc				= hun_729_kharim;
	nr				= 12;
	condition		= DIA_hun_729_kharim_Stew_Condition;
	information		= DIA_hun_729_kharim_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynios�em porcj� gulaszu."; 
};

FUNC INT DIA_hun_729_kharim_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	&&(!Npc_KnowsInfo(other,DIA_RATFORD_Hanis1))
	{
		return 1;
	};
};

FUNC VOID DIA_hun_729_kharim_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_hun_729_kharim_Stew_15_01"); //Przynios�em porcj� gulaszu.
	AI_Output (self, other, "DIA_hun_729_kharim_Stew_11_02"); //Ca�kiem opad�em z si�, z ch�ci� wrzuc� co� na ruszt.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Gulasz doda� si� Kharimowi."); 
};

// **************************************************

instance Info_Kharim_What(C_INFO)
{
	npc				= hun_729_kharim;
	nr				= 1;
	condition		= Info_Kharim_What_Condition;
	information		= Info_Kharim_What_Info;
	permanent		= 0;
	description 	= "Lubisz macha� mieczem?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_KharimOR_What_15_00"); //Lubisz macha� mieczem?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //Jestem Kharim! Widz�, �e trafi�e� tu niedawno, inaczej ju� by� o mnie us�ysza�!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Jestem najlepszym wojownikiem, jakiego ten zawszony ob�z kiedykolwiek ogl�da�.
};

// **************************************************

instance Info_Kharim_WhatGor (C_INFO)
{
	npc				= hun_729_kharim;
	nr				= 2;
	condition		= Info_Kharim_WhatGor_Condition;
	information		= Info_Kharim_WhatGor_Info;
	permanent		= 0;
	important		= 0;
	description 	= "Hanis wspomina�, �e si� z tob� posprzecza�.";
};                       

FUNC INT Info_Kharim_WhatGor_Condition()
{
	if (Npc_KnowsInfo(other,Info_GorHanis_Arena))
	{
		return 1;
	};
};

func VOID Info_Kharim_WhatGor_Info()
{
	AI_Output (other, self,"Info_Kharim_WhatGor_15_00"); //Hanis wspomina�, �e si� z tob� posprzecza�.
	AI_Output (self, other,"Info_Kharim_WhatGor_09_01"); //Ten p�g��wek dosta� to, na co zas�u�y�! �miecie, jak on, musz� zna� swoje miejsce w stadzie.
	AI_Output (other, self,"Info_Kharim_WhatGor_15_02"); //To ty mu da�e� przez �eb?
	AI_Output (self, other,"Info_Kharim_WhatGor_09_03"); //Pewnie, �e ja!
	AI_Output (self, other,"Info_Kharim_WhatGor_09_04"); //Ten idiota powali� mnie na ziemi� podczas walki treningowej. Oczywi�cie to by� czysty przypadek.
	AI_Output (self, other,"Info_Kharim_WhatGor_09_05"); //Wyci�gn�� r�k�, �eby pom�c mi wsta�. To by�o naprawd� g�upie posuni�cie.
	AI_Output (self, other,"Info_Kharim_WhatGor_09_06"); //Przywali�em mu p�azem w �eb, �e zadudni�o.
	AI_Output (other, self,"Info_Kharim_WhatGor_15_07"); //To przez to ma problemy z pami�ci�?
	AI_Output (self, other,"Info_Kharim_WhatGor_09_08"); //A co mnie to obchodzi. Sam si� tego prosi�. A Tobie co do tego?
	AI_Output (other, self,"Info_Kharim_WhatGor_15_09"); //Kto go wyrzuci� z obozu?
	AI_Output (self, other,"Info_Kharim_WhatGor_09_10"); //Ratford. Quentin widzia� jak by�o i zezna� na moj� korzy��.
	AI_Output (other, self,"Info_Kharim_WhatGor_15_11"); //Ciekawa historyjka.

	B_LogEntry(CH2_RBL_Mem, "Kharim potwierdzi�, �e to on uderzy� Hanisa podczas walki treningowej. Do tego to by� nieuczciwy cios. Dowiedzia�em si� te�, �e Hanisa z obozu wyrzuci� Ratford w �wietle zezna� Quentina. Ciekawe... Mo�e Quentin powie co� wi�cej?");
};

// **************************************************

instance Info_Kharim_WhatGor1 (C_INFO)
{
	npc				= hun_729_kharim;
	nr				= 3;
	condition		= Info_Kharim_WhatGor1_Condition;
	information		= Info_Kharim_WhatGor1_Info;
	permanent		= 0;
	important		= 0;
	description 	= "Dlaczego to zrobi�e�?";
};                       

FUNC INT Info_Kharim_WhatGor1_Condition()
{
	if (Npc_KnowsInfo(other,DIA_RATFORD_Hanis1))
	{
		return 1;
	};
};

func VOID Info_Kharim_WhatGor1_Info()
{
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_00"); //Dlaczego to zrobi�e�?
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_01"); //Co do cholery?
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_02"); //M�wi� o kl�twie berserkera.
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_03"); //Sk�d... A to sukinsyn z tego Kagana. Jeszcze si� z nim policz�!
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_04"); //Z nikim si� ju� nie policzysz. Wracasz do Nowego Obozu, a Hanis znowu b�dzie szkoli� rekrut�w.
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_05"); //Pluj� na ten wasz ob�z! Za dobry jestem, �eby tu gni�! Ju� dawno mia�em wraca� do Lee.
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_06"); //Dlaczego uknu�e� ca�y ten plan?
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_07"); //Dlaczego? Ten skurwiel Hanis pokona� mnie w walce. I to dwukrotnie!
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_08"); //Nikt nie mo�e by� lepszy ode mnie! Nikt!
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_09"); //S�yszysz?! Jestem najlepszym szermierzem w ca�ej tej cuchn�cej Kolonii!
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_10"); //Ty? �cierwojad by sobie lepiej poradzi� z twoim mieczem.
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_11"); //Jak �miesz...
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_12"); //Wiesz jak o tobie m�wi�? Wielki Kharim z ma�� ku�k�.
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_13"); //Mistrz przechwa�ek, z kt�rego wszyscy szydz�.
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_14"); //To niemo�liwe...
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_15"); //A jednak. Jeste� po�miewiskiem i tch�rzem, kt�ry podst�pem pokona� prawdziwego wojownika.
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_16"); //A teraz zejd� mi z oczu gnido, bo wypruj� ci flaki!
	
	B_LogEntry(CH2_RBL_Mem, "Kharim wraca do Nowego Obozu.");
	Npc_ExchangeRoutine(self,"NC1");
	//TODO: Sher, W tym momencie brakuje ostrego wjazdu na psyche Kharima przez bohatera
	/****************
Niech Kharim wraca do NO, mo�e sta� gdzie� w pobli�u Laresa, czyli tam gdzie kiedy� sta� ry�owy ksi��e i lewus.
//TODO
****************/
};

instance Info_Kharim_Hi(C_INFO)
{
	npc				= hun_729_kharim;
	nr				= 1;
	condition		= Info_Kharim_Hi_Condition;
	information		= Info_Kharim_Hi_Info;
	permanent		= 0;
	important		= 1;
	description 	= "";
};                       

FUNC INT Info_Kharim_Hi_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Cord_ConvoysPeopleDone3))
	{
		return 1;
	};
};

func VOID Info_Kharim_Hi_Info()
{
	if (HANIS_TRUST)
	{
		AI_Output (other, self,"Info_Kharim_Hi_15_01"); //No prosz�, znajome �cierwo.
		AI_Output (self, other,"Info_Kharim_Hi_09_02"); //Prosz�, nie bij mnie!
		Npc_ExchangeRoutine(self,"NC1");
	}
	else
	{
      AI_Output (self, other,"Info_Kharim_Hi_09_03"); //Co� ty za jeden?
      AI_Output (other, self,"Info_Kharim_Hi_15_04"); //Mamy wsp�lnego znajomego, Corda.
      AI_Output (self, other,"Info_Kharim_Hi_09_05"); //W porz�dku, m�w co z tym konwojem.
      Npc_ExchangeRoutine(self,"START");
	};
   
	if (Npc_KnowsInfo (hero, DIA_Orkan_Again))&&(!Npc_KnowsInfo (hero, DIA_Orkan_EscortGo))&&(orkan_wait >= Wld_GetDay())
	{
		merc_trap = TRUE;
		AI_Output (other, self,"Info_Kharim_Hi_15_06"); //Konw�j wyruszy ju� wkr�tce. Niech Cord wy�le zwiadowc�w, musz� obserwowa� eskort�, bo nie znam trasy przemarszu.
		AI_Output (self, other,"Info_Kharim_Hi_09_07"); //Cholera jeszcze niedawno obija�em mordy w Starym Obozie, a teraz robi� za pos�a�ca. Dobra, Cord o wszystkim si� dowie.
		
		/*********************
      Ork zadanie dla ciebie. Zorganizuj zasadzk�. Tras� przemarszu zr�b mo�e tak, �eby oni poszli t� drog� przez orkowe tereny, ko�o tego kr�gu pod kt�rym by� kamie� ogniskuj�cy a na ko�cu zejd� t� �cie�k� w skale.
      Zasadzk� zorganizuj w�a�nie tam gdzie by� kamie� ogniskuj�cy pilnowany przez nieumar�ego magnata to najlepsze miejsce.
      Niech tam czeka z 8 najemnik�w z Cordem na czele. Dialog chc� tak zrobi�, �e najpierw zagada Cord, Dick b�dzie m�g� przekona� stra�nik�w, �e walka jest beznadziejna i mog� do��czy� do najmus�w, trafi� do kopalni albo zgin��.
      Wi�c niech najemnicy maj� gld nieutraln� ze stra�nikami na razie.
      *********************/
		
		//cord_trap ()l
	}
	else
	{
		AI_Output (other, self,"Info_Kharim_Hi_15_08"); //Zawali�em spraw�. Konw�j nie wyruszy z obozu.
		AI_Output (self, other,"Info_Kharim_Hi_09_09"); //I Cord zaufa� takiemu ciastochowi. Niech Ci� szlag trafi!
	};
   
	B_StopProcessInfos(self);
};