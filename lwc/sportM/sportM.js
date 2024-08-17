import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class SportManager extends NavigationMixin(LightningElement) {
    recordFormKey = 0;
    fields = ['Name', 'Age__c', 'Experience__c', 'Salary__c', 'Status__c', 'Phone_no__c', 'Email__c', 'City__c', 'District__c', 'State__c', 'Pincode__c'];

    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Sport Manager created",
            message: "Name: " + event.detail.fields.Name.value,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);

        this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:event.detail.id,
                objectApiName:'Sport_Manager__c',
                actionName:'view'
            }
        });
    }
}