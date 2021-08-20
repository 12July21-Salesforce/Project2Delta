public with sharing class LotRealtorCC {

    //private Id baseRealtorId;
    private Realtor__c baseRealtor;

        public LotRealtorCC(){
            //baseRealtorId = ApexPages.currentPage().getParameters().get('id');
            baseRealtor = [ SELECT Id 
                            FROM Realtor__c
                            WHERE Id = :ApexPages.currentPage().getParameters().get('id')
                            LIMIT 1];
        }

     public List<Lot__c> agencyLots{
        get{
            if(agencyLots == null){
                agencyLots = new List<Lot__c>([ SELECT Id, Name, Customer__r.Name, Customer__r.Realtor__r.Name, Customer__r.Realtor__c, Customer__r.Realtor__r.Realtor_Agency__c
                                                FROM Lot__c
                                                WHERE Customer__r.Realtor__r.Realtor_Agency__c = :baseRealtor.Realtor_Agency__c]);
            }
            return agencyLots;
        }
        private set;
     }
}