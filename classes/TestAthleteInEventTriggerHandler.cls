@isTest
public class TestAthleteInEventTriggerHandler {
    @isTest 
    static void testSendMailToAthleteInEventWithEmail()
    {
        Contact newAth = new Contact(LastName='hari',Email = 'ramkeerthi56@gmail.com', Approval_Status__c='InProgress', MobilePhone='9786653269');
        Event__c newEve = new Event__c(Name = 'csk');
        Database.insert(newAth,false);
        Database.insert(newEve,false);
        List<Contact> ath =[SELECT Id, Name FROM Contact];
        List<Event__c> e = [SELECT Id, Name FROM Event__c];
        Athletes_In_Event__c a = new Athletes_In_Event__c(Athlete__c = ath[0].Id,Event__c = e[0].Id);
        List<Athletes_In_Event__c> aInEv = new List<Athletes_In_Event__c>();
        aInEv.add(a);
        Test.startTest();
        AthleteInEventTriggerHandler.sendMailToAthleteInEvent(aInEv);
        system.debug(Limits.getEmailInvocations());
        Test.stopTest();
        System.assertEquals(1, Limits.getEmailInvocations(), 'An email should have been sent');
        
    }
}