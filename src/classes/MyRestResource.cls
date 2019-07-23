@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource {

    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
    }
  
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
  
  @HttpPost
    global static String doPost() {
        try{
            system.debug('Hello');
            RestRequest req = RestContext.request;
            String strJSONBody = req.requestBody.toString();
            //CreateAccFromRest.createAcc(strJSONBody);
            
            SampleJSONTest clSam = new SampleJSONTest();
            clSam = (SampleJSONTest)JSON.deserializeStrict(strJSONBody, SampleJSONTest.class);
            System.debug('LondaChef' + clSam );              
            
        }catch(Exception e){
            System.debug('LondaChef Exception' + e.getMessage());              
        }
              
        return('Je Baat');
        
    }
    
    public class SampleJSONTest{
        public String att1;
        public String att2;
        public String att3;
        public subobj subobj;
        
    }
    
    public class subobj{
            public String subatt1;
            public String subatt2;
        }
        
        
    //
    //-------------------------------------------------------------- LExus Check
    
    public class obj_lead{
        String str_quantity = 'str_quantity';
        String str_direct_billing_flag = 'str_direct_billing_flag';
        String type = 'type';
        String url = 'url';
        String so_code = 'so_code';
    }
    
    public class obj_Address_Detail {
        String Id = 'Id';
        String Status = 'Status';
        String Rating = 'Rating';
        String LX_Dealer = 'LX_Dealer__c';
        String LeadSource = 'LeadSource';
        String CreatedDate = 'CreatedDate';
        String Salutation = 'Salutation';
        String Name = 'Name';
        String FirstName = 'FirstName';
        String LastName = 'LastName';
        String LX_Customer_Type = 'LX_Customer_Type__c';
        String MobilePhone = 'MobilePhone';
        String Phone = 'Phone';
        String totalSize = 'totalSize';
        String done = 'done';
        String type = 'type';
        String url = 'url';
        String LX_Lead = 'LX_Lead__c';
        String LX_Street = 'LX_Street__c';
        String LX_City = 'LX_City__c';
        String LX_Zip_Postal_Code = 'LX_Zip_Postal_Code__c';
    }
    
    public class Model_of_Interests{
        String LX_Lead= '';
        String Id = '';
        String LX_Product = '';
        String totalSize = '';
        String done = '';
        String type = '';
        String url = '';
        String ProductCode = '';
        String LX_SuffixCode = '';
        String LX_ColorCode = '';
        String LX_INTERIOR_COLORCODE = '';
        String RecordTypeId = '';
    }
    
    public class LX_Dealer{
        String Id = '';
        String LX_Dealer_Code = '';
        String LX_Group_Code = '';
        String type = '';
        String url = '';
    }
    //-------------------------------------------------------------- LExus Check
    public class objWrap{
        public Enquiry Enquiry;
    }
    public class Enquiry{
        public Detail Detail;
    }
    
    public class Detail{
        public String EnquiryId;
        public String ICROP_Enquiry_Number;
        public String status;

    }
    
    //--------------------Lexus cancel callout
    public class wrap{
        public attributes attributes;
        public List<LX_details> LX_details;
    }
    public class attributes{
        public String type='';
        public String url='';
    }
    
    
    public class LX_details{
        public String LX_CTDMS_Enquiry_Reference_ID = '';
        public String LX_Dealer_Code = '';
        public String StageName = '';
        public String LX_Booking_Cancellation_Date = '';
        public String LX_Reason_for_Cancellation = '';
        public String LX_Order_Booking_Number = '';
        public String LX_Order_Cancelled_Date = '';
        public String LX_Invoice_Number = '';
        public String LX_Invoice_Cancelled_Date = '';
        public String Id = '';
        public String RecordTypeId = '';
    }
}