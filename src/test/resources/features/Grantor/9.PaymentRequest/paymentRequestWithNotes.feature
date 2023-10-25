@paymentRequestWithBackground @paymentRequest @grantor-regression @grantor-parallel-regression @paymentRequest-check @regression
Feature: Validate all scenarios in Payment Request With Notes

  @236237 @VerifyPMPOEXEADMINFDsameOrgusershouldbeabletoAddnotesbutEditDeletetheirownnotesonadhocreimbursementpaymentrequestisinSubmittograntorstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/PO/EXE/ADMIN/FD same Org user should be able to 'Add' notes but 'Edit/Delete' their own notes on ad-hoc reimbursement payment request is in 'Submit to grantor' state
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
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |  Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |  20                       | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PM  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PO  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation EXE | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation ADMIN" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By       | Title         | Description      |
      |Automation ADMIN | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation FD" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation FD | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236238 @VerifyPMPOADMINFOsameOrgusershouldbeabletoAddnotesbutEditDeletetheirownnotesonschedulereimbursementpaymentrequestisinSubmittograntorstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/PO/ADMIN//FO same Org user should be able to 'Add' notes but 'Edit/Delete' their own notes on schedule reimbursement payment request is in 'Submit to grantor' state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
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
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PM  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PO  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation ADMIN" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By       | Title         | Description      |
      |Automation ADMIN | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation FD | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"