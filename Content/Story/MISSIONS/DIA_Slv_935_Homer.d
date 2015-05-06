// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Homer_EXIT (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 999;
	condition	= DIA_Homer_EXIT_Condition;
	information	= DIA_Homer_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Homer_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 						Damm gebaut
// ************************************************************

INSTANCE DIA_Homer_BuiltDam (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_BuiltDam_Condition;
	information	= DIA_Homer_BuiltDam_Info;
	permanent	= 0;
	description = "Czy to TY zbudowa�e� tam�, o kt�rej wszyscy m�wi�?";
};                       

FUNC INT DIA_Homer_BuiltDam_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_BuiltDam_Info()
{	
	AI_Output (other, self,"DIA_Homer_BuiltDam_15_00"); //Czy to TY zbudowa�e� tam�, o kt�rej wszyscy m�wi�?
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_01"); //Tak, to by�o w czasach rozwkitu Nowego Obozu.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_02"); //To by�o spore wyzwanie. Konstrukcja jest prosta, ale musieli�my dr��y� w dnie, aby wbi� bale, na kt�rych osadzili�my tam�.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_03"); //To moje najwspanialsze dzie�o!
};

// ************************************************************

INSTANCE DIA_Homer_Again (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_Again_Condition;
	information	= DIA_Homer_Again_Info;
	permanent	= 0;
	description 	= "Opowiedz mi co� wi�cej o tamie.";
};                       

FUNC INT DIA_Homer_Again_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_BuiltDam))&&(Npc_KnowsInfo (hero, DIA_Sher_Hlp))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Again_Info()
{	
	AI_Output (other, self,"DIA_Homer_Again_15_00"); //Opowiedz mi co� wi�cej o tamie.
	AI_Output (self, other,"DIA_Homer_Again_02_01"); //Naprawd� chcesz pos�ucha�?
	AI_Output (other, self,"DIA_Homer_Again_15_02"); //Pewnie!
	AI_Output (self, other,"DIA_Homer_Again_02_03"); //To moje najwi�ksze dzie�o! Zaprojektowa�em j�, kiedy Nowy Ob�z dopiero budzi� si� do �ycia.
	AI_Output (self, other,"DIA_Homer_Again_02_04"); //Wzi��em pod uwag� nacisk ci�aru tamy na podmok�y grunt. Dlatego wcze�niej kaza�em wbi� ogromne pale.
	AI_Output (self, other,"DIA_Homer_Again_02_05"); //Nie zanudzam ci�?
};

// ************************************************************

INSTANCE DIA_Homer_Again1 (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 3;
	condition	= DIA_Homer_Again1_Condition;
	information	= DIA_Homer_Again1_Info;
	permanent	= 0;
	description 	= "M�w dalej.";
};                       

FUNC INT DIA_Homer_Again1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Again1_Info()
{	
	AI_Output (other, self,"DIA_Homer_Again1_15_00"); //M�w dalej.
	AI_Output (self, other,"DIA_Homer_Again1_02_01"); //W ko�cu trafi�em na kogo�, z kim warto porozmawia�!
	AI_Output (self, other,"DIA_Homer_Again1_02_02"); //Jak ju� m�wi�em, tama to solidna robota, ale te� i finezyjna.
	AI_Output (self, other,"DIA_Homer_Again1_02_03"); //Wiesz, �e u�y�em drzewa cedrowego, a nie bukowego, �eby ca�a konstrukcja by�a bardziej elastyczna?
};

// ************************************************************

INSTANCE DIA_Homer_Again2 (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 4;
	condition	= DIA_Homer_Again2_Condition;
	information	= DIA_Homer_Again2_Info;
	permanent	= 0;
	description 	= "To niesamowite, m�w dalej.";
};                       

FUNC INT DIA_Homer_Again2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_Again1))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Again2_Info()
{	
	AI_Output (other, self,"DIA_Homer_Again2_15_00"); //To niesamowite, m�w dalej.
	AI_Output (self, other,"DIA_Homer_Again2_02_01"); //U�y�em specjalnych w�z��w do spajania belek. Dodatkowo wszystkie s� zbite krzy�owymi klinami.
	AI_Output (self, other,"DIA_Homer_Again2_02_02"); //Tam� mo�na bez problemu rozbudowa�, a nawet rozebra� i przetransportowa� gdzie indziej.
};

// ************************************************************

INSTANCE DIA_Homer_Again3 (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 5;
	condition	= DIA_Homer_Again3_Condition;
	information	= DIA_Homer_Again3_Info;
	permanent	= 0;
	description 	= "Jeste� prawdziwym geniuszem!";
};                       

FUNC INT DIA_Homer_Again3_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_Again2))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Again3_Info()
{	
	AI_Output (other, self,"DIA_Homer_Again3_15_00"); //Jeste� prawdziwym geniuszem!
	AI_Output (self, other,"DIA_Homer_Again3_02_01"); //Te� tak uwa�am, he, he.
	AI_Output (self, other,"DIA_Homer_Again3_02_02"); //Najad�em si� sporo strachu, kiedy jaki� cholerny topielec podgryza� konstrukcj�, ale to by�y tylko przej�ciowe k�opoty.
	AI_Output (self, other,"DIA_Homer_Again3_02_03"); //Najwa�niejsze, �e tama wznosi si� dumnie i niestrudzenie walczy z �ywio�em wody.
};

// ************************************************************

INSTANCE DIA_Homer_Again4 (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 6;
	condition	= DIA_Homer_Again4_Condition;
	information	= DIA_Homer_Again4_Info;
	permanent		= 0;
	important		= 1;
	description 	= "";
};                       

FUNC INT DIA_Homer_Again4_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_Again3))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Again4_Info()
{	
	AI_Output (self, other,"DIA_Homer_Again4_02_01"); //Nikt dot�d nie doceni� mojego dzie�a.
	AI_Output (other, self,"DIA_Homer_Again4_15_02"); //Bo do Kolonii trafiaj� sami g�upcy! To co robisz, to czego dokona�e� - to prawdziwe cudo!
	AI_Output (self, other,"DIA_Homer_Again4_02_03"); //Zawstydzasz mnie...
	AI_Output (other, self,"DIA_Homer_Again4_15_04"); //Szkoda tylko, �e nie mo�esz nadal tworzy� tak wspania�ych dzie�.
	AI_Output (self, other,"DIA_Homer_Again4_02_05"); //Te� nad tym ubolewam.
	AI_Output (other, self,"DIA_Homer_Again4_15_06"); //Hmm. Istnieje pewne wyj�cie.
	AI_Output (self, other,"DIA_Homer_Again4_02_07"); //Jakie?
	AI_Output (other, self,"DIA_Homer_Again4_15_08"); //Na powierzchni nied�ugo wybuchnie rebelia. Kiedy zdo�amy obali� stra�nik�w, znowu b�dziesz m�g� tworzy� swoje dzie�a.
	AI_Output (other, self,"DIA_Homer_Again4_15_09"); //Ale trzeba cierpliwie czeka� na odpowiedni� chwil�, kt�ra wkr�tce nadejdzie.
	AI_Output (other, self,"DIA_Homer_Again4_15_10"); //Do tego czasu ka�dy musi pracowa� na powodzenie powstania. W kopalni brakuje kopaczy, ka�dy z nas musi wzmo�y� wysi�ki, �eby zamydli� oczy stra�nikom.
	AI_Output (self, other,"DIA_Homer_Again4_02_11"); //Praca ku wolno�ci? W zasadzie got�w jestem na takie po�wi�cenie...
	AI_Output (other, self,"DIA_Homer_Again4_15_12"); //Kilka przepracowanych dni wartych jest wolno�ci. B�dziesz m�g� wtedy zaprojektowa� kolejne dzie�o.
	AI_Output (self, other,"DIA_Homer_Again4_02_13"); //Masz racj�! Tak w�a�nie zrobi�. Cholera, gdzie jest m�j kilof?
	B_LogEntry		(CH4_GRD_NewMine, "Przekona�em Homera, ale ten idiota zgubi� gdzie� sw�j kilof! Musz� rozejrze� si� za jego narz�dziem pracy.");
};

// ************************************************************

INSTANCE DIA_Homer_Pickaxe (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 7;
	condition	= DIA_Homer_Pickaxe_Condition;
	information	= DIA_Homer_Pickaxe_Info;
	permanent		= 0;
	important		= 0;
	description 	= "Mam dla Ciebie kilof.";
};                       

FUNC INT DIA_Homer_Pickaxe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_Again4))&&(NPC_HasItems(other,ItMwPickaxe)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Pickaxe_Info()
{	
	miners_work = miners_work + 1;
	AI_Output (other, self,"DIA_Homer_Pickaxe_15_01"); //Mam dla Ciebie kilof.
	B_GiveInvItems (other, self, ItMwPickaxe, 1);
	AI_Output (self, other,"DIA_Homer_Pickaxe_02_02"); //To wspaniale, ruszam do pracy.
	AI_Output (self, other,"DIA_Homer_Pickaxe_02_03"); //Kiedy to wszystko si� sko�czy, zaprojektuj� ogromny wiatrak... O i mur widoczny z Ksi�yca!
	B_GiveXP(250);	
	B_LogEntry		(CH4_GRD_NewMine, "Nie by�o �atwo, ale Homer te� we�mie si� do pracy.");
	B_StopProcessInfos	(self);

	/***************
	rutyna kopania rudy
	**************/
	Npc_ExchangeRoutine(self,"Pick");
	
	var C_NPC vlk2; vlk2 = Hlp_GetNpc(VLK_5003_Buddler);
	Npc_ExchangeRoutine(vlk2,"GO");
}; 
