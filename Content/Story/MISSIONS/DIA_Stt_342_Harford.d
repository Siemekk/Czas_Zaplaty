
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Harf_Exit (C_INFO)
{
	npc			= Stt_342_Harford;
	nr			= 999;
	condition	= DIA_Harf_Exit_Condition;
	information	= DIA_Harf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Harf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Harf_Exit_Info()
{
	if (!Npc_KnowsInfo (hero, DIA_Harf_Proposal))
	{
		AI_Output (self, other, "DIA_Harf_Exit_11_01"); //Ten cholerny ob�z schodzi na psy!
	};
	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Harf_Hello (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 1;
	condition		= DIA_Harf_Hello_Condition;
	information		= DIA_Harf_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jeste�?"; 
};

FUNC INT DIA_Harf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Harf_Hello_Info()
{
	AI_Output (other, self, "DIA_Harf_Hello_15_01"); //Kim jeste�?
	AI_Output (self, other, "DIA_Harf_Hello_11_02"); //G�wnem w przerembli. Zejd� mi z oczu.
	B_StopProcessInfos	(self);
};


// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Harf_Proposal (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 2;
	condition		= DIA_Harf_Proposal_Condition;
	information		= DIA_Harf_Proposal_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Harf_Proposal_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 500)&&(Npc_KnowsInfo (hero, DIA_Cooper_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Harf_Proposal_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (self, other, "DIA_Harf_Proposal_11_01"); //Pst!
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Harf_Proposal_11_02"); //S�ysza�em, �e ju� pozna�e� Coopera.
	AI_Output (other, self, "DIA_Harf_Proposal_15_03"); //Powiedzmy, �e mia�em t� przyjemno��.
	AI_Output (self, other, "DIA_Harf_Proposal_11_04"); //Mam dla Ciebie propozycj�. Oboje na tym zyskamy.
	AI_Output (other, self, "DIA_Harf_Proposal_15_05"); //Zamieniam si� w s�uch.
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, other, "DIA_Harf_Proposal_11_06"); //Cooper to straszny sukinsyn. Do tego jest bardziej pazerny od Gomeza.
	AI_Output (self, other, "DIA_Harf_Proposal_11_07"); //Cienie musz� mu p�aci� za to, �e nie napuszcza na nich stra�nik�w.
	AI_Output (self, other, "DIA_Harf_Proposal_11_08"); //Nowi p�ac� wej�ci�wk�.
	AI_Output (self, other, "DIA_Harf_Proposal_11_09"); //Czas to ukr�ci�.
	AI_Output (other, self, "DIA_Harf_Proposal_15_10"); //Chyba wiem do czego zmierzasz.
	AI_Output (self, other, "DIA_Harf_Proposal_11_11"); //Jaka jest twoja decyzja?
};

INSTANCE DIA_Harf_ProposalOk (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 3;
	condition		= DIA_Harf_ProposalOk_Condition;
	information		= DIA_Harf_ProposalOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zajm� si� Cooperem."; 
};

FUNC INT DIA_Harf_ProposalOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Harf_Proposal))
	{
		return 1;
	};
};

FUNC VOID DIA_Harf_ProposalOk_Info()
{
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_01"); //Zajm� si� Cooperem.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_02"); //Masz jaja. Tylko to nie mo�e wygl�da� jak robota Cieni. Rozumiesz?
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_03"); //Bez obaw. Co� wymy�l�.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_04"); //Zaczekaj. Nie chc�, �eby� go zaszlachtowa�. To by�oby zbyt proste. Mam lepszy pomys�.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_05"); //Gomez po rebeliantach najbardziej nienawidzi z�odziei. W komnacie Gomeza znajdziesz dziewczyn�, nazywa si� Velaya. To jego ulubienica, nie dzieli si� ni� nawet z magnatami.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_06"); //Dziewczyna ma klucz do skrzyni z osobistymi rzeczami Gomeza. Jestem pewien, �e znajdziesz tam kr�lewski sygnet.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_07"); //Gomez obci�� go razem z palcem kr�lewskiego namiestnika, kt�ry dowodzi� w Kolonii.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_08"); //Sukinsyn wk�ada go tylko na specjalne okazje. 
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_09"); //Powoli. Przecie� ta jego na�o�nica nie odda mi klucza po dobroci.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_10"); //Wymy�lisz co�. To ju� Tw�j problem. 
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_11"); //Nie tylko m�j. Cienie skorzystaj� na tym bardziej ni� ja. 
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_12"); //Jednak nie jeste� idiot�. W porz�dku. Z tego co wiem Velaya to pr�ne babsko. Daj jej co� co jej si� spodoba.
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_13"); //Ale co?
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_14"); //Hmm. Ona ma �wira na punkcie swojej urody. Wiem!
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_15"); //Pogadaj z Lucjuszem. On �wietnie rysuje, niech narysuje portret Velayi. Tylko uwa�aj na niego...
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_16"); //Dlaczego?
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_17"); //Wiesz on woli ch�opc�w, wi�c nie odwracaj si� do niego ty�em, he, he.
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_18"); //Dam sobie rad�.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_19"); //Jak ju� zdob�dziesz sygnet, wrzu� go do skrzyni Coopera, znajdziesz j� w jego chacie - wcze�niej mieszka� tam Diego.
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_20"); //Ale co ja b�d� z tego mia�?
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_21"); //Nie b�dziesz musia� p�aci� wej�ci�wki. Kiedy Gomez znajdzie sw�j sygnet w skrzyni Coopera, w ko�cu zrobi z nim porz�dek.
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_22"); //To za ma�o. Mam inny pomys�. 
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_23"); //Cholera, zaczynam �a�owa�, �e z�o�y�em Ci propozycj�. Co to ma by�?
	
   Log_CreateTopic	(CH3_Grd_Thief, LOG_MISSION);
	Log_SetTopicStatus	(CH3_Grd_Thief, LOG_RUNNING);
	Info_ClearChoices (DIA_Harf_ProposalOk);
	
   Info_AddChoice (DIA_Harf_ProposalOk, "Przyda�by mi si� pancerz magnata.", DIA_Harf_ProposalOk_Armor);
	Info_AddChoice (DIA_Harf_ProposalOk, "Potrzebuj� szaty mag�w ognia.", DIA_Harf_ProposalOk_Robe);
	Info_AddChoice (DIA_Harf_ProposalOk, "2000 bry�ek za�atwi spraw�.", DIA_Harf_ProposalOk_Ore);
	
   var c_npc velaya; velaya = hlp_getnpc(ebr_108_velaya);
	B_ExchangeRoutine	(velaya, "HARFORDQUEST");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Harf_ProposalOk_Armor()
{
	AI_Output (other, self, "DIA_Harf_ProposalOk_Armor_15_01"); //Przyda�by mi si� pancerz magnata.
	AI_Output (self, other, "DIA_Harf_ProposalOk_Armor_11_02"); //Co?! Mo�e jeszcze tytu� szlachecki?
	AI_Output (other, self, "DIA_Harf_ProposalOk_Armor_15_03"); //Wystarczy pancerz.
	AI_Output (self, other, "DIA_Harf_ProposalOk_Armor_11_04"); //Niech ci� szlag, to nie b�dzie proste.
	AI_Output (other, self, "DIA_Harf_ProposalOk_Armor_15_05"); //Akcje z sygnetem te� nie b�dzie �atwa. Poradzisz sobie.
	
   B_LogEntry		(CH3_Grd_Thief, "Zgodzi�em si� za�atwi� spraw� z Cooperem. A wi�c po kolei. W osobistym kufrze Gomeza znajd� kr�lewski sygnet, kt�ry musz� umie�ci� w skrzyni Coopera. Klucz do kufra magnata ma Velaya, kt�ra ma bzika na punkcie w�asnej urody. Lucjusz mo�e wykona jej portret - oby to wystarczy�o. Klucz do kufra Coopera znajd� pewnie przy nim samym. Czas bra� si� do pracy.");
	B_LogEntry		(CH3_Grd_Thief, "Nagrod� ma by� pancerz magnat�w.");
	Info_ClearChoices (DIA_Harf_ProposalOk);		
};


// -------------------------------------------------------------------

FUNC VOID DIA_Harf_ProposalOk_Robe()
{
	AI_Output (other, self, "DIA_Harf_ProposalOk_Robe_15_01"); //Potrzebuj� szaty mag�w ognia.
	AI_Output (self, other, "DIA_Harf_ProposalOk_Robe_11_02"); //Tylko tyle? Mo�e jeszcze Tarcza Innosa?!
	AI_Output (other, self, "DIA_Harf_ProposalOk_Robe_15_03"); //Nie dramatyzuj, dasz sobie rad�.
	
   B_LogEntry		(CH3_Grd_Thief, "Zgodzi�em si� za�atwi� spraw� z Cooperem. A wi�c po kolei. W osobistym kufrze Gomeza znajd� kr�lewski sygnet, kt�ry musz� umie�ci� w skrzyni Coopera. Klucz do kufra magnata ma Velaya, kt�ra ma bzika na punkcie w�asnej urody. Lucjusz mo�e wykona jej portret - oby to wystarczy�o. Klucz do kufra Coopera znajd� pewnie przy nim samym. Czas bra� si� do pracy.");
	B_LogEntry		(CH3_Grd_Thief, "Nagrod� ma by� szata mag�w ognia.");
	Info_ClearChoices (DIA_Harf_ProposalOk);
};


// -------------------------------------------------------------------

FUNC VOID DIA_Harf_ProposalOk_Ore()
{
	AI_Output (other, self, "DIA_Harf_ProposalOk_Ore_15_01"); //2000 bry�ek za�atwi spraw�.
	AI_Output (self, other, "DIA_Harf_ProposalOk_Ore_11_02"); //Cholera, wi�ksza z Ciebie pijawka ni� Cooper.
	AI_Output (other, self, "DIA_Harf_ProposalOk_Ore_15_03"); //Trzeba sobie radzi� w �yciu, a �ycie to kosztowna inwestycja.
	AI_Output (self, other, "DIA_Harf_ProposalOk_Ore_11_04"); //Porozmawiam z ch�opakami, zrobimy zrzut�.
	
   B_LogEntry		(CH3_Grd_Thief, "Zgodzi�em si� za�atwi� spraw� z Cooperem. A wi�c po kolei. W osobistym kufrze Gomeza znajd� kr�lewski sygnet, kt�ry musz� umie�ci� w skrzyni Coopera. Klucz do kufra magnata ma Velaya, kt�ra ma bzika na punkcie w�asnej urody. Lucjusz mo�e wykona jej portret - oby to wystarczy�o. Klucz do kufra Coopera znajd� pewnie przy nim samym. Czas bra� si� do pracy.");
	B_LogEntry		(CH3_Grd_Thief, "Za��da�em 2000 bry�ek rudy.");
	Info_ClearChoices (DIA_Harf_ProposalOk);
};

INSTANCE DIA_Harf_ProposalOk1 (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 13;
	condition		= DIA_Harf_ProposalOk1_Condition;
	information		= DIA_Harf_ProposalOk1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Harf_ProposalOk1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Harf_ProposalOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Harf_ProposalOk1_Info()
{
	AI_Output (self, other, "DIA_Harf_ProposalOk1_11_01"); //Zaczekaj!
	AI_Output (other, self, "DIA_Harf_ProposalOk1_15_02"); //Co? Zmieni�e� zdanie?
	AI_Output (self, other, "DIA_Harf_ProposalOk1_11_03"); //Nie, przypomnia�em sobie co� co dotyczy klucza.
	AI_Output (self, other, "DIA_Harf_ProposalOk1_11_04"); //Mo�e nie tylko Velaya ma klucz do skrzyni. Zdaje si�, �e kiedy� w zamku kr�ci� si� R�czka. P�niej nagle znikn��, ale o dziwo ca�a sprawa przycich�a z polecenia Gomeza.
	AI_Output (self, other, "DIA_Harf_ProposalOk1_11_05"); //Jak znam R�czk�, to m�g� wywin�� jaki� niez�y numer.
	AI_Output (other, self, "DIA_Harf_ProposalOk1_15_06"); //Dzi�ki, zapytam go.
	AI_Output (self, other, "DIA_Harf_ProposalOk1_11_07"); //Nie liczy�bym na to, �e w og�le co� odpowie. Najlepiej jakby� zdo�a� go... okra��.
	AI_Output (other, self, "DIA_Harf_ProposalOk1_15_08"); //Zobacz�, co da si� zrobi�.
	
   B_LogEntry		(CH3_Grd_Thief, "Harford zasugerowa�, �e R�czka tak�e mo�e mie� klucz do skrzyni Gomeza. Z�odziej na pewno nic mi nie powie, musz� wi�c przejrze� jego skrzynie i to co ma przy sobie. Wtedy przynajmniej ominie mnie ca�a ta heca z Velay�.");
};

INSTANCE DIA_Harf_ProposalEnd (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 4;
	condition		= DIA_Harf_ProposalEnd_Condition;
	information		= DIA_Harf_ProposalEnd_Info;
	permanent		= 0;
	important		= 0;
	description		= "Za�atwi�em spraw� z Cooperem."; 
};

FUNC INT DIA_Harf_ProposalEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cooper_Thief))&& Mob_HasItems ("OC_CHEST_COOPER", Royal_Ring)
	{
		return 1;
	};
};

FUNC VOID DIA_Harf_ProposalEnd_Info()
{
	var C_NPC coop; coop = Hlp_GetNpc(Stt_339_Cooper);

	/*******************************
Cooper idzie do loch�w i niech tam zostanie

********************************/

	Npc_ExchangeRoutine(coop,"GoToJail");
   
	AI_Output (other, self, "DIA_Harf_ProposalEnd_15_01"); //Za�atwi�em spraw� z Cooperem.
	AI_Output (self, other, "DIA_Harf_ProposalEnd_11_02"); //�wietnie. Ja zajm� si� tym, aby Gomez dowiedzia� si�, kto go okrada.
	AI_Output (other, self, "DIA_Harf_ProposalEnd_15_03"); //Co z moj� nagrod�?
	AI_Output (self, other, "DIA_Harf_ProposalEnd_11_04"); //O czym Ty m�wisz?
	AI_Output (other, self, "DIA_Harf_ProposalEnd_15_05"); //Jak to o czym? Udupi�em Coopera, ale nie jestem cholernym kap�anem Adanosa! Da�e� s�owo!
	AI_Output (self, other, "DIA_Harf_ProposalEnd_11_06"); //Wybacz, stary. To Kolonia Karna nie pensjonat dla akolitek Innosa.
	AI_Output (other, self, "DIA_Harf_ProposalEnd_15_07"); //Niech Ci� szlag trafi, cholerny k�amca!
	AI_Output (self, other, "DIA_Harf_ProposalEnd_11_08"); //Pr�dzej, czy p�niej szlag trafi ka�dego z nas. Powodzenia, przyjacielu.
	
   Log_SetTopicStatus	(CH3_Grd_Thief, LOG_SUCCESS);
	B_LogEntry		(CH3_Grd_Thief, "Harford mnie wykorzysta�! Sukinsyn nie dotrzyma� s�owa. Mam ju� do�� tej cholernej Kolonii.");
};

INSTANCE DIA_Harf_End (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 5;
	condition		= DIA_Harf_End_Condition;
	information		= DIA_Harf_End_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia�em..."; 
};

FUNC INT DIA_Harf_End_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Harf_ProposalEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Harf_End_Info()
{
	AI_Output (other, self, "DIA_Harf_End_15_01"); //Chcia�em...
	AI_Output (self, other, "DIA_Harf_End_11_02"); //Nie mamy o czym rozmawia�.
	B_StopProcessInfos	(self);
}; 
