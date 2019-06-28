@amendmentRequest @regression
Feature: Validate all scenarios in the Amendment Request

  Background: Setup data
    Given I delete the record "Automation Award for Amendment Request" from the object "Amendment Request"
    Given I delete the record "Automation Award for Amendment Request" from the object "subaward"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAward_StandAlone:-:active_Grants_TableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"

  @53194 @creationOfSOWAmendmentRequest @smoke
  Scenario: Creation of SOW Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @53195 @editionOfSOWAmendmentRequest
  Scenario: Edition of Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @53196 @associationOfKPIToSOWAmendmentRequest @smoke
  Scenario: Association of KPI to Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---amendment:-:key_outcomes---"
    And I enter values into fields
      | Value                                    | Field        |
      | Automation Permanent KPI for Regression2 | MasterKPI__c |
      | 10                                       | Target__c    |
    When I click modal button "Save"
    And I close Modal
    Then I see that "Automation Permanent KPI for Regression2" has been added in flextable with Id "---amendment:-:key_outcomes---"

  @53197 @associationOfObjectiveToSOWAmendmentRequest @smoke @notFunctional
  Scenario: Association of Objective to Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---amendment:-:grantor_goals_objectives---"
    And I click "Associate" after selection of "Automation Permanent Objective" in the table "SelectAmendmentGoals"
    When I switch to Parent iframe
    Then I see that "Automation Permanent Objective" has been added in flextable with Id "---amendment:-:grantor_goals_objectives---"

  @53198 @deletionOfObjectiveInSOWAmendmentRequest
  Scenario: Deletion of Objective in Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Remove" icon for "Automation Permanent Objective" inside flex table with id "---amendment:-:grantor_goals_objectives---"
    Then I do not see value "Automation Permanent Objective" for title "Title" inside table "---amendment:-:grantor_goals_objectives---"

  @53199 @assignApproversToSOWAmendmentRequest
  Scenario: Assign approvers to Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentreq_roles_responsibilities---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    Then I see that "Automation EXE" has been added in flextable with Id "---amendment:-:amendmentreq_roles_responsibilities---"

  @53200 @addAttachmentToSOWAmendmentRequest
  Scenario: Add attachment to Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Terms and Conditions"
    And I close Modal
    Then I see that "Terms and Conditions" has been added in flextable with Id "a1511000002nJWIAA2"

  @53201 @sendToSubrecipientToSOWAmendmentRequest
  Scenario: Send Amendment Request to subrecipient
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "---amendment:-:key_outcomes---"
    And I enter values into fields
      | Value                                   | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                                      | Target__c    |
    Given I click modal button "Save"
    And I close Modal
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentreq_roles_responsibilities---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"

  @53202 @subrecipientAcknowledgesSOWAmendmentRequest @smoke
  Scenario: Subrecipient acknowledges Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentreq_roles_responsibilities---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details

    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Acknowledge" in the page details
    Then I see that "Amendment Request" is in "Acknowledged" status

  @53203 @submitForApprovalSOWAmendmentRequest
  Scenario: Submit Amendment Request for Approval
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentreq_roles_responsibilities---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details

    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  @53204 @approvalOfSOWAmendmentRequest @smoke
  Scenario: Approval of Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "---amendment:-:key_outcomes---"
    And I enter values into fields
      | Value                                   | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                                      | Target__c    |
    Given I click modal button "Save"
    And I close Modal
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentreq_roles_responsibilities---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Terms and Conditions"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    Then I see status in Progress-bar is "Approved" and is "green"

  @53205 @amendSubawardSOWAmendmentRequest
  Scenario: Click on Amend of Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "---amendment:-:key_outcomes---"
    And I enter values into fields
      | Value                                   | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                                      | Target__c    |
    Given I click modal button "Save"
    And I close Modal
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentreq_roles_responsibilities---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Terms and Conditions"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"

#    Given User "SPI" receives the task for "Record Id"
#      | Actions    | Step 1            | Step 2        | Step 3    |
#      | Navigation | Grants            | Grants Portal | SUBPORTAL |
#      | Left Panel | Pending Tasks     | My Tasks      |           |
#      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Acknowledge" in the page details

    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    And I click on "Amend Subaward" in the page details
    Then I see that "Automation Award for Amendment Request" is in "Pending Activation" status

  @53207 @activateSubawardSOWAmendmentRequest @scopeOfWorkHappyPath @smoke
  Scenario: Click Activate Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I complete the fields from the sheet "ScopeOfWork_Edition" in excel "AmendmentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on top right button "Associate" in flex table with id "---amendment:-:key_outcomes---"
    And I enter values into fields
      | Value                                   | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                                      | Target__c    |
    Given I click modal button "Save"
    And I close Modal
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentreq_roles_responsibilities---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Terms and Conditions"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Activated" and is "green"

  @53208 @creationOfBPCAmendmentRequest @smoke
  Scenario: Creation of Budget Period change Amendment Request
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @53209 @editionOfBPCAmendmentRequest
  Scenario: Edition of Budget Period Change
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @53210 @editionOfFocusAreaDatesBPCAmendmentRequest
  Scenario: Validate the edition of FocusArea Dates to BPC
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendment_projectareas_id---" by clicking "Edit" :
      | Title                           | End Date |
      | Automation Permanent Focus Area | 500      |
    Then I see that "Automation Permanent Focus Area" has been added in flextable with Id "---amendment:-:amendment_projectareas_id---"

  @53211 @associateFocusAreaToBPCAmendmentRequest @smoke
  Scenario: Validate the association of FocusArea to BPC
    Given I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendment_request_grantor_id---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---amendment:-:amendment_projectareas_id---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "SelectAmendmentGAT"
    And I close Modal
    Then I see that "Automation Permanent Focus Area2" has been added in flextable with Id "---amendment:-:amendment_projectareas_id---"
