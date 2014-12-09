
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kron_Exit (C_INFO)
{
	npc			= Non_4025_Kron;
	nr			= 999;
	condition	= DIA_Kron_Exit_Condition;
	information	= DIA_Kron_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kron_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kron_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Kron_Hello (C_INFO)
{
	npc				= Non_4025_Kron;
	nr				= 1;
	condition		= DIA_Kron_Hello_Condition;
	information		= DIA_Kron_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Kron_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Kron_Hello_Info()
{
	AI_Output (other, self, "DIA_Kron_Hello_15_01"); //Niech mnie szlag trafi. Ch�do�ony ork!
	AI_Output (self, other, "DIA_Kron_Hello_11_02"); //Gdyby moja by� z�y ork, Morra by ju� nie �y�.
	AI_Output (self, other, "DIA_Kron_Hello_11_03"); //Morra uwa�a� co m�wi�, Moja wi�cej nie ostrzega�.
	AI_Output (other, self, "DIA_Kron_Hello_15_04"); //I do tego gada...
	AI_Output (self, other, "DIA_Kron_Hello_11_05"); //Morra odej��, Morra cieszy� si� �ycie, p�ki m�c.
	
   Log_CreateTopic	(CH2_TRL_Ork, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Ork, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Ork, "Jednym z �owc�w trolli jest... ork. Ten �wiat ju� ca�kiem stan�� na g�owie!");
	
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Kron_What (C_INFO)
{
	npc				= Non_4025_Kron;
	nr				= 2;
	condition		= DIA_Kron_What_Condition;
	information		= DIA_Kron_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co tu robisz?"; 
};

FUNC INT DIA_Kron_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Kron_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Kron_What_Info()
{
	AI_Output (other, self, "DIA_Kron_What_15_01"); //Co tu robisz?
	AI_Output (self, other, "DIA_Kron_What_11_02"); //Moja by� renegat. Ma�a Morra uratowa� Moja z �ap troll.
	AI_Output (self, other, "DIA_Kron_What_11_03"); //Moja by� wdzi�czna, moja przysi�ga�, �e walczy� dla Ma�a Morra.
	AI_Output (other, self, "DIA_Kron_What_15_04"); //Co to za Ma�a Morra?
	AI_Output (self, other, "DIA_Kron_What_11_05"); //Ma�a Morra by� przewodnik stada, sika� na siedz�co, ale rozkazywa�.
	AI_Output (other, self, "DIA_Kron_What_15_06"); //M�wisz o Kirze?!
	AI_Output (self, other, "DIA_Kron_What_11_07"); //Tak, Ma�a Morra, zwa� si� Kira. Moja przysi�ga�, moja zosta� z Ma�a Morra.
	
   B_LogEntry		(CH2_TRL_Ork, "Ork twierdzi, �e zawdzi�cza �ycie Kirze. Nie ufam skurczybykowi, najch�tniej poszatkowa�bym go na tysi�c kawa�k�w.");	
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Kron_Fight (C_INFO)
{
	npc				= Non_4025_Kron;
	nr				= 3;
	condition		= DIA_Kron_Fight_Condition;
	information		= DIA_Kron_Fight_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobry ork, to martwy ork!"; 
};

FUNC INT DIA_Kron_Fight_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Kron_Hello))&&(TH_trust >= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Kron_Fight_Info()
{
	AI_Output (other, self, "DIA_Kron_Fight_15_01"); //Dobry ork to martwy ork!
	AI_Output (self, other, "DIA_Kron_Fight_11_02"); //Morra chcie� rozgniewa� Moja? Moja nie walczy� z Morra, Ma�a Morra zakaza� zabija� inna Morra.
	AI_Output (other, self, "DIA_Kron_Fight_15_03"); //S�uchasz tego co m�wi ci kto� kto sika na siedz�co?
	AI_Output (self, other, "DIA_Kron_Fight_11_04"); //Moja sp�aca� d�ug �ycia, Moja pos�ucha� Ma�a Morra. Moja nie zabija� inna Morra, nawet jak mie� ochota.
	AI_Output (self, other, "DIA_Kron_Fight_11_05"); //Morra odej��, zostawi� Moja w spok�j.
	
   B_LogEntry		(CH2_TRL_Ork, "Spr�bowa�em sprowokowa� orka, ale albo naprawd� boi si� Kiry, albo uwa�a mnie za natr�ta nie gro�niejszego od muchy. Czas skopa� zielone dupsko!");	
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Kron_Fight1 (C_INFO)
{
	npc				= Non_4025_Kron;
	nr				= 4;
	condition		= DIA_Kron_Fight1_Condition;
	information		= DIA_Kron_Fight1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zdychaj cholerny orku!"; 
};

FUNC INT DIA_Kron_Fight1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Kron_Fight))
	{
		return 1;
	};
};

FUNC VOID DIA_Kron_Fight1_Info()
{
	Npc_SetTempAttitude(self, ATT_FRIENDLY);
	
	AI_Output (other, self, "DIA_Kron_Fight1_15_01"); //Zdychaj cholerny orku!
	AI_Output (self, other, "DIA_Kron_Fight1_11_02"); //Moja nie walczy�, Morra odej��.
	AI_DrawWeapon (other);
	AI_Output (other, self, "DIA_Kron_Fight1_15_03"); //Nigdzie nie id�, pora przela� zielon� krew.
	AI_Output (self, other, "DIA_Kron_Fight1_11_04"); //Moja obieca� nie walczy�, ale Moja musie� si� broni�.
	AI_DrawWeapon (self);
	AI_Output (self, other, "DIA_Kron_Fight1_11_05"); //Morra po�a�owa� g�upia s�owa!
	
   B_LogEntry		(CH2_TRL_Ork, "Wyci�gn��em miecz i postawi�em spraw� jasno - on albo ja!");
	
   B_StopProcessInfos	(self); 
	B_SetTimedATT(self,30*events_per_sec,(-70),(-70),(-100));	
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Kron_AfterFight (C_INFO)
{
	npc				= Non_4025_Kron;
	nr				= 5;
	condition		= DIA_Kron_AfterFight_Condition;
	information		= DIA_Kron_AfterFight_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Kron_AfterFight_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Kron_Fight1))
	{
		return 1;
	};
};

FUNC VOID DIA_Kron_AfterFight_Info()
{
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Kron_AfterFight_11_01"); //Moja nie chcie� walczy�, ale Morra zaatakowa� Moja. 
		AI_Output (self, other, "DIA_Kron_AfterFight_11_02"); //Morra przegra�, Morra odej�� i nie wraca�.
		AI_Output (self, other, "DIA_Kron_AfterFight_11_03"); //Moja powiedzie� Ma�a Morra, dziwna Morra by� z�a.
		
      Log_SetTopicStatus	(CH2_TRL_Ork, LOG_FAILED);
		B_LogEntry		(CH2_TRL_Ork, "Ten cholerny ork mnie spra�! Z tego co zrozumia�em to chyba �adnie obsmaruje mnie przed Kir�.");
		B_LogEntry		(CH2_TRL_Quest, "Narazi�em si� temu cholernemu orkowi!");	
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		TH_trust = TH_trust + 1;
		B_GiveXP(400);
      
		AI_Output (self, other, "DIA_Kron_AfterFight_11_04"); //Morra pokona� Moja... Morra by� wielka wojownik.
		AI_Output (self, other, "DIA_Kron_AfterFight_11_05"); //Moja nie chcie� walczy�, Morra wygra�, Morra dosta� szacunek Moja.
		AI_Output (self, other, "DIA_Kron_AfterFight_11_06"); //Moja powiedzie� Ma�a Morra, dziwna Morra by� dobra wojownik.
		AI_Output (self, other, "DIA_Kron_AfterFight_11_07"); //Morra odej��, Moja musie� odzyska� si�a po walka...
		
      Log_SetTopicStatus	(CH2_TRL_Ork, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Ork, "Pokona�em t� zielon� kup� �ajna. Chocia� z drugiej strony ork okaza� szacunek zwyci�zcy, co ludziom rzadko si� zdarza. Chyba �le go oceni�em. Mo�e m�g�bym... polubi� tego dziwnego orka.");
		B_LogEntry		(CH2_TRL_Quest, "Wygra�em walk� z orkiem i chyba zdoby�em jego szacunek.");	
	};
   
	B_StopProcessInfos	(self); 
};
