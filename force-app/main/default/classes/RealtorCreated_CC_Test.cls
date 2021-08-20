@isTest
private class RealtorCreated_CC_Test {
    @isTest
    static void backToCustomerTest() {
        RealtorCreated_CC realtorCreatedCon = new RealtorCreated_CC();

        PageReference backToCustomers = realtorCreatedCon.backToCustomers();

        System.assertEquals(Page.CustomerRealtorPage.getUrl(), backToCustomers.getUrl());
    }
}