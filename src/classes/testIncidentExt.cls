/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class testIncidentExt {

    static testMethod void testIncidentExt() {
 
 		// Add test data		
		Incident__c incident1 = new Incident__c();
		incident1.Name = 'Test incident 1';
		incident1.Incident_Date_Time__c = dateTime.valueOf('2009-09-24 08:00:00');
		incident1.Staff_On_site_Date_Time__c = dateTime.valueOf('2009-09-24 08:30:00');
		incident1.SSO_Event_ID__c = null;
		try{ insert incident1;} 
		catch (System.DMLException ex) {system.debug('>>>>>>>>>>>>>>>>>>>> DMLException: '+ex);}
		
		Incident__c incident2 = new Incident__c();
		incident2.Name = 'Test incident 2';
		incident2.Incident_Date_Time__c = dateTime.valueOf('2009-09-25 08:00:00');
		incident2.Staff_On_site_Date_Time__c = dateTime.valueOf('2009-09-25 08:30:00');
		incident2.SSO_Event_ID__c = 'NA';
		try{ insert incident2;} 
		catch (System.DMLException ex) {system.debug('>>>>>>>>>>>>>>>>>>>> DMLException: '+ex);}	
		
		Incident__c incident3 = new Incident__c();
		incident3.Name = 'Test incident 3';
		incident3.Incident_Date_Time__c = dateTime.valueOf('2009-09-26 08:00:00');
		incident3.Staff_On_site_Date_Time__c = dateTime.valueOf('2009-09-26 08:30:00');
		incident3.SSO_Event_ID__c = 'N/A';
		try{ insert incident3;} 
		catch (System.DMLException ex) {system.debug('>>>>>>>>>>>>>>>>>>>> DMLException: '+ex);}
		
		Incident__c incident4 = new Incident__c();
		incident4.Name = 'Test incident 4';
		incident4.Incident_Date_Time__c = dateTime.valueOf('2009-09-26 08:00:00');
		incident4.Staff_On_site_Date_Time__c = dateTime.valueOf('2009-09-26 08:30:00');
		incident4.SSO_Event_ID__c = 'None';
		try{ insert incident4;} 
		catch (System.DMLException ex) {system.debug('>>>>>>>>>>>>>>>>>>>> DMLException: '+ex);}
		
		Incident__c incident5 = new Incident__c();
		incident5.Name = 'Test incident 5';
		incident5.Incident_Date_Time__c = dateTime.valueOf('2009-09-26 08:00:00');
		incident5.Staff_On_site_Date_Time__c = dateTime.valueOf('2009-09-26 08:30:00');
		incident5.SSO_Event_ID__c = 'none';
		try{ insert incident5;} 
		catch (System.DMLException ex) {system.debug('>>>>>>>>>>>>>>>>>>>> DMLException: '+ex);}
		
		Incident__c incident6 = new Incident__c();
		incident6.Name = 'Test incident 6';
		incident6.Incident_Date_Time__c = dateTime.valueOf('2009-09-26 08:00:00');
		incident6.Staff_On_site_Date_Time__c = dateTime.valueOf('2009-09-26 08:30:00');
		incident6.SSO_Event_ID__c = '123456';
		try{ insert incident6;} 
		catch (System.DMLException ex) {system.debug('>>>>>>>>>>>>>>>>>>>> DMLException: '+ex);}													
		
		
		incidentExt iExt = new incidentExt(new ApexPages.StandardController(incident1));
		system.assertEquals(false,iExt.renderPage);
		iExt = new incidentExt(new ApexPages.StandardController(incident2));
		system.assertEquals(false,iExt.renderPage);
		iExt = new incidentExt(new ApexPages.StandardController(incident3));
		system.assertEquals(false,iExt.renderPage);		
		iExt = new incidentExt(new ApexPages.StandardController(incident4));
		system.assertEquals(false,iExt.renderPage);		
		iExt = new incidentExt(new ApexPages.StandardController(incident5));
		system.assertEquals(false,iExt.renderPage);		
		iExt = new incidentExt(new ApexPages.StandardController(incident6));
		system.assertEquals(true,iExt.renderPage);	
		
		system.assertEquals('20090925',iExt.startDate);
		system.assertEquals('20090926',iExt.endDate);		
					
		system.debug('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> '+ iExt.getMySessionId());
		
		List<Incident__c> selectedIncidents = new List<Incident__c>();
		selectedIncidents.add(incident1);
		selectedIncidents.add(incident2);
		selectedIncidents.add(incident3);				
		ApexPages.StandardSetController setCon = new ApexPages.StandardSetController(selectedIncidents);
		incidentExt ext = new incidentExt(setCon);
		system.debug('>>>>>>>>>>>>>>>>>>>>>  selectedIncidents '+selectedIncidents);
		system.debug('>>>>>>>>>>>>>>>>>>>>>  setCon '+setCon);				
		system.debug('>>>>>>>>>>>>>>>>>>>>>  iExt.getIncidents() '+iExt.getIncidents());
		system.debug('>>>>>>>>>>>>>>>>>>>>>  ext.getIncidents() '+ext.getIncidents());				
		system.debug('>>>>>>>>>>>>>>>>>>>>>  ext.getSelectedIncidents '+ext.getSelectedIncidents);						
		
   }	
    
}