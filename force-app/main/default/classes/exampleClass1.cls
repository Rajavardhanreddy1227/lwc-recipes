public with sharing class exampleClass1 {

    Contact newCon;

    public exampleClass1(ApexPages.StandardController con) {
          this.newCon = (Contact)con.getRecord();

   

    }
    public pagereference save(){
      Account a = New Account(Name = newCon.FirstName + ' ' + newCon.LastName);
      Insert a;
      newCon.AccountID = a.id;
      insert newCon;

      Pagereference pr = New PageReference('/' + a.id);
      return pr;
   }


}