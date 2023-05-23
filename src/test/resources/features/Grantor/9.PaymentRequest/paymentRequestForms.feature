@paymntRequestForms @grantor-parallel-regression @paymentRequest @regression
Feature: Payment Request Forms scenarios

  @308590 @308685 @ValidateSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonform @sprint-1-US-282692 @vaibhav @Forms
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

  @287170 @308690 @ValidateSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonform @sprint-2-US-288254 @vaibhav @Forms
  Scenario: Validate SPI user can able to save & validate form after entering correct & valid data on all fields present on form
    And I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
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
      | Construction    | 100                           |
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
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
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #308690
    When I click on "Back" in the page details
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
      | {SavedValue:fundingAccount} | 100                           |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                      | Advance |
      | {SavedValue:EXE Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"

  @307326 @ValidateSF270SPIusercanabletoSaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF270form @sprint-1-US-282692 @vaibhav @Forms
  Scenario: Validate SF270 SPI user can able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF270 form
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
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Street1 is required to save.                                     |
      | City is required to save.                                        |
      | State is required to save.                                       |
      | Zip / Postal Code is required to save.                           |
      | Street1 is required to save.                                     |
      | City is required to save.                                        |
      | State is required to save.                                       |
      | Zip / Postal Code is required to save.                           |
      | Signature of Authorized Certifying official is required to save. |
      | Date Request Submitted is required to save.                      |
      | First Name is required to save.                                  |
      | Last Name is required to save.                                   |
      | Title is required to save.                                       |
      | Telephone (Area Code, Number, Extension) is required to save.    |
    And I select below checkbox options for field "fieldAdvanaceorReimbursement__c"
      | Advance |
    And I enter "SF270_Form" values from "PaymentRequest_Field_Values.xlsx"
    And I enter value "330" into field "fieldPeriodEndDate__c"
    And I enter value "12345" into field "fieldZipPostalCodeSF428__c"
    And I enter value "12345" into field "fieldPayeeZipCode__c"
    And I enter value "-123" into field "fieldEstimatedFederalCashOutlays__c"
    And I enter value "-123" into field "fieldEstimatedBalanceofFederalCashonHand__c"
    And I enter value "Unchecked" into field "fieldAcknowledgementSF428__c"
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
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Certify the Request for Advance or Reimbursement (SF-270) by checking the Acknowledgment Box before submitting to Grantor. |
      | To date cannot be before From date in Period Covered By This Request section.                                              |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                      |
      | The estimated federal cash outlays that will be made during period covered by the advance cannot be less than zero.        |
      | The estimated balance of federal cash on hand as of beginning of advance period cannot be less than zero.                  |

  @287171 @ValidateAdvSPIusercanabletosaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF270form @sprint-2-US-288254 @vaibhav @Forms
  Scenario: Validate Adv SPI user can able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF270 form
    And I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
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
      | Construction    | 100                           |
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "Preview" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "View" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I can see row level action button "Edit" against "Request for Advance or Reimbursement - SF-270" in flex table with id "---paymentRequest:-:paymentRequestFormsTableId---"
    And I click on "Edit" icon for "Request for Advance or Reimbursement - SF-270" inside flex table with id "---paymentRequest:-:paymentRequestFormsTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0012"
    Then I softly see the text containing "Expiration Date: 01/31/2025"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Street1 is required to save.                                     |
      | City is required to save.                                        |
      | State is required to save.                                       |
      | Zip / Postal Code is required to save.                           |
      | Street1 is required to save.                                     |
      | City is required to save.                                        |
      | State is required to save.                                       |
      | Zip / Postal Code is required to save.                           |
      | Signature of Authorized Certifying official is required to save. |
      | Date Request Submitted is required to save.                      |
      | First Name is required to save.                                  |
      | Last Name is required to save.                                   |
      | Title is required to save.                                       |
      | Telephone (Area Code, Number, Extension) is required to save.    |
    And I select below checkbox options for field "fieldAdvanaceorReimbursement__c"
      | Advance |
    And I enter "SF270_Form" values from "PaymentRequest_Field_Values.xlsx"
    And I enter value "330" into field "fieldPeriodEndDate__c"
    And I enter value "12345" into field "fieldZipPostalCodeSF428__c"
    And I enter value "12345" into field "fieldPayeeZipCode__c"
    And I enter value "-123" into field "fieldEstimatedFederalCashOutlays__c"
    And I enter value "-123" into field "fieldEstimatedBalanceofFederalCashonHand__c"
    And I enter value "Unchecked" into field "fieldAcknowledgementSF428__c"
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
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Certify the Request for Advance or Reimbursement (SF-270) by checking the Acknowledgment Box before submitting to Grantor. |
      | To date cannot be before From date in Period Covered By This Request section.                                              |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                      |
      | The estimated federal cash outlays that will be made during period covered by the advance cannot be less than zero.        |
      | The estimated balance of federal cash on hand as of beginning of advance period cannot be less than zero.                  |
