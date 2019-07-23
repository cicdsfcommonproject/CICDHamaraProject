Trigger triggerOnCaseInsert on Case(after insert){
    List<Case> lstCaseWithPhoneOrigin = new List<Case>();
    List<Case> lstCaseChildRecords = new List<Case>();
    
    for(Case objCase : Trigger.new){
        system.debug('objCase.Parent : ' + objCase.Parent);
        if(objCase.Origin == 'Phone' && objCase.Parent == null){
            lstCaseWithPhoneOrigin.add(objCase);
        }
    }
    
    system.debug('Case trigger - lstCaseWithPhoneOrigin: ' + lstCaseWithPhoneOrigin);
    
    
    if(lstCaseWithPhoneOrigin.size()>0){
        for(Case objCaseTaverse : lstCaseWithPhoneOrigin){
            for(Integer i = 0 ; i < 5 ; i++){
                Case objcase = new Case();
                system.debug('CASE - ' + objCaseTaverse);
                system.debug('CASE - ParentId' + objCaseTaverse.Id);
                objCase.ParentId = objCaseTaverse.Id;
                objCase.Status = 'New';
                objCase.Origin = 'Email';
                lstCaseChildRecords.add(objcase);
            }
        }   
    }
    
    
    if(lstCaseChildRecords.size() > 0){
        insert lstCaseChildRecords;
    }
}