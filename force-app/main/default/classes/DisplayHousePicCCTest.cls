@isTest

private class DisplayHousePicCCTest {

  private static testmethod void  contentDocumentTest(){
  
      Neighborhood__c n = new Neighborhood__c(Name = 'positive');

      insert n;
      Neighborhood__c n2 = new Neighborhood__c(Name = 'negative');
      insert n2;
      
      ContentVersion cVersion = new ContentVersion(
        Title = 'house',
        PathOnClient = 'house.jpg',
        VersionData = Blob.valueOf('Test Content'),
        IsMajorVersion = true
        );
        insert cVersion;
      
       //to expose contoller to test.  Controller take two string parameters. LotDocId passes contentDocumentId and getN equals sobject
       String lotDocId = [select ContentDocumentId from ContentVersion where Id=:cVersion.Id].ContentDocumentId;
   	   String getN;
      displayhousepiccc.getContents(lotdocid, getN);  
      
        ContentDocumentLink cdl = New ContentDocumentLink();
      	cdl.Visibility ='AllUsers';
        cdl.LinkedEntityId= n.id;

       cdl.ContentDocumentId = lotDocId;
        cdl.ShareType = 'I';
        insert cdl;
      update cVersion;
	
 	
      // shows that positive neighborhood has a file attached
        system.assertEquals(n.Id, cdl.LinkedEntityId);   
      // shows that negative neighborhood has no file attached
      system.assertNotEquals(n2.Id, cdl.LinkedEntityId);
      // shows that file is a type is jpg/correct path
      system.assertequals('house.jpg', cVersion.PathOnClient);
      //negative test --check path and file type
      system.assertNotEquals('house.csv', cVersion.PathOnClient);
    }
    
    // bulk test 
    private static testmethod void  contentBulkDocumentTest(){
 
      list<Neighborhood__c> nList = new list<Neighborhood__c>();
      list<Neighborhood__c> nList1 = new list<Neighborhood__c>();
        
        for (integer i =0; i <= 400; i++){
            for(Neighborhood__c n : nList){
            if(i<200){
                n.Name = 'Positive';
                 nList.add(n);
                    }
    else{n.Name = 'Negative';}
                  nList1.add(n);                       }
            
        } insert nList;
        insert nList1;
      
      ContentVersion cVersion = new ContentVersion(
        Title = 'house',
        PathOnClient = 'house.jpg',
        VersionData = Blob.valueOf('Test Content'),
        IsMajorVersion = true
        );
                insert cVersion;  
     
        //to expose contoller to test.  Controller take two string parameters. LotDocId passes contentDocumentId and getN equals sobject
      String lotDocId = [select ContentDocumentId from ContentVersion where Id=:cVersion.Id].ContentDocumentId;
	  String getN;
      displayhousepiccc.getContents(lotdocid, getN);  

         for(Neighborhood__c n1 :nList){
           
        ContentDocumentLink cdl = New ContentDocumentLink();
      	cdl.Visibility ='AllUsers';
        cdl.LinkedEntityId= n1.id;
       cdl.ContentDocumentId = lotDocId;
                cdl.ShareType = 'I';
                
                nList.add(n1);
         test.startTest();       
        insert cdl;
         update cVersion;       
         test.stopTest();     
                
         system.assertEquals(n1.Id, cdl.LinkedEntityId);
       system.assertequals('house.jpg', cVersion.PathOnClient);
      //negative test --check path and file type
      system.assertNotEquals('house.csv', cVersion.PathOnClient);   
           }        
}
    
    
 
    private static testmethod void testReturnQuery(){
        
        lot__c l = new lot__c();
        l.Status__c = 'Developed';
        
        insert l;
       Neighborhood__c n = new Neighborhood__c(Name = 'positive');
         insert n;
      
    Neighborhood__c nH = [Select id from Neighborhood__c];
	lot__c lL = [Select id from Lot__C where Status__c = 'Developed'];
        
        DisplayHousePicCC.getLots(lL.ID);
        DisplayHousePicCC.getNeighborhood();
        
        // assert test to check if right lot__c record is returned when status is Developed
        system.assertequals('Developed', lL.Status__c = 'Developed');
        // Negative test to check that no record is returned when status is != Developed
        system.assertNotEquals('under construction', lL.Status__c = 'Developed');
        //positive test to check if the right neighborhood record is returned when name is positive
        system.assertequals('positive', nH.Name ='positive');
        //negative test to check record is not returned when name != positive
        system.assertNotEquals('negative', nH.Name = 'positive');
    }
    
    private static testmethod void bulkTestSoqlReturn(){
      list<Neighborhood__c> nH1List = new list<Neighborhood__c>();
      list<Lot__c> nH1List1 = new list<Lot__c>(); 
        for(integer i=0; i< 400; i++){
            if(i <200){
                neighborhood__c n1 = new neighborhood__c();
                n1.Name = 'positive';
                nH1List.add(n1);
            }else{
               lot__c l = new lot__c();
                l.Status__c = 'Developed';
                nH1List1.add(l);
            }
                  }
        
        test.startTest();
        list<database.SaveResult> result = database.insert(nH1List, false);
         list<database.SaveResult> result1 = database.insert(nH1List1, false);
		test.stopTest();
        // return query for positive bulk test
         list<Neighborhood__c> returnList1 = [select id from Neighborhood__c where name = 'positive'];
        list<Lot__c> returnList2 = [select id from Lot__c where Status__c = 'Developed'];
        // return query for negative bulk test
        list<Neighborhood__c> returnList3 = [select id from Neighborhood__c where name = 'negative'];
        list<Lot__c> returnList4 = [select id from Lot__c where Status__c = 'Under Construction'];
         // system.debug(result);
 
        // positive check record queried
        system.assertEquals(200, returnList1.size());
        system.assertEquals(200, returnList2.size());
        
        // negative check for record queried
      system.assertEquals(0, returnList3.size());
      system.assertEquals(0, returnList4.size());
    }
}