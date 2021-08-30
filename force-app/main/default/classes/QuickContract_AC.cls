public with sharing class QuickContract_AC {
    @AuraEnabled
    public static void SubmitContract(Contract Con){
        insert Con;

    }

}
