public class CommissionController {
	@AuraEnabled
    public static List<Commission__c> getCommissions() {
        return [SELECT id, Realtor__r.Name, Commission_Amount__c, Name, Date_Sold__c, Paid__c, CreatedDate 
                FROM Commission__c
               ORDER BY CreatedDate];
	}
    
    @AuraEnabled
    public static Commission__c saveCommission(Commission__c commission) {
        upsert commission;
        return commission;
    }
}