public class Accountname {	
    
    public static Set<String> getaccName(String name1 , String name2){
        List <Account> accname = [Select Name From Account where Name IN (:name1,:name2)];
        set <String> setaccname = new set<String>();
        For(Account namek : accname){
            setaccname.add(namek.name);
        }
        return setaccname;  
    }
}