public inherited sharing class TowerMapController {
     @AuraEnabled
     public static List<Tower__c> getAllTowers() {
          String theObject = 'Tower__c';
          List<String> theFields = new List<String>{'Id', 'Name', 'State__r.Name'}; 
          String theFilter = '';
          String sortField = 'Name';
          String sortOrder = 'ASC';
          List<Tower__c> allTowers = UtilityClass.queryObjects(theObject, theFields, theFilter, sortField, sortOrder);
         system.debug('=== print allTowers ==' + allTowers);
         return allTowers;
     }
}