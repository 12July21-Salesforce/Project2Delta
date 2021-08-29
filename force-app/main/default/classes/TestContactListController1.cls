public with sharing class TestContactListController1 {
    
    static String sanitizeQueryString(String aQuery) {
    
        if (aQuery == null) return '%';

        String trimmedQuery = aQuery.trim();
        if (trimmedQuery.length() == 0) return '%';

        return '%' + trimmedQuery.replaceAll('\\W+', '%') + '%';
    }

    @AuraEnabled
    public static List<Contact> allContacts(String nameFilterString) {
    String composedFilter = sanitizeQueryString(nameFilterString);
    return [SELECT Id, Name FROM Contact WHERE Name LIKE :composedFilter ORDER BY Name ASC];
    }
}