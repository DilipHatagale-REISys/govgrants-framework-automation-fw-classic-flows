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

  @236252 @VerifyPMPOFDusershouldnotabletoAddnotesnotesonadhocreimbursementpaymentrequestisinSubmittedforApprovalstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/PO/FD user should not able to 'Add' notes notes on ad-hoc reimbursement payment request is in 'Submitted for Approval' state
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
      | Notes Record2 | Automation Notes2|
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
      | Notes Record3 | Automation Notes3|
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:EXE Username}| Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation PM | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation PO | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation FD | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236254 @VerifyPMEXEAdminusershouldnotabletoAddnotesnotesonadhocreimbursementpaymentrequestisinApprovedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/EXE/Admin user should not able to 'Add' notes notes on ad-hoc reimbursement payment request is in 'Approved ' state
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
      | Notes Record2 | Automation Notes2|
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
      | Notes Record3 | Automation Notes3|
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:EXE Username}| Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation EXE | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation PM | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By       | Title         | Description      |
      |Automation ADMIN | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236262 @VerifyPMAdminFDusershouldnotabletoAddnotesnotesonadhocreimbursementpaymentrequestisinPaidstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/Admin/FD user should not able to 'Add' notes notes on ad-hoc reimbursement payment request is in 'Paid' state
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
    And I save the field labeled "EGMS ID" as "PayreqId"
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
      | Notes Record2 | Automation Notes2|
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
      | Notes Record3 | Automation Notes3|
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:EXE Username}| Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation PM | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By       | Title         | Description      |
      |Automation ADMIN | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation FD | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236238 @VerifyPMPOADMINFOsameOrgusershouldbeabletoAddnotesbutEditDeletetheirownnotesonschedulereimbursementpaymentrequestisinSubmittograntorstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/PO/ADMIN//FO same Org user should be able to 'Add' notes but 'Edit/Delete' their own notes on schedule reimbursement payment request is in 'Submit to grantor' state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
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
      |Automation FO | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236239 @VerifyPMPOEXEADMINFDsameOrgusershouldbeabletoAddnotesbutEditDeletetheirownnotesonadvancepaymentrequestisinSubmittograntorstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/PO/EXE/ADMIN/FD same Org user should be able to 'Add' notes but 'Edit/Delete' their own notes on advance payment request is in 'Submit to grantor' state
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
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PM  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
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
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PO  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
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
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation EXE | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
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
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation ADMIN" for title "Created By" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By       | Title         | Description      |
      |Automation ADMIN | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
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
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation FD" for title "Created By" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation FD | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"

  @236242 @VerifyPMEXEFDAdminusershouldnotabletoAddnotesnotesonad-hocreimbursementpaymentrequestisinCreatedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/EXE/FD/Admin user should not able to 'Add' notes notes on ad-hoc reimbursement payment request is in 'Created' state
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
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236259 @VerifyPMPOFDusershouldnotabletoAddnotesnotesonad-hocreimbursementpaymentrequestisinRejectedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/PO/FD user should not able to 'Add' notes notes on ad-hoc reimbursement payment request is in 'Rejected' state
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
      | Notes Record2 | Automation Notes2|
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
      | Notes Record3 | Automation Notes3|
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:EXE Username}| Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Disapprove" in the approval decision
    Then I see status in Progress-bar is "Rejected" and is "Red"
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
    Then I see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation PM | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation PO | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By    | Title         | Description      |
      |Automation FD | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236266 @VerifyPMFOFDusershouldnotabletoAddnotesnotesonschedulereimbursementpaymentrequestisinCreatedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/FO/FD/ user should not able to 'Add' notes notes on schedule reimbursement payment request is in 'Created' state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236271 @236273 @VerifyPMFOFDusershouldnotabletoAddnotesonschedulereimbursementpaymentrequestisinSubmittedforApprovalstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/FO/FD user should not able to 'Add' notes notes on schedule reimbursement payment request is in 'Submitted for Approval' state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
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
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 10                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I navigate to "Forms and Files" sub tab
    #236273
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I navigate to "Forms and Files" sub tab
    #236273
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I navigate to "Forms and Files" sub tab
    #236273
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236277 @VerifyPMPOFDusershouldnotabletoAddnotesnotesonschedulereimbursementpaymentrequestisinRejectedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/PO/FD user should not able to 'Add' notes notes on schedule reimbursement payment request is in 'Rejected' state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
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
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 10                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236264 @VerifyPMFOPOusershouldnotabletoAddnotesnotesonadhocreimbursementpaymentrequestisinForceClosedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/FO/PO user should not able to 'Add' notes notes on ad-hoc reimbursement payment request is in 'Force Closed' state
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
    And I save the field labeled "EGMS ID" as "PayreqId"
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
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record2 | Automation Notes2|
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3|
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    When I click on "Override" in the page details
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PM  | Notes Record  | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation FO  | Notes Record  | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PO  | Notes Record  | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236285 @VerifyPMFOFDusershouldnotabletoAddnotesnotesonschedulereimbursementpaymentrequestisinPaidstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/FO/FD user should not able to 'Add' notes notes on schedule reimbursement payment request is in 'Paid' state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
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
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record | Automation Notes  |
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 10                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:EXE Username}| Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236289 @VerifyPMFOPOusershouldnotabletoAddnotesnotesonschedulereimbursementpaymentrequestisinForceClosedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/FO/PO user should not able to 'Add' notes notes on schedule reimbursement payment request is in 'Force Closed' state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
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
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
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
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
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
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record2 | Automation Notes2|
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
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3|
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    When I click on "Override" in the page details
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PM  | Notes Record | Automation Notes|
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation FO  | Notes Record | Automation Notes|
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PO  | Notes Record | Automation Notes|
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236298 @VerifyPMEXEFDusershouldnotabletoAddnotesnotesonadvancepaymentrequestisinCreatedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/EXE/FD user should not able to 'Add' notes notes on advance payment request is in 'Created' state
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
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record | Automation Notes  |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"

  @236303 @236304 @VerifyPMPOFDusershouldnotabletoAddnotesonadvancepaymentrequestisinSubmittedforApprovalstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/PO/FD user should not able to 'Add' notes notes on advance payment request is in 'Submitted for Approval' state
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
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record | Automation Notes  |
    And I save the field labeled "EGMS ID" as "PayreqId"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 20                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    #236304
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"

  @236306 @VerifyPMPOFDusershouldnotabletoAddnotesonadvancepaymentrequestisinRejectedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/PO/FD user should not able to 'Add' notes notes on advance payment request is in 'Rejected' state
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
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I get the "EGMS ID"
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I save the field labeled "EGMS ID" as "PayreqId"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record2 | Automation Notes2|
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3|
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 20                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PM  | Notes Record | Automation Notes|
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PO  | Notes Record | Automation Notes|
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation FD  | Notes Record | Automation Notes|
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"

  @236311 @VerifyPMAdminFDusershouldnotabletoAddnotesonadvancepaymentrequestisinPaidstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/Admin/FD user should not able to 'Add' notes notes on advance payment request is in 'Paid' state
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
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I get the "EGMS ID"
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record | Automation Notes  |
    And I save the field labeled "EGMS ID" as "PayreqId"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 20                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"

  @236312 @VerifyPMFOPOusershouldnotabletoAddnotesnotesonadvancepaymentrequestisinForceClosedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PM/FO/PO user should not able to 'Add' notes notes on advance payment request is in 'Force Closed' state
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
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I get the "EGMS ID"
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I save the field labeled "EGMS ID" as "PayreqId"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record2 | Automation Notes2|
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3|
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    When I click on "Override" in the page details
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PM  | Notes Record | Automation Notes|
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation FO  | Notes Record | Automation Notes|
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PO  | Notes Record | Automation Notes|
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"

  @236315 @VerifyPOEXEFDusershouldnotabletoeditdeletenoteaddedbyPMuseronadhocreimbursementPRinsubmittedtograntorstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify PO/EXE/FD user should not able to edit/delete note added by PM user on ad-hoc reimbursement PR in submitted to grantor state
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
      | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I cannot see row level action button "Edit" against "Automation PM" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I cannot see row level action button "Delete" against "Automation PM" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I cannot see row level action button "Edit" against "Automation PM" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I cannot see row level action button "Delete" against "Automation PM" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
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
    Then I cannot see row level action button "Edit" against "Automation PM" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I cannot see row level action button "Delete" against "Automation PM" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236329 @VerifySPISPAsameOrgusershouldbeabletoAddnotesbutEditDeletetheirownnotesonadhocreimbursementpaymentrequestisinCreatedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify SPI/SPA same Org user should be able to 'Add' notes but 'Edit/Delete' their own notes on ad-hoc reimbursement payment request is in 'Created' state
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
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation SPI3" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By       | Title         | Description      |
      |Automation SPI3  | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description        |
      | Notes Record2 | Automation Notes2  |
    Then I softly see value "Notes Record2" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation SPA" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation SPA | Notes Record  | Automation Notes|
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236334 @VerifyINDusershouldbeabletoAddnotesbutEditDeletetheirownnotesonadhocreimbursementpaymentrequestisinCreatedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify IND user should be able to 'Add' notes but 'Edit/Delete' their own notes on ad-hoc reimbursement payment request is in 'Created' state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMIS_YES_FOCUS_AREA_NO_SUB_ORG_IND" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
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
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |  Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |  20                       | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation IND" for title "Created By" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By     | Title          | Description       |
      |Automation IND | Notes Record1  | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236336 @VerifySPISPAusershouldnotabletoAddnotesnotesbutcaneditdeleteownnotesonreimbursementpaymentrequestisinSubmittedtoGrantorSubmittedforApprovalApprovedstates @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify SPI/SPA user should not able to 'Add' notes notes but can edit/delete own notes on reimbursement payment request is in Submitted to Grantor/Submitted for Approval/Approved states
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_ADVANCE_PERMISSION-Automation PM user" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |  Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |  20                       | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record2 | Automation Notes2|
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3|
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Title          | Title          | Description       |
      |Notes Record1  | Notes Record   | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:EXE Username}| Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Title          | Title          | Description       |
      |Notes Record2  | Notes Record   | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Title          | Title          | Description       |
      |Notes Record3  | Notes Record   | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @2363381 @VerifySPISPAusershouldnotabletoAddnotesnotesbutcaneditdeleteownnotesonAdvancepaymentrequestisinPaidRejectedForceClosedstates @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify SPI/SPA user should not able to 'Add' notes notes but can edit/delete own notes on Advance payment request is in Paid/ Rejected/Force Closed states
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
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record | Automation Notes  |
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    When I click on "Override" in the page details
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By      | Title          | Description       |
      |Automation SPI3 | Notes Record1  | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"

  @236338 @VerifySPISPAusershouldnotabletoAddnotesnotesbutcaneditdeleteownnotesonAdvancepaymentrequestisinPaidRejectedForceClosedstates @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify SPI/SPA user should not able to 'Add' notes notes but can edit/delete own notes on Advance payment request is in Paid/ Rejected/Force Closed states
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
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record | Automation Notes  |
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 20                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By      | Title          | Description       |
      |Automation SPI3 | Notes Record1  | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"

  @2363381 @VerifySPISPAusershouldnotabletoAddnotesnotesbutcaneditdeleteownnotesonAdvancepaymentrequestisinPaidRejectedForceClosedstates @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify SPI/SPA user should not able to 'Add' notes notes but can edit/delete own notes on Advance payment request is in Paid/ Rejected/Force Closed states
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
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record | Automation Notes  |
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 20                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Created By      | Title          | Description       |
      |Automation SPI3 | Notes Record1  | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"

  @236341 @VerifyINDusershouldnotabletoAddnotesnotesbutcaneditdeleteownnotesonadvancepaymentrequestisinSubmittedtoGrantorSubmittedforApprovalApprovedPaidstates @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify IND user should not able to 'Add' notes notes but can edit/delete own notes on advance payment request is in Submitted to Grantor/Submitted for Approval/Approved/Paid  states
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMIS_YES_FOCUS_AREA_NO_SUB_ORG_IND" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
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
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record2 | Automation Notes2|
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3|
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Title          | Title          | Description       |
      |Notes Record1  | Notes Record   | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 20                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Title          | Title          | Description       |
      |Notes Record2  | Notes Record   | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Edit" :
      |Title          | Title          | Description       |
      |Notes Record3  | Notes Record   | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:advancePaymentNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:advancePaymentNotesTableId---"

  @236342 @VerifyINDusershouldnotabletoAddnotesnotesbutcaneditdeleteownnotesonadhocreimbursementpaymentrequestisinRejectedstate @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify IND user should not able to 'Add' notes notes but can edit/delete own notes on ad-hoc reimbursement payment request is in  Rejected state
    Given I activated standalone subaward "Automation Runtime Award" with properties "SUBRECIPIENT_ORG_IND_USER-Automation PM user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
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
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |  Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |  20                       | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:EXE Username}| Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Title          | Title          | Description       |
      |Notes Record1  | Notes Record   | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236344 @VerifyINDusershouldnotabletoAddnotesnotesbutcaneditdeleteownnotesonschedulereimbursementpaymentrequestisinForceClosedstates @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify IND user should not able to 'Add' notes notes but can edit/delete own notes on schedule reimbursement payment request is in Force Closed states
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
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record | Automation Notes  |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    When I click on "Override" in the page details
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    When I edit the following rows inline in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Edit" :
      |Created By      | Title          | Description       |
      |Automation IND  | Notes Record1  | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---paymentRequest:-:reimbursePaymentsNotesTableId---"

  @236354 @Verifyauditorusercanonlyviewnotesaddedbyuser @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify auditor user can only view notes added by user
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
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:advancePaymentNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 20                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                      | Advance |
      | {SavedValue:EXE Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "Auditor" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"

  @236346 @VerifySPIusershouldnotableeditdeletefileaddedbySPA @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify SPI user should not able edit/delete file added by SPA
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_ADVANCE_PERMISSION" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I get the "EGMS ID"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |  Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |  20                       | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:EXE Username}| Step 1        |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---paymentRequest:-:reimbursePaymentsNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"

  @236322 @VerifyotherOrginternalusercannotabletoseePRrecord @sprint-14-US-225425 @hitesh @Notes
  Scenario:Verify other Org internal user can not able to see PR record
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
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |  Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |  20                       | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    Then I softly do not see value "{SavedValue:PayreqId}" for title "EGMS ID" inside table "---paymentRequest:-:paymentrequestReimbursementTableId---"