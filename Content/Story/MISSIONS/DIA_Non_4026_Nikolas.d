
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Nikolas_Exit (C_INFO)
{
	npc			= Non_4026_Nikolas;
	nr			= 999;
	condition	= DIA_Nikolas_Exit_Condition;
	information	= DIA_Nikolas_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Nikolas_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Nikolas_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Nikolas_Hello (C_INFO)
{
	npc				= Non_4026_Nikolas;
	nr				= 1;
	condition		= DIA_Nikolas_Hello_Condition;
	information		= DIA_Nikolas_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nie�le si� tutaj urz�dzili�cie."; 
};

FUNC INT DIA_Nikolas_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Nikolas_Hello_Info()
{
	AI_Output (other, self, "DIA_Nikolas_Hello_15_01"); //Nie�le si� tutaj urz�dzili�cie.
	AI_Output (self, other, "DIA_Nikolas_Hello_11_02"); //A ty� kto?
	AI_Output (other, self, "DIA_Nikolas_Hello_15_03"); //Przyjaciel.
	AI_Output (self, other, "DIA_Nikolas_Hello_11_04"); //Ja nie mam przyjaci�, przynajmniej nie po�r�d �ywych.
	AI_Output (other, self, "DIA_Nikolas_Hello_15_05"); //W takim razie wol� pozosta� odst�pstwem od tej normy.
	AI_Output (self, other, "DIA_Nikolas_Hello_11_06"); //Skoro nalegasz. Cho� dla mnie nie liczy si� d�ugo�� �ycia, tylko jego intensywno��.
	AI_Output (other, self, "DIA_Nikolas_Hello_15_07"); //Zdaje si�, �e na brak wra�e� nie mo�esz narzeka�.
	AI_Output (self, other, "DIA_Nikolas_Hello_11_08"); //Przynajmniej czuj�, �e �yj�. Musz� wraca� do zaj��, bywaj.
	
   B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Nikolas_Debt (C_INFO)
{
	npc				= Non_4026_Nikolas;
	nr				= 2;
	condition		= DIA_Nikolas_Debt_Condition;
	information		= DIA_Nikolas_Debt_Info;
	permanent		= 0;
	important		= 1;
	description		= "S�ysza�em, �e Kira ma na Ciebie haka."; 
};

FUNC INT DIA_Nikolas_Debt_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Nikolas_Hello))&&(TH_trust >= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Nikolas_Debt_Info()
{
	AI_Output (self, other, "DIA_Nikolas_Debt_11_01"); //S�ysza�em, �e Kira ma na Ciebie haka.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_02"); //Co dok�adnie s�ysza�e�?
	AI_Output (self, other, "DIA_Nikolas_Debt_11_03"); //Podobno musisz udowodni� jej co� wart, �eby mog�a oceni� potencja� tych, kt�rych reprezentujesz.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_04"); //Do�� trafnie to uj��e�.
	AI_Output (self, other, "DIA_Nikolas_Debt_11_05"); //Bardzo mnie to cieszy. Widzisz spad�e� mi jak gwiazdka z nieba.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_06"); //No dobra, m�w o co chodzi.
	AI_Output (self, other, "DIA_Nikolas_Debt_11_07"); //Nagadam Kirze niestworzonych historii o Twojej odwadze, sile i takich tam pierdo�ach, jak co� dla mnie zrobisz.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_08"); //Co to za robota?
	AI_Output (self, other, "DIA_Nikolas_Debt_11_09"); //Odbierzesz moje nale�no�ci od pewnych wierzycieli.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_10"); //Haracz czy d�ugi?
	AI_Output (self, other, "DIA_Nikolas_Debt_11_11"); //Nie obra�aj mnie, jestem uczciwym... z�odziejem. Te po�yczki to by�a inwestycja w... ludzi.
	AI_Output (self, other, "DIA_Nikolas_Debt_11_12"); //Niestety �adna nie przynios�a zysk�w, a wierzyciele zapomnieli o sp�acie.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_13"); //Nie u�miecha mi si� bieganie po Kolonii za Twoimi d�ugami...
	AI_Output (self, other, "DIA_Nikolas_Debt_11_14"); //Wr��, jak si� namy�lisz. Tylko tak Kira dowie si� ode mnie czego� interesuj�cego na Tw�j temat.

	Log_CreateTopic	(CH2_TRL_Debt, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Debt, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Debt, "Nikolas poprosi� mnie o odzyskanie nale�no�ci od wierzycieli. Tylko wtedy wstawi si� za mn� u Kiry. Czeka mnie chyba bieganie po kolonii...");
};

// **************************************************

INSTANCE DIA_Nikolas_Debtok (C_INFO)
{
	npc				= Non_4026_Nikolas;
	nr				= 3;
	condition		= DIA_Nikolas_Debtok_Condition;
	information		= DIA_Nikolas_Debtok_Info;
	permanent		= 0;
	important		= 0;
	description		= "Niech b�dzie, odzyskam Twoj� rud�."; 
};

FUNC INT DIA_Nikolas_Debtok_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Nikolas_Debt))
	{
		return 1;
	};
};

FUNC VOID DIA_Nikolas_Debtok_Info()
{
	AI_Output (other, self, "DIA_Nikolas_Debtok_15_01"); //Niech b�dzie, odzyskam Twoj� rud�.
	AI_Output (self, other, "DIA_Nikolas_Debtok_11_02"); //Wiedzia�em, �e mo�na na Ciebie liczy�.
	AI_Output (self, other, "DIA_Nikolas_Debtok_11_03"); //Tu masz list� d�u�nik�w i wysoko�� nale�no�ci plus... odsetki.
	
   CreateInvItems (self, debt_list,1); 
	B_GiveInvItems (self, other, debt_list, 1);
	
   AI_Output (other, self, "DIA_Nikolas_Debtok_15_04"); //Co je�eli nie b�d� chcieli odda� d�ugu po dobroci?
	AI_Output (self, other, "DIA_Nikolas_Debtok_11_05"); //S�ysza�em, �e zaradny z Ciebie ch�opak. Poradzisz sobie.
	AI_Output (self, other, "DIA_Nikolas_Debtok_11_06"); //Powodzenia przyjacielu i wracaj tak szybko jak tylko si� da.
	
   B_LogEntry		(CH2_TRL_Debt, "Zgodzi�em si� odzyska� d�ugi dla Nikolasa. Da� mi list� z d�u�nikami, powinienem j� przeczyta�.");
	Wld_InsertNpc				(NON_4029_Right,"OW_LEFT_RIGHT_CAMP");///Doda� szalenc�w Lewy i Prawy
	Wld_InsertNpc				(NON_4028_Left,"OW_LEFT_RIGHT_CAMP");//Doda� szalenc�w Lewy i Prawy
};

/**************************************************/

INSTANCE DIA_Nikolas_DebtFinish(C_INFO)
{
	npc				= Non_4026_Nikolas;
	nr				= 4;
	condition		= DIA_Nikolas_DebtFinish_Condition;
	information		= DIA_Nikolas_DebtFinish_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam tw�j d�ug."; 
};

FUNC INT DIA_Nikolas_DebtFinish_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Nikolas_Debtok))&&(NPC_HasItems(other,ItMiNugget)>=1230)
	{
		return 1;
	};
};

FUNC VOID DIA_Nikolas_DebtFinish_Info()
{
	var c_npc left; var c_npc right;
	right=Hlp_GetNpc(NON_4029_Right);
	left=Hlp_GetNpc(NON_4028_Left);
	
	TH_trust = TH_trust + 1;
	B_GiveXP (250);
   
	AI_Output (other, self, "DIA_Nikolas_DebtFinish_15_01"); //Mam tw�j d�ug.
	AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_02"); //Naprawd�? Sprawd�my.
	
   B_GiveInvItems (other, self, ItMiNugget, 1230);
	Npc_RemoveInvItems(self,ItMiNugget,1230);
	
   if  (debt_counter >=4)||(((debt_counter >=2)||(debt_counter <4))&&((Npc_IsDead(left)&&Npc_IsDead(right))||(Npc_HasItems(other,ItKeLeftChest))))
	{
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_03"); //Dosz�y mnie s�uchy, �e pogada�e� z ch�opakami.
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_04"); //Naprawd� nie�le sobie poradzi�e�.
	}
	else if (debt_counter >=1)||(debt_counter <4)
	{
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_05"); //Dosz�y mnie s�uchy, �e nie zebra�e� d�ugu od wszystkich.
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_06"); //No nic, najwa�niejsze, �e mam ca�� rud� w sakiewce.
	}
	else if (debt_counter ==0)
	{
		debt_read = 2;
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_07"); //Dowiedzia�em si�, �e od nikogo jeszcze nie zebra�e� d�ugu.
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_08"); //Je�eli chcesz bawi� si� w kap�ana Adanosa to Twoja sprawa.
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_09"); //Ale w takim razie umarzam te d�ugi. Niech znaj� moj� hojno��, he, he.
	};
   
	AI_Output (other, self, "DIA_Nikolas_DebtFinish_15_10"); //Czyli mog� na Ciebie liczy�?
	AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_11"); //W ka�dej chwili przyjacielu. Kira te� si� dowie jaki z Ciebie spryciarz.
	
   Log_SetTopicStatus	(CH2_TRL_Debt, LOG_SUCCESS);
	B_LogEntry		(CH2_TRL_Debt, "Nikolas odzyska� rud�, a ja zdoby�em jego poparcie.");
	B_LogEntry(CH2_TRL_Quest, "Zdoby�em poparcie Nikolasa.");
};


