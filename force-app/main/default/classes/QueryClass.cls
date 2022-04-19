public with sharing class QueryClass { 
    @auraenabled
    public static string queryMethod(string Obj){ 
        Map<String, schema.sobjectType> sobjType= schema.getglobaldescribe(); 
        schema.sobjectType findObj = sobjType.get(Obj); 
        schema.describesobjectresult dor = findObj .getdescribe(); 
        map<string, schema.sobjectfield> sObjField = dor.fields.getmap();
        set<string> str = sObjField .keyset(); 
        String query = ''; 
        for(string addfields: str){ 
            query = query+addfields+', '; 
         } 
        query = query.substring(0,query.length()-2);
        String allfields = query; 
        String soql = 'SELECT ' + query + ' FROM '+Obj; 
        return soql; 
    } 
}