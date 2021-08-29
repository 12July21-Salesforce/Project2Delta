public with sharing class CustomerRealtorListController {

    @AuraEnabled
    public static list<Customer__c> retrieveCustomers() {
        return [SELECT Id, Name, Realtor__r.Name FROM Customer__c];
    }
}