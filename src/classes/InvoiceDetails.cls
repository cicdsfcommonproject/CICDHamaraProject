@RestResource(urlMapping='/lxtopservinvoicecancel')
global class InvoiceDetails{
    @HttpPost
    global static LX_ServiceTopServInvoiceCancelResponse DoPost()
    {
        String storeReqData = '';
        String storeResData = '';
        Boolean errorMessageFlag = false;
        
        // ====================
        
        // variable for functionality
        InvoiceDetailsWrapper objTopServInvoiceCancelWrapperRequest = new InvoiceDetailsWrapper();
        LX_ServiceTopServInvoiceCancelResponse objTopServInvoiceCancelWrapperResponse = new LX_ServiceTopServInvoiceCancelResponse();
        
        //LXCommon commonClass = new LXCommon();
        
        //Savepoint sp = Database.setSavepoint();
        
        try
        {
            String requestBody = RestContext.Request.requestBody.toString();
            storeReqData = requestBody;
            
            if(!String.isBlank(requestBody)){
                objTopServInvoiceCancelWrapperRequest = (InvoiceDetailsWrapper)JSON.deserialize(requestBody, InvoiceDetailsWrapper.class);               
            }
            system.debug('<<objTopServInvoiceCancelWrapperRequest>>' + objTopServInvoiceCancelWrapperRequest);
            
        
            
        }catch(Exception ex){
            system.debug('<<Exception>>' + ex.getMessage());
        }
        return objTopServInvoiceCancelWrapperResponse;
    }
    
    global class LX_ServiceTopServInvoiceCancelResponse
    {
        global string topserv_integration_status;
        global String unique_ro;
        global String error_message;
        
        global LX_ServiceTopServInvoiceCancelResponse(){
            this.topserv_integration_status = '';
            this.unique_ro = '';
            this.error_message = '';
        }
    }
    
    public class InvoiceDetailsWrapper{
        public String DLR_CD;
        public String BRC_CD;
        public String VEH_REG_NO;
        public String VIN_NO;
        public String TAX_INV_DT;
        public String TAX_INV_NO;
        public String TOT_AMT;
        public String JOB_ORD_NO;
        public String SRV_TYP;
        public String Unique_RO;
        public List<FilesDetailsWrapper> listFilesDetailsWrapper;
    }
    
    public class FilesDetailsWrapper{
        public String file_Name;
        public String file_base64_string;
    }
}