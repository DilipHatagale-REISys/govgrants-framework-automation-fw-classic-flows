@announcement
Feature: Validate all scenarios in the Announcement tab

	Background: Create Announcement
	Given I create a "Competitive" Announcement as user "EXE" from sheet "Creation" in excel "Announcement_Field_Values.xlsx"

	@33936 @announcementCreation @announcement
	Scenario: Creation of an Announcement
	Then I see that "Created" status is in "green" on progress bar

	@34221 @34222 @announcementEdition @announcement
  	Scenario: Edition of an Announcement
 	When I click on "Edit" button
	And I enter "Edition" values from "Announcement_Field_Values.xlsx"
	When I click on "Save" button
	Then I see that "Created" status is in "green" on progress bar

  	@37029 @announcementContactAssociation @announcement
  	Scenario Outline: Contact association to an Announcement
	When I click on "Overview" subtab
    And I click on "Associate" button on "Contacts" flextable with Id "AnnouncementContacts"
    When I click "Add" after selection of "<Contact>" in the table "AssociateAnnouncementContacts"
    And I close Modal
    Then I see that "<Contact>" has been added in flextable "<Flextable Name>" with Id "AnnouncementContacts"
	Examples:
	| Contact		  | Flextable Name |
	| Automation EXE  | Contacts	   |

  	@34759 @announcementDirectedInviteApplicant @announcementDirected
  	Scenario Outline: Organization association to an Announcement
	When I click on "Overview" subtab
    And I click on "Add Organizations" button on "<Flextable Name>" flextable with Id "inlineEditGridFormulaGrantsAwardOrganizations"
    When I click "Add" after selection of "<Agency Code>" in the table "SoleSourceAwardRecipientsTable"
    And I close Modal
    Then I see that "<Agency Code>" has been added in flextable "<Flextable Name>" with Id "inlineEditGridFormulaGrantsAwardOrganizations"
	Examples:
	| Agency Code | Flextable Name	   |
	| RG-000010   | Invited Applicants |
	
  	@34760 @announcementFormulaInviteApplicant @announcementFormula
  	Scenario Outline: Amount addition to Invited applicant association to an Announcement
    Given I associate an agency "RG-000010" to the annoucement
    When I edit the following rows inline in flex table with id "inlineEditGridFormulaGrantsAwardOrganizations" by clicking "Edit" :
	| Agency Code | Allocated Amount |
	| RG-000010   | 100000 			 | 
   Then I see that "<Agency Code>" has been added in flextable "<Flextable Name>"  with Id "inlineEditGridFormulaGrantsAwardOrganizations"
	Examples:
	| Agency Code | Flextable Name 	   |
	| RG-000010   | Invited Applicants |

  	@34769 @announcementFundingAccountAssociation @announcement
 	Scenario Outline: Funding Account association to an Announcement
	When I click on "Financials" subtab
    And I click on "Associate" button on "<Flextable Name>" flextable with Id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    When I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
	| Funding Account | Announcement Pre-Encumbrance |
	| FA--21 		  | 100000 				        | 
	Then I see that "<EGMS Id>" has been added in flextable "<Flextable Name>" with Id "flexGridAnnouncementFundingAccountGrantor"
	Examples:
	| EGMS Id | Flextable Name   |
	| FA--21  | Funding Accounts |
	
  	@34771 @announcementBudgetPeriodAddition @announcement
  	Scenario Outline: Budget Period Addition to an Announcement
	When I click on "Financials" subtab
    And I click on "Add Budget Period" button on "Budget Period Details " flextable with Id "AnnouncementBudgetPeriod"
    When I click on the "Edit" icon for the "<Budget Period Id>" on the flextable "<Flextable Name>"
    And I enter "BudgetPeriod" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" button in the modal
    And I close Modal
    Then I see that "<Budget Period Id>" has been added in flextable "<Flextable Name>" with Id "AnnouncementBudgetPeriod"
	Examples:
	| Budget Period Id | Flextable Name	       |
	| BP01			   | Budget Period Details |

  	@34775 @announcementFocusAreaAssociation @announcement
  	Scenario Outline: Validate the association of Focus Area to Announcement
    When I click on "Setup" subtab
    And I click on "Associate" button on "<Flextable Name>" flextable with Id "AnnouncementServiceArea1"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable "<Flextable Name>" with Id "AnnouncementServiceArea1"
	Examples:
	| Flextable Name | EGMS Id |
	| Focus Areas 	 | 00006   |

  	@34774 @announcementObjectiveAssociation @announcement
  	Scenario Outline: Validate the association of objective to the Announcement 
    When I click on "Setup" subtab
    And I click on "Associate" button on "<Flextable Name>" flextable with Id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable "<Flextable Name>" with Id "AnnouncementGranteeStrategicGoalsObjectives"
	Examples:
	| Flextable Name | EGMS Id  |
	| Objectives	 | SPO-0008 |

  	@34773 @announcementKPIAssociation @announcement
  	Scenario Outline: Validate the association of KPI for the announcement
    When I click on "Setup" subtab
    And I click on "Associate" button on "<Flextable Name>" flextable with Id "AnnouncementKeyOutcomes"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    Then I see that "<KPI>" has been added in flextable "<Flextable Name>" with Id "AnnouncementKeyOutcomes"
	Examples:
	| Flextable Name					 | KPI 		|
	| Key Performance Indicators (KPIs)  | KPI-0006 |

  	@35002 @announcementAttachmentChecklist @announcement
  	Scenario Outline: Validate the attachment checklist of the announcement
    When I click on "Setup" subtab
   	When I enter the following values into flex table with id "inlineEditGridAnnouncementChecklists" by clicking "Add" :
    | Description        		  | Required  | Applies To |
    | Automation test description | Mandatory | Award  	   |
    When I click on the "Upload Template" icon for the "Not Applicable" on the flextable "<Flextable Name>"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
    Then I see that "Active" has been added in flextable "<Flextable Name>" with Id "inlineEditGridAnnouncementChecklists"
	Examples:
	| Flextable Name 		|
	| Supporting Documents  |

  	@announcementReviewStepsValidate @announcement
  	Scenario Outline: Validate the review steps for the announcement
    When I click on "Setup" subtab
    Then I click on "Validate" button on "<Flextable Name>" flextable with Id "flexGridAnnouncementReviewTemplates"
    Examples:
	| Flextable Name |
	| Review Steps   |

  	@34780 @announcementApproverSelection @announcement
  	Scenario: Validate the assignment of Approvers for the Announcement 
    When I click on "Responsibilities" subtab
    And I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    When I fill in the "Automation PM" for the Approver details
    And I switch to Parent frame
    When I click on the "Edit" icon for the "Fiscal Approver" on the flextable "Approvers"
    And I fill in the "Automation FO" for the Approver details
    And I switch to Parent frame
    And I click on the "Edit" icon for the "Executive Approver" on the flextable "Approvers"
    When I fill in the "Automation EXE" for the Approver details
    And I switch to Parent frame
    Then I see that "Automation EXE" has been added in flextable "Approvers" with Id "GrantorAnnouncementRolesandResponsibilities"
	    
  	@34232 @announcementReviewerAssignment @announcement
  	Scenario Outline: Validate the assignment of Reviewer for the Announcement
    When I click on "Responsibilities" subtab
	And I click on "New" button on "<Flextable Name>" flextable with Id "flexGridApproverRoles"
	When I enter "Reviewer" values from "Announcement_Field_Values.xlsx"
	And I click on "Save" button in the modal
	When I close Modal
	Then I see that "Automation FO" has been added in flextable "<Flextable Name>" with Id "flexGridApproverRoles"
	Examples:
	| Flextable Name |
	| Peer Reviewers |

  	@34778 @announcementReviewerInitiation @announcement
  	Scenario Outline: Validate the assignment of Reviewer for the Announcement
    When I click on "Responsibilities" subtab
	And I click on "New" button on "<Flextable Name>" flextable with Id "flexGridApproverRoles"
	When I enter "Reviewer" values from "Announcement_Field_Values.xlsx"
	And I click on "Save" button in the modal
	When I close Modal
    And I click on the "Send for Review" icon for the "Created" on the flextable "<Flextable Name>"
	Then I see that "Sent for Review" has been added in flextable "<Flextable Name>" with Id "flexGridApproverRoles"
	Examples:
	| Flextable Name |
	| Peer Reviewers |

  	@34779 @announcementReviewComplete @announcement
  	Scenario Outline: Validate the review for the Announcement
	Given I assign, initiate a reviewer for an announcement from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	And I re-login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Announcement Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Announcement Name>" 
    When I click on the "Enter Review" icon for the "Automation FO" on the flextable "<Flextable Name>"
    And I enter a review
    When I click on "Save" button in the modal
    And I click on "Submit Review" button in the modal
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" User
    When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Announcement Name>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Announcement Name>"
    When I click on "Complete Review" button
    Then I see that "Reviewed" status is in "green" on progress bar
	Examples:
	| User | Announcement Name 			           | Flextable Name |
	| FO   | Automation Announcement to be deleted | Peer Reviewers |

  	@35003 @announcementAddAttachment @announcement
  	Scenario: Validate the attachment for an Announcement
    When I click on "Attachments" subtab
    And I click on "Add" button on " Attachments" flextable to switch to frame
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Funding Opportunity Announcement"
    And I close Modal
    Then I see that "Funding Opportunity Announcement" has been added in flextable "Attachments" with Id "a150b000003epC4AAI"

  	@34461 @submittingAnnouncementForApproval @announcement
  	Scenario: Validate the submission of Announcement for Approval
	Given I complete the Announcement fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
	And I add a Funding Account "FA--21" with the amount to an announcement
	| Funding Account | Announcement Pre-Encumbrance |
	| FA--21 		  | 100000 				         |
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	And I associate Contact "Automation EXE", Focus Area "00006", Objective "SPO-0008" to the announcement
	Given I select the Program Approver "Automation PM",Fiscal Approver "Automation FO",Executive Approver "Automation EXE" for the announcement
	Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx" to the announcement
	| Description        		  | Required  | Applies To |
    | Automation test description | Mandatory | Award  	   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx" to announcement
	And I assign, initiate a reviewer for an announcement from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	Given Review is completed as user "FO" for the "Competitive" announcement "Automation Announcement" created by "EXE" 
    When I click on "Submit For Approval" button
    Then I see that "Submitted for Approval" status is in "green" on progress bar

  	@34763 @34765 @34766 @announcementApproval @announcement
  	Scenario Outline: Validate the approval of an Announcement
	Given I complete the Announcement fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
	And I add a Funding Account "FA--21" with the amount to an announcement
	| Funding Account | Announcement Pre-Encumbrance |
	| FA--21 		  | 100000 				        |
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	And I associate Contact "Automation EXE", Focus Area "00006", Objective "SPO-0008" to the announcement
	Given I select the Program Approver "Automation PM",Fiscal Approver "Automation FO",Executive Approver "Automation EXE" for the announcement
	Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx" to the announcement
	| Description        		  | Required  | Applies To |
    | Automation test description | Mandatory | Award  	   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx" to announcement
	And I assign, initiate a reviewer for an announcement from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	Given Review is completed as user "FO" for the "Competitive" announcement "Automation Announcement" created by "EXE" 
	And I click on "Submit For Approval" button
	Given I re-login to "As a Grantor" app as "PM" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Announcement Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Announcement Name>" 
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "FO" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Announcement Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Announcement Name>" 
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "EXE" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Announcement Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Announcement Name>" 
    When I click on "Approve" on the approval decision box
    Then I see that "Approved" status is in "green" on progress bar
	Examples:
	| Announcement Name		  |
	| Automation Announcement |

  	@34462 @publishingCompetitiveAnnouncement @announcementCompetitiveHappyPath @announcement
  	Scenario Outline: Validate the activation of Internal Program
	Given I complete the Announcement fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
	And I add a Funding Account "FA--21" with the amount to an announcement
	| Funding Account | Announcement Pre-Encumbrance |
	| FA--21 		  | 100000 				         |
	Given I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	And I associate Contact "Automation EXE", Focus Area "00006", Objective "SPO-0008" to the announcement
	Given I select the Program Approver "Automation PM",Fiscal Approver "Automation FO",Executive Approver "Automation EXE" for the announcement
	Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx" to the announcement
	| Description        		  | Required  | Applies To |
    | Automation test description | Mandatory | Award  	   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx" to announcement
	And I assign, initiate a reviewer for an announcement from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	Given Review is completed as user "FO" for the "Competitive" announcement "<Announcement Name>" created by "EXE" 
	And I click on "Submit For Approval" button
	Given Approvers "PM", "FO", "EXE" approve the announcement "<Announcement Name>"
	And I re-login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    And I perform quick search "<Announcement Name>" on table "ActiveFundingOpportunitiesCompitive"
    When I click on the "View" icon for the "<Announcement Name>" 
    And I click on "Publish" button
    Then I see that "Published" status is in "green" on progress bar
	Examples:
	| User | Announcement Name 					   |
	| EXE  | Automation Announcement to be deleted |
	
	@34462 @publishingDirectedAnnouncement @announcementDirectedHappyPath @announcement
  	Scenario Outline: Validate the activation of Internal Program
	Given I complete the Announcement fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
	And I associate an agency "RG-000010" to the annoucement
	Given I add a Funding Account "FA--21" with the amount to an announcement
	| Funding Account | Announcement Pre-Encumbrance |
	| FA--21 		  | 100000 				        |
	And I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	Given I associate Contact "Automation EXE", Focus Area "00006", Objective "SPO-0008" to the announcement
	And I select the Program Approver "Automation PM",Fiscal Approver "Automation FO",Executive Approver "Automation EXE" for the announcement
	Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx" to the announcement
	| Description        		  | Required  | Applies To |
    | Automation test description | Mandatory | Award  	   |
    And I add an attachment "InternalOrganization_Field_Values.xlsx" to announcement
	Given I assign, initiate a reviewer  for an announcement from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	And Review is completed as user "FO" for the "Directed" announcement "Automation Announcement" created by "EXE" 
	And I click on "Submit For Approval" button
	Given Approvers "PM", "FO", "EXE" approve the announcement "Automation Announcement"
	And I re-login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Directed" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    And I perform quick search "<Announcement Name>" on table "ActiveFundingOpportunitiesCompitive"
    When I click on the "View" icon for the "<Announcement Name>" 
    And I click on "Publish" button
    Then I see that "Published" status is in "green" on progress bar
	Examples:
	| User | Announcement Name 		 |
	| EXE  | Automation Announcement |
	
	@34462 @publishingFormulaAnnouncement @announcementFormulaHappyPath @announcement
  	Scenario Outline: Validate the activation of Internal Program
	Given I complete the Announcement fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
	And I associate an agency "RG-000010" with amount to the annoucement
	| Agency Code | Allocated Amount   |
	| RG-000010   | 100000 			 | 
	Given I add a Funding Account "FA--21" with the amount to an announcement
	| Funding Account | Announcement Pre-Encumbrance |
	| FA--21 		  | 100000 				        |
	And I add Budget Period Details "BP01" from sheet "BudgetPeriod" in excel "Announcement_Field_Values.xlsx" to an announcement
	Given I associate Contact "Automation EXE", Focus Area "00006", Objective "SPO-0008" to the announcement
	And I select the Program Approver "Automation PM",Fiscal Approver "Automation FO",Executive Approver "Automation EXE" for the announcement
	Given I add an attachment checklist to upload the file "Program_Field_Values.xlsx" to the announcement
	| Description        		  | Required  | Applies To |
    | Automation test description | Mandatory | Award  	   |
	And I add an attachment "InternalOrganization_Field_Values.xlsx" to announcement
	Given I assign, initiate a reviewer  for an announcement from sheet "Reviewer" in excel "Announcement_Field_Values.xlsx"
	And Review is completed as user "FO" for the "Directed" announcement "Automation Announcement" created by "EXE" 
	And I click on "Submit For Approval" button
	Given Approvers "PM", "FO", "EXE" approve the announcement "Automation Announcement"
	When I re-login to "As a Grantor" app as "<User>" User
	And I navigate to "Announcements" tab
	When I click "Directed" inside side bar "Announcements"
	And I toggle to "Draft Announcements"
    When I perform quick search "<QAnnouncement Name>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Announcement Name>" 
    When I click on "Publish" button
    Then I see that "Published" status is in "green" on progress bar
	Examples:
	| User | Announcement Name 		 |
	| EXE  | Automation Announcement |
 	