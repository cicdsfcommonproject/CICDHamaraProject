public class DisplayWrpperApexController {	
    @AuraEnabled
    public static List<WrapperContacts> getwrapedList(){
        if(Schema.sobjectType.Contact.isAccessible()){
            List<WrapperContacts> wrapedList = new List<WrapperContacts>();
            for(Contact c : [select id,Name,FirstName,LastName,email from Contact]){
                WrapperContacts temp = new WrapperContacts();
                temp.selected = false;
                temp.cntact = c;
                
                wrapedList.add(temp);
            }
            
            return wrapedList;
        }else{
            return null;
        }
    }
    
    @AuraEnabled
    public static WrapperContacts getUpdate(String id,String Name){
        Contact c = new contact(Id=id,LastName=Name); 
        update c;
        WrapperContacts temp = new WrapperContacts();
        temp.selected = false;
        temp.cntact = c;
        temp.success = 'updated';
        return temp;
    }
}