@program @regression
Feature: Validate all scenarios for program

  Background: Create Program
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    And I create a planning record as user "EXE" from sheet "Creation" in excel "Program_Field_Values.xlsx"
      | Actions    | Step 1            | Step 2            | Step 3                  |
      | Navigation | As a Grantor      | Planning          | Programs                |
      | FlexTable  | Internal Programs | Programs          | Draft Internal Programs |
      | Creation   | New               | Save and Continue | Save                    |
      | ID         | EGMS ID           |                   |                         |

  @34730 @programListView
  Scenario Outline: Verifying if the EXE,PM,PO has access to Internal Programs list view
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "<Program flextable Header>"
    And I perform quick search for "<Program>"
    Then I see that "<Program>" has been added in flextable with Id "Programs"
    Examples:
      | Program flextable Header | Program                               |
      | Draft Internal Programs  | Automation Execution Internal Program |

  @34503 @programCreation  @smoke
  Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
    Then I see status in Progress-bar is "Created" and is "green"

  @34731 @programEdition
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
      | Contact        |
      | Automation EXE |

  @34740 @programApproverSelection
  Scenario: Validate the assignment of Approvers for the Internal Program
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "program::approverTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    Then I see that "Program Approver" has been added in flextable with Id "program::approverTableId"

  @34616 @programFocusAreaAssociation @smoke
  Scenario Outline: Validate the association of Focus Area for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "program::focusAreaTableId"
    When I click "Add" after selection of "<EGMS Id>" in the table "program::associateFocusAreaTableId"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "program::focusAreaTableId"
    Examples:
      | EGMS Id                         |
      | Automation Permanent Focus Area |

  @34737 @programObjectiveAssociation @smoke
  Scenario Outline: Validate the Association of Objective to the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "program::objectivesTableId"
    When I click "Add" after selection of "<Objective>" in the table "program::associateObjectivesTableId"
    Then I see that "<Objective>" has been added in flextable with Id "program::objectivesTableId"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @34738 @programKPIAssociation  @smoke
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "program::kpiTableId"
    When I click "Add" after selection of "<EGMS Id>" in the table "program::associatekpiTableId"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "program::kpiTableId"
    Examples:
      | EGMS Id                                 |
      | Automation Permanent KPI for Regression |

  @34745 @programAttachmentChecklist
  Scenario: Validate the attachment checklist for the Internal Program
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "flexGridProgramChecklists" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "program::checklistTableId"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal
    Then I see that "Active" has been added in flextable with Id "program::checklistTableId"

  @34750 @submittingProgramForApproval
  Scenario: Validate the submission of Program for Approval
    Given I complete the fields from the sheet "Edition" in excel "Program_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "4" records "Automation EXE,Automation Permanent Focus Area,Automation Permanent Objective,Automation Permanent KPI for Regression"
      | Actions     | Step 1   | Step 2    | Step 3                             | Step 4 | Step 5                   |
      | Associate 1 | Overview | Associate | ProgramContacts                    | Add    | AssociateProgramContacts |
      | Associate 2 | Setup    | Associate | flexGridGrantorServiceAreasProgram | Add    | SelectProgramServiceArea |
      | Associate 3 | Setup    | Associate | RelatedProgramGoalsandObjectives   | Add    | SelectGoals              |
      | Associate 4 | Setup    | Associate | ProgramKeyOutcomes                 | Add    | SelectProgramKPIs        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "program::approverTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
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
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  @34754 @programApproval @smoke
  Scenario: Validate the approval of Internal Program
    Given I complete the fields from the sheet "Edition" in excel "Program_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "4" records "Automation EXE,Automation Permanent Focus Area,Automation Permanent Objective,Automation Permanent KPI for Regression"
      | Actions     | Step 1   | Step 2    | Step 3                             | Step 4 | Step 5                   |
      | Associate 1 | Overview | Associate | ProgramContacts                    | Add    | AssociateProgramContacts |
      | Associate 2 | Setup    | Associate | flexGridGrantorServiceAreasProgram | Add    | SelectProgramServiceArea |
      | Associate 3 | Setup    | Associate | RelatedProgramGoalsandObjectives   | Add    | SelectGoals              |
      | Associate 4 | Setup    | Associate | ProgramKeyOutcomes                 | Add    | SelectProgramKPIs        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "program::approverTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
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
    Then I see status in Progress-bar is "Approved" and is "green"

  @34756 @programActivation @programHappyPath  @smoke
  Scenario Outline: Validate the activation of Internal Program
    Given I complete the fields from the sheet "Edition" in excel "Program_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "4" records "Automation EXE,Automation Permanent Focus Area,Automation Permanent Objective,Automation Permanent KPI for Regression"
      | Actions     | Step 1   | Step 2    | Step 3                             | Step 4 | Step 5                   |
      | Associate 1 | Overview | Associate | ProgramContacts                    | Add    | AssociateProgramContacts |
      | Associate 2 | Setup    | Associate | flexGridGrantorServiceAreasProgram | Add    | SelectProgramServiceArea |
      | Associate 3 | Setup    | Associate | RelatedProgramGoalsandObjectives   | Add    | SelectGoals              |
      | Associate 4 | Setup    | Associate | ProgramKeyOutcomes                 | Add    | SelectProgramKPIs        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "program::approverTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
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
    And I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Draft Internal Programs"
    And I perform quick search for "Record Id" in "Programs" panel
    When I click on "View" icon for "Approved" inside table
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    Examples:
      | User |
      | EXE  | 

     