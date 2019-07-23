public class OMS_ContactTriggerHandler extends TriggerHandler{
    public OMS_ContactTriggerHandler(){
    }
    
    public override void beforeInsert(){
        checkSinglePrimaryContact();
    }
    
    public override void beforeUpdate(){
        checkSinglePrimaryContact();
    }
    
    public void checkSinglePrimaryContact(){
        Set<Id> setAccountId = new Set<Id>();
        for(Contact objContact : (List<Contact>)trigger.new){
            if(objContact.accountId != null){
                setAccountId.add(objContact.accountId);
            }
        }
        
        List<Account> listAccounts;
        if(setAccountId != null && setAccountId.size()>0){
            listAccounts = [select id, (select id, OMS_Is_Primary__c from Contacts where OMS_Is_Primary__c = true) from Account WHERE Id In: setAccountId];
        }
        
        Map<id, boolean> boolAccWithMorePrimaryCon = new map<id,boolean>();
        if(listAccounts != null && listAccounts.size()>0){
            for(Account objAccount : listAccounts){
                boolAccWithMorePrimaryCon.put(objAccount.id, objAccount.contacts.size() > 0 ? true : false);
                System.debug('Soni objAccount.contacts.size():-' + objAccount.contacts.size());
            }
        }
        
        for(Contact objContact : (List<Contact>)trigger.new){
            if(Trigger.isInsert){
                System.debug('Inside Insert');
                if(objContact.OMS_Is_Primary__c){   
                    if(boolAccWithMorePrimaryCon.containskey(objContact.AccountId)){
                    System.debug('Soni boolAccWithMorePrimaryCon.get(objContact.AccountId):-' + boolAccWithMorePrimaryCon.get(objContact.AccountId));
                        if(boolAccWithMorePrimaryCon.get(objContact.AccountId) == true){
                            objContact.OMS_Is_Primary__c.addError('Only one primary contact can exist for an associated account!');
                        }
                    }
                }else{
                     if(boolAccWithMorePrimaryCon.containskey(objContact.AccountId)){
                        if(boolAccWithMorePrimaryCon.get(objContact.AccountId) == false){
                            objContact.OMS_Is_Primary__c = true;
                        }
                    }
                }
            }else{
                if(Trigger.isUpdate){
                    List<String> listProfileId = System.Label.OMS_PrimaryChangePermission.Split(',');
                    if(listProfileId != null && listProfileId.size()>0){
                        System.debug('Soni Londa :- ' + Userinfo.getProfileId() + ' ^^^^^ ' + listProfileId.contains(Userinfo.getProfileId()));
                        if(listProfileId.contains(Userinfo.getProfileId().subString(0,15))){
                            if(objContact.OMS_Is_Primary__c){   
                                if(boolAccWithMorePrimaryCon.containskey(objContact.AccountId)){
                                    if(boolAccWithMorePrimaryCon.get(objContact.AccountId) == true){
                                        objContact.OMS_Is_Primary__c.addError('Only one primary contact can exist for an associated account!');
                                    }
                                }
                            }
                        }else{
                            objContact.addError('You dont have rights to make changes!');
                        }
                    }
                }
            }
        }
    }
    
}