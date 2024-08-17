trigger SportsManagerTrigger on Sport_Manager__c (after insert) {
	if(Trigger.isAfter){
        if(Trigger.isInsert){
            SportsManagerTriggerHandler.sendEmailToSportsManagerForReg(Trigger.new);
        }
         
    }
}