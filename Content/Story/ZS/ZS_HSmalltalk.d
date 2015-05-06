//////////////////////////////////////////////////////////////////////////
//	ZS_Smalltalk
//	============
//
//	Der NSC bleibt auf seinem Freepoint stehen und sagt gelegentlich
//	einen zuf�llig ausgew�hlten, v�llig belanglosen Satz zu seinem
//	Gespr�chspartner.
//
//  Wenn kein Gespr�chpartner gefunden wird, geht der NSC in ZS_Stand !!!
//////////////////////////////////////////////////////////////////////////
func void ZS_HSmalltalk () 
{
    ////PrintDebugNpc			(PD_TA_FRAME,	"ZS_HSmalltalk");
    
	B_SetPerception 		(self);	
	AI_SetWalkmode			(self,	NPC_WALK);
	
    //-------- Grobpositionierung --------
	if (!Npc_IsOnFP(self,"SMALLTALK"))
	{
		////PrintDebugNpc		(PD_TA_CHECK,	"...nicht auf FP!");
		AI_GotoWP			(self,	self.wp);						// Gehe zum Tagesablaufstart
	};
    //----------------------------
    AI_AlignToFP( self );				//Richte Dich aus
};

func void ZS_HSmalltalk_Loop()
{
    ////PrintDebugNpc			(PD_TA_LOOP,	"ZS_HSmalltalk_Loop");
	
	Npc_PerceiveAll			(self);
	Wld_DetectNpc(self,	-1, ZS_HSmalltalk, -1);
	//PRINTGlobals(PD_TA_CHECK);
	
	if (Wld_DetectNpc(self,	-1, ZS_HSmalltalk, -1) && (Npc_GetDistToNpc	(self, other)<HAI_DIST_SMALLTALK))
	{
	    AI_TurnToNpc(self,other);

// Neue Texte f�r Smalltalk (kurze, gemurmelte, Wortfetzen, die als SVMs vorliegen)

// ...wenn Du meinst...
// ...kann schon sein...
// ...war nicht besonders schlau....
// ...ich halt mich da lieber raus...
// ...das ist ein Problem, aber nicht mein Problem...
// ...war doch klar, da� das �rger gibt...
// ...aber behalt's f�r Dich, mu� nicht gleich jeder wissen...
// ...das passiert mir nicht...
// ...an der Gechichte mu� wohl doch was dran sein...
// ...man mu� eben aufpassen was man rumerz�hlt...
// ...solange ich damit nichts zu tun habe... 
// ...man darf auch nicht alles glauben, was man h�rt...
// ...in seiner Haut will ich trotzdem nicht stecken...
// ...immer wieder die selbe Leier...
// ...manche lernen eben garnichts dazu... 
// ...fr�her w�re das ganz anders gelaufen...
// ...gequatscht wird viel...
// ...ich h�r nicht mehr auf das Gefasel...
// ...verla� Dich auf jemanden und Du bist verlassen, das ist eben so...
// ...ich glaube kaum, da� sich daran was �ndern wird...
// ...wahrscheinlich hast Du recht...
// ...erstmal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird...
// ...ich dachte, das w�re schon lange gekl�rt, aber das ist wohl nicht so...
// ...la� uns �ber lieber �ber was anderes reden...

// Alte Version mit AI-Outputs
/*	    var int talktime;
    	talktime = Hlp_Random (200);
    	if 		(talktime <   5)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text01");//I jak upolowa�e� co� ostatnio ??? hehe
    	} 
    	else if (talktime <  10)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text02");//Ach tylko pare �cierwojad�w wilk�w ale....
    	}
    	else if (talktime <  15)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text03");//Nie moge narzeka�.  
  	}
    	else if (talktime < 20)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text04");//By�a niez�a akcja z cie�iostworem.
    	}
    	else if (talktime < 25)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text05");//Naprawde opowiadaj.
    	}
    	else if (talktime < 30)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text06");//No wiesz mog�o by� lepiej oberwa� troche....
    	}
    	else if (talktime < 35)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text07");//Ja ci musze przyzna� �e z naszego obozu robi si� prawdziwy DU�Y ob�z.
    	}
    	else if (talktime < 40)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text08");//S�ysza�e� mamy nowego w szeregach tylko jak on ma� na imie...
    	}
    	else if (talktime < 45)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text09");//M�wie ci szkoda gada�.
    	}
    	else if (talktime < 50)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text10");//S�ysza�e�? Nasi zabili pi�tk� sta�nik�w, jednak niekt�rzy maj� talent! A co u ciebie?
    	}
    	else if (talktime < 55)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text11");//Nic ciekawego,chocia� ostatno zabi�em watahe wilk�w samemu!
    	}
    	else if (talktime < 60)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text12");//No No kto by pomy�la�.
    	}
    	else if (talktime < 65)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text13");//Ostatno jaki� kole� strasznie ubolewa� nad wyposa�eniem ale musze ci przyzna� ze m�j miecz...
    	}
    	else if (talktime < 70)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text14");//Tak trzeba poimformowa� Cavalorna albo Grega.
    	}
    	else if (talktime < 75)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text15");//Jak leci ,ja chce i�� wkopa� paru stra�nikom co ty na to?
    	}
    	else if (talktime < 80)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text16");//Zale�y ile wiest granica mi�dzy odwag� a..............g�upot�.
    	}
    	else if (talktime < 85)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text17");//S�ysza�e� pojmali konw�j stra�nik�w o�miu zabili pi�ciu si� przy��czy�o.
    	}
    	else if (talktime < 90)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text18");//Podobno do obozu przy��cz� sie magowie je�li tak to do��cze na nauki.
    	}
    	else if (talktime < 95)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text19");//Obi�o mi si� o uszy �e bedzie walczy� to b�dzie Ratford ale nie pami�tam imienia tego drugiego.
    	}
    	else if (talktime < 100)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text20");//...I ty Si� nie ba�e�...
    	};
*/

    	AI_Wait					(self,	3);
    	Npc_SetStateTime(self, 0);
    }	
	else if (Npc_GetStateTime(self) >= 199)
	{
	    ////PrintDebugNpc		(PD_TA_CHECK,	"... kein Gespr�chspartner gefunden!");
	        		AI_Output (self,NULL,"ZS_HSmalTalk_Text21");//Cholera czemu ci� nie ma.
	    AI_StartState	(self, ZS_SitAround, 1, "");
	};
	
	AI_Wait					(self,	1);
};

func void ZS_HSmalltalk_End ()
{
	    		AI_Output (self,NULL,"ZS_SmalTalk_Text22");//Do Zobaczenia.
    ////PrintDebugNpc			(PD_TA_FRAME,	"ZS_HSmalltalk_End");
};
