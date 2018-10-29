@planning
Feature: Validate all scenarios in the Announcement tab

  @33936 @announcementCreation @announcement
  Scenario Outline: Creation of an Announcement
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
	When I click on "New" button on "Draft Announcements" phase flextable
	When I enter "Creation" values from "Announcement_Field_Values.xlsx" in the modal for "Announcement Creation"
	When I click on "Save and Close Modal" button in the "Announcement" modal
	Then I see that "Announcement" is in "Created" status

	Examples:
	| User |
	| EXE |
	
  @34221 @34222 @announcementEdition @announcement
  Scenario Outline: Edition of an Announcement
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
	When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "Edit" icon for the "<Quick Search Text>" 
	When I enter "Edition" values from "Announcement_Field_Values.xlsx"
	When I click on "Save" button
	Then I see that "Announcement" is in "Created" status

	Examples:
	| User | Quick Search Text |
	| EXE | Automation Announcement |
	
  @37029 @announcementContactAssociation @announcement
  Scenario Outline: Contact association to an Announcement
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
	When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
	And I click on "Overview" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    When I click "Add" after selection of "<Contact>" in the frame "AnnouncementContactsiframeContentId"
    And I close Modal "AnnouncementContactsmodalDivCloseIcon"
    Then I see that "<Contact>" has been added in "<Flextable Name>" flextable

	Examples:
	| User | Quick Search Text | Contact | Flextable Name |
	| EXE | Automation Announcement | Automation EXE | Contacts |
	
  @34759 @announcementDirectedInviteApplicant @announcementDirected
  Scenario Outline: Contact association to an Announcement
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Announcements" tab
	And I click "Directed" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
	When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunities"
    And I click on the "View" icon for the "<Quick Search Text>" 
	And I click on "Overview" subtab
    When I click on "Add Organizations" button on "<Flextable Name>" flextable
    When I click "Add" after selection of "<Agency Code>" in the frame "FormulaGrantsAwardOrganizationsiframeContentId"
    And I close Modal "FormulaGrantsAwardOrganizationsiframeContentIdButton"
    Then I see that "<Agency Code>" has been added in "<Flextable Name>" flextable

	Examples:
	| User | Quick Search Text | Agency Code | Flextable Name |
	| EXE | Automation Announcement Directed | RG-000010 | Invited Applicants |
	
  @34760 @announcementFormulaInviteApplicant @announcementFormula
  Scenario Outline: Contact association to an Announcement
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Announcements" tab
	And I click "Formula" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
	When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesFormula"
    And I click on the "View" icon for the "<Quick Search Text>" 
	And I click on "Overview" subtab
    When I click on "Add Organizations" button on "<Flextable Name>" flextable
    When I click "Add" after selection of "<Agency Code>" in the frame "SoleSourceAwardOrganizationsiframeContentId"
    And I close Modal "SoleSourceAwardOrganizationsiframeContentIdButton"
    When I click on the "Edit" icon for the "<Agency Code>" on the flextable "<Flextable Name>"
    And I fill in the Inline fields on "<Flextable Name>"
    Then I see that "<Agency Code>" has been added in "<Flextable Name>" flextable

	Examples:
	| User | Quick Search Text | Agency Code | Flextable Name |
	| EXE | Automation Announcement Formula | RG-000010 | Invited Applicants |
	
  @34769 @announcementFundingAccountAssociation @announcement
  Scenario Outline: Funding Account association to an Announcement
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
	When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
	And I click on "Financials" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    When I click "Add" after selection of "<EGMS Id>" in the frame "AnnouncementFundingAccountGrantoriframeContentId"
    And I close Modal "AnnouncementServiceArea1modalDivCloseIcon"
    When I click on the "Edit" icon for the "<EGMS Id>" on the flextable "<Flextable Name>"
    And I fill in the Funding Account fields on "<Flextable Name>"
    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable

	Examples:
	| User | Quick Search Text | EGMS Id | Flextable Name |
	| EXE | Automation Announcement | FA--20 | Funding Accounts |
	
  @34771 @announcementBudgetPeriodAddition @announcement
  Scenario Outline: Budget Period Addition to an Announcement
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
	When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
	And I click on "Financials" subtab
    When I click on "Add Budget Period" button on "<Flextable Name>" flextable
    When I click on the "Edit" icon for the "<Budget Period Id>" on the flextable "<Flextable Name>"
    When I enter "BudgetPeriod" values from "Announcement_Field_Values.xlsx" in the modal for "Budget Period"
    When I click on "Save and Close" button in the "Budget Period" modal
    Then I see that "<Budget Period Id>" has been added in "<Flextable Name>" flextable

	Examples:
	| User | Quick Search Text | Budget Period Id | Flextable Name |
	| EXE | Automation Announcement | BP01 | Budget Period Details |
	
  @34775 @announcementFocusAreaAssociation @announcement
  Scenario Outline: Validate the association of Focus Area to Announcement
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    When I click "Add" after selection of "<EGMS Id>" in the frame "AnnouncementServiceArea1iframeContentId"
    And I close Modal "AnnouncementServiceArea1modalDivCloseIcon"
    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text | Flextable Name | EGMS Id |
	| EXE | Automation Announcement | Focus Areas | 00006 |
	
  @34774 @announcementObjectiveAssociation @announcement
  Scenario Outline: Validate the association of objective to the Announcement
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    When I click "Add" after selection of "<EGMS Id>" in the frame "AnnouncementGranteeStrategicGoalsObjectivesiframeContentId"
    And I close Modal "AnnouncementGranteeStrategicGoalsObjectivesmodalDivCloseIcon"
    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text | Flextable Name | EGMS Id |
	| EXE | Automation Announcement | Objectives | SPO-0008 |
	
	
  @34773 @announcementKPIAssociation @announcement
  Scenario Outline: Validate the association of KPI for the announcement
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    When I click "Add" after selection of "<EGMS Id>" in the frame "ProgramKeyOutcomesiframeContentId"
    And I close Modal "ProgramKeyOutcomesmodalDivCloseIcon"
    Then I see that "<KPI>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text |  Flextable Name | KPI |
	| EXE | Automation Announcement | Key Performance Indicators (KPIs) | KPI-0006 |
	
  @35002 @announcementAttachmentChecklist @announcement
  Scenario Outline: Validate the attachment checklist of the announcement
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Add" button on "<Flextable Name>" flextable
    And I fill in the attachment checklist fields
    When I click on the "Upload Template" icon for the "Not Applicable" on the flextable "<Flextable Name>"
    When I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    Then I see that "Active" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text |  Flextable Name |
	| EXE | Automation Announcement | Supporting Documents |
	
  @announcementReviewStepsValidate @announcement
  Scenario Outline: Validate the association of KPI for the announcement
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Validate" button on "<Flextable Name>" flextable
    
    Examples:
	| User | Quick Search Text |  Flextable Name |
	| EXE | Automation Announcement | Review Steps |
	
  @34780 @announcementApproverSelection @announcement
  Scenario Outline: Validate the assignment of Approvers for the Announcement
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Responsibilities" subtab
    When I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    When I fill in the "Automation PM" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    When I click on the "Edit" icon for the "Fiscal Approver" on the flextable "Approvers"
    And I fill in the "Automation FO" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    When I click on the "Edit" icon for the "Executive Approver" on the flextable "Approvers"
    And I fill in the "Automation EXE" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    Then I see that "Automation EXE" has been added in "Approvers" flextable
	
	Examples:
	| User | Quick Search Text |
	| EXE | Automation Announcement |
	
  @35003 @announcementAddAttachment @announcement
  Scenario Outline: Validate the attachment for an Announcement
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Attachments" subtab
    When I click on "Add" button on " Attachments" flextable
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Funding Opportunity Announcement"
    Then I see that "Funding Opportunity Announcement" has been added in "Attachments" flextable
	
	Examples:
	| User | Quick Search Text |
	| EXE | Automation Announcement |
	
  @34461 @submittingAnnouncementForApproval @announcement
  Scenario Outline: Validate the submission of Announcement for Approval
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    When I click on "Submit For Approval" button
    Then I see that "Announcement" is in "Submitted for Approval" status
	
	Examples:
	| User | Quick Search Text |
	| EXE | Automation Announcement |
	
  @34763 @34765 @34766 @announcementApproval @announcement
  Scenario Outline: Validate the approval of an Announcement
	Given I login to "As a Grantor" app as "PM" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
     When I re-login to "As a Grantor" app as "EXE" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    Then I see that "Announcement" is in "Approved" status
	
	Examples:
	| Quick Search Text |
	| Automation Announcement |
	
  @34462 @publishingAnnouncement @announcement
  Scenario Outline: Validate the activation of Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    When I click on "Publish" button
    Then I see that "Announcement" is in "Published" status
	
	Examples:
	| User | Quick Search Text |
	| EXE | Automation Announcement |
	
  @announcementCompetitiveHappyPath
  Scenario Outline: End to End of an Announcement
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Announcements" tab
	And I click "Competitive" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
	When I click on "New" button on "Draft Announcements" phase flextable
	When I enter "Creation" values from "Announcement_Field_Values.xlsx" in the modal for "Announcement Creation"
	When I click on "Save and Close Modal" button in the "Announcement" modal
	When I enter "Edition" values from "Announcement_Field_Values.xlsx"
	When I click on "Save" button
	And I click on "Overview" subtab
    When I click on "Associate" button on "Contacts" flextable
    When I click "Add" after selection of "Automation EXE" in the frame "AnnouncementContactsiframeContentId"
    And I close Modal "AnnouncementContactsmodalDivCloseIcon"
    And I click on "Financials" subtab
    When I click on "Associate" button on "Funding Accounts" flextable
    When I click "Add" after selection of "FA--20" in the frame "AnnouncementFundingAccountGrantoriframeContentId"
    And I close Modal "AnnouncementFundingAccountGrantoriframeContentIdButton"
    When I click on the "Edit" icon for the "FA--20" on the flextable "Funding Accounts"
    And I fill in the Funding Account fields on "Funding Accounts"
    And I click on "Financials" subtab
    When I click on "Add Budget Period" button on "Budget Period Details" flextable
    When I click on the "Edit" icon for the "BP01" on the flextable "Budget Period Details"
    When I enter "BudgetPeriod" values from "Announcement_Field_Values.xlsx" in the modal for "Budget Period"
    When I click on "Save and Close" button in the "Budget Period" modal
    And I click on "Setup" subtab
    When I click on "Associate" button on "Focus Areas" flextable
    When I click "Add" after selection of "00006" in the frame "AnnouncementServiceArea1iframeContentId"
    And I close Modal "AnnouncementServiceArea1modalDivCloseIcon"
    And I click on "Setup" subtab
    When I click on "Associate" button on "Objectives" flextable
    When I click "Add" after selection of "SPO-0008" in the frame "AnnouncementGranteeStrategicGoalsObjectivesiframeContentId"
    And I close Modal "AnnouncementGranteeStrategicGoalsObjectivesmodalDivCloseIcon"
    And I click on "Setup" subtab
    When I click on "Add" button on "Supporting Documents" flextable
    And I fill in the attachment checklist fields
    When I click on the "Upload Template" icon for the "Not Applicable" on the flextable "Supporting Documents"
    When I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    And I click on "Responsibilities" subtab
    When I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    When I fill in the "Automation PM" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    When I click on the "Edit" icon for the "Fiscal Approver" on the flextable "Approvers"
    And I fill in the "Automation FO" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    When I click on the "Edit" icon for the "Executive Approver" on the flextable "Approvers"
    And I fill in the "Automation EXE" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    And I click on "Attachments" subtab
    When I click on "Add" button on " Attachments" flextable
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Funding Opportunity Announcement"
    When I click on "Submit For Approval" button
    When I re-login to "As a Grantor" app as "PM" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I click on "Publish" button
    Then I see that "Announcement" is in "Published" status

	Examples:
	| User | Quick Search Text |
	| EXE | Automation Announcement |
	
	
	
  @announcementDirectedHappyPath
  Scenario Outline: End to End of an Announcement
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Announcements" tab
	And I click "Directed" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
	When I click on "New" button on "Draft Announcements" phase flextable
	When I enter "Creation" values from "Announcement_Field_Values.xlsx" in the modal for "Announcement Creation"
	When I click on "Save and Close Modal" button in the "Announcement" modal
	When I enter "Edition" values from "Announcement_Field_Values.xlsx"
	When I click on "Save" button
	And I click on "Overview" subtab
    When I click on "Associate" button on "Contacts" flextable
    When I click "Add" after selection of "Automation EXE" in the frame "AnnouncementContactsiframeContentId"
    And I close Modal "AnnouncementContactsmodalDivCloseIcon"
    And I click on "Overview" subtab
    When I click on "Add Organizations" button on "Invited Applicants" flextable
    When I click "Add" after selection of "RG-000010" in the frame "FormulaGrantsAwardOrganizationsiframeContentId"
    And I close Modal "FormulaGrantsAwardOrganizationsiframeContentIdButton"
    And I click on "Financials" subtab
    When I click on "Associate" button on "Funding Accounts" flextable
    When I click "Add" after selection of "FA--21" in the frame "AnnouncementFundingAccountGrantoriframeContentId"
    And I close Modal "AnnouncementFundingAccountGrantoriframeContentIdButton"
    When I click on the "Edit" icon for the "FA--21" on the flextable "Funding Accounts"
    And I fill in the Funding Account fields on "Funding Accounts"
    And I click on "Financials" subtab
    When I click on "Add Budget Period" button on "Budget Period Details" flextable
    When I click on the "Edit" icon for the "BP01" on the flextable "Budget Period Details"
    When I enter "BudgetPeriod" values from "Announcement_Field_Values.xlsx" in the modal for "Budget Period"
    When I click on "Save and Close" button in the "Budget Period" modal
    And I click on "Setup" subtab
    When I click on "Associate" button on "Focus Areas" flextable
    When I click "Add" after selection of "00006" in the frame "AnnouncementServiceArea1iframeContentId"
    And I close Modal "AnnouncementServiceArea1modalDivCloseIcon"
    And I click on "Setup" subtab
    When I click on "Associate" button on "Objectives" flextable
    When I click "Add" after selection of "SPO-0008" in the frame "AnnouncementGranteeStrategicGoalsObjectivesiframeContentId"
    And I close Modal "AnnouncementGranteeStrategicGoalsObjectivesmodalDivCloseIcon"
    And I click on "Setup" subtab
    When I click on "Add" button on "Supporting Documents" flextable
    And I fill in the attachment checklist fields
    When I click on the "Upload Template" icon for the "Not Applicable" on the flextable "Supporting Documents"
    When I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    And I click on "Responsibilities" subtab
    When I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    When I fill in the "Automation PM" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    When I click on the "Edit" icon for the "Fiscal Approver" on the flextable "Approvers"
    And I fill in the "Automation FO" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    When I click on the "Edit" icon for the "Executive Approver" on the flextable "Approvers"
    And I fill in the "Automation EXE" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    And I click on "Attachments" subtab
    When I click on "Add" button on " Attachments" flextable
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Funding Opportunity Announcement"
    When I click on "Submit For Approval" button
    When I re-login to "As a Grantor" app as "PM" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Directed" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    When I click on "Publish" button
    Then I see that "Announcement" is in "Published" status

	Examples:
	| User | Quick Search Text |
	| EXE | Automation Announcement Directed |
	
	
  @announcementFormulaHappyPath
  Scenario Outline: End to End of an Announcement
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Announcements" tab
	And I click "Formula" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
	When I click on "New" button on "Draft Announcements" phase flextable
	When I enter "Creation" values from "Announcement_Field_Values.xlsx" in the modal for "Announcement Creation"
	When I click on "Save and Close Modal" button in the "Announcement" modal
	When I enter "Edition" values from "Announcement_Field_Values.xlsx"
	When I click on "Save" button
	And I click on "Overview" subtab
    When I click on "Associate" button on "Contacts" flextable
    When I click "Add" after selection of "Automation EXE" in the frame "AnnouncementContactsiframeContentId"
    And I close Modal "AnnouncementContactsmodalDivCloseIcon"
    And I click on "Overview" subtab
    When I click on "Add Organizations" button on "Invited Applicants" flextable
    When I click "Add" after selection of "RG-000010" in the frame "FormulaGrantsAwardOrganizationsiframeContentId"
    And I close Modal "FormulaGrantsAwardOrganizationsiframeContentIdButton"
    When I click on the "Edit" icon for the "RG-000010" on the flextable "Invited Applicants"
    And I fill in the Inline fields on "Invited Applicants"
    And I click on "Financials" subtab
    When I click on "Associate" button on "Funding Accounts" flextable
    When I click "Add" after selection of "FA--21" in the frame "AnnouncementFundingAccountGrantoriframeContentId"
    And I close Modal "AnnouncementFundingAccountGrantoriframeContentIdButton"
    When I click on the "Edit" icon for the "FA--21" on the flextable "Funding Accounts"
    And I fill in the Funding Account fields on "Funding Accounts"
    And I click on "Financials" subtab
    When I click on "Add Budget Period" button on "Budget Period Details" flextable
    When I click on the "Edit" icon for the "BP01" on the flextable "Budget Period Details"
    When I enter "BudgetPeriod" values from "Announcement_Field_Values.xlsx" in the modal for "Budget Period"
    When I click on "Save and Close" button in the "Budget Period" modal
    And I click on "Setup" subtab
    When I click on "Associate" button on "Focus Areas" flextable
    When I click "Add" after selection of "00006" in the frame "AnnouncementServiceArea1iframeContentId"
    And I close Modal "AnnouncementServiceArea1modalDivCloseIcon"
    And I click on "Setup" subtab
    When I click on "Associate" button on "Objectives" flextable
    When I click "Add" after selection of "SPO-0008" in the frame "AnnouncementGranteeStrategicGoalsObjectivesiframeContentId"
    And I close Modal "AnnouncementGranteeStrategicGoalsObjectivesmodalDivCloseIcon"
    And I click on "Setup" subtab
    When I click on "Add" button on "Supporting Documents" flextable
    And I fill in the attachment checklist fields
    When I click on the "Upload Template" icon for the "Not Applicable" on the flextable "Supporting Documents"
    When I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    And I click on "Responsibilities" subtab
    When I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    When I fill in the "Automation PM" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    When I click on the "Edit" icon for the "Fiscal Approver" on the flextable "Approvers"
    And I fill in the "Automation FO" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    When I click on the "Edit" icon for the "Executive Approver" on the flextable "Approvers"
    And I fill in the "Automation EXE" in the frame "GrantorAnnouncementRolesandResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "GrantorAnnouncementRolesandResponsibilitiesmodalDivCloseIcon"
    And I click on "Attachments" subtab
    When I click on "Add" button on " Attachments" flextable
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Funding Opportunity Announcement"
    When I click on "Submit For Approval" button
    When I re-login to "As a Grantor" app as "PM" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" User
	When I navigate to "Announcements" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "<User>" User
	When I navigate to "Announcements" tab
	And I click "Formula" inside side bar "Announcements"
	When I toggle to "Draft Announcements"
    When I perform quick search "<Quick Search Text>" on table "ActiveFundingOpportunitiesCompitive"
    And I click on the "View" icon for the "<Quick Search Text>" 
    When I click on "Publish" button
    Then I see that "Announcement" is in "Published" status

	Examples:
	| User | Quick Search Text |
	| EXE | Automation Announcement Directed |