/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Org_873_Cipher_Exit (C_INFO)
{
	npc		=  Org_873_Cipher;
	nr			=  999;
	condition	=  Org_873_Cipher_Exit_Condition;
	information	=  Org_873_Cipher_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Org_873_Cipher_Exit_Info()
{
	B_StopProcessInfos(self);
};

// ******************************
// 			Hallo
// ******************************

instance  Org_873_Cipher_Hello (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Hello_Condition;
	information	=  Org_873_Cipher_Hello_Info;
	permanent	=  0;
	description = "Co s�ycha�?";
};                       

FUNC int  Org_873_Cipher_Hello_Condition()
{
	return 1;
};

FUNC VOID  Org_873_Cipher_Hello_Info()
{
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_Cipher_Hello1_12_01"); //A co ma by� s�ycha� w tej pieprzonej kopalni?!
	AI_Output (self, other,"DIA_Cipher_Hello1_12_02"); //Tutaj nawet nie ma co wypali�!
	AI_Output (self, other,"DIA_Cipher_Hello1_12_03"); //Niech to wszystko szlag trafi!
};

// ******************************

instance  Org_873_Cipher_Hello2 (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  2;
	condition	=  Org_873_Cipher_Hello2_Condition;
	information	=  Org_873_Cipher_Hello2_Info;
	permanent	=  0;
	description = "Mam dla ciebie propozycj�.";
};                       

FUNC int  Org_873_Cipher_Hello2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Sher_Hlp))&&((NPC_HasItems(hero,ItMiJoint_1)>=1)||(NPC_HasItems(hero,ItMiJoint_2)>=1)||(NPC_HasItems(hero,ItMiJoint_3)>=1))
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Hello2_Info()
{
	miners_work = miners_work + 1;
   
	AI_Output (other, self,"DIA_Cipher_Hello2_15_00"); //Mam dla ciebie propozycj�.
	AI_Output (self, other,"DIA_Cipher_Hello2_12_01"); //Ty? W�tpi�, ale i tak nie mam nic lepszego do roboty. M�w.
	AI_Output (other, self,"DIA_Cipher_Hello2_15_02"); //Chc�, �eby� zacz�� kopa� jak pozostali.
	AI_Output (self, other,"DIA_Cipher_Hello2_12_03"); //To z braku ziela mam halucynacje. Zejd� mi z oczu...
	AI_Output (other, self,"DIA_Cipher_Hello2_15_04"); //A co powiesz na to, �e mam co� porz�dnego do palenia?
	AI_Output (self, other,"DIA_Cipher_Hello2_12_05"); //Ty?
	AI_Output (other, self,"DIA_Cipher_Hello2_15_06"); //Powtarzasz si�.
	AI_Output (self, other,"DIA_Cipher_Hello2_12_07"); //A co mi tam. Za zielsko mog� nawet troch� popracowa�. Niech b�dzie.
	AI_Output (self, other,"DIA_Cipher_Hello2_12_08"); //Stary, uratowa�e� mi �ycie!
  
   if (NPC_HasItems(other,ItMiJoint_1)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_1, 1);
      AI_UseItem (self, ItMiJoint_1);
	}
	else if (NPC_HasItems(other,ItMiJoint_2)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_2, 1);
      AI_UseItem (self, ItMiJoint_2);
	}
	else if (NPC_HasItems(other,ItMiJoint_3)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_3, 1);
      AI_UseItem (self, ItMiJoint_3);
	};

	AI_Output (other, self,"DIA_Cipher_Hello2_15_09"); //Tylko nie zr�b sobie krzywdy kilofem.
	
   B_GiveXP(250);	
	B_LogEntry(CH4_GRD_NewMine, "Cipher si� zabaka�, ale wzi�� si� do pracy.");
	B_StopProcessInfos(self);

	/***************
	rutyna kopania rudy
	**************/
	Npc_ExchangeRoutine(self,"Pick");
	var C_NPC vlk1; vlk1 = Hlp_GetNpc(VLK_5002_Buddler);
	Npc_ExchangeRoutine(vlk1,"GO");
};

// ******************************

instance DIA_Cipher_Urt (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  3;
	condition	=  DIA_Cipher_Urt_Condition;
	information	=  DIA_Cipher_Urt_Info;
	permanent	=  0;
	description 	= "Chcia�em pogada�.";
};                       

FUNC int  DIA_Cipher_Urt_Condition()
{
	if (Npc_KnowsInfo (hero, STT_Balam_Spy))&&((NPC_HasItems(hero,ItMiJoint_1)>=1)||(NPC_HasItems(hero,ItMiJoint_2)>=1)||(NPC_HasItems(hero,ItMiJoint_3)>=1))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cipher_Urt_Info()
{
	AI_Output (other, self,"DIA_Cipher_Urt_15_00"); //Chcia�em pogada�.
	AI_Output (self, other,"DIA_Cipher_Urt_12_01"); //A ja bym co� zapali�...
	AI_Output (other, self,"DIA_Cipher_Urt_15_02"); //We� to, nie musisz dzi�kowa�.
   
	if (NPC_HasItems(other,ItMiJoint_1)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_1, 1);
	}
	else if (NPC_HasItems(other,ItMiJoint_2)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_2, 1);
	}
	else if (NPC_HasItems(other,ItMiJoint_3)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_3, 1);
	};
   
	AI_Output (self, other,"DIA_Cipher_Urt_12_03"); //Stary, uratowa�e� mi �ycie. Ju� dwa dzwony nic nie baka�em!
	AI_UseMob(self, "SMOKE", 1);
	AI_Output (other, self,"DIA_Cipher_Urt_15_04"); //Zanim odp�yniesz do krainy tamburyna powiedz mi co wiesz o Urcie.
	AI_Output (self, other,"DIA_Cipher_Urt_12_05"); //Sk�d wiesz, �e znam tego... Jak mu tam?
	AI_Output (other, self,"DIA_Cipher_Urt_15_06"); //Urt. Niewa�ne sk�d. Podobno znali�cie si� w czasach przed Koloni�.
	AI_Output (self, other,"DIA_Cipher_Urt_12_07"); //Urt... A pewnie m�wisz o Urthosie, myrta�skim przemytniku i by�ym kr�lewskim gwardzi�cie?
	AI_Output (other, self,"DIA_Cipher_Urt_15_08"); //Urthos? To ciekawe. Co o nim wiesz?
	AI_Output (self, other,"DIA_Cipher_Urt_12_09"); //Niestety ca�kiem sporo. Trafi�em tu za sprzeda� ziela w Myrtanie.
	AI_Output (self, other,"DIA_Cipher_Urt_12_10"); //Dasz wiar�? Cz�owiek chce, aby inni ludzie zobaczyli �wiat w lepszych kolorach, a w zamian trafia do Kolonii...
	AI_Output (self, other,"DIA_Cipher_Urt_12_11"); //Urthos by� przemytnikiem, kt�ry dostarcza� mi ziele. Handlowa� te� niewolnikami, ale tym nie by�em zainteresowany.
	AI_Output (self, other,"DIA_Cipher_Urt_12_12"); //Kiedy� sprzeda� mi trefny towar. Poszed�em na jego �ajb� z kilkoma znajomkami.
	AI_Output (self, other,"DIA_Cipher_Urt_12_13"); //Mia�em szcz�cie, �e p�ywam jak ryba, bo sko�czy�bym w zatoce Kare�skiej jako kolejny �mie� na dnie.
	AI_Output (self, other,"DIA_Cipher_Urt_12_14"); //Od tamtej pory nic o nim nie s�ysza�em. Z reszt� nied�ugo p�niej trafi�em do Kolonii.
	AI_Output (other, self,"DIA_Cipher_Urt_15_15"); //Ciekawa historia.
	AI_Output (self, other,"DIA_Cipher_Urt_12_16"); //Stary nie masz poj�cia jak si� zdziwi�em, kiedy zobaczy�em tego sukinsyna w�r�d stra�nik�w.
	AI_Output (other, self,"DIA_Cipher_Urt_15_17"); //Mam nadziej�, �e m�wisz prawd�.
	AI_Output (self, other,"DIA_Cipher_Urt_12_18"); //Chyba tak, ale wiesz jak to jest z tym zielem... Czasami nie wiem, jak si� nazywam, he, he.
	AI_Output (other, self,"DIA_Cipher_Urt_15_19"); //Bywaj, Cipher.
	
   B_LogEntry		(CH6_RBL_Spy, "Cholera, sytuacja zacz�a si� gmatwa�. Cipher rzeczywi�cie zna� Urta, czy jak go nazwa� - Urthosa, przed Koloni�. Ten �pun twierdzi, �e Urt by� przemytnikiem, a wcze�niej by� nawet kr�lewskim gwardzist�. Musz� dowiedzie� si� od Ratforda, jak skaptowa� Urta. Hmm, mo�e warto te� zapyta� Lee, czy nie s�ysza� czego� o gwardzi�cie Urthosie?");
};
