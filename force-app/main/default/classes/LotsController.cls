public with sharing class LotsController {
    @AuraEnabled(cacheable=true)
    public static List<LotWrapper> getLots(String agency){
        List<LotWrapper> returnLots = new List<LotWrapper>();
        if(agency == 'All'){
            for(Lot__c lot: [SELECT Id, Name, Customer__r.Realtor__r.Name, Customer__r.Name, Customer__r.Realtor__r.Realtor_Agency__c FROM Lot__c ORDER BY Name]){
                returnLots.add(new LotWrapper(lot, lot.Customer__r.Realtor__r.Name, lot.Customer__r.Name));
            }
            return returnLots;
        }
        for(Lot__c lot: [SELECT Id, Name, Customer__r.Realtor__r.Name, Customer__r.Name FROM Lot__c WHERE Customer__r.Realtor__r.Realtor_Agency__c LIKE :agency ORDER BY Name]){
            returnLots.add(new LotWrapper(lot, lot.Customer__r.Realtor__r.Name, lot.Customer__r.Name));
        }
        return returnLots;
    }

    @AuraEnabled(cacheable=true)
    public static List<LotWrapper> updateLots(String agency){
        List<LotWrapper> returnLots = new List<LotWrapper>();
        // for(Lot__c lot: [SELECT Id, Name, Customer__r.Realtor__r.Name, Customer__r.Name FROM Lot__c WHERE Customer__r.Realtor__r.Realtor_Agency__c LIKE :agency ORDER BY Name]){
        //     returnLots.add(new LotWrapper(lot, lot.Customer__r.Realtor__r.Name, lot.Customer__r.Name));
        // }
        for(Lot__c lot: [SELECT Id, Name, Customer__r.Realtor__r.Name, Customer__r.Name FROM Lot__c WHERE Name LIKE 'Lot 1' ORDER BY Name]){
            returnLots.add(new LotWrapper(lot, lot.Customer__r.Realtor__r.Name, lot.Customer__r.Name));
        }
        return returnLots;
    }

    @AuraEnabled(cacheable=true)
    public static List<Agency> getAgencies(){
        Set<String> agencies = new Set<String>();
        List<agency> returnAgencies = new List<agency>();

        Agency emptyAgency = new Agency('');
        emptyAgency.label = '--';
        returnAgencies.add(emptyAgency);
        returnAgencies.add(new Agency('All'));

        for(Realtor__c realtor: [SELECT Id, Realtor_Agency__c FROM Realtor__c WHERE Realtor_Agency__c != NULL]){
            agencies.add(realtor.Realtor_Agency__c);
        }

        for(String a:agencies){
            returnAgencies.add(new Agency(a));
        } 
        
        return returnAgencies;
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

    private class Agency{
        @AuraEnabled
        public String value{get; set;}
        @AuraEnabled
        public String label{get; set;}

        Agency(String name){
            this.value=name;
            this.label=name;
        }
    }
}
