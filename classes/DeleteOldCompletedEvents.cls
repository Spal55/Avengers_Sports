public class DeleteOldCompletedEvents implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        DateTime twoYearsAgo = DateTime.now().addYears(-2);
        String dateString = twoYearsAgo.format('yyyy-MM-dd\'T\'hh:mm:ss\'Z\'');
        String query = 'SELECT Id, name FROM Event__c WHERE Event_Completion__c = \'Completed\' AND Event_End_Date__c <= ' + dateString;
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        Database.delete(scope, false);
    }
    
    public void finish(Database.BatchableContext BC) {
        System.debug('task finish');
    }
}