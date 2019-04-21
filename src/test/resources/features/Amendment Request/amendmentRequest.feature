@amendmentRequest @regression
Feature: Validate all scenarios in the Amendment Request

  Background: Setup data
    Given I delete the record "Automation Grant Regression" from the object "Amendment Request"
    Given I login and view the "Active" award "Activated" with name "Automation Grant Regression" as User "PM"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |

  @creationOfSOWAmendmentRequest  @smoke
  Scenario: Creation of Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see status in Progress-bar is "Created" and is "green"

  @editionOfSOWAmendmentRequest 
  Scenario: Creation of Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @associationOfKPIToSOWAmendmentRequest  @smoke
  Scenario: Association of KPI to Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                                   | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                                      | Target__c    |
    When I click modal button "Save"
    And I close Modal
    Then I see that "Automation Permanent KPI for Regression" has been added in flextable with Id "flexGridGrantorAmendmentKeyOutcomes"

   @associationOfObjectiveToSOWAmendmentRequest  @smoke @wip
   Scenario: Association of Objective to Amendment Request
   Given I navigate to "Requests" sub tab
   And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
   When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
   And I click modal button "Save and Continue"
   And I click on "Save" in the page details
   When I click on top right button "Associate" in flex table with id "GrantorAmendmentGoalsObjectives"
   And I click "Associate" after selection of "Automation Permanent Objective " in the table "SelectAmendmentGoals"
   When I switch to Parent frame
   Then I see that "Automation Permanent Objective " has been added in flextable with Id "GrantorAmendmentGoalsObjectives"

  @deletionOfObjectiveInSOWAmendmentRequest 
  Scenario: Deletion of Objective in Amendment Request
   Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "GrantorAmendmentGoalsObjectives"
    And I click "Associate" after selection of "Automation Grant Objective" in the table "SelectyyAmendmentGoals"
    When I switch to Parent frame
    When I click on "Remove" icon for "Automation Grant Objective" inside flex table with id "GrantorAmendmentGoalsObjectives"
    Then I do not see values "SPO-0077" and "Automation Grant Objective" inside table

  @assignApproversToSOWAmendmentRequest 
  Scenario: Assign approvers to Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
      Given I navigate to "Responsibilities" sub tab
     And I edit the following rows inline in flex table with id "flexGridAmendmentreqRolesAndResponsibilities" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    Then I see that "Automation EXE" has been added in flextable with Id "flexGridAmendmentreqRolesAndResponsibilities"

  @addAttachmentToSOWAmendmentRequest 
  Scenario: Add attachment to Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "a150b000003epeQAAQ"
    When I choose the file "Announcement_Field_Values.xlsx" to upload for "Attachment" of type "Terms and Conditions"
    And I close Modal
    Then I see that "Terms and Conditions" has been added in flextable with Id "a150b000003epeQAAQ"

  @sendToSubrecipientToSOWAmendmentRequest  
  Scenario: Send Amendment Request to subrecipient
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
     When I navigate to "Responsibilities" sub tab
     And I edit the following rows inline in flex table with id "flexGridAmendmentreqRolesAndResponsibilities" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2               | Step 3             |
      | Attachment Navigation | Attachments | Add                  | a150b000003epeQAAQ |
      | Attachment Details    | Attachment  | Terms and Conditions |                    |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"

  @subrecipientAcknowledgesSOWAmendmentRequest  @smoke
  Scenario: Subrecipient acknowledges Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
     When I navigate to "Responsibilities" sub tab
     And I edit the following rows inline in flex table with id "flexGridAmendmentreqRolesAndResponsibilities" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2               | Step 3             |
      | Attachment Navigation | Attachments | Add                  | a150b000003epeQAAQ |
      | Attachment Details    | Attachment  | Terms and Conditions |                    |
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Acknowledge" in the page details
    Then I see that "Amendment Request" is in "Acknowledged" status

  @submitForApprovalSOWAmendmentRequest 
  Scenario: Submit Amendment Request for Approval
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
     When I navigate to "Responsibilities" sub tab
     And I edit the following rows inline in flex table with id "flexGridAmendmentreqRolesAndResponsibilities" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2               | Step 3             |
      | Attachment Navigation | Attachments | Add                  | a150b000003epeQAAQ |
      | Attachment Details    | Attachment  | Terms and Conditions |                    |
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Acknowledge" in the page details
    When User "PM" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3   |
      | Navigation | Grants            | As a Grantor | INTERNAL |
      | Left Panel | Pending Tasks     | My Tasks     |          |
      | FlexTable  | PhasePendingTasks | Start        |          |
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  @approvalOfSOWAmendmentRequest  @smoke
  Scenario: Approval of Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
     When I navigate to "Responsibilities" sub tab
     And I edit the following rows inline in flex table with id "flexGridAmendmentreqRolesAndResponsibilities" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2               | Step 3             |
      | Attachment Navigation | Attachments | Add                  | a150b000003epeQAAQ |
      | Attachment Details    | Attachment  | Terms and Conditions |                    |
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Acknowledge" in the page details
    When User "PM" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3   |
      | Navigation | Grants            | As a Grantor | INTERNAL |
      | Left Panel | Pending Tasks     | My Tasks     |          |
      | FlexTable  | PhasePendingTasks | Start        |          |
    And I click on "Submit for Approval" in the page details
    When "3" Approvers "PM,FO,EXE" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    Then I see status in Progress-bar is "Approved" and is "green"

  @amendSubawardSOWAmendmentRequest 
  Scenario: Click on Amend of Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
     When I navigate to "Responsibilities" sub tab
     And I edit the following rows inline in flex table with id "flexGridAmendmentreqRolesAndResponsibilities" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2               | Step 3             |
      | Attachment Navigation | Attachments | Add                  | a150b000003epeQAAQ |
      | Attachment Details    | Attachment  | Terms and Conditions |                    |
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Acknowledge" in the page details
    When User "PM" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3   |
      | Navigation | Grants            | As a Grantor | INTERNAL |
      | Left Panel | Pending Tasks     | My Tasks     |          |
      | FlexTable  | PhasePendingTasks | Start        |          |
    And I click on "Submit for Approval" in the page details
    When "3" Approvers "PM,FO,EXE" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    And I click on "Amend Subaward" in the page details
     Then I see the following messages in the page details contains:
     | You cannot draft this award until all awards pending activation have been activated. |
    
  @activateSubawardSOWAmendmentRequest @scopeOfWorkHappyPath @smoke 
  Scenario: Click on Amend of Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
     When I navigate to "Responsibilities" sub tab
     And I edit the following rows inline in flex table with id "flexGridAmendmentreqRolesAndResponsibilities" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2               | Step 3             |
      | Attachment Navigation | Attachments | Add                  | a150b000003epeQAAQ |
      | Attachment Details    | Attachment  | Terms and Conditions |                    |
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Acknowledge" in the page details
    When User "PM" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3   |
      | Navigation | Grants            | As a Grantor | INTERNAL |
      | Left Panel | Pending Tasks     | My Tasks     |          |
      | FlexTable  | PhasePendingTasks | Start        |          |
    And I click on "Submit for Approval" in the page details
    When "3" Approvers "PM,FO,EXE" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    And I click on "Amend Subaward" in the page details
   # When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Pending Activation" and is "green"

  @creationOfBPCAmendmentRequest @smoke
  Scenario: Creation of Budget Period change Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @editionOfBPCAmendmentRequest 
  Scenario: Edition of Budget Period Change
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @editionOfFocusAreaDatesBPCAmendmentRequest 
  Scenario: Validate the edition of FocusArea Dates to BPC
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "flexGridAmendmentProjectAreasGrantor" by clicking "Edit" :
      | Title                         | End Date |
      | Automation Grant Focus Area   | 500      |
    Then I see that "Automation Grant Focus Area" has been added in flextable with Id "flexGridAmendmentProjectAreasGrantor"

  @associateFocusAreaToBPCAmendmentRequest @smoke
  Scenario: Validate the association of FocusArea to BPC 
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "flexGridAmendmentProjectAreasGrantor"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "SelectAmendmentGAT"
    And I close Modal
    Then I see that "Automation Permanent Focus Area" has been added in flextable with Id "flexGridAmendmentProjectAreasGrantor"