trigger AccountTrigger on Account (before insert,Before update, After Insert, After Update) {
   /* createContactHandler.createContactMethod(Trigger.newMap,Trigger.oldMap);
    if(Trigger.isBefore && Trigger.IsInsert){
        system.debug('New Account created');
    }
    if(Trigger.IsUpdate){
        if(Trigger.Isbefore){
            for(Account acc1: Trigger.new){
                system.debug('update Account name===========>'+acc1.name);
                //system.debug('Update contact====>'+Trigger.newMap.get(acc1.id).acc1.nameacco);
                system.debug('old Account old Trigger=====>'+Trigger.oldMap.get(acc1.Id).name);

            }
            if(Trigger.IsAfter){
                set<id> getAccountId = new set<id>();
                for(Account acc:Trigger.new){
                    getAccountId.add(acc.id);
                }
                list<contact> conlist=[select id,name, accountid,MailingStreet,Description from contact where accountid in:getAccountId];
                list<contact> updateContact=new list<contact>();
                for(account acclist:Trigger.new){
                    
                    for(contact con1:conlist){
                        con1.Description=acclist.BillingStreet;
                        con1.MailingStreet = acclist.BillingStreet;
                        updateContact.add(con1);
                        system.debug('updatecontact=======>'+updateContact);
                    }
                    update updateContact;
                }
                
                
                for(Account acc2 : Trigger.old){
                    system.debug('update contact old Trigger=====>'+Trigger.oldMap.get(acc2.id).name);
                }
                
            }
        }
    }*/
    
    Set<Id> set_accountId = new Set<Id>();
    List<Contact> contactList = new List<Contact>();
    for(Account acc : Trigger.new)
    {
        if(acc.description!=Trigger.oldMap.get(acc.id).description)
            set_accountId.add(acc.id);
    }
    
    Map<Id,List<Contact>> mp_ListContact = new Map<Id,List<Contact>>();
    
    for(Contact con : [Select Id,AccountId,checkbox__c from Contact where accountId IN : set_accountId])
    {
        if(mp_ListContact!=null && mp_ListContact.containsKey(con.AccountId))
        {
            List<Contact> conList = mp_ListContact.get(con.AccountId);
            system.debug('conList======>'+conList);
            conList.add(con);
            mp_ListContact.put(con.AccountId, conList);
            system.debug('conList======>'+conList);

        }
        
        else
            mp_ListContact.put(con.AccountId, new List<Contact>{con});
        
    }
    
    
    for(Account acc : Trigger.new)
    {
        if(mp_ListContact!=null && mp_ListContact.containsKey(acc.id))
        {
            for(Contact con : mp_ListContact.get(acc.id))
            {
                // Write logic to update contact as sample below : 
                con.checkbox__c = True;
                con.FirstName = acc.Name;
                contactList.add(con);
            }
        }
    }
    
    if(contactList!=null && contactList.size()>0)
        update contactList;
    

}