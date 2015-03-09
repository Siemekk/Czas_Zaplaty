
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Kris_EXIT(C_INFO)
{
	npc			= Grd_610_Gardist;
	nr			= 999;
	condition			= Info_Kris_EXIT_Condition;
	information			= Info_Kris_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Kris_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Kris_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Kris_Hello (C_INFO)
{
	npc		= Grd_610_Gardist;
	nr			= 1;
	condition		= Info_Kris_Hello_Condition;
	information		= Info_Kris_Hello_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kris_Hello_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Henger_Again))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};

};
FUNC VOID Info_Kris_Hello_Info()
{	

	var C_NPC pinto; pinto = Hlp_GetNpc(Grd_612_Gardist);

	B_FullStop (hero);
	AI_TurnToNpc (other, self);
	AI_Output (self, other,"Info_Kris_Hello_07_01"); //I wtedy Nia dziwnie na niego spojrza�a...
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Kris_Hello_07_02"); //Co� Ty za jeden?
	AI_GotoNpc(other,self);
	AI_Output (other, self,"Info_Kris_Hello_15_03"); //Wisielec powiedzia�, �e mam pogada� z jakim� Krisem. Znasz go?
	AI_Output (self, other,"Info_Kris_Hello_07_04"); //Do�� dobrze. To wredny sukinsyn, do tego nie lubi jak obcy w�sz� gdzie nie powinni.
	AI_Output (other, self,"Info_Kris_Hello_15_05"); //Chcia�em si� tylko rozejrze�...
	AI_Output (self, other,"Info_Kris_Hello_07_06"); //To nie takie proste. Nikt kto wchodzi do Gniazda, nie wychodzi bez zgody Krisa.
	AI_PlayAni ( other, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (other, self,"Info_Kris_Hello_15_07"); //To jaki� ob�z pracy?
	AI_Output (self, other,"Info_Kris_Hello_07_08"); //Pos�uchaj, ch�opcze. Nikt tutaj nie lubi w�sz�cych ps�w. A Ty jeste� obcym kundlem w stadzie wilk�w.
	AI_Output (self, other,"Info_Kris_Hello_07_09"); //Czy wyrazi�em si� wystarczaj�co klarownie?
	AI_Output (other, self,"Info_Kris_Hello_15_10"); //Spokojnie...
	AI_Output (self, other,"Info_Kris_Hello_07_11"); //Zamknij si�!
	AI_TurnToNpc (self, pinto);
	AI_Output (self, other,"Info_Kris_Hello_07_12"); //Co si� dzieje Pinto?
	B_StopProcessInfos	(self);
	AI_GotoNpc(pinto, self);

	/******************************
Ma podej�� do dicka i krisa
******************************/


};



// ************************************************************

INSTANCE Info_Kris_Hello1 (C_INFO)
{
	npc		= Grd_610_Gardist;
	nr			= 2;
	condition		= Info_Kris_Hello1_Condition;
	information		= Info_Kris_Hello1_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kris_Hello1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Pinto_Hello))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};

};
FUNC VOID Info_Kris_Hello1_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
	AI_Output (self, other,"Info_Kris_Hello1_07_01"); //Dobry pomys�.
	AI_Output (self, other,"Info_Kris_Hello1_07_02"); //Poszukaj Nii, pomo�esz jej z umarlakami. Idealnie nadajesz si� do na duszo�apa.
	AI_Output (other, self,"Info_Kris_Hello1_15_03"); //Nie mam zamiaru...
	AI_Output (self, other,"Info_Kris_Hello1_07_04"); //Je�eli chcesz �y�, to r�b to co m�wi�. Wystarczy, �e splun�, a ch�opcy pochlastaj� t� Twoj� pi�kn� twarzyczk�.
	AI_Output (self, other,"Info_Kris_Hello1_07_05"); //Zrozumia�e�?
	AI_Output (other, self,"Info_Kris_Hello1_15_06"); //Tak.
	AI_Output (self, other,"Info_Kris_Hello1_07_07"); //A teraz spieprzaj.
	B_LogEntry		(CH4_Non_Eagle, "Kris to kawa� sukinsyna, to on rz�dzi w Orlim Gnie�dzie. Pinto te� wygl�da na kogo� komu nie warto wchodzi� w drog�. Mam poszuka� jakiej� Nii i pom�c jej z umarlakami - cokolwiek to znaczy.");
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"start");

};

// ************************************************************

INSTANCE Info_Kris_Hello2 (C_INFO)
{
	npc			= Grd_610_Gardist;
	nr			= 3;
	condition		= Info_Kris_Hello2_Condition;
	information		= Info_Kris_Hello2_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kris_Hello2_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Kris_Hello1))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};

};

FUNC VOID Info_Kris_Hello2_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Kris_Hello2_07_01"); //Aha. I jeszcze jedno.
	AI_Output (self, other,"Info_Kris_Hello2_07_02"); //Trzymaj r�czki przy sobie.
	AI_Output (self, other,"Info_Kris_Hello2_07_03"); //Nia to kobieta szefa. Tkniesz j�, to Georg skr�ci Ci kark.
	AI_Output (self, other,"Info_Kris_Hello2_07_04"); //A teraz spadaj mi z oczu.
	B_LogEntry		(CH4_Non_Eagle, "Nia to kobieta szefa, pewnie Kris mia� na my�li Hrabiego. A Georg to chyba jej ochroniarz. Cholera, po co ja tu przylaz�em?");
	B_StopProcessInfos	(self);


	/***************************
Ni� powinna sta� przy ��ku na kt�rym le�y niewolnik nazwany: Ranny Cz�owiek. To jego instancja: SLV_640_Slave

Zr�b tak bo ja to uwzgl�dniam w skryptach
***************************/

};




// ************************************************************

INSTANCE Info_Kris_Helllo2 (C_INFO)
{
	npc			= Grd_610_Gardist;
	nr			= 3;
	condition		= Info_Kris_Helllo2_Condition;
	information		= Info_Kris_Helllo2_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Chcia�em o co� zapyta�.";
};                       

FUNC INT Info_Kris_Helllo2_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Kris_Hello))
	{
		return 1;
	};

};

FUNC VOID Info_Kris_Helllo2_Info()
{	
	AI_Output (other, self,"Info_Kris_Helllo2_15_01"); //Chcia�em o co� zapyta�.
	AI_Output (self, other,"Info_Kris_Helllo2_07_02"); //Chyba mnie nie zrozumia�e�.
	AI_Output (self, other,"Info_Kris_Helllo2_07_03"); //Wypierdalaj!
	B_StopProcessInfos	(self);

};

// ************************************************************

INSTANCE Info_Kris_Fin (C_INFO)
{
	npc			= Grd_610_Gardist;
	nr			= 3;
	condition		= Info_Kris_Fin_Condition;
	information		= Info_Kris_Fin_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kris_Fin_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Seven_Watch1))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID Info_Kris_Fin_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Kris_Fin_07_01"); //A oto i ch�do�ony w dup� bohater!
	AI_Output (self, other,"Info_Kris_Fin_07_02"); //Masz szcz�cie gnido, �e Pinto za Ciebie po�wiadczy�.
	AI_Output (self, other,"Info_Kris_Fin_07_03"); //Z ch�ci� wypru�bym Ci flaki, ale wtedy Hrabia by mi �eb urwa�.
	AI_Output (self, other,"Info_Kris_Fin_07_04"); //Zejd� mi z oczu i nigdy tu nie wracaj!
	B_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self,"START");	
}; 
