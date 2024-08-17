public class delclub {
    public static void delet(){
        List<Sport_Manager__c> acc = [SELECT Id FROM Sport_Manager__c];
        Database.delete(acc, false);
    }
}