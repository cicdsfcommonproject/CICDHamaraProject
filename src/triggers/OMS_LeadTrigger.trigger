trigger OMS_LeadTrigger on Lead (after update) {
    new OMS_LeadTriggerHandler().run();
}