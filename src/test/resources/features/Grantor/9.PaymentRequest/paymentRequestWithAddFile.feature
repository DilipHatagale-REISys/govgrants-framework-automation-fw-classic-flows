@paymentRequestWithBackground @paymentRequest @grantor-regression @grantor-parallel-regression @paymentRequest-check @regression
Feature: Validate all scenarios in Payment Request With add file

  @193832 @VerifySPIusercanaddfileonadhocreimbursementPRifuserhaseditaccessontopeditbuttonforPRincreatedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify SPI user can add file on ad-hoc reimbursement PR if user has edit access on top edit button for PR in created state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Then I can see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:reimbursementAddFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Invoice" from computer
    Then I softly see "{SavedValue:Attachment.pdf}" has been added in "Reimbursement Files" flex table

  @193834 @VerifySPAusercanaddfileonadhocreimbursementPRifuserhaseditaccessontopeditbuttonforPRincreatedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify SPA user can add file on ad-hoc reimbursement PR if user has edit access on top edit button for PR in created state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Then I can see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:reimbursementAddFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Invoice" from computer
    Then I softly see "{SavedValue:Attachment.pdf}" has been added in "Reimbursement Files" flex table

  @193842 @VerifyINDusercanaddfileonschedulereimbursementPRifuserhaseditaccessontopeditbuttonforPRincreatedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify IND user can add file on schedule reimbursement PR if user has edit access on top edit button for PR in created state
    Given I activated standalone subaward "Automation Runtime Award" with properties "SUBRECIPIENT_ORG_IND_USER-Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 10         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    Then I see status in Progress-bar is "Created" and is "green"
    Then I can see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:reimbursementAddFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Invoice" from computer
    Then I softly see "{SavedValue:Attachment.pdf}" has been added in "Reimbursement Files" flex table
