public without sharing class InvocableClassMakeApexCallout {

    //public class ClsLeadDetailsWrapper{
        @InvocableVariable (label = 'strLeadId')
        public String strLeadId;
    //}

  @InvocableMethod
   public static void invokeapexcallout(list<Id> lstLead) {
     String query = 'select Id, Status, Rating, LX_Dealer__r.LX_Dealer_code__c, LX_Dealer__r.LX_Group_Code__c, LeadSource, CreatedDate, Salutation, Name, FirstName, LastName, LX_Customer_Type__c, Phone, MobilePhone, (select LX_Product__r.ProductCode, LX_Product__r.LX_SuffixCode__c, LX_Product__r.LX_ColorCode__c from Model_of_Interests__r), (select LX_Street__c, LX_City__c, LX_Zip_Postal_Code__c from Address_Detail__r) from lead where id IN' + lstLead;
     //System.debug('SONI Invocable Success-->>' + Database.query(query));
     
     System.debug('<<Soni>>' + lstLead);
     //Futureapexcallout.apexcallout(acc[0].billingstate,acc[0].billingcity,acc[0].id);
   }
}