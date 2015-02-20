// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Vela_EXIT(C_INFO)
{
	npc			= EBR_108_Velaya;
	nr			= 999;
	condition			= Info_Vela_EXIT_Condition;
	information			= Info_Vela_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Vela_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vela_EXIT_Info()
{	
	B_StopProcessInfos(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Vela_Hello (C_INFO)
{
	npc		= EBR_108_Velaya;
	nr			= 1;
	condition		= Info_Vela_Hello_Condition;
	information		= Info_Vela_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Kim jeste� s�onko i co tutaj tak �adnie pachnie?";
};                       

FUNC INT Info_Vela_Hello_Condition()
{	
	return 1;
};

FUNC VOID Info_Vela_Hello_Info()
{	
	AI_Output (other, self,"Info_Vela_Hello_15_00"); //Kim jeste� s�onko i co tutaj tak �adnie pachnie?
	AI_Output (self, other,"Info_Vela_Hello_16_01"); //Odejd� g�upcze! Jestem kobiet� Gomeza!
	AI_Output (other, self,"Info_Vela_Hello_15_02"); //Nie szkodzi. To nawet lepiej, �e nie jeste� dziewic�...
	AI_Output (self, other,"Info_Vela_Hello_16_03"); //Ty bezczelny gnojku! Wyno� si� st�d, bo zawo�am stra�e!
	AI_Output (other, self,"Info_Vela_Hello_15_04"); //Je�eli wolisz gdy kilku niegrzecznych ch�opc�w...
	AI_Output (self, other,"Info_Vela_Hello_16_05"); //Precz mi z oczu zbocze�cu. Nie chc� Ci� wi�cej widzie�!
	
   B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE Info_Vela_HelloAgain (C_INFO)
{
	npc		= EBR_108_Velaya;
	nr			= 2;
	condition		= Info_Vela_HelloAgain_Condition;
	information		= Info_Vela_HelloAgain_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Vela_HelloAgain_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Harf_ProposalOk))&&(Npc_KnowsInfo (hero, Info_Vela_Hello))&&(NPC_HasItems(other,akt)>=1)
	{
		return 1;
	};
};

FUNC VOID Info_Vela_HelloAgain_Info()
{	
	AI_Output (self, other,"Info_Vela_HelloAgain_16_01"); //To znowu Ty! Wyno� si�, zanim zawo�am stra�e!
	AI_Output (other, self,"Info_Vela_HelloAgain_15_02"); //Zaczekaj, o pi�kna. Wybacz mi poprzednie s�owa...
	AI_Output (self, other,"Info_Vela_HelloAgain_16_03"); //Pi�kna? Mo�e bym i wybaczy�a, ale �mierdzisz krecim �ajnem!
	AI_Output (other, self,"Info_Vela_HelloAgain_15_04"); //Gdy ujrza�em Ci� po raz pierwszy, twa uroda zm�ci�a mi umys�, nie by�em wtedy sob�.
	AI_Output (self, other,"Info_Vela_HelloAgain_16_05"); //Hmm. M�w dalej.
	AI_Output (other, self,"Info_Vela_HelloAgain_15_06"); //To nie miejsce dla Ciebie, b��kitnooka bogini. Ta brudna Kolonia nie pasuje do takiego cudu. Powinna� zdobywa� kr�lewskie dwory!
	AI_Output (self, other,"Info_Vela_HelloAgain_16_07"); //Rzadko kto� docenia moj� urod�, do tego w taki spos�b... 
	AI_Output (self, other,"Info_Vela_HelloAgain_16_08"); //�le Ci� oceni�am poprzednim razem. Wybacz, przystojniaku.
	AI_Output (other, self,"Info_Vela_HelloAgain_15_09"); //Ucieknijmy st�d! Ty, ja i morska bryza! B�dziemy p�yn�� ku wieczno�ci, na �aglach mi�o�ci i po��dania! Nic nas nie rozdzieli...
	AI_Output (self, other,"Info_Vela_HelloAgain_16_10"); //S�odki jeste�, ale Gomez by mi za to cycki urwa�.
	AI_Output (other, self,"Info_Vela_HelloAgain_15_11"); //Gomez nie b�dzie �y� wiecznie. Ogie�, kt�ry wznieci�a� w mym sercu i l�d�wiach trawi mnie od �rodka!
	AI_Output (other, self,"Info_Vela_HelloAgain_15_12"); //Daj mi cho� nik�y znak, �e czujesz podobnie!
	AI_Output (self, other,"Info_Vela_HelloAgain_16_13"); //Przecie� nie roz�o�� dla ciebie n�g w zamku Gomeza!
	AI_Output (other, self,"Info_Vela_HelloAgain_15_14"); //Mam co� dla ciebie...
	
   B_GiveInvItems (other, self, akt, 1);
	B_UseFakeScroll(self);
	
   AI_Output (self, other,"Info_Vela_HelloAgain_16_15"); //Zaskoczy�e� mnie... Nie wiem, co powiedzie�...
	AI_Output (other, self,"Info_Vela_HelloAgain_15_16"); //Tak sobie Ciebie wyobra�a�em. Oczywi�cie, rzeczywisto�� przy�miewa ka�dy rysunek.
	AI_Output (self, other,"Info_Vela_HelloAgain_16_17"); //Jeste� s�odziutki. Musz� Ci to jako� wynagrodzi�...
	AI_Output (other, self,"Info_Vela_HelloAgain_15_18"); //Nie chc� nic w zamian. Wystarczy tw�j u�miech, kt�ry rozkwita w mym sercu.
	AI_Output (self, other,"Info_Vela_HelloAgain_16_19"); //Mimo wszystko zas�u�y�e� na jaki� podarunek...
	AI_Output (other, self,"Info_Vela_HelloAgain_15_20"); //Masz racj�. Mi�o by by�o mie� przy sobie co�, co przypomina�oby twe pi�kne oczy.
	AI_Output (self, other,"Info_Vela_HelloAgain_16_21"); //Ale co by ci tu da�? Bielizny nie nosz�, nie mam �adnej bi�uterii... Zaraz. Przecie� ten idiota z ma�� ku�k� ma jaki� z�oty sygnet!
	AI_Output (other, self,"Info_Vela_HelloAgain_15_22"); //M�wisz o Gomezie?
	AI_Output (self, other,"Info_Vela_HelloAgain_16_23"); //A o kim innym? Ten wa�niak nadrabia braki w anatomii wielkim mieczem na plecach. 
	AI_Output (self, other,"Info_Vela_HelloAgain_16_24"); //We� ten klucz, pier�cie� znajdziesz w kufrze.

	CreateInvItems (self,ITKE_GOMEZ_01_2,1);
	B_GiveInvItems (self, other, ITKE_GOMEZ_01_2, 1);

	AI_Output (other, self,"Info_Vela_HelloAgain_15_25"); //Dzi�kuj�, Velaya. Nie masz poj�cia, jak bardzo jestem Ci wdzi�czny.
	AI_Output (self, other,"Info_Vela_HelloAgain_16_26"); //Ca�a przyjemno�� po mojej stronie, kotku.
	
   B_LogEntry(CH3_Grd_Thief, "Mam klucz. Czas przeszuka� skrzyni� Gomeza.");
};

// ************************************************************

INSTANCE Info_Vela_Key (C_INFO)
{
	npc		= EBR_108_Velaya;
	nr			= 3;
	condition		= Info_Vela_Key_Condition;
	information		= Info_Vela_Key_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Vela_Key_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Vela_HelloAgain))&&(NPC_HasItems(other,ITKE_GOMEZ_01_2)>=1)&&(NPC_HasItems(other,Royal_Ring)>=1)&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID Info_Vela_Key_Info()
{	
	AI_Output (self, other,"Info_Vela_Key_16_01"); //Jak ci si� podoba to �wiecide�ko?
	AI_Output (other, self,"Info_Vela_Key_15_02"); //Sygnet jest wspania�y! B�dzie mi zawsze przypomina� twoje pi�kne oczy...
	AI_Output (self, other,"Info_Vela_Key_16_03"); //Chyba s�ysz� czyje� kroki! Oddaj klucz i uciekaj!
	
   B_GiveInvItems (other, self, ITKE_GOMEZ_01_2, 1);
	B_LogEntry(CH3_Grd_Thief, "Mam sygnet. Musz� teraz wsadzi� pier�cie� do skrzyni Coopera.");
	B_StopProcessInfos(self);
};

//*****************************************************************

INSTANCE Info_Vela_Thx (C_INFO)
{
	npc		= EBR_108_Velaya;
	condition		= Info_Vela_Thx_Condition;
	information		= Info_Vela_Thx_Info;
	important		= 1;
	permanent		= 0;
};

FUNC INT Info_Vela_Thx_Condition()
{	
	var C_NPC Gomez; 
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	if (Npc_KnowsInfo (hero, Info_Vela_Hello))&&(Npc_IsDead(Gomez))
	{
		return 1;
	};
};

FUNC VOID Info_Vela_Thx_Info()
{
	AI_Output (self, other,"Info_Vela_Thx_16_00"); //Gomez nie �yje! Co ja teraz zrobi�?
	AI_Output (other, self,"Info_Vela_Thx_15_01"); //Z takim cia�em na pewno sobie poradzisz.
};

// ************************************************************

INSTANCE Info_Vela_Hello1 (C_INFO)
{
	npc		= EBR_108_Velaya;
	nr			= 3;
	condition		= Info_Vela_Hello1_Condition;
	information		= Info_Vela_Hello1_Info;
	important		= 0;
	permanent		= 1;
	description 	= "Co s�ycha� kotku?";
};                       

FUNC INT Info_Vela_Hello1_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Vela_Key))
	{
		return 1;
	};
};

FUNC VOID Info_Vela_Hello1_Info()
{	
	AI_Output (other, self,"Info_Vela_Hello1_15_00"); //Co s�ycha� kotku?
	AI_Output (self, other,"Info_Vela_Hello1_16_01"); //My�l� o tym, co mi powiedzia�e� i za ka�dym razem robi mi si� od tego mokro...
	B_StopProcessInfos(self);
};
