@isTest
private with sharing class CompanyContactControllerTest {
    @isTest
    static void testCCC(){ //no need to populate orgs since exactly 1 org is always populated
        Organization org = [SELECT Name, Phone, Street, City, State, PostalCode, Country FROM Organization];
        Organization testOrg = CompanyContactController.getCompanyContact();
        system.assertEquals(org, testOrg);
    }
}
