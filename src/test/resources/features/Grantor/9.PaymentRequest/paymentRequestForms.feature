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
    And I wait for "6" seconds
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
    When I click on "Edit" in the page details
    And I enter value "-330" into field "fieldPeriodStartDate__c"
    When I click on "Save" in the page details
    And I wait for "7" seconds
    And I refresh the page
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | From date cannot be in past in the Period Covered By This Request section. |
    When I click on "Edit" in the page details
    And I enter value "330" into field "fieldPeriodStartDate__c"
    And I enter value "330" into field "fieldPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "7" seconds
    And I refresh the page
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | From date and To date cannot be same in Period Covered By This Request section. |

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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
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
    When I click on "Edit" in the page details
    And I enter value "-330" into field "fieldPeriodStartDate__c"
    When I click on "Save" in the page details
    And I wait for "8" seconds
    And I refresh the page
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | From date cannot be in past in the Period Covered By This Request section. |
    When I click on "Edit" in the page details
    And I enter value "330" into field "fieldPeriodStartDate__c"
    And I enter value "330" into field "fieldPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | From date and To date cannot be same in Period Covered By This Request section. |

  @287722 @ValidateEXEusercanseebelowformonReimbursementPaymentRequestunderFilesFormssectionofPaymentRequest @sprint-1-US-278368 @vaibhav @Forms
  Scenario: Validate EXE user can see below form on Reimbursement Payment Request under Files & Forms section of Payment Request
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "PaymentRequest__c"
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
    Then I softly see value "Payment Request Report" for title "Report Type" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Request for Advance or Reimbursement - SF-270" inside table "---paymentRequest:-:paymentRequestFormsTableId---"

  @286321 @ValidatePMusercanseebelowformafterexpandinggridofnewpackageGrantorPaymentRequestonPackagessectionofFormsPackagessectionundersetupofPlanningmodule @sprint-1-US-278368 @vaibhav @Forms
  Scenario: Validate PM user can see below form after expanding grid of new package Grantor Payment Request on Packages section of Forms & Packages section under setup of Planning module
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Payment Request Forms" in "---program:-:packagesTableId---" panel
    Then I softly see value "Grantor Payment Request Forms" for title "Package Name" inside table "---program:-:packagesTableId---"
    When I click on "View" icon for "Grantor Payment Request Forms" inside table
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:packagesFormsTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:packagesFormsTableId---"
    Then I softly see value "Payment Request" for title "Package Type" inside table "---program:-:packagesFormsTableId---"
    Then I softly see "Cross" symbol in flex table with id "---program:-:packagesFormsTableId---"

  @293600 @ValidatePMusercanseeReportTypeonformsforSiteVisitOrganizationDeskReviewPreapplicationApplicationonFormssectionofFormsPackagessectionundersetupofPlanningmodule @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate PM user can see Report Type on forms for Site Visit Organization Desk Review Pre-application Application on Forms section of Forms & Packages section under setup of Planning module
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    And I select value inside table "---program:-:formsPackagesFormsTableId---" is "All"
    Then I softly see value "Standard Pre-Application Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Pre-Application Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Program Application Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Application Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Standard Assurances Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Application Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"

  @293601 @293603 @ValidatePMusercanseeReportTypeclmonSiteVisitformswhenuserclickonviewicononGrantorSiteVisitFormsunderBusinessFormssectiononsetuptabofInternalProgram @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate PM user can see Report Type clm on Site Visit forms when user click on view icon on Grantor Site Visit Forms under Business Forms section on setup tab of Internal Program
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    Then I can see row level action button "Preview" against "Grantor Site Visit Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Site Visit Forms" in flex table with id "---program:-:businessFormTableId---"
    When I click on "Preview" icon for "Grantor Site Visit Forms" inside table
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "General Review Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Financial Review Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Program Review Form" inside table "---program:-:previewPackageTableId---"
    And I refresh the page
    #293603
    Then I can see row level action button "Preview" against "Grantor Pre-application Form" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Pre-application Form" in flex table with id "---program:-:businessFormTableId---"
    When I click on "Preview" icon for "Grantor Pre-application Form" inside table
    Then I softly see value "Standard Pre-Application form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Pre-Application Report" for title "Report Type" against the value "Standard Pre-Application form" inside table "---program:-:previewPackageTableId---"

  @293602 @ValidateEXEusercanseeReportTypeclmonOrganizationDeskReviewformwhenuserclickonviewicononOrganizationDeskReviewunderBusinessFormssectiononsetuptabofInternalProgram @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate EXE user can see Report Type clm on Organization Desk Review form when user click on view icon on Organization Desk Review under Business Forms section on setup tab of Internal Program
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    Then I can see row level action button "Preview" against "Organization Desk Review" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Organization Desk Review" in flex table with id "---program:-:businessFormTableId---"
    When I click on "Preview" icon for "Organization Desk Review" inside table
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "General Review Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Financial Review Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Program Review Form" inside table "---program:-:previewPackageTableId---"

  @293604 @ValidateAdminusercanseeReportTypeclmonApplicationwhenuserclickviewicononGrantorApplicationFormsunderBusinessFormssectiononsetuptabofInternalProgram @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate Admin user can see Report Type clm on Application when user click on view icon on Grantor Application Forms under Business Forms section on setup tab of Internal Program
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    Then I can see row level action button "Preview" against "Grantor Application Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Application Forms" in flex table with id "---program:-:businessFormTableId---"
    When I click on "Preview" icon for "Grantor Application Forms" inside table
    Then I softly see value "Program Application Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Application Report" for title "Report Type" against the value "Program Application Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Standard Assurances Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Application Report" for title "Report Type" against the value "Standard Assurances Form" inside table "---program:-:previewPackageTableId---"

  @293607 @ValidatePOusercanseeReportTypeonGrantorPreapplicationFormsGrantorApplicationFormsGrantorSiteVisitFormsOrganizationDeskreviewonPackagessectionofFormsandPackagessectionundersetupofPlanningmodule @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate PO user can see Report Type on Grantor Pre-application Forms, Grantor Application Forms, Grantor Site Visit Forms, Organization Desk review on Packages section of Forms & Packages section under setup of Planning module
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Site Visit" in "---program:-:packagesTableId---" panel
    Then I softly see value "Grantor Site Visit Forms" for title "Package Name" inside table "---program:-:packagesTableId---"
    And I expand nested table containing column value "Grantor Site Visit Forms"
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "General Review Form" inside table "---program:-:packagesTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Financial Review Form" inside table "---program:-:packagesTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Program Review Form" inside table "---program:-:packagesTableId---"
    And I collapse nested table containing column value "Grantor Site Visit Forms"
    When I perform quick search for "Grantor Pre-application Form" in "---program:-:packagesTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---program:-:packagesTableId---"
    And I expand nested table containing column value "Grantor Pre-application Form"
    Then I softly see value "Standard Pre-Application form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Pre-Application Report" for title "Report Type" against the value "Standard Pre-Application form" inside table "---program:-:packagesTableId---"
    And I collapse nested table containing column value "Grantor Pre-application Form"
    When I perform quick search for "Grantor Application Forms" in "---program:-:packagesTableId---" panel
    Then I softly see value "Grantor Application Forms" for title "Package Name" inside table "---program:-:packagesTableId---"
    And I expand nested table containing column value "Grantor Application Forms"
    Then I softly see value "Program Application Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Application Report" for title "Report Type" against the value "Program Application Form" inside table "---program:-:packagesTableId---"
    Then I softly see value "Standard Assurances Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Application Report" for title "Report Type" against the value "Standard Assurances Form" inside table "---program:-:packagesTableId---"
    And I collapse nested table containing column value "Grantor Application Forms"
    When I perform quick search for "Organization Desk Review" in "---program:-:packagesTableId---" panel
    And I expand nested table containing column value "Organization Desk Review"
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "General Review Form" inside table "---program:-:packagesTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Financial Review Form" inside table "---program:-:packagesTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Program Review Form" inside table "---program:-:packagesTableId---"

  @293613 @ValidateEXEusercanseeReportTypeclmonSiteVisitformswhenuserclickonviewicononGrantorSiteVisitFormsunderBusinessFormssectiononsetuptabofAnnouncement @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate EXE user can see Report Type clm on Site Visit forms  when user click on view icon on Grantor Site Visit Forms under Business Forms section on setup tab of Announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter values into fields
      | Value                      | Field      |
      | {SavedValue:ProgramEGMSID} | Program__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "announcementName"
    And I navigate to "Setup" sub tab
    Then I can see row level action button "Preview" against "Grantor Site Visit Forms" in flex table with id "---announcement:-:businessFormlistTableId---"
    Then I can see row level action button "Edit" against "Organization Desk Review" in flex table with id "---announcement:-:businessFormlistTableId---"
    Then I softly see value "Grantor Site Visit Forms" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "Grantor Site Visit Forms" inside table
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "General Review Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Financial Review Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Program Review Form" inside table "---program:-:previewPackageTableId---"
    Then I delete the record "{SavedValue:announcementName}" from the object "announcement"

  @293617 @293620 @ValidatePOusecanseeReportTypeclmonOrganizationDeskReviewformswhenuserclickonviewicononOrganizationDeskReviewFormsunderBusinessFormssectiononsetuptabofAnnouncement @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate PO user can see Report Type clm on Organization Desk Review forms when user click on view icon on Organization Desk Review Forms under Business Forms section on setup tab of Announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter values into fields
      | Value                      | Field      |
      | {SavedValue:ProgramEGMSID} | Program__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "announcementName"
    When I navigate to "Setup" sub tab
    Then I can see row level action button "Preview" against "Organization Desk Review" in flex table with id "---announcement:-:businessFormlistTableId---"
    Then I can see row level action button "Edit" against "Organization Desk Review" in flex table with id "---announcement:-:businessFormlistTableId---"
    Then I softly see value "Organization Desk Review" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "Organization Desk Review" inside table
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "General Review Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Financial Review Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Program Review Form" inside table "---program:-:previewPackageTableId---"
    And I refresh the page
    #293620
    Then I can see row level action button "Preview" against "Grantor Application Forms" in flex table with id "---announcement:-:businessFormlistTableId---"
    Then I can see row level action button "Edit" against "Grantor Application Forms" in flex table with id "---announcement:-:businessFormlistTableId---"
    Then I softly see value "Grantor Application Forms" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "Grantor Application Forms" inside table
    Then I softly see value "Program Application Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Application Report" for title "Report Type" against the value "Program Application Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Standard Assurances Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Application Report" for title "Report Type" against the value "Standard Assurances Form" inside table "---program:-:previewPackageTableId---"
    Then I delete the record "{SavedValue:announcementName}" from the object "announcement"

  @293619 @ValidatePMusercanseeReportTypeclmonPreapplicationformswhenuserclickonviewicononGrantorPreapplicationFormsunderBusinessFormssectiononsetuptabofAnnouncement @sprint-3-US-288713 @vaibhav @Forms
  Scenario: validate PM user can see Report Type clm on Pre-application forms when user click on view icon on Grantor Pre-application Forms under Business Forms section on setup tab of Announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter values into fields
      | Value                      | Field      |
      | {SavedValue:ProgramEGMSID} | Program__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "announcementName"
    And I navigate to "Setup" sub tab
    Then I can see row level action button "Preview" against "Grantor Pre-application Form" in flex table with id "---announcement:-:businessFormlistTableId---"
    Then I can see row level action button "Edit" against "Grantor Pre-application Form" in flex table with id "---announcement:-:businessFormlistTableId---"
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "Grantor Pre-application Form" inside table
    Then I softly see value "Standard Pre-Application form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Pre-Application Report" for title "Report Type" against the value "Standard Pre-Application form" inside table "---program:-:previewPackageTableId---"
    Then I delete the record "{SavedValue:announcementName}" from the object "announcement"

  @293621 @ValidateEXEandSPIusercanseeReportTypeclmonSiteVisitformswhenuserclickonviewicononGrantorSiteVisitFormsunderDefaultPackagessectiononFilestabofGrant @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate EXE and SPI user can see Report Type clm on Site Visit forms when user click on view icon on Grantor Site Visit Forms under Default Packages section on Files tab of Grant
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I enter values into fields
      | Value                      | Field           |
      | {SavedValue:ProgramEGMSID} | fieldProgram__c |
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Files" sub tab
    Then I can see row level action button "Preview" against "Grantor Site Visit Forms" in flex table with id "---subAwardFromFDM:-:grantPackagesTableId---"
    Then I can see row level action button "Edit" against "Grantor Site Visit Forms" in flex table with id "---subAwardFromFDM:-:grantPackagesTableId---"
    Then I softly see value "Grantor Site Visit Forms" for title "Package Name" inside table "---subAwardFromFDM:-:grantPackagesTableId---"
    When I click on "Preview" icon for "Grantor Site Visit Forms" inside table
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    And I refresh the page
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation FO | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "8" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I can see row level action button "Preview" against "Grantor Site Visit Forms" in flex table with id "---subAwardStandAlone:-:recipientGrantPackageTableId---"
    Then I softly see value "Grantor Site Visit Forms" for title "Package Name" inside table "---subAwardStandAlone:-:recipientGrantPackageTableId---"
    When I click on "Preview" icon for "Grantor Site Visit Forms" inside table
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"

  @293623 @ValidatePOandSPAusercanseeReportTypeclmonOrganizationDeskReviewformswhenuserclickonviewicononOrganizationDeskReviewFormsunderBusinessFormssectiononFilestabofGrant @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate PO and SPA user can see Report Type clm on Organization Desk Review forms when user click on view icon on Organization Desk Review Forms under Business Forms section on Files tab of Grant
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I enter values into fields
      | Value                      | Field           |
      | {SavedValue:ProgramEGMSID} | fieldProgram__c |
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Files" sub tab
    Then I can see row level action button "Preview" against "Organization Desk Review" in flex table with id "---subAwardFromFDM:-:grantPackagesTableId---"
    Then I can see row level action button "Edit" against "Organization Desk Review" in flex table with id "---subAwardFromFDM:-:grantPackagesTableId---"
    Then I softly see value "Organization Desk Review" for title "Package Name" inside table "---subAwardFromFDM:-:grantPackagesTableId---"
    When I click on "Preview" icon for "Organization Desk Review" inside table
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    And I refresh the page
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation FO | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "8" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I can see row level action button "Preview" against "Organization Desk Review" in flex table with id "---subAwardStandAlone:-:recipientGrantPackageTableId---"
    Then I softly see value "Organization Desk Review" for title "Package Name" inside table "---subAwardStandAlone:-:recipientGrantPackageTableId---"
    When I click on "Preview" icon for "Organization Desk Review" inside table
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"

  @293627 @ValidatePMandSPIusercanseeReportTypeclmonPreapplicationFormunderFormssectiononFormsFilestabofPreapplication @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate PM and SPI user can see Report Type clm on Pre-application Form under Forms section on Forms & Files tab of Preapplication
    And I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_YES_WITH_IND_ORG"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:IND Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see field "Other Leverage" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Standard Pre-Application form" for title "Form Name" inside table "---preApplication:-:preAppFormTableId---"
    Then I softly see value "Pre-Application Report" for title "Report Type" inside table "---preApplication:-:preAppFormTableId---"
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I softly see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Standard Pre-Application form" for title "Form Name" inside table "---preApplication:-:preAppFormTableId---"
    Then I softly see value "Pre-Application Report" for title "Report Type" inside table "---preApplication:-:preAppFormTableId---"

  @293628 @293645 @ValidatePOandSPIusercanseeReportTypeclmApplicationFormunderFormssectiononFilesandFormstabofApplication @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate PO and SPI user can see Report Type clm on Application Form under Forms section on Files and Forms tab of Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "INVITED_APPLICANT_IND_ORG"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:IND Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    #293645
    Then I softly can see "Forms and Files" sub tab at view detail page
    And I navigate to "Forms and Files" sub tab
    Then I softly see value "Standard Assurances Form" for title "Form Name" inside table "---applicationReview:-:allFormsTableId---"
    Then I softly see value "Application Report" for title "Report Type" inside table "---applicationReview:-:allFormsTableId---"
    Then I softly see value "Program Application Form" for title "Form Name" inside table "---applicationReview:-:allFormsTableId---"
    Then I softly see value "Application Report" for title "Report Type" inside table "---applicationReview:-:allFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside table
    #293645
    Then I softly can see "Forms and Files" sub tab at view detail page
    And I navigate to "Forms and Files" sub tab
    Then I softly see value "Standard Assurances Form" for title "Form Name" inside table "---negotiation:-:negotiationFilesFormTableId---"
    Then I softly see value "Application Report" for title "Report Type" inside table "---negotiation:-:negotiationFilesFormTableId---"
    Then I softly see value "Program Application Form" for title "Form Name" inside table "---negotiation:-:negotiationFilesFormTableId---"
    Then I softly see value "Application Report" for title "Report Type" inside table "---negotiation:-:negotiationFilesFormTableId---"

  @293632 @ValidateFOandSPAusercanseeReportTypeclmonSiteVisitFormunderAllFormssectiononReportsOutcomestabofSiteVisit @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate FO and SPA user can see Report Type clm on Site Visit Form under All Forms section on Reports & Outcomes tab of Site Visit
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    Then I softly see value "General Review Form" for title "Form Name" inside table "---sitevisits:-:reportsTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---sitevisits:-:reportsTableId---"
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Given I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visits - All"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringSiteVisitSubTableId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringSiteVisitSubTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    Then I softly see value "General Review Form" for title "Form Name" inside table "---sitevisits:-:reportsTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---sitevisits:-:reportsTableId---"

  @293633 @ValidateFDandINDusercanseeReportTypeclmonDeskReviewFormunderAllFormssectiononReports&OutcomestabofDeskreview @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate FD and IND user can see Report Type clm on Desk Review Form under All Forms section on Reports & Outcomes tab of Desk review
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "SUBRECIPIENT_ORG_IND_USER-Automation PM user" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "SUBRECIPIENT_ORG_IND_USER-Automation PM user" of type "Competitive"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation_IND" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:FD Username} | Step 1      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    And I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I softly see value "General Review Form" for title "Form Name" inside table "---sitevisits:-:reportsTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---sitevisits:-:reportsTableId---"
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly can see top right button "Send to Subrecipient" in page detail
    When I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I navigate to "Reports and Outcomes" sub tab
    Then I softly see value "General Review Form" for title "Form Name" inside table "---sitevisits:-:reportsTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" inside table "---sitevisits:-:reportsTableId---"

  @298273 @ValidateSF270SPIusercanabletoSaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF270form @sprint-1-US-282692 @vaibhav @Forms
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
    And I click on "Edit" icon for "Request for Advance or Reimbursement - SF-270" inside flex table with id "---paymentRequest:-:paymentRequestFormsTableId---" without waiting for record
    And I select below checkbox options for field "fieldAdvanaceorReimbursement__c"
      | Advance |
    And I enter "SF270_Form" values from "PaymentRequest_Field_Values.xlsx"
    And I enter value "330" into field "fieldPeriodEndDate__c"
    And I enter value "12345-1234" into field "fieldZipPostalCodeSF428__c"
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