public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [
            SELECT Firstname, Lastname,Email
            FROM Contact
            WITH SECURITY_ENFORCED
            ORDER BY FirstName
        ];
    }
         //throw new AuraHandledException('Forced error');
}