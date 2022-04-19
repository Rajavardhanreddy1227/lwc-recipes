global class CreateAccountEmailService implements Messaging.InboundEmailHandler {
    global messaging.InboundEmailresult handleInboundEmail(messaging.InboundEmail email, messaging.InboundEnvelope envelope) {
        string des='';
        system.debug('@@@@@email:' + email);
        system.debug('@@@@@envelope:' + envelope);
        messaging.InboundEmailresult result = new messaging.InboundEmailresult();
        string Activityname = email.fromname;
        system.debug('@@@@@Activityname:' + Activityname);
        String fromemailaddresss = email.fromAddress;
        system.debug('@@@@@fromemailaddresss:' + fromemailaddresss);
         des = email.plaintextbody;
        system.debug('$$$$des: '+des);
        string tasksubject = email.subject;
        List<Contact> conList = [select id,AccountId from contact where Account.isPartner=true and email=:fromemailaddresss];
        if(conList.size() > 0){
            Account acc = new Account();
            acc.id = conList[0].AccountId;
           
            if((des.contains('yes')) || (des.contains('Yes'))){
                acc.Acceptance_Of_Terms_And_Conditions__c = 'yes';
                acc.Active__c=true;
            }
            else if((des.contains('no')) || (des.contains('No'))){
                acc.Acceptance_Of_Terms_And_Conditions__c = 'no';
                acc.Active__c=false;
            }
           
            update acc;
        }
        return null;
    }
}