@isTest

private class DisplayHousePicCCTest {

  /*private static testmethod void  contentDocumentTest(){
       
        lot__c l = new lot__c(Status__c = 'Developed');
        insert l;
      
      Neighborhood__c n = new Neighborhood__c(Name = 'Wakanda');
      insert n;

      
	  ContentVersion cVersion = new ContentVersion(
        Title = 'house',
        PathOnClient = 'house.jpg',
        VersionData = Blob.valueOf('Test Content'),
        IsMajorVersion = true
        );
        insert cVersion;
       String lotDocId = [select ContentDocumentId from ContentVersion where Id=:cVersion.Id].ContentDocumentId;
      string na = 'Wakanda';
      string getN = 'select Id from Neighborhood__c where Name :na'; 
        ContentDocumentLink cdl = New ContentDocumentLink();
      	cdl.Visibility ='AllUsers';
        //cdl.LinkedEntityId= getN.Id;
       cdl.ContentDocumentId = lotDocId;
        cdl.ShareType = 'I';
        insert cdl;
      update cVersion;
   displayhousepiccc.getContents(lotdocid, getN);
 	
        system.assertEquals(lotDocId, cdl.ContentDocumentId);
        //system.assertEquals(getN.Id, cdl.LinkedEntityId);
    }
    
    
    
    @istest
    public static void testReturn(){
        test.startTest();
        lot__c l = new lot__c();
        l.Status__c = 'Developed';
        
        insert l;
       Neighborhood__c n = new Neighborhood__c(Name = 'Wakanda');
         insert n;
      
    Neighborhood__c nH = [Select id from Neighborhood__c];
	lot__c lL = [Select id from Lot__C where Status__c = 'Developed'];
        
        DisplayHousePicCC.getLots(lL.ID);
        DisplayHousePicCC.getNeighborhood();
        test.stopTest();
        
    }*/

}