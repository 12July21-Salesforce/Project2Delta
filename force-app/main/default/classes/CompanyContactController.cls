public with sharing class CompanyContactController {
    @AuraEnabled
    public static Organization getCompanyContact(){
        Organization orgDetails = [SELECT Name, Phone, Street, City, State, PostalCode, Country FROM Organization];
        return orgDetails;
    }
}