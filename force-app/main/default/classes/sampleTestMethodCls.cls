@isTest
public class sampleTestMethodCls {
    static testMethod  void triggercontact(){
        Account acct= new Account(name='testAccount');
        insert acct;
        list<contact> conList=new list<contact>();
        for(integer i=0;i<5;i++){
               contact con=new contact(lastname='testContact'+i,AccountId=acct.Id);
            conList.add(con);
        }
        test.startTest();
        if(conList.size()>0){
            insert conList;
        }
        test.stopTest();
    }
}