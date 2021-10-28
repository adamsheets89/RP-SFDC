public without sharing class DeveloperTestApexController {
    @AuraEnabled
    public static List<Account> getAccountList() {
        try {
            return [SELECT Id, Name, NumberOfEmployees FROM Account LIMIT 5];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
