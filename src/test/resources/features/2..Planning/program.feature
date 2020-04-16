@program @regression @planning
Feature: Validate all scenarios for program

  Background: Create Program
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
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
    Then I see that "<Program>" has been added in flextable with Id "---program:-:programsTableId---"
    Examples:
      | Program flextable Header  | Program                               |
      | Internal Programs - Draft | Automation Execution Internal Program |

  @66389 @updateFieldsValidationCheck @jitendra
  Scenario: To verify that the user is able to modified created internal program settings and view the added setting by the creating a direct grant.
    Then I click on "Edit" in the page details
    And I enter "Edition1" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Focus Area Required?" as "No"
    Then I softly see field "KPI" as "No"
    Then I softly see field "Objectives Required?" as "No"

  @34503 @programCreation
  Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
    Then I see status in Progress-bar is "Created" and is "Green"

  @34731 @programEdition
  Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
    When I click on "Edit" in the page details
    And I enter "RequiredForSubmit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"

  @contactAssociation
  Scenario Outline: Associate contact on program
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    And I refresh the page
    Then I see that "<Contact>" has been added in flextable with Id "---program:-:contactsTableId---"
    Examples:
      | Contact        |
      | Automation EXE |

  @34740 @programApproverSelection
  Scenario: Validate the assignment of Approvers for the Internal Program
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Program Approver   | Automation PM  | Automation Test Description |
    Then I see that "Automation EXE" has been added in flextable with Id "---program:-:approverTableId---"

  @34616 @76118 @75992 @75821 @75830 @75831 @75836 @75832 @75840 @75841 @programFocusAreaAssociation
  Scenario Outline: Validate the association of Focus Area for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Add" after selection of "<Title>" in the table "---program:-:associateFocusAreaTableId---"
    Then I softly see that "<Title>" has been added in flextable with Id "---program:-:focusAreaTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---"
    And I perform quick search for "Completeness" in "---program:-:programReviewPanel---" panel
    Then I softly see value "Completeness" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer |
      | David FO |
    Then I softly see value "David FO" for title "Reviewer" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "david.fo@yopmail.com.invalid" for title "Email" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Department of Health" for title "Organization Name" inside table "---program:-:reviewStepTableId---"
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    Then I softly see value "Fiscal Review" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Program Review" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Compliance Review" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Fiscal Review     | 25              |
      | Program Review    | 25              |
      | Compliance Review | 50              |
    Then I softly see value "25.00%" for title "Form Weight (%)" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "25.00%" for title "Form Weight (%)" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "50.00%" for title "Form Weight (%)" inside table "---program:-:reviewStepTableId---"
    And I click on "Delete" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    When I enter the following values into flex table with id "---program:-:reviewFormTableId---" by clicking "New" :
      | Form Name         | Minimum Number of Reviews per Application | Required? |
      | Automation Review | 1                                         | Checked   |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer |
      | David FO |
    Then I softly see value "David FO" for title "Reviewer" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "david.fo@yopmail.com.invalid" for title "Email" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Department of Health" for title "Organization Name" inside table "---program:-:reviewStepTableId---"
    And I click on "Delete" icon for "David FO" inside flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    And I select "Download as PDF" from parallel lines dropdown of "Review Forms"
    And I download the file
    Then I softly see "Review Forms" on page "1" of "govgrants" pdf file
    Examples:
      | Title                           |
      | Automation Permanent Focus Area |

  @34737 @76116 @76117 @76113 @76115 @75894 @75888 @75891 @programObjectiveAssociation
  Scenario Outline: Validate the Association of Objective to the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    Then I softly see that "<Objective>" has been added in flextable with Id "---program:-:objectivesTableId---"
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Fiscal Review     | 25              |
      | Program Review    | 25              |
      | Compliance Review | 50              |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 4             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 4             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---"
    Then I softly see value "Schedule" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Environment" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Permits" for title "Section Header" inside table "---program:-:programReviewPanel---"
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 3             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Automation Header" inside flex table with id "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Schedule" inside flex table with id "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Environment" inside flex table with id "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Permits" inside flex table with id "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review - Compliance Review: At least one section must be added to this form. |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer |
      | David FO |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer |
      | Sarah PM |
    Then I softly see the following messages in the page details :
      | Saved successfully. |
    And I select "Download as PDF" from parallel lines dropdown of "Reviewers"
    And I download the file
    Then I softly see "Reviewers" on page "1" of "govgrants" pdf file
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @34738 @75991 @75993 @75895 @75896 @75909 @75912 @75913 @programKPIAssociation
  Scenario Outline: Validate the association of KPI
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "<EGMS Id>" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "<EGMS Id>" in the table "---program:-:associateKPITableId---"
    Then I softly see that "<EGMS Id>" has been added in flextable with Id "---program:-:kpiTableId---"
    And I expand nested table containing column value "Management Review"
    When I enter the following values into flex table with id "---program:-:reviewFormTableId---" by clicking "New" :
      | Form Name         | Minimum Number of Reviews per Application | Required? |
      | Automation Review | 1                                         | Checked   |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer |
      | David FO |
      | Sarah PM |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewStepTableId---"
    Then I softly see value "Strategic Alignment" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Return on Investment (ROI)" for title "Section Header" inside table "---program:-:programReviewPanel---"
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 3             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved successfully. |
    And I perform quick search for "Return on Investment (ROI)" in "---program:-:programReviewPanel---" panel
    Then I softly see value "Return on Investment (ROI)" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I click on advance filter "#advfProgramRelatedReviewPanelCategories" of table id "---announcement:-:businessFormlistTableId---"
    And I enter advance filter values inside id "advfProgramRelatedReviewPanelCategories"
      | Section Header | contains | Return on Investment (ROI) |
    Then I softly see value "Return on Investment (ROI)" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I enter advance filter values inside id "advfProgramRelatedReviewPanelCategories"
      | Section Header | contains | TestInvalidPanel |
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanel---"
    Examples:
      | EGMS Id                                 |
      | Automation Permanent KPI for Regression |

  @34745 @75997 @76112 @76119 @38242 @programAttachmentChecklist
  Scenario: Validate the attachment checklist for the Internal Program
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Template" modal by clicking the top right x button
    Then I softly see that "Active" has been added in flextable with Id "---program:-:checklistTableId---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---"
    Then I softly see value "Budget" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Match" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Program Income" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---"
    Then I softly see value "Capability" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Approach" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Impact" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---"
    And I perform quick search for "Permit" in "---program:-:programReviewPanel---" panel
    Then I softly see value "Permits" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Delete" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---"
    And I click on "Delete" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---"
    And I click on "Delete" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---"
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: At least one form is required for this review step.                                   |
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step, it is currently 0%. |

  @76114 @75990 @75996 @75994 @prescreenReviewPanel
  Scenario: To validate system generated validation message for Pre-screen review,when review panel categories has not associated with Pre-screen review form in setup tab in planning phase
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 3             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Eligibility" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Completeness" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Eligibility" inside flex table with id "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Completeness" inside flex table with id "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Automation Header" inside flex table with id "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - Pre-Screen Review - Pre-Screen: At least one section must be added to this form. |

  @75995 @managementreviewReviewPanel
  Scenario: To validate system generated validation message for management review,when review panel categories has not associated with management form in setup tab in planning phase
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewStepTableId---"
    And I click on "Delete" icon for "Return on Investment (ROI)" inside flex table with id "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Strategic Alignment" inside flex table with id "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - Management Review - Management Review: At least one section must be added to this form. |

  @34750 @submittingProgramForApproval
  Scenario: Validate the submission of Program for Approval
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    And I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Template" modal by clicking the top right x button
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
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I pause execution for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Template" modal by clicking the top right x button
    And I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Program Artifacts"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"

  @53689 @verifyRelatedLogsTableForFocusAreaForActiveProgram @mahadev
  Scenario Outline: Verify related log table for focus area for Active Program
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Area - Active"
    And I perform quick search for "<Focus Area>" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "<Focus Area>" inside flex table with id "---focusarea:-:focusAreaTableId---"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "<Program Name>" in "---focusarea:-:relatedProgramsTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---focusarea:-:relatedProgramsTableId---"
    Examples:
      | Focus Area                      | Program Name                          |
      | Automation Permanent Focus Area | Automation Execution Internal Program |

  @53690 @Verify_Relatedlogs_table_for_focusArea_for_Draft_Program @mahadev @smoke
  Scenario Outline: Verify related log table for focus area for draft Program
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Area - Active"
    And I perform quick search for "<Focus Area>" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "<Focus Area>" inside flex table with id "---focusarea:-:focusAreaTableId---"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "<Program Name>" in "---focusarea:-:relatedProgramsTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---focusarea:-:relatedProgramsTableId---"
    Examples:
      | Focus Area                      | Program Name                          |
      | Automation Permanent Focus Area | Automation Execution Internal Program |

  @53692 @Verify_Relatedlogs_table_for_focusArea_for_Active_Program_ViewAction @mahadev
  Scenario Outline: Verify related log table for focus area for Active Program view Action
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Area - Active"
    And I perform quick search for "<Focus Area>" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "<Focus Area>" inside flex table with id "---focusarea:-:focusAreaTableId---"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "<Program Name>" in "---focusarea:-:relatedProgramsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---focusarea:-:relatedProgramsTableId---"
    Then I see status in Progress-bar is "Active" and is "Green"
    Examples:
      | Focus Area                      | Program Name                          |
      | Automation Permanent Focus Area | Automation Execution Internal Program |

  @72341 @programActivation @productBusinessFlowSanity
  Scenario: Validate the activation of Internal Program and the status changes to Active
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Template" modal by clicking the top right x button
    And I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Program Artifacts"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @76333 @76334 @76332 @SMEProgramReviewFormAndFiscalReviewForm @keerti
  Scenario Outline: To verify Filter functionality for review panel categories section in program review form in SME review step of setup tab in planning
    /To validate system is getting displayed error message for program review form, while adding invalid values into the filter for review panel categories section on setup tab of planning
    /To validate system is getting displayed error message for fiscal review form, while adding invalid values into the filter for review panel categories section on setup tab of planning
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    #And I close "Review Form" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 15                 |
      | Approach       | 60                 |
      | Impact         | 25                 |
    And I click on advance filter "#advfProgramRelatedReviewPanelCategories" of table id "---program:-:programReviewPanel---"
    And I enter advance filter values inside id "advfProgramRelatedReviewPanelCategories"
      | Section Order | equals to | 3 |
    Then I softly see value "3" for title "Section Order" inside table "---program:-:programReviewPanel---"
    And I enter advance filter values inside id "advfProgramRelatedReviewPanelCategories"
      | Section Order | equals to | 5 |
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 75                 |
      | Match          | 75                 |
      | Program Income | 10                 |
    And I click on advance filter "#advfProgramRelatedReviewPanelCategories" of table id "ProgramRelatedReviewPanelCategoriesFlexToggle"
    And I enter advance filter values inside id "advfProgramRelatedReviewPanelCategories"
      | Section Order | equals to | 5 |
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanel---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76336 @76337 @WithoutPrescreenReviewFormWithoutManagementReviewForm @keerti
  Scenario: To validate system generated error message, When Prescreen review step has not associated with any review form in review form section in setup tab of planning
    / To validate system generated error message, When management review step has not associated with any review form in review form section in setup tab of planning
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Delete" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---"
    Then I softly see "No Records Found" inside flex table with id "ProgramReviewStepTemplatesFlexToggle"
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: At least one form is required for this review step |
    And I expand nested table containing column value "Management Review"
    And I click on "Delete" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    Then I softly see "No Records Found" inside flex table with id "ProgramReviewStepTemplatesFlexToggle"
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review: The total Review Form weight must equal 100% for a weighted step, it is currently 0% |

  @76480 @76481 @76482 @ManagenementReviewPanalCatergoryReviewFormWeight @keerti
  Scenario: To validate system generated error message , When Total section Weight is more than 100% for all Review Panel Categories in management review form for management review step in planning phase
    | To validate system generated error message , When Total section Weight is less than 100% for all Review Panel Categories in management review form for management review step in planning phase
    | To validate system generated error message ,When management review form Weight : 0% & total section weight : 100 % for all review panel categories for management review step in planning phase
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header                 | Section Weight (%) |
      | Return on Investment (ROI)     | 70                 |
      | Strategic Alignment            | 50                 |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review - Management Review: The total section weight must equal 100% or 0%, it is currently 120%. |
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header                 | Section Weight (%) |
      | Return on Investment (ROI)     | 60                 |
      | Strategic Alignment            | 30                 |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review - Management Review: The total section weight must equal 100% or 0%, it is currently 90%. |
    And I click on "Edit" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "0" into field "Weight__c"
    And I click on top right button "save" in flex table with id "---program:-:reviewStepTableId---"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header                 | Section Weight (%) |
      | Return on Investment (ROI)     | 60                 |
      | Strategic Alignment            | 40                 |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review: The total Review Form weight must equal 100% for a weighted step, it is currently 0%. |

  @76478 @PrescreenReviewPanelCategoriesWithoutAssociated @keerti
  Scenario Outline: To validate system generated error message,for Prescreen Review form, If Review Panel Categories not associated with review question in  Prescreening review step of setup tab in planing
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    #And I close "Review Form" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 20              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Edit" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "100" into field "Weight__c"
    When I enter value "1" into field "MinimumNumberOfReviewers__c"
    When I enter value "Checked" into field "Required__c"
    And I click on top right button "save" in flex table with id "---program:-:reviewStepTableId---"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Eligibility"
    And I click on "Delete" icon for "1" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Completeness"
    And I click on "Delete" icon for "1" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "3" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "4" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A weighted form must contain weighted sections. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76579 @76580 @76581 @SMEReviewTotalSectionWeightValidation @keerti
  Scenario Outline: To validate system generated error message ,When Total section Weight is 0% for all Review Panel Categories in program review form for SME review step in planning phase
    | To validate system generated error message , When Total section Weight is more than 100% for all Review Panel Categories in program review form for SME review step in planning phase
    | To validate system generated error message , When Total section Weight is less than 100% for all Review Panel Categories in program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    #And I close "Review Form" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Edit" icon for "Compliance Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "0" into field "Weight__c"
    And I click on "Edit" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "30" into field "Weight__c"
    And I click on "Edit" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "70" into field "Weight__c"
    And I click on top right button "save" in flex table with id "---program:-:reviewStepTableId---"
    And I click on "Review Form" icon for "Program review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 0                  |
      | Approach       | 0                  |
      | Impact         | 0                  |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Program Review: A score cannot be associated to a question in the Capability section because it does not have a weight. |
      | Setup Tab - SME Review - Program Review: A score cannot be associated to a question in the Approach section because it does not have a weight    |
      | Setup Tab - SME Review - Program Review: A score cannot be associated to a question in the Impact section because it does not have a weight.     |
      | Setup Tab - SME Review - Program Review: A weighted form must contain weighted sections.                                                         |
    And I click on "Review Form" icon for "Program review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%)  |
      | Capability     | 50                  |
      | Approach       | 50                  |
      | Impact         | 20                  |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Program Review: The total section weight must equal 100% or 0%, it is currently 120%. |
    And I click on "Review Form" icon for "Program review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%)  |
      | Capability     | 60                  |
      | Approach       | 30                  |
      | Impact         | 0                   |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Program Review: The total section weight must equal 100% or 0%, it is currently 90%. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76583 @76584 @76586 @PrescreeningSMEReviewQuestionValidation @keerti
  Scenario Outline: To verify,review question section displayed by default for all review panel categories for prrescreening review form in prescreening review step of planning phase
    |To verify,review question section displayed by default for all review panel categories for compliance review form in SME review step of planning phase
    |To verify,review question section displayed by default for all review panel categories for Fiscal review form in SME review step of planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Eligibility"
    Then I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Is applicant a legal entity registered in State of California?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "2" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "2" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Completeness"
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "If applicable, were the required public comment processes observed and documented?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Total Records:2" inside flex table with id "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type      | Max Score |
      | 4              | Test 4    | Yes/No    | 0         |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type      | Max Score |
      | 4              | Test 4    | Yes/No    | 0         |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type      | Max Score |
      | 4              | Test 4    | Yes/No    | 0         |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Total Records:3" inside flex table with id "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type      | Max Score |
      | 7              | Test 7    | Yes/No    | 0         |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 7" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type      | Max Score |
      | 4              | Test 4    | Yes/No    | 0         |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type      | Max Score |
      | 3              | Test 3    | Yes/No    | 0         |
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 3" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Total Records:3" inside flex table with id "---program:-:programReviewPanel---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76922 @76921 @76937 @76936 @ValidatingReturnOnInvestmentQuestionValidatingStrategicAlignment @keerti
  Scenario Outline: To verify user allow to download PDF for review question in Return on Investment (ROI) of Review Panel Categories in management review form for management review step in planning phase
  | To verify user able to add new review question with success message in Return on Investment (ROI) of Review Panel Categories in management review form for management review step in planning phase
  | To verify user allow to download PDF for review question in Strategic Alignment of Review Panel Categories in management review form for management review step in plnning phase
  | To verify user able to add new review question with success message in Strategic Alignment of Review Panel Categories in management review form for management review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I click on parallel lines menu bar with data target value "#ProgramRelatedReviewPanelQuestionsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly verify that "pdf" file is downloaded
    Then I softly see "Return on Investment (ROI)" on page "1" of "govgrants" pdf file
    Then I softly see "Rate and describe overall value of the Project." on page "1" of "govgrants" pdf file
    Then I softly see "Strategic Alignment" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%) " on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 4              | Test      | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Strategic Alignment"
    And I click on parallel lines menu bar with data target value "#ProgramRelatedReviewPanelQuestionsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly verify that "pdf" file is downloaded
    Then I softly see "Strategic Alignment" on page "1" of "govgrants" pdf file
    Then I softly see "Return on Investment (ROI)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%) " on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 3              | Test 1    | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 1" for title "Question" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76925 @76924 @76938 @ModificationDeletionManagementReviewQuestion @keerti
  Scenario Outline: To verify user able to modify review question in Return on Investment (ROI) of Review Panel Categories in management review form for management review step in planning phase
  | To verify user able to delete review question with success message in Return on Investment (ROI) of Review Panel Categories in management review form for management review step in planning phase
  | To verify user able to delete review question with success message in Strategic Alignment of Review Panel Categories in management review form for management review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 4              | Test 4    | Date    | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type        |
      | 4              | Written     |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Written" for title "Type" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "4" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 3              | Test 3    | Date    | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Delete" icon for "3" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "3" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @38246 @77115 @77106 @ValidatingPre-ScreenReviewFormAndComplianceReviewAdditionDeletion @keerti
  Scenario: To validate system generated error message ,When Total section Weight is 0% for all Review Panel Categories in prescreening review form for prescreening review step in planning phase
  | To verify user able to modify review question  in Environment of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 40              |
      | SME Review        | 30              |
      | Pre-Screen Review | 30              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Edit" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "100" into field "Weight__c"
    When I enter value "1" into field "MinimumNumberOfReviewers__c"
    When I enter value "Checked" into field "Required__c"
    And I click on top right button "save" in flex table with id "---program:-:reviewStepTableId---"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%)  |
      | Eligibility    | 0                   |
      | Completeness   | 0                   |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A weighted form must contain weighted sections. |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 4              | Test 4    | Date    | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type        |
      | 4              | Number      |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Number" for title "Type" against the value "4" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "4" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"

  @77118 @77116 @77122 @77120 @ValidatingAdditionModificationDeletionOfPermitsReview @keerti
  Scenario Outline: To verify user allow to download PDF for review question in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to modify review question in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Permits"
    And I click on parallel lines menu bar with data target value "#ProgramRelatedReviewPanelQuestionsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
   Then I softly see "Permits " on page "1" of "govgrants" pdf file
    Then I softly see "Environment" on page "1" of "govgrants" pdf file
    Then I softly see "Schedule" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max Score" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%) " on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 4              | Test      | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type        |
      | 4              | Date        |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Date" for title "Type" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "4" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77124 @77123 @77170 @77171 @ValidatingPDFAdditionDeletionModificationInBudgetFiscalReviewForm @keerti
  Scenario Outline: To verify user allow to download PDF for review question in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to modify review question in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Budget"
    And I click on parallel lines menu bar with data target value "#ProgramRelatedReviewPanelQuestionsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Budget" on page "1" of "govgrants" pdf file
    Then I softly see "Program Income" on page "1" of "govgrants" pdf file
    Then I softly see "Match" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max Score" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%) " on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 7              | Test 7    | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 7" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "7" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "7" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type        |
      | 7              | Date        |
    Then I softly see value "Date" for title "Type" against the value "7" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77172 @ValidatingAdditionInMatchFiscalReviewForm @keerti
  Scenario: To verify user able to add new review question with success message in Match of Review Panel Categories in Fiscal review form for SME review step in planning phase
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
        | Step Name         | Step Weight (%) |
        | Management Review | 25              |
        | SME Review        | 75              |
        | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 4              | Test 4    | Yes/No  | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"

  @77173 @77176 @77174 @ValidatingPDFModificationDeletionInMatchFiscalReviewForm @keerti
  Scenario Outline:  To verify user allow to download PDF for review question in match of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to modify review question in Match of Review Panel Categories in fiscal review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Match of Review Panel Categories in fiscal review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Budget"
    And I click on parallel lines menu bar with data target value "#ProgramRelatedReviewPanelQuestionsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Budget" on page "1" of "govgrants" pdf file
    Then I softly see "Program Income" on page "1" of "govgrants" pdf file
    Then I softly see "Match" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max Score" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%) " on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 7              | Test 7    | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 7" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type        |
      | 7              | Date        |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Date" for title "Type" against the value "7" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "7" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |


  @77189 @ValidatingAdditionInProgramIncomeFiscalReviewForm @keerti
  Scenario Outline: To verify user able to add new review question with success message in Program Income of Review Panel Categories in Fiscal review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 3              | Test 3    | Date    | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 3" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76477 @ValidatingProgramReviewFormWithoutQuestion @keerti
  Scenario Outline: To validate system generated error message,for Program Review form, If Review Panel Categories not associated with review question in SME review step of setup tab in planing
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Edit" icon for "Compliance Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "10" into field "Weight__c"
    And I click on "Edit" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "40" into field "Weight__c"
    And I click on "Edit" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "50" into field "Weight__c"
    And I click on top right button "save" in flex table with id "---program:-:reviewStepTableId---"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Capability"
    And I click on "Delete" icon for "1" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Approach"
    And I click on "Delete" icon for "1" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "3" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "4" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "5" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "6" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "7" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "8" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "9" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "10" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Impact"
    And I click on "Delete" icon for "1" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "3" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Capability section because it is weighted |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Approach section because it is weighted   |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Impact section because it is weighted     |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76476 @ValidatingFiscalReviewFormWithoutQuestion @keerti
  Scenario Outline: To validate system generated error message,for Fiscal Review form, If Review Panel Categories not associated with review question in SME review step of setup tab in planing
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0              |
    And I expand nested table containing column value "SME Review"
    And I click on "Edit" icon for "Compliance Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "10" into field "Weight__c"
    And I click on "Edit" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "40" into field "Weight__c"
    And I click on "Edit" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "50" into field "Weight__c"
    And I click on top right button "save" in flex table with id "---program:-:reviewStepTableId---"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Budget"
    And I click on "Delete" icon for "1" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "3" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "4" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "5" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "6" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Match"
    And I click on "Delete" icon for "1" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "3" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Program Income"
    And I click on "Delete" icon for "1" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Budget section because it is weighted.         |
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Match section because it is weighted.          |
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Program Income section because it is weighted. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @38244 @ValidatingManagementReviewFormWithoutQuestion @keerti
  Scenario Outline: To validate system generated error message,for management review form, If Review Panel Categories not associated with review question in management review step of setup tab in planing
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I click on "Edit" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    When I enter value "100" into field "Weight__c"
    And I click on top right button "save" in flex table with id "---program:-:reviewStepTableId---"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I click on "Delete" icon for "1" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "3" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Strategic Alignment"
    And I click on "Delete" icon for "1" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review - Management Review: A score must be associated to at least one question in the Strategic Alignment section because it is weighted.     |
      | Setup Tab - Management Review - Management Review: A score must be associated to at least one question in the Return on Investment (ROI) section because it is weighted.|
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76479 @ValidatingTotalSectionWeightInManagmentReview @keerti
  Scenario: To validate system generated error message ,When Total section Weight is 0% for all Review Panel Categories in management review form for management review step in planning phase
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header                 | Section Weight (%) |
      | Return on Investment (ROI)     | 0                 |
      | Strategic Alignment            | 0                |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review - Management Review: A score cannot be associated to a question in the Return on Investment (ROI) section because it does not have a weight. |
      | Setup Tab - Management Review - Management Review: A score cannot be associated to a question in the Strategic Alignment section because it does not have a weight.        |
      | Setup Tab - Management Review - Management Review: A weighted form must contain weighted sections.                                                                         |


  @77290 @77289 @77292 @77291  @PDFAdditionModificationDeletionInApproach @keerti
  Scenario Outline: To verify user allow to download PDF for review question in Approach of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Approach of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to modify review question in Approach of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Approach of Review Panel Categories in Program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    #And I close "Review Form" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Approach"
    And I click on parallel lines menu bar with data target value "#ProgramRelatedReviewPanelQuestionsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Capability" on page "1" of "govgrants" pdf file
    Then I softly see "Approach" on page "1" of "govgrants" pdf file
    Then I softly see "Impact" on page "2" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question    | Type    | Max Score |
      | 11              | Test 11    | Date    | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Next" in the page details
    #And I click modal button "Next"
    And I wait for "20" seconds
    Then I softly see value "11" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 11" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Date" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "11" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "11" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order  | Type        |
      | 11              | Written     |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Written" for title "Type" against the value "11" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "11" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "11" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77293 @77294 @77343 @AdditionPDFModificationInImpact @keerti
  Scenario Outline: To verify user able to add new review question with success message in Impact of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user allow to download PDF for review question in Impact of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to modify review question in Impact of Review Panel Categories in Program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Add" after selection of "<Objective>" in the table "---program:-:associateObjectivesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question    | Type      | Max Score |
      | 4              | Test 4      | Yes/No    | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on parallel lines menu bar with data target value "#ProgramRelatedReviewPanelQuestionsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Capability" on page "1" of "govgrants" pdf file
    Then I softly see "Approach" on page "1" of "govgrants" pdf file
    Then I softly see "Impact" on page "2" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type        |
      | 4              | Date        |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Date" for title "Type" against the value "4" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |
