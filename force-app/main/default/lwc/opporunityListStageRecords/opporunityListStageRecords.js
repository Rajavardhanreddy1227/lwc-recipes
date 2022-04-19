import { LightningElement,wire,track } from'lwc';
import { getPicklistValues } from'lightning/uiObjectInfoApi';
import StageName from'@salesforce/schema/Opportunity.StageName';
import getAccountList from'@salesforce/apex/AccountRelatedOpp.getAccountList';
import fetchOpportunity from'@salesforce/apex/AccountRelatedOpp.fetchOpportunity';
import fetchOpportunitybystage from'@salesforce/apex/AccountRelatedOpp.fetchOpportunitybystage';
constcolumns = [{
    label:'Name',
    fieldName:'Name'
},
                {
                    label:'CloseDate',
                    fieldName:'CloseDate'
                },
                {
                    label:'Stage',
                    fieldName:'StageName',
                },
                {
                    label:'Amount',
                    fieldName:'Amount',
                }
                
               ];
export default class AccountList extends LightningElement{
    @track accountId = '';
    @track opportunityid ='';
    @track opportunities;
    @track opstages;
    @track columns = columns;
    selectedstage;
    selectedsvalue;
    // invoke apex method with wire property and fetch picklist options.
    // pass 'object information' and 'picklist field API name' method params which we need to fetch from apex
    @wire(getAccountList) accounts;
    onValueSelection(event) {
        // eslint-disable-next-line no-alert
        constselectedAccount = event.target.value;
        this.accountId = event.target.value;
        if (selectedAccount != null) {
            fetchOpportunity({
                accountId:selectedAccount
            })
            .then(result=> {
                this.opportunities = result;
                // eslint-disable-next-line no-console
                console.log('result' + JSON.stringify(result) + selectedAccount);
            })
                .catch(error=> {
                this.error = error;
            });
            }
    }
                
      @track StageName
                handleClick(event)
                {
                this.StageName = event.target.value;
            }
                selectedValue;
                getoptions() {
                return [
                { label:'Prospecting', value:'Prospecting' },
                  { label:'Qualification', value:'Qualification' },
                  { label:'Closed Won', value:'Closed Won' },
                  { label:'Needs Analysis', value :'Needs Analysis'},
                  
                  ];
                  }
                  handleChange(event){ 
                this.selectedValue = event.target.value;
            }
           
            @wire(fetchOpportunitybystage) oppors;
            @wire(getPicklistValues, {
                recordTypeId:'012000000000000AAA',
                fieldApiName:StageName
            }) typeValues;
            handleTypeChange(event){
                this.selectedstage = event.target.value;
                this.opportunityid = event.target.value;
                
                if (this.selectedstage != null) {
                    fetchOpportunitybystage({
                        Stage :this.selectedstage
                    })
                    .then(result=> {
                        this.opstages = result;
                        // eslint-disable-next-line no-console
                        console.log('result' + JSON.stringify(result) + this.selectedstage);
                    })
                        .catch(error=> {
                        this.error = error;
                    });
                    }
                    }
                        
}