public with sharing class althlete_info_display {
    @AuraEnabled(cacheable=true)
    public static list<Athletes_In_Event__c> getThat(String athId){
        try{
            return[
                select  Event__c , Athlete__c from Athletes_In_Event__c 
                with security_enforced
            ];

        }catch (Exception e){
            throw new AurahandledException(e.getMessage());
        }


    }

}