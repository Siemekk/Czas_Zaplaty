//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  DIA_Roderic_EXIT (C_INFO)
{
	npc			= Roderic;
	nr			= 999;
	condition	= DIA_Roderic_EXIT_Condition;
	information	= DIA_Roderic_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Roderic_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_Roderic_EXIT_Info()
{
	B_StopProcessInfos	( self );
};

//---------------------------------------------------------------------
instance  DIA_Roderic_OldNote(C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_OldNote_Condition;
	information	= DIA_Roderic_OldNote_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  DIA_Roderic_OldNote_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Leren_OldNote))&&(Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC void  DIA_Roderic_OldNote_Info()
{
	B_GiveXP(500);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_01"); //Cienie i mrok... Przenika mnie zimno wiek�w... Czuj� ciep�o �miertelnej istoty.
	AI_Output 	(other,self,"DIA_Roderic_OldNote_15_02"); //'Niestety' nadal oddycham. Kim jeste�? Dlaczego pa��tasz si� po tych zapomnianych przez bog�w ruinach?
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_03"); //To moje przekle�stwo. Wieczna tu�aczka.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_04"); //Taki los czeka ka�dego zdrajc�...
	AI_Output 	(other,self,"DIA_Roderic_OldNote_15_05"); //Zdrajc�?
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_06"); //Zawiod�em tych, kt�rzy mi zaufali. To gorsze ni� zdrada.
	AI_Output 	(other,self,"DIA_Roderic_OldNote_15_07"); //Mo�e powiesz co� wi�cej (cholera ja rozmawiam z duchem!)...
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_08"); //To by�a mro�na noc. Ksi�yc sta� w nowiu.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_09"); //Ca�y przemarz�em. 
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_10"); //Mia�em przyjaciela, nazywa� si� Truan.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_11"); //Przyni�s� mi grzane wino... A ja najzwyczajniej w �wiecie zasn��em.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_12"); //Orkowie przyszli przed �witem. Wyr�n�li wszystkich bez wyj�tku. 
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_13"); //To ja mam ich krew na r�kach!
	AI_Output 	(other,self,"DIA_Roderic_OldNote_15_14"); //Jeste� dla siebie zbyt surowy. Ka�demu mo�e si� zdarzy�...
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_15"); //...skaza� ca�� osad� na �mier�? Nie wiesz o czym m�wisz, �miertelniku.
	AI_Output 	(other,self,"DIA_Roderic_OldNote_15_16"); //Wybacz, chcia�em tylko...
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_17"); //Nigdy ju� nie zejd� z posterunku, b�d� tu trwa� do ko�ca �wiata.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_18"); //Cho� tak mog� odp�aci� za swoj� zbrodni�...
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_19"); //A teraz odejd�, chc� zosta� sam.
	B_LogEntry		(CH3_RBL_RodneyHelp, "W ruinach Wie�y Mgie� znalaz�em... ducha. Do tego do�� gadatliwego. Zjawa opowiedzia�a zdawkowo do�� smutn� histori�. Duch by� stra�nikiem, ale usn�� na posterunku, przez co orkowie wyr�n�li ca�� osad�. Nazwa� siebie zdrajc�. Mo�e to o nim m�wi�y orkowe zapiski? Musz� rozejrze� si� po Wie�y Mgie�, mo�e znajd� co� ciekawego.");

	/***********************************
Ding, wstawiamy mixtur� o nazawie dream_mixture gdzie� na pi�trze wie�y.
***********************************/
	Wld_InsertItem			(dream_mixture, "FP_RODMIXTURE");		
};

//---------------------------------------------------------------------
instance  DIA_Roderic_OldNote1(C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_OldNote1_Condition;
	information	= DIA_Roderic_OldNote1_Info;
	important	= 0;
	permanent	= 0;
	description	= "To nie z Twojej winy wtargn�li orkowie."; 
};

FUNC int  DIA_Roderic_OldNote1_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_baaltaran_GhostMixt))&&(Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC void  DIA_Roderic_OldNote1_Info()
{
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_01"); //To nie z Twojej winy wtargn�li orkowie.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote1_11_02"); //Fa�szywe wsp�czucie jest gorsze ni� najokrutniejsza zdrada. Odejd� zanim...
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_03"); //Zaczekaj. Znalaz�em w Wie�y flakonik. Kiedy� wype�nia�a go silna mikstura usypiaj�ca.
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_04"); //Tw�j przyjaciel poda� ci grzane wino. W tym specyfiku by�y trucizna, kt�r� najcz�ciej dodawano w�a�nie do napitk�w.
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_05"); //Do tego stoi za tym orkowa magia.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote1_11_06"); //Truan... To nie mo�liwe. Nie m�g�by...
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_07"); //Nikt uczciwy nie zrozumie motyw�w zdrajcy. To nie Ty masz na r�kach krew osadnik�w, tylko Truan.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote1_11_08"); //Mylisz si�! Nigdy nie uwierz� w jego zdrad�!
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_09"); //W porz�dku, nie upieram si�.
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_10"); //Wiesz gdzie sp�dza� czas za �ycia?
	AI_Output 	(self, hero,"DIA_Roderic_OldNote1_11_11"); //Wiem, �e zapuszcza� si� na tereny ork�w. Opowiada� mi kiedy� o starej nekropolii.
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_12"); //Wi�c mo�e tam znajd� co� co Ci� przekona. 
	AI_Output 	(self, hero,"DIA_Roderic_OldNote1_11_13"); //R�b co chcesz, a teraz zostaw mnie w spokoju...

	B_LogEntry	(CH3_RBL_RodneyHelp, "No to �adnie, cholerny duch mi nie wierzy, a do tego musz� znale�� orkow� nekropoli� i przeczesa� kurhany w poszukiwaniu �lad�w zdrady Turana. Ciekawe co b�dzie p�niej, Czarna �wi�tynia?");
	/********************
Wsadzamy ducha do nekropoli ork�w
***********************/
};

//---------------------------------------------------------------------
instance  DIA_Roderic_Hi(C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_Hi_Condition;
	information	= DIA_Roderic_Hi_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  DIA_Roderic_Hi_Condition()
{	
	if (Npc_KnowsInfo(other,Info_OrcGhost_Kill))&&(Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC void  DIA_Roderic_Hi_Info()
{
	B_GiveXP(500);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_01"); //Znowu czuj� ciep�o �miertelnej istoty.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_02"); //Nie poznajesz mnie? To ja pomagam Ci oczy�ci� imi� i zazna� spokoju.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_03"); //Dlaczego mia�bym sta� si� przewodnikiem na tej �cie�ce?
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_04"); //Ty naprawd� nic nie pami�tasz? 
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_05"); //Spotka�em ducha szamana na cmentarzysku Ork�w. Troch� rozmawiali�my, wyzna� mi prawd� o zdradzie Urksh'Esta, o tym, �e Truan Ci� u�pi�, a p�niej zdradzi� te� ork�w...
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_06"); //Argh, pami�� wraca. Ja... Nazywam si� Roderik. Przekl�te to imi�! Zdrada i krew...
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_07"); //Opowiesz mi co� wi�cej? Dlaczego orkowie zaatakowali wasz� osad�?
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_08"); //Szukali pot�nego artefaktu, nie wiedzieli�my, �e zak�adamy osad� w miejscu plugawej ka�ni.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_09"); //Wieki wcze�niej paladyn Innosa znalaz� pot�ny artefakt, miecz, kt�ry zosta� zamkni�ty w podziemiach, aby �aden �miertelnik nie posiad� jego niszczycielskiej mocy.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_10"); //Ostrze zosta�o konsekrowane na o�tarzu �ywio��w tysi�ce lat temu. 
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_11"); //W�r�d ork�w ten miecz by� bardziej znienawidzony ni� Uriziel. Orkowie napadli na osad�, �eby zniszczy� g�owni�.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_12"); //Niestety ostrze opar�o si� magii jak i �elazu.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_13"); //Wtedy Truan si�gn�� po miecz... Tak musia�o by�.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_14"); //Co sta�o si� z tym cz�owiekiem i ostrzem?
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_15"); //Nadal czekaj� na swoje przeznaczenie. �miertelnik dokona �ywota w cierpieniu, strach przeniknie jego serce niczym zimne ostrze i poch�onie go raz na zawsze.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_16"); //To z�o musi zosta� zniszczone! Tylko wtedy zaznam spokoju.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_17"); //Chwila. I Ty przez ca�y czas o tym wiedzia�e�? To po choler� by�a ta szopka z udowodnieniem winy zdrajcy?
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_18"); //Nie pami�tam... Widz� Ci� po raz pierwszy. Ale wyczuwam, �e m�wisz prawd�.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_19"); //Obawiam si�, �e czyny �miertelnik�w przywracaj� mi pami�� i zarazem niszcz� j�.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_20"); //Nie rozumiem...
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_21"); //Musia�e� uczyni� co�, co przybli�a moj� dusz� do bram odkupienia.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_22"); //Nie trwo�my czasu, wiem ju� dlaczego nadal trwam w tym �wiecie. 
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_23"); //Nadszed� czas abym poprowadzi� ci� Drog� Zag�ady.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_24"); //Co to za droga?
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_25"); //Przej�cie do katakumb jest naje�one pu�apkami, nazwali�my je Drog� Zag�ady. Do tej pory tylko Truan zdo�a� si� przez nie przedrze�.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_26"); //Zabi� orkowych szaman�w, ich krew utorowa�a mu drog�, ale zap�aci� za to najwy�sz� cen�. Kiedy si�gn�� po miecz by� ju� �miertelnie ranny.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_27"); //Staro�ytny rytua� nadal chroni miecz, ale tylko przed nieumar�ymi i ich aspektami. �ywy cz�owiek, jak Ty jest niewra�liwy na dzia�anie magii.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_28"); //Dlatego b�dziesz m�g� wej�� do podziemi. 
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_29"); //Jednak zanim Ci� poprowadz� musisz pom�c mi przed ostateczn� walk� z Truanem, ten zdrajca zap�aci za ca�e z�o, kt�re wyrz�dzi�.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_30"); //M�w czego potrzebujesz.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_31"); //W tej chwili jestem tylko piecz�ci�, kt�r� pozostawiono aby uwi�zi� z�o.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_32"); //Jednak ja tak�e pragn�... zemsty.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_33"); //Truan zabra� mi wszystko - honor, dum� i �ycie.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_34"); //Aby odzyska� to co straci�em musisz przynie�� mi m�j top�r - Ostrze Zmierzchu. Znajdziesz go w podziemiach tej wie�y.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_35"); //Kiedy zn�w dotkn� ostrza, kt�re s�u�y�o mi za �ycia odzyskam si�� aby stan�� do walki ze zdrajc�.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_36"); //Nie k�opocz si�, sam wy�l� tego sukinsyna do Beliara.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_37"); //Nie, �miertelniku. Teraz pami�tam ju� wszystko. Moja dusza sta�a si� cz�ci� rytua�u, kt�ry nie pozwala Truanowi stan�� po�r�d �miertelnych. 
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_38"); //Kiedy odzyskam top�r sp�ynie do niego ca�a moc rytua�u. Nawet Truan nie oprze si� takiej pot�dze.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_39"); //Jednak nic nie mo�e przeszkodzi� mi w walce ze z�em. Twoim zadaniem b�dzie strzec mych plec�w.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_40"); //Aby zwyci�y� musz� u�y� ca�ej swej woli. 
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_41"); //Pomo�esz mi �miertelniku?
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_42"); //A co ja b�d� z tego mia�?
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_43"); //Rozumiem, �e moja wolno�� i uwolnienie �wiata od z�a to zbyt ma�o?
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_44"); //Wybacz, ale mam pragmatyczn� natur�.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_45"); //Otrzymasz Miecz �ywio��w, �miertelniku. Od ciebie zale�y co z nim uczynisz.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_46"); //Wi�c co postanowisz?	
	B_LogEntry		(CH3_RBL_RodneyHelp, "Odby�em d�ug� rozmow� z duchem Roderika. Powiedzia� mi, �e aby zniszczy� Truana musz� odzyska� dla ducha jego stary top�r - ostrze zmierzchu. Nagrod� ma by� jaki� przekl�ty miecz. Nie wiem czy to dobry pomys� �eby miesza� si� w sprawy nieumar�ych, ale ten miecz... Pokusa jest zbyt du�a.");
}; 

//---------------------------------------------------------------------
instance  DIA_Roderic_Help (C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_Help_Condition;
	information	= DIA_Roderic_Help_Info;
	important	= 0;
	permanent	= 0;
	description		= "Pomog� Ci."; 
};

FUNC int  DIA_Roderic_Help_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Roderic_Hi))&&(Wld_IsTime (22,00,04,00))
	{
		return 1;
	};
};

FUNC void  DIA_Roderic_Help_Info()
{
	/*************************
	Ork daj jaki� fajny Wp, albo jedna z tych komnat gdzie by�y po��wki czar�w, albo katafalk tam gdzie na ko�cu walczy si� z tym �wirni�tym balem
	**************************/

	// 	Wld_InsertItem			(Urgal_Arth,"WP");
   Wld_InsertItem (GhostAxe1_RICK, "OW_FOGDUNGEON_39");

	AI_Output 	(other,self,"DIA_Roderic_Help_15_01"); //Pomog� Ci.
	AI_Output 	(self, hero,"DIA_Roderic_Help_11_02"); //Moja kl�twa dobiega wi�c ko�ca.
	AI_Output 	(self, hero,"DIA_Roderic_Help_11_03"); //Przynie� top�r, a wyruszymy �cie�k� Zag�ady, aby odnale�� nasze wsp�lne przeznaczenie.
	B_LogEntry		(CH3_RBL_RodneyHelp, "Musz� przynie�� Roderikowi jego top�r - ostrze zmierzchu, kt�ry znajd� gdzie� w podziemiach wie�y mgie�. Wtedy wyruszymy do walki ze z�em.");
};

//---------------------------------------------------------------------
instance  DIA_Roderic_Axe (C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_Axe_Condition;
	information	= DIA_Roderic_Axe_Info;
	important	= 0;
	permanent	= 0;
	description		= "Mam top�r."; 
};

FUNC int  DIA_Roderic_Axe_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Roderic_Help))&&(Wld_IsTime (22,00,04,00))&&(NPC_HasItems(other,GhostAxe1_RICK)>=1)
	{
		return 1;
	};
};

FUNC void DIA_Roderic_Axe_Info()
{
	B_GiveXP(500);
	AI_Output 	(other,self,"DIA_Roderic_Axe_15_01"); //Mam top�r.
	AI_Output 	(self, hero,"DIA_Roderic_Axe_11_02"); //Czuj� brzemi� wspomnie�...
	B_GiveInvItems (other, self, GhostAxe1_RICK, 1);
	Npc_RemoveInvItem (self, GhostAxe1_RICK);
	CreateInvItems (self, GhostAxe1, 1);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_Output 	(self, hero,"DIA_Roderic_Axe_11_03"); //Moc rytua�u sp�yn�a na ostrze. Ruszajmy, niech dokona si� przeznaczenie!
	B_LogEntry		(CH3_RBL_RodneyHelp, "Odda�em Roderikowi top�r. Czeka nas przeprawa przez �cie�k� us�an� pu�apkami i walka z jakim� nieumar�ym szale�cem. No c�, sam tego chcia�em...");
	Party_AddNpc(self);
	B_StopProcessInfos	(self);
	AI_RemoveWeapon		(self);
	Npc_ExchangeRoutine	(self, "Guide");
};

instance DIA_Roderic_Wheel(C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_Wheel_Condition;
	information	= DIA_Roderic_Wheel_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int DIA_Roderic_Wheel_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Roderic_Axe)) && (Npc_GetDistToWP(hero, "OW_PATH_175_GATE1") < 500)
	{
		return 1;
	};
};

func void DIA_Roderic_Wheel_Info()
{
   AI_Output(other, self, "DIA_Roderic_Wheel_15_01"); //Chyba o czym� zapomnia�e�... Nie jestem duchem tak jak ty i nie przejd� przez kraty...
   AI_Output(self, other, "DIA_Roderic_Wheel_15_02"); //Rzeczywi�cie... Patrz! Tam jest ko�owr�t. Poczekaj tu na mnie, a ja otworz� bram�!
   
   B_StopProcessInfos(self);
};

//---------------------------------------------------------------------
instance  DIA_Roderic_Fight(C_INFO)
{
	npc			= RodericMD;
	condition	= DIA_Roderic_Fight_Condition;
	information	= DIA_Roderic_Fight_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  DIA_Roderic_Fight_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Roderic_Axe))&&(Npc_GetDistToWP (self,"URKSH") < 800 )
	{//AS CINEMATIC SO THIS DIALOG STAY UNUSED
		return 0;
	};
};

FUNC void  DIA_Roderic_Fight_Info()
{
	var C_NPC urk; urk = Hlp_GetNpc(NON_4072_Urksh);

	B_FullStop (hero);
	AI_TurnToNpc (other, urk);
	AI_GotoNpc(self, urk);
	AI_Output 	(urk, self, "DIA_Roderic_Fight_11_01"); //W ko�cu jaki� g�upiec doszed� a� tutaj. Kiedy wypij� krew tego �miertelnika, b�d� wolny! 
	AI_Output 	(self, urk,"DIA_Roderic_Fight_11_02"); //Najpierw b�dziesz musia� przej�� przeze mnie, zdrajco!
	AI_Output 	(urk, self, "DIA_Roderic_Fight_11_03"); //Pami�tam Ci�... Roderik, to dzi�ki Twojej naiwno�ci zdoby�em Miecz �ywio��w.
	AI_Output 	(self, urk,"DIA_Roderic_Fight_11_04"); //Wystarczy ju� s��w - gi� bestio!
	B_LogEntry		(CH3_RBL_RodneyHelp, "Czas na ostateczn� walk� ze z�em.");
	Party_RemoveNpc(self);
	B_StopProcessInfos	(self); 

	/***************************
	Ork niech przed walk� dick odejdzie gdzie�. Najlepiej, �eby nie m�g� pom�c w walce. Dopiero jak Irshakk wygra lub przegra m�g�by znowu tam podej��
	***************************/

	AI_GotoWP		(other, "urksh_out");

	/**************************
	Podczas walki niech dicka zaatakuj� jacy� nieumarli, �eby si� nie zanudzi�
	*************************/
	//monsters_attack ();

	AI_DrawWeapon		(self);
	B_StartAfterDialogFight(self,urk,false);
	B_StartAfterDialogFight(urk,self,false);

	Npc_SetPermAttitude	(urk, ATT_HOSTILE);
};

instance DIA_RodericMD_Hi(C_INFO)
{
	npc			= RodericMD;
	condition	= DIA_RodericMD_Hi_Condition;
	information	= DIA_RodericMD_Hi_Info;
	important	= 1;
	permanent	= 0;
	nr			= 1;
};

FUNC int DIA_RodericMD_Hi_Condition()
{	
	return 1;
};

FUNC void DIA_RodericMD_Hi_Info()
{
	B_GiveXP(250);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output(self, hero,"DIA_RodericMD_Hi_11_01"); //Aby p�j�� dalej, musimy otworzy� te wrota.
	AI_Output(self, hero,"DIA_RodericMD_Hi_11_02"); //Po lewej stronie znajdziesz kamienny prze��cznik.
	AI_Output(other,self,"DIA_RodericMD_Hi_15_03"); //Do dzie�a!
	AI_SetWalkmode(self,NPC_RUN);
	Npc_ExchangeRoutine(self,"TURNSWITCH");
	B_LogEntry(CH3_RBL_RodneyHelp, "Jeste�my coraz bli�ej Truana.");
	B_StopProcessInfos(self); 
};

instance DIA_RodericMD_ENDE(C_INFO)
{
	npc			= RODERICMD;
	condition	= DIA_RodericMD_ENDE_Condition;
	information	= DIA_RodericMD_ENDE_Info;
	important	= 0;
	permanent	= 1;
	nr			= 999;
	description	= DIALOG_ENDE; 
};

FUNC int  DIA_RodericMD_ENDE_Condition()
{	
	return 1;
};

FUNC void  DIA_RodericMD_ENDE_Info()
{
	B_StopProcessInfos(self); 
};

//---------------------------------------------------------------------
instance  DIA_RodericMD_Thx(C_INFO)
{
	npc			= RodericMD;
	condition	= DIA_Roderic_Thx_Condition;
	information	= DIA_Roderic_Thx_Info;
	important	= 1;
	permanent	= 0;
	nr			= 2;
};

FUNC int  DIA_Roderic_Thx_Condition()
{	
	var C_NPC tru; tru = Hlp_GetNpc(Truan);
	//print_s_i("Npc_IsDead(tru)",Npc_IsDead(tru));
	if (Npc_IsDead(tru)) && (talking_with_Truan)
	{
		return 1;
	};
};

FUNC void  DIA_Roderic_Thx_Info()
{
	B_GiveXP(3000);
	B_FullStop (hero);
	AI_TurnToNpc (self, other);
	AI_GotoNpc(other, self);
   
	AI_Output 	(self, other, "DIA_Roderic_Thx_11_01"); //Z�o zosta�o pokonane...
	AI_Output 	(self, other, "DIA_Roderic_Thx_11_02"); //Odkupi�em swoje winy.
	AI_Output 	(other, self, "DIA_Roderic_Thx_15_03"); //Odejd� w pokoju, Roderik.
	AI_Output 	(self, other, "DIA_Roderic_Thx_11_04"); //Dzi�kuj�. Zas�u�y�e� na te ostrze.
	
	// �wie�e by ork: miecz si� pojawia, a nie daje go Roderic
	// CreateInvItems (self, ItMw_2H_RuneSWD_01, 1);
	// B_GiveInvItems (self, other, ItMw_2H_RuneSWD_01, 1);
   
	MD_InsertMR = true;
	
	/*********************************
	Ork mo�naby tutaj da� pojawienie si� tego miecza, niech dick si� spojrzy w tamt� stron�, etc. Irshakk po gadce niech efektowanie zniknie
	********************************/

	AI_Output(self, other, "DIA_Roderic_Thx_11_05"); //Niech bogowie strzeg� twych �cie�ek za �ycia jak i za �mierci.
	B_LogEntry(CH3_RBL_RodneyHelp, "Truan zosta� pokonany. Duch Roderika pozostawi� mi miecz. S�dz�, �e ta nagroda jest a� nazbyt hojna.");
	B_StopProcessInfos(self); 
};