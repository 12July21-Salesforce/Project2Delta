@isTest
private class LotsControllerTest {

    @TestSetup
    static void makeData(){
        Realtor__c testRealator = new Realtor__c(name='Johnny', Realtor_Agency__c='Test Agency');
        insert testRealator;
        Customer__c testCustomer = new Customer__c(name='Test Customer', Realtor__c=testRealator.Id, Status__c='Lead');
        insert testCustomer;
        Neighborhood__c testNeighborhood = new Neighborhood__c(name='Test Neighborhood');
        insert testNeighborhood;
        Lot__c testLot = new Lot__c(name='Test Lot', Customer__c=testCustomer.Id, 
                                    Neighborhood__c=testNeighborhood.Id, Status__c='Developed');
        insert testLot;
    }
    @isTest
    static void testGetLots(){
        Realtor__c testRealtor = [SELECT Name, Id FROM Realtor__c LIMIT 1];
        Customer__c testCustomer = [SELECT Name, Realtor__c, Id FROM Customer__c LIMIT 1];
        Lot__c testLot = [SELECT Name, Customer__c, Id FROM Lot__c LIMIT 1];
        System.assertEquals(testCustomer.Id, testLot.Customer__c);
    }
}
