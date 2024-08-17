import { LightningElement, api, wire} from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import SPORTS_NAME_FIELD from '@salesforce/schema/Event__c.Sports_Name__c';

export default class ResultsDisplayComp extends LightningElement {
    @api recordId;
    sportsName;

    @wire(getRecord, { recordId: '$recordId', fields: [SPORTS_NAME_FIELD] })
    wiredRecord(result) {
        this.wiredRecordResult = result;
        const { data, error } = result;
        if (data) {
            this.sportsName = getFieldValue(data, SPORTS_NAME_FIELD);
        } else if (error) {
            console.error('Error fetching Event record:', error);
        }
    }

    get isCricket() {
        return this.sportsName === 'Cricket';
    }

    get isFootballOrHockey() {
        return this.sportsName === 'Football' || this.sportsName === 'Hockey';
    }

    get isRunningOrJumping() {
        return this.sportsName === 'Running' || this.sportsName === 'Jumping';
    }

    
}