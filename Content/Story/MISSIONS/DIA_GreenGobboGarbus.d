// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Garbus_Exit (C_INFO)
{
	npc			= GreenGobboGarbus;
	nr			= 999;
	condition	= DIA_Garbus_Exit_Condition;
	information	= DIA_Garbus_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Garbus_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Garbus_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Garbus_Hello (C_INFO)
{
	npc				= GreenGobboGarbus;
	nr				= 1;
	condition		= DIA_Garbus_Hello_Condition;
	information		= DIA_Garbus_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Garbus_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_FirstInnos))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Garbus_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Garbus_Hello_11_00"); //Cuchniesz Beliarem! 
	AI_Output (other, self, "DIA_Garbus_Hello_15_01"); //Nie dziwi� si�, niedawno by�em w posiadaniu czego�, co konsekrowano na Jego o�tarzu.
	AI_Output (self, other, "DIA_Garbus_Hello_11_02"); //M�j Pan ukaza� mi prawd�. Przyby�e� po pos��ek r�wnowagi. 
	AI_Output (other, self, "DIA_Garbus_Hello_15_03"); //Tak, szukam jednej z figurek Tritetry. Mo�esz mi w tym pom�c?
	AI_Output (self, other, "DIA_Garbus_Hello_11_04"); //Innos pomaga tylko tym, kt�rych serca s� czyste od k�amstwa i ob�udy. 
	AI_Output (self, other, "DIA_Garbus_Hello_11_05"); //Czy� dobro, a ja odp�ac� Ci podobn� monet�.
	AI_Output (other, self, "DIA_Garbus_Hello_15_06"); //Czego ��dasz w zamian za pos��ek, goblinie?
	AI_Output (self, other, "DIA_Garbus_Hello_11_07"); //Niedawno tam, sk�d przybywasz, pope�niono zbrodni� kradzie�y. Niejaki Kufel ukrad� �wistakowi sakiewk�.
	AI_Output (self, other, "DIA_Garbus_Hello_11_08"); //Napraw t� niegodziwo��, a otrzymasz to, czego szukasz.
	AI_Output (other, self, "DIA_Garbus_Hello_15_09"); //Niech b�dzie.
	B_LogEntry(CH2_RBL_Tritetra, "Dostan� pos��ek Innosa, je�eli odzyskam dla �wistaka sakiewk�, kt�r� ukrad� mu Kufel. Dziwi� si�, �e drobna kradzie� w dolinie pe�nej skaza�c�w zwr�ci�a uwag� boga, ale skoro tego ��da, to zapracuj� na ten pos��ek.");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Garbus_HelloAgain (C_INFO)
{
	npc				= GreenGobboGarbus;
	nr				= 1;
	condition		= DIA_Garbus_HelloAgain_Condition;
	information		= DIA_Garbus_HelloAgain_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Garbus_HelloAgain_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Whistler_Sack))&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Garbus_HelloAgain_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Garbus_HelloAgain_11_00"); //Dokona�o si�. Naprawi�e� wyrz�dzone z�o.
	AI_Output (other, self, "DIA_Garbus_HelloAgain_15_01"); //Tak z ciekawo�ci pytam. Dlaczego Tw�j Pan zainteresowa� si� jak�� tam kradzie��?
	AI_Output (other, self, "DIA_Garbus_HelloAgain_15_02"); //W kolonii codziennie dochodzi do du�o gorszych zbrodni. 
	AI_Output (self, other, "DIA_Garbus_HelloAgain_11_03"); //Gdyby� nie odzyska� sakiewki, Kufel kupi�by za ni� zanieczyszczony bimber. Wielu ludzi straci�oby przez to �ycie.
	AI_Output (other, self, "DIA_Garbus_HelloAgain_15_04"); //W�tpi�, �eby bandzie z obozu zaszkodzi�y nawet siki Beliara, a tym bardziej zanieczyszczony alkohol.
	AI_Output (self, other, "DIA_Garbus_HelloAgain_11_05"); //By� mo�e, ale teraz ju� nie poznamy prawdy.
	AI_Output (self, other, "DIA_Garbus_HelloAgain_11_06"); //Oto Twoja nagroda.
	/*************************
	Przyda�o by si� zrobi� pos��ek innosa
	*************************/

	CreateInvItems (self, tri_innos_statue,1); 	
	B_GiveInvItems (self, other, tri_innos_statue, 1);
	/****************************
	Nie wiem, jaka� zmiana rutyny, pfx, etc.
	****************************/
	B_LogEntry(CH2_RBL_Tritetra, "Zdoby�em pos��ek Innosa, musz� go jak najszybciej odda� Lerenowi.");
};