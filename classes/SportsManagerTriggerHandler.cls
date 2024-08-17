public class SportsManagerTriggerHandler {
    public static void sendEmailToSportsManagerForReg(List<Sport_Manager__c> newRecord){
        List<String> emailIds = new List<String>();
        for(Sport_Manager__c a : newRecord){
            if(a.Email__C == null){
                a.addError('enter email id ');
            }
            else{
                emailIds.add(a.Email__c);
                sendEmail(emailIds);
                emailIds.clear();
            }            
        }
    }
    
    public static void sendEmail(List<String> emailIds){
        
        Messaging.SingleEmailMessage emailSend = new Messaging.SingleEmailMessage();
        emailSend.setToAddresses(emailIds);
        emailSend.setSubject('Welcome to our Club!');
        emailSend.setPlainTextBody('Dear Sports Manager,\n Welcome to our club! We appreciate your participation.');
        Messaging.sendEmail(new List<Messaging.Email> { emailSend }); 
    }

}