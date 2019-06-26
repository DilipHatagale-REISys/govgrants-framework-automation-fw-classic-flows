@scheduledPaymentRequest @regression
Feature: Scheduled Payment Request Happy Path

  @51076 @scheduledReimbursementPaymentRequestHappyPath @smoke
  Scenario Outline: Scheduled Payment Request happy path
    Given I delete the record "<Award Name>" from the object "Payment Request"
    Given I delete the record "Automation Payment Request" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "Automation Permanent Award" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTask_Table_Id---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1          | 0        | Feet        | 100               | 0               | 200                      | 100        | 100            |
    When I close modal by clicking the top right x button
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
    Given I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Net Spent This Action |
      | FA--01          | 100                   |
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approvers_TableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I click on "Approve" on the approval decision box
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    Then I see status in Progress-bar is "Paid" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Permanent Award | Automation Permanent Award |

  @38313 @taskCreationForSPIUser @mahadev
  Scenario Outline: Scheduled Payment Request happy path
    Given I delete the record "<Award Name>" from the object "Payment Request"
    Given I delete the record "Automation Payment Request" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "Automation Permanent Award" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTask_Table_Id---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---paymentRequest:-:pendingTask_Table_Id---"
    Examples:
      | Award Name                 |
      | Automation Permanent Award |

