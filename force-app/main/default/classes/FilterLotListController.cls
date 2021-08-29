public class FilterLotListController {
    
    static String sanitizeQueryString(String aQuery) {
    
        if (aQuery == null) return '%';

        String trimmedQuery = aQuery.trim();
        if (trimmedQuery.length() == 0) return '%';

        return '%' + trimmedQuery.replaceAll('\\W+', '%') + '%';
    }

    @AuraEnabled
    public static List<Lot__c> allLots(String lotFilterStg) {
    String stgFilter = sanitizeQueryString(lotFilterStg);
    return [SELECT Id, Name FROM Lot__c WHERE Name LIKE :stgFilter ORDER BY Name ASC];
    }
}