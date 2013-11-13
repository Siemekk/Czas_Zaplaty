
// **************************************************
//						 EXIT
// **************************************************

instance  Grd_2502_Witten_Exit (C_INFO)
{
	npc			= Grd_2502_Witten;
	nr			= 999;
	condition	= Grd_2502_Witten_Exit_Condition;
	information	= Grd_2502_Witten_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC int  Grd_2502_Witten_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_2502_Witten_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
//					Rozdzia�: 3
//					Misja:  Pier�cionek
// QUESTID 552
// **************************************************
instance  Grd_2502_Asking_About_Witten_Ring (C_INFO)
{
	npc			= Grd_2502_Witten;
	nr			= 1;
	condition	= Grd_2502_Asking_About_Witten_Ring_Condition;
	information	= Grd_2502_Asking_About_Witten_Ring_Info;
	permanent	= 0;
	description = "�adny pier�cionek.";
};

FUNC int  Grd_2502_Asking_About_Witten_Ring_Condition()
{
	if (GetTheWittenRing == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Grd_2502_Asking_About_Witten_Ring_Info()
{
	AI_Output (other, self,"Grd_2502_Asking_About_Witten_Ring_11_00"); //�adny pier�cionek.
	AI_Output (self, other,"Grd_2502_Asking_About_Witten_Ring_11_01"); //Czego chcesz?
	AI_Output (other, self,"Grd_2502_Asking_About_Witten_Ring_11_02"); //Chcia�bym go kupi�.
	AI_Output (self, other,"Grd_2502_Asking_About_Witten_Ring_11_03"); //Kolejny sukinsyn, kt�ry my�li, �e wszystko jest do kupienia. Ja Ci zaraz dam nauczk� �mieciu!

	B_StopProcessInfos(self);
	
	B_StartAfterDialogFight(self,other,false);
};
/******************************************************************************************/
instance  Grd_2502_Witten_First_Talk_About_Ring(C_INFO)
{
	npc			= Grd_2502_Witten;
	nr			= 2;
	condition	= Grd_2502_Witten_First_Talk_About_Ring_Condition;
	information	= Grd_2502_Witten_First_Talk_About_Ring_Info;
	permanent	= 0;
	description = "Na pewno go nie sprzedasz?";
};

FUNC int  Grd_2502_Witten_First_Talk_About_Ring_Condition()
{
	if ((Npc_GetAivar(self,AIV_HASDEFEATEDSC) == true) && (Npc_KnowsInfo(hero,Grd_2502_Asking_About_Witten_Ring)))
	{
		return 1;
	};
};

FUNC int  Grd_2502_Witten_First_Talk_About_Ring_Info()
{
	AI_Output (other, self,"Grd_2502_Witten_First_Talk_About_Ring_Info_11_00"); //Na pewno go nie sprzedasz?
	//orc: musisz ustalic tutaj sume jaka chce: linia w scenariuszu: 30
	AI_Output (self, other,"Grd_2502_Witten_First_Talk_About_Ring_Info_11_01"); //Ehh... nawet bi� si� nie umiesz. Ci�ko u mnie z got�wk�... 200 bry�ek rudy.
	AI_Output (other, self,"Grd_2502_Witten_First_Talk_About_Ring_Info_15_02"); //To du�o pieni�dzy.
	AI_Output (self, other,"Grd_2502_Witten_First_Talk_About_Ring_Info_11_03"); //Ale Tobie bardzo na tym zale�y.
	
	B_LogEntry(KeretselLookingForWittenRing, "Witten mo�e mi sprzeda� pier�cie� za 200 bry�ek rudy.");
};
/******************************************************************************************/
instance  Grd_2502_Witten_Second_Talk_About_Ring (C_INFO)
{
	npc			= Grd_2502_Witten;
	nr			= 3;
	condition	= Grd_2502_Witten_Second_Talk_About_Ring_Condition;
	information	= Grd_2502_Witten_Second_Talk_About_Ring_Info;
	permanent	= 0;
	description = "Prosz�, oto ruda.";
};

FUNC int  Grd_2502_Witten_Second_Talk_About_Ring_Condition()
{
	if (Npc_KnowsInfo(hero,Grd_2502_Witten_First_Talk_About_Ring))
	{
		return 1;
	};
};

FUNC int  Grd_2502_Witten_Second_Talk_About_Ring_Info()
{
	AI_Output (other, self,"Grd_2502_Witten_Second_Talk_About_Ring_Info_11_00"); //Prosz�, oto ruda.
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		B_GiveInvItems	(other, self, ItMiNugget, 200);
		AI_Output(self, other,"Grd_2502_Witten_Second_Talk_About_Ring_Info_11_02"); //Cholera, chyba mi odbi�o. Sprzedawa� taki pier�cionek za kilka bry�ek rudy!
		AI_Output(self, other,"Grd_2502_Witten_Second_Talk_About_Ring_Info_11_03"); //Dostaniesz go dopiero, jak dorzucisz trzydzie�ci bry�ek.
		
		B_LogEntry(KeretselLookingForWittenRing, "Witten zabra� ca�� rud�, ale nie odda� pier�cienia! ��da jeszcze trzydziestu bry�ek!");		
	}
	else
	{
		AI_Output(self,other,"Grd_2502_Witten_Second_Talk_About_Ring_Info_11_01"); //Umiem liczy�. Przyjd�, kiedy b�dziesz mia� do�� rudy!
	};	
};
/******************************************************************************************/
instance  Grd_2502_Witten_Final_Talk_About_Ring(C_INFO)
{
	npc			= Grd_2502_Witten;
	nr			= 4;
	condition	= Grd_2502_Witten_Final_Talk_About_Ring_Condition;
	information	= Grd_2502_Witten_Final_Talk_About_Ring_Info;
	permanent	= 1;
	description = "Oto 30 bry�ek.";
};

FUNC int  Grd_2502_Witten_Final_Talk_About_Ring_Condition()
{
	if (Npc_KnowsInfo(hero,Grd_2502_Witten_Second_Talk_About_Ring))
	{
		return 1;
	};
};

FUNC int  Grd_2502_Witten_Final_Talk_About_Ring_Info()
{
	AI_Output (other, self,"Grd_2502_Witten_Final_Talk_About_Ring_Info_11_00"); //Oto 30 bry�ek.
	
	if (Npc_HasItems(other,ItMiNugget)>=30)
	{
		B_GiveInvItems	(other, self, ItMiNugget, 30);
		
		AI_Output(self, other,"Grd_2502_Witten_Final_Talk_About_Ring_Info_11_02"); //Wiesz co... nie uwa�asz, �e to troch� za ma�o?
		AI_Output(other, self,"Grd_2502_Witten_Final_Talk_About_Ring_Info_15_03"); //Nie. Dawaj pier�cie�.
		AI_Output(self, other,"Grd_2502_Witten_Final_Talk_About_Ring_Info_11_04"); //Niech Ci ju� b�dzie, bierz i spadaj.
		
		B_GiveInvItems	(self, other, WittenRing, 1);
		
		B_StopProcessInfos(self);
		
		B_LogEntry(KeretselLookingForWittenRing, "Witten chcia� dalej kombinowa�, ale w ko�cu zgodzi� si� odda� pier�cie�.");	
	}
	else
	{
		AI_Output(self,other,"Grd_2502_Witten_Final_Talk_About_Ring_Info_11_01"); //To nie jest 30 bry�ek rudy! Przyjd�, jak je zdob�dziesz!
	};	
};
