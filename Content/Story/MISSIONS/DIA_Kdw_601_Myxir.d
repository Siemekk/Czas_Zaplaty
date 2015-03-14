// ************************ EXIT **************************

instance  Info_Myxir_EXIT (C_INFO)
{
	npc			= KDW_601_Myxir;
	nr			= 999;
	condition	= Info_Myxir_EXIT_Condition;
	information	= Info_Myxir_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Myxir_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Myxir_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// *****************************************

instance  DIA_Myxir_Greet (C_INFO)
{
	npc			=  KDW_601_Myxir;
	nr			=  1;	
	condition	=  DIA_Myxir_Greet_Condition;
	information	=  DIA_Myxir_Greet_Info;
	permanent	= 0;
	important 	= 0;
	description = "Kim jeste�?";
};                       

FUNC int  DIA_Myxir_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Myxir_Greet_Info()
{
	AI_Output (other, self,"DIA_Myxir_Greet_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_Myxir_Greet1_08_01"); //Zw� mnie Myxir.
	AI_Output (other, self,"DIA_Myxir_Greet_15_02"); //Jeste� magiem wody?
	AI_Output (self, other,"DIA_Myxir_Greet1_08_03"); //A ty jeste� skaza�cem?
	AI_Output (other, self,"DIA_Myxir_Greet_15_04"); //Jak na to wpad�e�?
	AI_Output (self, other,"DIA_Myxir_Greet1_08_05"); //Nie znosz� b�azn�w...
	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Myxir_Problem (C_INFO)
{
	npc			=  KDW_601_Myxir;
	nr			=  2;	
	condition	=  DIA_Myxir_Problem_Condition;
	information	=  DIA_Myxir_Problem_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mo�esz powiedzie� mi co� o ornamentach?";
};                       

FUNC int  DIA_Myxir_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Ornament))
	{
		return 1;
	};
};

FUNC VOID  DIA_Myxir_Problem_Info()
{
	AI_Output (other, self,"DIA_Myxir_Problem_15_01"); //Mo�esz powiedzie� mi co� o ornamentach?
	AI_Output (self, other,"DIA_Myxir_Problem_08_02"); //Oczywi�cie. To ja odkry�em ich tajemnic�.
	AI_Output (self, other,"DIA_Myxir_Problem_08_03"); //Ornamenty stanowi�y onegdaj ca�o��. Ko�o ornamentalne by�o czym� w rodzaju klucza, otwiera�o wrota czasoprzestrzenne, dzi�ki kt�rym mo�na by�o przenie�� si� do innego �wiata, nawet w innym czasie.
	AI_Output (self, other,"DIA_Myxir_Problem_08_04"); //By�a to bardzo stara i pot�na magia. Staro�ytne portale stworzy�a rasa �yj�ca w Jarkendarze.
	AI_Output (self, other,"DIA_Myxir_Problem_08_05"); //Jednak z biegiem lat magia ta utraci�a sw� moc. Teraz przej�cia dzia�aj� jak zwyk�e portale i przenosz� w �ci�le okre�lone miejsce.
	AI_Output (self, other,"DIA_Myxir_Problem_08_06"); //Musimy odnale�� wszystkie cztery cz�ci ornamentu. Kiedy po��czymy je w ca�o��, zdo�amy uruchomi� portal i wype�ni� wol� Adanosa.
	AI_Output (other, self,"DIA_Myxir_Problem_15_07"); //M�g�bym tak�e skorzysta� z portalu?
	AI_Output (self, other,"DIA_Myxir_Problem_08_08"); //Hmm, by� mo�e, ale to zale�y od Saturasa.
	B_LogEntry(CH3_NON_Ornament, "Cztery cz�ci ornamentu mo�na po��czy� w ca�o��. Taki klucz umo�liwia skorzystanie z portalu. Hmm, mo�e te� m�g�bym go u�y�?");
};

// *****************************************

instance DIA_Myxir_All (C_INFO)
{
	npc			=  KDW_601_Myxir;
	nr			=  3;	
	condition	=  DIA_Myxir_All_Condition;
	information	=  DIA_Myxir_All_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mamy ju� wszystkie ornamenty.";
};                       

FUNC int  DIA_Myxir_All_Condition()
{
	return ritual_time_ok;
};

FUNC VOID  DIA_Myxir_All_Info()
{
	AI_Output (other, self,"DIA_Myxir_All_15_01"); //Mamy ju� wszystkie ornamenty.

	if (ornament_wait >= Wld_GetDay())
	{
		AI_Output (self, other,"DIA_Myxir_All_08_02"); //W ko�cu wola Adanosa zostanie spe�niona!
		AI_Output (other, self,"DIA_Myxir_All_15_03"); //Saturas powiedzia�...
		AI_Output (self, other,"DIA_Myxir_All_08_04"); //Wiem, gdzie zostanie przeprowadzony rytua�.
		B_LogEntry(CH3_NON_Ornament, "Powiedzia�em Myxirowi, aby ruszy� na dziedziniec.");
		Npc_ExchangeRoutine(self,"RIT");
	}
	else
	{
		AI_Output (self, other,"DIA_Myxir_All_08_05"); //Ju� za p�no... Nigdy nie wydostaniemy si� z tej cholernej Kolonii!
	};

	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Myxir_RitualPrepare (C_INFO)
{
	npc			=  KDW_601_Myxir;
	nr			=  4;	
	condition	=  DIA_Myxir_RitualPrepare_Condition;
	information	=  DIA_Myxir_RitualPrepare_Info;
	permanent	= 0;
	important 	= 0;
	description = "Chcia�em porozmawia� o pewnym rytuale...";
};                       

FUNC int  DIA_Myxir_RitualPrepare_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Myxir_Problem))&&(myxir_ritual == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Myxir_RitualPrepare_Info()
{
	AI_Output (other, self,"DIA_Myxir_RitualPrepare_15_01"); //Chcia�em porozmawia� o pewnym rytuale...
	AI_Output (self, other,"DIA_Myxir_RitualPrepare_08_02"); //Wiem. Daj zna�, kiedy wszystko b�dzie przygotowane.
	B_LogEntry(CH4_RBL_Rirual, "Myxir we�mie udzia� w rytuale.");
};

instance Info_Myxir_Ritual (C_INFO)
{
	npc			=	KDW_601_Myxir;
	nr			=	5;
	condition	=	Info_Myxir_Ritual_Condition;
	information	=	Info_Myxir_Ritual_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Wszystko jest ju� przygotowane do przeprowadzenia rytua�u."; 
};                       

FUNC int  Info_Myxir_Ritual_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Ritual))&&(myxir_ritual == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Info_Myxir_Ritual_Info()
{
	AI_Output(other, self, "Info_Myxir_Ritual_15_00"); //Wszystko jest ju� przygotowane do przeprowadzenia rytua�u.
	AI_Output(self, other,"Info_Myxir_Ritual_14_01"); //W porz�dku, gdzie rytua� si� odb�dzie?
	AI_Output(other, self, "Info_Myxir_Ritual_15_02"); //Leren czeka w pobli�u kamiennego kr�gu na bagnach.
	AI_Output(self, other,"Info_Myxir_Ritual_14_03"); //Wiem, gdzie to jest, wkr�tce tam przyb�d�.
	
   B_LogEntry(CH4_RBL_Rirual, "Myxir wyruszy� do kamiennego kr�gu.");
	Npc_ExchangeRoutine(self, "RITUAL");
	B_StopProcessInfos(self);
};
