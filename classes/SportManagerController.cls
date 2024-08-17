public with sharing class SportManagerController {
    @AuraEnabled
    public static String createSportManager(String firstName, String lastName, Date dob, Integer age, Integer experience, Decimal salary, String status, String phone, String email, String city, String district, String state, String pincode) {
        Sport_Manager__c sm = new Sport_Manager__c();
       
        
        sm.Age__c = age;
        sm.Experience__c = experience;
        sm.Status__c = status;
        sm.Phone_no__c = phone;
        sm.Email__c = email;
        sm.City__c = city;
        sm.District__c = district;
        sm.State__c = state;
        sm.Pincode__c = pincode;
        insert sm;
        return sm.Id;
    }
}