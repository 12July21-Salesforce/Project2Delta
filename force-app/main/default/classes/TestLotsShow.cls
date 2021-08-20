@isTest
public with sharing class TestLotsShow {

    private static List<Lot__c> testLots;
    //number of test lots to create
    private static Integer numOfLots = 6;

    @TestSetup
    static void makeLots(){
        testLots = new List<Lot__c>();
        Id neighborhoodDefault = 'a005e000006223pAAA';
        List<String> statuses = new List<String> {'Developed', 'Construction Complete', 'Under Construction'};
        for(Integer i = 0; i < numOfLots; i++){
            Lot__c lotToTest = new Lot__c(Name='Test '+i, Neighborhood__c=neighborhoodDefault, Status__c=statuses.get(Math.Mod(i, 2)));
            testLots.add(lotToTest);
        }
    }

    @isTest static void testLotShows(){
        makeLots();
        Pagereference pageToTest = Page.LotsShow;

        ApexPages.StandardController sstd = new ApexPages.StandardController(testLots.get(0));
        LotShowExtension testExtension = new LotShowExtension(sstd);
        
        Test.startTest();
        //Begin Test
        insert testLots;
        Test.setCurrentPage(pageToTest);

        //test whether or not getLotSet works, and if we get results and page sizes
        //at this point, getHasNext and getHasPrevious should be false
        System.assert(testExtension.getLotSet() != null && testExtension.getLotSet().size() > 0);
        System.assert(testExtension.getResultSize() == numOfLots);
        System.assert(testExtension.getPageSize() == 20);
        System.assert(testExtension.getPageNumber() == 1);
        if(testExtension.getPageSize() <= testExtension.getResultSize()){
            System.assertEquals(false, testExtension.getHasNext());
        } else{
            System.assertEquals(true, testExtension.getHasNext());
        }
        
        System.assertEquals(false, testExtension.getHasPrevious());

        //change page size and check if getHasNext istrue and if getPageSize works
        testExtension.setPageSize(5);
        if(testExtension.getPageSize() <= testExtension.getResultSize()){
            System.assertEquals(true, testExtension.getHasNext());
        } else{
            System.assertEquals(false, testExtension.getHasNext());
        }
        System.assert(testExtension.getPageSize() == 5);

        //go to next page and check page number and get has previous
        testExtension.next();
        System.assert(testExtension.getPageNumber() == 2);
        System.assertEquals(true, testExtension.getHasPrevious());

        //go to previous page and check page number
        testExtension.previous();
        System.assert(testExtension.getPageNumber() == 1);

        //go to last page and check page number
        testExtension.last();
        System.assert(testExtension.getPageNumber() == 2);

        //go to first page and check page number
        testExtension.first();
        System.assert(testExtension.getPageNumber() == 1);

        //set page number to 2 and check page number
        testExtension.setPageNumber(2);
        System.assert(testExtension.getPageNumber() == 2);

        Test.stopTest();
        //End Test
    }
}