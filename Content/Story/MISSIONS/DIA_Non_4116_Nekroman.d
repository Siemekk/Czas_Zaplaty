
// Ork: Ten tutaj, to nekro w orctemple.zen
// **************************************************
// 						 EXIT 
// **************************************************
INSTANCE DIA_Necromanus_Exit (C_INFO)
{
	npc			= Non_4116_Nekroman;
	nr			= 999;
	condition	= DIA_Necromanus_Exit_Condition;
	information	= DIA_Necromanus_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Necromanus_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Necromanus_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_NecromanusD_Exit (C_INFO)
{
	npc			= Non_4116_NekromanD;
	nr			= 999;
	condition	= DIA_Necromanus_Exit_Condition;
	information	= DIA_Necromanus_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

INSTANCE DIA_Necromanus_First (C_INFO)
{
	npc				= Non_4116_Nekroman;
	nr				= 1;
	condition		= DIA_Necromanus_First_Condition;
	information		= DIA_Necromanus_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necromanus_First_Condition()
{
	var C_NPC cor; cor = Hlp_GetNpc(KDF_4115_Corristo);
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_IsDead(cor))&&((necro_appear == 1)||(necro_appear == 3))
	{
		return 1;
	};
};

FUNC VOID DIA_Necromanus_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Necromanus_First_11_01"); //Wystarczy ju� wyg�up�w, czas na prawdziw� walk�!
	AI_Output (other, self, "DIA_Necromanus_First_15_02"); //Dlaczego mnie uratowa�e�?
	AI_Output (self, other, "DIA_Necromanus_First_11_03"); //Mia�em swoje powody. A teraz odejdziesz ze mn�...

	B_LogEntry		(CH6_RBL_PayDay, "Z deszczu pod rynn�. Jeden nekromanta uratowa� mnie z r�k drugiego... Zaczyna mnie niepokoi� to zainteresowanie moj� osob�.");
	B_StopProcessInfos	(self);
	
	//Ork: No chyba pora wy��czy� muzyke dla bitwy w SO
	BOSSFIGHT_CURRENT = BOSSFIGHT_NONE;

	/***********************
Teleport do �wi�tyni �piocha, zr�b to bo ja nie wiem co dzia�a a co nie ;P
Aha niech Dick stoi pomi�dzy Xardem a Nekro tak b�dzie najlepiej dla dialogu.

***********************/
};


// **************************************************

INSTANCE DIA_Necromanus_First1 (C_INFO)
{
	npc				= Non_4116_Nekroman;
	nr				= 1;
	condition		= DIA_Necromanus_First1_Condition;
	information		= DIA_Necromanus_First1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necromanus_First1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Necromanus_First))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Necromanus_First1_Info()
{
   B_StopProcessInfos(self);
   B_StopProcessInfos(hero);
	AI_Teleport  (hero, "DUNG_EXIT");
};

// **************************************************

INSTANCE DIA_Necromanus_Again (C_INFO)
{
	npc				= Non_4116_NekromanD;
	nr				= 2;
	condition		= DIA_Necromanus_Again_Condition;
	information		= DIA_Necromanus_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necromanus_Again_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero,DIA_Necromanus_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Necromanus_Again_Info()
{
	var C_NPC xar; xar = Hlp_GetNpc(KDF_406_OTXardas);

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	//AI_GotoNpc(other,self);//najlepiej �eby dick sta� pomi�dzy xardasem a nekro
	AI_Output (self, other, "DIA_Necromanus_Again_11_01"); //To tutaj wszystko si� zacz�o...
	AI_PlayAni (other, "T_SEARCH");
	AI_TurnToNpc (other, self);
	AI_Output (other, self, "DIA_Necromanus_Again_15_02"); //Co to za miejsce? �mierdzi st�chlizn� i... �mierci�.
	AI_Output (self, other, "DIA_Necromanus_Again_11_03"); //Tutaj narodzi�o si� moje �ycie. Ka�dy kamie� tej �wi�tyni, ka�da ko�� walaj�ca si� po klepisku, ka�da um�czona dusza... S�odki dom!
	AI_Output (self, other, "DIA_Necromanus_Again_11_04"); //To jedna z ukrytych �wi�ty� Beliara. Orkowie wybudowali j�, aby s�u�y� wys�annikowi naszego Pana - �ni�cemu.
	AI_Output (self, other, "DIA_Necromanus_Again_11_05"); //W nagrod� stali si� jego doczesnymi s�ugami.
	AI_Output (other, self, "DIA_Necromanus_Again_15_06"); //Wola�bym nie podzieli� ich losu.
	AI_Output (self, other, "DIA_Necromanus_Again_11_07"); //To Ci nie grozi. Wybra� Ci� Nasz Pan, aby� by� przed�u�eniem Jego woli. Czy� got�w?
	AI_Output (other, self, "DIA_Necromanus_Again_15_08"); //Z kim mamy walczy�?
	AI_Output (self, other, "DIA_Necromanus_Again_11_09"); //Ze zdrajc� i renegatem, kt�ry sprzeciwi� si� woli Beliara!
	AI_TurnToNpc(other, xar);
	AI_Output (other, self, "DIA_Necromanus_Again_15_10"); //M�wisz o Xardasie?
	AI_Output (self, other, "DIA_Necromanus_Again_11_11"); //Tak! Ten parszywy kuglarz chce wch�on�� moc �ni�cego!
	B_LogEntry		(CH6_RBL_PayDay, "Nie ma to jak dw�ch, k��c�cych si� nekromant�w...");
	B_StopProcessInfos	(self);
   
   necro_dead = 0;
};

// **************************************************

INSTANCE DIA_Necromanus_Final (C_INFO)
{
	npc				= Non_4116_NekromanD;
	nr				= 3;
	condition		= DIA_Necromanus_Final_Condition;
	information		= DIA_Necromanus_Final_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necromanus_Final_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, Info_XardasOT_Final))
	{
		return 1;
	};
};

FUNC VOID DIA_Necromanus_Final_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Necromanus_Final_11_01"); //Czas Wybra�cze aby� zatopi� miecz w sercu zdrajcy!
	AI_Output (other, self, "DIA_Necromanus_Final_15_02"); //Masz racj�, tak te� uczyni�.
	AI_DrawWeapon (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Necromanus_Final_11_03"); //Co Ty robisz?!
	AI_Output (other, self, "DIA_Necromanus_Final_15_04"); //�ni�cy musi wr�ci� do cuchn�cej nory, z kt�rej wype�zn��. Tak samo jak ka�dy kto pragnie jego powrotu.
	AI_Output (self, other, "DIA_Necromanus_Final_11_05"); //Jak �miesz podwa�a� wol� Beliara?! Nasz Pan...
	AI_Output (other, self, "DIA_Necromanus_Final_15_06"); //Tw�j, Pan! Nigdy nie b�d� s�u�y� �adnemu bogu!
	AI_Output (other, self, "DIA_Necromanus_Final_15_07"); //Kiedy Bezimienny ode�le �ni�cego w choler�, barier� szlag trafi, a na niczym innym mi nie zale�y.
	AI_Output (self, other, "DIA_Necromanus_Final_11_08"); //Gorzko tego po�a�ujesz...
	AI_Output (self, other, "DIA_Necromanus_Final_11_09"); //ARGH!

	Log_SetTopicStatus	(CH6_RBL_PayDay, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_PayDay, "Podj��em decyzj�. Nie b�d� s�u�y� �adnemu bogu! Niech szlag trafi wszystkich nekromant�w i t� cholern� barier�!");

	/*************************
Da�em standarowo atak.
Mo�e by jednak DIck m�g� zabi� nekrosa a ten dopiero po �mierci by si� odrodzi� jako demon? Tak by�oby chyba ciekawiej i trudniej.

***************************/

	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);
};
