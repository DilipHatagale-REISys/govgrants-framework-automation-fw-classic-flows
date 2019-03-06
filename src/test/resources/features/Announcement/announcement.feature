@announcement
Feature: Validate all scenarios in the Announcement tab

	Background: Create Announcement
	Given I delete the record "Automation Announcement" from the object "Announcement"
	And I create a "Competitive" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	   | Step 1 	   	  					 | Step 2    	   	   		  | Step 3 							  |
	| Navigation   | As a Grantor  						 | Announcements 	   		  |	Creation Second Modal 			  |
	| FlexTable    | Announcements 						 | Draft Announcements 		  |  								  |
	| FlexTableId  | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation     | New			  					 | Continue 	   	 		  | Save and Continue				  |
	| ID		   | EGMS ID							 |							  |									  |
	Given I click on "Save" in the page details

	@33936 @announcementCreation @announcement @all
	Scenario: Creation of an Announcement
	Then I see status in Progress-bar is "Created" and is "green"
	
	@announcementCreatedDeleteAccessToOwner @announcement @all
	Scenario Outline: Validate that owner can able to delete created status announcement
	When I navigate to "Announcements" tab
	And I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesAll" panel  
 	When  I click on "Delete" icon for "<Announcement Name>" inside flex table with id "ActiveFundingOpportunitiesAll"   
	And I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesAll" panel 
	Then I do not see value "<Announcement Name>" for title "Announcement Name" inside table "ActiveFundingOpportunitiesAll"  
	Examples:
	| Announcement Name		  |
	| Automation Announcement  |	
	
	@createdAnnouncementDeletionByOtherUser @announcement @all
	Scenario Outline: Validate that other users are not able to delete created announcement
	When I re-login to "As a Grantor" app as "<User>" user 
	And I navigate to "Announcements" tab
	When I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesAll" panel
    Then I cannot see row level action button "Delete" against "<Announcement Name>" in flex table with id "ActiveFundingOpportunitiesAll"
	Examples:
	| Announcement Name		  | User |
	| Automation Announcement |	PM   |
	
	@announcementCreateCompetitiveCheckUnderDraftFormulaListView @announcement @all   
	Scenario: Validate that Created Competitive announcement will not reflect under Draft Formula announcement list view
	When I navigate to "Announcements" tab
	And I navigate to "Formula" content inside "Announcements" subheader on left panel
	And I click toggle button to select "Draft Announcements" in "ActiveFundingOpportunitiesFormula"
	When I perform quick search for "Record Id" in "ActiveFundingOpportunitiesFormula" panel  
	Then I do not see value "Record Id" for title "EGMS ID" inside table "ActiveFundingOpportunitiesFormula"
	
	@announcementCreateCompetitiveCheckUnderDirectedDraftListView @announcement @all   
	Scenario: Validate that Created Competitive announcement will not reflect under Draft Directed announcement list view
	When I navigate to "Announcements" tab
	And I navigate to "Formula" content inside "Announcements" subheader on left panel
	And I click toggle button to select "Draft Announcements" in "ActiveFundingOpportunities"
	When I perform quick search for "Record Id" in "ActiveFundingOpportunitiesFormula" panel  
	Then I do not see value "Record Id" for title "EGMS ID" inside table "ActiveFundingOpportunitiesFormula"		
	
	@announcementEditionByOtherUser @announcement @all
	Scenario Outline: Validate that other users are not able to edit created announcement
	When I re-login to "As a Grantor" app as "<User>" user 
	When I navigate to "Announcements" tab
	And I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesAll" panel
 	Then I cannot see row level action button "Edit" against "<Announcement Name>" in flex table with id "ActiveFundingOpportunitiesAll"
	Examples:
	| Announcement Name		  | User |
	| Automation Announcement |	PM   |
	
	@createdAnnouncementEditionOnlyOwner @announcement @all
	Scenario Outline: Validate that only owner can able to edit created status announcement
	When I navigate to "Announcements" tab
	And I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesAll" panel
 	When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "ActiveFundingOpportunitiesAll"
	Then I can see top right button "Save" in page detail
	Examples:
	| Announcement Name		  |
	| Automation Announcement |	

	@34221 @34222 @announcementEdition @announcement @all
  	Scenario: Edition of an Announcement
 	When I click on "Edit" in the page details
	And I enter "Edition" values from "Announcement_Field_Values.xlsx"
	When I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"

  	@37029 @announcementContactAssociation @announcement @all
  	Scenario Outline: Contact association to an Announcement
	When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "<Contact>" in the table "AssociateAnnouncementContacts"
    And I close Modal
    Then I see that "<Contact>" has been added in flextable with Id "AnnouncementContacts"
	Examples:
	| Contact		  |
	| Automation EXE  |
	
	@announcementContactDissociation @announcement @all                       
	Scenario Outline: Validate the dissociation of contact to the Announcement 
	When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "<Contact>" in the table "AssociateAnnouncementContacts"
    And I close Modal                                                                              
    When I click on "Remove" icon for "<Contact>" inside flex table with id "AssociateAnnouncementContacts"       
    Then I do not see value "<Contact>" for title "Name" inside table "AssociateAnnouncementContacts"     
	Examples:
	| Contact		  |
	| Automation EXE  |

  	@34759 @announcementDirectedInviteApplicant @announcementDirected @all
  	Scenario Outline: Organization association to an Announcement
	When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "inlineEditGridSoleSourceAwardOrganizations"
    When I click "Add" after selection of "<Agency Code>" in the table "SoleSourceAwardRecipientsTable"
    And I close Modal
    Then I see that "<Agency Code>" has been added in flextable with Id "inlineEditGridSoleSourceAwardOrganizations"
	Examples:
	| Agency Code |
	| RG-000010   |
	
  	@34760 @announcementFormulaInviteApplicant @announcementFormula @all
  	Scenario Outline: Amount addition to Invited applicant association to an Announcement
  	Given I associate "1" records "RG-000010"
	| Actions 	  | Step 1     | Step 2	   		   | Step 3  			  					    | Step 4 | Step 5  		 			  	  |
    | Associate 1 | Overview   | Add Organizations | inlineEditGridSoleSourceAwardOrganizations | Add	 | SoleSourceAwardRecipientsTable |
    When I edit the following rows inline in flex table with id "inlineEditGridSoleSourceAwardOrganizations" by clicking "Edit" :
	| Agency Code | Allocated Amount |
	| RG-000010   | 100000 			 | 
   Then I see that "<Agency Code>" has been added in flextable with Id "inlineEditGridSoleSourceAwardOrganizations"
	Examples:
	| Agency Code |
	| RG-000010   |

  	@34769 @announcementFundingAccountAssociation @announcement @all
 	Scenario Outline: Funding Account association to an Announcement
	When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "<EGMS Id>" in the table "SelectAnnFundingAccounts"
    And I close Modal
    When I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Then I see that "<EGMS Id>" has been added in flextable with Id "flexGridAnnouncementFundingAccountGrantor"
	Examples:
	| EGMS Id |
	| FA--77  |
	
	@announcementFADissociation @announcement @all
	Scenario Outline: Funding Account dissociation to an Announcement	
	When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "<EGMS Id>" in the table "SelectAnnFundingAccounts"
    And I close Modal
    When I click on "Remove" icon for "<EGMS Id>" inside flex table with id "flexGridAnnouncementFundingAccountGrantor"  
	Then I do not see value "<EGMS Id>" for title "EGMS ID" inside table "AnnouncementGranteeStrategicGoalsObjectives" 
	Examples:
	| EGMS Id |
	| FA--77  |
	
  	@34771 @announcementBudgetPeriodAddition @announcement @all
  	Scenario Outline: Budget Period Addition to an Announcement
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I click on "Edit" icon for "<Budget Period Id>" inside flex table with id "flexGridAnnouncementBudgetPeriod"
    And I enter "BudgetPeriod" values from "Announcement_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    Then I see that "<Budget Period Id>" has been added in flextable with Id "flexGridAnnouncementBudgetPeriod"
	Examples:
	| Budget Period Id |
	| BP01			   |
	
	@announcementBudgetPeriodDissociation @announcement @all                       
	Scenario Outline: Validate the dissociation of Budget Period to the Announcement 
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I click on "Remove" icon for "<Budget Period Id>" inside flex table with id "flexGridAnnouncementBudgetPeriod"       
    Then I do not see value "<Budget Period Id>" for title "Budget Period Name" inside table "flexGridAnnouncementBudgetPeriod"      		
	Examples:
	| Budget Period Id |
	| BP01	           |

  	@34775 @announcementFocusAreaAssociation @announcement @all
  	Scenario Outline: Validate the association of Focus Area to Announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementServiceArea1"
    When I click "Add" after selection of "<EGMS Id>" in the table "SelectAnnouncementServiceArea1"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "AnnouncementServiceArea1"
	Examples:
	| EGMS Id |
	| 02493   |

  	@34774 @announcementObjectiveAssociation @announcement @all
  	Scenario Outline: Validate the association of objective to the Announcement 
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "<EGMS Id>" in the table "SelectAnnGoals"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "AnnouncementGranteeStrategicGoalsObjectives"
	Examples:
	| EGMS Id  |
	| SPO-0073 |
	
	@announcementObjectiveDissociation @announcement @all   
	Scenario Outline: Validate the dissociation of objective to the Announcement 
	When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "<EGMS Id>" in the table "SelectAnnGoals"
    And I close Modal                                                                                  
    When I click on "Remove" icon for "<EGMS Id>" inside flex table with id "AnnouncementGranteeStrategicGoalsObjectives"        
    Then I do not see value "<EGMS Id>" for title "EGMS ID" inside table "AnnouncementGranteeStrategicGoalsObjectives"      
	Examples:
	| EGMS Id  |
	| SPO-0073 |

  	@34773 @announcementKPIAssociation @announcement @all
  	Scenario Outline: Validate the association of KPI for the announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementKeyOutcomes"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "AnnouncementKeyOutcomes"
	Examples:
	| EGMS Id  |
	| KPI-0006 |

  	@35002 @announcementAttachmentChecklist @announcement @all
  	Scenario: Validate the attachment checklist of the announcement
    When I navigate to "Setup" sub tab
   	When I enter the following values into flex table with id "inlineEditGridAnnouncementChecklists" by clicking "Add" :
    | Description        		  | Required  | Applies To | Status |
    | Automation test description | Mandatory | Award  	   | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "inlineEditGridAnnouncementChecklists"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
    Then I see that "Active" has been added in flextable with Id "inlineEditGridAnnouncementChecklists"

  	@announcementReviewStepsValidate @announcement @all
  	Scenario: Validate the review steps for the announcement
    When I navigate to "Setup" sub tab
    Then I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"

  	@34780 @announcementApproverSelection @announcement @all
  	Scenario: Validate the assignment of Approvers for the Announcement 
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
	    
  	@34232 @announcementReviewerAssignment @announcement @all
  	Scenario: Validate the assignment of Reviewer for the Announcement
    When I navigate to "Responsibilities" sub tab
	And I click on top right button "New" in flex table with id "flexGridApproverRoles"
	When I enter "Reviewer" values from "Announcement_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
	Then I see that "Automation FO" has been added in flextable with Id "flexGridApproverRoles"

  	@34778 @announcementReviewerInitiation @announcement @all
  	Scenario: Validate the assignment of Reviewer for the Announcement
    When I navigate to "Responsibilities" sub tab
	And I click on top right button "New" in flex table with id "flexGridApproverRoles"
	When I enter "Reviewer" values from "Announcement_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
    And I click on "Send for Review" icon for "Created" inside flex table with id "flexGridApproverRoles"
	Then I see that "Sent for Review" has been added in flextable with Id "flexGridApproverRoles"

  	@34779 @announcementReviewComplete @announcement @all
  	Scenario Outline: Validate the review for the Announcement
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	And I re-login to "As a Grantor" app as "<User>" user
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Announcement Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Announcement Name>" inside table 
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" user
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Announcements"
    When I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "Reviewed" and is "green"
	Examples:
	| User | Announcement Name 			           | Flextable Name |
	| FO   | Automation Announcement to be deleted | Peer Reviewers |

  	@35003 @announcementAddAttachment @announcement @all
  	Scenario: Validate the attachment for an Announcement
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "a150b000003epC4AAI"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Funding Opportunity Announcement"
    And I close Modal
    Then I see that "Funding Opportunity Announcement" has been added in flextable with Id "a150b000003epC4AAI"

  	@34461 @submittingAnnouncementForApproval @announcement
  	Scenario Outline: Validate the submission of Announcement for Approval
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	Given Review is completed as user "FO" for the record "<Announcement Name>" on "DEMO" portal
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Save	  							  |	Submit Review 		  | Fiscal Reviewer |
	Given I login and view the record "<Announcement Name>" as "EXE"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | Competitive   		  | Announcements   |
	| Complete Review 	  | Draft Announcements | ActiveFundingOpportunitiesCompitive | View 		  		  | 				|
	Given I click on "Complete Review" in the page details
    When I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
	| Announcement Name		  |
	| Automation Announcement |
	
	@submittedAnnouncementDeletion @announcement @all
	Scenario Outline: Validate that only record owner cannot delete Submitted for Approval status announcements             
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	When I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesAll" panel
	Then I cannot see row level action button "Delete" against "<Announcement Name>" in flex table with id "ActiveFundingOpportunitiesAll"
 	Examples:
	| Announcement Name		  |
	| Automation Announcement |	
	
	@announcementForPastApplicationDueDate @announcement @all
	Scenario: 	Validate that user can not enter application due date as past date
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	
	@announcementWithBlankBudgetPeriod @announcement @all
	Scenario: 	Validate that user should not submit announcement with blank budget period dates
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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

  	@34763 @34765 @34766 @announcementApproval @announcement @all
  	Scenario Outline: Validate the approval of an Announcement
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	And Review is completed as user "FO" for the record "<Announcement Name>" on "DEMO" portal
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Sent for Review     | Save	  							  |	Submit Review 		  | Fiscal Reviewer |
	Given I login and view the record "<Announcement Name>" as "EXE"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | Competitive   		  | Announcements   |
	| Complete Review 	  | Draft Announcements | ActiveFundingOpportunitiesCompitive | View 		  		  | 				|
	Given I click on "Complete Review" in the page details
	And I click on "Submit For Approval" in the page details
	Given I re-login to "As a Grantor" app as "PM" user
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Announcement Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Announcement Name>" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "FO" user
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Announcement Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Announcement Name>" inside table 
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "EXE" user
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Announcement Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Announcement Name>" inside table 
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
	Examples:
	| Announcement Name		  |
	| Automation Announcement |
	
	@announcementPendingTaskPostApproval @announcement @all
	Scenario: Validate that after approval of an Announcement task get deleted from pending task table.
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	
	@announcementCompletedTaskPostApproval @announcement @all
	Scenario: Validate that after approval of an Announcement task get added to its completed task table.
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	
	@announcementSendBackToOwner @announcement @all
	Scenario: Validate the send back functionality of an Announcement
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
    
    @announcementSendBackPendingTaskToOwner @announcement @all
	Scenario: Validate that after send back from approvers owner should not get pending task 
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	And I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	
	@announcementPostSendBackCheckFieldHistory @announcement @all
	Scenario: Validate the field history after send back of an announcement
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	
	@announcementApprovalRejection @announcement @all
	Scenario: Validate the reject functionality of an Announcement
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
    
    @announcementRejectPendingTaskForNextApprover @announcement @all
	Scenario Outline: Validate that after rejection from 1st approver, 2nd user should not get pending task 
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	And I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	| User |
	| FO   | 
	
	@announcementPostRejectPendingTaskForUser @announcement @all
	Scenario: Validate that after rejection of an Announcement task get deleted from pending task table.
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	
	@announcementPostRejectCompletedTaskForUser @announcement @all
	Scenario: Validate that after rejection of an Announcement task get added to it's completed task table.
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
	Then I see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
	
	@announcementPostRejectCheckFieldHistory @announcement @all
	Scenario: Validate the field history after rejection of an announcement
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	
	@announcementPostRejectionCheckInListView @announcement @all
	Scenario: Validate the rejected announcement will reflect under "Rejected Announcements" list view
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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

  	@34462 @publishingCompetitiveAnnouncement @announcementCompetitiveHappyPath @announcement @all
  	Scenario Outline: Validate the activation of Internal Program
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance  |
	| FA--77 		  | 100000 			 |
	And I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	And Review is completed as user "FO" for the record "<Announcement Name>" on "DEMO" portal
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	 Save		  		  | Submit Review   |
	Given I login and view the record "<Announcement Name>" as "EXE"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | Competitive   		  | Announcements   |
	| Complete Review 	  | Draft Announcements | ActiveFundingOpportunitiesCompitive | View 		  		  | 			    |
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
    And I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesCompitive" panel
    When I click on "View" icon for "<Announcement Name>" inside table 
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
	Examples:
	| User | Announcement Name 			   |
	| EXE  | Automation Announcement       |
	
	@34462 @publishingDirectedAnnouncement @announcementDirectedHappyPath @announcement @all
  	Scenario Outline: Validate the activation of Internal Program
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I associate "1" records "RG-000010"
	| Actions 	  | Step 1     | Step 2	   		   | Step 3  			  					    | Step 4  | Step 5  		 				  |
    | Associate 1 | Overview   | Add Organizations | inlineEditGridSoleSourceAwardOrganizations | Add	 | SoleSourceAwardRecipientsTable |
    And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	And I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Save					| 						           |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	And Review is completed as user "FO" for the record "Record Id" on "DEMO" portal
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	 Save		  		  | Submit Review   |
	Given I login and view the record "<Announcement Name>" as "EXE"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | Competitive   		  | Announcements   |
	| Complete Review 	  | Draft Announcements | ActiveFundingOpportunitiesCompitive | View 		  		  | 			    |
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
    And I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesCompitive" panel
    When I click on "View" icon for "<Announcement Name>" inside table 
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
	Examples:
	| User | Announcement Name 		 |
	| EXE  | Automation Announcement |
	
	@34462 @publishingFormulaAnnouncement @announcementFormulaHappyPath @announcement @all
  	Scenario Outline: Validate the activation of Internal Program
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I associate "1" records "RG-000010"
	| Actions 	   | Step 1     | Step 2	   		   | Step 3  			  					 | Step 4  | Step 5  		 			    |
    | Associate 1 | Overview   | Add Organizations | inlineEditGridSoleSourceAwardOrganizations | Add	   | SoleSourceAwardRecipientsTable |
    And I edit the following rows inline in flex table with id "inlineEditGridSoleSourceAwardOrganizations" by clicking "Edit" :
	| Agency Code | Allocated Amount |
	| RG-000010   | 100000 			 | 
	And I associate "1" records "FA--77"
	| Actions 	  | Step 1     | Step 2	   | Step 3  			  					   | Step 4  | Step 5  		  			|
    | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add	 | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Pre-Encumbrance |
	| FA--77 		  | 100000 			|
	And I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				  		   |
	| Navigation | Financials 	| Add Budget Period 	| flexGridAnnouncementBudgetPeriod |
	| Flextable  | Save			| 						|                                  |
	Given I associate "3" records "Automation EXE,02493,SPO-0073"
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
	And Review is completed as user "FO" for the record "Record Id" on "DEMO" portal
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Sent for Review	    | Passed	  						  |	 Save		  		  | Submit Review   |
	Given I login and view the record "<Announcement Name>" as "EXE"
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | Competitive   		  | Announcements   |
	| Complete Review 	  | Draft Announcements | ActiveFundingOpportunitiesCompitive | View 		  		  | 				|
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
    When I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Announcement Name>" inside table 
    When I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
	Examples:
	| User | Announcement Name 		 		    |
	| EXE  | Automation Announcement            |
 	