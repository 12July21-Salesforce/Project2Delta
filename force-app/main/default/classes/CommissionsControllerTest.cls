@isTest
private class CommissionsControllerTest {

    @IsTest
    static void positiveTest() {
        Realtor__c r = new Realtor__c();
        r.Name = 'Test';
        insert r;
        
        Commission__c com = new Commission__c();
        com.Name = 'test';
        com.Realtor__c = r.id;
        Database.insert(com);
        List<Commission__C> result = CommissionController.getCommissions();
        System.assertEquals(1, result.size(), 'Returnsize is equal to number inserted');


        CommissionController.saveCommission(com);
        System.assertEquals(1, [SELECT COUNT () FROM Commission__C WHERE Name LIKE 'test'], 'no Commission with that Name');

        com.Name = 'test1';
        CommissionController.saveCommission(com);
        System.assertEquals(1, [SELECT COUNT () FROM Commission__c WHERE Name LIKE 'test1'], 'no Commission with that Name');
        
    }
    @IsTest
    static void BulkTest(){
        Realtor__c r = new Realtor__c();
        r.Name = 'Test';
        insert r;

        List<Commission__c> c = new List<Commission__c>();
        for (Integer i= 0; i<200; i++) {
            c.add(new Commission__c(Name = 'TEST', Realtor__C = r.id));
        }
        insert c;
        List<Commission__c> returns = CommissionController.getCommissions();
        System.assertEquals(200, returns.size(), 'Not all inserted');

        for (integer count = 0; count < 100; count++) {
            Commission__c com = new Commission__c(Name = 'test1', Realtor__c= r.id);
            CommissionController.saveCommission(com);
        }
        System.assertEquals(100, [SELECT COUNT () FROM Commission__c WHERE Name LIKE 'test1'], 'Commissions dont match');
    }

    @IsTest
    static void Negative(){
        Commission__c com = new Commission__c();
        //populate no data
        List<Commission__c> result = CommissionController.getCommissions();
        system.assertEquals(0, result.size());

        Realtor__c r = new Realtor__c();
        r.Name = 'Test';
        insert r;

        Commission__c c = new Commission__c();
        c.Name = 'Test';
        c.Realtor__c = r.id;
        CommissionController.saveCommission(c);
        system.assertNotEquals(0, [SELECT COUNT () FROM Commission__c WHERE Name LIKE 'Test']);
    }
}
