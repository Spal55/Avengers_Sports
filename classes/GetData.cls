public class GetData {
    Public Static List<String> getAccount(){
        Map<Id,Account> AccMap = new Map<Id,Account>([SELECT Id, Name FROM Account]);
        List<Id> getAccId = new List<Id>();
        List<String> getAccName = new List<String>();
        for(Account idKey : AccMap.values()){
            getAccId.add(idKey.Id);
            getAccName.add(idkey.name);
        }
        
        List<Id> getConId = new List<Id>();
        List<String> getConName = new List<String>();
        Map<Id,Contact> ConMap = new Map<Id,Contact>([SELECT Id, LastName FROM Contact]);
         for(Contact idKey : ConMap.values()){
            getConId.add(idKey.Id);
            getConName.add(idkey.Lastname);
        }
        List<String> SameName = new List<String>();
        for(Account a : AccMap.values()){
            for(Contact c : ConMap.values()){
                if(a.name == c.Lastname){
                    SameName.add(a.name);
                }
            }
        }
        return SameName;
    }
    public static void main()
    {
        for(integer i=0;i<2;i++){
            System.debug(GetData.getAccount()+'\n');
        }
    }

}