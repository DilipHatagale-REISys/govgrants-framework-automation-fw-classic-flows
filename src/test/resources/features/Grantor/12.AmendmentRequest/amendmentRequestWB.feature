@amendmentRequests @grantor-regression @grantor-parallel-regression
Feature: Amendment Request scenarios without background

  @54853 @ValidateRevisedBudgetAmountBalanceUpdatedOnAdvancePaymentRequest @mahadev @smoke @buglogged101406
  Scenario Outline: Verify that as per 'Revised Award Budget', "Balance" amount is updated on advance payment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Then I see field "Awarded Budget" as "$3,000.00"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @54862 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardOnActualsTabAtGrantorSide @mahadev
  Scenario Outline: Verify that as per 'Revised Award Budget', "Balance" amount is updated on Award at grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I see field "Awarded Budget" as "$3,000.00"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @54864 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardBudgetTabAtGranteeSide @mahadev
  Scenario Outline: Verify that as per 'Revised Award Budget', "Balance" amount is updated on Award on budget tab at grantee side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I see field "Total Subaward Amount this Budget Period" as "$3,000.00"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @57277 @verifyValidationErrorMessageIfRequestedBudgetFieldChangeEnteredLessThanRequestedAmount @mahadev @smoke
  Scenario Outline: Verify validation error message is shown if Requested Change in Budget field is given less than the requested amount at Sub-recipient
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 300            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - You have a requested a change of $300.0, but the required change is -$-500.00. |
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @54859 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardAtSubPortal @jitendra
  Scenario Outline: Verify that as per 'Revised Awarded Amount', "Balance" amount is updated on Grant (SPI)
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I see field "Awarded Budget" as "$3,000.00"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @54858 @ValidateRevisedBudgetAmountBalanceUpdatedOnGrantAtSubPortal @jitendra
  Scenario Outline: Verify that as per 'Revised Awarded Amount', "Balance" amount is updated on Grant (SPI)
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I see field "Awarded Amount" as "$3,000.00"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @54861 @ValidateRevisedBudgetAmountBalanceUpdatedOnGrantAtSubPortal @jitendra
  Scenario Outline: Verify that as per 'Revised Awarded Amount', "Balance" amount is updated on Grant (SPI)
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:internalActiveGrants---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:internalActiveGrants---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I see field "Awarded Amount" as "$3,000.00"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @54867 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardAtSubPortal @jitendra
  Scenario Outline: Verify that as per 'Revised Awarded Amount', "Balance" amount is updated on Grant (SPI)
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:internalActiveGrants---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:internalActiveGrants---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:internalRelatedAwards1---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I see value "$3,000.00" for title "Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @54868 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardAtSubPortal @jitendra
  Scenario Outline: Verify that as per 'Revised Awarded Amount', "Balance" amount is updated on Grant (SPI)
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:internalActiveGrants---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:internalActiveGrants---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:internalRelatedAwards1---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I see value "$3,000.00" for title "Encumbrance Balance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @54854 @ValidateRevisedBudgetAmountBalanceUpdatedOnReimbursementPaymentRequest @mahadev @smoke
  Scenario Outline: Verify that as per 'Revised Award Budget', "Balance" amount is updated on Reimbursement payment request page
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Project inspection fees" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Then I see field "Awarded Budget" as "$3,000.00"
    Examples:
      | Award Name                                      | Grant Name                                      | User |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} | SPI3 |

  @54865 @ValidateRevisedBudgetAmountBalanceUpdatedOnAwardBudgetTabAtGrantorSide @mahadev
  Scenario Outline: Verify that as per 'Revised Award Budget', "Balance" amount is updated on Award on budget tab at grantor side
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Budget" sub tab
    Then I see field "Total Subaward Amount this Budget Period" as "$3,000.00"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @61721 @SVCopiedToNewCreatedAwardForAmendmentTypBudgetPeriodChangeAmendment @keerti @smoke
  Scenario: Validate Site Visits is carry forwarded in created status to new created award when amendment type is Budget Period Change Amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SiteVisitID"
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "fieldNewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I navigate to "Management" tab
    Then I see value "Created" for title "Status" against the value "{SavedValue:SiteVisitID}" inside table "---sitevisits:-:grantorSiteVisitsTableID---"

  @61723 @68079 @SVcopiedToNewCreatedAwardForAmendmentTypeFundingChange @keerti @smoke
  Scenario:Validate Site Visits is copied to new created award when amendment type - Funding Change
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SiteVisitID"
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "fieldNewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    And I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Monitoring" tab
    Then I softly see value "In progress" for title "Status" against the value "Record Id" inside table "---subAwardStandAlone:-:riskAssessmentTableId---"

  @97302 @ValidateTaskGeneratedToSubRecipient @monu
  Scenario: Verify task is getting generated for sub recipient for SOW amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "---amendment:-:approversTableId---"
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "Green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"

  @97073 @97056 @96667 @ValidateUpdationOfKeyPersonalByPrimaryApplicant-PeriodicRenewal @monu
  Scenario: Verify subrecipient user is able to update Key personal information for periodic renewal amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    #96667 #monu
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "---amendment:-:approversTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Principal Investigator" for title "Project Role" inside table "---amendment:-:RecipientKeyPersonalTableId---"
    #97056 #monu
    And I click on "Edit" icon for "Economic Development" inside flex table with id "---amendment:-:RecipientKPITableId---" without waiting for record
    And I enter value "20" into field "Target__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKPITableId---"
    And I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "20" for title "Target" inside table "---amendment:-:RecipientKPITableId---"

  @97759 @ValidateAssociationOfKPIByInternalUser-PeriodicRenewal @monu
  Scenario: Verify Internal user is able to associate KPI to periodic renewal Amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---amendment:-:AmendmentKPITableId---"
    And I enter values into fields
      | Value                    | Field             |
      | Automation Execution KPI | fieldMasterKPI__c |
      | 10                       | fieldTarget__c    |
    And I click modal button "Save"
    When I close "Associate" modal by clicking the top right x button
    Then I softly see value "Automation Execution KPI" for title "Title" inside table "---amendment:-:AmendmentKPITableId---"
    And I click on "Edit" icon for "Automation Execution KPI" inside flex table with id "---amendment:-:AmendmentKPITableId---" without waiting for record
    And I enter value "20" into field "Target__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentKPITableId---"
    And I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "20" for title "Target" inside table "---amendment:-:AmendmentKPITableId---"

  @97443 @ValidateSubmissionOfAmendmentRequestToGrantorBySubrecipient-PeriodicRenewal @monu
  Scenario: Verify sub recipient user is able to submit the amendment request to grantor for periodic renewal amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "---amendment:-:approversTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "New" :
      | Title                      | Narrative | Awarded Budget | Other Leverage |
      | Automation Budget Category | Test      | 1000           | 0              |
    Then I softly see value "Automation Budget Category" for title "Title" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "Test" for title "Narrative" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "$1,000.00" for title "Awarded Budget" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    And I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"

  @97708 @ValidateSubrecipientAbleToEditBudgetChangeDetails-PeriodicRenewal @monu
  Scenario: Verify sub recipient user is able to edit budget change details at subportal
    And I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "---amendment:-:approversTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I click on "Add Line Items" icon for "Administrative and legal expenses" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "New" :
      | Title                      | Narrative | Awarded Budget | Other Leverage |
      | Automation Budget Category | Test      | 2500           | 100            |
    Then I softly see value "Automation Budget Category" for title "Title" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "Test" for title "Narrative" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "$2,500.00" for title "Awarded Budget" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    And I close "Add Line Items" modal by clicking the top right x button
    And I click on "Add Line Items" icon for "Administrative and legal expenses" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I click on "Edit" icon for "Automation Budget Category" inside flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" without waiting for record
    And I enter value "Automation Budget Category1" into field "Title__c"
    And I enter value "Test1" into field "Narrative__c"
    And I enter value "2500" into field "BudgetRequest__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "Automation Budget Category1" for title "Title" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    And I close "Add Line Items" modal by clicking the top right x button
    Then I softly see value "$2,500.00" for title "Revised Subaward Budget" inside table "---amendment:-:BudgetChangeTableId---"

  @97471 @ValidateRejectFunctionalityForAmenedmentWithInternalUser-PeriodicRenewal @monu
  Scenario: Verify internal user is able to reject periodic renewal amendment reques
    And I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "---amendment:-:approversTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" without waiting for record
    When I enter the following values into flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "New" :
      | Title                      | Narrative | Awarded Budget | Other Leverage |
      | Automation Budget Category | Test      | 1000           | 0              |
    Then I softly see value "Automation Budget Category" for title "Title" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "Test" for title "Narrative" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "$1,000.00" for title "Awarded Budget" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    And I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    And I click on "Submit for Approval" in the page details
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"

  @97466 @97446 @97765 @97761 @ValidateApproveFunctionalityForAmendmentWithInternalUser-PeriodicRenewal @monu
  Scenario: Verify internal user is able to approve periodic renewal amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "---amendment:-:approversTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" without waiting for record
    When I enter the following values into flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "New" :
      | Title                      | Narrative | Awarded Budget | Other Leverage |
      | Automation Budget Category | Test      | 1000           | 0              |
    Then I softly see value "Automation Budget Category" for title "Title" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "Test" for title "Narrative" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "$1,000.00" for title "Awarded Budget" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    And I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    #97446 #monu
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    #97765 #monu
    And I click on "Amend Subaward" in the page details
    Then I see that "{SavedValue:Automation Runtime Award}" is in "Pending Activation" status
    #97761 #monu
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I click on "Delete" in the page details
    Then I see that "{SavedValue:Automation Runtime Award}" is in "Submitted to Grantor" status

  @97764 @ValidateActivationOfAmendmentRequestWithInternalUser-PeriodicRenewal @monu
  Scenario: Verify internal user is able to activate periodic renewal amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "---amendment:-:approversTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" without waiting for record
    When I enter the following values into flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "New" :
      | Title                      | Narrative | Awarded Budget | Other Leverage |
      | Automation Budget Category | Test      | 1000           | 0              |
    Then I softly see value "Automation Budget Category" for title "Title" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "Test" for title "Narrative" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "$1,000.00" for title "Awarded Budget" inside table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    And I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Amend Subaward" in the page details
    Then I see that "{SavedValue:Automation Runtime Award}" is in "Pending Activation" status
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Activated" and is "Green"

  @97457 @ValidateAddEditDeleteOfFundingAccount-PeriodicRenewal @monu
  Scenario: Verify internal user is able to Add edit delete funding account
    And I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    When I perform quick search for "FA-ST-11" in "---amendment:-:AssociateFundingAccountTableId---" panel
    When I click "Add" after selection of "FA-ST-11" in the table "---amendment:-:AssociateFundingAccountTableId---"
    And I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I softly see value "FA-ST-11" for title "Funding Account" inside table "---amendment:-:AmendmentFundingAccountTableId---"
    And I click on "Edit" icon for "FA-ST-11" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    Then I softly see value "$1,000.00" for title "Revised Encumbrance" inside table "---amendment:-:AmendmentFundingAccountTableId---"
    And I click on "Remove" icon for "FA-ST-11" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    Then I softly do not see value "FA-ST-11" for title "Funding Account" inside table "---amendment:-:AmendmentFundingAccountTableId---"

  @96668 @ValidateInternalUserIncreaseFundingAmount-PeriodicRenewal @monu
  Scenario: Verify internal user is able to increase funding amount for periodic renewal amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "2000" into field "fieldRequestedChangeInBudget__c"
    When I click on "Save" in the page details
    Then I softly see field "Awarded Budget this Period" as "$2,000.00"

  @97049 @97053 @ValidateAddEditDeleteOfFocusArea-PeriodicRenewal @monu
  Scenario Outline: Verify internal user is able to Add edit delete focus area
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on top right button "Associate" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    When I perform quick search for "<Focus Area>" in "---amendment:-:focusAreaTableId---" panel
    When I click "Associate" after selection of "<Focus Area>" in the table "---amendment:-:focusAreaTableId---"
    When I close "Focus Areas" modal by clicking the top right x button
    Then I see that "<Focus Area>" has been added in flextable with Id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    Then I softly see value "{SavedValue:PBPSD}" for title "Start Date" inside table "---amendment:-:FundingChangeFocusAreaTableId---"
    Then I softly see value "{SavedValue:PBPED}" for title "End Date" inside table "---amendment:-:FundingChangeFocusAreaTableId---"
    And I click on "Remove" icon for "<Focus Area>" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    Then I softly do not see value "<Focus Area>" for title "Title" inside table "---amendment:-:FundingChangeFocusAreaTableId---"
    #97053 #monu
    And I click on top right button "New" in flex table with id "---amendment:-:AmendmentSpecialConditionTableId---"
    And I enter in modal value "Automation Special Conditions" into field "fieldTitle__c"
    And I enter in modal value "Automation Special Conditions description" into field "cke_1_contents"
    And I enter in modal value "0" into field "fieldEffectiveFrom__c"
    And I enter in modal value "1" into field "fieldEffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    Then I softly see value "Automation Special Conditions" for title "Name" inside table "---amendment:-:AmendmentSpecialConditionTableId---"
    And I click on "Edit" icon for "Automation Special Conditions" inside flex table with id "---amendment:-:AmendmentSpecialConditionTableId---" without waiting for record
    And I enter in modal value "Automation Special Conditions1" into field "fieldTitle__c"
    And I enter in modal value "Automation Special Conditions description1" into field "cke_1_contents"
    Then I softly see value "Automation Special Conditions1" for title "Name" inside table "---amendment:-:AmendmentSpecialConditionTableId---"

    Examples:
      | Focus Area                       |
      | Automation Permanent Focus Area2 |

  @97145 @97150 @ValidatePrimaryApplicantCanEditAward-SOW @monu
  Scenario: Verify primary applicant can edit award title and description for SOW amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_SOW_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    When I click on "Edit" in the page details
    And I enter values into fields
      | Value                                | Field                         |
      | Award Created From Automation API123 | fieldGrantAwardDescription__c |
    #97150 #monu
    And I enter value "12346" into field "fieldZip4__c"
    And I enter value "VA" into field "fieldState__c"
    When I click on "Save" in the page details
    Then I softly see field "State" as "VA"
    Then I softly see field "Zip Code" as "12346"
    Then I softly see field "Subaward Details" as "Award Created From Automation API123"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Delete" in page detail
    Then I softly can see top right button "Submit to Grantor" in page detail

  @97766 @ValidateCreationOfAmendMentRequestBySubRecipient-BudgetPeriodChange @monu
  Scenario: Verify sub recipient user is able to create Budget period change Amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "fieldNewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"

  @97200 @ValidateAssociationOfKPIBySubrecipient-SOWAmendmentRequest @monu @wip
  Scenario: Verify Subrecipient user is able to associate KPI on SOW amendment request created by internal user
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---" without waiting for record
    Then I softly can see top right button "Associate" in flex table with id "---amendment:-:RecipientKPITableId---"
    When I click on top right button "Associate" in flex table with id "---amendment:-:RecipientKPITableId---"
    And I enter values into fields
      | Value                    | Field             |
      | Automation Execution KPI | fieldMasterKPI__c |
      | 10                       | fieldTarget__c    |
    And I click modal button "Save"
    When I close "Grantor Amendment KPIs" modal by clicking the top right x button
    Then I softly see value "Automation Execution KPI" for title "Title" inside table "---amendment:-:RecipientKPITableId---"

  @99213 @99239 @99224 @99235 @VerifySubRecipientAbleToCreateAmendmentRequest-BudgetRedirection @monu
  Scenario: Validate that subrecipient user able to create Budget Redirection Amendment
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Edit3" values from "Award_Field_Values.xlsx"
    And I enter value "10" into field "BudgetRedirectionThreshhold__c"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I pause execution for "5" seconds
    And I click on submit review
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "green"
    #99239 #monu
    And I enter value "Automation Justification" into field "fieldJustification__c"
    And I click on "Save" in the page details
    #99224 #monu #needtocheck
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget |
      | Extra Salary | The narrative | 1000           |
    When I close "Add Line Items" modal by clicking the top right x button
    Then I softly see value "$1,000.00" for title "Revised Subaward Budget" against the value "Site work" inside table "---amendment:-:budgetChangeTableId---"
    And I click on "Submit to Grantor" in the page details
    #99235 #monu
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see field "Status" as "Under Revision"

  @96613 @ValidateEditOfBudgetChangeBySubRecipient-FundingChange @smoke
  Scenario Outline: Verify that Sub recipient user is able to edit budget change of Funding change amendment request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
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
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Site work" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget | Cash Match | Non Cash Match |
      | Extra Salary | The narrative | 1000           | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    Then I softly see value "$1,000.00" for title "Revised Subaward Budget" against the value "Site work" inside table "---amendment:-:budgetChangeTableId---"

    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @98486 @97986 @98488 @creationOfKeyPersonalChangeAmendmentRequest-KPCAmendmentRequest @monu
  Scenario: Creation of KPC Amendment Request
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Subrecipient"
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I click on "Save" in the page details
    #97986 #monu
    And I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Principal Investigator" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Principal Investigator" for title "Project Role" inside table "---amendment:-:RecipientKeyPersonalTableId---"
    #98488 #monu
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Delete" in page detail
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Delete" in the page details
    And I navigate to "Management" sub tab
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"

  @99264 @ValidatePBPEDIsGreaterThanPBPSD-PeriodicRenewal @monu
  Scenario: Verify Proposed budget period end date is grater than Proposed budget Period Start date at periodic renewal amendment request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "4100" into field "fieldProposedBudgetEndDate__c"
    When I click on "Save" in the page details
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    Then I see field "{SavedValue:PBPED}" contains date greater than "{SavedValue:PBPSD}" date

  @99269 @100037 @VerifyStatusInFieldHistoryTable-KPCAmendmentRequest @monu
  Scenario: Validate status of key personal change Amendment request in field history table after submit to grantor
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Other" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    And I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Other" for title "Project Role" inside table "---amendment:-:RecipientKeyPersonalTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Submitted to Grantor" for title "New Value" inside table "History"
    Then I softly see value "Created" for title "Old Value" inside table "History"
    #100037 #monu
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:EXE Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |

  @100428 @100433 @100454 @VerifyTaskCreationForExecutiveApprover-KPCAmendmentRequest @monu
  Scenario: Validate Approval task is creating created for Executive approver once fiscal approved the amendment request
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---amendment:-:RecipientKeyPersonalTableId---" without waiting for record
    And I enter value "Other" into field "ProjectRole__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    Then I softly see value "Other" for title "Project Role" inside table "---amendment:-:RecipientKeyPersonalTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---subAwardStandAlone:-:pendingTaskTableId---"
    #100433 #monu
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "History" sub tab
    And I see "{SavedValue:EXE Username}" against "Executive Approval" in approval history
    Then I softly see column "Overall Status" inside row "1" at position "1" contains text "Approved"
    #100454 #monu
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I softly can see top right button "Amend Subaward" in page detail

  @98480 @validateRejectionOfAmendmentRequestByInternalUser-TCAmendmentRequest @monu
  Scenario: Validate Internal user is able to reject terms and conditions Amendment Request
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field               |
      | Automation Justification | fieldTncComments__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    #When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I perform quick search for "{SavedValue:AmendmentId}"
    And I click on "Start" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"

  @99608 @99629 @verifyCreationOfAmendmentRequest-CFAmendmentRequest @monu
  Scenario: Validate sub recipient user is able to create carry Forward Amendment Request
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Subaward Budget | Cash Match | Non Cash Match |
      | Construction    | 1000                    | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldPurposeRTA__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "Green"
    #99629 #monu
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"