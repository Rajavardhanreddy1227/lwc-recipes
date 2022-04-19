import { LightningElement, wire, api, track } from 'lwc';

import getAccountDetails from '@salesforce/apex/OpportunityRelatedAccount.getAccountDetails';

    
export default class RelatedOppportunityidIsAccount extends LightningElement {
    @api recordId;
    @track opportunities;
    @wire(getAccountDetails, {oppId: '$recordId'})
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

}