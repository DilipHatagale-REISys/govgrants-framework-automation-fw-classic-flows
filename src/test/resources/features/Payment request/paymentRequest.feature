@paymentRequest
Feature: Validate all scenarios in Payment Request

  Background: Navigate to award
    Given I delete the record "Automation Payment Request" from the object "Payment Request"
    And I am on "SUBPORTAL" portal
    Given I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "SPI"
      | Actions    | Step 1        | Step 2                   | Step 3               | Step 4                     |
      | Navigation | Grants Portal | Grants                   | Grants and Subawards | Grants, Awards, Amendments |
      | FlexTable  | Grants        | RecipientActiveGrants    | View                 |                            |
      | Subaward   | Subawards     | RecipientsRelatedAwards1 | View                 | Active Subaward            |

  @38840 @creationOfAdhocReimbursementPaymentRequest @reimbursementPaymentRequest @paymentRequest @all
  Scenario: To create an Adhoc Reimbursement Payment Request
    When I navigate to "Requests" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "paymentRequest::paymentRequestTableId"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @38661 @EditionOfPaymentRequest @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
  Scenario: To edit an Adhoc Reimbursement Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions    | Step 1                                 | Step 2                | Step 3  |
      | Navigation | Requests                               | Reimbursement Request | Advance |
      | FlexTable  | flexGridRecipientsAwardPaymentRequests | Save and Continue     |         |
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see field "Acknowledgement" as "I Agree"

  @38660 @budgetAdditionPaymentRequest @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
  Scenario: To edit the budget an Adhoc Reimbursement Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions    | Step 1                                 | Step 2                | Step 3  |
      | Navigation | Requests                               | Reimbursement Request | Advance |
      | FlexTable  | flexGridRecipientsAwardPaymentRequests | Save and Continue     |         |
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    Given I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "paymentRequest::paymentRequestBudgetTableId" with wait for record
    When I enter the following values into flex table with id "paymentRequest::paymentLineItemsTableId" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    Then I see value "$220.00" for title "Net Payment" inside table "paymentRequest::paymentRequestBudgetTableId"

  @paymentRequestAddAttachment @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
  Scenario: Validate the attachment for Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions    | Step 1                                 | Step 2                | Step 3  |
      | Navigation | Requests                               | Reimbursement Request | Advance |
      | FlexTable  | flexGridRecipientsAwardPaymentRequests | Save and Continue     |         |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "paymentRequest::attachmentTableId"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Invoice"
    And I close Modal
    Then I see that "Invoice" has been added in flextable with Id "paymentRequest::attachmentTableId"

  @paymentRequestSendToGrantor @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
  Scenario: Send Payment Request to Grantor
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions    | Step 1                                 | Step 2                | Step 3  |
      | Navigation | Requests                               | Reimbursement Request | Advance |
      | FlexTable  | flexGridRecipientsAwardPaymentRequests | Save and Continue     |         |
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "paymentRequest::paymentRequestBudgetTableId" with wait for record
    When I enter the following values into flex table with id "paymentRequest::paymentLineItemsTableId" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2  | Step 3             |
      | Attachment Navigation | Attachments | Add     | a150b000003epDJAAY |
      | Attachment Details    | Attachment  | Invoice |                    |
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @enterFundingAccountAmountPaymentRequest @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
  Scenario: Enter Funding Account amount in Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions    | Step 1                                 | Step 2                | Step 3  |
      | Navigation | Requests                               | Reimbursement Request | Advance |
      | FlexTable  | flexGridRecipientsAwardPaymentRequests | Save and Continue     |         |
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "paymentRequest::paymentRequestBudgetTableId" with wait for record
    When I enter the following values into flex table with id "paymentRequest::paymentLineItemsTableId" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2  | Step 3             |
      | Attachment Navigation | Attachments | Add     | a150b000003epDJAAY |
      | Attachment Details    | Attachment  | Invoice |                    |
    And I click on "Submit to Grantor" in the page details
    Given I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "paymentRequest::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--125         | 1000                  |
    Then I see value "$1,000.00" for title "Net Spent This Action" inside table "paymentRequest::fundingAccountTableId"

  @approverSelectionPaymentRequest @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
  Scenario: Selection of approvers in Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions    | Step 1                                 | Step 2                | Step 3  |
      | Navigation | Requests                               | Reimbursement Request | Advance |
      | FlexTable  | flexGridRecipientsAwardPaymentRequests | Save and Continue     |         |
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Administrative and legal expenses" inside flex table with id "paymentRequest::paymentRequestBudgetTableId" with wait for record
    When I enter the following values into flex table with id "paymentRequest::paymentLineItemsTableId" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2  | Step 3             |
      | Attachment Navigation | Attachments | Add     | a150b000003epDJAAY |
      | Attachment Details    | Attachment  | Invoice |                    |
    And I click on "Submit to Grantor" in the page details
    Given I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "paymentRequest::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--125         | 1000                  |
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Fiscal Approver" inside flex table with id "flexGridPaymentRequestRolesandResponsibilities"
    When I fill in the "Automation FO" for the Approver details
    And I close Modal
    Then I see that "Automation FO" has been added in flextable with Id "flexGridPaymentRequestRolesandResponsibilities"

  @submitPaymentRequestForApproval @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
  Scenario: Submitting Payment Request for approval
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions    | Step 1                                 | Step 2                | Step 3  |
      | Navigation | Requests                               | Reimbursement Request | Advance |
      | FlexTable  | flexGridRecipientsAwardPaymentRequests | Save and Continue     |         |
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "paymentRequest::paymentRequestBudgetTableId" with wait for record
    When I enter the following values into flex table with id "paymentRequest::paymentLineItemsTableId" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2  | Step 3             |
      | Attachment Navigation | Attachments | Add     | a150b000003epDJAAY |
      | Attachment Details    | Attachment  | Invoice |                    |
    And I click on "Submit to Grantor" in the page details
    Given I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "paymentRequest::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--125         | 220                   |
    And I select "1" approvers "Automation FO"
      | Actions    | Step 1                                         | Step 2 | Step 3          |
      | Subtab     | Responsibilities                               |        |                 |
      | Approver 1 | flexGridPaymentRequestRolesandResponsibilities | Edit   | Fiscal Approver |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  @approversApprovePaymentRequest @reimbursementPaymentRequest @advancePaymentRequest @paymentRequest @all
  Scenario: Approval of Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions    | Step 1                                 | Step 2                | Step 3  |
      | Navigation | Requests                               | Reimbursement Request | Advance |
      | FlexTable  | flexGridRecipientsAwardPaymentRequests | Save and Continue     |         |
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "paymentRequest::paymentRequestBudgetTableId" with wait for record
    When I enter the following values into flex table with id "paymentRequest::paymentLineItemsTableId" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 120        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2  | Step 3             |
      | Attachment Navigation | Attachments | Add     | a150b000003epDJAAY |
      | Attachment Details    | Attachment  | Invoice |                    |
    And I click on "Submit to Grantor" in the page details
    Given I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "paymentRequest::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--125         | 220                   |
    And I select "1" approvers "Automation FO"
      | Actions    | Step 1                                         | Step 2 | Step 3          |
      | Subtab     | Responsibilities                               |        |                 |
      | Approver 1 | flexGridPaymentRequestRolesandResponsibilities | Edit   | Fiscal Approver |
    When I get the "EGMS ID"
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"

  @paidPaymentRequest @adhocReimbursementHappyPath @reimbursementPaymentRequest @paymentRequest @all
  Scenario: Paid Payment Request
    Given I create a adhoc "Reimbursement" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions    | Step 1                                 | Step 2                | Step 3  |
      | Navigation | Requests                               | Reimbursement Request | Advance |
      | FlexTable  | flexGridRecipientsAwardPaymentRequests | Save and Continue     |         |
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "paymentRequest::paymentRequestBudgetTableId" with wait for record
    When I enter the following values into flex table with id "paymentRequest::paymentLineItemsTableId" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 100        | 1        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2  | Step 3             |
      | Attachment Navigation | Attachments | Add     | a150b000003epDJAAY |
      | Attachment Details    | Attachment  | Invoice |                    |
    And I click on "Submit to Grantor" in the page details
    And I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "paymentRequest::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--125         | 200                   |
    And I select "1" approvers "Automation FO"
      | Actions    | Step 1                                         | Step 2 | Step 3          |
      | Subtab     | Responsibilities                               |        |                 |
      | Approver 1 | flexGridPaymentRequestRolesandResponsibilities | Edit   | Fiscal Approver |
    When I get the "EGMS ID"
    Given I click on "Submit for Approval" in the page details
    Given "1" Approvers "FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Given I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Approved" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    Then I see status in Progress-bar is "Paid" and is "green"

  @adhocAdvanceHappyPath @advancePaymentRequest @paymentRequest @all
  Scenario: Advance Payment Request happy path
    Given I create a adhoc "Advance" Payment Request from sheet "Adhoc Reimbursement Creation" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions    | Step 1                                 | Step 2                | Step 3  |
      | Navigation | Requests                               | Reimbursement Request | Advance |
      | FlexTable  | flexGridRecipientsAwardPaymentRequests | Save and Continue     |         |
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "paymentRequest::paymentRequestAdvanceTableId" by clicking "Edit" :
      | Budget Category | Advance Requested |
      | Construction    | 500               |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2  | Step 3             |
      | Attachment Navigation | Attachments | Add     | a150b000001rvK3AAI |
      | Attachment Details    | Attachment  | Invoice |                    |
    And I click on "Submit to Grantor" in the page details
    And I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "PaymentFundingAccountsAdvanceFlexToggle" by clicking "Edit" :
      | Funding Account | Advance Requested This Action |
      | FA--125         | 500                           |
    And I select "1" approvers "Automation FO"
      | Actions    | Step 1                                         | Step 2 | Step 3          |
      | Subtab     | Responsibilities                               |        |                 |
      | Approver 1 | flexGridPaymentRequestRolesandResponsibilities | Edit   | Fiscal Approver |
    When I get the "EGMS ID"
    Given I click on "Submit for Approval" in the page details
    Given "1" Approvers "FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Given I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Approved" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    Then I see status in Progress-bar is "Paid" and is "green"

  @scheduledReimbursementHappyPath @reimbursementPaymentRequest @paymentRequest @all
  Scenario: Scheduled Payment Request happy path
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Reimbursement" inside flex table with id "flexGridEnhancedDivIdRecipientsAwardPaymentRequests" with wait for record
    When I get the "EGMS ID"
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I complete the fields from the sheet "Edition" in excel "PaymentRequest_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "paymentRequest::paymentRequestBudgetTableId" with wait for record
    When I enter the following values into flex table with id "paymentRequest::paymentLineItemsTableId" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1          | 0        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2  | Step 3             |
      | Attachment Navigation | Attachments | Add     | a150b000003epDJAAY |
      | Attachment Details    | Attachment  | Invoice |                    |
    And I click on "Submit to Grantor" in the page details
    And I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "paymentRequest::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--125         | 100                   |
    And I select "1" approvers "Automation FO"
      | Actions    | Step 1                                         | Step 2 | Step 3          |
      | Subtab     | Responsibilities                               |        |                 |
      | Approver 1 | flexGridPaymentRequestRolesandResponsibilities | Edit   | Fiscal Approver |
    When I get the "EGMS ID"
    Given I click on "Submit for Approval" in the page details
    Given "1" Approvers "FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Given I login and view the "Active" award "Record Id" with name "Permanent Award for Automation" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Approved" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    Then I see status in Progress-bar is "Paid" and is "green"