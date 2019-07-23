public class DemoPage1Controller{
    public List<Contact> contactList{get;set;}
    public List<Contact> contactListAllRecords{get;set;}
    public List<Contact> contactListForPagination{get;set;}
    public string searchText{get;set;}
    public Integer indexNext = 0;
    public Integer indexPrevious = 0;
    Public string titleName{get;set;}
    public DemoPage1Controller(){
        contactList = new List<Contact>();
        contactListAllRecords = new List<Contact>();
        contactListForPagination = new List<Contact>();

        contactListAllRecords = [select firstName,lastName,email from contact  LIMIT 40000 ];

        nextButtonClick();
    }

    public void searchContact(){
        contactList = [select firstName,lastName,email from contact where name like : '%'+searchText+'%' and title like : '%'+titleName+'%' LIMIT 1000 ];
    }

    public void nextButtonClick(){
        system.debug('INSIDE NEXTBUTTONCLICK');
        contactListForPagination.clear();
        for(Integer y = indexNext; y < 10;  y++){
            system.debug('VALUE : ' + contactListAllRecords.get(y));
            contactListForPagination.add(contactListAllRecords.get(y));
        }
        indexNext = indexNext + 10;
        indexPrevious = indexNext - 10;
    }

    public void previousButtonClick(){
        contactListForPagination.clear();
        for(Integer y = indexPrevious; y < 10;  y++){
            contactListForPagination.add(contactListAllRecords.get(y));
        }
        indexNext = indexNext - 10;
        indexPrevious = indexNext - 10;
    }


    Public List<Selectoption> getselectedaccnamefields(){
        List<Selectoption> lstnamesel = new List<selectoption>();
        lstnamesel.add(new selectOption('', '- None -'));
        //for(Account acc :[SELECT id,name,phone,type,industry FROM Account]){
        //lstnamesel.add(new selectoption(acc.id,acc.name));
        //}
        lstnamesel.add(new selectOption('CEO', 'CEO'));
        return lstnamesel;
    }


}