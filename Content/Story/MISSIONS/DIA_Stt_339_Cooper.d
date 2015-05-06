
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cooper_Exit (C_INFO)
{
	npc			= Stt_339_Cooper;
	nr			= 999;
	condition	= DIA_Cooper_Exit_Condition;
	information	= DIA_Cooper_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cooper_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cooper_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

var int cooper_pay;

INSTANCE DIA_Cooper_Hello (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 1;
	condition		= DIA_Cooper_Hello_Condition;
	information		= DIA_Cooper_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Cooper_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_Hello_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (self, other, "DIA_Cooper_Hello_12_01"); //Ej, Ty! Podejd� no tu.
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Cooper_Hello_12_02"); //�mierdzisz sol� morsk�. Mam racj�?
	AI_Output (other, self, "DIA_Cooper_Hello_15_03"); //By� mo�e. Kim jeste�?
	AI_Output (self, other, "DIA_Cooper_Hello_12_04"); //Odk�d Gomez wykopa� Diego, powsta� wakat poganiaczy tych t�pych Cieni.
	AI_Output (self, other, "DIA_Cooper_Hello_12_05"); //By� tylko jeden ch�tny, ale znale�li go na drugi dzie� z poder�ni�tym gard�em.
	AI_Output (other, self, "DIA_Cooper_Hello_15_06"); //Cienie?
	AI_Output (self, other, "DIA_Cooper_Hello_12_07"); //No raczej sam tego nie zrobi�. Bystrzacha si� znalaz�...
	AI_Output (self, other, "DIA_Cooper_Hello_12_08"); //I wtedy Gomez raczy� mnie 'nagrodzi�' t� posadk�.
	AI_Output (self, other, "DIA_Cooper_Hello_12_09"); //W sumie nie jest �le. Zrobi�em porz�dek z kilkoma krzykaczami, a reszta si� nie wychyla.
	AI_Output (other, self, "DIA_Cooper_Hello_15_10"); //To �wietnie, ale co to mnie obchodzi?
	AI_Output (self, other, "DIA_Cooper_Hello_12_11"); //Po prostu jestem towarzyski. I lubi� nowe twarze.
	AI_Output (other, self, "DIA_Cooper_Hello_15_12"); //Wybacz, ale nie mam ca�ego dnia na pogaw�dki...
	AI_Output (self, other, "DIA_Cooper_Hello_12_13"); //To bardzo nietaktowanie, marynarzyku. Ale zapomn� o tym, je�eli op�acisz wej�ci�wk�.
	AI_Output (other, self, "DIA_Cooper_Hello_15_14"); //Nie rozumiem...
	AI_Output (self, other, "DIA_Cooper_Hello_12_15"); //Wszed�e� do Starego Obozu, prawda?
	AI_Output (other, self, "DIA_Cooper_Hello_15_16"); //Tak.
	AI_Output (self, other, "DIA_Cooper_Hello_12_17"); //I �yjesz, prawda?
	AI_Output (other, self, "DIA_Cooper_Hello_15_18"); //Tak.
	AI_Output (self, other, "DIA_Cooper_Hello_12_19"); //Do tego korzystasz z takich przywilej�w jak przebywanie w moim towarzystwie. A to kosztuje. Teraz rozumiesz?
	AI_Output (other, self, "DIA_Cooper_Hello_15_20"); //Tak.
	AI_Output (self, other, "DIA_Cooper_Hello_12_21"); //Bystrzacha z Ciebie, nie ma co. Lubi� Ci�, dam Ci dwa dni na uiszczenie zap�aty.
	AI_Output (other, self, "DIA_Cooper_Hello_15_22"); //Ile?
	AI_Output (self, other, "DIA_Cooper_Hello_12_23"); //Wystarczy tysi�c bry�ek rudy, nie b�d� zdziera� z marynarza.
	AI_Output (other, self, "DIA_Cooper_Hello_15_24"); //Niech ci� szlag... Tysi�c bry�ek to za du�o!
	AI_Output (self, other, "DIA_Cooper_Hello_12_25"); //G�wno mnie obchodzi Twoje zdanie. Masz dwa dni, p�niej powycinam Ci niekt�re cz�ci cia�a. A teraz spadaj.
	
   cooper_pay = B_SetDayTolerance()+2;
	Log_CreateTopic	(CH3_Grd_Payment, LOG_MISSION);
	Log_SetTopicStatus	(CH3_Grd_Payment, LOG_RUNNING);
	B_LogEntry		(CH3_Grd_Payment, "Cholerny Stary Ob�z! Zaczepi� mnie przyw�dca Cieni - Cooper. Mam mu zap�aci� wej�ci�wk� - 1000 bry�ek rudy. Je�eli nie uwin� si� z tym w dwa dni, to mog� mie� z nim spore problemy.");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Cooper_Seaman (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 2;
	condition		= DIA_Cooper_Seaman_Condition;
	information		= DIA_Cooper_Seaman_Info;
	permanent		= 0;
	important		= 0;
	description		= "Sk�d wiedzia�e�, �e by�em marynarzem?"; 
};

FUNC INT DIA_Cooper_Seaman_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cooper_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_Seaman_Info()
{
	AI_Output (other, self, "DIA_Cooper_Seaman_15_01"); //Sk�d wiedzia�e�, �e by�em marynarzem?
	AI_Output (self, other, "DIA_Cooper_Seaman_12_02"); //Zdradzi� Ci� ch�d. Ka�dy wilk morski to zauwa�y.
	AI_Output (other, self, "DIA_Cooper_Seaman_15_03"); //Gdzie p�ywa�e�?
	AI_Output (self, other, "DIA_Cooper_Seaman_12_04"); //Z kupieckimi okr�tami. By�em pilotem.
	AI_Output (self, other, "DIA_Cooper_Seaman_12_05"); //Pewnego razu na statku wybuch� bunt, a ja stan��em po niew�a�ciwej stronie i tak trafi�em do Kolonii.
	AI_Output (self, other, "DIA_Cooper_Seaman_12_06"); //Ale to stare dzieje. Mam ju� do�� morza. Kiedy tylko szlag trafi barier� kupi� jak�� ober�� i rozkr�c� interes.
};

var int coop_pay;

// **************************************************

INSTANCE DIA_Cooper_Pay (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 3;
	condition		= DIA_Cooper_Pay_Condition;
	information		= DIA_Cooper_Pay_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chc� zap�aci�."; 
};

FUNC INT DIA_Cooper_Pay_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cooper_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_Pay_Info()
{
	AI_Output (other, self, "DIA_Cooper_Pay_15_01"); //Chc� zap�aci�.
	if (cooper_pay <= (Wld_GetDay()))
	{
		AI_Output (self, other, "DIA_Cooper_Pay_12_02"); //Troch� p�no, ale niech b�dzie.
	}
	else
	{
		AI_Output (self, other, "DIA_Cooper_Pay_12_03"); //Ale� prosz� bardzo!
	};
   
	AI_Output (self, other, "DIA_Cooper_Pay_12_04"); //Pytanie tylko czy masz tyle rudy?
	
   if (NPC_HasItems(other,ItMiNugget)>=1000)
	{
		coop_pay = true;
      
		AI_Output (other, self, "DIA_Cooper_Pay_15_05"); //Bierz bry�ki!
		B_GiveInvItems (other, self, ItMiNugget, 1000);
		AI_Output (self, other, "DIA_Cooper_Pay_12_06"); //Ca�a przyjemno�� po mojej stronie. Dobrze, �e po �wiecie chodzi tylu frajer�w...
		AI_Output (self, other, "DIA_Cooper_Pay_12_07"); //Czuj si� tu jak u siebie w domu.
		Log_SetTopicStatus	(CH3_Grd_Payment, LOG_SUCCESS);
		B_LogEntry		(CH3_Grd_Payment, "Zap�aci�em Cooperowi i chyba wyszed�em na frajera. Ale przynamniej mam z nim teraz spok�j.");
	}
	else
	{
      coop_pay = 2;
      
		AI_Output (self, other, "DIA_Cooper_Pay_12_08"); //Nie masz tyle rudy! Chcia�e� mnie obrazi�?
		AI_Output (self, other, "DIA_Cooper_Pay_12_09"); //Wiesz co? Zapomnij o wej�ci�wce. Za�atwimy to inaczej...
		Log_SetTopicStatus	(CH3_Grd_Payment, LOG_FAILED);
		B_LogEntry		(CH3_Grd_Payment, "Nie zap�aci�em Cooperowi, zapomnia�em, �e nie mam tyle rudy!");
		B_StopProcessInfos	(self); 
      B_StartAfterDialogFight(self,other,true);
	};
};

// **************************************************

INSTANCE DIA_Cooper_Payment (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 4;
	condition		= DIA_Cooper_Payment_Condition;
	information		= DIA_Cooper_Payment_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Cooper_Payment_Condition()
{
	if  (Npc_KnowsInfo (hero, DIA_Cooper_Hello))&&(Npc_GetDistToNpc(self,hero) < 400)&&(cooper_pay <= (Wld_GetDay()))&&(coop_pay == false)
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_Payment_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (self, other, "DIA_Cooper_Payment_12_01"); //Hej, marynarzyku!
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Cooper_Payment_12_02"); //Zdaje si�, �e o czym� zapomnia�e�...
	AI_Output (other, self, "DIA_Cooper_Payment_15_03"); //A tak, wej�ci�wka. Daj mi jeszcze kilka dni.
	AI_Output (self, other, "DIA_Cooper_Payment_12_04"); //Nie jestem idiot�! Skoro brak Ci �mia�o�ci, to zabior� wszystko, co masz.
	B_GiveInvItems (other, self,ItMiNugget,NPC_HasItems(other,ItMiNugget));
	AI_Output (other, self, "DIA_Cooper_Payment_15_05"); //Ty cholerny z�odzieju!
	AI_Output (self, other, "DIA_Cooper_Payment_12_06"); //I jeszcze mnie obra�asz... Sam si� o to prosi�e�!

	Log_SetTopicStatus	(CH3_Grd_Payment, LOG_FAILED);
	B_LogEntry		(CH3_Grd_Payment, "Ten sukinsyn Cooper zabra� mi ca�� rud�!");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Cooper_Thief (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 5;
	condition		= DIA_Cooper_Thief_Condition;
	information		= DIA_Cooper_Thief_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Cooper_Thief_Condition()
{

/********************************
ITKECOOPERKEY ma przy sobie Cooper, tylko tym kluczem mo�na otworzy� skrzyni� w chacie diego
dialog ma si� odpala� jak wsadzimy Royal_Ring do skrzyni cooper w chacie Diego

********************************/
	if  (Npc_KnowsInfo (hero, DIA_Harf_ProposalOk))&&(Npc_GetDistToNpc(self,hero) < 2000)&&(NPC_HasItems(other,ITKECOOPERKEY)>=1)&&Mob_HasItems ("OC_CHEST_COOPER", Royal_Ring)
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_Thief_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Cooper_Thief_12_01"); //Co Ty tu robisz, z�odzieju?!
	AI_Output (other, self, "DIA_Cooper_Thief_15_02"); //Ja tylko...
	AI_Output (self, other, "DIA_Cooper_Thief_12_03"); //�apska precz od tej skrzyni, �achmyto!
	AI_Output (other, self, "DIA_Cooper_Thief_15_04"); //Nic nie zrobi�em...
	AI_Output (self, other, "DIA_Cooper_Thief_12_05"); //Wyno� si� st�d!
	B_LogEntry		(CH3_Grd_Thief, "Wsadzi�em sygnet do skrzyni Coopera. Czas porozmawia� z Harfordem i odebra� nagrod�.");
	/*****************************
Trzebaby doda� wp poza chat� Diego/Coopera �eby gracza mo�naby�o wywali�, albo skorzysta� z istniej�cego wp
****************************/
	B_StopProcessInfos	(self); 
	AI_GotoWP (other, "OCR_CAMPFIRE_A_MOVEMENT1");
};

// **************************************************

INSTANCE DIA_Cooper_End (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 5;
	condition		= DIA_Cooper_End_Condition;
	information		= DIA_Cooper_End_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak Ci leci?"; 
};

FUNC INT DIA_Cooper_End_Condition()
{
	if  (Npc_KnowsInfo (hero, DIA_Harf_ProposalEnd))&&(Npc_KnowsInfo (hero, DIA_Cooper_Thief))
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_End_Info()
{
	AI_Output (other, self, "DIA_Cooper_End_15_01"); //Jak Ci leci?
	AI_Output (self, other, "DIA_Cooper_End_12_02"); //Jak krew z nosa! I chyba wiem, przez kogo tu trafi�em!
	AI_Output (self, other, "DIA_Cooper_End_12_03"); //To Ty skurwielu ukrad�e� mi klucz i wsadzi�e� sygnet Gomeza do mojej skrzyni!
	AI_Output (self, other, "DIA_Cooper_End_12_04"); //Niech Ci� szlag trafi!
	
   B_StopProcessInfos(self);
}; 
