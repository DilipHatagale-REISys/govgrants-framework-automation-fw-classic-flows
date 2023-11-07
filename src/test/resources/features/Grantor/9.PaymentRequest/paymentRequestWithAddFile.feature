@paymentRequestWithBackground @paymentRequest @grantor-regression @grantor-parallel-regression @paymentRequest-check @regression
Feature: Validate all scenarios in Payment Request With add file

  @193832 @VerifySPIusercanaddfileonadhocreimbursementPRifuserhaseditaccessontopeditbuttonforPRincreatedstate @sprint-14-US-225425 @hitesh 
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
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Reimbursement Files" flex table

  @193834 @VerifySPAusercanaddfileonadhocreimbursementPRifuserhaseditaccessontopeditbuttonforPRincreatedstate @sprint-14-US-225425 @hitesh 
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
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Reimbursement Files" flex table

  @193842 @VerifyINDusercanaddfileonschedulereimbursementPRifuserhaseditaccessontopeditbuttonforPRincreatedstate @sprint-14-US-225425 @hitesh 
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
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Reimbursement Files" flex table

  @193863 @193866 @VerifySPIusercannotaddfileonadhocreimbursementPRinsubmittograntorstate @sprint-14-US-225425 @hitesh 
  Scenario:Verify SPI user can not add file on ad-hoc reimbursement PR in submit to grantor state
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
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:reimburseFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:reimbursementAddFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Invoice" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:reimburseFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Reimbursement Files" flex table

  @193868 @VerifyEXEusercannotseetopleveleditbuttonandabletoaddfileonAdvancePRinsubmittograntorstate @sprint-14-US-225425 @hitesh 
  Scenario:Verify EXE user can not see top level edit button and able to add file on Advance PR in submit to grantor state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation EXE user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:advanceFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:reimbursementAddFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Invoice" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:advanceFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Reimbursement Files" flex table


