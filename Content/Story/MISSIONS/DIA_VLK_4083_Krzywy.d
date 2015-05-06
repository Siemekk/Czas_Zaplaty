
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Krzywy_Exit (C_INFO)
{
	npc			= VLK_4083_Krzywy;
	nr			= 999;
	condition	= DIA_Krzywy_Exit_Condition;
	information	= DIA_Krzywy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Krzywy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Krzywy_Exit_Info()
{
	B_StopProcessInfos	( self );
};

INSTANCE DIA_Krzywy_First (C_INFO)
{
	npc				= VLK_4083_Krzywy;
	nr				= 1;
	condition		= DIA_Krzywy_First_Condition;
	information		= DIA_Krzywy_First_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nie boli ci� ju� dupa od siedzenia?"; 
};

FUNC INT DIA_Krzywy_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Krzywy_First_Info()
{
	AI_Output (other, self, "DIA_Krzywy_First_15_01"); //Nie boli ci� ju� dupa od siedzenia?
	AI_Output (self, other, "DIA_Krzywy_First_11_02"); //A co Ci� to obchodzi?
	AI_Output (other, self, "DIA_Krzywy_First_15_03"); //Grzeczniej, prosz�.
	AI_Output (self, other, "DIA_Krzywy_First_11_04"); //Bo co? Zabijesz mnie? He, he, jakby� nie zauwa�y�, to my wszyscy jeste�my ju� martwi!
	AI_Output (other, self, "DIA_Krzywy_First_15_05"); //Nie ma st�d �adnego wyj�cia?
	AI_Output (self, other, "DIA_Krzywy_First_11_06"); //Nie ma idioto i nigdy nie b�dzie, chyba, �e nogami do przodu!
	AI_Output (other, self, "DIA_Krzywy_First_15_07"); //To niemo�liwe, zawsze jest jakie� wyj�cie.
	AI_Output (self, other, "DIA_Krzywy_First_11_08"); //Pieprzysz jak ten �wir Paj�k. On te� uwa�a, �e z G��bi mo�na zbiec. Na staro�� pomiesza�o mu si� we �bie...
	AI_Output (self, other, "DIA_Krzywy_First_11_09"); //Daj mi wr�ci� do pracy...
	B_LogEntry		(CH2_NON_Deep, "Krzywy powiedzia�, �e jaki� Paj�k twierdzi, �e z G��bi mo�na jednak zbiec. Musz� z nim pogada�.");
	B_StopProcessInfos	( self );
}; 

INSTANCE DIA_Krzywy_First1 (C_INFO)
{
	npc				= VLK_4083_Krzywy;
	nr				= 1;
	condition		= DIA_Krzywy_First1_Condition;
	information		= DIA_Krzywy_First1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Krzywy_First1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Krzywy_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Krzywy_First1_Info()
{
	AI_Output (self, other, "DIA_Krzywy_First1_11_01"); //Jak tak na Ciebie spojrze� to wygl�dasz do��... smakowicie.
	AI_Output (self, other, "DIA_Krzywy_First1_11_02"); //Od dawna nie mia�em ludzkiego mi�sa w ustach.	
	AI_Output (other, self, "DIA_Krzywy_First1_15_03"); //Je�eli o mnie chodzi, to lepiej �eby tak pozosta�o!
};