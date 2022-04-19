import {
    LightningElement,
    api,track,
    wire
} from 'lwc';
import {
    getRecord
} from 'lightning/uiRecordApi';

// const fields = [
//     'Contact.Name',
//     'Contact.Title',
//     'Contact.Phone',
//     'Contact.Email',
//     'Contact.Department',
// ];

export default class FetchRecord extends LightningElement {
    @api recordId;
    @track contactRec;
    // by providing field in argument. Uncomment this and comment layout type code to check functionality
    // @wire(getRecord, {
    //     recordId: '$recordId',
    //     fields
    // })
    //By providing layout type in argument
    @wire(getRecord, {
        recordId: '$recordId',
        layoutTypes: ['Full']
    })
        contactRec;

    get department(){
        return this.contactRec.data.fields.Department.value;
    }
    get name() {
        console.log(this.contactRec.data.fields);
     // If you use field option to fetch record you can directly access Name by using
    //  this.contactRec.data.fields.Name.value since we are specifying this in field array
        var name = this.contactRec.data.fields.FirstName.value  +' ' +this.contactRec.data.fields.LastName.value;
        return name;
    }

    get title() {
        return this.contactRec.data.fields.Title.value;
    }

    get phone() {
        return this.contactRec.data.fields.Phone.value;
    }

    get email() {
        return this.contactRec.data.fields.Email.value;
    }
    get AccountName() {
        return this.contactRec.data.fields.AccountName.value;
    }
}