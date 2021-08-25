public with sharing class LotsController {
    @AuraEnabled(cacheable=true)
    public static List<LotWrapper> getLots(){
        List<LotWrapper> returnLots = new List<LotWrapper>();
        for(Lot__c lot: [SELECT Id, Name, Customer__r.Realtor__r.Name, Customer__r.Name FROM Lot__c ORDER BY Name]){
            returnLots.add(new LotWrapper(lot, lot.Customer__r.Realtor__r.Name, lot.Customer__r.Name));
        }
        return returnLots;
    }

    private class LotWrapper{
        @AuraEnabled
        public Lot__c lot{get; set;}
        @AuraEnabled
        public String RealtorName{get; set;}
        @AuraEnabled
        public String CustomerName{get; set;}
        @AuraEnabled
        public String Name{get; set;}

        LotWrapper(Lot__c lot, String RealtorName, String CustomerName){
            this.lot = lot;
            this.RealtorName = RealtorName;
            this.CustomerName = CustomerName;
            this.name = lot.name;
        }
    }
}
