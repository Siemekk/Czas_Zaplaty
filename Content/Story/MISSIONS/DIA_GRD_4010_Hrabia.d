// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Hrabia_Exit (C_INFO)
{
	npc			= GRD_4010_Hrabia;
	nr			= 999;
	condition	= DIA_Hrabia_Exit_Condition;
	information	= DIA_Hrabia_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hrabia_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Hrabia_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_Kasacz_Exit (C_INFO) //dla K�sacza
{
	npc			= Grd_2513_Kasacz;
	nr			= 999;
	condition	= DIA_Kasacz_Exit_Condition;
	information	= DIA_Kasacz_Exit_Info;
	important	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kasacz_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kasacz_Exit_Info()
{
	B_StopProcessInfos(self);
   
   self.guild = GIL_DMB;
      
   Npc_ExchangeRoutine(self, "ATTACK");
   Npc_SetPermAttitude(self, ATT_HOSTILE);
};

INSTANCE DIA_Hrabia_Ore (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 20;
	condition		= DIA_Hrabia_Ore_Condition;
	information		= DIA_Hrabia_Ore_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_Ore_Condition()
{
	if ((Npc_KnowsInfo (hero, DIA_Pacho_OreEnd))||(Npc_KnowsInfo (hero, DIA_Scorpio_AfterDig)))&&(NPC_HasItems(hero,gomez_mirror)>=1)&&(Npc_GetDistToWP (self,"OW_PATH_MIS_PACHO_TREASURE") < 500 )
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_Ore_Info()
{
	var C_NPC pacho; pacho = Hlp_GetNpc(GRD_224_PACHO);
	AI_Output (self, other, "DIA_Hrabia_Ore_11_01"); //Chyba nie przeszkadzam.
	AI_TurnToNpc(other, self);
	AI_TurnToNpc(pacho, self);

	AI_Output (other, self, "DIA_Hrabia_Ore_15_02"); //Kim Ty do cholery jeste�?
	AI_Output (self, other, "DIA_Hrabia_Ore_11_03"); //Powiedzmy, �e nikim wa�nym.
	AI_Output (self, other, "DIA_Hrabia_Ore_11_04"); //Zdaje si�, �e macie co�, co do was nie nale�y.
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(self, pacho);
	AI_Output (self, other, "DIA_Hrabia_Ore_11_05"); //Troch� zaj�o mi odnalezienie w�a�ciwego tropu, ale w Kolonii nawet drzewa maj� oczy i uszy.
	AI_GotoNpc(self,other);
	AI_Output (self, other, "DIA_Hrabia_Ore_11_06"); //A teraz grzecznie oddacie rud�. Tylko bez gwa�townych ruch�w, nie chc� zapapra� sobie krwi� pancerza.
	
   B_GiveInvItems (other, self, ItMiNugget, NPC_HasItems(other,ItMiNugget));
	Npc_RemoveInvItems(self, ItMiNugget, NPC_HasItems(self,ItMiNugget));
   
	AI_Output (self, other, "DIA_Hrabia_Ore_11_07"); //Lusterko te� wezm�.
	B_GiveInvItems (other, self,gomez_mirror,1);
	Npc_RemoveInvItems(self,gomez_mirror,1);

	AI_DrawWeapon (other);
	AI_Output (other, self, "DIA_Hrabia_Ore_15_08"); //Nikt nie b�dzie mnie bezkarnie okrada�!
	AI_Output (self, other, "DIA_Hrabia_Ore_11_09"); //W ustach z�odzieja brzmi to zgo�a zabawnie.
	AI_Output (self, other, "DIA_Hrabia_Ore_11_10"); //Zdaje si�, �e nie tylko ja zw�szy�em �atwy �up.

	AI_Output (self, other, "DIA_Hrabia_Ore_11_11"); //Nie b�d� przeszkadza� w zabawie.
	AI_TurnToNpc(other, self);
	
   AI_Output (self, other, "DIA_Hrabia_Ore_11_12"); //Kto wie, mo�e jeszcze si� spotkamy. Wtedy doko�czymy t� rozmow�.
	AI_Output (other, self, "DIA_Hrabia_Ore_15_13"); //Mo�esz by� tego pewien!
	
   AI_SetWalkmode(self,NPC_RUN);
	Npc_ExchangeRoutine	(self, "HIDE");	
	AI_SetWalkmode(pacho,NPC_RUN);
	B_ExchangeRoutine	(GRD_224_PACHO, "pachotressurewait4hero");	
	
   if (scorpio_traitor)
	{
		AI_SetWalkmode(skorpio,NPC_RUN);
		B_ExchangeRoutine	(GRD_205_SCORPIO, "pachotressurewait4hero");	
	};
	
   AI_Output (other, self, "DIA_Hrabia_Ore_15_14"); //�wietnie, znowu musz� radzi� sobie sam...
	
   B_LogEntry(CH1_Rbl_Ore, "Tego ju� za wiele. Kiedy wykopa�em rud� pojawi� si� jaki� gnojek i najzwyczajniej w �wiecie mi j� ukrad�. Do tego znalaz�a si� bestia, kt�ra wcze�niej za�atwi�a Pacho. Chyba przestan� wierzy� w szcz�cie...");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Hrabia_Trap (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 3;
	condition		= DIA_Hrabia_Trap_Condition;
	information		= DIA_Hrabia_Trap_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_Trap_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jarvis_Help21))//&&(Npc_GetDistToWP (self,"stone_trap") < 1000 )
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_Trap_Info()
{
	B_FullStop (hero);

	AI_Output (self, other, "DIA_Hrabia_Trap_11_01"); //Znowu si� spotykamy.
	//AI_TurnToNpc(other, self);//dick odwraca si� do hrabiego
	//AI_GotoNpc(self, other);//hrabia podchodzi do dicka
	AI_Output (other, self, "DIA_Hrabia_Trap_15_02"); //Mam co� w �yciu pecha i ci�gle wdeptuj� w to samo g�wno.
	AI_Output (self, other, "DIA_Hrabia_Trap_11_03"); //A podobno nie mo�na wej�� dwa razy do tej samej rzeki. Wsz�dzie Ci� pe�no, mo�na odnie�� wra�enie, �e lubisz by� w centrum zainteresowania.
	AI_Output (other, self, "DIA_Hrabia_Trap_15_04"); //Zdaje si�, �e szukamy tego samego.
	AI_Output (self, other, "DIA_Hrabia_Trap_11_05"); //Ale ja ju� mam to, po co przyby�em. 
	AI_Output (self, other, "DIA_Hrabia_Trap_11_06"); //Wybacz, obowi�zki wzywaj�.
	AI_Output (other, self, "DIA_Hrabia_Trap_15_07"); //Nie odejdziesz st�d �ywy!
	AI_Output (self, other, "DIA_Hrabia_Trap_11_08"); //Czy�by? Sp�jrz tam...
	
   AI_TurnToNpc(other, grd_2514);
	Ai_Wait (self, 0.2);
	B_StopProcessInfos	(self);
/****************	
	
	AI_TurnToNpc(other, grd_2516);
	Ai_Wait (self,0.5);
	AI_TurnToNpc(other, grd_2518);
	B_StopProcessInfos	(self);
	
	AI_GotoWP (kasacz, "trap_fight");
	AI_GotoWP (grd_2514, "trap_fight1");
	AI_GotoWP (grd_2515, "trap_fight2");
	AI_GotoWP (grd_2516, "trap_fight3");
	AI_GotoWP (grd_2517, "trap_fight4");
	AI_GotoWP (grd_2518, "trap_fight5");

	Npc_ExchangeRoutine(kasacz,"Prepare");//stoi w miejscu przed walk� najlepiej gdzie� przed dickiem

	/**********
	Maj� otoczy� dicka, ma to wygl�da�, �e nie ma szans
	**********/

	Npc_ExchangeRoutine(grd_2514,"Wait");
	Npc_ExchangeRoutine(grd_2515,"Wait");
	Npc_ExchangeRoutine(grd_2516,"Wait");
	Npc_ExchangeRoutine(grd_2517,"Wait");
	Npc_ExchangeRoutine(grd_2518,"Wait");

	/***************
	Jarvis ma podej�� blisko i podczas walki pom�c Dickowi jak odejdzie hrabia
	****************/
};

INSTANCE DIA_Hrabia_TrapEnd (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 3;
	condition		= DIA_Hrabia_TrapEnd_Condition;
	information		= DIA_Hrabia_TrapEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_TrapEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hrabia_Trap))
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_TrapEnd_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);

	var C_NPC jar; jar = Hlp_GetNpc(Sld_728_Jarvis);
	Party_AddNpc(jar);

   if (NPC_HasItems(other,orn2)>=1)
   {
      Give_and_remove(orn2, 1);
   };
   
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_01"); //Jak widzisz nie jestem sam i mam drobn� przewag�.
	AI_Output (other, self, "DIA_Hrabia_TrapEnd_15_02"); //Kilku z tych skurwieli zabior� ze sob�!
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_03"); //W to nie w�tpi�. Dlatego dam Ci fory.
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_04"); //K�sacz dostarczy Ci rozrywki.
	//TODO: Really needed?
	//AI_TurnToNpc(other, kasacz);
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_05"); //Na mnie ju� czas. 
	//AI_TurnToNpc(other, self);
	AI_Output (other, self, "DIA_Hrabia_TrapEnd_15_06"); //Jeszcze Ci� dopadn�!
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_07"); //Kto wie? Mo�e kiedy� skrzy�ujemy ostrza.
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_08"); //Ale raczej nie tutaj i nie teraz...
	AI_TurnToNpc(self, grd_2514);
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_09"); //Ruszamy!
	AI_TurnToNpc(other, kasacz);
	AI_DrawWeapon (kasacz);
	//AI_DrawWeapon (other);
	Npc_SetTarget (kasacz, hero);
	B_LogEntry(CH3_NON_Mercenary, "To by�a pu�apka! Wdepn��em w sam �rodek �ajna. Hrabia uciek� z kawa�kiem ornamentu, a mnie czeka walka o �ycie z jakim� olbrzymem...");
	B_LogEntry(CH3_NON_Ornament, "Hrabia zabra� drugi kawa�ek ornamentu i uciek�. Coraz bardziej mnie to intryguje...");	
	B_StopProcessInfos(self);
	
	/*********************
	Odchodz� - mo�e kamerka? Zanim gdzie� znikn� powr�t i najazd na k�sacza
	**********************/
	AI_SetWalkmode(self, NPC_RUN);
	Npc_ExchangeRoutine(self, "HIDE");

	B_ExchangeRoutine(grd_2514,"HIDE");
	B_ExchangeRoutine(grd_2515,"HIDE");
	B_ExchangeRoutine(grd_2516,"HIDE");
	B_ExchangeRoutine(grd_2517,"HIDE");
	B_ExchangeRoutine(grd_2518,"HIDE");
   
	/**********
	Hrabia i stra�nicy odchodz�, zsotaje K�sacz, kt�ry ma walczy� z Dickiem
	**********/
	
	B_ExchangeRoutine(jar,"GUARD1");
	AI_GotoWP(jar, "OW_PATH_225");
	
	AI_DrawWeapon(jar);
	//B_StartAfterDialogFight(jar,kasacz,true);
   
   Hrabia_teleport = true;
};

//CINEMATIC
//DISABLED
/*
INSTANCE DIA_Hrabia_FightCome (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 4;
	condition		= DIA_Hrabia_FightCome_Condition;
	information		= DIA_Hrabia_FightCome_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_FightCome_Condition()
{


	if (Npc_KnowsInfo (hero, DIA_Grd2_Alarm))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(NPC_HasItems(other,orn3)>=1)
	{
		return 1;
	};

};

FUNC VOID DIA_Hrabia_FightCome_Info()
{
	//TODO: Jako kamera z eventami (Sprawdz PrintDialog)
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);


	B_FullStop (hero);
	AI_TurnToNpc(self, grd2);

	AI_Output (self, grd2, "DIA_Hrabia_FightCome_11_01"); //Co tu si� wyprawia?!
	AI_TurnToNpc(other, weg);
	AI_Output (self, grd2, "DIA_Hrabia_FightCome_11_02"); //Nie mo�na was nawet na chwil� zostawi� samych. W�gorz!
	AI_GotoNpc(weg, self);
	AI_Output (weg, self, "DIA_Hrabia_FightCome_11_03"); //Tak jest!
	AI_Output (self, weg, "DIA_Hrabia_FightCome_11_04"); //Zdaje si�, �e wyrazi�em si� jasno. Mieli�cie siedzie� na dupie i pilnowa� mojej w�asno�ci.
	AI_Output (self, weg, "DIA_Hrabia_FightCome_11_05"); //Mniejsza z tym. Widzia�em si� z Krukiem, wiem dok�adnie gdzie znajduje si� kolejny fragment.
	AI_Output (self, weg, "DIA_Hrabia_FightCome_11_06"); //Kto� tu si� pa��ta�?
	AI_Output (weg, self, "DIA_Hrabia_FightCome_11_07"); //Nie, panie. Nikogo nie by�o.
	AI_Output (self, weg, "DIA_Hrabia_FightCome_11_08"); //To �wietnie. Czas sprawdzi� czy ornament jest na swoim miejscu...
	B_LogEntry		(CH3_NON_Ornament, "Kruk? Najwidoczniej to magnat stoi za tym wszystkim, to on wysy�a Hrabiego tam gdzie s� ukryte ornamenty. Ale sk�d wie o ich lokalizacji? I po co mu te kamole?");
	B_StopProcessInfos	(self);
	
	/***********************
	Hrabia podchodzi do skrzyni ukrytej gdzie� za jakim� g�azem w krzakach i sprawdza czy co� w niej jest
	Stra�nicy id� za nim i w oddaleniu ustawiaj� si� w kr�gu patrz�c na niego
	**********************/
/*
	AI_GotoWP (self, "ornament3_hide");
	AI_GotoWP (grd1, "g1");
	AI_GotoWP (grd2, "g2");
	AI_GotoWP (grd3, "g3");
	AI_GotoWP (grd4, "g4");
	AI_GotoWP (grd5, "g5");
	AI_GotoWP (weg, "g6");

	AI_AlignToWP		(self);
	AI_AlignToWP		(grd1);
	AI_AlignToWP		(grd2);
	AI_AlignToWP		(grd3);
	AI_AlignToWP		(grd4);
	AI_AlignToWP		(grd5);
	AI_AlignToWP		(weg);

	AI_PlayAni			(self,	"T_PLUNDER");
};*/

INSTANCE DIA_Hrabia_FindThief (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 5;
	condition		= DIA_Hrabia_FindThief_Condition;
	information		= DIA_Hrabia_FindThief_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_FindThief_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wegorz_First))&&(Npc_GetDistToNpc(self,hero) < 4500)&&(NPC_HasItems(hero,orn3)>=1)&&(Npc_GetDistToWP (other,"NEWPATH_4") < 500 )
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_FindThief_Info()
{
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);

	//TODO: Event z kamerka, jak w powyzszym dialogu
	B_FullStop (hero);
	AI_TurnToNpc(self, weg);

	AI_Output (self, null, "DIA_Hrabia_FindThief_11_01"); //To niemo�liwe! Ornament znikn��...
	
	B_StopProcessInfos(self);
	AI_GotoWP(other, "NEWPATH_4");
};

INSTANCE DIA_Hrabia_FindThief1 (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 5;
	condition		= DIA_Hrabia_FindThief1_Condition;
	information		= DIA_Hrabia_FindThief1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_FindThief1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hrabia_FindThief))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(NPC_HasItems(hero,orn3)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_FindThief1_Info()
{
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);


	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, null, "DIA_Hrabia_FindThief1_11_02"); //Widz� �wie�e �lady. Kto� si� tu zakrad� idioci, kiedy wy ok�adali�cie si� �elastwem...
	AI_TurnToNpc (self, hero);
	AI_Output (self, other, "DIA_Hrabia_FindThief1_11_03"); //Tam jest!

	/***********************

	Ork wklej tu animacj� strzelanie z kuszy tam chyba jest wskazywanie r�k�, albo co� podobnego, �e hrabia niby wskazuje kierunek
	*************************/
	AI_TurnToNpc(grd1, hero);
	AI_TurnToNpc(grd2, hero);
	AI_TurnToNpc(grd3, hero);
	AI_TurnToNpc(grd4, hero);
	AI_TurnToNpc(grd5, hero);
	AI_TurnToNpc(weg, hero);
	AI_DrawWeapon		(grd1);
	AI_DrawWeapon		(grd2);
	AI_DrawWeapon		(grd3);
	AI_DrawWeapon		(grd4);
	AI_DrawWeapon		(grd5);
	AI_DrawWeapon		(weg);
	AI_Output (self, other, "DIA_Hrabia_FindThief1_11_04"); //To znowu Ty! Za cz�sto wtykasz nos w nieswoje sprawy.
	AI_Output (self, other, "DIA_Hrabia_FindThief1_11_05"); //A to bardzo niebezpieczna przywara.
	AI_Output (other, self, "DIA_Hrabia_FindThief1_15_06"); //Sk�ry tanio nie sprzedam!
	AI_Output (self, other, "DIA_Hrabia_FindThief1_11_07"); //Zdaje si�, �e ju� to s�ysza�em. Zabijcie go ch�opcy, bo Kruk urwie wam jaja!
	AI_DrawWeapon		(other);
	B_StopProcessInfos	(self);
   
   Saturas_saves_Rick = true;
};

INSTANCE DIA_Hrabia_LastOrn (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 6;
	condition		= DIA_Hrabia_LastOrn_Condition;
	information		= DIA_Hrabia_LastOrn_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_LastOrn_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wegorz_First1))&&(Npc_GetDistToNpc(self,hero) < 500)&&(map4_readbydick == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_LastOrn_Info()
{
	ornament_wait = B_SetDayTolerance()+3;

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_01"); //Znowu si� spotykamy...
	AI_GotoNpc(self, other);
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_02"); //Tym razem mi nie uciekniesz!
	AI_DrawWeapon(other);
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_03"); //Schowaj �elazo, zanim komu� stanie si� krzywda.
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_04"); //Poza tym z tego co pami�tam, to Ty ostatnio rozp�yn��e� si� w o�lepiaj�cym �wietle magicznej aury...
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_05"); //Tym razem ornament te� b�dzie m�j! Ale najpierw wypruj� Ci flaki.
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_06"); //Spokojnie. Przyby�e� za p�no, ornamentu ju� tutaj nie ma. Ale nadal posiadasz kawa�ek, kt�rego potrzebuj�.
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_07"); //Jeste� idiot�, je�eli my�lisz, �e mam go przy sobie.	
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_08"); //Dlatego mam dla Ciebie propozycj�. Lub raczej dla tych, kt�rzy posy�aj� Ci� na te samob�jcze misje.
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_09"); //Nie jestem psem na posy�ki. Powiedzmy, �e sp�acam d�ug za przyjaciela.
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_10"); //Mnie nie oszukasz. Obaj jeste�my tutaj, bo kto� tego chcia�. Czy nam si� to podoba czy nie, obaj jeste�my tylko narz�dziami.
	AI_RemoveWeapon (other);
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_11"); //Co proponujesz?
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_12"); //Oddacie ornament i ju� wi�cej si� nie zobaczymy. To bezpieczny i bezkrwawy kompromis dla obu stron.
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_13"); //A je�eli nie osi�gniemy... konsensusu?
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_14"); //Przeszukam Koloni�. Pr�dzej b�d� p�niej, znajd� twoich mocodawc�w i wyrw� im ornament razem z co wa�niejszymi narz�dami.
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_15"); //Wyb�r nale�y do nich. Daj� wam trzy dni. W�gorz b�dzie tu czeka� na ornamenty.
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_16"); //Przeka�� im twoje s�owa. Ale potem sko�cz� to, co zacz��em...
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_17"); //Zaszczytem b�dzie dla mnie skrzy�owa� z Tob� miecz, je�eli zajdzie taka konieczno��.
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_18"); //Co to?
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_19"); //Cholera, znowu te pieprzone czary...

	B_LogEntry(CH3_NON_Ornament, "Znowu si� sp�ni�em! Hrabia zdoby� ostatni ornament, ale magowie nadal maj� jeden kawa�ek. Mam im przekaza�, �e je�eli w ci�gu trzech dni dobrowolnie zwr�c� ornament, to Hrabia i jego ludzie ju� wi�cej nam nie zagro��. Ale je�eli odm�wi� to czeka ich �mier�. Musz� przekaza� to Saturasowi.");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"castle");//najwy�szy czas, �eby hrabia wr�ci� do zamku o ile b�dzie ten zamek

	/***********************

	Ork znowu tp do Saturasa, chodzi o to, �eby zmie�ci� si� w tych 3 dniach bo i magom i hrabiemu z krukiem na tym zale�y
	
	AI_Teleport  (other, "SATURAS");
	************************/
};

//****************************************

/***********************************************

Ork Hrabia ma by� gdzie� zamkni�ty w jakiej� komnacie. Na dziedzi�cu w orlim gnie�dzie ma si� szlaja� jaki� wkurwiony wielki demon, pupilek Kruka. Przy ciele demona znajdzie si� jego serce-klucz umo�liwiaj�cy wej�cie tam gdzie Kruk zamkn�� Hrabiego.
Mo�esz doda� po drodze kilka mniejszych demon�w, kt�re przywo�a� kruk.
Idealnie by�oby gdyby da�o si� gada� przez zamkni�te drzwi ale nie wiem czy tak si� da zrobi� - jak b�dziesz poprawia� te skrypty to daj zna� wtedy si� to zmieni ewentualnie.
Ko�owr�t od bramy jest zepsuty, nie da si� jej podnie��, mo�ena tu wej��/wyj�� tylko poprzez teleportacj�. Kruk celowo tak to urz�dzi�, bo w�a�nie st�d ma zamiar wyrwa� si� z kolonii.

*********************************************/

INSTANCE DIA_Hrabia_TheRock (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 7;
	condition		= DIA_Hrabia_TheRock_Condition;
	information		= DIA_Hrabia_TheRock_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_TheRock_Condition()
{
	//Duck_tp what is this?
	if (Npc_KnowsInfo (hero, DIA_Fletcher_TheRock))&&(Npc_GetDistToNpc(self,hero) < 1000)//&&(duck_tp == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_TheRock_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_01"); //Nawet tutaj mnie znalaz�e�, godna podziwu determinacja.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_02"); //Ja zawsze sp�acam d�ugi. Dam ci jednak wyb�r.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_03"); //Wyb�r? Wydaje Ci si�, �e ktokolwiek z nas ma jaki� wyb�r?
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_04"); //Robi� tylko to, co zechc�, sam kuj� w�asny los.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_05"); //Tak Ci si� tylko wydaje. Kto� prz�dzie sie�, w kt�r� wpadamy. Ka�dy z nas pod��a tak� drgaj�c� nitk�, a na ko�cu czyha bestia, dla kt�rej jeste�my tylko kolejn� przek�sk�.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_06"); //Akurat teraz zebra�o ci si� na rozwa�ania egzystencjonalne.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_07"); //Prosz� tylko, �eby� wys�ucha� pewnej opowie�ci. P�niej zrobisz, co uwa�asz za stosowne.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_08"); //Niech b�dzie, m�w.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_09"); //Nie trafi�em do Kolonii przez przypadek. Przyby�em tu w okre�lonym celu.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_10"); //Tak, wiem. Ty i Kruk to niszczycielski tandem.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_11"); //Masz racj�, od zawsze tak by�o. 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_12"); //Jednak kiedy� mieli�my inne cele. Chcieli�my lepszego �ycia, szacunku i w�adzy.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_13"); //Uda�oby si�, gdyby nie zach�anno�� Kruka. Na szcz�cie tylko on trafi� do Kolonii.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_14"); //A ty?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_15"); //Dalej prowadzi�em interesy gildii Cienia.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_16"); //Co to za gildia?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_17"); //To nie twoja sprawa. Jedyne co musisz wiedzie� to fakt, �e interesy gildii si�gaj� tak�e do tej zawszonej Kolonii.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_18"); //Dlatego zgodzi�em si� na zes�anie. Moim celem jest Kruk, nikt inny.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_19"); //Rozumiem, �e wszyscy kt�rzy zgin�li po drodze, to tylko przypadkowe ofiary waszych matactw.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_20"); //Najwi�ksze ofiary na wojnie ponosz� niewinni, to naturalna kolej rzeczy. 
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_21"); //Oszcz�d� mi tej nad�tej gadki. 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_22"); //Kruk musi zgin��, a ja mia�em wykona� wyrok.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_23"); //I dlatego si� z nim ponownie zbrata�e�, rozwi�zywa�e� jego problemy i zabija�e� jego wrog�w?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_24"); //To cz�� planu. Musia�em zdoby� pe�ne zaufanie Kruka, �eby dowiedzie� si� wszystkiego, co wie i co zamierza.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_25"); //Powiedzmy, �e ci wierz�. Co dalej?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_26"); //Kruk zajmowa� w gildii wysokie stanowisko. Niestety za p�no wysz�o na jaw, �e jego obsesj� sta�y si� ukryte �wi�tynie Beliara.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_27"); //Kruk znikn�� na kilka miesi�cy. Kiedy wr�ci� nie by� ju� tym samym cz�owiekiem. To znaczy nadal by� wrednym skurwielem, ale w jego oczach... 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_28"); //My�leli�my, �e to zal��ek szale�stwa. Jednak teraz jestem pewien, �e to wp�yw Beliara.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_29"); //Gildia zacz�a odczuwa� skutki tej obsesji, kiedy kolejni cz�onkowie gin�li w niewyja�nionych okoliczno�ciach.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_30"); //Kruk i jego nowy Pan, chcieli przej�� gildi�, aby wykorzysta� jej wp�ywy do w�asnych cel�w.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_31"); //Jedna z g��wnych zasad gildii m�wi - �adnych boskich koneksji!
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_32"); //Wyrok zapad�, ale musieli�my to przeprowadzi� bardzo starannie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_33"); //Zes�anie do Kolonii by�o najmniejszym problemem. Chocia� teraz wiem, �e Kruk domy�li� si�, kto za tym stoi.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_34"); //Nie nabra� si� na nalot i przypadkowe uwi�zienie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_35"); //Drugim etapem mia�em by� ja.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_36"); //Od zawsze byli�my blisko. Po��czy� nas wsp�lny wr�g - Myrtana.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_37"); //Moje imi� to tak�e tytu�. Kiedy� w�ada�em sporym hrabstwem na p�nocnych rubie�ach.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_38"); //Ale pewnego dnia kr�lewski gubernator zarekwirowa� m�j maj�tek, jak to uj�� 'na potrzeby machiny wojennej', a ja zosta�em z workiem bezwarto�ciowych weksli wojskowych.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_39"); //Z Krukiem spotkali�my si� po raz pierwszy na trakcie, kiedy pr�bowa� mnie obrabowa�. Nie�le mu wtedy z�oi�em sk�r�.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_40"); //Nie wiem, jak to si� sta�o, w ka�dym razie sko�czyli�my zalani w trupa w jakie� ober�y, kt�rej w�a�ciciela obwiesili�my na szyldzie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_41"); //Jaki� czas p�niej do��czyli�my do gildii. Wtedy nasze drogi si� rozesz�y.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_42"); //Ja zajmowa�em si� wykonywaniem zlece�, Kruk ich wyszukiwaniem.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_43"); //Po co mi to wszystko m�wisz?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_44"); //Chc�, �eby� zrozumia�, �e nie jestem Twoim wrogiem. Wykonuj� tylko zadanie, kt�re mi zlecono.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_45"); //Co nie zmienia faktu, �e zbyt cz�sto stawa�e� mi na drodze.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_46"); //Wiem, ale z tego powodu akurat si� ciesz�.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_47"); //Nie rozumiem.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_48"); //Okaza�e� si� mi�ym urozmaiceniem, w ko�cu trafi�em na godnego siebie przeciwnika.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_49"); //Teraz to mnie wzruszy�e�. Co by�o dalej?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_50"); //Kruk mnie przejrza�.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_51"); //To dlaczego Ci� nie zabi�?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_52"); //By�em u�ytecznym narz�dziem. Wiesz jak to m�wi�, wrog�w lepiej trzyma� bli�ej ni� przyjaci�. 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_53"); //Kruk szuka� �wi�tyni ukrytej na tej wyspie i dopi�� swego.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_54"); //Nie wiem, jak uda�o mu si� to pod nosem ork�w, ale zdoby� pomoc pot�nego demona, uwi�zionego gdzie� w orkowej �wi�tyni.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_55"); //S�ugi Kruka to prezent od tej Bestii. 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_56"); //Orle Gniazdo nie przypadkiem wzniesiono w miejscu, gdzie powsta�a wyrwa w barierze. To kolejny dar od demona.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_57"); //Czyli Kruk odnalaz� spos�b na sforsowanie bariery?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_58"); //Tak, a ja spr�bowa�em mu w tym przeszkodzi�.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_59"); //Dowiedzia�em si� ju� wszystkiego, na czym zale�a�o gildii. Niestety troch� mnie ponios�o.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_60"); //Chcia�em dokopa� Krukowi w momencie jego chwa�y. Nie doceni�em go. 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_61"); //Nie wiem, kiedy mnie przejrza�. By� mo�e, od pocz�tku wiedzia�, dlaczego si� tutaj znalaz�em.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_62"); //Dziwi� si� tylko, �e tyle mi powiedzia�.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_63"); //By� pewien, �e nie po�yjesz wystarczaj�co d�ugo, �eby o tym opowiedzie�.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_64"); //Te� tak my�l�. W tej chwili zale�y mi tylko na jednym - na �mierci Kruka.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_65"); //Dlaczego mia�bym uwierzy� w t� opowie��?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_66"); //Bo by�a za d�uga, �ebym wymy�li� j� na poczekaniu?
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_67"); //Powiedzmy, �e mnie przekona�e�. Co dalej? Bo chyba nie opowiedzia�e� mi tego tylko po to, �eby zrzuci� kamie� z serca.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_68"); //Chc�, �eby� pom�g� mi w pozbyciu si� Kruka. Jestem pewien, �e Ty tak�e na tym skorzystasz.

	Info_ClearChoices (DIA_Hrabia_TheRock);
	Info_AddChoice (DIA_Hrabia_TheRock, "Mam ju� do�� twoich gierek - gi�!", DIA_Hrabia_TheRock_Kill);
	Info_AddChoice (DIA_Hrabia_TheRock, "Dlaczego mia�bym Ci zaufa�?", DIA_Hrabia_TheRock_Why);
};

// ----------------------------------------------------------------

FUNC VOID DIA_Hrabia_TheRock_Kill()
{
	AI_Output (other, self, "DIA_Hrabia_TheRock_Kill_15_01"); //Mam ju� do�� twoich gierek - gi�!
	AI_Output (self, other, "DIA_Hrabia_TheRock_Kill_11_02"); //To tw�j wyb�r, ale uszanuj� go. Niech wygra lepszy.
	Log_SetTopicStatus(CH1_Rbl_Hrabia, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Hrabia, "Mam ju� do�� gierek Hrabiego. Czas si� go pozby� na zawsze!");

	B_LogEntry(CH5_NC_TheRock, "Hrabia opowiedzia� mi histori� swojego �ycia. Lee pewnie z zainteresowaniem wys�ucha opowie�ci o Kruku i jego martwym ju� przyjacielu - Hrabim.");

	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);
};

// ----------------------------------------------------------------

FUNC VOID DIA_Hrabia_TheRock_Why()
{
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_15_01"); //Dlaczego mia�bym Ci zaufa�?
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_11_02"); //Przecie� nic na tym nie tracisz. W ka�dej chwili mo�esz mnie zabi�.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_15_03"); //Albo ty mnie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_11_04"); //Taka mo�liwo�� tak�e istnieje.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_11_05"); //Wi�c jaka jest Twoja decyzja?

	Info_ClearChoices (DIA_Hrabia_TheRock);
	Info_AddChoice (DIA_Hrabia_TheRock, "Mam ju� do�� twoich gierek - gi�!", DIA_Hrabia_TheRock_Kill);
	Info_AddChoice (DIA_Hrabia_TheRock, "Niech b�dzie.", DIA_Hrabia_TheRock_Why_Ok);
};

// ----------------------------------------------------------------

FUNC VOID DIA_Hrabia_TheRock_Why_Ok()
{
	Hrabia_RavenTrap = TRUE;
   
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_01"); //Niech b�dzie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_02"); //Chcesz czy nie, ale jeste�my ulepieni z tej samej gliny.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_03"); //Nie szukam przyjaciela. M�w, jak chcesz za�atwi� Kruka.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_04"); //Po pierwsze Kruk jest pewien, �e nadal jestem zamkni�ty w Gnie�dzie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_05"); //Po drugie ma teraz inne sprawy na g�owie. �eby si� st�d ulotni�, musi zmusi� jakiego� maga do przeprowadzenia rytua�u.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_06"); //Ten kamie� teleportuj�cy to tak�e �r�d�o mocy. Z tego co wiem, Kruk ma ju� formu��. Brakuje mu tylko narz�dzia, czyli maga.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_07"); //Hmm, chyba wiem do czego zmierzasz. To ja mam robi� za magika, kt�ry mu pomo�e.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_08"); //Dok�adnie! Przyb�dzie tu tylko z Tob�. Zaczniesz inkantacj�, odwr�cisz jego uwag�, a wtedy ja sko�cz� to, co zacz��em dawno temu. 
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_09"); //Kruk nie jest idiot�. Na dziedzi�cu le�y posiekany demon, a zdaje si�, �e ten jego by� �ywy.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_10"); //Na to te� jest spos�b. Przywo�a si� innego demona.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_11"); //Kt�ry rzuci si� na ka�dego, kogo zobaczy.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_12"); //Kruk pomy�li, �e czar wi���cy straci� moc. Posiekacie demona i rozpoczniesz inkantacj�.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_13"); //Przywo�am demona tu� przed waszym przybyciem.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_14"); //To musz� jeszcze dosta� si� do Starego Obozu i zwr�ci� na siebie uwag� Kruka. Jakie� pomys�y?
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_15"); //To ju� twoja dzia�ka. Ja robi� tylko za zdrajc� i zab�jc�.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_16"); //Dobra, zajm� si� Krukiem. Lepiej �eby� tu by�, kiedy wr�c�.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_17"); //O to si� nie martw, ja zawsze dotrzymuj� s�owa.

	/*******************
Niech Hrabia gdzie� si� jakby schowa na placu. Po tym jak Dick i Kruk zabij� demona rzuci si� na Kruka.
********************/

	Npc_ExchangeRoutine(self,"hide_castle");

	B_LogEntry(CH1_Rbl_Hrabia, "Ten Hrabia jest do mnie bardziej podobny ni� sam chcia�bym przyzna�. Wsp�lnie zajmiemy si� Krukiem. Hrabia przygotuje teren w Orlim Gnie�dzie, ja musz� zwabi� tu Kruka pod pretekstem, �e pomog� mu w inkantacji. Chyba znowu wybra�em gorsz� cz�� zadania...");

	B_LogEntry (CH5_NC_TheRock, "Wszed�em do Orlego Gniazda. W �rodku, pr�cz Hrabiego, nie ma �ywej duszy. Krata jest zablokowana wi�c nikt z zewn�trz si� tutaj nie dostanie. To powinno uspokoi� Lee.");
	Info_ClearChoices (DIA_Hrabia_TheRock);
};
