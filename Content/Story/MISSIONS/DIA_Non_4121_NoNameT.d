
instance  DIA_NonameT_Hi (C_INFO)
{
	npc				= Nameless_Temple;
	condition		= DIA_NonameT_Hi_Condition;
	information		= DIA_NonameT_Hi_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int  DIA_NonameT_Hi_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, Info_XardasOT_OT))
	{			
		return TRUE;
	}; 
};
FUNC void  DIA_NonameT_Hi_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_01"); //Zgadzam si� z Xardasem, demon musi zosta� powstrzymany za wszelk� cen�!
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_02"); //Nawet za cen� Twojego �ycia?
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_03"); //Nie ma innego wyj�cia, poza tym zawsze spadam na cztery �apy. Jeszcze zobaczysz mnie na tronie Rhobara!
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_04"); //A co je�eli Xardas nie powiedzia� Ci ca�ej prawdy?
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_05"); //Wiem jedno. Je�eli zniszcz� �ni�cego, to szlag trafi barier�. Wi�cej do szcz�cia mi nie potrzeba jak wydosta� si� z tej cholernej Kolonii.
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_06"); //O ile prze�yjesz. Ale masz racj�. Barier� trzeba zniszczy�.
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_07"); //Pos�uchaj. Wiem, �e nie znamy si� zbyt dobrze, ale wi�cej w nas podobie�stw ni� oboje chcieliby�my przyzna�.
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_08"); //Raczej przeciwie�stw. Jeste�my szalami tej samej wagi i dobrze o tym wiesz.
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_09"); //I lepiej niech tak pozostanie. Ja zrobi� swoje, Rick. Ty sam zdecyduj, ale pami�taj, �e czasem trzeba wybra� mniejsze z�o.
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_10"); //S�owo jednego nekromanty przeciwko drugiemu. Jeste�my w czarnej dupie Beliara!
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_11"); //Powodzenia Bezimienny i nie daj si� zabi�. Przynajmniej nie za szybko.
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_12"); //Tego mo�esz by� pewien. Bywaj, piracie.
	AI_DrawWeapon (self);
	Log_SetTopicStatus	(CH1_Rbl_NoName, LOG_SUCCESS);
	B_LogEntry		(CH1_Rbl_NoName, "Znajomo�� z Bezimiennym zako�czy�a si� tak samo jak si� rozpocze�a, czyli nagle. Mam nadziej�, �e uda mu si� odes�a� tego �ni�cego do cuchn�cej nory Beliara. Czas zaj�� si� swoimi sprawami.");
	B_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "INVISIBLE"); 
   AI_SetWalkmode(self, NPC_RUN);
	AI_GotoWP		(self, "TPL_022");
};  
