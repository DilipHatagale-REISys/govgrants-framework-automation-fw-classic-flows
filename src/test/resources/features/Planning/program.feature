@program @regression
Feature: Validate all scenarios for program

  Background: Create Program
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Draft Internal Programs"
    And I click on top right button "New" in flex table with id "Programs"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I click on "Save" in the page details

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

  @34503 @programCreation @smoke
  Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
    Then I see status in Progress-bar is "Created" and is "green"

  @34731 @programEdition
  Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
    When I click on "Edit" in the page details
    And I enter "RequiredForSubmit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

    @contactAssociation
    Scenario Outline: Associate contact on program
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contacts_Table_Id---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associate_Contacts_Table_Id---"
    And I close Modal
    Then I see that "<Contact>" has been added in flextable with Id "---program:-:contacts_Table_Id---"
    Examples:
      | Contact        |
      | Automation EXE |

  @34740 @programApproverSelection
  Scenario: Validate the assignment of Approvers for the Internal Program
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approver_Table_Id---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    Then I see that "Program Approver" has been added in flextable with Id "---program:-:approver_Table_Id---"

  @34616 @programFocusAreaAssociation @smoke
  Scenario Outline: Validate the association of Focus Area for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusArea_Table_Id---"
    When I click "Add" after selection of "<Title>" in the table "---program:-:associate_FocusArea_Table_Id---"
    And I close Modal
    Then I see that "<Title>" has been added in flextable with Id "---program:-:focusArea_Table_Id---"
    Examples:
      | Title                         |
      | Automation Permanent Focus Area |

  @34737 @programObjectiveAssociation @smoke
  Scenario Outline: Validate the Association of Objective to the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectives_Table_Id---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associate_Objectives_Table_Id---"
    Then I see that "<Objective>" has been added in flextable with Id "---program:-:objectives_Table_Id---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @34738 @programKPIAssociation @smoke
  Scenario Outline: Validate the aasociation of KPI
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:kpi_Table_Id---"
    When I click "Add" after selection of "<EGMS Id>" in the table "---program:-:associate_kpi_Table_Id---"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "---program:-:kpi_Table_Id---"
    Examples:
      | EGMS Id                                 |
      | Automation Permanent KPI for Regression |

  @34745 @programAttachmentChecklist
  Scenario: Validate the attachment checklist for the Internal Program
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklist_Table_Id---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklist_Table_Id---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal
    Then I see that "Active" has been added in flextable with Id "---program:-:checklist_Table_Id---"

  @34750 @submittingProgramForApproval
  Scenario: Validate the submission of Program for Approval
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contacts_Table_Id---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associate_Contacts_Table_Id---"
    And I close Modal
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusArea_Table_Id---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associate_FocusArea_Table_Id---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associate_FocusArea_Table_Id---"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "---program:-:objectives_Table_Id---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associate_Objectives_Table_Id---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associate_Objectives_Table_Id---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpi_Table_Id---"
    And I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associate_kpi_Table_Id---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associate_kpi_Table_Id---"
    And I switch to Parent iframe
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approver_Table_Id---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklist_Table_Id---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklist_Table_Id---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Program Artifacts"
    And I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"

  @34754 @programApproval @smoke
  Scenario: Validate the approval of Internal Program
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "ProgramContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateProgramContacts"
    And I close Modal
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridGrantorServiceAreasProgram"
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "SelectProgramServiceArea"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "RelatedProgramGoalsandObjectives"
    When I click "Add" after selection of "Automation Permanent Objective" in the table "SelectGoals"
    And I click on top right button "Associate" in flex table with id "ProgramKeyOutcomes"
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "SelectProgramKPIs"
    And I switch to Parent iframe
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approver_Table_Id---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklist_Table_Id---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklist_Table_Id---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal
    And I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Program Artifacts"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"

  @34756 @programActivation @programHappyPath @smoke
  Scenario: Validate the activation of Internal Program
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "ProgramContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateProgramContacts"
    And I close Modal
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridGrantorServiceAreasProgram"
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "SelectProgramServiceArea"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "RelatedProgramGoalsandObjectives"
    When I click "Add" after selection of "Automation Permanent Objective" in the table "SelectGoals"
    And I click on top right button "Associate" in flex table with id "ProgramKeyOutcomes"
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "SelectProgramKPIs"
    And I switch to Parent iframe
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approver_Table_Id---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklist_Table_Id---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklist_Table_Id---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal
    And I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Program Artifacts"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I click on "Approve" on the approval decision box
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"