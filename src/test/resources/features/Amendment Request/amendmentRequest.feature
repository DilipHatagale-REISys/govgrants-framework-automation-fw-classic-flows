@amendmentRequest @regression
Feature: Validate all scenarios in the Amendment Request

  Background: Setup data
    #Given I delete the record "Automation Grant Award for Post Award" from the object "Amendment Request"
    Given I login and view the "Active" award "Activated" with name "Automation Grant Award for Post Award" as User "PM"
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
    #And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @editionOfSOWAmendmentRequest 
  Scenario: Creation of Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #And I click on "Save" in the page details
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
    #And I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                       | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                          | Target__c    |
    When I click modal button "Save"
    And I close Modal
    Then I see that "Automation Permanent KPI for Regression" has been added in flextable with Id "flexGridGrantorAmendmentKeyOutcomes"

   @associationOfObjectiveToSOWAmendmentRequest  @smoke
   Scenario: Association of Objective to Amendment Request
   Given I navigate to "Requests" sub tab
   And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
   When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
   And I click modal button "Save and Continue"
   #And I click on "Save" in the page details
   When I click on top right button "Associate" in flex table with id "GrantorAmendmentGoalsObjectives"
   And I click "Associate" after selection of "Permanent Objective Automation" in the table "SelectAmendmentGoals"
   When I switch to Parent frame
   Then I see that "Permanent Objective Automation" has been added in flextable with Id "GrantorAmendmentGoalsObjectives"

  #@deletionOfObjectiveInSOWAmendmentRequest 
 # Scenario: Deletion of Objective in Amendment Request
 #   Given I navigate to "Requests" sub tab
  #  And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
   # When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    #And I click modal button "Save and Continue"
    #And I click on "Save" in the page details
    #When I click on top right button "Associate" in flex table with id "GrantorAmendmentGoalsObjectives"
    #And I click "Associate" after selection of "Permanent Objective Automation" in the table "SelectAmendmentGoals"
    #When I switch to Parent frame
    #When I click on "Remove" icon for "Permanent Objective Automation" inside flex table with id "GrantorAmendmentGoalsObjectives"
    #Then I do not see values "SPO-0130" and "Permanent Objective Automation" inside table

  @assignApproversToSOWAmendmentRequest 
  Scenario: Assign approvers to Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "AmendmentreqRolesAndResponsibilities"
    When I fill in the "Automation PM" for the Approver details
    And I close Modal
    When I click on "Edit" icon for "Fiscal Approver" inside flex table with id "AmendmentreqRolesAndResponsibilities"
    And I fill in the "Automation FO" for the Approver details
    And I close Modal
    And I click on "Edit" icon for "Executive Approver" inside flex table with id "AmendmentreqRolesAndResponsibilities"
    When I fill in the "Automation EXE" for the Approver details
    And I close Modal
    Then I see that "Automation EXE" has been added in flextable with Id "AmendmentreqRolesAndResponsibilities"

  @addAttachmentToSOWAmendmentRequest 
  Scenario: Add attachment to Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #And I click on "Save" in the page details
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
   # And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Grant KPI | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | AmendmentreqRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | AmendmentreqRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | AmendmentreqRolesAndResponsibilities | Edit   | Executive Approver |
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
    #And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Grant KPI | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | AmendmentreqRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | AmendmentreqRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | AmendmentreqRolesAndResponsibilities | Edit   | Executive Approver |
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
    #And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Grant KPI | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | AmendmentreqRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | AmendmentreqRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | AmendmentreqRolesAndResponsibilities | Edit   | Executive Approver |
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
    #And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Grant KPI | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | AmendmentreqRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | AmendmentreqRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | AmendmentreqRolesAndResponsibilities | Edit   | Executive Approver |
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
    #And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Grant KPI | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | AmendmentreqRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | AmendmentreqRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | AmendmentreqRolesAndResponsibilities | Edit   | Executive Approver |
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
    Then I see that "Subaward" is in "Pending Activation" status
    #Then I see status in Progress-bar is "" and is "green"
     #Then I see the following messages in the page details :
     #| You cannot draft this award until all awards pending activation have been activated. |
    
  @activateSubawardSOWAmendmentRequest @scopeOfWorkHappyPath @smoke
  Scenario: Click on Amend of Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "GrantorAwardAmendmentRequest"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "flexGridGrantorAmendmentKeyOutcomes"
    And I enter values into fields
      | Value                | Field        |
      | Automation Grant KPI | MasterKPI__c |
      | 10                   | Target__c    |
    Given I click modal button "Save"
    And I close Modal
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | AmendmentreqRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | AmendmentreqRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | AmendmentreqRolesAndResponsibilities | Edit   | Executive Approver |
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
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Activated" and is "green"

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
    When I click "Associate" after selection of "Automation Program Focus Area" in the table "SelectAmendmentGAT"
    And I close Modal
    Then I see that "Automation Program Focus Area" has been added in flextable with Id "flexGridAmendmentProjectAreasGrantor"