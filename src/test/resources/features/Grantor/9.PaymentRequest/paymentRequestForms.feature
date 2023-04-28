@paymntRequestForms @grantor-parallel-regression @paymentRequest @regression
Feature: Payment Request Forms scenarios

 @vai @308590 @308685 @ValidateSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonform @sprint-1-US-282692 @vaibhav @Forms
  Scenario: Validate SPI user can able to save & validate form after entering correct & valid data on all fields present on form
    And I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "Preview" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "View" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "Edit" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    And I click on "Edit" icon for "Request for Advance or Reimbursement - SF-270" inside flex table with id "---paymentRequest:-:paymentRequestFormsTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0012"
    Then I softly see the text containing "Expiration Date: 01/31/2025"
    And I select below checkbox options for field "fieldAdvanaceorReimbursement__c"
    | Advance |
    And I enter "SF270_Form" values from "PaymentRequest_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:sf270ComputationAmountTableId---" by clicking "Edit" :
      | Classification                                   | Programs | Functions | Activities |
      | a. Total program outlays to date                 | 12345    | 12345     | 12345      |
      | b. Less: Cumulative program income               | 12345    | 12345     | 12345      |
      | d. Estimated net cash outlays for advance period | 12345    | 12345     | 12345      |
      | f. Non-Federal share of amount on line e         | 12345    | 12345     | 12345      |
      | g. Federal share of amount on line e             | 12345    | 12345     | 12345      |
      | h. Federal payments previously requested         | 12345    | 12345     | 12345      |
      | 1st month                                        | 12345    | 12345     | 12345      |
      | 2nd month                                        | 12345    | 12345     | 12345      |
      | 3rd month                                        | 12345    | 12345     | 12345      |
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
   #308685
   When I click on "Back" in the page details
   And I save the field labeled "EGMS ID" as "PayreqId1"
   And I navigate to "Financials" sub tab
   When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
   And I wait for "3" seconds
   When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
     | Title        | Narrative     | Unit Price | Quantity | Measurement |
     | Extra Salary | The narrative | 500        | 1        | Feet        |
   When I close "Add Line Items" modal by clicking the top right x button
   And I click on "Submit to Grantor" in the page details
   Then I softly see field "Status" as "Submitted to Grantor"
   When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
   And I navigate to "Monitoring" tab
   And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
   When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
   And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
   And I navigate to "Financials" sub tab
   And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
     | Funding Account             | Net Spent This Action |
     | {SavedValue:fundingAccount} | 500                   |
   When I navigate to "Responsibilities" sub tab
   When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
     | Name                     | Reimbursement |
     | {SavedValue:PO Username} | Step 1        |
   When I get the "EGMS ID"
   When I click on "Submit for Approval" in the page details
   Then I softly see status in Progress-bar is "Submitted For Approval" and is "green"
   When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
   And I navigate to "Monitoring" tab
   And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
   When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
   And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
   When I "Approve" in the approval decision
   When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
   And I navigate to "Monitoring" tab
   And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
   When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
   And I click on "View" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
   When I click on "Mark As Paid" in the page details
   And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
   When I click modal button "Save"
   When I close "{SavedValue:PayreqId1}" modal by clicking the top right x button
   Then I see status in Progress-bar is "Paid" and is "green"