public with Sharing class incidentExt {


    public incidentExt(ApexPages.StandardSetController controller) {
		this.selectedIncidents = (List<Incident__c>)controller.getSelected();
    }
    public String HTMLStr;
    private final Incident__c incident;
    private List<Incident__c> selectedIncidents;
        
    public incidentExt(ApexPages.StandardController incidentController) 
    {
        this.incident =(Incident__c)incidentController.getRecord();
    }

	public Datetime incidentDateTime {get;set;}
    
    public String startDate {
    	get {	
    		String dateStr = string.valueOf(incident.Incident_Date_Time__c);
    		String retStr = dateStr.substring(0,4)+dateStr.substring(5,7)+dateStr.substring(8,10);
// set the startDate to Incident_Date_Time - 1;
    		Integer dateInt = integer.valueOf(retStr) - 1;
    		retStr = string.valueOf(dateInt);
    		return retStr;
    	}
 		set;
    }
    
    public String endDate {
    	get {	
    		String dateStr = string.valueOf(incident.Incident_Date_Time__c);
    		String retStr = dateStr.substring(0,4)+dateStr.substring(5,7)+dateStr.substring(8,10);
    		return retStr;
    	}
 		set;
    } 
    
    public Boolean renderPage {
    	get {
    		if ((incident.SSO_Event_ID__c == null)  || 
    			(incident.SSO_Event_ID__c == 'NA')  || 
    			(incident.SSO_Event_ID__c == 'N/A') ||
    			(incident.SSO_Event_ID__c == 'None') ||
    			(incident.SSO_Event_ID__c == 'none')
    		){
    			return false;
    		}
    		else {
    			return true;
    		}
    	}
 		set;
    } 
    
    public String GetMyHostURL() {
    	return ApexPages.currentPage().getHeaders().get('Host');
    } 
    
    public String GetMySessionId() {
		return UserInfo.getSessionId();
	}	
	
	public List<Incident__c> getIncidents() {

        String usrId = UserInfo.getUserId();
        List<Incident__c> incs = [Select Id,  
                                Name, 
                                Incident_Date_Time__c,
                                Staff_On_site_Date_Time__c,
                                Tidal_Conditions__c,                             
                                Incident_Duration__c, 
                                Incident_Address__c,
                                Entered_Storm_Drain__c,
                                Incident_Response__c,
                                Response_Time__c,
                                Response_Minutes__c,                                                                                                       
                                Lat__c,
                                Lon__c, 
								Icon_Color__c,
								Icon__c,                                
                                Wind_Direction__c,
                                Weather_Description__c, 
                                Volume__c, 
                                Incident_Cause__c, 
                                Volume_Recovered__c,
                                Site_Name__c, 
                                Reporting_Party_Last_Name__c, 
                                Final_Spill_destination__c,                                
                                Odor_Description__c,
                                Incident_Type__c 
                                From Incident__c 
                                Where Incident_Date_Time__c = LAST_N_DAYS:365];
                            
        for(Incident__c inc : incs) {                                       
           HTMLStr = HTMLStr    + inc.Name                         + ':'                                                                                                                                 
                                + inc.Incident_Type__c             + ':'
                                + inc.Id                           + ':'
                                + inc.Incident_Date_Time__c        + ':' 
                                + inc.Incident_Duration__c         + ':'
                                + inc.Response_Minutes__c          + ':'
                                + inc.Incident_Cause__c            + ':'
                                + inc.Wind_Direction__c            + ':'
                                + inc.Weather_Description__c       + ':'
                                + inc.Tidal_Conditions__c          + ':' 
                                + inc.Odor_Description__c          + ':'
                                + inc.Site_Name__c                 + ':' 
                                + inc.Volume__c                    + ':'
                                + inc.Volume_Recovered__c          + ':'
                                + inc.Entered_Storm_Drain__c       + ':'
                                + inc.Incident_Response__c         + '~:~'                                                                                                                                                               
                                + inc.Lat__c                       + '~:~' 
                                + inc.Lon__c                       + '~::~';                                                                                                                                                                                      

        }
        return incs;     
	}
		

	public List<Incident__c> getSelectedIncidents {
		get {
			List<Incident__c> indcidentsFromSelection = [Select 	Wind_Direction__c, 
							Weather_Description__c, 
							Volume__c, 
							Volume_Recovered__c, 
							Tidal_Conditions__c, 
							Site_Name__c, 
							Odor_Description__c, 
							Name, 
							Lon__c, 
							Lat__c, 
							Icon_Color__c,
							Icon__c,							
							Incident_Type__c, 
							Incident_Response__c,
							Response_Minutes__c, 							 
							Incident_Duration__c, 
							Incident_Date_Time__c, 
							Staff_On_site_Date_Time__c, 							
							Incident_Cause__c, 
							Final_Spill_Destination__c,
							Incident_Address__c, 							 
							Entered_Storm_Drain__c From Incident__c where id IN :selectedIncidents];
										
			return indcidentsFromSelection;
		}
		set;
	}

    public String getHTMLStrArray(){
        HTMLStr = '';
        Incident__c[] theRecs = getIncidents();
        return HTMLStr; 
    }
    

    public static  testmethod void testIncidentExt() {
    	Incident__c newI = new Incident__c();
    	ApexPages.StandardController sc = new ApexPages.StandardController(newI); 
        PageReference pageRef = Page.mapIncidentsPage;
        Test.setCurrentPage(pageRef);
        
        system.debug(pageRef);
        incidentExt controller = new incidentExt(sc);
        String adds = controller.getHTMLStrArray();
        String hURL = controller.getMyHostURL();        
    }    
	   
}