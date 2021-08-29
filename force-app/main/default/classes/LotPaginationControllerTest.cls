@isTest
public with sharing class LotPaginationControllerTest {
    private static List<Lot__c> testLots;
    //number of test lots to create
    private static Integer numOfLots = 6;
    
    @TestSetup
    static void makeLots(){
        testLots = new List<Lot__c>();
        Id neighborhoodDefault = 'a025f000000VbZsAAK';
        List<String> statuses = new List<String> {'Developed', 'Construction Complete', 'Under Construction'};
        for(Integer i = 0; i < numOfLots; i++){
            Lot__c lotToTest = new Lot__c(Name='Test '+i, Neighborhood__c=neighborhoodDefault, Status__c=statuses.get(Math.Mod(i, 2)));
            testLots.add(lotToTest);
        }
    }
    
     @isTest
     static void testLotShows(){
         // stick in test data
         makeLots();
        
         
         //Begin Test
         Test.startTest();
         insert testLots;
         List<Lot__c> lots = lotPaginationController.grabLots();
        
        //test whether or not lots is non null and has size > 0
        System.debug('lots: ' + lots[0].Name );
        System.assert(lots != null && lots.size() > 0);
        Test.stopTest();
     }
    
    @isTest
     static void testLotQuery(){
         // stick in test data
         makeLots();
        
         
         //Begin Test
         Test.startTest();
         insert testLots;
         List<Lot__c> lots = FilterLotListController.allLots('1');
        
        //test whether or not lots is non null and has size = 1
        System.debug('lots: ' + lots[0].Name );
        System.assert(lots != null && lots.size() > 0);
        Test.stopTest();
     }
}