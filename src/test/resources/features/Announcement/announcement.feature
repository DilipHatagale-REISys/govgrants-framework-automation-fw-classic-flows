@announcement
Feature: Validate all scenarios in the Announcement tab

	Background: Create Announcement
	Given I delete the record "Automation Announcement" from the object "Announcement"
	

	@33936 @announcementCreation @announcement @all
	Scenario Outline: Creation of an Announcement
	Given I create a "<Automation Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"
	Examples:
	|Announcement Type|	
	|Directed         |
	|Competitive      |
	|Formula          |	
	
	@announcementCreatedDeleteAccessToOwner @announcement @all
	Scenario Outline: Validate that owner can able to delete created status announcement
	Given I create a "<Automation Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	When I navigate to "Announcements" tab
	And I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel  
 	When  I click on "Delete" icon for "Record id" inside flex table with id "ActiveFundingOpportunitiesAll"   
	And I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel 
	Then I do not see value "Record id" for title "Announcement Name" inside table "ActiveFundingOpportunitiesAll"  
	Examples:
	|Announcement Type|	
	|Directed         |
	|Competitive      |
	|Formula          |		
	
	@createdAnnouncementDeletionByOtherUser @announcement @all
	Scenario Outline: Validate that other users are not able to delete created announcement
	Given I create a "<Automation Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	When I re-login to "As a Grantor" app as "<User>" user 
	And I navigate to "Announcements" tab
	When I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel
    Then I cannot see row level action button "Delete" against "Record id" in flex table with id "ActiveFundingOpportunitiesAll"
	Examples:
	|Announcement Type|	User|
	|Directed         | PM  |
	|Competitive      | PM  |
	|Formula          |	PM  |
	
	@announcementCreateCompetitiveCheckUnderDraftFormulaListView @announcement @all   
	Scenario Outline: Validate that Created Competitive announcement will not reflect under Draft Formula announcement list view
	Given I create a "<Automation type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	When I navigate to "Announcements" tab
	And I navigate to "Formula" content inside "Announcements" subheader on left panel
	And I click toggle button to select "Draft Announcements" in "ActiveFundingOpportunitiesFormula"
	When I perform quick search for "Record Id" in "ActiveFundingOpportunitiesFormula" panel  
	Then I do not see value "Record Id" for title "EGMS ID" inside table "ActiveFundingOpportunitiesFormula"
	Examples:
	|Announcement Type|	
	|Directed         |
	|Competitive      |
	|Formula          |	
	
	@announcementCreateCompetitiveCheckUnderDirectedDraftListView @announcement @all   
	Scenario Outline: Validate that Created Competitive announcement will not reflect under Draft Directed announcement list view
	Given I create a "<Automation type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	When I navigate to "Announcements" tab
	And I navigate to "Formula" content inside "Announcements" subheader on left panel
	And I click toggle button to select "Draft Announcements" in "ActiveFundingOpportunities"
	When I perform quick search for "Record Id" in "ActiveFundingOpportunitiesFormula" panel  
	Then I do not see value "Record Id" for title "EGMS ID" inside table "ActiveFundingOpportunitiesFormula"
	Examples:
	|Announcement Type|	
	|Directed         |
	|Competitive      |
	|Formula          |			
	
	@announcementEditionByOtherUser @announcement @all
	Scenario Outline: Validate that other users are not able to edit created announcement
	Given I create a "<Automation Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	When I re-login to "As a Grantor" app as "<User>" user 
	When I navigate to "Announcements" tab
	And I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel
 	Then I cannot see row level action button "Edit" against "Record id" in flex table with id "ActiveFundingOpportunitiesAll"
	Examples:
	|Announcement Type|	User|
	|Directed         | PM  |
	|Competitive      | PM  |
	|Formula          |	PM  |
	
	@createdAnnouncementEditionOnlyOwner @announcement @all
	Scenario Outline: Validate that only owner can able to edit created status announcement
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	When I navigate to "Announcements" tab
	And I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel
 	When I click on "Edit" icon for "Record id" inside flex table with id "ActiveFundingOpportunitiesAll"
	Then I can see top right button "Save" in page detail
	Examples:
	|Announcement Type|	
	|Directed         |
	|Competitive      |
	|Formula          |	

	@34221 @34222 @announcementEdition @announcement @all
  	Scenario Outline: Edition of an Announcement
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
 	When I click on "Edit" in the page details
	And I enter "Edition" values from "Announcement_Field_Values.xlsx"
	When I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"
	Examples:
	|Announcement Type|
	|Competitive      |
	|Directed         |
	|Formula          |

  	@37029 @announcementContactAssociation @announcement @all
  	Scenario Outline: Contact association to an Announcement
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "<Contact>" in the table "AssociateAnnouncementContacts"
    And I close Modal
    Then I see that "<Contact>" has been added in flextable with Id "AnnouncementContacts"
	Examples:
	|Announcement Type| Contact		   |
	|Competitive      |Automation EXE  |
	|Directed         |Automation EXE  |
	|Formula          |Automation EXE  |
	
	@announcementContactDissociation @announcement @all                       
	Scenario Outline: Validate the dissociation of contact to the Announcement 
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "<Contact>" in the table "AssociateAnnouncementContacts"                                                                            
    When I click on "Remove" icon for "<Contact>" inside flex table with id "announcement::contactTableId"       
    Then I do not see value "<Contact>" for title "Name" inside table "announcement::contactTableId"     
	Examples:
	|Announcement Type| Contact		   |
	|Competitive      |Automation EXE  |
	|Directed         |Automation EXE  |
	|Formula          |Automation EXE  |

  	@34759 @announcementDirectedInviteApplicant @announcementDirected @all
  	Scenario Outline: Organization association to an Announcement
  	Given I create a "Directed" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "announcement::directedInvitedApplicatsTableId"
    When I click "Add" after selection of "<Agency Name>" in the table "announcement::directedAddInviteApplicantTableId"
    And I close Modal
    Then I see that "<Agency Name>" has been added in flextable with Id "announcement::directedInvitedApplicatsTableId"
	Examples:
	| Agency Name               |
	| New Americans Museum Inc  |
	
  	@34760 @announcementFormulaInviteApplicant @announcementFormula @all
  	Scenario Outline: Amount addition to Invited applicant association to an Announcement
  	Given I create a "Formula" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
  	Given I associate "1" records "New Americans Museum Inc"
	| Actions 	  | Step 1     | Step 2	   		   | Step 3  			  					    | Step 4 | Step 5  		 			  	           |
    | Associate 1 | Overview   | Add Organizations | announcement::formulaInvitedApplicatsTableId      | Add	 | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
	| Agency                      | Allocated Amount |
	| New Americans Museum Inc    | 1000 			 | 
   Then I see that "<Agency Name>" has been added in flextable with Id "announcement::formulaInvitedApplicatsTableId"
	Examples:
	| Agency Name                 |
	| New Americans Museum Inc    |

  	@34769 @announcementFundingAccountAssociation @announcement @all
 	Scenario Outline: Funding Account association to an Announcement
 	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "<EGMS Id>" in the table "SelectAnnFundingAccounts"
    And I close Modal
    When I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account                                 | Pre-Encumbrance |
	| Execution Funding Source for Automation 		  | 100 			|
	Then I see that "<EGMS Id>" has been added in flextable with Id "flexGridAnnouncementFundingAccountGrantor"
	Examples:
	|Announcement Type|EGMS Id								   |
	|Competitive      |Execution Funding Source for Automation |
	|Directed         |Execution Funding Source for Automation |
	|Formula          |Execution Funding Source for Automation |
	
	@announcementFADissociation @announcement @all
	Scenario Outline: Funding Account dissociation to an Announcement
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details	
	When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "announcement::fundingAccountsTableId"
    When I click "Add" after selection of "<EGMS Id>" in the table "SelectAnnFundingAccounts"
    And I close Modal
    When I click on "Remove" icon for "<EGMS Id>" inside flex table with id "announcement::fundingAccountsTableId"  
	Then I do not see value "<EGMS Id>" for title "EGMS ID" inside table "announcement::fundingAccountsTableId" 
	Examples:
	|Announcement Type|EGMS Id |
	|Competitive      |FA--125 |
	|Directed         |FA--125 |
	|Formula          |FA--125 |
	
  	@34771 @announcementBudgetPeriodAddition @announcement @all @jphillips
  	Scenario Outline: Budget Period Addition to an Announcement
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details	
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
    Then I see that "BP01" has been added in flextable with Id "flexGridAnnouncementBudgetPeriod"
	Examples:
	|Announcement Type|
	|Competitive      |
	|Directed         |
	|Formula          |
	
	@announcementBudgetPeriodDissociation @announcement @all                       
	Scenario Outline: Validate the dissociation of Budget Period to the Announcement
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details 
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I click on "Remove" icon for "BP01" inside flex table with id "flexGridAnnouncementBudgetPeriod"       
    Then I do not see value "BP01" for title "Budget Period Name" inside table "flexGridAnnouncementBudgetPeriod"      		
	Examples:
	|Announcement Type|
	|Competitive      |
	|Directed         |
	|Formula          |

  	@34775 @announcementFocusAreaAssociation @announcement @all
  	Scenario Outline: Validate the association of Focus Area to Announcement
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details 
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementServiceArea1"
    When I click "Add" after selection of "Execution Focus Area for Automation1" in the table "SelectAnnouncementServiceArea1"
    And I close Modal
    Then I see that "Execution Focus Area for Automation1" has been added in flextable with Id "AnnouncementServiceArea1"
	Examples:
	|Announcement Type|
	|Competitive      |
	|Directed         |
	|Formula          |

  	@34774 @announcementObjectiveAssociation @announcement @all
  	Scenario Outline: Validate the association of objective to the Announcement 
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details 
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Announcement Objective" in the table "SelectAnnGoals"
    And I close Modal
    Then I see that "Automation Announcement Objective" has been added in flextable with Id "AnnouncementGranteeStrategicGoalsObjectives"
	Examples:
	|Announcement Type|
	|Competitive      |
	|Directed         |
	|Formula          |
	
	@announcementObjectiveDissociation @announcement @all   
	Scenario Outline: Validate the dissociation of objective to the Announcement 
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details 
	When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Announcement Objective" in the table "SelectAnnGoals"
    And I close Modal                                                                                  
    When I click on "Remove" icon for "Automation Announcement Objective" inside flex table with id "AnnouncementGranteeStrategicGoalsObjectives"        
    Then I do not see value "Automation Announcement Objective" for title "EGMS ID" inside table "AnnouncementGranteeStrategicGoalsObjectives"      
	Examples:
	|Announcement Type|
	|Competitive      |
	|Directed         |
	|Formula          |

  	@34773 @announcementKPIAssociation @announcement @all
  	Scenario Outline: Validate the association of KPI for the announcement
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details 
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementKeyOutcomes"
    When I click "Add" after selection of "Automation KPI" in the table "SelectAnnKPIs"
    And I close Modal
    Then I see that "Automation KPI" has been added in flextable with Id "AnnouncementKeyOutcomes"
	Examples:
	|Announcement Type|
	|Directed         |
	|Formula          |
	|Competitive      |

  	@35002 @announcementAttachmentChecklist @announcement @all
  	Scenario Outline: Validate the attachment checklist of the announcement
  	 Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details 
    When I navigate to "Setup" sub tab
   	When I enter the following values into flex table with id "inlineEditGridAnnouncementChecklists" by clicking "Add" :
    | Description        		  | Required  | Applies To | Status |
    | Automation test description | Mandatory | Award  	   | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "inlineEditGridAnnouncementChecklists"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
    Then I see that "Active" has been added in flextable with Id "inlineEditGridAnnouncementChecklists"
    Examples:
    |Announcement Type|
	|Directed         |
	|Formula          |
	|Competitive      |

  	@announcementReviewStepsValidate @announcement @all @redTag
  	Scenario Outline: Validate the review steps for the announcement
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details 
    When I navigate to "Setup" sub tab
    Then I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    Examples:
    |Announcement Type|
	|Directed         |
	|Formula          |
	|Competitive      |

  	@34780 @announcementApproverSelection @announcement @all
  	Scenario Outline: Validate the assignment of Approvers for the Announcement 
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details 
    When I navigate to "Setup" sub tab
    Then I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "GrantorAnnouncementRolesandResponsibilities"
    When I fill in the "Automation PM" for the Approver details
    And I switch to Parent frame
    When I click on "Edit" icon for "Fiscal Approver" inside flex table with id "GrantorAnnouncementRolesandResponsibilities"
    And I fill in the "Automation FO" for the Approver details
    And I switch to Parent frame
    And I click on "Edit" icon for "Executive Approver" inside flex table with id "GrantorAnnouncementRolesandResponsibilities"
    When I fill in the "Automation EXE" for the Approver details
    And I switch to Parent frame
    Then I see that "Automation EXE" has been added in flextable with Id "GrantorAnnouncementRolesandResponsibilities"
	Examples:
    |Announcement Type|
	|Directed         |
	|Formula          |
	|Competitive      |
	 
  	@34232 @announcementReviewerAssignment @announcement @all
  	Scenario Outline: Validate the assignment of Reviewer for the Announcement
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details 
    When I navigate to "Responsibilities" sub tab
	And I click on top right button "New" in flex table with id "flexGridApproverRoles"
	When I enter "Reviewer" values from "Announcement_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
	Then I see that "Automation FO" has been added in flextable with Id "flexGridApproverRoles"
	Examples:
    |Announcement Type|
    |Competitive      |
	|Directed         |
	|Formula          |
	
	
  	@34778 @announcementReviewerInitiation @announcement @all
  	Scenario Outline: Validate the Reviewer initiation for the Announcement
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details 
    When I navigate to "Responsibilities" sub tab
	And I click on top right button "New" in flex table with id "flexGridApproverRoles"
	When I enter "Reviewer" values from "Announcement_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
    And I click on "Send for Review" icon for "Created" inside flex table with id "flexGridApproverRoles"
	Then I see that "Sent for Review" has been added in flextable with Id "flexGridApproverRoles"
	Examples:
    |Announcement Type|
    |Competitive      |
	|Directed         |
	|Formula          |
	
  	@34779 @announcementReviewComplete @announcement @all
  	Scenario Outline: Validate the review for the Announcement
  	 Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	And I re-login to "As a Grantor" app as "<User>" user
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table 
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" user
    When I navigate to "Announcements" tab
    And I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Announcements"
    When I perform quick search for "Record id" in "<Active Funding Opportunities id>" panel
    And I click on "View" icon for "Record id" inside table
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "Reviewed" and is "green"
	Examples:
	| User | Flextable Name |Announcement Type|Active Funding Opportunities id    |
	| FO   | Peer Reviewers |Directed         |ActiveFundingOpportunities         |
	| FO   | Peer Reviewers |Competitive      |ActiveFundingOpportunitiesCompitive|
	| FO   | Peer Reviewers |Formula          |ActiveFundingOpportunitiesFormula  |

  	@35003 @announcementAddAttachment @announcement @all
  	Scenario Outline: Validate the attachment for an Announcement
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "a150b000003epC4AAI"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Funding Opportunity Announcement"
    And I close Modal
    Then I see that "Funding Opportunity Announcement" has been added in flextable with Id "a150b000003epC4AAI"
    Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |

    @reviewStepsBeforeSubmitForApproval @announcement
    Scenario Outline: Validate the Review steps of Announcement before submit for Approval
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	And I navigate to "Setup" sub tab
	And I expand nested table containing column value "Pre-Screen Review"
	When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "flexGridAnnouncementReviewTemplates"
	And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
	| Section Header            | Section Weight (%)    |
	|Eligibility                | 100                   |
	|Completeness               | 100                   |
	And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "flexGridReviewPanelCategories" by clicking "New" :
    | Question Order | Question  		   | Type  	 | Max Score   | 
    | 1              | Question1           | written | 100         | 
    And I expand nested table containing column value "Completeness"
       When I enter the following values into flex table with id "flexGridReviewPanelCategories" by clicking "New" :
    | Question Order | Question  		   | Type  	 | Max Score   | 
    | 1              | Question1           | written | 100         | 
    And I click modal button "Save"
    When I collapse nested table containing column value "Automation Observation"
	 When I click on "Submit For Approval" in the page details
	Examples:
    |Announcement Type |Active Funding Opportunities id    |
    |Formula           |ActiveFundingOpportunitiesFormula  |
	#|Directed         |ActiveFundingOpportunities         |
	#|Competitive      |ActiveFundingOpportunitiesCompitive|
	     
  	@34461 @submittingAnnouncementForApproval @announcement @CHECKThenStepFailure
  	Scenario Outline: Validate the submission of Announcement for Approval
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
	And I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	Given Review is completed as user "FO" for the record "Record id"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  					      | Save	              | Submit Review   |
	Given I login and view the record "Record id" as "EXE"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | <Announcement Type>   | Announcements   |
	| Complete Review 	  | Draft Announcements | <Active Funding Opportunities id> | View 		  		  | 				|
	And I click on "Complete Review" in the page details
    When I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "c" and is "green"
    Examples:
    |Announcement Type|Active Funding Opportunities id    |
    |Formula          |ActiveFundingOpportunitiesFormula  |
	|Directed         |ActiveFundingOpportunities         |
	|Competitive      |ActiveFundingOpportunitiesCompitive|

	@submittedAnnouncementDeletion @announcement @all @checkBugetIssue
	Scenario Outline: Validate that only record owner cannot delete Submitted for Approval status announcements
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	When I click on "Submit For Approval" in the page details
	And I navigate to "Announcements" tab
	When I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel
	Then I cannot see row level action button "Delete" against "Record id" in flex table with id "ActiveFundingOpportunitiesAll"
    Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |
	
	@announcementForPastApplicationDueDate @announcement @all
	Scenario Outline: 	Validate that user can not enter application due date as past date
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	When I click on "Edit" in the page details
	And  I navigate to "Overview" sub tab
    And I enter value "2/10/2019" into field "ApplicationDueDate__c"    
    When I click on "Save" in the page details
	And I click on "Submit For Approval" in the page details
	Then I see the following messages in the page details : 
	| Overview Tab - Application Due Date cannot be in the past.|
	Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |
	
	@announcementWithBlankBudgetPeriod @announcement @all
	Scenario Outline: 	Validate that user should not submit announcement with blank budget period dates
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I click on "Submit For Approval" in the page details
	Then I see the following messages in the page details :
	| Financial Tab - Correct Budget Periods Start Date and End Dates. Budget Periods should be continuous and together should form a Project Period.|	
	Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |

  	@34763 @34765 @34766 @announcementApproval @announcement @all
  	Scenario Outline: Validate the approval of an Announcement
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	And Review is completed as user "FO" for the record "Record id"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  					      | Save	              | Submit Review   |
	Given I login and view the record "Record id" as "EXE"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  			  | Step 4 		    |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | <Announcement Type>               | Announcements   |
	| Complete Review 	  | Draft Announcements | <Active Funding Opportunities id>   | View 		  		              | 				|
	Given I click on "Complete Review" in the page details
	And I click on "Submit For Approval" in the page details
	Given I re-login to "As a Grantor" app as "Automation PM" user
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "Automation FO" user
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table 
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "Automation EXE" user
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table 
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
	Examples:
    |Announcement Type|Active Funding Opportunities id    |
    |Formula          |ActiveFundingOpportunitiesFormula  |
	#|Directed         |ActiveFundingOpportunities         |
	#|Competitive      |ActiveFundingOpportunitiesCompitive|
	
	@announcementPendingTaskPostApproval @announcement @all
	Scenario Outline: Validate that after approval of an Announcement task get deleted from pending task table.
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I click on "Submit For Approval" in the page details
	Given "1" Approvers "PM" approve the record "Record Id" 
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve		 | 					 |
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
	Then I do not see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks"
	Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |
	
	@announcementCompletedTaskPostApproval @announcement @all
	Scenario Outline: Validate that after approval of an Announcement task get added to its completed task table.
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 1000			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I click on "Submit For Approval" in the page details
	Given "1" Approvers "PM" approve the record "Record Id" 
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve		 | 					 |
	When I navigate to "Announcements" tab
	And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
	Then I see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
	Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |
	
	@announcementSendBackToOwner @announcement @all
	Scenario Outline: Validate the send back functionality of an Announcement
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I click on "Submit For Approval" in the page details 
	Given I re-login to "As a Grantor" app as "PM" user
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel          
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send Back" on the approval decision box
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |
    
    @announcementSendBackPendingTaskToOwner @announcement @all
	Scenario Outline: Validate that after send back from approvers owner should not get pending task 
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	And I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I click on "Submit For Approval" in the page details
	Given "1" Approvers "PM" approve the record "Record Id"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Send Back 	 | 					 |
	And I re-login to "As a Grantor" app as "<User>" user 
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel              
	Then I do not see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks" 
	Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |
	
	@announcementPostSendBackCheckFieldHistory @announcement @all
	Scenario Outline: Validate the field history after send back of an announcement
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I click on "Submit For Approval" in the page details
	Given "1" Approvers "PM" approve the record "Record Id" 
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Send Back	 | 					 |	
	When I navigate to "History" sub tab
	Then I see value "Created" for title "New Value" inside table "History"  
	Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |
		
	@announcementApprovalRejection @announcement @all
	Scenario Outline: Validate the reject functionality of an Announcement
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I click on "Submit For Approval" in the page details
	Given I re-login to "As a Grantor" app as "PM" user
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel                   
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Reject" on the approval decision box
    Then I see status in Progress-bar is "Rejected" and is "Red"
 	Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |
	   
    @announcementRejectPendingTaskForNextApprover @announcement @all
	Scenario Outline: Validate that after rejection from 1st approver, 2nd user should not get pending task 
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	And I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I click on "Submit For Approval" in the page details
	Given "1" Approvers "PM" approve the record "Record Id" 
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Reject		 | 					 |
	When I re-login to "As a Grantor" app as "<User>" user 
	And I navigate to "Announcements" tab
	When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel              
	Then I do not see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks"  
	Examples:
    |Announcement Type|User |
    |Directed         |FO   | 
    |Competitive      |FO   | 
	|Formula          |FO  | 
	
	@announcementPostRejectPendingTaskForUser @announcement @all
	Scenario Outline: Validate that after rejection of an Announcement task get deleted from pending task table.
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I click on "Submit For Approval" in the page details
	Given "1" Approvers "PM" approve the record "Record Id" 
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Reject		 | 					 |
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
	Then I do not see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks"
 	Examples:
    |Announcement Type|
    |Directed         |
    #|Competitive      |
	#|Formula          |	
	
	@announcementPostRejectCompletedTaskForUser @announcement @all
	Scenario Outline: Validate that after rejection of an Announcement task get added to it's completed task table.
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 04/20/2019         | 12/31/2020      |
	Given I associate "4" records "Automation EXE,03709,SPO-0130,RG-002731"
	| Actions 	  | Step 1   | Step 2	       | Step 3  			  							| Step 4 | Step 5  				    	  |
    | Associate 1 | Overview | Associate       | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts  |
    |Associate  2 | Overview |Add Organizations| inlineEditGridSoleSourceAwardOrganizations     | Add    | SoleSourceAwardRecipientsTable | 
    | Associate 3 | Setup	 | Associate       | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1 |
    | Associate 4 | Setup 	 | Associate       | AnnouncementGranteeStrategicGoalsObjectives    | Add	 | SelectAnnGoals 		   		  |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"  
	And I click on "Submit For Approval" in the page details
	Given "1" Approvers "PM" approve the record "Record Id" 
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Reject		 | 					 |
	When I navigate to "Announcements" tab
	And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
	Then I see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
 	Examples:
    |Announcement Type|
    |Directed         |
    #|Competitive      |
	#|Formula          |	
	
	@announcementPostRejectCheckFieldHistory @announcement @all
	Scenario Outline: Validate the field history after rejection of an announcement
	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I click on "Submit For Approval" in the page details
	Given "1" Approvers "PM" approve the record "Record Id" 
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Reject		 | 					 |	
	When I navigate to "History" sub tab
	Then I see value "Rejected" for title "New Value" inside table "History" 
 	Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |	 
	
	@announcementPostRejectionCheckInListView @announcement @all
	Scenario Outline: Validate the rejected announcement will reflect under "Rejected Announcements" list view
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	And I click on "Submit For Approval" in the page details
	Given "1" Approvers "PM" approve the record "Record Id" 
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Reject		 | 					 |
	When I navigate to "Announcements" tab
	And I click toggle button to select "Rejected Announcements" in "ActiveFundingOpportunitiesAll"
	When I perform quick search for "Record Id" in "ActiveFundingOpportunitiesAll" panel  
	Then I see value "Record Id" for title "EGMS ID" inside table "ActiveFundingOpportunitiesAll"
 	Examples:
    |Announcement Type|
    |Directed         |
    |Competitive      |
	|Formula          |	

  	@34462 @publishingCompetitiveAnnouncement @announcementCompetitiveHappyPath @announcement @all
  	Scenario Outline: Validate the activation of Internal Program
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance  |
	| FA--125 		  | 100 			 |
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	And I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	And Review is completed as user "FO" for the record "Record id"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	 Save		  		  | Submit Review   |
	Given I login and view the record "Records id" as "EXE"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | <Announcement Type>		  | Announcements   |
	| Complete Review 	  | Draft Announcements | <Active Funding Opportunities id>   | View 		  		  | 			    |
	Given I click on "Complete Review" in the page details
	And I click on "Submit For Approval" in the page details
	Given "3" Approvers "PM,FO,EXE" approve the record "Approve Funding Announcement"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	And I re-login to "As a Grantor" app as "<User>" user 
	When I navigate to "Announcements" tab
	And I navigate to "Competitive" content inside "Announcements" subheader on left panel
	When I click toggle button to select "Draft Announcements"
    And I perform quick search for "Record id" in "ActiveFundingOpportunitiesCompitive" panel
    When I click on "View" icon for "Record id" inside table 
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
	 Examples:
	|Announcement Type|Active Funding Opportunities id    |User|
    |Formula          |ActiveFundingOpportunitiesFormula  |EXE |
	|Directed         |ActiveFundingOpportunities         |EXE |
	|Competitive      |ActiveFundingOpportunitiesCompitive|EXE |
	
	@34462 @publishingDirectedAnnouncement @announcementDirectedHappyPath @announcement @all
  	Scenario Outline: Validate the activation of Internal Program
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	And I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
    Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	And Review is completed as user "FO" for the record "Record Id"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	 Save		  		  | Submit Review   |
	Given I login and view the record "Record id" as "EXE"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | <Announcement Type>   | Announcements   |
	| Complete Review 	  | Draft Announcements | <Active Funding Opportunities id>  | View 		  		  | 			    |
	Given I click on "Complete Review" in the page details
	And I click on "Submit For Approval" in the page details
	Given "3" Approvers "PM,FO,EXE" approve the record "Record Id"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	And I re-login to "As a Grantor" app as "<User>" user 
	When I navigate to "Announcements" tab
	And I navigate to "Directed" content inside "Announcements" subheader on left panel
	When I click toggle button to select "Draft Announcements"
    And I perform quick search for "Record id" in "ActiveFundingOpportunitiesCompitive" panel
    When I click on "View" icon for "Record id" inside table 
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
	Examples:
	|Announcement Type|Active Funding Opportunities id    |User|Add Organization id							 |
    |Formula          |ActiveFundingOpportunitiesFormula  |EXE |inlineEditGridSoleSourceAwardOrganizations	 |
	|Directed         |ActiveFundingOpportunities         |EXE |inlineEditGridFormulaGrantsAwardOrganizations|
	|Competitive      |ActiveFundingOpportunitiesCompitive|EXE |inlineEditGridSoleSourceAwardOrganizations	 |

	
	@34462 @publishingFormulaAnnouncement @announcementFormulaHappyPath @announcement @all
  	Scenario Outline: Validate the activation of Internal Program
  	Given I create a "<Announcement Type>" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID					         |                            |                                   |
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--125"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--125 		  | 100 			|
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
	| Budget Period Name     | Start Date         | End Date        |
	| BP01                   | 03/20/2019         | 03/21/2020      |		
	Given I associate "3" records "Automation EXE,03709,SPO-0130"
	| Actions 	  | Step 1   | Step 2	 | Step 3  			  							| Step 4 | Step 5  				    	 |
    | Associate 1 | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Associate 2 | Setup	 | Associate | AnnouncementServiceArea1			 			| Add    | SelectAnnouncementServiceArea1|
    | Associate 3 | Setup 	 | Associate | AnnouncementGranteeStrategicGoalsObjectives  | Add	 | SelectAnnGoals 		   		 |
	And I select "3" approvers "Automation PM,Automation FO,Automation EXE"
    | Actions 	 | Step 1   				    			   | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 						   | 		|		    		  |
    | Approver 1 | GrantorAnnouncementRolesandResponsibilities | Edit   | Program Approver    |
    | Approver 2 | GrantorAnnouncementRolesandResponsibilities | Edit   | Fiscal Approver     |
    | Approver 3 | GrantorAnnouncementRolesandResponsibilities | Edit	| Executive Approver  |
	Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       			  | Step 2	       | Step 3 	|
    | Inline Column Title  | Description       	  	  			  | Required  	   | Applies To |
    | Inline values 	   | Automation Description    			  | Mandatory	   | Award		|
	| Checklist Navigation | Setup		      		   			  |   		   	   |			|
	| Checklist FlexTable  | inlineEditGridAnnouncementChecklists | Add	   		   |   			|
	| Upload Modal  	   | Upload Template 		   			  | Not Applicable | 			|
	| Upload file     	   | Checklist 				   			  | Announcement   |			|
	And I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epC4AAI |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |					  |
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	And Review is completed as user "FO" for the record "Record Id"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	 Save		  		  | Submit Review   |
	When I re-login to "As a Grantor" app as "<User>" user 
	And I navigate to "Announcements" tab
	When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
	And I click toggle button to select "Draft Announcements"
    When I perform quick search for "Record id" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "Record id" inside table 
	Given I click on "Complete Review" in the page details
	And I click on "Submit For Approval" in the page details
	Given "3" Approvers "PM,FO,EXE" approve the record "Record Id"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	When I re-login to "As a Grantor" app as "<User>" user 
	And I navigate to "Announcements" tab
	When I navigate to "Formula" content inside "Announcements" subheader on left panel
	And I click toggle button to select "Draft Announcements"
    When I perform quick search for "Record id" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "Record id" inside table 
    When I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
	Examples:
	|Announcement Type|User|Add Organization id							 |Announcement Name       |
    |Formula          |EXE |inlineEditGridSoleSourceAwardOrganizations	 |Automation Announcement |
	|Directed         |EXE |inlineEditGridFormulaGrantsAwardOrganizations|Automation Announcement |
	|Competitive      |EXE |inlineEditGridSoleSourceAwardOrganizations	 | Automation Announcement|
 	