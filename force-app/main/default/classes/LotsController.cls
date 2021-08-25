public class LotsController {
    @AuraEnabled
    public static List<Lot__c> getLots(){
        return [SELECT Id, Name FROM Lot__c];
    }
}
