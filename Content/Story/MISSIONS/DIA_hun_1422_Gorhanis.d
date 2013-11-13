// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_hun_1422_gorhanis_Exit (C_INFO)
{
	npc			= hun_1422_gorhanis;
	nr			= 999;
	condition	= DIA_hun_1422_gorhanis_Exit_Condition;
	information	= DIA_hun_1422_gorhanis_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_hun_1422_gorhanis_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_hun_1422_gorhanis_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_hun_1422_gorhanis_Stew (C_INFO)
{
	npc				= hun_1422_gorhanis;
	nr				= 12;
	condition		= DIA_hun_1422_gorhanis_Stew_Condition;
	information		= DIA_hun_1422_gorhanis_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla ciebie gulasz od Snafa."; 
};

FUNC INT DIA_hun_1422_gorhanis_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_hun_1422_gorhanis_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_hun_1422_gorhanis_Stew_15_01"); //Mam dla ciebie gulasz od Snafa.
	AI_Output (self, other, "DIA_hun_1422_gorhanis_Stew_11_02"); //Niebo w g�bie.
	AI_Output (other, self, "DIA_hun_1422_gorhanis_Stew_15_03"); //Eee...
	AI_Output (self, other, "DIA_hun_1422_gorhanis_Stew_11_04"); //Dzi�ki, a teraz nie przeszkadzaj mi w degustacji.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Hanis z ch�ci� wzi�� swoj� porcj�."); 
};
// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_GorHanis_What(C_INFO)
{
	npc				= hun_1422_gorhanis;
	nr				= 1;
	condition		= Info_GorHanis_What_Condition;
	information		= Info_GorHanis_What_Info;
	permanent		= 0;
	description 	= "Co tu robisz?";
};                       

FUNC INT Info_GorHanis_What_Condition()
{
	return 1;
};

func VOID Info_GorHanis_What_Info()
{
	AI_Output (other, self,"Info_GorHanis_What_15_00"); //Co tu robisz?
	AI_Output (self, other,"Info_GorHanis_What_08_01"); //Ja? Walcz� ku chwale wielkiego �ni�cego!
	AI_Output (self, other,"Info_GorHanis_What_08_02"); //A nie... Zdaje si�, �e co� popl�ta�em.
	AI_Output (self, other,"Info_GorHanis_What_08_03"); //Kilka dni temu Kharim waln�� mnie w �eb i od tego czasu ci�ko mi pozbiera� my�li.
	AI_Output (self, other,"Info_GorHanis_What_08_04"); //Ekhm...
	AI_Output (self, other,"Info_GorHanis_What_08_05"); //Sk�d Ty si� tu wzi��e�?
	AI_Output (other, self,"Info_GorHanis_What_15_06"); //Przyp�yn��em...
	AI_Output (self, other,"Info_GorHanis_What_08_07"); //Cholera, jak ja si� nazywam?
	AI_Output (other, self,"Info_GorHanis_What_15_08"); //To ja ju� sobie p�jd�...
};

// **************************************************
//					Arena
// **************************************************

instance Info_GorHanis_Arena (C_INFO)
{
	npc				= hun_1422_gorhanis;
	nr				= 2;
	condition		= Info_GorHanis_Arena_Condition;
	information		= Info_GorHanis_Arena_Info;
	permanent		= 0;
	description 	= "Walczy�e� na arenie?";
};                       

FUNC INT Info_GorHanis_Arena_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Arena_Info()
{
	AI_Output (other, self,"Info_GorHanis_Arena1_15_00"); //Walczy�e� na arenie?
	AI_Output (self, other,"Info_GorHanis_Arena_08_01"); //Zosta�em wybrany przez moich mistrz�w, by broni� na arenie honoru obozu na bagnie.
	AI_Output (self, other,"Info_GorHanis_Arena_08_02"); //Przy�wieca mi wi�c wy�szy cel. Walcz�, by pokaza� niewiernym, jak wielka jest pot�ga �ni�cego!
	AI_Output (self, other,"Info_GorHanis_Arena_08_03"); //Zaraz... 
   
	AI_PlayAni (self, "T_SEARCH");
   
	AI_Output (self, other,"Info_GorHanis_Arena_08_04"); //Przecie� to nie ten ob�z!
	AI_Output (self, other,"Info_GorHanis_Arena_08_05"); //Gdzie ja do cholery jestem?
	AI_Output (other, self,"Info_GorHanis_Arena_15_06"); //Zdaje si�, �e w Obozie Rebeliant�w. Co� Ci to m�wi?
	AI_Output (self, other,"Info_GorHanis_Arena_08_07"); //Tak! St�d te� mnie za co� wyrzucili, tylko nie pami�tam, co to by�o...
	AI_Output (self, other,"Info_GorHanis_Arena_08_08"); //Zdaje si�, �e posz�o o co� z Kharimem...

	Log_CreateTopic(CH2_RBL_Mem, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Mem, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Mem, "Spotka�em Gor Hanisa. Dziwnie si� z nim rozmawia. Twierdzi, �e odk�d Kharim uderzy� go w g�ow�, ma problemy z pami�ci�. Powiedzia� te�, �e usuni�to go z Obozu Rebeliant�w w�a�nie przez jak�� sprzeczk� z Kharimem. Ciekawe co si� za tym kryje?");
};

// **************************************************

instance Info_GorHanis_RBL (C_INFO)
{
	npc				= hun_1422_gorhanis;
	nr				= 3;
	condition		= Info_GorHanis_RBL_Condition;
	information		= Info_GorHanis_RBL_Info;
	permanent		= 0;
	description 	= "Znowu nale�ysz do obozu.";
};                       

FUNC INT Info_GorHanis_RBL_Condition()
{
	if (Npc_KnowsInfo(self,DIA_RATFORD_Hanis1))
	{
		return 1;
	};
};

func VOID Info_GorHanis_RBL_Info()
{
	AI_Output (other, self,"Info_GorHanis_RBL_15_00"); //Znowu nale�ysz do obozu.
	AI_Output (self, other,"Info_GorHanis_RBL_08_01"); //Ja? Przecie� zabi�em tego rekruta. Nie mog� spojrze� w twarz innym rebeliantom.
	AI_Output (other, self,"Info_GorHanis_RBL_15_02"); //To nie by�a twoja wina. Kharim poda� Ci kl�tw� berserkera, kiedy Ci� cuci�. Wpad�e� w sza� i dlatego zgin�� rekrut.
	AI_Output (self, other,"Info_GorHanis_RBL_08_03"); //A to skurwiel!
	AI_Output (self, other,"Info_GorHanis_RBL_08_04"); //Cholera! Wr�ci�a mi pami��! To pewnie przez szok jaki teraz prze�y�em...
	AI_Output (other, self,"Info_GorHanis_RBL_15_05"); //Mo�liwe. Co teraz zamierzasz?
	AI_Output (self, other,"Info_GorHanis_RBL_08_06"); //Nadal b�d� szkoli� rekrut�w. 
	AI_Output (other, self,"Info_GorHanis_RBL_15_07"); //Chcesz si� zem�ci�?
	AI_Output (self, other,"Info_GorHanis_RBL_08_08"); //Zemsta jest przywilejem bog�w. Nie pod��� t� sam� drog� co Kharim.
	AI_Output (other, self,"Info_GorHanis_RBL_15_09"); //Dobrze to s�ysze�.
	AI_Output (self, other,"Info_GorHanis_RBL_08_10"); //Dzi�ki, przyjacielu. Bardzo mi pomog�e�. Nie wiem, jak m�g�bym si� odwdzi�czy�...
	AI_Output (self, other,"Info_GorHanis_RBL_08_11"); //We� to. Znalaz�em ten zw�j, kiedy by�em jeszcze stra�nikiem w obozie na bagnie.

	CreateInvItems (self,ItArScrollStormfist,1);
	B_GiveInvItems (self, other, ItArScrollStormfist, 1);
	HANIS_TRUST = true;

	/****************
Ork niech teraz ma practice sword gdzie� z rekrutami w obozie
****************/

	Npc_ExchangeRoutine(self,"start");

	Log_SetTopicStatus(CH2_RBL_Mem, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Mem, "Wszystko wr�ci�o do normy. Hanis odzyska� pami�� i nadal chce szkoli� rekrut�w. Zrezygnowa� te� z zemsty, a ja na tym zarobi�em. Czyli po staremu.");
};
