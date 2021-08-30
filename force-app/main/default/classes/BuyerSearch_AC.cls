public with sharing class BuyerSearch_AC {
    
    @AuraEnabled
    public static List<Lot__c> BuyerSearchWithDate(Integer NumberofDays){


        Date searchDate = Date.Today() - (NumberofDays);

        List<Lot__c> buyersWithinSearch = [SELECT Neighborhood__r.Name, Name, Status__c, Customer__r.Name, Customer__r.Status__c, Customer__r.Buy_Date__c 
                                            FROM Lot__c 
                                            WHERE Customer__r.Status__c = 'BUYER' AND Customer__r.Buy_Date__c > :searchDate 
                                            ORDER BY Customer__r.Buy_Date__c DESC];

            
         
         return buyersWithinSearch;
        

    }
   
}