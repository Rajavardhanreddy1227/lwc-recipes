/*import { LightningElement, wire, api, track } from 'lwc';
import getAccountDetails from '@salesforce/apex/OpportunityRelatedAccount.getAccountDetails';

export default class ContactSheet extends LightningElement {
    @api recordId;
    @track opportunities;
    @wire(getAccountDetails, {oppId: '$recordId',fields: ['Account.Name']})
    getAccountDetails({error, data}){
        if(data){
            console.log('data----'+Data);
            this.opportunities = data;
            this.error = undefined;
        }else{
            this.error = error;
            this.opportunities = undefined;
        }
    }

}*/
import { LightningElement, wire, api, track} from 'lwc';
import getAccountDetails from '@salesforce/apex/OpportunityRelatedAccount.getAccountDetails';
export default class accountDetailsRelatedOpportunityIds extends LightningElement {
@api recordId;
@track Opportunities;
connectedCallback(){
    console.log('Testing====>');
    getAccount();
}
getAccount() {
    getAccountDetails({oppId: '$recordId'})
        .then(result => {
            this.Opportunities = result;
            console.log('result======>'+ JSON.stringify(result));
        })
        .catch(error => {
            this.error = error;
            window.console.log("error: " + JSON.stringify(error));
        });
}

}