public class FetchCampingItem {
    @AuraEnabled
    public static List<Camping_Item__c> getCampingItem() {
        List<Camping_Item__c> ciList = new List<Camping_Item__c>();
            ciList=[SELECT 
                        Name,Price__c,Quantity__c,Packed__c
                    FROM 
                        Camping_Item__c
                    ];
        return ciList;
    }
}