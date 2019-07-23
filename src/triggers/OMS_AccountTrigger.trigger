trigger OMS_AccountTrigger on Account (before delete) {
    if(Trigger.isUpdate){
            new OMS_AccountTriggerHandler().run();
    }
}