@isTest 
public class TestNCLots_CC { 
    
    private static List<Neighborhood__c> testhoods;
    private static List<Lot__c> testLots;
    
    @TestSetup
    static void makeData(){ 
        
        
        
        testhoods = new List<Neighborhood__c>(); 
        Neighborhood__c tn = new Neighborhood__c(); 
        tn.Name = 'Misterogers'; 
        tn.Status__c = 'Completed'; 
        testhoods.add(tn); 
        
        testLots = new List<Lot__c>(); 
        Lot__c tl = new Lot__c(); 
        tl.Name = 'TL-01'; 
        tl.Home_Type__c = 'Spec'; 
        tl.Status__c = 'Construction Complete'; 
        tl.Neighborhood__c = tn.Id; 
        testLots.add(tl); 
        
        
    }
    
    
    @isTest
    static void testData(){
        makeData();
        
        PageReference testPage = Page.NeighborhoodCompleteLots;
        
        NeighborhoodCompleteLots_CC testController = new NeighborhoodCompleteLots_CC();
        NeighborhoodCompleteLots_CC.NeighborhoodWrapper testWrapper;
        
        Test.startTest();
        insert testhoods; 
        
        //Id testId = testController.curId;
        
        String imagePath = 'testString';  
        testWrapper = new NeighborhoodCompleteLots_CC.NeighborhoodWrapper(testhoods.get(0), testlots.get(0), imagePath);
        
        Neighborhood__c testhood = testWrapper.neighborhood;
        Lot__c testlot = testWrapper.lot;
		String testimage = testWrapper.imagePath;
        
        Test.setCurrentPage(testPage);
        System.assert(testController.neighborhoodList != null);
        System.assert(testhood != null && testlot != null && testimage != null);
        
        Test.stopTest(); 
        
    }

}