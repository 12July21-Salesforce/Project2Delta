public with sharing class CustomerRealtor_CC {
    public ApexPages.StandardSetController setCon {
        get {
            if (setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, Realtor__r.Name FROM Customer__c ORDER BY Realtor__r.Name]
                ));
            }
            return setCon;
        }
        set;
    }

    public List<Customer__c> getCustomers() {
        return (List<Customer__c>) setCon.getRecords();
    }

    public PageReference newRealtor() {
        return  Page.RealtorCreationPage;
    }
}