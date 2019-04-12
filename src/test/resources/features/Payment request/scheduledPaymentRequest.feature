@scheduledPaymentRequest
Feature: Scheduled Payment Request Happy Path

  Background: Navigate to award
    When I am on "SUBPORTAL" portal
    Given I login and view the "Active" award "Record Id" with name "Automation Execution Award For Regression" as User "SPI"
      | Actions    | Step 1        | Step 2                   | Step 3               | Step 4                     |
      | Navigation | Grants Portal | Grants                   | Grants and Subawards | Grants, Awards, Amendments |
      | FlexTable  | Grants        | RecipientActiveGrants    | View                 |                            |
      | Subaward   | Subawards     | RecipientsRelatedAwards1 | View                 | Active Subaward            |

  @scheduledReimbursementHappyPath
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
    And I login and view the "Active" award "Record Id" with name "Automation Execution Award For Regression" as User "FO"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 | Active Subaward               |
    And I navigate to "Requests" sub tab
    Given I click on "View" icon for "Submitted to Grantor" inside flex table with id "paymentRequest::grantorPaymentRequestTableId"
    And I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "paymentRequest::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--154         | 100                   |
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
    Given I login and view the "Active" award "Record Id" with name "Automation Execution Award For Regression" as User "FO"
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