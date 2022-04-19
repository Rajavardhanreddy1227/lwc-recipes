trigger ContactTrigger on Contact (After Insert, After Update) {
    Set<id> Accountids = new set<id>();
    List<Account> Accounts = new List<Account>();
    if(trigger.new != null)
    {
        for(Contact con:trigger.new)
        {
            if(con.Level__c	 =='secondary')
            {
                AccountIds.add(con.AccountId);
                system.debug('update contactids=========>'+AccountIds);
            }
        }
    }
    List<Account> a= [Select id,Rating from Account where Id IN: AccountIds];
    system.debug('list of Accounts==============>'+a);
    if(a != null){
        for(Account acc: a)
        {
            acc.Rating ='Hot';
            Accounts.add(acc);
        }
    }
    update Accounts;
    system.debug('update Accounts====================>'+Accounts);
}


    
    

    
    /*if(Trigger.IsBefore && Trigger.IsInsert){
        /* List<contact> conlist= new list<contact>();
set<id> accountid= new set<id>();
map<integer,Contact> mapWIthContactAccount= new map<integer,Contact>();
for(Contact con: Trigger.new){

}*/
        
       /* list<contact> conlist= new list<contact>();
        Set<Id> accountIdSet= new Set<Id>();
        List<account> accountUpdateList= new List<Account>();
        Map<Id,String> accountIdwithContactName=new Map<Id,String>();
        for(Contact con: conlist){
            AccountIdSet.add(con.AccountId);    
            accountIdwithContactName.put(con.Accountid,con.Lastname);
            system.debug('accountIdwithContactName========>'+accountIdwithContactName);
        }
        if (!accountIdwithContactName.isEmpty()) {
            for (Account acc : [SELECT Id,Name FROM Account WHERE Id IN :accountIdwithContactName.KeySet()]) {
                acc.name= accountIdwithContactName.get(acc.Id);
                accountUpdateList.add(acc);   
            }
            system.debug('accountIdwithContactName==='+accountIdwithContactName);
        }
        if (!accountUpdateList.isEmpty()) {
            update accountUpdateList;
            system.debug('accountUpdateist==='+accountUpdateList);
        }
        
    }
    
}*/