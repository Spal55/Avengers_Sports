import { LightningElement, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

export default class ContactSupport extends LightningElement {
    @api recordId;
    wiredResult; 

    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Hi!",
            message: "Your query has been sent",
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
        this.refreshForm();
    }

    refreshForm() {
        refreshApex(this.wiredResult);
        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }
    }
}