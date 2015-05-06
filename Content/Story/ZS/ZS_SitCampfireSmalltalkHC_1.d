func void ZS_SitCampfireSmalltalkHC_1()
{
	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	
	if (!C_BodyStateContains(self, BS_SIT))
	{
		AI_StandUp		(self);				
		AI_SetWalkmode 	(self,NPC_WALK);
		AI_GotoWP		(self, self.wp);
		
		if (Wld_IsFPAvailable(self,"FP_CAMPFIREST"))
		{																	
			AI_GotoFP (self, "FP_CAMPFIREST");
		}
		else
		{
			AI_StartState(self, ZS_Stand, 0, "");
		};
		
		Npc_SetAivar(self,AIV_HANGAROUNDSTATUS,  1);
		AI_PlayAniBS (self,"T_STAND_2_SIT",BS_SIT);
	};
	AI_AlignToFP( self );				//Richte Dich aus
};

func void ZS_SitCampfireSmalltalkHC_1_loop()
{

	Npc_PerceiveAll			(self);
	Wld_DetectNpc(self,	-1, ZS_SitCampfireSmalltalkHC_1, -1);
	//PRINTGlobals(PD_TA_CHECK);
	
	if (Wld_DetectNpc(self,-1,ZS_SitCampfireSmalltalkHC_1, -1)&& Npc_GetDistToNpc(self, other)<600)
	{





	    var int talktime;
    	talktime = Hlp_Random (200);
    	if 		(talktime <   5)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_1_Text01");//To miejsce jest piekne.
    	} 
    	else if (talktime <  10)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text02");//Naprawde jest tutaj spokojnie.
    	}
    	else if (talktime <  15)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text03");//I jak ci idzie polowanie.
    	}
    	else if (talktime < 20)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text04");//W�asnie dosta�em �uk i strza�y ca�kowicie za darmo.
    	}
    	else if (talktime < 25)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text05");//Upolowa�em dwa �cierwojady zapraszam cie na pieczone mi�so!
    	}
    	else if (talktime < 30)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text06");//�wietnie tego mi teraz w�a�nie trzeba trzeba.
    	}
    	else if (talktime < 35)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text07");//Nie cierpie tych stra�nik�w,wczoraj jednen mi si� napatoczy� jeszcze do tego mnie zdenerwowa�,ju� wyjmowa�em bro� a tu quentin go zdejmuje,jednak qentin dobry facet pozwoli� mi obszuka� tego stra�nika.
    	}
    	else if (talktime < 40)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text08");//A w�a�nie Quentin powiedzia� mi co� o goblinach podobno istniej� gobli�scy wojownicy,on mo�e daje z nimi rade ale ja...
    	}
    	else if (talktime < 45)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text09");//Mam pi�kny r�g Cieniostwora chcesz kupi�?ten Cieniostw�r to niez�y okaz chyba jaki� inny gatunek...
    	}
    	else if (talktime < 50)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text10");//To interesuj�ce.Hej a mo�e ty wiesz co si� ostatnio dzia�o w obozie.
    	}
    	else if (talktime < 55)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text11");//W obozie zero rozrywki powinna by� jaka� arena albo...
    	}
    	else if (talktime < 60)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text12");//Co� w tym stylu,tak mnie te� to dr�czy.
    	}
    	else if (talktime < 65)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text13");//Jutro polowanie na cieniostwora chyba idziesz? Bo ja tak.
    	}
    	else if (talktime < 70)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text14");//Pewnie i tak nie mam nic do roboty.
    	}
    	else if (talktime < 75)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text15");//A ty co my�lisz o obozach? Kt�ry wed�ug ciebie jest najlepszy?
    	}
    	else if (talktime < 80)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text16");//Stary ob�z to gro�ny przeciwnik, ale nigdy nie wst�pi� bym do niego.
    	}
    	else if (talktime < 85)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text17");//Ty jeste� w lepszej sytuacji.
    	}
    	else if (talktime < 90)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text18");//Nasz ob�z nie ma rudy mo�e gdyby�my sprzedawali trofea kr�lowi...
    	}
    	else if (talktime < 95)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text19");//To si� na pewno nie uda.
    	}
    	else if (talktime < 100)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalkSitHC_Text20");//Ja mam inne zdanie na ten temat.
    	};


    	AI_Wait					(self,	3);
    	Npc_SetStateTime(self, 0);
    }	
	else if (Npc_GetStateTime(self) >= 25)
	{
	    ////PrintDebugNpc		(PD_TA_CHECK,	"... kein Gespr�chspartner gefunden!");
	    
	    AI_StartState	(self, ZS_SitCampfireSmalltalk, 1, "");
	};
	
	AI_Wait					(self,	1);
};


func void ZS_SitCampfireSmalltalkHC_1_end()
{
	AI_PlayAni(self,"T_SIT_2_STAND");	
};