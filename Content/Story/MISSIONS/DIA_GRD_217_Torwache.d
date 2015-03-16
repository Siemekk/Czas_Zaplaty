// **************************************************
// 						 EXIT 
// **************************************************

func void B_Attack_OC_GuardsGate()
{
   B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self, other, true);

	/************************
	Jaka� fajna funkcja z atakiem ilu� tam stra�nik�w
	***********************/
	B_IntruderAlert(self, other);
	B_SetAttackReason	(self, AIV_AR_INTRUDER);
};

func void B_open_gate_to_Old_Camp()
{
   B_ExchangeRoutine(grd_230, "FMTaken");
	Wld_SendUnTrigger("EVT_OC_MAINGATE01_01");
	isOpenedGateOC = true;
};

INSTANCE DIA_Grd_215_Exit (C_INFO)
{
	npc			= Grd_215_Torwache;
	nr			= 999;
	condition	= DIA_Grd_215_Exit_Condition;
	information	= DIA_Grd_215_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_215_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_215_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					Hallo
// **************************************************

INSTANCE DIA_Grd_215_First (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 1;
	condition		= DIA_Grd_215_First_Condition;
	information		= DIA_Grd_215_First_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Grd_215_First_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Urt_Hello)) && (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_First_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_DrawWeapon		(self);
	var C_ITEM myarmor;
	
	myarmor = Npc_GetEquippedArmor(hero);
   
	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{

		AI_Output (self, other,"DIA_Grd_215_First_06_00"); //Kim Ty do cholery jeste�? Pierwszy raz widz� tak� zakazan� mord�!
		AI_Output (other, self,"DIA_Grd_215_First_15_01"); //Nie poznajesz mnie?
		AI_Output (self, other,"DIA_Grd_215_First_06_02"); //M�w sk�d si� wzi��e� albo wo�am ch�opak�w!

		Info_ClearChoices (DIA_Grd_215_First);
		Info_AddChoice (DIA_Grd_215_First, "Jestem... handlarzem.", DIA_Grd_215_First_Trader);	
		Info_AddChoice (DIA_Grd_215_First, "Jestem kurierem mag�w.", DIA_Grd_215_First_Deliver);
		Info_AddChoice (DIA_Grd_215_First, "Wracam z patrolu.", DIA_Grd_215_First_Patrol);
		Info_AddChoice (DIA_Grd_215_First, "Zgubi�em si�.", DIA_Grd_215_First_Lost);		
	}
	else
	{
		AI_Output (self, other,"DIA_Grd_215_First_06_03"); //Po�egnaj si� z �yciem idioto!
		
      B_Attack_OC_GuardsGate();
	};
};

FUNC VOID DIA_Grd_215_First_Deliver()
{
	AI_Output (other, self,"DIA_Grd_215_First_Deliver_15_01"); //Jestem kurierem mag�w.
	AI_Output (self, other,"DIA_Grd_215_First_Deliver_06_02"); //Tak? Mo�e nikt Ci nie powiedzia�, ale magowie ju� dawno u�y�niaj� ziemi�.
	AI_Output (self, other,"DIA_Grd_215_First_Deliver_06_03"); //Ale nie przejmuj si�, zaraz do nich do��czysz...

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Trader()
{
	AI_Output (other, self,"DIA_Grd_215_First_Trader_15_04"); //Jestem... handlarzem.
	AI_Output (self, other,"DIA_Grd_215_First_Trader_06_05"); //Oczywi�cie, a ja jestem kap�anem Adanosa.

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Lost()
{
	AI_Output (other, self,"DIA_Grd_215_First_Lost_15_06"); //Zgubi�em si�.
	AI_Output (self, other,"DIA_Grd_215_First_Lost_06_07"); //To straszne, zaraz wska�� Ci najkr�tsz� drog� do Beliara!

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Patrol()
{
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_15_08"); //Wracam z patrolu.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_06_09"); //Hmm, a z kt�rego? Co� Ci� nie kojarz�.

	Info_ClearChoices (DIA_Grd_215_First);
	Info_AddChoice (DIA_Grd_215_First, "A co ci� to obchodzi?!", DIA_Grd_215_First_Patrol_What);	
	Info_AddChoice (DIA_Grd_215_First, "By�em razem z Dukiem.", DIA_Grd_215_First_Patrol_Duke);
	Info_AddChoice (DIA_Grd_215_First, "Patrolowali�my okolice Obozu.", DIA_Grd_215_First_Patrol_Routine);
};

FUNC VOID DIA_Grd_215_First_Patrol_Routine()
{
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Routine_15_10"); //Patrolowali�my okolice Obozu.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Routine_06_11"); //Ale ze mnie idiota, a ja my�la�em, �e wszyscy zgin�li...
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Routine_06_12"); //Nie wierz� w ani jedno Twoje s�owo!

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Patrol_What()
{
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_What_15_13"); //A co ci� to obchodzi?!
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_What_06_14"); //Mnie nic, ale Gomeza bardzo.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_What_06_15"); //Skoro wolisz zabra� swoj� tajemnic� do grobu to prosz� bardzo...

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Patrol_Duke()
{
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Duke_15_16"); //By�em razem z Dukiem.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_06_17"); //Mo�liwe, rzeczywi�cie w tym �wietle wygl�dasz bardziej znajomo...

	Info_ClearChoices (DIA_Grd_215_First);
   
	if (NPC_HasItems(other,ItFo_Special_Booz)>=1)
	{
		Info_AddChoice (DIA_Grd_215_First, "Mam co� co od�wie�y Ci pami��.", DIA_Grd_215_First_Patrol_Duke_Drink);
	};
   
	Info_AddChoice (DIA_Grd_215_First, "To wpu�� mnie i sko�czmy to przedstawienie.", DIA_Grd_215_First_Patrol_Duke_Into);
};

FUNC VOID DIA_Grd_215_First_Patrol_Duke_Into()
{
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Duke_Into_15_18"); //To wpu�� mnie i sko�czmy to przedstawienie.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Into_06_19"); //Wiesz co? Jednak si� rozmy�li�em...

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Patrol_Duke_Drink()
{
	B_GiveXP(750);
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Duke_Drink_15_20"); //Mam co� co od�wie�y ci pami��.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_21"); //Co takiego?
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Duke_Drink_15_22"); //Pierwszorz�dny spiryt!
	AI_RemoveWeapon (self);	
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_23"); //Trzaby�o tak od razu m�wi�. Daj butelk�.
   
	B_GiveInvItems (other, self,ItFo_Special_Booz, 1);
	AI_UseItem (self,ItFo_Special_Booz);
   
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_24"); //Cholera, ale to ma kopa...
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_25"); //O czym to my�my gadali... hik...
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Duke_Drink_15_26"); //W�a�nie mia�e� mnie wpu�ci� do obozu.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_27"); //To po co tracisz m�j... hik... czas....
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_28"); //W�a� do �rodka... hik. 
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_29"); //O kurde! R�owy ork! Te� go widzia�e�? Hik...

   B_StopProcessInfos(self);
   B_open_gate_to_Old_Camp();

	Npc_ExchangeRoutine(RBL_4062_Urt,"OC1");
	AI_Teleport(RBL_4062_Urt,"OCR_MAINGATE_SQUARE");
	//var c_npc urt; urt = hlp_getnpc(RBL_4062_Urt);
	 //	CreateInvItem(urt,GRD_ARMOR_M);
	 //	AI_EquipArmor				(urt, GRD_ARMOR_M);
	//Mdl_SetVisualBody (urt,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 44,  1, GRD_ARMOR_M);

	B_LogEntry(CH3_RBL_OldCampSpy, "Nalewka rzeczywi�cie zadzia�a�a! Stra�nik wpu�ci� mnie do �rodka. Teraz musz� tylko nie da� si� zabi� i nie zwraca� uwagi stra�nik�w. Ciekawe, gdzie znajd� tego Kelvina?");
   //Wld_SendUnTrigger("EVT_OC_MAINGATE01_01");
};

// **************************************************

INSTANCE DIA_Grd_215_Again (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 2;
	condition		= DIA_Grd_215_Again_Condition;
	information		= DIA_Grd_215_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Grd_215_Again_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grd_215_First))&&(Npc_KnowsInfo(hero, DIA_Cord_ConvoysPeopleDone4))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_Again_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);

	var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
   
	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other,"DIA_Grd_215_Again_06_00"); //To znowu Ty. D�ugo Ci� nie by�o. Gdzie si� szw�da�e�?
		AI_Output (other, self,"DIA_Grd_215_Again_15_01"); //Tu i tam. Dzieje si� co� ciekawego?
		AI_Output (self, other,"DIA_Grd_215_Again_06_02"); //Nudy jak zawsze. Tylko Orkan biega jak ze sraczk�, bo magnaci zrobili go dow�dc� transportu z broni� do Nowego Obozu.
		AI_Output (self, other,"DIA_Grd_215_Again_06_03"); //On to ma pecha... Wcze�niej patrole poza palisad�, wyprawa na tereny ork�w, a teraz to. Chleje ju� drugi dzie� i pr�buje zebra� ludzi do konwoju.
		AI_Output (other, self,"DIA_Grd_215_Again_15_04"); //Mo�e te� si� zaci�gn�...
		AI_Output (self, other,"DIA_Grd_215_Again_06_05"); //Zdurnia�e� do reszty? Przecie� po�owa tych transport�w nie wraca.
		AI_Output (self, other,"DIA_Grd_215_Again_06_06"); //Jak nie rebelianci to orkowie, albo cholera wie kto jeszcze ma w tym interes.
		AI_Output (other, self,"DIA_Grd_215_Again_15_07"); //Jak to nie wraca?
		AI_Output (self, other,"DIA_Grd_215_Again_06_08"); //Normalnie. Rozp�ywaj� si� jak we mgle. Znaczy na cztery doszed� jeden, ale to by�o na samym pocz�tku.
		AI_Output (self, other,"DIA_Grd_215_Again_06_09"); //Fletcher skomli o ludzi i sprz�t. Gomez wysy�a nadwy�ki, ale z tego co wiem, to w skrzyniach jest pe�no z�omu.
		AI_Output (other, self,"DIA_Grd_215_Again_15_10"); //Co� tu �mierdzi...
		AI_Output (self, other,"DIA_Grd_215_Again_06_11"); //Raczej cuchnie jak onuce orka! Ale to nie moja sprawa. W�a� do obozu i daj sobie spok�j z tym konwojem.
		B_LogEntry(CH5_NC_Convoys, "Dowiedzia�em si�, �e dow�dc� konwoju jest jaki� Orkan. Ale stra�nik przy bramie powiedzia� co� dziwnego. Podobno z kilku transport�w do tej pory tylko jeden dotar�. Do tego w skrzyniach podobno jest z�om a nie porz�dna bro�. Co� mi tu nie pasuje... Musz� porozmawia� z tym Orkanem.");

		Wld_InsertNpc(Grd_4106_Orkan, "OCR_HUT_1");
      B_open_gate_to_Old_Camp();
	}
	else
	{
		AI_Output (self, other,"DIA_Grd_215_First_06_12"); //�mierdzisz rebeliantem!
		B_StopProcessInfos	(self); 
		B_StartAfterDialogFight(self,other,true);
	};
};

// **************************************************

INSTANCE DIA_Grd_215_Surprice (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 3;
	condition		= DIA_Grd_215_Surprice_Condition;
	information		= DIA_Grd_215_Surprice_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Grd_215_Surprice_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grd_215_Again))&&(Npc_KnowsInfo(hero,DIA_Cavalorn_NCFinish))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_Surprice_Info()
{
	/***********************

Ork zmiana rutyny Diego, niech siedzi w lochach zamkni�ty

*************************/

	var C_NPC diego; diego = Hlp_GetNpc(PC_Thief);
	Npc_ExchangeRoutine	(diego, "JAIL");

	B_FullStop (hero);
	AI_GotoNpc(other, self);

	var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
   
	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_00"); //Cholera Ty �yjesz?!
		AI_Output (other, self,"DIA_Grd_215_Surprice_15_01"); //Tak jako� wysz�o. Wybacz je�eli Ci� rozczarowa�em...
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_02"); //Cz�owieku, magnaci powyskakuj� z gaci, jak si� dowiedz�, �e kto� z konwoju ocala�!
		AI_Output (other, self,"DIA_Grd_215_Surprice_15_03"); //Wola�bym, �eby p�ki co nikt si� o tym nie dowiedzia�.
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_04"); //Co Ty pieprzysz. Przecie�...
		AI_Output (other, self,"DIA_Grd_215_Surprice_15_05"); //S�uchaj. Ca�y ten konw�j z broni� to jeden wielki szwindel.
		AI_Output (other, self,"DIA_Grd_215_Surprice_15_06"); //Magnaci wysy�aj� do Nowej Kopalni z�om, a stra�nicy nie wracaj� mimo, �e to nie robota rebeliant�w czy najemnik�w. Rozumiesz?
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_07"); //Nie bardzo... Ale niech Ci b�dzie. Te� mi to �mierdzi... czym�. 
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_08"); //No nic, dobrze widzie� Ci� w�r�d �ywych.
		AI_Output (other, self,"DIA_Grd_215_Surprice_15_09"); //I nikomu ani s�owa!
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_10"); //B�d� milcza� jak gr�b. A teraz spadaj, bo zas�aniasz mi widok...
      
      B_open_gate_to_Old_Camp();
	}
	else
	{
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_11"); //�mierdzisz rebeliantem!
		B_StopProcessInfos(self); 
		B_StartAfterDialogFight(self,other,true);

		/************************
	Jaka� fajna funkcja z atakiem ilu� tam stra�nik�w
	***********************/
	};
};

// **************************************************

INSTANCE DIA_Grd_215_Attack (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 4;
	condition		= DIA_Grd_215_Attack_Condition;
	information		= DIA_Grd_215_Attack_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nied�ugo mo�e tu by� gor�co."; 
};

FUNC INT DIA_Grd_215_Attack_Condition()
{	
	if (CHEST_KNOW == TRUE)&&(Npc_KnowsInfo(hero,DIA_Grd_215_Surprice))
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_Attack_Info()
{
	AI_Output (other, self,"DIA_Grd_215_Attack_15_01"); //Nied�ugo mo�e tu by� gor�co.
	AI_Output (self, other,"DIA_Grd_215_Attack_06_02"); //Oby nie. Gomez przerzuci� wi�kszo�� stra�nik�w do zamku.
	AI_Output (other, self,"DIA_Grd_215_Attack_15_03"); //Czyli zewn�trzne bramy s� najs�abiej strze�one?
	AI_Output (self, other,"DIA_Grd_215_Attack_06_04"); //Tego nie powiedzia�em, ale wola�bym siedzie� w zamku.
};

INSTANCE DIA_Grd_215_OpenGate (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 4;
	condition		= DIA_Grd_215_OpenGate_Condition;
	information		= DIA_Grd_215_OpenGate_Info;
	permanent		= 1;
	important		= 0;
	description		= "(otwarcie bramy)"; 
};

FUNC INT DIA_Grd_215_OpenGate_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Grd_215_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_OpenGate_Info()
{
   AI_Output (self, other, "DIA_Grd_215_Attack_15_01"); //OTWORZY� BRAM�!
   
   B_StopProcessInfos(self);
	B_open_gate_to_Old_Camp();
};

INSTANCE DIA_GRD_230_OpenGate (C_INFO)
{
	npc				= GRD_230_Gardist;
	nr				= 4;
	condition		= DIA_GRD_230_OpenGate_Condition;
	information		= DIA_GRD_230_OpenGate_Info;
	permanent		= 1;
	important		= 0;
	description		= "(otwarcie bramy)"; 
};

FUNC INT DIA_GRD_230_OpenGate_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Grd_215_First))
	{
		return 1;
	};
};

FUNC VOID DIA_GRD_230_OpenGate_Info()
{
   B_StopProcessInfos(self);
	B_open_gate_to_Old_Camp();
};
