public with sharing class BuyerSearch_AC {
    @AuraEnabled
    public static list<Lot__c> allBuyers(){

        List<Lot__c> LotList = [SELECT Neighborhood__r.Name, Name, Status__c, Customer__r.Name, Customer__r.Status__c, Customer__r.Buy_Date__c 
                                FROM Lot__c 
                                WHERE Customer__r.Status__c = 'BUYER'
                                ORDER BY Customer__r.Buy_Date__c DESC];

        return LotList;

    }
   
}
