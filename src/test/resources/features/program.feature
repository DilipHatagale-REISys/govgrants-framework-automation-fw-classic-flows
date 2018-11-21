@planning
Feature: Validate all scenarios in the Planning tab

	Background: Create Program
	    Given I create a Program as user "EXE" from sheet "RequiredForSave" in excel "Program_Field_Values.xlsx"

  	@34730 @programListView @program
  	Scenario Outline: Verifying if the EXE,PM,PO has access to Internal Programs list view
	    When I navigate to "Planning" tab
	    And I click "Internal Programs" inside side bar "Programs"
	    When I toggle to "<Program flextable Header>"
	    Then I see that the status is "<Program Status>"
	    
    Examples:
    | Program flextable Header | Program Status |
    | Draft Internal Programs  | Created  	    |
  
  	@34503 @programCreation @program
  	Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
    	Then I see that "Created" status is in "green" on progress bar
    
  	@34731 @programEdition @program
  	Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
	    When I click on "Edit" button
	    And I enter "RequiredForSubmit" values from "Program_Field_Values.xlsx"
	    When I click on "Save" button
	    Then I see that "Created" status is in "green" on progress bar
    
  	@34732 @programContactsAssociation @program
  	Scenario Outline: Verifying if the EXE, PM, PO can associate contact with Internal Program
	    When I click on "Overview" subtab
	    And I click on "Associate" button on "Contacts" flextable to switch to frame "ProgramContactsiframeContentId"
	    When I click "Add" after selection of "<Contact>" in the table "AssociateProgramContacts"
	    And I close Modal "ProgramContactsmodalDivCloseIcon"
	    Then I see that "<Contact>" has been added in "Contacts" flextable
    
    Examples:
    | Contact		  |
    | Automation EXE  |
    
  	@34740 @programApproverSelection @program
  	Scenario Outline: Validate the assignment of Approvers for the Internal Program 
	    When I click on "Responsibilities" subtab
	    And I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers" to switch to frame "ProgramRolesAndResponsibilitiesiframeContentId"
	    When I fill in the "<Program Approver Name>" in the frame "ProgramRolesAndResponsibilitiesiframeContentId" for the Approver details
	    And I switch to Parent frame
	    When I click on the "Edit" icon for the "Executive Approver" on the flextable "Approvers" to switch to frame "ProgramRolesAndResponsibilitiesiframeContentId"
	    And I fill in the "<Executive Approver Name>" in the frame "ProgramRolesAndResponsibilitiesiframeContentId" for the Approver details
	   	And I switch to Parent frame
	    Then I see that "<Program Approver Name>" has been added in "Approvers" flextable
	
	Examples:
	| Program Approver Name | Executive Approver Name |
	| Automation PM         | Automation EXE          |
	
  	@34616 @programFocusAreaAssociation @program
  	Scenario Outline: Validate the association of Focus Area for the Internal Program
	    When I click on "Setup" subtab
	    And I click on "Associate" button on "<Flextable Name>" flextable to switch to frame "GrantorServiceAreasProgramiframeContentId"
	    When I click "Associate" after selection of "<EGMS Id>" in the table "popupflextable"
	    And I close Modal "GrantorServiceAreasProgrammodalDivCloseIcon"
	    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| Flextable Name | EGMS Id |
	| Focus Areas    | 00005   |
	
  	@34737 @programObjectiveAssociation @program
  	Scenario Outline: Validate the Association of Objective to the Internal Program
	    When I click on "Setup" subtab
	    And I click on "Associate" button on "<Flextable Name>" flextable to switch to frame "RelatedProgramGoalsandObjectivesiframeContentId"
	    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
	    And I close Modal "RelatedProgramGoalsandObjectivesmodalDivCloseIcon"
	    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| Flextable Name | EGMS Id  |
	| Objectives     | SPO-0006 |
	
  	@34738 @programKPIAssociation @program
  	Scenario Outline: Validate the assignment of Approvers for the Internal Program
	    When I click on "Setup" subtab
	    And I click on "Associate" button on "<Flextable Name>" flextable to switch to frame "ProgramKeyOutcomesiframeContentId"
	    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
	    And I close Modal "ProgramKeyOutcomesmodalDivCloseIcon"
	    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	|  Flextable Name 				    | EGMS Id  |
	| Key Performance Indicators (KPIs) | KPI-0005 |
	
  	@34745 @programAttachmentChecklist @program
  	Scenario Outline: Validate the attachment checklist for the Internal Program
	    When I click on "Setup" subtab
	    And I click on "Add" button on "<Flextable Name>" flextable
	    When I fill the fields in the table "flexGridHeaderButtonsProgramChecklists":
	    | tableColumnNumber | inputype | inputValue                  |
	    | 1                 | text     | Automation test description |
	    | 2                 | dropdown | Mandatory                   |
	    | 3                 | dropdown | Application                 |
	    And I click on "Save" button on "<Flextable Name>" flextable  
	    When I click on the "Upload Template" icon for the "Not Applicable" on the flextable "<Flextable Name>" to switch to frame "ProgramChecklistsiframeContentId"
	    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
	    When I close Modal "ProgramChecklistsiframeContentIdButton"
	    Then I see that "Active" has been added in "<Flextable Name>" flextable
	
	Examples:
	|  Flextable Name				 |
	| Supporting Documents Checklist |
	
  	@34746 @programAddAttachment @program
  	Scenario: Validate the attachment for the Internal Program
	    When I click on "Attachments" subtab
	    And I click on "Add" button on " Attachments" flextable to switch to frame
	    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Program Artifacts"
	    And I close Modal "Attachment"
	    Then I see that "Program Artifacts" has been added in "Attachments" flextable

  	@34750 @submittingProgramForApproval @program
  	Scenario: Validate the submission of Program for Approval
	    Given I complete the Program fields from the sheet "RequiredForSubmit" in excel "Program_Field_Values.xlsx"
	    And I associate Contact "Automation EXE", Focus Area "00005", Objective "SPO-0006" to the program
	    Given I select the Program Approver "Automation PM", Executive Approver "Automation EXE" for the program
	    And I add an attachment checklist "Automation test description","Mandatory","Application" to upload the file "Program_Field_Values.xlsx" to the program
	    Given I add an attachment "InternalOrganization_Field_Values.xlsx" to a program
	    When I click on "Submit For Approval" button
	    Then I see that "Submitted for Approval" status is in "green" on progress bar
	
  	@34752 @34754 @programApproval @program
  	Scenario Outline: Validate the approval of Internal Program
	  	Given I complete the Program fields from the sheet "RequiredForSubmit" in excel "Program_Field_Values.xlsx"
	    And I associate Contact "Automation EXE", Focus Area "00005", Objective "SPO-0006" to the program
	    Given I select the Program Approver "Automation PM", Executive Approver "Automation EXE" for the program
	    And I add an attachment checklist "Automation test description","Mandatory","Application" to upload the file "Program_Field_Values.xlsx" to the program
	    Given I add an attachment "InternalOrganization_Field_Values.xlsx" to a program
	    And I click on "Submit For Approval" button
		Given I re-login to "As a Grantor" app as "<Program Approver>" User
		When I navigate to "Planning" tab
		And I click "Pending Tasks" inside side bar "MyTasks"
	    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
	    And I click on the "Start" icon for the "<Quick Search Text>" 
	    When I click on "Approve" on the approval decision box
	    And I re-login to "As a Grantor" app as "<Executive Approver>" User
		When I navigate to "Planning" tab
		And I click "Pending Tasks" inside side bar "MyTasks"
	    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
	    And I click on the "Start" icon for the "<Quick Search Text>" 
	    When I click on "Approve" on the approval decision box
	    Then I see that "Approved" status is in "green" on progress bar
	
	Examples:
	| Program Approver | Quick Search Text  			  | Executive Approver |
	| PM               | Automation Program to be deleted | EXE			  	   |
	
  	@34756 @ProgramActivation @programHappyPath @program
  	Scenario Outline: Validate the activation of Internal Program
	  	Given I complete the Program fields from the sheet "RequiredForSubmit" in excel "Program_Field_Values.xlsx"
	    And I associate Contact "Automation EXE", Focus Area "00005", Objective "SPO-0006" to the program
	    Given I select the Program Approver "Automation PM", Executive Approver "Automation EXE" for the program
	    And I add an attachment checklist "Automation test description","Mandatory","Application" to upload the file "Program_Field_Values.xlsx" to the program
	    Given I add an attachment "InternalOrganization_Field_Values.xlsx" to a program
	    And I click on "Submit For Approval" button
	    Given Approvers "PM", "EXE" approve the Program "<Quick Search Text>"
		And I re-login to "As a Grantor" app as "<User>" User
		When I navigate to "Planning" tab
		And I click "Internal Programs" inside side bar "Programs"
		When I toggle to "Draft Internal Programs"
	    And I perform quick search "<Quick Search Text>" on table "Programs"
	    When I click on the "View" icon for the "<Quick Search Text>" 
	    And I click on "Activate" button
	    Then I see that "Active" status is in "green" on progress bar
	
	Examples:
	| User | Quick Search Text 				  |
	| EXE  | Automation Program to be deleted |
	
  	