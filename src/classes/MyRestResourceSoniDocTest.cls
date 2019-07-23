@RestResource(urlMapping='/sonidoctest/*')
global with sharing class MyRestResourceSoniDocTest {

  @HttpPost
    global static String doPost() {
        try{
            system.debug('Hello');
            RestRequest req = RestContext.request;
            system.debug('SOni Req>>' + req);
            String strJSONBody = req.requestBody.toString();
            system.debug('Soni>>' + strJSONBody);
            system.debug('Soni Length>>' + strJSONBody.length());
            //CreateAccFromRest.createAcc(strJSONBody);
            
           SampleJSONTest clSam = new SampleJSONTest();
           clSam = (SampleJSONTest)JSON.deserialize(strJSONBody, SampleJSONTest.class);
           System.debug('LondaChef' + clSam );  

            Attachment attach = new Attachment();
            attach.contentType = 'application/pdf';
            attach.name = 'myfile.pdf';
            attach.parentId = clSam.Accid;
            attach.body = EncodingUtil.base64Decode(clSam.AccFileBase64);
            insert attach;         
            
        }catch(Exception e){
            System.debug('LondaChef Exception' + e.getMessage());              
        }
              
        return('Je Baat');
        
    }
    
    public class SampleJSONTest{
        public String Accid;
        public String AccFileBase64;        
    }

}