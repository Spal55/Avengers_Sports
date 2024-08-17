@isTest
public class TestAthleteTriggerHandler {
    @isTest 
    static void testSendEmailToAthleteForRegConfirmWithEmail() {
       
        List<Contact> athlete = new List<Contact>{
            new Contact(LastName='hari',Email = 'ramkeerthi56@gmail.com', Approval_Status__c='InProgress', MobilePhone='9786653269')};
        
        AthleteTriggerHandler.sendEmailToAthleteForRegConfirm(athlete);
    
        System.assertEquals(1, Limits.getEmailInvocations(), 'An email should have been sent');
    }
    @isTest 
    static void testSendEmailToAthleteForRegConfirmWithoutEmail() {
        List<Contact> athlete1 = new List<Contact>{
            new Contact(LastName='Jaya',Email = null, Approval_Status__c='InProgress', MobilePhone='9756653269')};
        
        AthleteTriggerHandler.sendEmailToAthleteForRegConfirm(athlete1);
        
        System.assertEquals(0, Limits.getEmailInvocations(), 'No email should have been sent');
    }
}