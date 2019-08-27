@amendmentRequest @regression
Feature: Amendment Request scenarios without background

  @54853 @ValidateRevisedBudgetAmountBalanceUpdatedOnAdvancePaymentRequest @mahadev
  Scenario Outline: Verify that as per 'Revised Award Budget', "Balance" amount is updated on advance payment request
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
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
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Then I see field "Awarded Budget" as "$3,000.00"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request |

  @54862 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardOnActualsTabAtGrantorSide @mahadev
  Scenario Outline: Verify that as per 'Revised Award Budget', "Balance" amount is updated on Award at grantor side
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Actuals" sub tab
    Then I see field "Awarded Budget" as "$3,000.00"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request |

  @54864 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardBudgetTabAtGranteeSide @mahadev
  Scenario Outline: Verify that as per 'Revised Award Budget', "Balance" amount is updated on Award on budget tab at grantee side
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
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
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Budget" sub tab
    Then I see field "Total Subaward Amount this Budget Period" as "$3,000.00"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request |

  @57277 @verifyValidationErrorMessageIfRequestedBudgetFieldChangeEnteredLessThanRequestedAmount @mahadev
  Scenario Outline: Verify validation error message is shown if Requested Change in Budget field is given less than the requested amount at Sub-recipient
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | -500                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 300            |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - You have a requested a change of $300.0, but the required change is -$-500.00. |
    Examples:
      | Award Name                                       | Grant Name                                       |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request |

  @54859 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardAtSubPortal @jitendra
  Scenario Outline: Verify that as per 'Revised Awarded Amount', "Balance" amount is updated on Grant (SPI)
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
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
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Actuals" sub tab
    Then I see field "Awarded Budget" as "$3,000.00"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request |

  @54858 @ValidateRevisedBudgetAmountBalanceUpdatedOnGrantAtSubPortal @jitendra
  Scenario Outline: Verify that as per 'Revised Awarded Amount', "Balance" amount is updated on Grant (SPI)
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
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
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Actuals" sub tab
    Then I see field "Awarded Amount" as "$3,000.00"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request |

  @54861 @ValidateRevisedBudgetAmountBalanceUpdatedOnGrantAtSubPortal @jitendra
  Scenario Outline: Verify that as per 'Revised Awarded Amount', "Balance" amount is updated on Grant (SPI)
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Actuals" sub tab
    Then I see field "Awarded Amount" as "$3,000.00"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request |

  @54867 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardAtSubPortal @jitendra
  Scenario Outline: Verify that as per 'Revised Awarded Amount', "Balance" amount is updated on Grant (SPI)
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Budget" sub tab
    Then I see value "$3,000.00" for title "Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request |

  @54868 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardAtSubPortal @jitendra
  Scenario Outline: Verify that as per 'Revised Awarded Amount', "Balance" amount is updated on Grant (SPI)
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Actual" sub tab
    Then I see value "$3,000.00" for title "Encumbrance Balance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request |

  @54854 @ValidateRevisedBudgetAmountBalanceUpdatedOnReimbursementPaymentRequest @mahadev
  Scenario Outline: Verify that as per 'Revised Award Budget', "Balance" amount is updated on Reimbursement payment request page
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Then I see field "Awarded Budget" as "$3,000.00"
    Examples:
      | Award Name                                       | Grant Name                                       | User |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request | SPI  |

  @54865 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardBudgetTabAtGrantorSide @mahadev
  Scenario Outline: Verify that as per 'Revised Award Budget', "Balance" amount is updated on Award on budget tab at grantor side
    Given I delete the record "Automation Execution Award for Amendment Request" from the object "Payment Request"
    When I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award for Amendment Request" from the object "Progress Report"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Execution Award for Amendment Request" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantCreation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEdition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | {SavedValue:fundingAccount}          | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---subAwardStandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget |
      | Extra Salary | The narrative | 1000            |
    And I close modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter "Progress Report Schedule" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
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
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I switch to iframe with id "RecipientAmendmentRequestBudgetTableiframeContentId"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Revised Encumbrance |
      | {SavedValue:fundingAccount}          | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Budget" sub tab
    Then I see field "Total Subaward Amount this Budget Period" as "$3,000.00"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | Automation Execution Award for Amendment Request | Automation Execution Award for Amendment Request |
