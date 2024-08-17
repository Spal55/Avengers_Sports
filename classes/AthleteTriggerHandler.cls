public class AthleteTriggerHandler {
    public static void sendEmailToAthleteForRegConfirm(List<Contact> athlete){
        List<String> emailIds = new List<String>();
        for(Contact a : athlete){
            if(a.Email == null){
                a.addError('enter email id ');
            }
            else{
                emailIds.add(a.Email);
                sendEmail(emailIds);
                emailIds.clear();
            }            
        }        
    }
    public static void sendEmail(List<String> emailIds){
        Messaging.SingleEmailMessage emailSend = new Messaging.SingleEmailMessage();
        emailSend.setToAddresses(emailIds);
        emailSend.setSubject('Welcome to our Club!');
        emailSend.setPlainTextBody('Dear Athlete,\n Welcome to our club! We appreciate your participation.');
        Messaging.sendEmail(new List<Messaging.Email> { emailSend });
    }
}