public with sharing class CreateRealtor_CC {
    public Realtor__c realtor {
        get {
            if (realtor == null) {
                realtor = new Realtor__c();
            }
            return realtor;
        }
        set;
    }

    public PageReference saveRealtor() {
        if (realtor.Name == null) {
            realtor.addError('Name', 'Realtor name is required!');
            return null;
        } else {
            Database.upsert(realtor);
            return Page.RealtorCreatedPage;
        }
    }
}