public class LXOptionsMultiselect {
    @AuraEnabled
    public String value{get; set;}
    
    @AuraEnabled
    public String label{get; set;}
    
    @AuraEnabled
    public String externalParameter{get; set;}
    
    @AuraEnabled
    public String externalParameter2{get; set;}
    
    public LXOptionsMultiselect(String value, String label) {
        this.value = value;
        this.label = label;
    }
    
    public LXOptionsMultiselect(String value, String label, String externalParameter) {
        this.value = value;
        this.label = label;
        this.externalParameter = externalParameter;
    }    
    
    public LXOptionsMultiselect(String value, String label, String externalParameter, String externalParameter2) {
        this.value = value;
        this.label = label;
        this.externalParameter = externalParameter;
        this.externalParameter2 = externalParameter2;
    }
}