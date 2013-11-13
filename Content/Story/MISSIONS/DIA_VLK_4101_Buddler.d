INSTANCE DIA_Budd_First (C_INFO)
{
	npc				= VLK_4101_Buddler;
	nr				= 1;
	condition		= DIA_Budd_First_Condition;
	information		= DIA_Budd_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Budd_First_Condition()
{
	var C_NPC con1; con1 = Hlp_GetNpc(Grd_4102_Convoy);
	var C_NPC con2; con2 = Hlp_GetNpc(Grd_4103_Convoy);
	var C_NPC con3; con3 = Hlp_GetNpc(Grd_4104_Convoy);
	var C_NPC con4; con4 = Hlp_GetNpc(Grd_4105_Convoy);

	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Cord_ConvoysPeople))
	&& ((Npc_IsDead(con1))&&(Npc_IsDead(con2))&&(Npc_IsDead(con3))&&(Npc_IsDead(con4)))
	{
		return 1;
	};
};

FUNC VOID DIA_Budd_First_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};

	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Budd_First_11_01"); //Zat�uk�e� tych skurwieli! My�la�em, �e ju� po mnie...
	AI_Output (other, self, "DIA_Budd_First_15_02"); //Spokojnie ju� po wszystkim. Ostro si� z wami zabawili.
	AI_Output (self, other, "DIA_Budd_First_11_03"); //Cz�sto tak robi�. Niekt�re transporty w og�le nie docieraj� do Nowego Obozu.
	AI_Output (self, other, "DIA_Budd_First_11_04"); //Oczywi�cie magnaci przymykaj� na to oko.
	AI_Output (self, other, "DIA_Budd_First_11_05"); //Kopacz to co� gorszego ni� g�wno na czubku buta...
	AI_Output (other, self, "DIA_Budd_First_15_06"); //Doprowadz� Ci� do Nowego obozu, masz na to moje s�owo!
	AI_Output (self, other, "DIA_Budd_First_11_07"); //Naprawd�?! Zrobisz to? Nie mam czym zap�aci�...
	AI_Output (other, self, "DIA_Budd_First_15_08"); //Zrobi� to za darmo, tylko nikomu o tym ani s�owa! Nie chc� popsu� sobie reputacji...
	AI_Output (self, other, "DIA_Budd_First_11_09"); //B�d� milcza� jak gr�b. Pomodl� si� za Ciebie...
	AI_Output (other, self, "DIA_Budd_First_15_10"); //Wola�bym, aby bogowie si� do tego nie mieszali... Ale dzi�ki, za dobre ch�ci.
	B_LogEntry		(CH5_NC_Convoys, "Uratowa�em jednego z kopaczy. Nie zazdroszcz� im losu... Niech mnie szlag trafi, je�eli nie zdo�am bezpiecznie doprowadzi� tego nieszcz�nika do Nowego Obozu!");	

	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Budd_Safe (C_INFO)
{
	npc				= VLK_4101_Buddler;
	nr				= 2;
	condition		= DIA_Budd_Safe_Condition;
	information		= DIA_Budd_Safe_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Budd_Safe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Budd_First ))&&(Npc_GetDistToWP (self,"NC_PATH86_MOVEMENT") < 500 )
	{
		return 1;
	};
};

FUNC VOID DIA_Budd_Safe_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Budd_Safe_11_01"); //Nie wierz� w�asnym oczom... Jestem bezpieczny...
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_Budd_Safe_11_02"); //Masz moj� dozgonn� wdzi�czno��, dobry cz�owieku.
	AI_Output (other, self, "DIA_Budd_Safe_15_03"); //Dobrze ju� dobrze, nie rozklejaj si�. Powodzenia, przyjacielu.
	AI_Output (other, self, "DIA_Budd_Safe_15_04"); //I nie daj si� ju� wi�cej kopa� przez �ycie w dup�!
	AI_Output (self, other, "DIA_Budd_Safe_11_05"); //Zapami�tam to.
	B_LogEntry		(CH5_NC_Convoys, "Doprowadzi�em kopacza do Nowego Obozu. Dobrze jest czasami zrobi� co�... za darmo.");
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"StayCamp");
	B_StopProcessInfos	(self); 
};
