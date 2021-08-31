@isTest
private class createRealtorControllerTest {

    @IsTest
    static void singlePositiveTest() {
        Realtor__c real = new Realtor__c(Name = 'test1');
        insert real;
        List<Realtor__C> result = createRealtorController.getRealtors();
        System.assertEquals(1, result.size(), 'Returnsize is equal to number inserted');
    }
    @IsTest
    static void bulkPositiveTest(){
        
        Test.startTest();
        
        List<Realtor__c> listrealtor = new List<Realtor__c>();
        
        for(Integer i = 0; i<200; i++) {
            listrealtor.add(new Realtor__c(Name='Test'));
        }
        insert listrealtor;
        List<Realtor__c> results = createRealtorController.getRealtors();
        System.assertEquals(200, results.size(), 'return size is equal to number inserted');
        Test.stopTest();  
    }
    @IsTest
    static void negativeTest(){
        Realtor__c real = new Realtor__c();
        //populate no fields
        List<Realtor__c> result = createRealtorController.getRealtors();
        system.assertEquals(0, result.size());
    }

}
