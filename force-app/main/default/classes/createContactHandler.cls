public class createContactHandler {
    public static void  createContactMethod(map<id,Account> newMapAcc,map<id,account> oldMapAcc){
        set<id> accId= new set<Id>();
        List<contact> conList=new List<contact>();
        for(Account acc:newMapAcc.values()){
            system.debug('accounts=========>'+acc);
            if(newMapAcc.get(acc.id).Creat_Contact__c && oldMapAcc.get(acc.Id).Creat_Contact__c){
                contact con= new contact();
                con.accountId=newMapAcc.get(acc.id).id;
                system.debug('Accountid===>'+con.AccountId);
                con.FirstName='Firstname';
                con.LastName ='Lastname';
                conList.add(con);
            }
        }
        Insert conList;
        
    }

}