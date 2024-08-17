trigger AthleteInEventTrigger on Athletes_In_Event__c (after insert) {
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AthleteInEventTriggerHandler.sendMailToAthleteInEvent(Trigger.new);
        }
        
    }

}