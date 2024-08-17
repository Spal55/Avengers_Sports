public class DisplayResults {
    @AuraEnabled(cacheable=true)
    public static List<Event__c> eventResult(String sportsCricket){
        try{
        return [SELECT First_athlete__c, Second_athlete__c, Third_athlete__c, Most_goals__c,Most_runs__c, Most_wicket__c, Man_of_the_match__c FROM Event__c WHERE Sports_Name__c=:sportsCricket];
            }
        catch ( Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    /*@AuraEnabled(cacheable=true)
    public static List<Event__c> football(String sportsFootball){
        try{
        return [SELECT Most_goals__c, Man_of_the_match__c FROM Event__c WHERE Sports_Name__c=:sportsCricket];
            }
        catch ( Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }*/
}