@isTest
private class LotsControllerTest {

    @isTest
    static void testGetLotsSingle(){
        Neighborhood__c testNeighborhood = new Neighborhood__c(name='Test Neighborhood');
        insert testNeighborhood;
        Realtor__c testRealtor = new Realtor__c(name='Test Realtor', Realtor_Agency__c='Test Agency');
        insert testRealtor;
        Customer__c testCustomer = new Customer__c(name='Test Customer', Realtor__c=testRealtor.Id, Status__c='Lead');
        insert testCustomer;

        Lot__c testLot = new Lot__c(Name='Empty Lot',Neighborhood__c=testNeighborhood.Id, Status__c='Developed');
        insert testLot;
        List<LotsController.LotWrapper> returnedLots = LotsController.getLots('No Agencies');
        system.assertEquals(1, returnedLots.size());

        testLot.Customer__c = testCustomer.Id;
        update testCustomer;
        returnedLots = LotsController.getLots('No Agencies');
        system.assertEquals(1, returnedLots.size());
    }

    @isTest
    static void testGetLotsBulk(){
        List<Realtor__c> testRealtors = new List<Realtor__c>();
        for(Integer i=0; i<400; i++){
            if(i<200){
                testRealtors.add( new Realtor__c(name='Test', Realtor_Agency__c='Test'+i));
            }else if(i<300){
                testRealtors.add( new Realtor__c(name='Test', Realtor_Agency__c='Test'));
            }else{
                testRealtors.add(new Realtor__c(name='Test'));
            }
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

        List<LotsController.LotWrapper> returnedLots = LotsController.getLots(NULL);
        system.assertEquals(returnedLots.size(), 400);

        returnedLots = LotsController.getLots('Test');
        system.assertEquals(returnedLots.size(), 100);

        returnedLots = LotsController.getLots('No Agencies');
        system.assertEquals(returnedLots.size(), 100);
    }

    @isTest
    static void testGetAgencySingle(){
        Realtor__c newAgency = new Realtor__c(name='Test', Realtor_Agency__c='newAgency');
        insert newAgency;
        List<LotsController.Agency> agencies = LotsController.getAgencies();
        system.assertEquals(3, agencies.size());

        Realtor__c sameAgency = new Realtor__c(name='Test', Realtor_Agency__c='newAgency');
        insert sameAgency;
        agencies = LotsController.getAgencies();
        system.assertEquals(3, agencies.size());
    }

    @isTest
    static void testBulkGetAgency(){
        List<Realtor__c> realtors = new List<Realtor__c>();
        for (Integer i=0; i<400; i++){
            Realtor__c realtor = new Realtor__c(name='Test');
            if(i<200){
                realtor.Realtor_Agency__c='Agency'+i;
                realtors.add(realtor);
            }else{
                realtor.Realtor_Agency__c='Agency1';
                realtors.add(realtor);
            }
        }
        Test.startTest();
        insert realtors;
        List<LotsController.Agency> agencies = LotsController.getAgencies();
        Test.stopTest();
        system.assertEquals(202, agencies.size());
    }
}
