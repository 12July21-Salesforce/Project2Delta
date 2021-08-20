@isTest
private class CreateRealtor_CC_Test {
    @isTest
    static void createRealtorPositive() {
        CreateRealtor_CC createRealtorCon = new CreateRealtor_CC();

        createRealtorCon.realtor.Name = 'Jorge Garriga';

        PageReference confirmPage = createRealtorCon.saveRealtor();
        
        System.assertEquals(Page.RealtorCreatedPage.getUrl(), confirmPage.getUrl());
    }

    @isTest
    static void createRealtorNegative() {
        CreateRealtor_CC createRealtorCon = new CreateRealtor_CC();

        PageReference confirmPage;

        try {
            confirmPage = createRealtorCon.saveRealtor();
        } catch(System.Exception e) {
            String errorMessage = 'Realtor name is required!';
            System.assert(e.getMessage().contains(errorMessage));
            System.assertEquals(null, confirmPage);
        }
    }
}