public with sharing class LotShowExtension {
    
    private final ApexPages.StandardController lot;
    public ApexPages.StandardSetController lots{
        get{
            if(lots == null){
                lots = new ApexPages.StandardSetController(queryLots());
            }
            return lots;
        }
        private set;
    }
    private List<String> statuses;

    public LotShowExtension(ApexPages.StandardController stdController) {
        lot = stdController;
        statuses = new List<String> {'Developed', 'Construction Complete', 'Under Construction'};
    }

    public List<Lot__c> getLotSet(){
        return (List<Lot__c>)lots.getRecords();
    }

    //set of functions to access standard set controller functions
    public void first(){
        lots.first();
    }
    public void next(){
        lots.next();
    }
    public void previous(){
        lots.previous();
    }
    public void last(){
        lots.last();
    }
    public Boolean getHasNext(){
        return lots.getHasNext();
    }
    public Boolean getHasPrevious(){
        return lots.getHasPrevious();
    }
    public Integer getPageSize(){
        return lots.getPageSize();
    }
    public void setPageSize(Integer pageSize){
        lots.setPageSize(pageSize);
    }
    public void setPageNumber(Integer pageNumber){
        lots.setPageNumber(pageNumber);
    }
    public Integer getPageNumber(){
        return lots.getPageNumber();
    }
    public Integer getResultSize(){
        return lots.getResultSize();
    }

    public List<Lot__c> queryLots(){
        //Query for lots in its own function
        return [SELECT Id, Name, Status__c, Address__c, State__c, Home_Type__c 
        FROM Lot__c 
        WHERE Status__c IN :statuses];
    }
}