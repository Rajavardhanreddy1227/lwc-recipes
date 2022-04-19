public with sharing class AccountRelatedOpp {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        List<Account> accList = [Select Id, Name From Account limit 100];
        return accList;
    }
    @auraEnabled
    public static List<Opportunity> fetchOpportunity(String accountId)
    {
        List<Opportunity> oppList=[SELECT Id,Name,AccountId,CloseDate,StageName,Amount FROM Opportunity WHERE AccountId=:accountId LIMIT 10000];
        return oppList;
    }
    @AuraEnabled
    public static List<Contact> getContacts(String accountId){
        return [Select Id,FirstName,LastName,Email,Phone from Contact where accountId=:accountId];

    }
    @auraEnabled
    public static List<Opportunity> fetchOpportunitybystage(String Stage)
    {
        System.debug('Stage======>'+Stage);
        List<Opportunity> oppList=[SELECT Id,Name,AccountId,CloseDate,StageName,Amount FROM Opportunity WHERE StageName=:Stage LIMIT 10000];
        System.debug('Listtttt====>'+oppList);
        return oppList;
    } 



}