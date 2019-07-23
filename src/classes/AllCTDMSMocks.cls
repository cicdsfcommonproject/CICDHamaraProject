@isTest
global class AllCTDMSMocks{
    
    global class LXSerCTDMSBookingCancelSuccMockTracker implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest request){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"CancelDetails": { "Detail": { "LX_Order_Booking_Number": "ORD190000119", "Dealer_Code": "DL08B", "status": "SUCCESS", "LX_Invoice_Number": "", "errorMsg": "" } }}');
            return response;
        }
    }
    
    
    global class LXSerCTDMSBookingCancelErrMockTracker implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest request){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"CancelDetails": { "Detail": { "LX_Order_Booking_Number": "ORD190000119", "Dealer_Code": "DL08B", "status": "Failure", "LX_Invoice_Number": "", "errorMsg": "" } }}');
            return response;
        }
    }
    
    global class LXSerCTDMSInvoiceCancelSuccMockTracker implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest request){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"CancelDetails": { "Detail": { "LX_Order_Booking_Number": "ORD190000131", "Dealer_Code": "DL08B", "status": "SUCCESS", "LX_Invoice_Number": "", "errorMsg": "" } }}');
            return response;
        }
    }
    
    global class LXSerCTDMSInvoiceCancelErrMockTracker implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest request){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"CancelDetails": { "Detail": { "LX_Order_Booking_Number": "ORD190000131", "Dealer_Code": "DL08B", "status": "Failure", "LX_Invoice_Number": "", "errorMsg": "" } }}');
            return response;
        }
    }
}