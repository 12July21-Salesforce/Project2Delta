public with sharing class BuyersPage_CC {

    public String searchText {get;set;}
    
    public List<Lot__c> buyers {get;set;}

    public list<Lot__c> allBuyers {
        get{
        if (allBuyers == null){

        allBuyers = new List<Lot__c>();
        for(Lot__c buy : [SELECT Neighborhood__c, Name, Status__c, Customer__c, Customer__r.Status__c, Customer__r.Buy_Date__c FROM Lot__c 
        WHERE Customer__r.Status__c = 'BUYER' ORDER BY Customer__r.Buy_Date__c DESC])
        {
            allBuyers.add(buy);
        }
    }
        return allBuyers;
    }
        set;}

    public list<Lot__c> buyersWithinSearch {
        get{
        Date searchDate = Date.Today() - integer.valueof(searchText);
    
            buyersWithinSearch = new List<Lot__c>();
            for(Lot__c b :[SELECT Neighborhood__c, Name, Status__c, Customer__c, Customer__r.Status__c, Customer__r.Buy_Date__c FROM Lot__c 
             WHERE Customer__r.Status__c = 'BUYER' AND Customer__r.Buy_Date__c > :searchDate ORDER BY Customer__r.Buy_Date__c DESC])
                 {
                    buyersWithinSearch.add(b);
                }
            
                    return buyersWithinSearch;
    }
            set;}


    public BuyersPage_CC() {
        
    }


    public void search(){
        if (searchText == '')
        {
            buyers = new List<Lot__c>();
            for(Lot__c b :allBuyers){
                buyers.add(b);
            }
        }
        else{
        
        buyers = new List<Lot__c>();
            for(Lot__c b :buyersWithinSearch){
                buyers.add(b);
            }
    }

    }
}