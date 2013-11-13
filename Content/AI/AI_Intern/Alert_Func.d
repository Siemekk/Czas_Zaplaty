func void Alert_Print(var string topic,var string msg)
{
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "ALERT_BACK.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "FONT_OLD_10_WHITE_HI.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 20, 20, 20, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, topic					);//Max 24
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "FONT_OLD_10_WHITE.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, msg	);//ok. 194
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "(ESC aby zamkn��)");
					Doc_SetMargins	( nDocID, -1, 20, 20, 20, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus					
				
					Doc_Show		( nDocID );
					
					/*
			var int Alert;
			Alert = 	Doc_Create		();								// DocManager 
					Doc_SetPages	( Alert,  1 );                         //wieviel Pages

					Doc_SetPage 	( Alert,  0, "ALERT_BACK.tga" 	, 0 		); 
					
					//1.Seite
  					
					Doc_SetMargins	( Alert,  0,  20, 20, 20, 20, 2);  //  0 -> margins are in pixels				
					Doc_SetFont 	( Alert, 0, "FONT_OLD_10_WHITE_HI.tga");									
					Doc_PrintLine	( Alert,  0, "123456789111315171921232527293133353739414345474951535557596163656769717375");					
			//		Doc_PrintLine	( Alert,  0, "");
					Doc_SetFont 	( Alert, 0, "FONT_OLD_10_WHITE.tga");									
		//			Doc_PrintLines	( Alert,  0, "12345678911131517192123252729313335373941434547495153555759616365676971737577798183858789919395979910210510811114117120123126129132");
					Doc_PrintLines	( Alert,  1, "Na �cianie znale�li�my dziwne przyciski. Marwez i Renor pr�bowali je wcisn��, ale ...Zw�oki zakopali�my na zewn�trz. Dzi�ki ich ofierze  dowiedzieli�my si� jaki przycisk nale�y wcisn��. Odsun�a si� jedna ze �cian, a my znale�li�my stary ornament. Da�em go na przechowanie Patrikowi po czym ruszyli�my dalej. Na ko�cu ciemnego korytarza znalaz�em wy��obienie w �cianie, kt�re idealnie pasowa�o do kszta�tu ornamentu. Zawo�a�em Patrika jednak�e nie odpowiedzia� mi �aden g�os. Ten dra� zwia� z moim ornamentem! Za wszelk� cen� musz� go odnale��!");
					Doc_PrintLine	( Alert,  0, "");
					Doc_Show		( Alert );
					*/
	
		
};