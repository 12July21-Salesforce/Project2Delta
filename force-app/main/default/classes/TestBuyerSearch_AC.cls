@isTest
private class TestBuyerSearch_AC {
    @isTest
    private static void TestBuyerSearch_AC() {
         
        Date FixedDate = Date.Today() - 5;
  
        Customer__c TestCustomer = new Customer__c();
        TestCustomer.Name= 'Test Name';
        TestCustomer.Status__c='Buyer';
        TestCustomer.Buy_Date__c= FixedDate;
        insert TestCustomer;

        Neighborhood__c TestNeigh = new Neighborhood__c();
        TestNeigh.Name = 'Test Neigh';
        TestNeigh.Status__c = 'In Development';
        insert TestNeigh;

        Lot__c TestLot = new Lot__c();
        TestLot.Name = 'Test Lot';
        TestLot.Neighborhood__c = TestNeigh.Id;
        TestLot.Status__c = 'Developed';
        TestLot.Customer__c = TestCustomer.Id;
        insert TestLot;

        test.startTest();
        
        Date TestDate = Date.today() - 6;
        List<Lot__c> TestLotList = new List<Lot__c>([SELECT Neighborhood__r.Name, Name, Status__c, Customer__r.Name, Customer__r.Status__c, Customer__r.Buy_Date__c 
                                                FROM Lot__c 
                                                WHERE Customer__r.Status__c = 'BUYER' AND Customer__r.Buy_Date__c > :TestDate 
                                                ORDER BY Customer__r.Buy_Date__c DESC]);
        for(Lot__c L : TestLotList){
            system.assertEquals(FixedDate, L.Customer__r.Buy_Date__c);
        }       
         
                                    
        test.stopTest();
        BuyerSearch_AC.BuyerSearchWithDate(5);
        
    }
}