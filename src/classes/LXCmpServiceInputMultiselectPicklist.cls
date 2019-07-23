public class LXCmpServiceInputMultiselectPicklist {
    private static final String SUCCESS_LABEL = 'SUCCESS';
    
    @AuraEnabled
    public static List<LXOptionsMultiselect> getPicklistOptions(String sObjectName, String sObjectFieldName) {
        //trim extra spaces
        sObjectName = sObjectName.trim();
        sObjectFieldName = sObjectFieldName.trim();
        
        Map < String, Schema.SObjectType > metaScehma = Schema.getGlobalDescribe();
        List<LXOptionsMultiselect> listOfOptions = new List<LXOptionsMultiselect>();
        
        Schema.SObjectType sobjectType = metaScehma.get(sObjectName);
        
        List<Schema.PicklistEntry> listOfPickListEntry = sobjectType
            .getDescribe()
            .fields.getMap()
            .get(sObjectFieldName)
            .getDescribe()
            .getPicklistValues();
        
        for (Schema.PicklistEntry picklistEntry: listOfPickListEntry) {
            listOfOptions.add(new LXOptionsMultiselect(picklistEntry.getValue(), picklistEntry.getLabel()));
        }
        
        
        //if(listOfOptions.size() > 1)
        //    listOfOptions.add(0, new GPOptions('--NONE--', '--NONE--'));
        //else
        //    listOfOptions.add(new GPOptions('--NONE--', '--NONE--'));
        
        return listOfOptions;
    }
}