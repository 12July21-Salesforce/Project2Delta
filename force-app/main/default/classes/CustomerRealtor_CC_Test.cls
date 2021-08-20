@isTest
private class CustomerRealtor_CC_Test {
    @TestSetup
    static void makeData() {
        List<Realtor__c> realtors = new List<Realtor__c>();
         for (Integer i = 0; i < 20; i++) {
             realtors.add(new Realtor__c());
             realtors[i].Name = 'John Doe ' + i;
         }

         List<Customer__c> customers = new List<Customer__c>();
         for (Integer i = 0; i < 20; i++) {
             customers.add(new Customer__c());
             customers[i].Name = 'Jane Doe ' + i;
             customers[i].Status__c = 'Lead';
         }

         insert realtors;
         insert customers;
    }

    @isTest
    static void customerRealtor() {
        CustomerRealtor_CC customerRealtorTest = new CustomerRealtor_CC();

        ApexPages.StandardSetController setConTest = customerRealtorTest.setCon;

        List<Customer__c> customers = customerRealtorTest.getCustomers();

        PageReference newRealtorTest = customerRealtorTest.newRealtor();

        System.assertEquals(20, customers.size());
        System.assertEquals(Page.RealtorCreationPage.getUrl(), newRealtorTest.getUrl());
    }
}