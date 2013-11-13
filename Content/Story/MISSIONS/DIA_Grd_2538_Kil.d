// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kil_Exit (C_INFO)
{
	npc			= Grd_2538_Kil;
	nr			= 999;
	condition	= DIA_Kil_Exit_Condition;
	information	= DIA_Kil_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kil_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kil_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					
// **************************************************

var int kil_talk;

INSTANCE DIA_Kil_First (C_INFO)
{
	npc				= Grd_2538_Kil;
	nr				= 1;
	condition		= DIA_Kil_First_Condition;
	information		= DIA_Kil_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Kil_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(!Npc_KnowsInfo (hero, DIA_Gorn_Guards))
	{
		return 1;
	};
};

FUNC VOID DIA_Kil_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
   
	if (kil_talk == FALSE)
	{
		kil_talk = TRUE;
		AI_Output (self, other, "DIA_Kil_First_11_01"); //Co tu tak �mierdzi? 
		AI_Output (other, self, "DIA_Kil_First_15_02"); //Ekhm... Chcia�bym wej�� do obozu.
		AI_Output (self, other, "DIA_Kil_First_11_03"); //A ja chcia�bym wytrze� ty�ek perfumowanym papierem. 
		var C_ITEM myarmor;
		myarmor = Npc_GetEquippedArmor(hero);
		
      if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
		{
			AI_Output (other, self, "DIA_Kil_First_15_04"); //Sp�jrz na zbroj�, jestem stra�nikiem.
			AI_Output (self, other, "DIA_Kil_First_11_05"); //Mo�e tak, a mo�e nie. Pe�no teraz przebiera�c�w pa��ta si� po go�ci�cu.
			AI_Output (other, self, "DIA_Kil_First_15_06"); //Ale...
			AI_Output (self, other, "DIA_Kil_First_11_07"); //Won mi st�d!
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Kil_First_11_08"); //Powiedzia�em - won mi st�d!
	};

	B_StopProcessInfos	(self);

	/*****************
	Gdzie� poza ze 20m od bramy
	****************/
	AI_GotoWP(other, "NC_PATH50");
};

// **************************************************

var int kill_talk;

INSTANCE DIA_Kil_Gate (C_INFO)
{
	npc				= Grd_2538_Kil;
	nr				= 2;
	condition		= DIA_Kil_Gate_Condition;
	information		= DIA_Kil_Gate_Info;
	permanent		= 1;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Kil_Gate_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Gorn_Guards))&&(!grd_NC_pass)
	{
		return 1;
	};
};

FUNC VOID DIA_Kil_Gate_Info()
{
	/*************************
Zmiana rutyny Carlosa, kt�ry do tej pory sta� przed bram� na Pola Ry�owe.
Teraz ma sta� ze 20 m za bram� do NO przez kt�r� przepuszcza Kil

*************************/

	var C_NPC car; car = Hlp_GetNpc(Grd_4087_Carlos);
	Npc_ExchangeRoutine(car,"STAY");

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
   
	if (kill_talk == 0)
	{
		if (Npc_KnowsInfo (hero, DIA_Kil_First))
		{
			AI_Output (self, other, "DIA_Kil_Gate_11_01"); //To znowu Ty? Ale z ciebie uparte bydl�!
		};
      
		AI_Output (self, other, "DIA_Kil_Gate_11_02"); //Czego chcesz?
		AI_Output (other, self, "DIA_Kil_Gate_15_03"); //Przej�� przez bram�.
		AI_Output (self, other, "DIA_Kil_Gate_11_04"); //Pos�uchaj...
		AI_Output (other, self, "DIA_Kil_Gate_15_05"); //Nie, to ty pos�uchaj!
	}
	else
	{
		AI_Output (self, other, "DIA_Kil_Gate_11_06"); //Czego znowu?
	};
   
	Info_ClearChoices (DIA_Kil_Gate);
	Info_AddChoice (DIA_Kil_Gate, "Wpu�cisz mnie i to zaraz!", DIA_Kil_Gate_Want);
	Info_AddChoice (DIA_Kil_Gate, "Wracam z patrolu.", DIA_Kil_Gate_Patrol);
	Info_AddChoice (DIA_Kil_Gate, "Chc� zaoferowa� swoje us�ugi.", DIA_Kil_Gate_Hire);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Want()
{
	AI_Output (other, self, "DIA_Kil_Gate_Want_15_01"); //Wpu�cisz mnie i to zaraz!
   
	if (kill_talk == 0)
	{
		kill_talk = 1;
		AI_Output (self, other, "DIA_Kil_Gate_Want_11_02"); //A co zrobisz, �eby mnie przekona�? B�dziesz tupa� nog�?
		AI_Output (self, other, "DIA_Kil_Gate_Want_11_03"); //Cz�owieku sk�d Ty si� urwa�e�?
		AI_Output (self, other, "DIA_Kil_Gate_Want_11_04"); //Masz szcz�cie, �e wypi�em za du�o ry��wki, bo inaczej postrzela�bym sobie do ruchomego celu. Niestety w tym stanie nie trafi�bym nawet w stodo��.
		AI_Output (self, other, "DIA_Kil_Gate_Want_11_05"); //Spadaj!
	}
	else
	{
		AI_Output (self, other, "DIA_Kil_Gate_Want_11_06"); //Ju� to s�ysza�em - won!
	};
   
	B_StopProcessInfos(self);
	
	AI_GotoWP(other, "NC_PATH50");
};


// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Hire()
{
	AI_Output (other, self, "DIA_Kil_Gate_Hire_15_01"); //Chc� zaoferowa� swoje us�ugi.
   
	if (kill_talk == 0)
	{
		kill_talk = 1;
		AI_Output (self, other, "DIA_Kil_Gate_Hire_11_02"); //Mamy ju� wystarczaj�c� ilo�� m�skich dziwek, a Ty zbyt urokliwy nie jeste�.
		AI_Output (self, other, "DIA_Kil_Gate_Hire_11_03"); //Id� uszcz�liwi� kogo�... bardziej zdeterminowanego. Mo�e ork�w?
	}
	else
	{
		AI_Output (self, other, "DIA_Kil_Gate_Hire_11_04"); //Robisz si� nudny...
	};
   
	B_StopProcessInfos(self);
	
	
	AI_GotoWP(other, "NC_PATH50");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol()
{
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_15_01"); //Wracam z patrolu.
   
	if (kill_talk == 0)
	{
		kill_talk = 1;
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_02"); //Czy�by? Co� ma�y ten patrol. Jednoosobowy... Ciekawa taktyka.
		AI_Output (other, self, "DIA_Kil_Gate_Patrol_15_03"); //Dorwali nas rebelianci. Tylko ja zdo�a�em si� przebi�.
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_04"); //Powiedz po prostu, �e najszybciej ucieka�e�. Brakuje nam tu tylko kolejnego tch�rza.
		AI_Output (other, self, "DIA_Kil_Gate_Patrol_15_05"); //M�wi� prawd�!
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_06"); //Mo�e tak, a mo�e nie. Rzeczywi�cie czekali�my na wsparcie i mo�e jest tak jak m�wisz.
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_07"); //Zadam Ci jedno pytanie, na kt�re tylko prawdziwy stra�nik b�dzie zna� odpowied�.
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_08"); //Kto teraz rz�dzi w Nowym Obozie?
	}
	else
	{
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_08"); //Dobra, spr�bujmy jeszcze raz. Kto NAPRAWD� rz�dzi w Nowym Obozie?
	};
   
	Info_ClearChoices (DIA_Kil_Gate);
	Info_AddChoice (DIA_Kil_Gate, "Ekhm... Ty?", DIA_Kil_Gate_Patrol_U);
	Info_AddChoice (DIA_Kil_Gate, "Hrabia.", DIA_Kil_Gate_Patrol_H);
	Info_AddChoice (DIA_Kil_Gate, "Gomez.", DIA_Kil_Gate_Patrol_G);
	Info_AddChoice (DIA_Kil_Gate, "Fletcher.", DIA_Kil_Gate_Patrol_F);
	Info_AddChoice (DIA_Kil_Gate, "Kruk.", DIA_Kil_Gate_Patrol_K);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol_U()
{
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_U_15_01"); //Ekhm... Ty?
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_U_11_02"); //Nie do��, �e tch�rz i k�amca to jeszcze dupow�az.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_U_11_03"); //Zejd� mi z oczu!
	
   B_StopProcessInfos(self);
	
	AI_GotoWP(other, "NC_PATH50");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol_G()
{
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_G_15_01"); //Gomez.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_G_11_02"); //Sprytna odpowied�. Niby bezpieczna i przekonywuj�ca.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_G_11_03"); //Tylko, �e Gomez jest daleko st�d i niekt�rym to bardzo odpowiada.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_G_11_04"); //Odejd� i daj mi si� ur�n�� w spokoju.
	
   B_StopProcessInfos(self);
	
	AI_GotoWP(other, "NC_PATH50");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol_K()
{
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_K_15_01"); //Kruk.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_K_11_02"); //Nic mi o tym nie wiadomo - pud�o.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_K_11_03"); //Id� pownerwia� ork�w.
	
   B_StopProcessInfos(self);
	
	AI_GotoWP(other, "NC_PATH50");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol_F()
{
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_F_15_01"); //Fletcher.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_F_11_02"); //Hmm. Niby trafi�e�. Ale Fletcher to tylko... wyeksponowana figura.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_F_11_03"); //Co� mi si� w Tobie nie podoba. Chyba jednak nie wpuszcz� ci� poza bram�.
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_F_15_04"); //Przecie� to Fletcher jest waszym szefem!
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_F_11_05"); //Ja trzymam z kim� innym, kim� kto stoi w cieniu. Bywaj.
	
   B_StopProcessInfos(self);
	
	AI_GotoWP(other, "NC_PATH50");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol_H()
{
	grd_NC_pass = TRUE;
   
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_H_15_01"); //Hrabia.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_H_11_02"); //No prosz�, sw�j ch�op. Dobrze wiedzie�, �e przyb�dzie nam kolejny miecz.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_H_11_03"); //Mo�esz przej��, przyjacielu.
	
   B_LogEntry		(CH4_RBL_NCRebel, "W ko�cu uda�o mi si� przekona� Kila, �eby przepu�ci� mnie przez bram�! Czas troch� pozwiedza�.");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Kil_Talk (C_INFO)
{
	npc				= Grd_2538_Kil;
	nr				= 3;
	condition		= DIA_Kil_Talk_Condition;
	information		= DIA_Kil_Talk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co s�ycha�?"; 
};

FUNC INT DIA_Kil_Talk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Kil_Gate))&&(grd_NC_pass)
	{
		return 1;
	};
};

FUNC VOID DIA_Kil_Talk_Info()
{
	AI_Output (other, self, "DIA_Kil_Talk _15_02"); //Co s�ycha�?
	AI_Output (self, other, "DIA_Kil_Talk _11_03"); //Podobno Hrabia co� szykuje... Mam nadziej�, �e b�d� wtedy daleko st�d.
};
