@isTest(seeAlldata=true)
public class DisplayWrpperApexControllerTest {
    static testmethod void DisplayWrpperApexController(){
        DisplayWrpperApexController.getwrapedList();
        COntact c = [select id,name from contact limit 1];
        DisplayWrpperApexController.getUpdate(c.Id, c.Name);
    }
}