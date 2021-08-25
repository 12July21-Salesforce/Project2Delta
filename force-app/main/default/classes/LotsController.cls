public with sharing class LotsController {
    @AuraEnabled(cacheable=true)
    public static List<Lot__c> getLots(){
        return [SELECT Id, Name FROM Lot__c];
    }
}
