@paymentRequest @regression
Feature: Validate all scenarios in Payment Request

  Background: Navigate to award
    Given I delete the record "Automation Payment Request" from the object "Payment Request"
    Given I delete the record "Automation Permanent Award" from the object "Payment Request"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Awards, Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "Automation Permanent Award" in "---paymentRequest:-:recipient_Grant_Table_Id---" panel
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "---paymentRequest:-:recipient_Grant_Table_Id---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "---paymentRequest:-:recipient_Award_Table_Id---"

  @38840 @creationOfAdhocReimbursementPaymentRequest @smoke
  Scenario: To create an Adhoc Reimbursement Payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51067 @EditionOfPaymentRequest
  Scenario: To edit an Adhoc Reimbursement Payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see field "Acknowledgement" as "I Agree"

  @38660 @budgetAdditionPaymentRequest @smoke
  Scenario: To edit the budget an Adhoc Reimbursement Payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    Then I see that "$220.00" has been added in flextable with Id "---paymentRequest:-:paymentRequestBudgetTableId---"

  @51068 @paymentRequestAddAttachment
  Scenario: Validate the attachment for Payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "---paymentRequest:-:attachment_Table_Id---"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Invoice"
    And I close Modal
    Then I see that "Invoice" has been added in flextable with Id "---paymentRequest:-:attachment_Table_Id---"

  @51069 @paymentRequestSendToGrantor
  Scenario: Send Payment Request to Grantor
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @51070 @enterFundingAccountAmountPaymentRequest @smoke
  Scenario Outline: Enter Funding Account amount in Payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantor_grants_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantor_Award_Table_Id---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--01          | 1000                  |
    Then I see value "$1,000.00" for title "Net Spent This Action" inside table "---paymentRequest:-:fundingAccountTableId---"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Permanent Award | Automation Permanent Award |

  @51071 @approverSelectionPaymentRequest
  Scenario Outline: Selection of approvers in Payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantor_grants_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantor_Award_Table_Id---"
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--01          | 1000                  |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approvers_TableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    Then I see that "Automation FO" has been added in flextable with Id "---paymentRequest:-:approvers_TableId---"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Permanent Award | Automation Permanent Award |

  @51072 @submitPaymentRequestForApproval @smoke
  Scenario Outline: Submitting Payment Request for approval
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantor_grants_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantor_Award_Table_Id---"
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--01          | 1000                  |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approvers_TableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Permanent Award | Automation Permanent Award |

  @51073 @approversApprovePaymentRequest
  Scenario Outline: Approval of Payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantor_grants_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantor_Award_Table_Id---"
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--01          | 220                   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approvers_TableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTask_Table_Id---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Permanent Award | Automation Permanent Award |

  @51074 @adhocReimbursementHappyPath @smoke
  Scenario Outline: Paid Payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "-paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantor_grants_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantor_Award_Table_Id---"
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--01          | 220                   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approvers_TableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTask_Table_Id---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    Then I see status in Progress-bar is "Paid" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Permanent Award | Automation Permanent Award |

  @51075 @adhocAdvanceHappyPath @smoke
  Scenario Outline: Advance Payment Request happy path
    When I navigate to "Requests" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestAdvanceTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 500                           |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "---paymentRequest:-:attachment_Table_Id---"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Invoice"
    And I close Modal
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantor_grants_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantor_Award_Table_Id---"
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:advance_Funding_Account_TableId---" by clicking "Edit" :
      | Funding Account | Advance Requested This Action |
      | FA--01          | 500                           |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approvers_TableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I click on "Submit for Approval" in the page details
    When I click on "Approve" on the approval decision box
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Awards, Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipient_Grant_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipient_Grant_Table_Id---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipient_Award_Table_Id---"
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantor_grants_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    And I navigate to "Financials" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--01          | 220                   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approvers_TableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTask_Table_Id---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    Then I see status in Progress-bar is "Paid" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Permanent Award | Automation Permanent Award |

  @38835 @paymentRequestRejectionByFOUser @mahadev
  Scenario: Validate the Payment request Rejection by FO user
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I navigate to "Financials" sub tab
    When I click on "Disallow Amount" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequest_Disallow_TableId---" by clicking "Edit" :
      | Title        | Disallowed Amount | Disallowed Amount Reason    |
      | Extra Salary | 100               | Automation Test Description |
    And I close modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approvers_TableId---" by clicking "Edit" :
      | Responsibility  | Name           | Description                 |
      | Fiscal Approver | Automation EXE | Automation Test Description |
    And I navigate to "Financials" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--01          | 120                   |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---paymentRequest:-:pendingTask_Table_Id---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTask_Table_Id---"
    And I click on "Disapprove" on the approval decision box
    Then I see status in Progress-bar is "Rejected" and is "Red"

  @38838 @paymentRequestReSubmitAfterCorrection @mahadev
  Scenario: Approval of Payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--01          | 220                   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approvers_TableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTask_Table_Id---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Unit Price |
      | Extra Salary | The narrative | 120        |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"

  @38837 @PRsendBackToOwner @mahadev
  Scenario: Approver send back payment request to owner
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--01          | 220                   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approvers_TableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I click on "Send to Owner" on the approval decision box
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"

  @38742 @taskCreationforFOUser @mahadev
  Scenario: Validate task creation for fiscal user
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"

  @53845 @paymentRequestAccessibleToSPIandSPA @mahadev
  Scenario Outline: Validate task creation for fiscal user
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Awards, Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipient_Grant_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipient_Grant_Table_Id---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipient_Award_Table_Id---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
    And I enter value "I Disagree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    Then I see field "Acknowledgement" as "I Disagree"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Permanent Award | Automation Permanent Award |

  @53846 @SPAUserNotAbleToSubmitPaymentRequest @mahadev
  Scenario Outline: Validate SPA user not able to submit payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Awards, Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipient_Grant_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipient_Grant_Table_Id---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipient_Award_Table_Id---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I cannot see top right button "Submit to Grantor" in page detail
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Permanent Award | Automation Permanent Award |

  @53841 @CreationOfAdvancePaymentRequest @mahadev
  Scenario: Advance Payment Request creation
    When I navigate to "Requests" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"

  @53844 @editionOfAdvancePaymentRequestBySPIUser @mahadev
  Scenario: edition of advance payment request
    When I navigate to "Requests" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Awards, Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipient_Grant_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipient_Grant_Table_Id---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipient_Award_Table_Id---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see field "Acknowledgement" as "I Agree"