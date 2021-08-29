public class createRealtorController {
	@AuraEnabled
    public static list<Realtor__c> getRealtors() {
        return [SELECT Id, Name, Realtor_Agency__c, State__c FROM Realtor__c];
    }
}