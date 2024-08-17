@isTest
public class DeleteOldCompletedEventsTest {
    static testMethod void testDeleteOldCompletedEvents() {
        Event__c oldEvent = new Event__c(
            Name = 'Test Old Event',
            Event_Completion__c = 'Completed',
            Event_End_Date__c = DateTime.now().addYears(-3)
        );
        insert oldEvent;
        Event__c newEvent = new Event__c(
            Name = 'Test New Event',
            Event_Completion__c = 'Completed',
            Event_End_Date__c = DateTime.now().addYears(-1)
        );
        insert newEvent;
         Event__c incompleteEvent = new Event__c(
            Name = 'Test Incomplete Event',
            Event_Completion__c = 'In Progress',
            Event_End_Date__c = DateTime.now().addYears(-3)
        );
        insert incompleteEvent;
 
        DeleteOldCompletedEvents batch = new DeleteOldCompletedEvents();
 
        Test.startTest();
        Database.executeBatch(batch);
        Test.stopTest();
 
        System.assertEquals(0, [SELECT count() FROM Event__c WHERE Id = :oldEvent.Id],'Batch run fully');
        System.assertEquals(1, [SELECT count() FROM Event__c WHERE Id = :newEvent.Id],'Batch run but not deleted');
        System.assertEquals(1, [SELECT count() FROM Event__c WHERE Id = :incompleteEvent.Id],'Batch run but not deleted due to not completed event');
    }
}