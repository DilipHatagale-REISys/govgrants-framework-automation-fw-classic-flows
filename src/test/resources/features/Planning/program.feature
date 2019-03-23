@program
Feature: Validate all scenarios for program

	Background: Create Program
	Given I delete the record "Execution Internal Program for Automation" from the object "Program"
	And I create a planning record as user "EXE" from sheet "Creation" in excel "Program_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 | Step 3 				    |
	| Navigation | As a Grantor		 | Planning  	 	 |	Programs				|
	| FlexTable  | Internal Programs | Programs 	 	 | Draft Internal Programs  |
	| Creation   | New				 | Save and Continue | Save						|
	| ID		 | EGMS ID			 |					 |							|
	
  	@34730 @programListView @all
  	Scenario Outline: Verifying if the EXE,PM,PO has access to Internal Programs list view
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "<Program flextable Header>"
    Then I see that "Execution Internal Program for Automation" has been added in flextable with Id "Programs"
    Examples:
    | Program flextable Header | Program Status |
    | Draft Internal Programs  | Created  	    |
    
  	@34503 @programCreation @all
  	Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
  	Then I see status in Progress-bar is "Created" and is "green"
    
  	@34731 @programEdition @all
  	Scenario Outline: Verifying if the EXE, PM, PO has create access to Internal Program
    When I click on "Edit" in the page details
    And I enter "RequiredForSubmit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "program::contactsTableId"
    When I click "Add" after selection of "Automation EXE" in the table "program::associateContactsTableId"
    And I close Modal
    Then I see that "<Contact>" has been added in flextable with Id "program::contactsTableId"
    Examples:
    | Contact		  |
    | Automation EXE  |

  @34740 @programApproverSelection @all
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "program::approverTableId"
    When I fill in the "<Program Approver Name>" for the Approver details
    And I switch to Parent frame
    When I click on "Edit" icon for "Executive Approver" inside flex table with id "program::approverTableId"
    And I fill in the "<Executive Approver Name>" for the Approver details
    When I switch to Parent frame
    Then I see that "<Program Approver Name>" has been added in flextable with Id "program::approverTableId"
    Examples:
      | Program Approver Name | Executive Approver Name |
      | Automation PM         | Automation EXE          |

  @34616 @programFocusAreaAssociation @all
  Scenario Outline: Validate the association of Focus Area for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "program::focusAreaTableId"
    When I click "Add" after selection of "<EGMS Id>" in the table "program::associateFocusAreaTableId"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "program::focusAreaTableId"
	Examples:
	| EGMS Id |
	| 02492   |

  @34737 @programObjectiveAssociation @all
  Scenario Outline: Validate the Association of Objective to the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "program::objectivesTableId"
    When I click "Add" after selection of "<EGMS Id>" in the table "program::associateObjectivesTableId"
    Then I see that "<EGMS Id>" has been added in flextable with Id "program::objectivesTableId"
    Examples:
      | EGMS Id  |
      | SPO-0130 |

  @34738 @programKPIAssociation @all
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "program::kpiTableId"
    When I click "Add" after selection of "<EGMS Id>" in the table "program::associatekpiTableId"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "program::kpiTableId"
    Examples:
      | EGMS Id  |
      | KPI-0652|

  @34745 @programAttachmentChecklist @all
  Scenario: Validate the attachment checklist for the Internal Program
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "flexGridProgramChecklists" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "program::checklistTableId"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal
    Then I see that "Active" has been added in flextable with Id "program::checklistTableId"

   @34750 @submittingProgramForApproval @all
   Scenario: Validate the submission of Program for Approval
    Given I complete the fields from the sheet "Edition" in excel "Program_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "3" records "Automation EXE,03065,SPO-0130"
      | Actions     | Step 1   | Step 2    | Step 3                             | Step 4 | Step 5                   |
      | Associate 1 | Overview | Associate | ProgramContacts                    | Add    | AssociateProgramContacts |
      | Associate 2 | Setup    | Associate | flexGridGrantorServiceAreasProgram | Add    | SelectProgramServiceArea |
      | Associate 3 | Setup    | Associate | RelatedProgramGoalsandObjectives   | Add    | SelectGoals              |
    Given I select "2" approvers "Automation PM,Automation EXE"
      | Actions    | Step 1                          | Step 2 | Step 3             |
      | Subtab     | Responsibilities                |        |                    |
      | Approver 1 | ProgramRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | ProgramRolesAndResponsibilities | Edit   | Executive Approver |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "program::checklistTableId" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "program::checklistTableId"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2            | Step 3             |
      | Attachment Navigation | Attachments | Add               | a150b000003epY5AAI |
      | Attachment Details    | Attachment  | Program Artifacts |                    |
    When I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

    @34754 @programApproval @all
    Scenario Outline: Validate the approval of Internal Program
    Given I complete the fields from the sheet "Edition" in excel "Program_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "3" records "Automation EXE,03065,SPO-0130"
      | Actions     | Step 1   | Step 2    | Step 3                             | Step 4 | Step 5                   |
      | Associate 1 | Overview | Associate | ProgramContacts                    | Add    | AssociateProgramContacts |
      | Associate 2 | Setup    | Associate | flexGridGrantorServiceAreasProgram | Add    | SelectProgramServiceArea |
      | Associate 3 | Setup    | Associate | RelatedProgramGoalsandObjectives   | Add    | SelectGoals              |
    Given I select "2" approvers "Automation PM,Automation EXE"
      | Actions    | Step 1                          | Step 2 | Step 3             |
      | Subtab     | Responsibilities                |        |                    |
      | Approver 1 | ProgramRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | ProgramRolesAndResponsibilities | Edit   | Executive Approver |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "program::checklistTableId" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "program::checklistTableId"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2            | Step 3             |
      | Attachment Navigation | Attachments | Add               | a150b000003epY5AAI |
      | Attachment Details    | Attachment  | Program Artifacts |                    |
    And I click on "Submit For Approval" in the page details
    Given I re-login to "As a Grantor" app as "<Program Approver>" user
    When I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "MyTasks" subheader on left panel
    When I perform quick search for "<Program Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Program Name>" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "<Executive Approver>" user
    When I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "MyTasks" subheader on left panel
    When I perform quick search for "<Program Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Program Name>" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
	 Examples:
	| Program Approver | Program Name		  			                         | Executive Approver  |Type           |
	| PM               | Execution Internal Program for Automation               | EXE			  	   |Approve Program|
	
  @34756 @programActivation @programHappyPath @all
  Scenario Outline: Validate the activation of Internal Program
    Given I complete the fields from the sheet "Edition" in excel "Program_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "3" records "Automation EXE,Execution Focus Area for Automation,Permanent Objective Automation"
      | Actions     | Step 1   | Step 2    | Step 3                             | Step 4 | Step 5                   |
      | Associate 1 | Overview | Associate | ProgramContacts                    | Add    | AssociateProgramContacts |
      | Associate 2 | Setup    | Associate | flexGridGrantorServiceAreasProgram | Add    | SelectProgramServiceArea |
      | Associate 3 | Setup    | Associate | RelatedProgramGoalsandObjectives   | Add    | SelectGoals              |
    Given I select "2" approvers "Automation PM,Automation EXE"
      | Actions    | Step 1                          | Step 2 | Step 3             |
      | Subtab     | Responsibilities                |        |                    |
      | Approver 1 | ProgramRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | ProgramRolesAndResponsibilities | Edit   | Executive Approver |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "program::checklistTableId" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "program::checklistTableId"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2            | Step 3             |
      | Attachment Navigation | Attachments | Add               | a150b000003epY5AAI |
      | Attachment Details    | Attach1ment | Program Artifacts |                    |
    And I click on "Submit For Approval" in the page details
    Given "2" Approvers "PM,EXE" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Planning |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    And I re-login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Draft Internal Programs"
    And I perform quick search for "Record Id" in "Programs" panel
    When I click on "View" icon for "Approved" inside table
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
	Examples:
     | User | Program Name                                   |Type           |
     | EXE  | Execution Internal Program for Automation      |Approve Program|    

     