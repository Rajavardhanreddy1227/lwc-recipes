public with sharing class AAA {

    public list<contact> getContacts(){
        list<contact> conlist=[select id,Name,phone,Email from contact];
        list<contact> con=new list<contact>();
        for(contact c:con){
            c.phone='chunty';
            c.email='naveen khaaka';
            con.add(c);
        }
        insert con;
        return conlist;
    }
}