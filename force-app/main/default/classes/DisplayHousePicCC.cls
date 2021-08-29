public class DisplayHousePicCC {
    
    @AuraEnabled
    public static List<Neighborhood__c> getNeighborhood(){
        List<Neighborhood__c> proplist = [Select Id, Name FROM Neighborhood__c];
        return proplist;   
    }  
   @AuraEnabled
    public static List<Lot__c> getLots(String propId){
     List<Lot__c> unitList =[Select Id, Name,Neighborhood__c FROM Lot__c where Neighborhood__c =: propId];
        return unitList;
    }
    @AuraEnabled
    public static List<ContentVersion> getContents(string brandId, string ObjectName) {
        Set<Id> contentIds = new Set<Id>();
        if(ObjectName == 'Neighborhood__c'){
            for (ContentDocumentLink cont :[SELECT ContentDocumentId, LinkedEntityId FROM ContentDocumentLink where LinkedEntityId in ( SELECT Id FROM Neighborhood__c where Id =: brandId) and LinkedEntity.Type=:ObjectName]) 
            {contentIds.add(cont.ContentDocumentId);
            }
        }else{
            for (ContentDocumentLink cont :[SELECT ContentDocumentId, LinkedEntityId FROM ContentDocumentLink where LinkedEntityId in ( SELECT Id FROM Lot__c where Id =: brandId) and LinkedEntity.Type=:ObjectName])
            {contentIds.add(cont.ContentDocumentId);   
            }
        }
return [SELECT Id,Title FROM ContentVersion WHERE ContentDocumentId IN :contentIds LIMIT 1];
    }
}