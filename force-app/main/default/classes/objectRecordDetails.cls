public class objectRecordDetails {
    @AuraEnabled 
    public static List<String> getFieldSet(String Obj){ 
        Schema.SObjectType sObj = Schema.getGlobalDescribe().get(Obj);
        List<String> fieldSetList = new List<String>(); 
        for(Schema.FieldSetMember fs : sObj.getDescribe().fieldSets.getMap().get('Custom_Detail_Page').getFields())
        { 
            fieldSetList.add(fs.getFieldPath());
        } 
        return fieldSetList;
    } 
}