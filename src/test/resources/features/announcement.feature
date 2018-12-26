@announcement
Feature: Validate all scenarios in the Announcement tab

	Background: Create Announcement
	Given I create a "Competitive" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"
	| Actions 	  | Step 1 	   	  					    | Step 2    	   	   		 | Step 3 							 |
	| Navigation  | As a Grantor  						| Announcements 	   		 |									 |
	| FlexTable   | Announcements 						| Draft Announcements 		 |  								 |
	| FlexTableId | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
	| Creation    | New			  						| Save And Close 	   		 | Save								 |

	@33936 @announcementCreation @announcement
	Scenario: Creation of an Announcement
	Then I see status in Progress-bar is "Created" and is "green"

	@34221 @34222 @announcementEdition @announcement
  	Scenario: Edition of an Announcement
 	When I click on "Edit" in the page details
	And I enter "Edition" values from "Announcement_Field_Values.xlsx"
	When I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"

  	@37029 @announcementContactAssociation @announcement
  	Scenario Outline: Contact association to an Announcement
	When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "<Contact>" in the table "AssociateAnnouncementContacts"
    And I close Modal
    Then I see that "<Contact>" has been added in flextable with Id "AnnouncementContacts"
	Examples:
	| Contact		  |
	| Automation EXE  |

  	@34759 @announcementDirectedInviteApplicant @announcementDirected
  	Scenario Outline: Organization association to an Announcement
	When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "inlineEditGridFormulaGrantsAwardOrganizations"
    When I click "Add" after selection of "<Agency Code>" in the table "SoleSourceAwardRecipientsTable"
    And I close Modal
    Then I see that "<Agency Code>" has been added in flextable with Id "inlineEditGridFormulaGrantsAwardOrganizations"
	Examples:
	| Agency Code |
	| RG-000010   |
	
  	@34760 @announcementFormulaInviteApplicant @announcementFormula
  	Scenario Outline: Amount addition to Invited applicant association to an Announcement
    Given I associate an agency "RG-000010" to the annoucement
    When I edit the following rows inline in flex table with id "inlineEditGridFormulaGrantsAwardOrganizations" by clicking "Edit" :
	| Agency Code | Allocated Amount |
	| RG-000010   | 100000 			 | 
   Then I see that "<Agency Code>" has been added in flextable with Id "inlineEditGridFormulaGrantsAwardOrganizations"
	Examples:
	| Agency Code |
	| RG-000010   |

  	@34769 @announcementFundingAccountAssociation @announcement
 	Scenario Outline: Funding Account association to an Announcement
	When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    When I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Announcement Pre-Encumbrance |
	| FA--21 		  | 100000 				         |
	Then I see that "<EGMS Id>" has been added in flextable with Id "flexGridAnnouncementFundingAccountGrantor"
	Examples:
	| EGMS Id |
	| FA--21  |
	
  	@34771 @announcementBudgetPeriodAddition @announcement
  	Scenario Outline: Budget Period Addition to an Announcement
	When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "AnnouncementBudgetPeriod"
    When I click on "Edit" icon for "<Budget Period Id>" inside flex table with id "AnnouncementBudgetPeriod"
    And I enter "BudgetPeriod" values from "Announcement_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    Then I see that "<Budget Period Id>" has been added in flextable with Id "AnnouncementBudgetPeriod"
	Examples:
	| Budget Period Id |
	| BP01			   |

  	@34775 @announcementFocusAreaAssociation @announcement
  	Scenario Outline: Validate the association of Focus Area to Announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementServiceArea1"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "AnnouncementServiceArea1"
	Examples:
	| EGMS Id |
	| 00006   |

  	@34774 @announcementObjectiveAssociation @announcement
  	Scenario Outline: Validate the association of objective to the Announcement 
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "AnnouncementGranteeStrategicGoalsObjectives"
	Examples:
	| EGMS Id  |
	| SPO-0008 |

  	@34773 @announcementKPIAssociation @announcement
  	Scenario Outline: Validate the association of KPI for the announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementKeyOutcomes"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "AnnouncementKeyOutcomes"
	Examples:
	| EGMS Id  |
	| KPI-0006 |

  	@35002 @announcementAttachmentChecklist @announcement
  	Scenario: Validate the attachment checklist of the announcement
    When I navigate to "Setup" sub tab
   	When I enter the following values into flex table with id "inlineEditGridAnnouncementChecklists" by clicking "Add" :
    | Description        		  | Required  | Applies To |
    | Automation test description | Mandatory | Award  	   |
    When I click on "Upload Template" icon for "ot Applicable" inside flex table with id "inlineEditGridAnnouncementChecklists"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
    Then I see that "Active" has been added in flextable with Id "inlineEditGridAnnouncementChecklists"

  	@announcementReviewStepsValidate @announcement
  	Scenario: Validate the review steps for the announcement
    When I navigate to "Setup" sub tab
    Then I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"

  	@34780 @announcementApproverSelection @announcement
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
	    
  	@34232 @announcementReviewerAssignment @announcement
  	Scenario: Validate the assignment of Reviewer for the Announcement
    When I navigate to "Responsibilities" sub tab
	And I click on top right button "New" in flex table with id "flexGridApproverRoles"
	When I enter "Reviewer" values from "Announcement_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
	Then I see that "Automation FO" has been added in flextable with Id "flexGridApproverRoles"

  	@34778 @announcementReviewerInitiation @announcement
  	Scenario: Validate the assignment of Reviewer for the Announcement
    When I navigate to "Responsibilities" sub tab
	And I click on top right button "New" in flex table with id "flexGridApproverRoles"
	When I enter "Reviewer" values from "Announcement_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
    And I click on "Send for Review" icon for "Created" inside flex table with id "flexGridApproverRoles"
	Then I see that "Sent for Review" has been added in flextable with Id "flexGridApproverRoles"

  	@34779 @announcementReviewComplete @announcement
  	Scenario Outline: Validate the review for the Announcement
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	And I re-login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Announcement Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Announcement Name>" inside table 
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" User
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
	When I click toggle button for "Draft Announcements"
    When I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "Reviewed" and is "green"
	Examples:
	| User | Announcement Name 			           | Flextable Name |
	| FO   | Automation Announcement to be deleted | Peer Reviewers |

  	@35003 @announcementAddAttachment @announcement
  	Scenario: Validate the attachment for an Announcement
    When I navigate to "Attachments" sub tab
    And I click on "Add" button on " Attachments" flextable for Attachment
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Funding Opportunity Announcement"
    And I close Modal
    Then I see that "Funding Opportunity Announcement" has been added in flextable with Id "a150b000003epC4AAI"

  	@34461 @submittingAnnouncementForApproval @announcement
  	Scenario: Validate the submission of Announcement for Approval
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I add a Funding Account "FA--21" with the amount to an announcement
	| Actions 		  	  | Step 1 			| Step 2					   			    |
	| Navigation 		  | Financials 		| 							   			    |
	| FlexTable 		  | Associate 		| flexGridAnnouncementFundingAccountGrantor | 
	| Funding Account 	  | Add				| popupflextable		       			    |
	| Button			  | Edit			| 										    |
	| Inline Column Title | Funding Account | Announcement Pre-Encumbrance 			    |
	| Inline values 	  | FA--21 		  	| 100000 				       			    |
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				   |
	| Navigation | Financials 	| Add Budget Period 	| AnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Budget Period Details | Save					   |
	And I associate Contact "Automation EXE", Focus Area "00006", Objective "SPO-0008"
	| Actions 	 | Step 1   | Step 2	| Step 3  			  							| Step 4 | Step 5  				    	 |
    | Contact    | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Focus Area | Setup	| Associate | AnnouncementServiceArea1			 			| Add    | popupflextable 		   		 |
    | Objective  | Setup 	| Associate | AnnouncementGranteeStrategicGoalsObjectives   | Add	 | popupflextable 		   		 |
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
    Given I add an attachment "InternalOrganization_Field_Values.xlsx" in the flextable " Attachments"
    | Actions 			    | Step 1 	  | Step 2	 		  				 |
    | Attachment Navigation | Attachments | Add								 |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |
	And I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	Given Review is completed as user "FO" for the record "Automation Announcement" created by "EXE" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Passed      	    | Save	  							  |	Submit Review 		  | Fiscal Reviewer |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | Competitive   		  | Announcements   |
	| Complete Review 	  | Draft Announcements | ActiveFundingOpportunitiesCompitive | View 		  		  | Complete Review |
    When I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  	@34763 @34765 @34766 @announcementApproval @announcement
  	Scenario Outline: Validate the approval of an Announcement
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I add a Funding Account "FA--21" with the amount to an announcement
	| Actions 		  	  | Step 1 			| Step 2					   			    |
	| Navigation 		  | Financials 		| 							   			    |
	| FlexTable 		  | Associate 		| flexGridAnnouncementFundingAccountGrantor | 
	| Funding Account 	  | Add				| popupflextable		       			    |
	| Button			  | Edit			| 										    |
	| Inline Column Title | Funding Account | Announcement Pre-Encumbrance 			    |
	| Inline values 	  | FA--21 		  	| 100000 				       			    |
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				   |
	| Navigation | Financials 	| Add Budget Period 	| AnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Budget Period Details | Save					   |
	And I associate Contact "Automation EXE", Focus Area "00006", Objective "SPO-0008"
	| Actions 	 | Step 1   | Step 2	| Step 3  			  							| Step 4 | Step 5  				    	 |
    | Contact    | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Focus Area | Setup	| Associate | AnnouncementServiceArea1			 			| Add    | popupflextable 		   		 |
    | Objective  | Setup 	| Associate | AnnouncementGranteeStrategicGoalsObjectives   | Add	 | popupflextable 		   		 |
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
    And I add an attachment "InternalOrganization_Field_Values.xlsx" in the flextable " Attachments"
    | Actions 			    | Step 1 	  | Step 2	 		  				 |
    | Attachment Navigation | Attachments | Add								 |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
		Given Review is completed as user "FO" for the record "Automation Announcement" created by "EXE" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Passed      	    | Save	  							  |	Submit Review 		  | Fiscal Reviewer |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | Competitive   		  | Announcements   |
	| Complete Review 	  | Draft Announcements | ActiveFundingOpportunitiesCompitive | View 		  		  | Complete Review |
	And I click on "Submit For Approval" in the page details
	Given I re-login to "As a Grantor" app as "PM" User
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Announcement Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Announcement Name>" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "FO" User
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Announcement Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Announcement Name>" inside table 
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "EXE" User
	When I navigate to "Announcements" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Announcement Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Announcement Name>" inside table 
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
	Examples:
	| Announcement Name		  |
	| Automation Announcement |

  	@34462 @publishingCompetitiveAnnouncement @announcementCompetitiveHappyPath @announcement
  	Scenario Outline: Validate the activation of Internal Program
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I add a Funding Account "FA--21" with the amount to an announcement
	| Actions 		  	  | Step 1 			| Step 2					   			    |
	| Navigation 		  | Financials 		| 							   			    |
	| FlexTable 		  | Associate 		| flexGridAnnouncementFundingAccountGrantor | 
	| Funding Account 	  | Add				| popupflextable		       			    |
	| Button			  | Edit			| 										    |
	| Inline Column Title | Funding Account | Announcement Pre-Encumbrance 			    |
	| Inline values 	  | FA--21 		  	| 100000 				       			    |
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				   |
	| Navigation | Financials 	| Add Budget Period 	| AnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Budget Period Details | Save					   |
	And I associate Contact "Automation EXE", Focus Area "00006", Objective "SPO-0008"
	| Actions 	 | Step 1   | Step 2	| Step 3  			  							| Step 4 | Step 5  				    	 |
    | Contact    | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Focus Area | Setup	| Associate | AnnouncementServiceArea1			 			| Add    | popupflextable 		   		 |
    | Objective  | Setup 	| Associate | AnnouncementGranteeStrategicGoalsObjectives   | Add	 | popupflextable 		   		 |
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
    And I add an attachment "InternalOrganization_Field_Values.xlsx" in the flextable " Attachments"
    | Actions 			    | Step 1 	  | Step 2	 		  				 |
    | Attachment Navigation | Attachments | Add								 |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
		Given Review is completed as user "FO" for the record "Automation Announcement" created by "EXE" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Passed      	    | Save	  							  |	Submit Review 		  | Fiscal Reviewer |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | Competitive   		  | Announcements   |
	| Complete Review 	  | Draft Announcements | ActiveFundingOpportunitiesCompitive | View 		  		  | Complete Review |
	And I click on "Submit For Approval" in the page details
	Given "3" Approvers "PM,FO,EXE" approve the record "<Announcement Name>"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	And I re-login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I navigate to "Competitive" content inside "Announcements" subheader on left panel
	When I click toggle button for "Draft Announcements"
    And I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesCompitive" panel
    When I click on "View" icon for "<Announcement Name>" inside table 
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
	Examples:
	| User | Announcement Name 			   |
	| EXE  | Automation Announcement Dec10 |
	
	@34462 @publishingDirectedAnnouncement @announcementDirectedHappyPath @announcement
  	Scenario Outline: Validate the activation of Internal Program
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate an agency "RG-000010" to the annoucement
	Given I add a Funding Account "FA--21" with the amount to an announcement
	| Actions 		  	  | Step 1 			| Step 2					   			   |
	| Navigation 		  | Financials 		| 							   			   |
	| FlexTable 		  | Associate 		| lexGridAnnouncementFundingAccountGrantor | 
	| Funding Account 	  | Add				| popupflextable		       			   |
	| Button			  | Edit			| 										   |
	| Inline Column Title | Funding Account | Announcement Pre-Encumbrance 			   |
	| Inline values 	  | FA--21 		  	| 100000 				       			   |
	And I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				   |
	| Navigation | Financials 	| Add Budget Period 	| AnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Budget Period Details | Save					   |
	Given I associate Contact "Automation EXE", Focus Area "00006", Objective "SPO-0008"
	| Actions 	 | Step 1   | Step 2	| Step 3  			  							| Step 4 | Step 5  				    	 |
    | Contact    | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Focus Area | Setup	| Associate | AnnouncementServiceArea1			 			| Add    | popupflextable 		   		 |
    | Objective  | Setup 	| Associate | AnnouncementGranteeStrategicGoalsObjectives   | Add	 | popupflextable 		   		 |
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
    And I add an attachment "InternalOrganization_Field_Values.xlsx" in the flextable " Attachments"
    | Actions 			    | Step 1 	  | Step 2	 		  				 |
    | Attachment Navigation | Attachments | Add								 |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	And Review is completed as user "FO" for the record "Automation Announcement" created by "EXE" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  	 | Step 3  	 		     | Step 4 		   |
	| Reviewer Navigation | As a Grantor        | Announcements 			 | Pending Tasks 		 | My Tasks 	   |
	| FlexTable 		  | PhasePendingTasks   | Start						 | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Passed      	    | Save	  					 |	Submit Review 		 | Fiscal Reviewer |
	| Owner Navigation 	  | As a Grantor 		| Announcements 			 | Directed	   		     | Announcements   |
	| Complete Review 	  | Draft Announcements | ActiveFundingOpportunities | View 		  		 | Complete Review |
	And I click on "Submit For Approval" in the page details
	Given "3" Approvers "PM,FO,EXE" approve the record "<Announcement Name>"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	And I re-login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I navigate to "Directed" content inside "Announcements" subheader on left panel
	When I click toggle button for "Draft Announcements"
    And I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesCompitive" panel
    When I click on "View" icon for "<Announcement Name>" inside table 
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
	Examples:
	| User | Announcement Name 		 |
	| EXE  | Automation Announcement |
	
	@34462 @publishingFormulaAnnouncement @announcementFormulaHappyPath @announcement
  	Scenario Outline: Validate the activation of Internal Program
	Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I associate an agency "RG-000010" with amount to the annoucement
	| Agency Code | Allocated Amount   |
	| RG-000010   | 100000 			   | 
	Given I add a Funding Account "FA--21" with the amount to an announcement
	| Actions 		  	  | Step 1 			| Step 2					   			    |
	| Navigation 		  | Financials 		| 							   			    |
	| FlexTable 		  | Associate 		| flexGridAnnouncementFundingAccountGrantor | 
	| Funding Account 	  | Add				| popupflextable		       			    |
	| Button			  | Edit			| 										    |
	| Inline Column Title | Funding Account | Announcement Pre-Encumbrance 			    |
	| Inline values 	  | FA--21 		  	| 100000 				       			    |
	And I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	| Actions 	 | Step 1 		| Step 2				| Step 3 				   |
	| Navigation | Financials 	| Add Budget Period 	| AnnouncementBudgetPeriod |
	| Flextable  | Edit 	    | Budget Period Details | Save					   |
	Given I associate Contact "Automation EXE", Focus Area "00006", Objective "SPO-0008"
	| Actions 	 | Step 1   | Step 2	| Step 3  			  							| Step 4 | Step 5  				    	 |
    | Contact    | Overview | Associate | AnnouncementContacts			   			    | Add	 | AssociateAnnouncementContacts |
    | Focus Area | Setup	| Associate | AnnouncementServiceArea1			 			| Add    | popupflextable 		   		 |
    | Objective  | Setup 	| Associate | AnnouncementGranteeStrategicGoalsObjectives   | Add	 | popupflextable 		   		 |
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
	And I add an attachment "InternalOrganization_Field_Values.xlsx" in the flextable " Attachments"
    | Actions 			    | Step 1 	  | Step 2	 		  				 |
    | Attachment Navigation | Attachments | Add								 |
    | Attachment Details    | Attachment  | Funding Opportunity Announcement |
	Given I assign, initiate a reviewer from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	| Actions 			  | Step 1 	  		      | Step 2	 		   	  | Step 3  |
	| Reviewer Navigation | Responsibilities      | 					  |			|
	| FlexTable 		  | New				      | flexGridApproverRoles | Save    |
	| Send Review		  | Send for Review       | Created 			  |			|
	And Review is completed as user "FO" for the record "Automation Announcement" created by "EXE" 
	| Actions 			  | Step 1 	  		    | Step 2	 		   	  			  | Step 3  	 		  | Step 4 		    |
	| Reviewer Navigation | As a Grantor        | Announcements 					  | Pending Tasks 		  | My Tasks 	    |
	| FlexTable 		  | PhasePendingTasks   | Start								  | flexGridApproverRoles | Enter Review    | 
	| Enter Review		  | Passed      	    | Save	  							  |	Submit Review 		  | Fiscal Reviewer |
	| Owner Navigation 	  | As a Grantor 		| Announcements 					  | Formula		  		  | Announcements   |
	| Complete Review 	  | Draft Announcements | ActiveFundingOpportunitiesFormula   | View 		  		  | Complete Review | 
	And I click on "Submit For Approval" in the page details
	Given "3" Approvers "PM,FO,EXE" approve the record "<Announcement Name>"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Announcements | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	When I re-login to "As a Grantor" app as "<User>" User
	And I navigate to "Announcements" tab
	When I navigate to "Formula" content inside "Announcements" subheader on left panel
	And I click toggle button for "Draft Announcements"
    When I perform quick search for "<Announcement Name>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Announcement Name>" inside table 
    When I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
	Examples:
	| User | Announcement Name 		 |
	| EXE  | Automation Announcement |
 	