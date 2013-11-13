//-------------------------------
// RTG_BS_POOR_SWD();
//-------------------------------
func void RTG_BS_POOR_SWD()
{
	var string productname;
	var string productamount;
	var string itm1name;
	var int itm1amount;		
	var string itm2name;
	var int itm2amount;	
	var string itm3name;
	var int itm3amount;	
	var string itm4name;
	var int itm4amount;	
	var string itm5name;
	var int itm5amount;	
	var string itm6name;
	var int itm6amount;		
	var string itm7name;
	var int itm7amount;	
	var string itm8name;
	var int itm8amount;	
	var string itm9name;
	var int itm9amount;	
	var string itm10name;
	var int itm10amount;		
	var string itm11name;
	var int itm11amount;	
	var string author;
	var int nDocID;
	var string str;
	author="Kowal Crimson";
	R_GetItem(recept_inuse);					
	productname = Get_Product_Name();
	productamount = Get_Product_Amount();
	itm1name	= Get_needitm0_Name();  
	itm1amount	= item.needitm_amount[0];
	itm2name	= Get_needitm1_Name();  
	itm2amount	= item.needitm_amount[1];
	itm3name	= Get_needitm2_Name();  
	itm3amount	= item.needitm_amount[2];
	itm4name	= Get_needitm3_Name();  
	itm4amount	= item.damage[0];
	itm5name	= Get_needitm4_Name();  
	itm5amount	= item.damage[1];
	itm6name	= Get_needitm5_Name();  
	itm6amount	= item.damage[2];	
	itm7name	= Get_needitm6_Name();  
	itm7amount	= item.damage[3];
	itm8name	= Get_needitm7_Name();  
	itm8amount	= item.damage[4];
	itm9name	= Get_needitm8_Name();  
	itm9amount	= item.damage[5];	
	itm10name	= Get_needitm9_Name();  
	itm10amount	= item.damage[6];
	itm11name	= Get_needitm10_Name();  
	itm11amount	= item.damage[7];	
	nDocID = 	Doc_Create		();								// DocManager 
	Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
	Doc_SetFont 	( nDocID,  0, "font_10_book.tga");	
	Doc_SetMargins	( nDocID, -1, 40, 50, 50, 50, 2   		);  //  0 -> margins are in pixels 
	str = ConcatStrings("Chcesz wykona� prosty miecz, taki jak ",productname);
	str = ConcatStrings(str,"?");	
	str = ConcatStrings(str," Nic prostszego. ");		
	Doc_PrintLines	( nDocID,  0, str);		
	str = "";		
	if(item.needitm[1] != 0)||(item.needitm[2] != 0)
	{
		str = ConcatStrings(str,"Wrzucasz do paleniska");
		if(item.needitm[1] != 0)
		{
			str = ConcatStrings(str," ");	
			if(itm2amount != 1)
			{									
				str = ConcatStrings(str,B_NumToString(itm2amount));	
				str = ConcatStrings(str," kawa�k�w ");	
			}
			else
			{
				str = ConcatStrings(str," kawa�ek ");					
			};
			str = ConcatStrings(str,itm2name);					
			
		};
		if(item.needitm[2] != 0)
		{ 
			if(item.needitm[1] != 0)
			{
				str = ConcatStrings(str," do tego jeszcze troch� ");
				str = ConcatStrings(str,itm3name);
				if(itm3amount != 1)
				{		
					str = ConcatStrings(str," najlepiej ");					
					str = ConcatStrings(str,B_NumToString(itm3amount));		
				};						
			}
			else
			{
				str = ConcatStrings(str," ");									
				str = ConcatStrings(str,B_NumToString(itm3amount));	
				str = ConcatStrings(str," kawa�k�w ");	
				str = ConcatStrings(str,itm3name);	
			};								
		};		
		str = ConcatStrings(str,". ");	
		Doc_PrintLines	( nDocID,  0, str);						
		str = "";	
	};
	
	if(item.needitm[0] != 0)
	{
		str = ConcatStrings("Bierzesz w �ap� pierwszy lepszy kawa�ek ",itm1name);	
		str = ConcatStrings(str," i rozgrzewasz do bia�o�ci. K�adziesz go rozgrzan� cz�ci� na kowad�o i walisz m�otem tak d�ugo, a� klinga stanie si� p�aska");			
	};	
	
	if(item.protection[0] != 0)||(item.protection[1] != 0)
	{
		str = ConcatStrings(str,", bez");
		if(item.protection[0] != 0)
		{
			str = ConcatStrings(str," ");	
			if(itm4amount != 1)
			{					
				str = ConcatStrings(str,B_NumToString(itm4amount));	
				str = ConcatStrings(str," ");	
			};
			str = ConcatStrings(str,itm4name);					
			
		};
		if(item.protection[1] != 0)
		{ 
			if(item.protection[0] != 0)
			{
				str = ConcatStrings(str," i ");
				if(itm5amount != 1)
				{	
					str = ConcatStrings(str,B_NumToString(itm5amount));	
					str = ConcatStrings(str," ");	
				};									
				str = ConcatStrings(str,itm5name);								
			}
			else
			{
				str = ConcatStrings(str," ");
				if(itm5amount != 1)
				{
					str = ConcatStrings(str,B_NumToString(itm5amount));	
					str = ConcatStrings(str," ");	
				};									
				str = ConcatStrings(str,itm5name);	
			};								
		};		
		str = ConcatStrings(str," bro� nie nada si� do niczego. ");	
		Doc_PrintLines	( nDocID,  0, str);						
		str = "";	
	}
	else
	{
		str = ConcatStrings(str,". ");	
	};
	
	
	if(item.protection[2] != 0)
	{
		str = ConcatStrings(str,"Teraz z");
		str = ConcatStrings(str," ");	
		if(itm7amount != 1)
		{				
			str = ConcatStrings(str,B_NumToString(itm7amount));	
			str = ConcatStrings(str," kawa�k�w ");	
		};
		str = ConcatStrings(str,itm7name);						
		str = ConcatStrings(str," robisz r�koje�� i nabijasz j� na tyln� cz�� broni. ");	
		Doc_PrintLines	( nDocID,  0, str);						
		str = "";	
	}
	else
	{
		str = ConcatStrings(str,"Zr�b r�koje�� i nabij j� na tyln� cz�� broni. ");				
	};		
	if(item.protection[3] != 0)
	{
		str = ConcatStrings(str,"Nast�pnie r�koje�� dok�adnie i ciasno owijasz");
		str = ConcatStrings(str," ");	
		if(itm8amount != 1)
		{				
			str = ConcatStrings(str,B_NumToString(itm8amount));	
			str = ConcatStrings(str," kawa�kami ");	
		}
		else
		{
			str = ConcatStrings(str," kawa�kiem ");				
		};
		str = ConcatStrings(str,itm8name);						
		str = ConcatStrings(str,". ");	
		Doc_PrintLines	( nDocID,  0, str);						
		str = "";	
	};	
	str = ConcatStrings(str,"Teraz pozostaje naostrzy� kling� na ose�ce");	
	if(item.protection[4] != 0)
	{
		str = ConcatStrings(str," dodajemy jeszcze ");
		if(itm6amount != 1)
		{						
			str = ConcatStrings(str,B_NumToString(itm6amount));	
			str = ConcatStrings(str," kawa�ki ");	
		};
		str = ConcatStrings(str,itm6name);						
	};	
	str = ConcatStrings(str,". ");	
	Doc_PrintLines	( nDocID,  0, str);						
	str = "";		
	if(item.protection[5] != 0)||(item.protection[6] != 0)||(item.protection[7] != 0)
	{
		str = ConcatStrings(str,"Nie mo�na zapomnie� o kilku");				
		if(item.protection[5] != 0)
		{
			str = ConcatStrings(str," ");					
			str = ConcatStrings(str,itm9name);	
			if(itm9amount != 1)
			{					
				str = ConcatStrings(str,", ");	
				str = ConcatStrings(str,B_NumToString(itm9amount));	
				str = ConcatStrings(str," powinno wystarczy�");		
			};											
		};
		if(item.protection[6] != 0)
		{
			if(item.protection[5] != 0)
			{				
				str = ConcatStrings(str,", poza tym ");
				if(itm10amount != 1)
				{		
					str = ConcatStrings(str,B_NumToString(itm10amount));
					str = ConcatStrings(str," ");
				};													
				str = ConcatStrings(str,itm10name);			

				str = ConcatStrings(str,"");													
			}		
			else
			{				
				str = ConcatStrings(str," ");					
				str = ConcatStrings(str,itm10name);	
				if(itm10amount != 1)
				{	
					str = ConcatStrings(str,", ");	
					str = ConcatStrings(str,B_NumToString(itm10amount));	
					str = ConcatStrings(str," powinno wystarczy�");		
				};											
			};	
		};
		if(item.protection[7] != 0)
		{
			if(item.protection[5] != 0)&&(item.protection[6] == 0)
			{				
				str = ConcatStrings(str,", poza tym ");	
				if(itm11amount != 1)
				{
					str = ConcatStrings(str,B_NumToString(itm11amount));
					str = ConcatStrings(str," ");		
				};											
				str = ConcatStrings(str,itm11name);			

				str = ConcatStrings(str,"");													
			}	
			else if(item.protection[6] != 0)&&(item.protection[5] != 0)
			{				
				str = ConcatStrings(str," i ");	
				if(itm11amount != 1)
				{
					str = ConcatStrings(str,B_NumToString(itm11amount));
					str = ConcatStrings(str," ");	
				};												
				str = ConcatStrings(str,itm11name);			

				str = ConcatStrings(str,"");													
			}	
			else
			{				
				str = ConcatStrings(str," ");					
				str = ConcatStrings(str,itm11name);	
				if(itm11amount != 1)
				{	
					str = ConcatStrings(str,", ");	
					str = ConcatStrings(str,B_NumToString(itm11amount));	
					str = ConcatStrings(str," powinno wystarczy�");			
				};										
			};	
		};								
		str = ConcatStrings(str,". Tw�j w�asny ");	
		str = ConcatStrings(str,productname);	
		str = ConcatStrings(str," jest ju� gotowy! ");					
		
	}
	else
	{
		str = ConcatStrings(str,"Tw�j w�asny ");	
		str = ConcatStrings(str,productname);	
		str = ConcatStrings(str," jest ju� gotowy! ");	
	};
	Doc_PrintLines	( nDocID,  0, str);						
	str = "";				
	Doc_SetMargins	( nDocID, -1, 330, 50, 50, 40, 2);  //  0 -> margins are in pixels 		
	Doc_PrintLines	( nDocID,  0, "");						
	Doc_PrintLines	( nDocID,  0,author);												
	Doc_Show		( nDocID );	
	receptshow = FALSE;	
};

//-------------------------------
// RTG_BS_COMMON_SWD();
//-------------------------------
func void RTG_BS_COMMON_SWD()
{
	var string productname;
	var string productamount;
	var string itm1name;
	var int itm1amount;		
	var string itm2name;
	var int itm2amount;	
	var string itm3name;
	var int itm3amount;	
	var string itm4name;
	var int itm4amount;	
	var string itm5name;
	var int itm5amount;	
	var string itm6name;
	var int itm6amount;		
	var string itm7name;
	var int itm7amount;	
	var string itm8name;
	var int itm8amount;	
	var string itm9name;
	var int itm9amount;	
	var string itm10name;
	var int itm10amount;		
	var string itm11name;
	var int itm11amount;	
	var string author;
	var int nDocID;
	var string str;
	author="Kowal Crimson";
	R_GetItem(recept_inuse);					
	productname = Get_Product_Name();
	productamount = Get_Product_Amount();
	itm1name	= Get_needitm0_Name();  
	itm1amount	= item.needitm_amount[0];
	itm2name	= Get_needitm1_Name();  
	itm2amount	= item.needitm_amount[1];
	itm3name	= Get_needitm2_Name();  
	itm3amount	= item.needitm_amount[2];
	itm4name	= Get_needitm3_Name();  
	itm4amount	= item.damage[0];
	itm5name	= Get_needitm4_Name();  
	itm5amount	= item.damage[1];
	itm6name	= Get_needitm5_Name();  
	itm6amount	= item.damage[2];	
	itm7name	= Get_needitm6_Name();  
	itm7amount	= item.damage[3];
	itm8name	= Get_needitm7_Name();  
	itm8amount	= item.damage[4];
	itm9name	= Get_needitm8_Name();  
	itm9amount	= item.damage[5];	
	itm10name	= Get_needitm9_Name();  
	itm10amount	= item.damage[6];
	itm11name	= Get_needitm10_Name();  
	itm11amount	= item.damage[7];	
};

//-------------------------------
// RTG_BS_GOOD_SWD();
//-------------------------------
func void RTG_BS_GOOD_SWD()
{
	var string productname;
	var string productamount;
	var string itm1name;
	var int itm1amount;		
	var string itm2name;
	var int itm2amount;	
	var string itm3name;
	var int itm3amount;	
	var string itm4name;
	var int itm4amount;	
	var string itm5name;
	var int itm5amount;	
	var string itm6name;
	var int itm6amount;		
	var string itm7name;
	var int itm7amount;	
	var string itm8name;
	var int itm8amount;	
	var string itm9name;
	var int itm9amount;	
	var string itm10name;
	var int itm10amount;		
	var string itm11name;
	var int itm11amount;	
	var string author;
	var int nDocID;
	var string str;
	author="Kowal Alan z Klanu Ostrza";
	R_GetItem(recept_inuse);					
	productname = Get_Product_Name();
	productamount = Get_Product_Amount();
	itm1name	= Get_needitm0_Name();  
	itm1amount	= item.needitm_amount[0];
	itm2name	= Get_needitm1_Name();  
	itm2amount	= item.needitm_amount[1];
	itm3name	= Get_needitm2_Name();  
	itm3amount	= item.needitm_amount[2];
	itm4name	= Get_needitm3_Name();  
	itm4amount	= item.damage[0];
	itm5name	= Get_needitm4_Name();  
	itm5amount	= item.damage[1];
	itm6name	= Get_needitm5_Name();  
	itm6amount	= item.damage[2];	
	itm7name	= Get_needitm6_Name();  
	itm7amount	= item.damage[3];
	itm8name	= Get_needitm7_Name();  
	itm8amount	= item.damage[4];
	itm9name	= Get_needitm8_Name();  
	itm9amount	= item.damage[5];	
	itm10name	= Get_needitm9_Name();  
	itm10amount	= item.damage[6];
	itm11name	= Get_needitm10_Name();  
	itm11amount	= item.damage[7];	
	nDocID = 	Doc_Create		();								// DocManager 
	Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
	Doc_SetFont 	( nDocID,  0, "font_10_book.tga");	
	Doc_SetMargins	( nDocID, -1, 40, 50, 50, 50, 2   		);  //  0 -> margins are in pixels 
	str = ConcatStrings("Aby wykona� tak dobr� bro� jak ",productname);
	str = ConcatStrings(str," musisz by� niez�ym kowalem z kilkuletni� praktyk�.");	
	str = ConcatStrings(str," Jest to bowiem do�� misterna robota. ");		
	Doc_PrintLines	( nDocID,  0, str);		
	str = "";		
	if(item.needitm[1] != 0)||(item.needitm[2] != 0)
	{
		str = ConcatStrings(str,"Na sam pocz�tek wrzu� do paleniska");
		if(item.needitm[1] != 0)
		{
			str = ConcatStrings(str," ");	
			if(itm2amount != 1)
			{									
				str = ConcatStrings(str,B_NumToString(itm2amount));	
				str = ConcatStrings(str," kawa�k�w ");	
			}
			else
			{
				str = ConcatStrings(str," kawa�ek ");					
			};
			str = ConcatStrings(str,itm2name);					
			
		};
		if(item.needitm[2] != 0)
		{ 
			if(item.needitm[1] != 0)
			{
				str = ConcatStrings(str," chwil� p�niej dorzucasz jeszcze ");
				str = ConcatStrings(str,itm3name);
				if(itm3amount != 1)
				{		
					str = ConcatStrings(str," ");					
					str = ConcatStrings(str,B_NumToString(itm3amount));		
				};						
			}
			else
			{
				str = ConcatStrings(str," ");									
				str = ConcatStrings(str,B_NumToString(itm3amount));	
				str = ConcatStrings(str," kawa�k�w ");	
				str = ConcatStrings(str,itm3name);	
			};								
		};		
		str = ConcatStrings(str,". ");	
		Doc_PrintLines	( nDocID,  0, str);						
		str = "";	
	};
	
	if(item.needitm[0] != 0)
	{
		str = ConcatStrings("Chwy� w d�o� ",itm1name);	
		str = ConcatStrings(str," i rozgrzewaj na palenisku. Po uzyskaniu odpowiedniej kowalno�ci materia�u przenie� go na kowad�o i precyzyjnymi uderzeniami m�ota uformuj w g�adkie ostrze z dobrze le��c� w d�oni r�koje�ci�");			
	};	
	
	if(item.protection[0] != 0)||(item.protection[1] != 0)
	{
		str = ConcatStrings(str," Ostrze b�dzie skuteczniejsze w walce je�li dodasz");
		if(item.protection[0] != 0)
		{
			str = ConcatStrings(str," ");	
			if(itm4amount != 1)
			{					
				str = ConcatStrings(str,B_NumToString(itm4amount));	
				str = ConcatStrings(str," ");	
			};
			str = ConcatStrings(str,itm4name);					
			
		};
		if(item.protection[1] != 0)
		{ 
			if(item.protection[0] != 0)
			{
				str = ConcatStrings(str," oraz ");
				if(itm5amount != 1)
				{	
					str = ConcatStrings(str,B_NumToString(itm5amount));	
					str = ConcatStrings(str," ");	
				};									
				str = ConcatStrings(str,itm5name);								
			}
			else
			{
				str = ConcatStrings(str," ");
				if(itm5amount != 1)
				{
					str = ConcatStrings(str,B_NumToString(itm5amount));	
					str = ConcatStrings(str," ");	
				};									
				str = ConcatStrings(str,itm5name);	
			};								
		};		
		str = ConcatStrings(str,". ");	
		Doc_PrintLines	( nDocID,  0, str);						
		str = "";	
	}
	else
	{
		str = ConcatStrings(str,". ");	
	};
	
	if(item.protection[3] != 0)
	{
		str = ConcatStrings(str,"R�koje�� ciasno owi�");
		str = ConcatStrings(str," ");	
		if(itm8amount != 1)
		{				
			str = ConcatStrings(str,B_NumToString(itm8amount));	
			str = ConcatStrings(str," ");	
		}
		else
		{
			str = ConcatStrings(str," kawa�kiem ");				
		};
		str = ConcatStrings(str,itm8name);						
		str = ConcatStrings(str,". ");	
		Doc_PrintLines	( nDocID,  0, str);						
		str = "";	
	};			
	if(item.protection[2] != 0)
	{
		if(item.protection[3] != 0)
		{
			str = ConcatStrings(str,", po czym przytwierd� je");
		}
		else
		{
			str = ConcatStrings(str,"Przytwierd� r�koje�� za pomoc�");	
		};
		str = ConcatStrings(str," ");	
		if(itm7amount != 1)
		{				
			str = ConcatStrings(str,B_NumToString(itm7amount));	
			str = ConcatStrings(str," ");	
		};
		str = ConcatStrings(str,itm7name);						
		str = ConcatStrings(str,". ");	
		Doc_PrintLines	( nDocID,  0, str);						
		str = "";	
	}
	else
	{
		str = ConcatStrings(str,"Ukszta�tuj r�koje�� i owi� j� materia�em. ");				
	};		
	str = ConcatStrings(str,"Na sam koniec zaostrz kling� na ose�ce");	
	if(item.protection[4] != 0)
	{
		str = ConcatStrings(str," , ostrz�� ja dodaj ");
		if(itm6amount != 1)
		{						
			str = ConcatStrings(str,B_NumToString(itm6amount));	
			str = ConcatStrings(str," ");	
		};
		str = ConcatStrings(str,itm6name);						
	};	
	str = ConcatStrings(str,". ");	
	Doc_PrintLines	( nDocID,  0, str);						
	str = "";		
	if(item.protection[5] != 0)||(item.protection[6] != 0)||(item.protection[7] != 0)
	{
		str = ConcatStrings(str,"Podczas ca�ego procesu tworzenia nie zapomnij o ");				
		if(item.protection[5] != 0)
		{
			if(itm9amount != 1)
			{					
				str = ConcatStrings(str,B_NumToString(itm9amount));	
			};				
			str = ConcatStrings(str," ");					
			str = ConcatStrings(str,itm9name);												
		};
		if(item.protection[6] != 0)
		{
			if(item.protection[5] != 0)
			{				
				str = ConcatStrings(str,", kilku ");
				str = ConcatStrings(str,itm10name);	
				if(itm10amount != 1)
				{						
					str = ConcatStrings(str," my�l� �e ");									
					str = ConcatStrings(str,B_NumToString(itm10amount));
				};														

				str = ConcatStrings(str," wystarczy ");													
			}		
			else
			{				
				if(itm10amount != 1)
				{	
					str = ConcatStrings(str," ");										
					str = ConcatStrings(str,B_NumToString(itm10amount));	
				};				
				str = ConcatStrings(str," ");					
				str = ConcatStrings(str,itm10name);											
			};	
		};
		if(item.protection[7] != 0)
		{
			if(item.protection[5] != 0)&&(item.protection[6] == 0)
			{				
				str = ConcatStrings(str,", kilku ");
				str = ConcatStrings(str,itm11name);	
				if(itm11amount != 1)
				{						
					str = ConcatStrings(str," my�l� �e ");									
					str = ConcatStrings(str,B_NumToString(itm11amount));
				};														

				str = ConcatStrings(str," wystarczy ");											
			}	
			else if(item.protection[6] != 0)&&(item.protection[5] != 0)
			{				
				str = ConcatStrings(str,", oraz o ");	
				if(itm11amount != 1)
				{
					str = ConcatStrings(str,B_NumToString(itm11amount));
					str = ConcatStrings(str," ");	
				};												
				str = ConcatStrings(str,itm11name);			

				str = ConcatStrings(str,"");													
			}	
			else
			{				
				if(itm11amount != 1)
				{	
					str = ConcatStrings(str," ");										
					str = ConcatStrings(str,B_NumToString(itm11amount));	
				};				
				str = ConcatStrings(str," ");					
				str = ConcatStrings(str,itm11name);														
			};	
		};								
		str = ConcatStrings(str,". ");	
		str = ConcatStrings(str,productname);	
		str = ConcatStrings(str," gotowy! ");	
	}
	else
	{
		str = ConcatStrings(str," ");	
		str = ConcatStrings(str,productname);	
		str = ConcatStrings(str," gotowy! ");	
	};
	Doc_PrintLines	( nDocID,  0, str);						
	str = "";				
	Doc_SetMargins	( nDocID, -1, 330, 50, 50, 40, 2);  //  0 -> margins are in pixels 		
	Doc_PrintLines	( nDocID,  0, "");						
	Doc_PrintLines	( nDocID,  0,author);												
	Doc_Show		( nDocID );	
	receptshow = FALSE;	
};

//-------------------------------
// RTG_BS_EXCELENT_SWD();
//-------------------------------
func void RTG_BS_EXCELENT_SWD()
{
	var string productname;
	var string productamount;
	var string itm1name;
	var int itm1amount;		
	var string itm2name;
	var int itm2amount;	
	var string itm3name;
	var int itm3amount;	
	var string itm4name;
	var int itm4amount;	
	var string itm5name;
	var int itm5amount;	
	var string itm6name;
	var int itm6amount;		
	var string itm7name;
	var int itm7amount;	
	var string itm8name;
	var int itm8amount;	
	var string itm9name;
	var int itm9amount;	
	var string itm10name;
	var int itm10amount;		
	var string itm11name;
	var int itm11amount;	
	var string author;
	var int nDocID;
	var string str;
	author="Kowal Crimson";
	R_GetItem(recept_inuse);					
	productname = Get_Product_Name();
	productamount = Get_Product_Amount();
	itm1name	= Get_needitm0_Name();  
	itm1amount	= item.needitm_amount[0];
	itm2name	= Get_needitm1_Name();  
	itm2amount	= item.needitm_amount[1];
	itm3name	= Get_needitm2_Name();  
	itm3amount	= item.needitm_amount[2];
	itm4name	= Get_needitm3_Name();  
	itm4amount	= item.damage[0];
	itm5name	= Get_needitm4_Name();  
	itm5amount	= item.damage[1];
	itm6name	= Get_needitm5_Name();  
	itm6amount	= item.damage[2];	
	itm7name	= Get_needitm6_Name();  
	itm7amount	= item.damage[3];
	itm8name	= Get_needitm7_Name();  
	itm8amount	= item.damage[4];
	itm9name	= Get_needitm8_Name();  
	itm9amount	= item.damage[5];	
	itm10name	= Get_needitm9_Name();  
	itm10amount	= item.damage[6];
	itm11name	= Get_needitm10_Name();  
	itm11amount	= item.damage[7];	
};

//-------------------------------
//
// R O O T   F U N C T I O N
//
//-------------------------------
func void Recept_Text_Generator()
{
	R_GetItem(recept_inuse);		
	//-------------------------------
	// BLACKSMITH SWORDS (R_BS)
	//-------------------------------
	if(item.makingmob==1)//Smith Poor SWD
	{
		RTG_BS_POOR_SWD();
	}
	else if(item.makingmob==2)//Smith Common SWD
	{
		RTG_BS_COMMON_SWD();		
	}	
	else if(item.makingmob==3)//Smith Good SWD
	{
		RTG_BS_GOOD_SWD();		
	}	
	else if(item.makingmob==4)//Excelent Good SWD
	{
		RTG_BS_EXCELENT_SWD();		
	};			
};