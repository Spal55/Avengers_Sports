public class AthleteInEventTriggerHandler 
{
    public static void sendMailToAthleteInEvent(List<Athletes_In_Event__c> newRecords )
    {
        List<String> emailIds = new List<String>();
        
        List<Id> comName = new List<Id>();
        for(Athletes_In_Event__c a : newRecords)
        {
            comName.add(a.Athlete__c);
        }
        List<Contact> contList = [SELECT Id, Name,Email FROM Contact WHERE Id IN :comName];
        for(Contact b : contList)
        {
            emailIds.add(b.Email);
         }
        Messaging.SingleEmailMessage emailSend = new Messaging.SingleEmailMessage();
        emailSend.setToAddresses(emailIds);
        emailSend.setSubject('Acknowledgement of Event Registration');
        emailSend.setPlainTextBody('Dear athlete ,\n you are registerd for an event');
        Messaging.sendEmail(new List<Messaging.Email> { emailSend }); 
        system.debug(emailSend);
    }
}