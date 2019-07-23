public class WrapperContacts{
        @AuraEnabled
        public Boolean selected;
        @AuraEnabled
        public contact cntact;
    	@AuraEnabled
        public String success;
    public WrapperContacts(){
        selected = false;
        cntact = new contact();
        success = '';
    }
}