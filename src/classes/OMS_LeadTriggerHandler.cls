public class OMS_LeadTriggerHandler extends TriggerHandler{
    public OMS_LeadTriggerHandler(){}
    
    protected override void  afterUpdate(){
        setContactPrimary();
    }
    
    public void setContactPrimary(){
        List<Contact> updateContactList = new List<Contact>();
            for(Lead l : (List<Lead>)Trigger.new){
                if(l.IsConverted && l.ConvertedContactId  != null){
                        updateContactList.add(new Contact(id = l.ConvertedContactId,OMS_Is_Primary__c = true));
                }
            }
            update updateContactList;
    }
}