// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orkan_Exit (C_INFO)
{
	npc			= Grd_4106_Orkan;
	nr			= 999;
	condition	= DIA_Orkan_Exit_Condition;
	information	= DIA_Orkan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orkan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Orkan_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_Orkan_First (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 1;
	condition		= DIA_Orkan_First_Condition;
	information		= DIA_Orkan_First_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_Orkan_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Orkan_First_Info()
{
	AI_Output (other, self, "DIA_Orkan_First_15_02"); //Witaj.
	AI_Output (self, other, "DIA_Orkan_First_11_01"); //Odpierdol si�. Pr�buj� si� schla�...
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Orkan_Again (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 2;
	condition		= DIA_Orkan_Again_Condition;
	information		= DIA_Orkan_Again_Info;
	permanent		= 0;
	important		= 0;
	description		= "S�ysza�em jaki 'zaszczyt' Ci� spotka�."; 
};

FUNC INT DIA_Orkan_Again_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cord_ConvoysPeopleDone4))&&(Npc_KnowsInfo (hero, DIA_Grd_217_Again))&&(Npc_KnowsInfo (hero, DIA_Orkan_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_Again_Info()
{
	AI_Output (other, self, "DIA_Orkan_Again_15_01"); //S�ysza�em jaki 'zaszczyt' Ci� spotka�.
	AI_Output (self, other, "DIA_Orkan_Again_11_02"); //Kurewsko si� z tego ciesz�.
	AI_Output (other, self, "DIA_Orkan_Again_15_03"); //O co chodzi z tymi konwojami? S�ysza�em, �e to paskudna sprawa.
	AI_Output (self, other, "DIA_Orkan_Again_11_04"); //Cz�owieku, te transporty nigdy nie wracaj�! A ja mam jutro ruszy� z nast�pnym!
	
   orkan_wait = B_SetDayTolerance()+1;
	B_LogEntry(CH5_NC_Convoys, "Konw�j wyruszy jutro, musz� jak najszybciej poinformowa� cz�owieka Corda.");
	
   AI_Output (self, other, "DIA_Orkan_Again_11_05"); //Do tego nie mam jeszcze pe�nej obstawy eskorty.
	AI_Output (self, other, "DIA_Orkan_Again_11_06"); //A mog��m si� rzuci� na barier�, jak jeszcze by�a okazja...
	AI_Output (other, self, "DIA_Orkan_Again_15_07"); //Ilu ludzi potrzebujesz?
	AI_Output (self, other, "DIA_Orkan_Again_11_08"); //Co najmniej trzech. A co Ci� to obchodzi?
	AI_Output (other, self, "DIA_Orkan_Again_15_09"); //A gdybym zdo�a� przekona� kilku stra�nik�w? Co bym z tego mia�?
	AI_Output (self, other, "DIA_Orkan_Again_11_10"); //Przynajmniej stawiasz spraw� jasno.
	AI_Output (self, other, "DIA_Orkan_Again_11_11"); //Za ka�dego dostaniesz rud�, a jak zbierzesz wszystkich, to dorzuc� co� ekstra. Masz czas do jutra.
	AI_Output (other, self, "DIA_Orkan_Again_15_12"); //Powinno wystarczy�.
	AI_Output (self, other, "DIA_Orkan_Again_11_13"); //Dobra, wiesz, gdzie mnie szuka�.
	AI_Output (self, other, "DIA_Orkan_Again_11_14"); //Aha. Jak znajdziesz jaki� samob�jc�w, niech czekaj� przy bramie. Paczki z broni� znajd� w barakach.	
	B_LogEntry(CH5_NC_Convoys, "Konw�j wyruszy jutro, o ile znajd� dw�ch stra�nik�w ch�tnych do ochraniania transportu. Musz� przekaza� wie�ci cz�owiekowi wys�anemu przez Corda.");
	B_LogEntry(CH5_NC_Convoys, "Musz� nam�wi� dw�ch stra�nik�w, aby przy��czyli si� do konwoju. Oczywi�cie trzecim b�d� ja. Mam czas do jutra.");

	var C_NPC khar; khar = Hlp_GetNpc(hun_729_kharim);
   Npc_ExchangeRoutine(khar, "WaitInCave");
   
   wld_insertNPC(GRD_263_Asghan, "OCR_NORTHGATE_RAMP_ATOP");
};

// **************************************************

var int orkan_go;

INSTANCE DIA_Orkan_Escort (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 3;
	condition		= DIA_Orkan_Escort_Condition;
	information		= DIA_Orkan_Escort_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam kilku ch�tnych."; 
};

FUNC INT DIA_Orkan_Escort_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orkan_Again))&&(Npc_KnowsInfo (hero, DIA_Asghan_Escort))&&(Npc_KnowsInfo (hero, Info_Kirgo_Escort))
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_Escort_Info()
{
	AI_Output (other, self, "DIA_Orkan_Escort_15_01"); //Mam kilku ch�tnych.
   
	if (orkan_wait >= Wld_GetDay())
	{
		orkan_go = TRUE;
		AI_Output (self, other, "DIA_Orkan_Escort_11_02"); //Uda�o Ci si� kogo� zwerbowa�?
		AI_Output (other, self, "DIA_Orkan_Escort_15_03"); //Kirgo i Ashgan rusz� razem z konwojem.
		AI_Output (self, other, "DIA_Orkan_Escort_11_04"); //Naprawd� si� zgodzili? Co za idioci. Ale brakuje jeszcze jednego szale�ca.
		AI_Output (other, self, "DIA_Orkan_Escort_15_05"); //Ostatnim ochotnikiem b�d� ja.
		AI_Output (self, other, "DIA_Orkan_Escort_11_06"); //Jeste� pewien?
		AI_Output (other, self, "DIA_Orkan_Escort_15_07"); //Tak.
	}
	else if (orkan_wait < Wld_GetDay())
	{
		AI_Output (self, other, "DIA_Orkan_Escort_11_08"); //Za p�no, konw�j powinien ju� by� w drodze. Gomez urwie mi jaja, id� si� schla�.
		B_LogEntry(CH5_NC_Convoys, "Sp�ni�em si�. Cord urwie mi jaja.");
		B_StopProcessInfos(self);
	};
};

// **************************************************

INSTANCE DIA_Orkan_EscortGo (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 4;
	condition		= DIA_Orkan_EscortGo_Condition;
	information		= DIA_Orkan_EscortGo_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Orkan_EscortGo_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orkan_Escort))&&(orkan_go == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_EscortGo_Info()
{
	AI_Output (self, other, "DIA_Orkan_EscortGo_11_01"); //To na co czekamy? 
	AI_Output (other, self, "DIA_Orkan_EscortGo_15_02"); //Na to a� wytrze�wiejesz.
	AI_Output (self, other, "DIA_Orkan_EscortGo_11_03"); //Nie b�d� �mieszny, po pijaku przynajmniej trze�wo my�l�.
	AI_Output (self, other, "DIA_Orkan_EscortGo_11_04"); //Idziemy po reszt� zbieraniny.
	B_StopProcessInfos(self);
   
   Npc_ExchangeRoutine(self, "Wait");
};

// **************************************************

INSTANCE DIA_Orkan_EscortGo1 (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 4;
	condition		= DIA_Orkan_EscortGo1_Condition;
	information		= DIA_Orkan_EscortGo1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Orkan_EscortGo1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orkan_EscortGo))&&(Npc_GetDistToWP (self,"OC2") < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_EscortGo1_Info()
{
	AI_Output (self, other, "DIA_Orkan_EscortGo1_11_01"); //Rzeczywi�cie czekaj�!
	AI_Output (self, other, "DIA_Orkan_EscortGo1_11_02"); //Bierzemy dup� w troki i miejcie oczy dooko�a g�owy.
	AI_Output (self, other, "DIA_Orkan_EscortGo1_11_03"); //Za mn�!	

	B_LogEntry(CH5_NC_Convoys, "Konw�j ruszy�.");

	Npc_ExchangeRoutine(self,"GUIDE");
	Npc_ExchangeRoutine(kirgo,"FOLLOW");
	Npc_ExchangeRoutine(ashgan,"FOLLOW");

	CreateInvItems (self,weaponpackage,2);
	CreateInvItems (kirgo,weaponpackage,2);
	CreateInvItems (ashgan,weaponpackage,2);
	CreateInvItems (other,weaponpackage,2);
	
	Npc_ExchangeRoutine(cord,"TRAP");
	
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Orkan_EscortTrap (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 5;
	condition		= DIA_Orkan_EscortTrap_Condition;
	information		= DIA_Orkan_EscortTrap_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Orkan_EscortTrap_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orkan_EscortGo1))&&(merc_trap == TRUE)&&(Npc_GetDistToWP (self,"FP_ROAM_OW_SNAPPER_OW_ORC") < 400 )
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_EscortTrap_Info()
{
	B_FullStop (hero);
	AI_Output (self, other, "DIA_Orkan_EscortTrap_11_01"); //Co� mi tu nie gra. 
	AI_DrawWeapon (self);
	AI_GotoNpc(other,self);
	AI_Output (other, self, "DIA_Orkan_EscortTrap_15_02"); //Co si� dzieje?
	AI_Output (self, other, "DIA_Orkan_EscortTrap_11_03"); //�wie�e �lady... 
	AI_Output (self, other, "DIA_Orkan_EscortTrap_11_04"); //To pu�apka, do broni!

	B_StopProcessInfos(self);

	AI_DrawWeapon (kirgo);
	AI_DrawWeapon (ashgan);
};

// **************************************************

INSTANCE DIA_Orkan_EscortTrapTalk (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 6;
	condition		= DIA_Orkan_EscortTrapTalk_Condition;
	information		= DIA_Orkan_EscortTrapTalk_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Orkan_EscortTrapTalk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cord_ConvoyConvoyTrap))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_EscortTrapTalk_Info()
{
	B_FullStop (hero);

	AI_TurnToNpc(self, cord);
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_01"); //Nie jestem idiot�. Rzucimy bro�, a wy nas wyr�niecie. Tak jak pozosta�e konwoje.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_02"); //Przebijemy si�!
	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_15_03"); //St�j! To nie ma sensu, jest was tylko trzech.
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_04"); //Jak to trzech?
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_05"); //Ty skurwielu!
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_06"); //Pierdolony zdrajca! Zginiesz jako pierwszy!
	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_15_07"); //Wys�uchaj mnie, Orkan. Zawsze zd��ymy si� pozabija�.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_08"); //M�w, byle szybko!

	Info_ClearChoices (DIA_Orkan_EscortTrapTalk);
	Info_AddChoice (DIA_Orkan_EscortTrapTalk, "Do��czcie do najemnik�w.", DIA_Orkan_EscortTrapTalk_Join);
	Info_AddChoice (DIA_Orkan_EscortTrapTalk, "Rzu�cie bro�, a traficie do kopalni.", DIA_Orkan_EscortTrapTalk_Mine);
	Info_AddChoice (DIA_Orkan_EscortTrapTalk, "Masz racj�, po co gada�!", DIA_Orkan_EscortTrapTalk_Die);
};

// --------------------------------------------------------------

FUNC VOID DIA_Orkan_EscortTrapTalk_Die()
{
	merc_trap = 3;

	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_Die_15_01"); //Masz racj�, po co gada�!
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Die_11_02"); //Gi�, sukinsynie!

	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);
	B_StartAfterDialogFight(ashgan,other,true);
	B_StartAfterDialogFight(kirgo,other,true);
};

// --------------------------------------------------------------

FUNC VOID DIA_Orkan_EscortTrapTalk_Mine()
{
	merc_trap = 3;

	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_Mine_15_01"); //Rzu�cie bro�, a traficie do kopalni.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Mine_11_02"); //O ile dotrzymasz s�owa, zdrajco.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Mine_11_03"); //Poza tym wol� umrze� tu i teraz, ni� pi� do ko�ca �ycia w�asny pot w kopalni.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Mine_11_04"); //A wy?
	AI_TurnToNpc(self, kirgo);
	AI_PlayAni(kirgo,"T_YES");
	AI_TurnToNpc(self, ashgan);
	AI_PlayAni(ashgan,"T_YES");

	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);
	B_StartAfterDialogFight(ashgan,other,true);
	B_StartAfterDialogFight(kirgo,other,true);
};

// --------------------------------------------------------------

FUNC VOID DIA_Orkan_EscortTrapTalk_Join()
{
	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_Join_15_01"); //Do��czcie do najemnik�w.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_02"); //Chyba zg�upia�e�. Ca�e �ycie kopa�em ich w dup�, a teraz mia�bym do nich przysta�?
	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_Join_15_03"); //A masz lepszy pomys�? Zreszt� co to za r�nica z kim trzymasz? Wszyscy jeste�my skaza�cami do cholery!
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_04"); //Hmm...
	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_Join_15_05"); //Do tego w Nowym Obozie mo�esz wypi� wi�cej ry��wki ni� ud�wigniesz.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_06"); //Tym mnie przekona�e�!
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_07"); //Ma racj�, na ow�osione jaja Beliara! Co za r�nica komu i dla kogo kopie si� dupska co nie ch�opaki?
	
   AI_TurnToNpc(self, kirgo);
	AI_PlayAni(kirgo,"T_YES");
	AI_TurnToNpc(self, ashgan);
	AI_PlayAni(ashgan,"T_YES");
	
   AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_08"); //Wa�ne, �e jest je komu kopa� i co wypi�.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_09"); //A co na to nasz wymuskany Pan Najmita?
	
   AI_TurnToNpc(self, cord);
	merc_trap = 2;
	B_StopProcessInfos(self); 
};

// **************************************************

INSTANCE DIA_Orkan_End (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 7;
	condition		= DIA_Orkan_End_Condition;
	information		= DIA_Orkan_End_Info;
	permanent		= 0;
	important		= 1;
	description		= "Nie chowasz urazy?"; 
};

FUNC INT DIA_Orkan_End_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Cord_ConvoyConvoyTrapEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_End_Info()
{
	AI_Output (other, self, "DIA_Orkan_End_15_01"); //Nie chowasz urazy?
	AI_Output (self, other, "DIA_Orkan_End_11_02"); //Nie b�d� idiot�. Dzi�ki Tobie wyrwa�em si� ze Starego Obozu, a do tego b�d� teraz mia� ry�owki, ile dusza zapragnie.
	AI_Output (self, other, "DIA_Orkan_End_11_03"); //Czego mo�na chcie� wi�cej?
	AI_Output (other, self, "DIA_Orkan_End_15_04"); //Dobrze to s�ysze�. Bywaj.
	AI_Output (self, other, "DIA_Orkan_End_11_05"); //Powodzenia, przyjacielu.
	
   Npc_ExchangeRoutine(self,"NC1");
};
