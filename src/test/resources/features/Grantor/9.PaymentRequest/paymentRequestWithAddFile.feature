@paymentRequestWithBackground @paymentRequest @grantor-regression @grantor-parallel-regression @paymentRequest-check @regression
Feature: Validate all scenarios in Payment Request with add file

  @193832 @193959 @VerifySPIusercanaddfileonadhocreimbursementPRifuserhaseditaccessontopeditbuttonforPRincreatedstate @sprint-14-US-225425 @addFiles @hitesh
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
    #193959
    And I click on "Edit" icon for "{SavedValue:AttachedFile}" inside flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I switch to iframe with id "---paymentRequest:-:reimbursementAddFilesTableId---"
    And I select Classification as "Receipt" at upload file modal
    When I click modal button "Save"
    Then I softly see value "Receipt" for title "Classification" inside table "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I click on "Delete" icon for "{SavedValue:AttachedFile}" inside flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---" without waiting for record
    Then I softly do not see value "{SavedValue:AttachedFile}" for title "Title" inside table "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"

  @193834 @VerifySPAusercanaddfileonadhocreimbursementPRifuserhaseditaccessontopeditbuttonforPRincreatedstate @sprint-14-US-225425 @addFiles @hitesh
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

  @193842 @VerifyINDusercanaddfileonschedulereimbursementPRifuserhaseditaccessontopeditbuttonforPRincreatedstate @sprint-14-US-225425 @addFiles @hitesh
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

  @193863 @193866 @193871 @193873 @193879 @193923 @193931 @@VerifySPIusercannotaddfileonadhocreimbursementPRinsubmittograntorstate @sprint-14-US-225425 @addFiles @hitesh
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
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I navigate to "Forms and Files" sub tab
    #193863
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
    #193866
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:reimburseFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:grantorreimbursementAddFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Invoice" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:reimburseFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Reimbursement Files" flex table
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---paymentRequest:-:ReimbursmentApproverTableId---"
    And I refresh the page
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    #193871
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:reimburseFilesTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    #193923
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I see status in Progress-bar is "Approved" and is "green"
    #193931
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
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
    Then I see status in Progress-bar is "Approved" and is "green"
    #193873
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:reimburseFilesTableId---"
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    #193879
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:reimburseFilesTableId---"

  @193868 @193878 @193939 @VerifyEXEusercannotseetopleveleditbuttonandabletoaddfileonAdvancePRinsubmittograntorstate @sprint-14-US-225425 @addFiles @hitesh
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
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 20                            |
    And I get the "EGMS ID"
    And I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    #193868
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:advanceFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:grantorAdvanceAddFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Invoice" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:advanceFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Advance Payment Files" flex table
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
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    #193878
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:advanceFilesTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I see status in Progress-bar is "Paid" and is "green"
    #193939
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"

  @193869 @193894 @193937 @VerifyAdminusercannotseetopleveleditbuttonandabletoaddfileonAdvancePRinsubmittograntorstate @sprint-14-US-225425 @addFiles @hitesh
  Scenario:Verify Admin user can not see top level edit button and able to add file on Advance PR in submit to grantor state
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation ADMIN user" of type "Competitive"
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
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
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:advanceFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:grantorAdvanceAddFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Invoice" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:advanceFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Advance Payment Files" flex table
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 20                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                        | Advance |
      | {SavedValue:ADMIN Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Reject" in the approval decision
    Then I see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    Then I see status in Progress-bar is "Rejected" and is "Red"
    #193894
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:advanceFilesTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I see status in Progress-bar is "Rejected" and is "Red"
    #193937
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"

  @193906 @VerifyEXEusercannotseetopleveleditbuttonandnotabletoaddfileonAdhocreimbursementPRinforceclosedstate @sprint-14-US-225425 @addFiles @hitesh
  Scenario:Verify EXE user can not see top level edit button and not able to add file on Ad-hoc reimbursement PR in force closed state
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
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I softly see field "Status" as "Force Closed"
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:reimburseFilesTableId---"

  @193919 @VerifyPMusercannotseetopleveleditbuttonandnotabletoaddfileonadhocreimbursementPRwhenPMusersentPRtoSRuser @sprint-14-US-225425 @addFiles @hitesh
  Scenario:Verify PM user can not see top level edit button and not able to add file on ad-hoc reimbursement PR when PM user sent PR to S\R user
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
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
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
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:reimburseFilesTableId---"

  @193921 @VerifySPAusercanaddfileonadhocreimbursementPRifuserhaseditaccessontopeditbuttonforPRwhengrantorsentbacktoSRPR @sprint-14-US-225425 @addFiles @hitesh
  Scenario:Verify SPA user can add file on ad-hoc reimbursement PR if user has edit access on top edit button for PR when grantor sent back to S\R PR
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
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
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
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:FO Username} | Step 1        |
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I can see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:reimbursementAddFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Invoice" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Reimbursement Files" flex table

  @193944 @VerifyINDusercannotseetopleveleditbuttonandnotabletoaddfileonAd-hocreimbursementPRinforceclosedstate @sprint-14-US-225425 @addFiles @hitesh
  Scenario:Verify IND user can not see top level edit button and not able to add file on Ad-hoc reimbursement PR in force closed state
    Given I activated standalone subaward "Automation Runtime Award" with properties "SUBRECIPIENT_ORG_IND_USER-Automation EXE user" of type "Competitive"
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
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I softly see field "Status" as "Force Closed"
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Forms and Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"

  @193968 @VerifySPIusercandownloadthefileinpaidstateofAdvancePR @sprint-14-US-225425 @addFiles @hitesh
  Scenario:Verify SPI user can download the file in paid state of Advance PR
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation PM user" of type "Competitive"
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
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:addFilesTableIframeId---"
    And I upload attachment "Attachment.pdf" of type "Invoice" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Advance Payment Files" flex table
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
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
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
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
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Download" against "{SavedValue:AttachedFile}" in flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---"
    When I click on "Download" icon for "{SavedValue:AttachedFile}" inside flex table with id "---paymentRequest:-:recipientAdvancePaymentFilesTableId---" without waiting for record
    Then I softly verify that the file "{SavedValue:AttachedFile}" is downloaded

  @193977 @VerifyPMusercannotseetopleveleditbuttonandshouldabletoaddfileonadhocreimbursementPRwhenusersendtoownerwhileapproval @sprint-14-US-225425 @addFiles @hitesh
  Scenario:Verify PM user can not see top level edit button and should able to add file on ad-hoc reimbursement PR when user send to owner while approval
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
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
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
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                      | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    And I refresh the page
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:reimburseFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:grantorreimbursementAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Invoice" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:reimburseFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Reimbursement Files" flex table

  @193986 @VerifySPIusercanseetopleveleditbuttonandabletoaddfileonad-hocreimbursementPRwhengrantorusersendbacktoSRwhileapproval @sprint-14-US-225425 @addFiles @hitesh
  Scenario:Verify SPI user can see top level edit button and able to add file on ad-hoc reimbursement PR when grantor user send back to S\R while approval
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
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
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
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                      | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    And I refresh the page
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    Then I can see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---paymentRequest:-:reimbursementAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Invoice" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---paymentRequest:-:recipientReimbursmentPaymentFilesTableId---"
    Then I softly see "{SavedValue:AttachedFile}" has been added in "Reimbursement Files" flex table
