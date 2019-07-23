public class CommonUtils{    
    public static Boolean hasSobjectRecords(String strSObject, String strUserId){
        String strObjName;
        Integer recCount = 0;
        try{
            if(String.isNotBlank(strSObject) && String.isNotBlank(strUserId)){
                Schema.SObjectType type = Schema.getGlobalDescribe().get(strSObject);
                strObjName = String.valueOf(type);
                String queryString = 'Select count() from ' + strObjName + ' where OwnerId =\'' + strUserId + '\'';
                recCount = Database.countQuery(queryString);
            }
        }catch(Exception e){
            System.debug('ERROR:' + e);
        }
        return recCount>0 ? true: false;
    }

    public static List<sObject> listOfSObjectOwnerId(String strSObject, String strUserId){
        String strObjName;
        List<SObject> listSobject;
        try{
            if(String.isNotBlank(strSObject) && String.isNotBlank(strUserId)){
                Schema.SObjectType type = Schema.getGlobalDescribe().get(strSObject);
                strObjName = String.valueOf(type);
                String queryString = 'Select Id, OwnerId from ' + strObjName + ' where OwnerId =\'' + strUserId + '\'';
                listSobject = Database.Query(queryString);
            }
        }catch(Exception e){
            System.debug('ERROR:' + e);
        }
        return listSobject;
    }
}