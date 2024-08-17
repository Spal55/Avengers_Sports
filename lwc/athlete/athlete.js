import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class Athlete extends NavigationMixin(LightningElement) {
    recordFormKey = 0;
    fields = ['Name', 'sports_specialization__c', 'AccountId', 'Age__c','Approval_Status__c', 'Notable_achievements__c', 'Do_you_want_to_register_for_events__c', 'Email', 'MobilePhone', 'City__c', 'District__c','State__c', 'Pincode__c'];

    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Athlete record created",
            message: "Name: " + event.detail.fields.LastName.value,
            variant: "success"
        });

        
        this.dispatchEvent(toastEvent);


         this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:event.detail.id,
                objectApiName:'Contact',
                actionName:'view'
            }
        });
    }
}