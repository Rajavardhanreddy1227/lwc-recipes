/*import { LightningElement , api, track} from 'lwc';

export default class LWBDemoComponent extends LightningElement {
@api recordId;
@api objectApiName;
@track fields = ['Name', 'Title', 'Phone', 'Email'];
}
*/

import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.firstname';
import lastName from '@salesforce/schema/Contact.lastname';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import Phone_FIELD from '@salesforce/schema/Contact.Phone';
export default class contactCreator extends LightningElement {
    objectApiName = CONTACT_OBJECT;
    fields = [NAME_FIELD,lastName, EMAIL_FIELD, Phone_FIELD];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Contact created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}