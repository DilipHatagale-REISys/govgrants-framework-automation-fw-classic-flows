@planning
Feature: Validate all scenarios in the Planning tab

  @34730 @programListView @program
  Scenario Outline: Verifying if the EXE,PM,PO has access to Internal Programs list view
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I toggle to "<Program flextable Header>"
    Then I see that the status is "<Program Status>"
    
    Examples:
    | User | Program flextable Header | Program Status |
    | EXE | Draft Internal Programs | Created |
   
  
  @34503 @programCreation @program
  Scenario Outline: Verifying if the EXE, PM, PO has create access to Internal Program
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I click on "New" button on "Draft Internal Programs" phase flextable
    When I enter "RequiredForSave" values from "Program_Field_Values.xlsx"
    When I click on "Save and Continue" button
    When I click on "Save" button
    Then I see that "Internal Program" is in "Created" status
    
    Examples:
    | User |
    | EXE |
    
  @34731 @programEdition @program
  Scenario Outline: Verifying if the EXE, PM, PO has create access to Internal Program
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "Edit" icon for the "<Quick Search Text>" 
    And I click on "Overview" subtab
    When I enter "RequiredForSubmit" values from "Program_Field_Values.xlsx"
    And I click on "Save" button
    Then I see that "Abbreviation" field is modified to "AuPr"
    
    Examples:
    | User | Quick Search Text |
    | EXE | Automation Program |
    
    
  @34732 @programContactsAssociation @program
  Scenario Outline: Verifying if the EXE, PM, PO can associate contact with Internal Program
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Overview" subtab
    When I click on "Associate" button on "Contacts" flextable
    When I click "Add" after selection of "<Contact>" in the frame "ProgramContactsiframeContentId"
    And I close Modal "ProgramContactsiframeContentIdButton"
    Then I see that "<Contact>" has been added in "Contacts" flextable
    
    Examples:
    | User | Quick Search Text | Contact |
    | EXE | Automation Program | Automation EXE |
    
    
  @34740 @ProgramApproverSelection @program
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Responsibilities" subtab
    When I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    And I fill in the "<Approver Name>" in the frame "ProgramRolesAndResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "ProgramRolesAndResponsibilitiesmodalDivCloseIcon"
    When I click on the "Edit" icon for the "Executive Approver" on the flextable "Approvers"
    And I fill in the "<Approver Name>" in the frame "ProgramRolesAndResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "ProgramRolesAndResponsibilitiesmodalDivCloseIcon"
    Then I see that "<Approver Name>" has been added in "Approvers" flextable
	
	Examples:
	| User | Quick Search Text | Approver Name |
	| EXE | Automation Program | Automation PM |
	
	
  @34616 @programFocusAreaAssociation @program
  Scenario Outline: Validate the association of Focus Area for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    When I click "Associate" after selection of "<EGMS Id>" in the frame "GrantorServiceAreasProgramiframeContentId"
    And I close Modal "GrantorServiceAreasProgrammodalDivCloseIcon"
    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text | Flextable Name | EGMS Id |
	| EXE | Automation Program | Focus Areas | 00005 |
	
	
  @34737 @programObjectiveAssociation @program
  Scenario Outline: Validate the Association of Objective to the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    When I click "Add" after selection of "<EGMS Id>" in the frame "RelatedProgramGoalsandObjectivesiframeContentId"
    And I close Modal "RelatedProgramGoalsandObjectivesmodalDivCloseIcon"
    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text | Flextable Name | EGMS Id |
	| EXE | Automation Program | Objectives | SPO-0006 |
	
	
  @34738 @programKPIAssociation @program
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    When I click "Add" after selection of "<EGMS Id>" in the frame "ProgramKeyOutcomesiframeContentId"
    And I close Modal "ProgramKeyOutcomesmodalDivCloseIcon"
    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text |  Flextable Name | EGMS Id |
	| EXE | Automation Program | Key Performance Indicators (KPIs) | KPI-0005 |
	
  @34745 @programAttachmentChecklist @program
  Scenario Outline: Validate the attachment checklist for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Add" button on "<Flextable Name>" flextable
    And I fill in the attachment checklist fields
    When I click on the "Upload Template" icon for the "Not Applicable" on the flextable "<Flextable Name>"
    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    Then I see that "Active" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text |  Flextable Name |
	| EXE | Automation Program | Supporting Documents Checklist |
	
  @34746 @programAddAttachment @program
  Scenario Outline: Validate the attachment for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Attachments" subtab
    When I click on "Add" button on " Attachments" flextable
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Program Artifacts"
    Then I see that "Program Artifacts" has been added in "Attachments" flextable
	
	Examples:
	| User | Quick Search Text |
	| EXE | Automation Program |
	
  @34750 @submittingProgramForApproval @program
  Scenario Outline: Validate the submission of Program for Approval
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    When I click on "Submit For Approval" button
    Then I see that "Internal Program" is in "Submitted for Approval" status
	
	Examples:
	| User | Quick Search Text |
	| EXE | Automation Program |
	
  @34752 @34754 @programApproval @program
  Scenario Outline: Validate the approval of Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Pending Tasks" inside side bar "MyTasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "<Executive Approver>" User
	When I navigate to "Planning" tab
	And I click "Pending Tasks" inside side bar "MyTasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    Then I see that "Internal Program" is in "Approved" status
	
	Examples:
	| User | Quick Search Text | Executive Approver |
	| FO | Automation Program | PM |
	
  @34756 @ProgramActivation @program
  Scenario Outline: Validate the activation of Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    When I click on "Activate" button
    Then I see that "Internal Program" is in "Active" status
	
	Examples:
	| User | Quick Search Text |
	| EXE | Automation Program |
	
  @programHappyPath
  Scenario Outline: End to End of a Program
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I toggle to "Draft Internal Programs"
    When I click on "New" button on "Draft Internal Programs" phase flextable
    When I enter "RequiredForSave" values from "Program_Field_Values.xlsx"
    When I click on "Save and Continue" button
    When I enter "RequiredForSubmit" values from "Program_Field_Values.xlsx"
    When I click on "Save" button
    And I click on "Overview" subtab
    When I click on "Associate" button on "Contacts" flextable
    When I click "Add" after selection of "<Contact>" in the frame "ProgramContactsiframeContentId"
    And I close Modal "ProgramContactsiframeContentIdButton"
    And I click on "Responsibilities" subtab
    When I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    And I fill in the "<Approver Name>" in the frame "ProgramRolesAndResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "ProgramRolesAndResponsibilitiesmodalDivCloseIcon"
    When I click on the "Edit" icon for the "Executive Approver" on the flextable "Approvers"
    And I fill in the "<Approver Name>" in the frame "ProgramRolesAndResponsibilitiesiframeContentId" for the Approver details
    And I close Modal "ProgramRolesAndResponsibilitiesmodalDivCloseIcon"
    And I click on "Setup" subtab
    When I click on "Associate" button on "Focus Areas" flextable
    When I click "Associate" after selection of "<EGMS Id>" in the frame "GrantorServiceAreasProgramiframeContentId"
    And I close Modal "GrantorServiceAreasProgrammodalDivCloseIcon"
	And I click on "Setup" subtab
	When I click on "Associate" button on "Objectives" flextable
    When I click "Associate" after selection of "<EGMS Id>" in the frame "GrantorServiceAreasProgramiframeContentId"
    And I close Modal "GrantorServiceAreasProgrammodalDivCloseIcon"
    And I click on "Setup" subtab
    When I click on "Add" button on "Supporting Documents Checklist" flextable
    And I fill in the attachment checklist fields
    When I click on the "Upload Template" icon for the "Not Applicable" on the flextable "Supporting Documents Checklist"
    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    And I click on "Attachments" subtab
    When I click on "Add" button on " Attachments" flextable
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Program Artifacts"
    When I click on "Submit For Approval" button
    When I re-login to "As a Grantor" app as "<Program Approver>" User
	When I navigate to "Planning" tab
	And I click "Pending Tasks" inside side bar "MyTasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "<Executive Approver>" User
	When I navigate to "Planning" tab
	And I click "Pending Tasks" inside side bar "MyTasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    When I click on "Activate" button
    Then I see that "Internal Program" is in "Active" status
  
	Examples:
	| User | Name | Program Approver | Executive Approver | Quick Search Text |
	| EXE | Automation PM | FO | PM |  Automation Program |

	
	