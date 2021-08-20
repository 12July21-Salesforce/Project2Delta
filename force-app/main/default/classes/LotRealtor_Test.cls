@isTest
private class LotRealtor_Test {

    private static PageReference myPage = Page.LotRealtorPage;

    private static Lot__c myLot;
    private static LotRealtorCX myCX;

    private static Boolean allGood;
    
    private static List<Lot__c> gotList;
    private static List<Lot__c> truthList;

    @TestSetup
    private static void mainSetup(){
        BigTest.mainSetup();
    }

    @isTest
    private static void TestA(){

        Test.startTest();

        myLot = [SELECT Id, Customer__r.Realtor__r.Realtor_Agency__c FROM Lot__c WHERE Name = 'NSLC2' LIMIT 1];

        Test.setCurrentPage(myPage);
        myPage.getParameters().put('Id', String.valueOf(myLot.Id));
        myCX = new LotRealtorCX(new ApexPages.StandardController(myLot));

        System.assertEquals(myCX.baseLot.Id, myLot.Id);

        allGood = true;
        gotList = myCX.agencyLots;

        truthList = [   SELECT Id
                        FROM Lot__c
                        WHERE Customer__c != NULL AND Customer__r.Realtor__r.Realtor_Agency__c = :myLot.Customer__r.Realtor__r.Realtor_Agency__c];

        for(Lot__c testLot: gotList){
            if(testLot.Customer__r.Realtor__r.Realtor_Agency__c != 'Agency A'){
                allGood = false;
                break;
            }
        }

        System.assert(allGood && gotList.size() == truthList.size());

        Test.stopTest();
    }

    @isTest
    private static void TestB(){

        Test.startTest();

        myLot = [SELECT Id, Customer__r.Realtor__r.Realtor_Agency__c FROM Lot__c WHERE Name = 'NSD2' LIMIT 1];

        Test.setCurrentPage(myPage);
        myPage.getParameters().put('Id', String.valueOf(myLot.Id));
        myCX = new LotRealtorCX(new ApexPages.StandardController(myLot));

        System.assertEquals(myCX.baseLot.Id, myLot.Id);

        allGood = true;
        gotList = myCX.agencyLots;

        truthList = [   SELECT Id
                        FROM Lot__c
                        WHERE Customer__c != NULL AND Customer__r.Realtor__r.Realtor_Agency__c = :myLot.Customer__r.Realtor__r.Realtor_Agency__c];

        for(Lot__c testLot: gotList){
            if(testLot.Customer__r.Realtor__r.Realtor_Agency__c != 'Agency B'){
                allGood = false;
                break;
            }
        }

        System.assert(allGood && gotList.size() == truthList.size());

        Test.stopTest();
    }

    @isTest
    private static void TestC(){

        Test.startTest();

        myLot = [SELECT Id, Customer__r.Realtor__r.Realtor_Agency__c FROM Lot__c WHERE Name = 'NSD5' LIMIT 1];

        Test.setCurrentPage(myPage);
        myPage.getParameters().put('Id', String.valueOf(myLot.Id));
        myCX = new LotRealtorCX(new ApexPages.StandardController(myLot));

        System.assertEquals(myCX.baseLot.Id, myLot.Id);

        allGood = true;
        gotList = myCX.agencyLots;

        truthList = [   SELECT Id
                        FROM Lot__c
                        WHERE Customer__c != NULL AND Customer__r.Realtor__r.Realtor_Agency__c = :myLot.Customer__r.Realtor__r.Realtor_Agency__c];

        for(Lot__c testLot: gotList){
            if(testLot.Customer__r.Realtor__r.Realtor_Agency__c != 'Agency C'){
                allGood = false;
                break;
            }
        }

        System.assert(allGood && gotList.size() == truthList.size());

        Test.stopTest();
    }
}