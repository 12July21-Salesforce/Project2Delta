public class LotPaginationController {
    
    @AuraEnabled
    public static List<Lot__c> grabLots() {
        List<String> statuses;
        statuses = new List<String> {'Developed', 'Construction Complete', 'Under Construction'};
        return [SELECT Id, Name, Status__c, Address__c, State__c, Home_Type__c FROM Lot__c WHERE Status__c IN :statuses
               ORDER By Name ASC LIMIT 1000];
    }

}