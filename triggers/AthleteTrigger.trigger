trigger AthleteTrigger on Contact (after insert) {
    if(Trigger.isafter){
        if(Trigger.isInsert){
         AthleteTriggerHandler.sendEmailToAthleteForRegConfirm(Trigger.new);
        }
    }

}