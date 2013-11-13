
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Pinto_EXIT(C_INFO)
{
	npc			= Grd_612_Gardist;
	nr			= 999;
	condition			= Info_Pinto_EXIT_Condition;
	information			= Info_Pinto_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Pinto_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Pinto_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Pinto_Hello (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 1;
	condition		= Info_Pinto_Hello_Condition;
	information		= Info_Pinto_Hello_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Pinto_Hello_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Kris_Hello))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};

};
FUNC VOID Info_Pinto_Hello_Info()
{	
	var C_NPC kris; kris = Hlp_GetNpc(Grd_610_Gardist);

	B_FullStop (hero);
	AI_TurnToNpc (other, self);
	AI_TurnToNpc (self, kris);
	AI_Output (self, other,"Info_Pinto_Hello_06_01"); //Dziewucha znalaz�a kolejne cia�o. Potrzebuje pomocy, ten pochlastany robol strasznie si� rzuca.
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Pinto_Hello_06_02"); //�wie�e mi�cho?
	AI_Output (other, self,"Info_Pinto_Hello_15_03"); //Masz z tym jaki� problem?
	AI_Output (self, other,"Info_Pinto_Hello_06_04"); //No prosz�, jaka zadziora. Kris wy�lij go do Kap�anki Mi�osierdzia. 
	AI_Output (self, other,"Info_Pinto_Hello_06_05"); //Mo�e tam na co� si� przyda.
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"start");
};



// ************************************************************

INSTANCE Info_Pinto_Hello1 (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 1;
	condition		= Info_Pinto_Hello1_Condition;
	information		= Info_Pinto_Hello1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Dobrze znasz Krisa?";
};                       

FUNC INT Info_Pinto_Hello1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Pinto_Hello))
	{
		return 1;
	};

};
FUNC VOID Info_Pinto_Hello1_Info()
{	
	AI_Output (other, self,"Info_Pinto_Hello1_15_01"); //Dobrze znasz Krisa?
	AI_Output (self, other,"Info_Pinto_Hello1_06_02"); //A co, wpad� Ci w oko?
	AI_Output (other, self,"Info_Pinto_Hello1_15_03"); //Nie to mia�em na my�li...
	AI_Output (self, other,"Info_Pinto_Hello1_06_04"); //Wiem, idioto. Po prostu nie mia�em zamiaru odpowiada�.
	AI_Output (self, other,"Info_Pinto_Hello1_06_05"); //Spadaj.
};

// ************************************************************

INSTANCE Info_Pinto_Warn (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 3;
	condition		= Info_Pinto_Warn_Condition;
	information		= Info_Pinto_Warn_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Pinto_Warn_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Seven_MystEnd))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Pinto_Warn_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other,"Info_Pinto_Warn_06_01"); //Podobno kto� wsadza nos tam gdzie nie powinien.
	AI_Output (self, other,"Info_Pinto_Warn_06_02"); //Podobno to bardzo niezdrowe zaj�cie.
	AI_Output (other, self,"Info_Pinto_Warn_15_03"); //Podobno lepsza najgorsza prawda, ni� najwspanialsze k�amstwo.
	AI_Output (self, other,"Info_Pinto_Warn_06_04"); //Wiesz, doro�li czasem musz� m�wi� to co powinni, a nie to co chc�.
	AI_Output (other, self,"Info_Pinto_Warn_15_05"); //M�wisz za siebie, czy za Krisa?
	AI_Output (self, other,"Info_Pinto_Warn_06_06"); //A co to za r�nica?
	AI_Output (other, self,"Info_Pinto_Warn_15_07"); //My�l�, �e Hrabia kiedy� wr�ci i bardziej doceni przykr� prawd� ni� s�odki fa�sz.
	AI_Output (self, other,"Info_Pinto_Warn_06_08"); //G�wno mnie obchodzi to co my�lisz. Prawda jest taka, �e podpad�e� Krisowi, a on Ci nie odpu�ci.
	AI_Output (other, self,"Info_Pinto_Warn_15_09"); //I przys�a� ciebie bo oblecia� go strach?
	AI_Output (self, other,"Info_Pinto_Warn_06_10"); //Po prostu nie lubi si� brudzi� fekaliami. A mi tam zjedno komu nakopi� do ty�ka.
	AI_DrawWeapon (self);
	AI_Output (other, self,"Info_Pinto_Warn_15_11"); //Uwa�aj, nosi� wilk razy kilka...

	/************************
Chodzi o to, �eby Pinto st�uk� Dicka, jak masz inny pomys� to to zmie�

Aha i Pinto niech czeka na Dicka najlepiej a� wstanie z gleby

************************/

	hero.attribute[ATR_HITPOINTS] = (hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS_MAX])+5;
	B_StopProcessInfos	(self);
	B_StartAfterDialogFight(self,other,false);
};


// ************************************************************

INSTANCE Info_Pinto_Warn1 (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 3;
	condition		= Info_Pinto_Warn1_Condition;
	information		= Info_Pinto_Warn1_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Pinto_Warn1_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Pinto_Warn))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Pinto_Warn1_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other,"Info_Pinto_Warn1_06_01"); //To by�o ostrze�enie, ch�opcze.
	AI_Output (self, other,"Info_Pinto_Warn1_06_02"); //Nast�pnym razem nie b�d� tak delikatny.
	AI_Output (other, self,"Info_Pinto_Warn1_15_03"); //Zaczekaj!
	AI_Output (self, other,"Info_Pinto_Warn1_06_04"); //Masz ochot� na powt�rk�? Wiesz ja tak mog� d�ugo...
	AI_Output (other, self,"Info_Pinto_Warn1_15_05"); //Mam dla Ciebie propozycj�.
	AI_Output (self, other,"Info_Pinto_Warn1_06_06"); //No prosz�, bezczelny z Ciebie gnojek. Ale takich w�a�nie lubi�. M�w.
	AI_Output (other, self,"Info_Pinto_Warn1_15_07"); //Udowodni�, �e to Nia morduje ludzi w Gnie�dzie.
	AI_Output (self, other,"Info_Pinto_Warn1_06_08"); //I co z tego? Kris ma to w dupie. Trzeba tylko znale�� ofiar�...
	AI_Output (other, self,"Info_Pinto_Warn1_15_09"); //Wiem, �e pad�o na mnie. Ale mam pomys�.
	AI_Output (self, other,"Info_Pinto_Warn1_06_10"); //Uparty z Ciebie idiota. No dobra, m�w.
	AI_Output (other, self,"Info_Pinto_Warn1_15_11"); //Um�wi� si� z Ni� na nocn� schadzk�.
	AI_Output (other, self,"Info_Pinto_Warn1_15_12"); //Ale nie b�d� sam. Ty i kilku innych ukryjecie si� w cieniu.
	AI_Output (self, other,"Info_Pinto_Warn1_06_13"); //Szykuje si� niez�e przedstawienie. Zabior� troch� �arcia i piwo.
	AI_Output (other, self,"Info_Pinto_Warn1_15_14"); //Zgadzasz si�?
	AI_Output (self, other,"Info_Pinto_Warn1_06_15"); //Czemu nie. Mam ju� do�� tej wrednej suki. Je�eli za�wiadcz� te� inni to Kris nie b�dzie mia� wyboru.
	AI_Output (other, self,"Info_Pinto_Warn1_15_16"); //�wietnie. Porozmawiam z pozosta�ymi. 
	AI_Output (self, other,"Info_Pinto_Warn1_06_17"); //Najpierw porozmawiaj z Ni�. Nic z tego nie wyjdzie jak dziwka nie poleci na twoje k�amstewka.
	AI_Output (other, self,"Info_Pinto_Warn1_15_18"); //W porz�dku. 
	AI_Output (self, other,"Info_Pinto_Warn1_06_19"); //Zapowiada si� ciekawy wiecz�r. Powodzenia, ch�opcze.
	
   B_LogEntry		(CH4_Non_Eagle, "Uda�o si�! Nam�wi�em Pinto. Musz� jeszcze porozmawia� z pozosta�ymi. Potrzebuj� co najmniej kilku �wiadk�w.");
	Npc_ExchangeRoutine	(self,"WAIT");	
};

// ************************************************************

INSTANCE Info_Pinto_Hmm (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 3;
	condition		= Info_Pinto_Hmm_Condition;
	information		= Info_Pinto_Hmm_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Pinto_Hmm_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Nia_Meet12))&& (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Pinto_Hmm_Info()
{	
	var C_NPC seven; seven = Hlp_GetNpc(Grd_613_Gardist);
	var C_NPC nia; nia = Hlp_GetNpc(Non_660_Nia);
	nia.attribute[ATR_HITPOINTS] = nia.attribute[ATR_HITPOINTS_MAX] - nia.attribute[ATR_HITPOINTS_MAX];
		//B_StartAfterDialogFight(seven,self,true);
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other,"Info_Pinto_Hmm_06_01"); //Co tu si� kurwa dzieje!
	
   AI_GotoNpc(self, hero);
	AI_TurnToNpc (self, seven);
	AI_DrawWeapon (self);
	
   AI_Output (self, other,"Info_Pinto_Hmm_06_02"); //Lepiej Si�demka, �eby� mia� dobre wyt�umaczenie!
	B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE Info_Pinto_Hmm1 (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 3;
	condition		= Info_Pinto_Hmm1_Condition;
	information		= Info_Pinto_Hmm1_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Pinto_Hmm1_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Seven_Watch))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Pinto_Hmm1_Info()
{	
	var C_NPC seven; seven = Hlp_GetNpc(Grd_613_Gardist);

	B_FullStop (hero);
	AI_TurnToNpc (self, seven);
	AI_RemoveWeapon (self);
	AI_Output (self, other,"Info_Pinto_Hmm1_06_01"); //Poka� n�.
	CreateInvItems (self, Nia_Knif ,1); 
	//B_GiveInvItems (self, other, EN_Bandage, 1);

	AI_UnequipWeapons		(self);
	EquipItem	(self,Nia_Knif);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni			(self, "T_1HSINSPECT");
	AI_UnequipWeapons		(self);

	AI_Output (self, other,"Info_Pinto_Hmm1_06_02"); //Rzeczywi�cie, to jej ostrze.

	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);
	AI_EquipBestMeleeWeapon	(self);
	AI_Output (self, other,"Info_Pinto_Hmm1_06_03"); //Czyli sprawa rozwi�zana.
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Pinto_Hmm1_06_04"); //Pogadam z Krisem. Powiem mu jak by�o, a reszta po�wiadczy.
	AI_Output (self, other,"Info_Pinto_Hmm1_06_05"); //Wezm� n�, inaczej mi nie uwierzy...

	B_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "start"); 
}; 
