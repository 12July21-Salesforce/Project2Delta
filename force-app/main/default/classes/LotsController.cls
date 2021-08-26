public with sharing class LotsController {
    @AuraEnabled(cacheable=true)
    public static List<LotWrapper> getLots(String agency){
        List<LotWrapper> returnLots = new List<LotWrapper>();
        switch on agency {
            when 'All Agencies', NULL {
                for(Lot__c lot: [SELECT Id, Name, Customer__r.Realtor__r.Name, Customer__r.Name, Customer__r.Realtor__r.Realtor_Agency__c FROM Lot__c ORDER BY Name]){
                    returnLots.add(new LotWrapper(lot, lot.Customer__r.Realtor__r.Name, lot.Customer__r.Name));
                }
                return returnLots;
            }
            when  'No Agencies'{
                agency = null;
            }
        }
        for(Lot__c lot: [SELECT Id, Name, Customer__r.Realtor__r.Name, Customer__r.Name FROM Lot__c WHERE Customer__r.Realtor__r.Realtor_Agency__c = :agency ORDER BY Name]){
            returnLots.add(new LotWrapper(lot, lot.Customer__r.Realtor__r.Name, lot.Customer__r.Name));
        }
        return returnLots;
    }

    @AuraEnabled(cacheable=true)
    public static List<Agency> getAgencies(){
        Set<String> agencies = new Set<String>();
        List<agency> returnAgencies = new List<agency>();

        returnAgencies.add(new Agency('All Agencies'));
        returnAgencies.add(new Agency('No Agencies'));

        for(Realtor__c realtor: [SELECT Id, Realtor_Agency__c FROM Realtor__c WHERE Realtor_Agency__c != NULL ORDER BY Realtor_Agency__c]){
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
