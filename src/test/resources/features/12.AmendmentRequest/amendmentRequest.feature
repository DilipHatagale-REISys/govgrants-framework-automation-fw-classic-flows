@amendmentRequests @regression
Feature: Validate all scenarios in the Amendment Request

  Background: Setup data
    Given I delete the record "Automation Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Award for Amendment Request" from the object "Payment Request"
    And I delete the record "Automation Award for Amendment Request" from the object "subaward"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"

  @53194 @creationOfSOWAmendmentRequest
  Scenario: Creation of SOW Amendment Request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"

  @53195 @editionOfSOWAmendmentRequest
  Scenario: Edition of SOW Amendment Request type
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"

  @53196 @associationOfKPIToSOWAmendmentRequest
  Scenario: Association of KPI to Amendment Request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    When I enter "KPI" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    Then I see that "Automation Permanent KPI for Regression2" has been added in flextable with Id "---amendment:-:keyOutcomesTableId---"

  @53197 @associationOfObjectiveToSOWAmendmentRequest @smoke
  Scenario Outline: Association of Objective to Amendment Request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    When I perform quick search for "<Objectives>" in "---amendment:-:objectivesTableId---" panel
    And I click "Associate" after selection of "<Objectives>" in the table "---amendment:-:objectivesTableId---"
    Then I see that "<Objectives>" has been added in flextable with Id "---amendment:-:goalsAndObjectivesTableId---"
    Examples:
      | Objectives                      |
      | Automation Permanent Objective2 |

  @53198 @deletionOfObjectiveInSOWAmendmentRequest
  Scenario Outline: Deletion of Objective in Amendment Request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    When I perform quick search for "<Objectives>" in "---amendment:-:objectivesTableId---" panel
    And I click "Associate" after selection of "<Objectives>" in the table "---amendment:-:objectivesTableId---"
    When I click on "Remove" icon for "<Objectives>" inside flex table with id "---amendment:-:goalsAndObjectivesTableId---"
    Then I do not see value "<Objectives>" for title "Title" inside table "---amendment:-:goalsAndObjectivesTableId---"
    Examples:
      | Objectives                      |
      | Automation Permanent Objective2 |

  @53199 @assignApproversToSOWAmendmentRequest
  Scenario: Assign approvers to Amendment Request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    Then I see that "Automation EXE" has been added in flextable with Id "---amendment:-:approversTableId---"

  @53200 @addAttachmentToSOWAmendmentRequest
  Scenario: Add attachment to Amendment Request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Terms and Conditions"
    Then I see "Announcement_Field_Values.xlsx" has been added in "Attachments" flex table

  @53201 @sendToSubrecipientToSOWAmendmentRequest
  Scenario: Send Amendment Request to subrecipient
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    And I enter values into fields
      | Value                                   | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                                      | Target__c    |
    Given I click modal button "Save"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"

  @53202 @subrecipientAcknowledgesSOWAmendmentRequest @smoke @wip
  Scenario: Subrecipient acknowledges Amendment Request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    Then I see that "Amendment Request" is in "Acknowledged" status

  @53203 @submitForApprovalSOWAmendmentRequest @wip
  Scenario: Submit Amendment Request for Approval
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"

  @53204 @approvalOfSOWAmendmentRequest
  Scenario: Approval of Amendment Request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    And I enter values into fields
      | Value                                   | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                                      | Target__c    |
    And I click modal button "Save"
    When I close "Grantor Amendment KPIs" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Terms and Conditions"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "Green"

  @53205 @amendSubawardSOWAmendmentRequest @wip
  Scenario: Click on Amend of Amendment Request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    And I enter values into fields
      | Value                                   | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                                      | Target__c    |
    Given I click modal button "Save"
    When I close "Grantor Amendment KPIs" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Terms and Conditions"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Amend Subaward" in the page details
    Then I see that "Automation Award for Amendment Request" is in "Pending Activation" status

  @53207 @activateSubawardSOWAmendmentRequest @scopeOfWorkHappyPath @wip
  Scenario: Activate SOW Amendment Request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    And I enter values into fields
      | Value                                   | Field        |
      | Automation Permanent KPI for Regression | MasterKPI__c |
      | 10                                      | Target__c    |
    When I click modal button "Save"
    When I close "Grantor Amendment KPIs" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Terms and Conditions"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Activated" and is "Green"

  @53208 @66582 @53209 @creationOfBPCAmendmentRequest @editionOfBPCAmendmentRequest
  Scenario: Edition of Budget Period Change
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    Then I softly see status in Progress-bar is "Created" and is "Green"

  @53210 @editionOfFocusAreaDatesBPCAmendmentRequest
  Scenario: Validate the edition of FocusArea Dates to BPC
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date |
      | Automation Permanent Focus Area | 500      |
    Then I see that "Automation Permanent Focus Area" has been added in flextable with Id "---amendment:-:projectAreasTableId---"

  @53211 @associateFocusAreaToBPCAmendmentRequest @wip
  Scenario Outline: Validate the association of FocusArea to BPC
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on top right button "Associate" in flex table with id "---amendment:-:projectAreasTableId---"
    When I perform quick search for "<Focus Area>" in "---amendment:-:focusAreaTableId---" panel
    When I click "Associate" after selection of "<Focus Area>" in the table "---amendment:-:focusAreaTableId---"
    Then I see that "<Focus Area>" has been added in flextable with Id "---amendment:-:projectAreasTableId---"
    Examples:
      | Focus Area                       |
      | Automation Permanent Focus Area2 |

  @56843 @66584 @ValidateGranotrCanIncreaseAwardBudgetAmountInFundingchangeTypeRequest @mahadev
  Scenario: Verify Internal user can send request to Sub-recipient for increase in the award budget amount using Funding change option.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "Green"

  @56844 @ValidateGranotrCanDecreaseAwardBudgetAmountInFundingchangeTypeRequest @mahadev
  Scenario: Verify Internal user can send request to Sub-recipient for increase in the award budget amount using Funding change option.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | -2000                       | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"

  @56845 @ValidateGrantorCanDeleteCreatedAmendmentRequest @mahadev
  Scenario: Verify Internal (Award owner) user can delete the created amendment request
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I get the "EGMS ID"
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    And I click on "Delete" icon for "Record Id" inside flex table with id "---amendment:-:amendmentRequestTableId---"
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---amendment:-:amendmentRequestTableId---"

  @56847 @VerifyAwardOwnerCanEditCreatedAmendmentRequest @mahadev
  Scenario: Verify award owner can edit funding change amendment request type
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter value "500" into field "fieldRequestedChangeInBudget__c"
    And I click on "Save" in the page details
    Then I see field "Requested Change in Budget" as "$500.00"

  @56848 @ValidateGrantorCannotEditRequestAfterSendingToSubRecipient @mahadev
  Scenario: Verify Internal user can send request to Sub-recipient for increase in the award budget amount using Funding change option.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I click on "Send to Subrecipient" in the page details
    When I get the "EGMS ID"
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    Then I cannot see row level action button "Edit" against "Record Id" in flex table with id "---amendment:-:amendmentRequestTableId---"

  @56851 @validateErrorMessageIfRequestedChangeInBudgetFieldIsnotEntered @mahadev
  Scenario: Verify error message if requested budget change is not entered
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - The requested change in budget is required and cannot be $0 |

  @56854 @checkDuplicateFundingChangeNotAllowed @jitendra
  Scenario: Verify Once Internal user request for Amendment request is in Progress then no other request can be created.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details contains:
      | Another request for this award is already in progress. You cannot process this request |

  @56856 @NoDeleteIconAfterSentToSubRecipientForFundingChangeSPI @jitendra
  Scenario: Verify Once Internal user sent request to sub recipient than cannot Delete the same request.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    Then I cannot see row level action button "Delete" against "Funding Change" in flex table with id "---amendment:-:amendmentRequestTableId---"

  @56971 @56859  @56855 @VerifyAlertMessageIfSubRecipientSendbackAmendmentRequestToGrantorWithoutUpdated @mahadev
  Scenario: Verify alert message if sub-recipient send backs amendment request without update to grantor |  Verify SPI user is able to check
  the funding change request submitted by award owner |
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    Then I softly see field "Requested Change in Budget" as "$1,000.00"
    When I click on "Submit to Grantor" in the page details
    Then I softly see the text containing :
      | You have a requested a change of $0.0, but the required change is $1000.00. |

  @56973 @validateSubRecipientCanNotEditAmendmentRequestAfterSubmittingToGrantor @mahadev
  Scenario: Verify Sub-Recipient Can not edit funding type amendment request after submitting to Grantor
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Supplies" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I cannot see top right button "Edit" in page detail

  @56968 @VerifyDeletionOfFundingChangeAmendmentByAwardOwner @mahadev
  Scenario: Verify award owner can delete funding change amendment request
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Delete" in the page details
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---amendment:-:amendmentRequestTableId---"

  @56970 @VerifyEditionOfFundingChangeAmendmentByAwardOwner @mahadev
  Scenario: Verify award owner can delete funding change amendment request
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter value "2000" into field "fieldRequestedChangeInBudget__c"
    And I click on "Save" in the page details
    Then I see field "Requested Change in Budget" as "$2,000.00"

  @57132 @57131 @57129 @VerifyPendingTaskForPMAndEXE @mahadev
  Scenario: Verify (Program | fiscal) approver can check the amendment request in there pending task | Verify Once Amendment request is submitted for approval it cannot be modified
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Supplies" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I enter Revised Encumbrance for award "Automation Award for Amendment Request"
    And I click on top right button "Save" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"

  @57135 @57125 @VerifyAmendSubawardButtonAfterApprovalProcess @mahadev @smoke
  Scenario: Verify Once approval process is completed for Amendment Request then award owner can see Amend Subaward button |  Verify Internal user is able to check the funding change request submitted by Sub-recipient User
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Supplies" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I enter Revised Encumbrance for award "Automation Award for Amendment Request"
    And I click on top right button "Save" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    Then I softly can see top right button "Amend Subaward" in page detail

  @57287 @57269 @VerifyPendingTaskAtSubPortalAfterReviseAmendmentRequest @mahadev
  Scenario: Verify once grantor click on Revise button Amendment request Status changes to Created | Verify Sub-recipient can check revise amendment request in pending task
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Supplies" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Revise" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Description" into field "fieldPurposeRTA__c"
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"

  @57274 @57276 @VerifyRequestedChangeInBudgetFieldRemainsSameAfterReviseAmendmentRequest @mahadev @smoke
  Scenario: Verify When Grantor Revise the Amendment request the Budget Category amount updated by Sub-recipient is reflected the same | Verify when Grantor Revise the Amendment request the Requested Change in Budget field remains the same
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Supplies" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 500            |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 500            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Revise" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see value "$500.00" for title "Difference" against the value "Construction" inside table "---amendment:-:grantorBudgetChangeTableId---"
    And I softly see value "$500.00" for title "Difference" against the value "Supplies" inside table "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see field "Requested Change in Budget" as "$1,000.00"

  @57139 @awardOwnerActivateAmendedSubAward @jitendra
  Scenario: Verify that award owner can active the Amended sub-award
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I enter Revised Encumbrance for award "Automation Award for Amendment Request"
    And I click on top right button "Save" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I get the "EGMS ID"
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---amendment:-:amendmentRequestTableId---"
    When I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Activated" and is "green"

  @57141 @differenceFieldAfterRevisedEncumberenceAmount @jitendra @smoke
  Scenario: Verify Difference Field is getting Updated once Revised Encumbrance amount is entered by award owner.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I enter Revised Encumbrance for award "Automation Award for Amendment Request"
    And I click on top right button "Save" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    Then I see value "$1,000.00" for title "Difference" against the value "{SavedValue:fundingAccount}" inside table "---amendment:-:amendmentFundingAccountsTableId---"

  @56974 @grantorSendBackAmendmentToSubRecipient @jitendra
  Scenario: Verify Grantor can Send back the Amendment request to Sub-recipient.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I enter Revised Encumbrance for award "Automation Award for Amendment Request"
    And I click on top right button "Save" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Send back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"

  @57267 @verifyReviseButtonAmendment @jitendra
  Scenario: Verify Once Sub-recipient update the requested changes and submit to Grantor Revise button is displayed.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    Then I can see top right button "Revise" in page detail

  @57279 @verifyReviseButtonAmendment @jitendra
  Scenario: Verify Once Grantor Revise the Amendment request then he can modify the request and share with Sub-recipient again.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Revise" in the page details
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter value "2000" into field "fieldRequestedChangeInBudget__c"
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"

  @57288 @verifyAdvancePRCreatedAtRevisedAmendmentSubaward @jitendra
  Scenario: Verify Advance Payment request is created at revised amendment Subaward
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 1000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Revise" in the page details
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter value "2000" into field "fieldRequestedChangeInBudget__c"
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I enter Revised Encumbrance for award "Automation Award for Amendment Request"
    And I click on top right button "Save" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @57451 @verifyPaymentApproverApproveAdvancePaymentRequestActiveSubawardAfterFundingChangeAmendment @mahadev
  Scenario Outline: Verify Payment Request Approver can approve the Advance Payment Request created on Active subaward after Funding change amendment
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 100                         | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I enter Revised Encumbrance for award "Automation Award for Amendment Request"
    And I click on top right button "Save" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "PaymentRequestEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "Green"
    Examples:
      | Grant Name                             |
      | Automation Award for Amendment Request |

  @57444 @verifyPaymentApproverApproveReimbursementPaymentRequestActiveSubawardAfterFundingChangeAmendment @mahadev
  Scenario Outline: Verify Payment Request Approver can approve the Reimbursement Payment Request created on Active subaward after Funding change amendment
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 100                         | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I enter Revised Encumbrance for award "Automation Award for Amendment Request"
    And I click on top right button "Save" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "PaymentRequestEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 0                 |
    When I close "Add Line Items" modal by clicking the top right x button
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 10                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "Green"
    Examples:
      | Grant Name                             |
      | Automation Award for Amendment Request |

  @57366 @verifySubRecipientIsAbleToSeeAmendedBudgetPeriodOnAdvancePaymentRequest @mahadev
  Scenario Outline: Verify Sub-recipient user is able to see the amended Budget Period on Advance Payment Request
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "Automation Award for Amendment Request"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---amendment:-:recipientsAwardPaymentRequestsTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "PaymentRequestEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I see field "Payment Period End Date" as "{SavedValue:updatedBudgetPeriodDate}"
    Examples:
      | Grant Name                             |
      | Automation Award for Amendment Request |

  @57580 @creationOfAdvancePaymentRequestAfterScopeOfWorkChangeAmendmentRequest @mahadev @smoke
  Scenario Outline: creation of advance payment request after scope of work change amendment request
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "PaymentRequestEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Grant Name                             |
      | Automation Award for Amendment Request |

  @57356 @verifyReimbursementPRCreatedAtRevisedAmendmentSubaward @jitendra
  Scenario: Verify Reimbursement Payment request is created at revised amendment request
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "0" for award "Automation Award for Amendment Request"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Supplies" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Revise" in the page details
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter value "4000" into field "fieldRequestedChangeInBudget__c"
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 2000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I enter Revised Encumbrance for award "Automation Award for Amendment Request"
    And I click on top right button "Save" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---paymentRequest:-:recipientAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "PaymentRequestEdition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @57364 @verifyAdvancePRCreatedAtRevisedAmendmentSubaward @jitendra
  Scenario: Verify user can submit Advance Payment request to grantor after Budget Period Change Amendment is done on Subaward.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "Automation Award for Amendment Request"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "NewBudgetPeriodEndDate__c"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I get the "EGMS ID"
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---amendment:-:amendmentRequestTableId---"
    When I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---paymentRequest:-:recipientAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "PaymentRequestEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @57365 @verifyAdvancePRCreatedAtRevisedAmendmentSubaward @jitendra
  Scenario: Verify user can submit Reimbursement Payment request to grantor after Budget Period Change Amendment is done on Subaward
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "Automation Award for Amendment Request"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "NewBudgetPeriodEndDate__c"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I get the "EGMS ID"
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---amendment:-:amendmentRequestTableId---"
    When I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---paymentRequest:-:recipientAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "PaymentRequestEdition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @57377 @68075 @verifyAdvancePRCreatedAtRevisedAmendmentSubaward @jitendra
  Scenario: Verify user can submit Advance Payment request to grantor after Budget Period Change Amendment is done on Subaward.
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "Automation Award for Amendment Request"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "NewBudgetPeriodEndDate__c"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I get the "EGMS ID"
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Overview" sub tab
    Then I softly see field "Subaward Type" as "Amendment"
    Then I softly see field "Version Number" as "12"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---amendment:-:amendmentRequestTableId---"
    When I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---paymentRequest:-:recipientAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "PaymentRequestEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    Then I softly see field "Payment Period End Date" as "{SavedValue:updatedBudgetPeriodDate}"

  @57367 @verifyRecipientCanSeeAmendedBudgetPeriodOnReimbursementPaymentRequestPage @mahadev
  Scenario Outline: Verify Sub-recipient user can see the amended Budget Period on Reimbursement Payment Request Page
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "Automation Award for Amendment Request"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---amendment:-:amendmentRequestTableId---"
    When I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Then I see field "Payment Period End Date" as "{SavedValue:updatedBudgetPeriodDate}"
    Examples:
      | Grant Name                             |
      | Automation Award for Amendment Request |

  @57404 @verifyGrantorCanSeeAmendedBudgetPeriodOnReimbursementPaymentRequestPage @mahadev
  Scenario Outline: Verify grantor can see the amended Budget Period on Reimbursement Payment Request Page
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "Automation Award for Amendment Request"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---amendment:-:amendmentRequestTableId---"
    When I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "PaymentRequestEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    Then I see field "Payment Period End Date" as "{SavedValue:updatedBudgetPeriodDate}"
    Examples:
      | Grant Name                             |
      | Automation Award for Amendment Request |

  @62966 @SRUserCanViewRiskScoreForARACopiedToNewCreatedAndAmendmentTypeTermsAndConditionsAmendment @smoke
  Scenario: Validate whether SR user can view the Risk Score which remained as is when Award Risk Assessment is copied to new created award when amendment type -  Terms and conditions amendment
    And I navigate to "Management" sub tab
    When I click on "View" icon for "Active" inside flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I save the field labeled "OverAll Risk" as "OverAllRisk"
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field               |
      | Automation Justification | fieldTncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---riskassessment:-:riskAssessmentGridViewExternalTableId---"
    Then I see field "Overall Risk" as "{SavedValue:OverAllRisk}"

  @72358 @activationOfBudgetPeriodAmendmentRequest @productBusinessFlowSanity
  Scenario: Validate the Budget period amendment activation
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "Automation Award for Amendment Request"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I get the "EGMS ID"
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---amendment:-:amendmentRequestTableId---"
    When I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Amended" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    Then I see status in Progress-bar is "Amended" and is "Green"