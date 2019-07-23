trigger OMS_ContactTrigger on Contact(before insert, before update){

    new OMS_ContactTriggerHandler().run();

}