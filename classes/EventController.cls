public with sharing class EventController {
    @AuraEnabled(cacheable=true)
    public static List<String> getSportTypeFields(String sportType) {
        List<String> fieldsToShow = new List<String>();
        if (sportType == 'Cricket') {
            fieldsToShow.add('Cricket_Field_1__c');
            fieldsToShow.add('Cricket_Field_2__c');
        } else if (sportType == 'Football') {
            fieldsToShow.add('Football_Field_1__c');
            fieldsToShow.add('Football_Field_2__c');
        } else if (sportType == 'Hockey') {
            fieldsToShow.add('Hockey_Field_1__c');
            fieldsToShow.add('Hockey_Field_2__c');
        } else if (sportType == 'Jumping') {
            fieldsToShow.add('Jumping_Field_1__c');
            fieldsToShow.add('Jumping_Field_2__c');
        } else if (sportType == 'Running') {
            fieldsToShow.add('Running_Field_1__c');
            fieldsToShow.add('Running_Field_2__c');
        }
        return fieldsToShow;
    }
}