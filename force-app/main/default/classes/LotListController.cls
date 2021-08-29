public class LotListController {
@AuraEnabled (cacheable =true)
    
    public static list<lot__c> getLots(){
         List<Lot__c> hood = [select Neighborhood__r.Name, Name,Status__c, Home_Type__c from Lot__c ];
        return hood;
    }
    

}