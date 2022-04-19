import { LightningElement, wire, api } from 'lwc';
import getopportunities from '@salesforce/apex/MyContactListController.getOpportunityWithAccounts';
import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Amount_FIELD from '@salesforce/schema/Opportunity.Amount';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ID_FIELD from '@salesforce/schema/Opportunity.Id';


const COLS = [
    { label: 'Amount', fieldName: 'Amount', type:'currency' },
    { label: 'Name', fieldName: 'Name', editable: true },
    { label: 'Stage', fieldName: 'StageName' },
    { label: 'CloseDate', fieldName: 'CloseDate', type: 'date' },
    { label: 'Description', fieldName: 'Description', type: 'text' }
];
export default class ListViewOpprotunitywithAccountId extends LightningElement {

    @api recordId;
    columns = COLS;
    draftValues = [];

    @wire(getopportunities, { accId: '$recordId' })
    Opportunity;

    handleSave(event) {

        const fields = {}; 
        fields[ID_FIELD.fieldApiName] = event.detail.draftValues[0].Id;
        fields[Amount_FIELD.fieldApiName] = event.detail.draftValues[0].Amount;
        fields[NAME_FIELD.fieldApiName] = event.detail.draftValues[0].Name;

        const recordInput = {fields};

        updateRecord(recordInput)
        .then(() => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Contact updated',
                    variant: 'success'
                })
            );
            // Display fresh data in the datatable
            return refreshApex(this.Opportunity).then(() => {

                // Clear all draft values in the datatable
                this.draftValues = [];

            });
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating or reloading record',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        });
    }
}