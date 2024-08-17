public with sharing class comp1 {
    @AuraEnabled(cacheable=true)
    public static List<Athletes_In_Event__c> getAthletesInEvent(String eventId) {
        return [SELECT Athlete__r.Name FROM Athletes_In_Event__c WHERE Event__c = :eventId];
    }
}