public class OpportunityRelatedAccount {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getAccountDetails(string oppId) {
        System.debug('here id: ' + oppId);
        return [
          select id,account.name,account.site, name from opportunity WHERE Id = :oppId
        ];
    }

}