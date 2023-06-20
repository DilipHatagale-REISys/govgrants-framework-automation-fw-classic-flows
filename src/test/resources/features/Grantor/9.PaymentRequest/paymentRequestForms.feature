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

 @vai @293600 @ValidatePMusercanseeReportTypeonformsforSiteVisitOrganizationDeskReviewPreapplicationApplicationonFormssectionofFormsPackagessectionundersetupofPlanningmodule @sprint-3-US-288713 @vaibhav @Forms
  Scenario: Validate PM user can see Report Type on forms for Site Visit Organization Desk Review Pre-application Application on Forms section of Forms & Packages section under setup of Planning module
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Standard Pre-Application Form" in "---program:-:formsPackagesFormsTableId---" panel
    Then I softly see value "Standard Pre-Application Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Pre-Application Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    And I click on parallel menu button in flex table title "Forms"
    And I select "Reset Table" from parallel lines dropdown of "Forms"
    And I wait for "3" seconds
    When I perform quick search for "Standard Pre-Application Form" in "---program:-:formsPackagesFormsTableId---" panel
    Then I softly see value "Program Application Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Application Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    And I click on parallel menu button in flex table title "Forms"
    And I select "Reset Table" from parallel lines dropdown of "Forms"
    And I wait for "3" seconds
    When I perform quick search for "Standard Assurances Form" in "---program:-:formsPackagesFormsTableId---" panel
    Then I softly see value "Standard Assurances Form" for title "Form Name" inside table "---program:-:formsPackagesFormsTableId---"
    Then I softly see value "Application Report" for title "Report Type" inside table "---program:-:formsPackagesFormsTableId---"
    And I click on parallel menu button in flex table title "Forms"
    And I select "Reset Table" from parallel lines dropdown of "Forms"
    And I wait for "3" seconds
    When I perform quick search for "Desk" in "---program:-:formsPackagesFormsTableId---" panel
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

  @293601 @293603 @ValidatePMusercanseeReportTypeclmonSiteVisitformswhenuserclickonviewicononGrantorSiteVisitFormsunderBusinessFormssectiononsetuptabofInternalProgram @sprint-3-US-288713 @vaibhav @Forms @vai1
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

  @293602 @ValidateEXEusercanseeReportTypeclmonOrganizationDeskReviewformwhenuserclickonviewicononOrganizationDeskReviewunderBusinessFormssectiononsetuptabofInternalProgram @sprint-3-US-288713 @vaibhav @Forms @vai1
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

  @293604 @ValidateAdminusercanseeReportTypeclmonApplicationwhenuserclickviewicononGrantorApplicationFormsunderBusinessFormssectiononsetuptabofInternalProgram @sprint-3-US-288713 @vaibhav @Forms @vai1
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

  @293607 @ValidatePOusercanseeReportTypeonGrantorPreapplicationFormsGrantorApplicationFormsGrantorSiteVisitFormsOrganizationDeskreviewonPackagessectionofFormsandPackagessectionundersetupofPlanningmodule @sprint-3-US-288713 @vaibhav @Forms @vai1
  Scenario: Validate PO user can see Report Type on Grantor Pre-application Forms, Grantor Application Forms, Grantor Site Visit Forms, Organization Desk review on Packages section of Forms & Packages section under setup of Planning module
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Site Visit" in "---program:-:packagesTableId---" panel
    Then I softly see value "Grantor Site Visit" for title "Package Name" inside table "---program:-:packagesTableId---"
    And I expand nested table containing column value "Grantor Site Visit Forms"
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "General Review Form" inside table "---program:-:packagesTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Financial Review Form" inside table "---program:-:packagesTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Program Review Form" inside table "---program:-:packagesTableId---"
    And I collapse nested table containing column value "Grantor Site Visit"
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
    And I expand nested table containing column value "Organization Desk Review"
    Then I softly see value "General Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "General Review Form" inside table "---program:-:packagesTableId---"
    Then I softly see value "Financial Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Financial Review Form" inside table "---program:-:packagesTableId---"
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---program:-:packagesTableId---"
    Then I softly see value "Site Visit/Desk Review Report" for title "Report Type" against the value "Program Review Form" inside table "---program:-:packagesTableId---"

  @293613 @ValidateEXEusercanseeReportTypeclmonSiteVisitformswhenuserclickonviewicononGrantorSiteVisitFormsunderBusinessFormssectiononsetuptabofAnnouncement @sprint-3-US-288713 @vaibhav @Forms @vai1
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
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

  @293617 @293620 @ValidatePOusecanseeReportTypeclmonOrganizationDeskReviewformswhenuserclickonviewicononOrganizationDeskReviewFormsunderBusinessFormssectiononsetuptabofAnnouncement @sprint-3-US-288713 @vaibhav @Forms @vai1
  Scenario: Validate PO user can see Report Type clm on Organization Desk Review forms when user click on view icon on Organization Desk Review Forms under Business Forms section on setup tab of Announcement
    When I login to "As a Grantor" app as "PO" user
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:PO Username} | Step 1  |
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
    Then I can see row level action button "Preview" against "Grantor Application Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Application Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I softly see value "Grantor Application Forms" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "Grantor Application Forms" inside table
    Then I softly see value "Program Application Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Application Report" for title "Report Type" against the value "Program Application Form" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Standard Assurances Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Application Report" for title "Report Type" against the value "Standard Assurances Form" inside table "---program:-:previewPackageTableId---"

  @293619 @ValidatePMusercanseeReportTypeclmonPreapplicationformswhenuserclickonviewicononGrantorPreapplicationFormsunderBusinessFormssectiononsetuptabofAnnouncement @sprint-3-US-288713 @vaibhav @Forms @vai1
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
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