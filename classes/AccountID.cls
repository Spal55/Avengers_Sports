public class AccountID {
    public static Set<String> getaccID(ID i1, ID i2)
    {
        Set <Account> accID= new Set<Account>([SELECT id, name FROM Account WHERE id IN(:i1, :i2)]);
        Set <String> accname=new Set<String>();
         for(Account acID:accID)
        {
            accname.add(acID.name);
        }
            return accname;
    } 

}