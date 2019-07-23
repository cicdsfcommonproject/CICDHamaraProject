public class SampleMassContactController{
    public List<Contact> contactList{get;set;}
    public List<Contact> deleteContactList = new List<Contact>();
    public SampleMassContactController(){
        contactList = new List<Contact>();
        
        addRow();
        
          
    }
    
    public void addRow(){
        Contact con = new Contact();
        contactList.add(con);
    }
    
    public void removeRow(){
        Integer indexVal = Integer.valueof(system.currentpagereference().getparameters().get('index'));
    
        if(contactList[indexVal - 1].Id != null)
            deleteContactList.add(contactList[indexVal - 1]);
           
        contactList.remove(indexVal - 1);  
    }
    
    public void saveContacts(){
        try{
            insert contactList;
            
            contactList = new List<Contact>();
        
            addRow();
        
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Records created successfully!'));    
            
        }catch(exception e){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,e.getMessage()));    
        }
    }
}