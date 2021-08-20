public class NeighborhoodCompleteLots_CC {
    //public Id curId {get; set;}
    
    
    
    //Grab the Id of the Neighborhood record detail page the user is currently on, to be used in the SOQL query.
    public NeighborhoodCompleteLots_CC(){
        //this.curId = ApexPages.currentPage().getParameters().get('id');
    }
    
    //Get a list of all the 'Spec' houses that are 'Construction Complete'
    public List<NeighborhoodWrapper> neighborhoodList {
        get {
            if(neighborhoodList == null){
                neighborhoodList = new List<NeighborhoodWrapper>();
                String imagePath = '';
                
                for(Neighborhood__c hood : [SELECT Name, Status__c,
                                            (SELECT Name, Home_Type__c, Status__c, Lot_Image_Path__c FROM Lots__r 
                                              WHERE Home_Type__c = 'Spec' AND Status__c = 'Construction Complete'
                                              ORDER BY Name ASC) 
                                            FROM Neighborhood__c
                                            ORDER BY Name]){
                                            //WHERE Id = :curId
                                                
                                                
                                                for(Lot__c lot : hood.Lots__r){
                                                    
                                                    imagePath = lot.Lot_Image_Path__c;
                                                    neighborhoodList.add(new NeighborhoodWrapper(hood, lot, imagePath));                     
                                                }                                                     
                                            }
                
            }
            
            return neighborhoodList;
            
        }
        set;
        
    }
       
    
    //Wrapper is used to that multiple data types can be displayed in the same VF data table
    public class NeighborhoodWrapper{
        public Neighborhood__c neighborhood {get; set;}
        public Lot__c lot {get; set;}
        public String imagePath {get; set;}
        
        public NeighborhoodWrapper(Neighborhood__c neighborhood, Lot__c lot, String imagePath){
            this.neighborhood = neighborhood;
            this.lot = lot;
            this.imagePath = imagePath;
            
        }
        
    }
    

    
}