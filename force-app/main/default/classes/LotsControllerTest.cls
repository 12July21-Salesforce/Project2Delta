@isTest
private class LotsControllerTest {

    public static final Integer dataNum = 50;

    @TestSetup
    static void makeData(){

        List<Realtor__c> testRealtors = new List<Realtor__c>();
        for(Integer i=0; i<dataNum; i++){
            testRealtors.add( new Realtor__c(name='Test', Realtor_Agency__c='Test'+i));
        }
        insert testRealtors;

        List<Customer__c> testCustomers = new List<Customer__c>();
        for(Realtor__c realtor:testRealtors){
            testCustomers.add(new Customer__c(name='Test Customer', Realtor__c=realtor.Id, Status__c='Lead'));
        }
        insert testCustomers;

        Neighborhood__c testNeighborhood = new Neighborhood__c(name='Test Neighborhood');
        insert testNeighborhood;

        List<Lot__c> testLots = new List<Lot__c>();
        for(Customer__c customer:testCustomers){
            testLots.add(new Lot__c(name='Test Lot', Customer__c=customer.Id, 
                        Neighborhood__c=testNeighborhood.Id, Status__c='Developed'));
        }
        insert testLots;
    }

    @isTest
    static void testGetLotsSingle(){
        List<Realtor__c> realtors = [SELECT id, realtor_agency__c FROM Realtor__c];
        List<LotsController.LotWrapper> returnedLots = LotsController.getLots(realtors[0].realtor_agency__c);
        system.assertEquals(1, returnedLots.size());
    }
    @isTest
    static void testGetLots(){
        List<LotsController.LotWrapper> returnedLots = LotsController.getLots(NULL);
        system.assertEquals(dataNum, returnedLots.size());
    }

    @isTest
    static void testGetLotsSingleEmptyAgency(){
        Neighborhood__c testNeighborhood = [SELECT Id FROM Neighborhood__c LIMIT 1];
        Lot__c emptyLot = new Lot__c(Name='Empty Lot',Neighborhood__c=testNeighborhood.Id, Status__c='Developed');
        insert emptyLot;
        List<LotsController.LotWrapper> returnedLots = LotsController.getLots('No Agencies');
        system.assertEquals(1, returnedLots.size());
    }
    @isTest
    static void testGetLotsBulkEmptyAgency(){
        Neighborhood__c testNeighborhood = [SELECT Id FROM Neighborhood__c LIMIT 1];
        List<Lot__c> emptyLots = new List<Lot__c>();
        for(Integer i=0; i<dataNum; i++){
            emptyLots.add(new Lot__c(Name='Empty Lot',Neighborhood__c=testNeighborhood.Id, Status__c='Developed'));
        }
        insert emptyLots;
        List<LotsController.LotWrapper> returnedLots = LotsController.getLots('No Agencies');
        system.assertEquals(dataNum, returnedLots.size());
    }

    @isTest
    static void testGetAgencySingle(){
        Realtor__c newAgency = new Realtor__c(name='Test', Realtor_Agency__c='newAgency');
        insert newAgency;
        List<LotsController.Agency> agencies = LotsController.getAgencies();
        system.assertEquals(dataNum+3, agencies.size());
    }
    @isTest
    static void testGetAgencyBulk(){
        List<LotsController.Agency> agencies = LotsController.getAgencies();
        system.assertEquals(dataNum+2, agencies.size());
    }

    @isTest
    static void testGetAgencySingleDuplicate(){
        Realtor__c sameAgency = new Realtor__c(name='Test', Realtor_Agency__c='Test1');
        insert sameAgency;
        List<LotsController.Agency> agencies = LotsController.getAgencies();
        system.assertEquals(dataNum+2, agencies.size());
    }
    @isTest
    static void testGetAgencyBulkDuplicate(){
        List<Realtor__c> sameAgencies = new List<Realtor__c>();
        for(Integer i=0; i<dataNum; i++){
            sameAgencies.add(new Realtor__c(name='Test', Realtor_Agency__c='newAgency'));
        }
        insert sameAgencies;
        List<LotsController.Agency> agencies = LotsController.getAgencies();
        system.assertEquals(dataNum+3, agencies.size());
    }
}
