public class CreateAccFromRest{
    
    public createAccFromRest(){
    
    }
    
    public static void createAcc(String strJSONBody){
        AccountParser objAcc = new AccountParser();
        List<AccountParser> lstAccParser = new List<AccountParser>();
        List<Account> lstAcc = new List<Account>();
        
        System.debug('Inside createAccount' + strJSONBody);
        // Parse entire JSON response.
        JSONParser parser = JSON.createParser(strJSONBody);
        system.debug('Parser--soni--' + parser);
        
        while (parser.nextToken() != null) {                       
            if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                 while (parser.nextToken() != null) {                       
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                        objAcc = (AccountParser)parser.readValueAs(AccountParser.class);
                        System.debug('Soni inv' + objAcc);
                        lstAccParser.add(objAcc);
                    }
                }   
            }            
        }
        
        for(AccountParser obj : lstAccParser){
            Account objInsAcc = new Account();
            objInsAcc.Name = obj.AccName;
            objInsAcc.AccountNumber = obj.AccNumber;
            objInsAcc.Phone = obj.Phone;
            objInsAcc.AnnualRevenue = obj.Revenue;
            lstAcc.add(objInsAcc);
        }
        
        insert lstAcc;
    }
    
    public class AccountParser{
        public String AccName {get;set;}
        public String AccNumber {get;set;}
        public String Phone {get;set;}
        public Decimal Revenue {get;set;}
    }
}