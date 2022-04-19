public class MyContactListController {
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId) {
        return [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE AccountId = :recordId];
    }
       @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityWithAccounts(String accId) {
        return [
            SELECT AccountId, Id, Amount, CloseDate, StageName, Description, Name
            FROM Opportunity
            WHERE AccountId = :accId
            WITH SECURITY_ENFORCED
        ];
    }

    
}