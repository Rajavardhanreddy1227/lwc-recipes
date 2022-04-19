public class updateContactPhone implements
Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, BillingStreet, BillingCity, BillingState, ' +
            'BillingPostalCode, (SELECT ID, MailingStreet, MailingCity, ' +
            'MailingState, MailingPostalCode FROM Contacts) FROM Account ' +
            'Where BillingCountry = \'USA\''
        );
    }
    
    public void execute(Database.BatchableContext bc,list<account> ac){
        List<Contact> contacts = new List<Contact>();
        for(Account acc:ac){
            for(Contact con:acc.contacts){
                con.HomePhone=acc.phone;
                Contacts.add(con);
               recordsProcessed = recordsProcessed + 1;

            }
        }
        update contacts;
        
    }
    public void finish(Database.BatchableContext bc)
    {
     system.debug('recordsProcessed==='+recordsProcessed);  
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
    }
}