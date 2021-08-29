@isTest
private class CustomerRealtorListTest {
    @TestSetup
    static void makeData() {
         List<Customer__c> customers = new List<Customer__c>();
         for (Integer i = 0; i < 200; i++) {
             customers.add(new Customer__c());
             customers[i].Name = 'Jane Doe ' + i;
             customers[i].Status__c = 'Lead';
         }
         
         insert customers;
    }

    @isTest
    static void customer() {
        List<Customer__c> customers = CustomerRealtorListController.retrieveCustomers();
        System.assertEquals(200, customers.size());
    }
}