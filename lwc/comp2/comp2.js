import { LightningElement, api, track, wire } from 'lwc';
import getAthletesInEvent from '@salesforce/apex/comp1.getAthletesInEvent';

export default class comp2 extends LightningElement {
    @api recordId;
    @track athletesInEvent;

    @wire(getAthletesInEvent, { eventId: '$recordId' })
    wiredAthletes({ error, data }) {
        if (data) {
            this.athletesInEvent = data.length > 0 ? data : null;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.athletesInEvent = undefined;
        }
    }
}