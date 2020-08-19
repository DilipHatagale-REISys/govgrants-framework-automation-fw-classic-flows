@paymentRequest @grantor-regression @grantor-parallel-regression
Feature: Scheduled Reimbursement Payment Request Scenarios

  @38313 @taskCreationForSubrecipientUser @mahadev
  Scenario Outline: Validate task is getting created for SPI user
    And I activated standalone subaward "Automation Runtime award" with properties "default"
    Given I delete the record "<Award Name>" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "<Award Name>" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Login User>" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---paymentRequest:-:pendingTaskTableId---"
    Examples:
      | Award Name                            | Login User |
      | {SavedValue:Automation Runtime award} | SPI3        |
      | {SavedValue:Automation Runtime award} | SPA        |

  @55398 @submittedPRDisplayedInCompletedTask @mahadev
  Scenario Outline: Validate submitted payment request displays under completed task for SPI user
    And I activated standalone subaward "Automation Runtime award" with properties "default"
    Given I delete the record "<Award Name>" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "<Award Name>" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 10         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:completedTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---paymentRequest:-:completedTaskTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime award} |