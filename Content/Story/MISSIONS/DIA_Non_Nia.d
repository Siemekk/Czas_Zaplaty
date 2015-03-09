
// ************************************************************
//                           EXIT 
// ************************************************************


INSTANCE Info_Nia_EXIT(C_INFO)
{
   npc         = Non_660_Nia;
   nr         = 999;
   condition         = Info_Nia_EXIT_Condition;
   information         = Info_Nia_EXIT_Info;
   permanent         = 1;
   description       = DIALOG_ENDE;
};                       

FUNC INT Info_Nia_EXIT_Condition()
{
   return 1;
};

FUNC VOID Info_Nia_EXIT_Info()
{   
   B_StopProcessInfos   (self);
};

// ************************************************************
//       Hello
// ************************************************************

INSTANCE Info_Nia_Hello (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Hello_Condition;
   information      = Info_Nia_Hello_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Hello_Condition()
{   
   if (Npc_KnowsInfo (hero, Info_Kris_Hello2))&&(Npc_GetDistToNpc(self,hero) < 600)
   {
      return 1;
   };

};
FUNC VOID Info_Nia_Hello_Info()
{   
   var C_NPC man; man = Hlp_GetNpc(SLV_640_Slave);

   B_FullStop (hero);
   AI_GotoNpc(other,self);
   AI_TurnToNpc (self, man);
   AI_Output (self, other,"Info_Nia_Hello_16_01"); //Nie dam rady sama. Pom� mi, przytrzymaj g�ow�. Musz� poda� mu mikstur�...
   AI_Output (other, self,"Info_Nia_Hello_15_02"); //Zrobi� co w mojej mocy.
   B_StopProcessInfos   (self);
   AI_GotoWP          (self,   "NIA_GO");
   AI_GotoWP          (hero,   "NC_EN_MAINPATH_05_01");
   AI_AlignToWP      (self);
   AI_AlignToWP      (other);
   AI_PlayAni         (self,   "T_PLUNDER");
   AI_PlayAni         (hero,   "T_PLUNDER");

   /*********************************
Dick i Nia maj� zbli�y� si� do le��cego (najlepiej, �eby nie m�g� wsta�, gada�, etc. czyli jak ta rutyna xardasa po u�ni�ciu)
Niech zbli�� si� w r�ne miejsca, Nia od strony g�owy, Dick nogi.

********************************/

};

// ************************************************************

INSTANCE Info_Nia_Again (C_INFO)
{
   npc         = Non_660_Nia;
   nr         = 2;
   condition      = Info_Nia_Again_Condition;
   information      = Info_Nia_Again_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Again_Condition()
{   

   if (Npc_KnowsInfo (hero, Info_Nia_Hello))&& (Npc_GetDistToNpc(self,hero) < 600)
   {
      return 1;
   };

};
FUNC VOID Info_Nia_Again_Info()
{   
   var C_NPC geo; geo = Hlp_GetNpc(Grd_611_Gardist);

   B_FullStop (hero);
   AI_TurnToNpc (other, self);
   AI_Output (self, other,"Info_Nia_Again_16_01"); //Ci�ko z nim. Chyba nie przetrzyma nocy.
   AI_Output (other, self,"Info_Nia_Again_15_02"); //Co si� sta�o?
   AI_Output (self, other,"Info_Nia_Again_16_03"); //To kolejna ofiara. Kris nikogo nie wypuszcza z twierdzy, za wszelk� cen� chce znale�� sprawc�.
   AI_Output (other, self,"Info_Nia_Again_15_04"); //A cen� s� �ycia kolejnych ofiar.
   AI_Output (self, other,"Info_Nia_Again_16_05"); //Niestety. Jedyne co mog� zrobi� to ul�y� cierpieniom konaj�cych. Ka�da rana jest zadana z chirurgiczn� precyzj� i ka�da jest �miertelna.
   AI_Output (other, self,"Info_Nia_Again_15_06"); //D�ugo to trwa?
   AI_Output (self, other,"Info_Nia_Again_16_07"); //Odk�d Hrabia opu�ci� Gniazdo. Nikt zdrowy na umy�le nie zabija�by bli�nich...
   AI_Output (other, self,"Info_Nia_Again_15_08"); //Hmm. Na pewno ma jaki� pow�d.
   AI_Output (self, other,"Info_Nia_Again_16_09"); //Nie rozumiem.
   AI_Output (other, self,"Info_Nia_Again_15_10"); //Mieli�my kiedy� na statku podobny przypadek. Gin�li marynarze. 
   AI_Output (other, self,"Info_Nia_Again_15_11"); //Jak si� okaza�o, to kucharz wyrzuca� za burt� tych, kt�rzy drwili z jego potraw.
   AI_Output (other, self,"Info_Nia_Again_15_12"); //Przeci�gn�li�my sukinsyna pod kilem.
   AI_Output (other, self,"Info_Nia_Again_15_13"); //Niestety, nast�pca gotowa� tak paskudnie, �e w�asnor�cznie wyrzuci�em go za burt�. Ca�e szcz�cie, �e akurat zawin�li�my do portu.
   AI_Output (self, other,"Info_Nia_Again_16_14"); //Ciekawa historia. Jeste� marynarzem?
   AI_Output (other, self,"Info_Nia_Again_15_15"); //Mo�na tak powiedzie�. 
   AI_Output (other, self,"Info_Nia_Again_15_16"); //S�uchaj, musz� wyrwa� si� z tego wi�zienia. Mo�esz mi pom�c?
   AI_Output (self, other,"Info_Nia_Again_16_17"); //Sama jestem tu je�cem. Pilnuje mnie ten drab Georg. Nie odst�puje mnie na krok.
   AI_Output (other, self,"Info_Nia_Again_15_18"); //Jak tu trafi�a�?
   AI_Output (self, other,"Info_Nia_Again_16_19"); //To proste. Znudzi�am si� Gomezowi, ten odda� mnie Krukowi.
   AI_Output (self, other,"Info_Nia_Again_16_20"); //Ale magnata nie interesowa� m�j ty�ek. Wpad�am w oko Hrabiemu i tak znalaz�am si� tutaj.
   AI_Output (other, self,"Info_Nia_Again_15_21"); //Przykro mi...
   AI_Output (self, other,"Info_Nia_Again_16_22"); //Nie jest tak �le. Mo�na si� przyzwyczai�. Przynajmniej nikt mnie ju� nie bije.
   AI_Output (other, self,"Info_Nia_Again_15_23"); //Mo�e uciekniesz razem ze mn�?
   AI_Output (self, other,"Info_Nia_Again_16_24"); //I co dalej? Komu b�d� musia�a us�ugiwa�, �eby dali mi �y�?
   AI_Output (self, other,"Info_Nia_Again_16_25"); //Tu przynajmniej nie musz� trzyma� no�a pod siennikiem. 
   AI_Output (self, other,"Info_Nia_Again_16_26"); //Dzi�kuj� za propozycj�, ale nie skorzystam.
   AI_Output (other, self,"Info_Nia_Again_15_27"); //Rozumiem.
   AI_Output (self, other,"Info_Nia_Again_16_28"); //Ale mo�e zdo�am pom�c Tobie. 
   AI_Output (other, self,"Info_Nia_Again_15_29"); //Ca�y zamieniam si� w s�uch.
   AI_Output (self, other,"Info_Nia_Again_16_30"); //Musz� si� zastanowi�. Tymczasem porozmawiaj z niemow�, powiedz, �e potrzebuj� czystych szmat na opatrunki.
   AI_Output (other, self,"Info_Nia_Again_15_31"); //Co to za niemowa?
   AI_Output (self, other,"Info_Nia_Again_16_32"); //M�wi� na niego Znami�. Kr�ci si� w pobli�u.
   AI_Output (other, self,"Info_Nia_Again_15_33"); //W porz�dku, nied�ugo wr�c�.

   Log_CreateTopic   (CH4_Non_NiaHelp, LOG_MISSION);
   Log_SetTopicStatus   (CH4_Non_NiaHelp, LOG_RUNNING);
   B_LogEntry      (CH4_Non_NiaHelp, "Pozna�em Ni�, kobiet� Herszta. Pomo�e mi wydosta� si� z Gniazda. Nie podoba mi si� to, co si� tutaj dzieje. Jaki� psychopata zabija innych. Musz� znale�� kolesia o imieniu Znami� i przynie�� felczerce czyste szmaty na opatrunki.");
   Npc_ExchangeRoutine   (self,"start");
   Npc_ExchangeRoutine   (geo,"start");
};

// ************************************************************

INSTANCE Info_Nia_Again1 (C_INFO)
{
   npc         = Non_660_Nia;
   nr         = 3;
   condition      = Info_Nia_Again1_Condition;
   information      = Info_Nia_Again1_Info;
   important      = 0;
   permanent      = 0;
   description       = "Mam szmaty na banda�e.";
};                       

FUNC INT Info_Nia_Again1_Condition()
{   
   if (Npc_KnowsInfo (hero, Info_Nia_Hello))&&(NPC_HasItems(other,EN_Bandage)>=1)
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Again1_Info()
{   
   var C_NPC sti; sti = Hlp_GetNpc(Grd_614_Gardist);
   Npc_ExchangeRoutine   (sti,"WATCH");
   
   var C_NPC geo; geo = Hlp_GetNpc(Grd_611_Gardist);
   Npc_ExchangeRoutine   (geo,"PRESTART");
   
   AI_Output (other, self,"Info_Nia_Again1_15_00"); //Mam szmaty na banda�e.
   AI_Output (self, other,"Info_Nia_Again1_16_01"); //Najwy�sza pora, przewi��� rany temu biedakowi...
   B_GiveInvItems(other,self,EN_Bandage,1);
   Npc_RemoveInvItems(self,EN_Bandage,1);
   Log_SetTopicStatus   (CH4_Non_NiaHelp, LOG_SUCCESS);
   B_LogEntry      (CH4_Non_NiaHelp, "Przynios�em szmaty na banda�e, mo�e teraz Nia zechce mi pom�c.");
   B_StopProcessInfos   (self);
   AI_GotoWP          (self,   "NIA_GO");
   AI_GotoWP          (hero,   "NC_EN_MAINPATH_05_01");
   AI_AlignToWP      (self);
   AI_AlignToWP      (other);
   AI_PlayAni         (self,   "T_PLUNDER");
   AI_PlayAni         (hero,   "T_PLUNDER");
};

// ************************************************************

INSTANCE Info_Nia_Def (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Def_Condition;
   information      = Info_Nia_Def_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Def_Condition()
{   
   if (Npc_KnowsInfo (hero, Info_Nia_Again1))&& (Npc_GetDistToNpc(self,hero) < 600)
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Def_Info()
{   
   var C_NPC sti; sti = Hlp_GetNpc(Grd_614_Gardist);
   var C_NPC geo; geo = Hlp_GetNpc(Grd_611_Gardist);
   var C_NPC man; man = Hlp_GetNpc(SLV_640_Slave);
   B_FullStop (hero);
   AI_GotoNpc(other,self);
   AI_TurnToNpc (self, geo);
   AI_Output (self, other,"Info_Nia_Def_16_01"); //Bardzo mi pomog�e�, mam nadziej�, �e ten biedny...
   AI_TurnToNpc (self, sti);
   AI_Output (other, self,"Info_Nia_Def_15_02"); //Co si� dzieje?
   AI_TurnToNpc (sti, self);
   AI_Output (self, other,"Info_Nia_Def_16_01"); //Znami� oszala�. Georg!

   B_StopProcessInfos   (self);
   AI_GotoWP          (sti,   "NIA_INSPECT");
   AI_GotoWP          (geo,   "NC_EN_TAVERN_ONFRONT");
   AI_AlignToWP      (self);
   AI_AlignToWP      (other);

   /*********************************
Znami� i Georg maj� podej�� do Nii.

********************************/
   Npc_ExchangeRoutine   (man,"start");   
};

// ************************************************************

INSTANCE Info_Nia_Def1 (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Def1_Condition;
   information      = Info_Nia_Def1_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Def1_Condition()
{   
   if (Npc_KnowsInfo (hero, Info_Georg_Again2))&& (Npc_GetDistToNpc(self,hero) < 600)
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Def1_Info()
{   
   B_FullStop (hero);
   AI_GotoNpc(other,self);
   AI_TurnToNpc (self, other);
   AI_Output (self, other,"Info_Nia_Def1_16_01"); //To by�o straszne... Znami� kompletnie postrada� zmys�y.
   AI_Output (other, self,"Info_Nia_Def1_15_02"); //Wygl�da� zupe�nie normalnie.
   AI_Output (self, other,"Info_Nia_Def1_16_03"); //Jak mo�esz tak m�wi�?! On chcia� mnie zabi�!
   AI_Output (other, self,"Info_Nia_Def1_15_04"); //Wybacz, nie to mia�em na my�li. 
   AI_Output (other, self,"Info_Nia_Def1_15_05"); //Kiedy z nim rozmawia�em sprawia� wra�enie przera�onego, ale nie szalonego.
   AI_Output (self, other,"Info_Nia_Def1_16_06"); //To ponad moje si�y, musz� odpocz��...
   AI_Output (other, self,"Info_Nia_Def1_15_07"); //Oczywi�cie, ale co z nasz� umow�?
   AI_Output (self, other,"Info_Nia_Def1_16_08"); //Nie masz serca, w�a�nie cudem unikn�am �mierci, a Ty my�lisz tylko o sobie...
   AI_Output (other, self,"Info_Nia_Def1_15_09"); //Wybacz, ja...
   AI_Output (self, other,"Info_Nia_Def1_16_10"); //Wr�� jutro, wtedy dotrzymam s�owa. A teraz zostaw mnie sam�.
   AI_Output (other, self,"Info_Nia_Def1_15_11"); //Oczywi�cie, bywaj.
   B_LogEntry      (CH4_Non_Eagle, "To miejsce jest co najmniej dziwne. W�a�nie by�em �wiadkiem jak niemowa rzuci� si� na kobiet� i chcia� j� zabi�. Mo�e i nie by�oby w tym nic dziwnego, gdyby nie wyraz jego twarzy. On si� ba�, wygl�da�, tak jakby spojrza� w oblicze �mierci.");
   B_LogEntry      (CH4_Non_Eagle, "Nia pomo�e mi jutro, w mi�dzyczasie mog� rozejrze� si� po twierdzy.");

   /****************************
Ork niech Nia p�jdzie spa� gdzie�, a Georg niech stoi przed wje�ciem do tego miejsca �eby nikt jej nie przeszkadza�.

****************************/
   nia_rest = B_SetDayTolerance()+1;
   B_StopProcessInfos   (self);
};

// ************************************************************

INSTANCE Info_Nia_Meet (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Meet_Condition;
   information      = Info_Nia_Meet_Info;
   important      = 0;
   permanent      = 0;
   description       = "Jak si� czujesz?";
};                       

FUNC INT Info_Nia_Meet_Condition()
{   
   if (Npc_KnowsInfo (hero,Info_Pinto_Warn1))&&(nia_rest <= (Wld_GetDay()))
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Meet_Info()
{   
   AI_Output (other, self,"Info_Nia_Meet_15_01"); //Jak si� czujesz?
   AI_Output (self, other,"Info_Nia_Meet_16_02"); //Ju� lepiej. Bardzo to prze�y�am. Biedny niemowa...
   AI_Output (other, self,"Info_Nia_Meet_15_03"); //Dobrze, �e Georg go powstrzyma�. Nie chcia�bym, �eby zrobi� Ci krzywd�.
   AI_Output (self, other,"Info_Nia_Meet_16_04"); //Naprawd�? Odnios�am zupe�nie inne wra�enie...
   AI_Output (other, self,"Info_Nia_Meet_15_05"); //Wybacz, pomyli�em si�. Nigdy w �yciu nie widzia�em tak pi�knej kobiety, twa uroda przy�mi�a mi umys�.
   AI_Output (self, other,"Info_Nia_Meet_16_06"); //Jeste� bardzo mi�y. Potrafisz pi�knie m�wi�, prawie jak Hrabia.
   AI_Output (other, self,"Info_Nia_Meet_15_07"); //Odk�d Ci� ujrza�em, nie mog� my�le� o niczym innym. Jeste� jak letnia mgie�ka w�r�d traw i kwiat�w.
   AI_Output (self, other,"Info_Nia_Meet_16_08"); //Jeszcze nikt... Nie przerywaj!
   AI_Output (other, self,"Info_Nia_Meet_15_09"); //M�g�bym spija� nektar s�odyczy spomi�dzy Twych ud, m�g�bym...
   AI_Output (self, other,"Info_Nia_Meet_16_10"); //Wystarczy ju� tego be�kotu. B�d� czeka�a po zmierzchu, mam nadziej�, �e mnie znajdziesz.
   AI_Output (other, self,"Info_Nia_Meet_15_11"); //Mo�esz by� tego pewna, o najdro�sza.
   AI_Output (self, other,"Info_Nia_Meet_16_12"); //A teraz odejd�, nie chc� wzbudza� podejrze�.
   B_LogEntry      (CH4_Non_Eagle, "Nia spotka si� ze mn� po zmroku. Musz� jeszcze zebra� reszt� widowni.");

   /************************************
Ork zmiej jej teraz rutyn�, �eby pomi�dzy 23 a 4 sta�� gdzie� w ustronnym miejscu.

*********************************/

   Npc_ExchangeRoutine   (self,"WAIT");   
};

//  Info_Seven_MystEnd1  
//  Info_Bartender_StigmaMeet   
//  Info_Pinto_Warn1  
//  Info_Ormus_MeetAgain  

// ************************************************************

INSTANCE Info_Nia_Meet1 (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Meet1_Condition;
   information      = Info_Nia_Meet1_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Meet1_Condition()
{   
   if (Npc_KnowsInfo (hero,Info_Nia_Meet))&& (Wld_IsTime (22,00,04,00)&& (Npc_GetDistToNpc(self,hero) < 600))
   &&(Npc_KnowsInfo (hero, Info_Seven_MystEnd1))&&(Npc_KnowsInfo (hero, Info_Bartender_StigmaMeet))&&(Npc_KnowsInfo (hero, Info_Ormus_MeetAgain))&&(Npc_KnowsInfo (hero, Info_Pinto_Warn1))
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Meet1_Info()
{   
   var C_NPC seven; seven = Hlp_GetNpc(Grd_613_Gardist);

   B_FullStop (hero);
   AI_GotoNpc(other,self);
   AI_Output (self, other,"Info_Nia_Meet1_16_01"); //W ko�cu przyszed�e�!
   AI_Output (other, self,"Info_Nia_Meet1_15_02"); //W blasku gwiazd wygl�dasz jak zjawa, kt�ra...
   AI_Output (self, other,"Info_Nia_Meet1_16_03"); //Nie przyszli�my tu rozmawia�. Wiesz, czego chc�!

   AI_Output (self, other,"Info_Nia_Meet1_16_04"); //Widzia�am kogo� w cieniu! 
   AI_Output (other, self,"Info_Nia_Meet1_15_05"); //Wydawa�o Ci si�, nie przestawaj...
   AI_Output (self, other,"Info_Nia_Meet1_16_06"); //Widz� twarz! To...
   B_StopProcessInfos   (self);
   AI_TurnToNpc (self, seven);
   AI_SetWalkmode(self,NPC_RUN); 
   AI_GotoNpc(seven, self);
   //Az boje sie sprawdzac poprawnosc tego questa w grze ;D
}; 

// ************************************************************

INSTANCE Info_Nia_Meet12 (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Meet12_Condition;
   information      = Info_Nia_Meet12_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Meet12_Condition()
{   
   if (Npc_KnowsInfo (hero,Info_Nia_Meet1))&& (Wld_IsTime (22,00,04,00)&& (Npc_GetDistToNpc(self,hero) < 600))
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Meet12_Info()
{   
   B_FullStop (hero);
   AI_GotoNpc(other,self);
   AI_Output (self, other,"Info_Nia_Meet12_16_01"); //Nie!!!

   B_StopProcessInfos(self);
   //self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX] - self.attribute[ATR_HITPOINTS_MAX];

   B_LogEntry(CH4_Non_Eagle, "Si�demka zabi� Ni�!");
};
