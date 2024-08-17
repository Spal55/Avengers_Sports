@isTest
public class TestSportsManagerTriggerHandler {
    @isTest 
    static void testSendEmailToSportsManagerWithValidEmail() {
        Sport_Manager__c a = new Sport_Manager__c(Name='hari',Email__c = 'ramkeerthi56@gmail.com', Age__c= 34 ,Experience__c= 6, Phone_no__c='9786653269');

        List<Sport_Manager__c> managers = new List<Sport_Manager__c>();
        managers.add(a);

        Test.startTest();
        SportsManagerTriggerHandler.sendEmailToSportsManagerForReg(managers);
        system.debug(Limits.getEmailInvocations());
        System.assertEquals(1, Limits.getEmailInvocations(), 'An email should have been sent');
        Test.stopTest();
        //System.assertNotEquals(1, Limits.getEmailInvocations(), 'An email should have been sent');
    }

    @isTest 
    static void testSendEmailToSportsManagerWithoutEmail() {
        List<Sport_Manager__c> managers = new List<Sport_Manager__c>{
            new Sport_Manager__c(Name='Jaya',Email__c = null)
        };

        Test.startTest();
        SportsManagerTriggerHandler.sendEmailToSportsManagerForReg(managers);
        Test.stopTest();

        System.assertEquals(0, Limits.getEmailInvocations(), 'No email should have been sent');
        System.assert(managers[0].getErrors().size() > 0, 'An error should have been added');
    }
}