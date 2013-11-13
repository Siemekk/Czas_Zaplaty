// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kirgo_Exit (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 999;
	condition		= Info_Kirgo_Exit_Condition;
	information		= Info_Kirgo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kirgo_Exit_Condition()
{
	return 1;
};

func VOID Info_Kirgo_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
//			
// **************************************************

instance Info_Kirgo_Hi(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Hi_Condition;
	information		= Info_Kirgo_Hi_Info;
	permanent		= 0;
	description 	= "Co porabiasz?";
};                       

FUNC INT Info_Kirgo_Hi_Condition()
{	
	return 1;
};

func VOID Info_Kirgo_Hi_Info()
{
	AI_Output (other, self,"Info_Kirgo_Hi_15_01"); //Co porabiasz?
	AI_Output (self, other,"Info_Kirgo_Hi_05_02"); //Jestem Kirgo. Kiedy� walczy�em na arenie. To by�y czasy...
};

// **************************************************

instance Info_Kirgo_Escort(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 2;
	condition		= Info_Kirgo_Escort_Condition;
	information		= Info_Kirgo_Escort_Info;
	permanent		= 0;
	important		= 0;
	description 	= "Nie chcia�by� znowu powalczy�?";
};                       

FUNC INT Info_Kirgo_Escort_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kirgo_Hi))&&(Npc_KnowsInfo (hero, DIA_Orkan_Again))
	{
		return 1;
	};
};

func VOID Info_Kirgo_Escort_Info()
{
	AI_Output (other, self,"Info_Kirgo_Escort_15_01"); //Nie chcia�by� znowu powalczy�?
	AI_Output (self, other,"Info_Kirgo_Escort_05_02"); //Czasami troch� mi tego brakuje. Co masz na my�li?
	AI_Output (other, self,"Info_Kirgo_Escort_15_03"); //Szykuje si� wyprawa poza palisad�. B�dziemy pilnowa� transportu z broni� do Nowego Obozu.
	AI_Output (self, other,"Info_Kirgo_Escort_05_04"); //S�ysza�em o tym. Te konwoje nigdy nie wracaj�. Nie szukam �mierci, tylko walki.
	AI_Output (other, self,"Info_Kirgo_Escort_15_05"); //Ja te� chc� jeszcze troch� po�y�. P�jdziemy now� tras�, wy�lemy zwiadowc�. 
	AI_Output (other, self,"Info_Kirgo_Escort_15_06"); //Poza tym w tej chwili Stary Ob�z to najwi�ksza si�a w Kolonii. Sama obecno�� stra�nik�w powinna wystarczy� �eby odstraszy� napastnik�w.
	AI_Output (self, other,"Info_Kirgo_Escort_05_07"); //Nie wygl�dasz na mi�czaka. Z tego co s�ysza�em, Orkan te� nie jest u�omkiem.
	AI_Output (self, other,"Info_Kirgo_Escort_05_08"); //Mam ju� do�� bezczynnego czekania na atak rebeliant�w.
	AI_Output (self, other,"Info_Kirgo_Escort_05_09"); //Dobra, wyrusz� z wami.
	AI_Output (other, self,"Info_Kirgo_Escort_15_10"); //To �wietnie. Nie b�dziesz �a�owa�.
	AI_Output (other, self,"Info_Kirgo_Escort_15_11"); //Spotkamy si� przy bramie. Zabierz te� paczki z broni�, znajdziesz je w barakach.
	B_LogEntry(CH5_NC_Convoys, "Przekona�em Kirgo.");

	Npc_ExchangeRoutine(self,"WAIT");
};

// **************************************************

instance Info_Kirgo_End(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 3;
	condition		= Info_Kirgo_End_Condition;
	information		= Info_Kirgo_End_Info;
	permanent		= 0;
	description 	= "Wybacz, �e Was wykorzysta�em.";
};                       

FUNC INT Info_Kirgo_End_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Cord_ConvoyConvoyTrapEnd))
	{
		return 1;
	};
};
func VOID Info_Kirgo_End_Info()
{
	AI_Output (other, self,"Info_Kirgo_End_15_01"); //Wybacz, �e Was wykorzysta�em.
	AI_Output (self, other,"Info_Kirgo_End_05_02"); //Nie ma sprawy. Nie mia�e� wyboru. Pewnie post�pi�bym podobnie na Twoim miejscu.
	AI_Output (self, other,"Info_Kirgo_End_05_03"); //Mo�e w Nowym Obozie znajd� kogo�, z kim mo�na solidnie potrenowa�?
	AI_Output (self, other,"Info_Kirgo_End_05_04"); //Powodzenia, Rick.
	AI_Output (other, self,"Info_Kirgo_End_15_05"); //Trzymaj si�, Kirgo.
	
	Npc_ExchangeRoutine(self,"NC1");
};