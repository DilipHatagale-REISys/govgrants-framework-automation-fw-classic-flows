@grantor-regression @grantor-parallel-regression @progressReport @progressReportForms @regression
Feature: Validate scenarios in Progress Report Forms

  @284145 @ValidateSF428CINDusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonform @sprint-26-US-282679 @vaibhav @Forms
  Scenario: Validate SF428-C IND user can able to save & validate form after entering correct & valid data on all fields present on form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "SUBRECIPIENT_ORG_IND_USER-Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I softly see the text containing "Expiration Date: 11/30/2024"
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @284392 @ValidateSF425SPIusercanabletosaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF425form @sprint-26-US-282689 @vaibhav @Forms
  Scenario: Validate SF425 SPI user can able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF-425form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I softly see the text containing "Expiration Date: 02/28/2025"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 1. Federal Agency and Organizational Element to Which Report is Submitted is required to save.                                               |
      | 2. Federal Grant or Other Identifying Number Assigned by Federal Agency (To report multiple grants, use FFR Attachment) is required to save. |
      | 8a. Project/Grant Period From is required to save.                                                                                           |
      | 8b.To is required to save.                                                                                                                   |
      | 9. Reporting Period End Date is required to save.                                                                                            |
      | Recipient Organization Name is required to save.                                                                                             |
      | Street1 is required to save.                                                                                                                 |
      | City is required to save.                                                                                                                    |
      | State is required to save.                                                                                                                   |
      | ZIP / Postal Code is required to save.                                                                                                       |
      | First Name is required to save.                                                                                                              |
      | Last Name is required to save.                                                                                                               |
      | Title is required to save.                                                                                                                   |
      | b. Signature of Authorized Certifying Official is required to save.                                                                          |
      | c. Telephone (Area code, number and extension) is required to save.                                                                          |
      | d. Email Address is required to save.                                                                                                        |
      | e. Date Report Submitted is required to save.                                                                                                |
    And I refresh the page
    And I enter "SF425_Form" values from "ProgressReport_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
      | Classification                                                          | Cumulative |
      | a. Cash Receipts                                                        | 1000       |
      | b. Cash Disbursements                                                   | 500        |
      | d. Total Federal funds authorized                                       | 1000       |
      | e. Federal share of expenditures                                        | 1000       |
      | f. Federal share of unliquated obligations                              | 500        |
      | i. Total recipient share required                                       | 1000       |
      | j. Recipient share of expenditures                                      | 500        |
      | l. Total Federal share of program income earned                         | 1000       |
      | m. Program income expended in accordance with the deduction alternative | 500        |
      | n. Program income expended in accordance with the addition alternative  | 200        |
    When I enter the following values into flex table with id "---progressReport:-:sf425IndirectExpenseTableId---" by clicking "Add" :
      | Type  | Rate | Period From | Period To | Base | Federal Share |
      | Fixed | 100  | 25          | 30        | 10   | 10            |
    When I enter value "Unchecked" into field "fieldAcknowledgementSF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Certify the Federal Financial Report (SF-425) by checking the Acknowledgment Box before submitting to Grantor. |

  @284394 @ValidateSF425SPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonform @sprint-26-US-282689 @vaibhav @Forms @BugLogged-324964
  Scenario: Validate SF425 SPI user can able to save & validate form after entering correct & valid data on all fields present on form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I softly see the text containing "Expiration Date: 02/28/2025"
    And I enter "SF425_Form" values from "ProgressReport_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
      | Classification                                                          | Cumulative |
      | a. Cash Receipts                                                        | 1000       |
      | b. Cash Disbursements                                                   | 500        |
      | d. Total Federal funds authorized                                       | 1000       |
      | e. Federal share of expenditures                                        | 1000       |
      | f. Federal share of unliquated obligations                              | 500        |
      | i. Total recipient share required                                       | 1000       |
      | j. Recipient share of expenditures                                      | 500        |
      | l. Total Federal share of program income earned                         | 1000       |
      | m. Program income expended in accordance with the deduction alternative | 500        |
      | n. Program income expended in accordance with the addition alternative  | 200        |
    When I enter the following values into flex table with id "---progressReport:-:sf425IndirectExpenseTableId---" by clicking "Add" :
      | Type  | Rate | Period From | Period To | Base | Federal Share |
      | Fixed | 100  | 25          | 30        | 10   | 10            |
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

  @280156 @280161 @280184 @280193 @280216 @280243 @ValidateSPIuserseeFederalAgencyandOrganizationalElementtoWhichReportisSubmittedmandatoryfiledonSF425formwhichacceptmaximumalphanumericvalue @sprint-26-US-282689 @vaibhav @Forms
  Scenario: Validate SPI user see Federal Agency and Organizational Element to Which Report is Submitted mandatory filed on SF425 form which accept maximum alphanumeric value
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF425_Form" values from "ProgressReport_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
      | Classification                                                          | Cumulative |
      | a. Cash Receipts                                                        | 1000       |
      | b. Cash Disbursements                                                   | 500        |
      | d. Total Federal funds authorized                                       | 1000       |
      | e. Federal share of expenditures                                        | 1000       |
      | f. Federal share of unliquated obligations                              | 500        |
      | i. Total recipient share required                                       | 1000       |
      | j. Recipient share of expenditures                                      | 500        |
      | l. Total Federal share of program income earned                         | 1000       |
      | m. Program income expended in accordance with the deduction alternative | 500        |
      | n. Program income expended in accordance with the addition alternative  | 200        |
    When I enter the following values into flex table with id "---progressReport:-:sf425IndirectExpenseTableId---" by clicking "Add" :
      | Type  | Rate | Period From | Period To | Base | Federal Share |
      | Fixed | 100  | 25          | 30        | 10   | 10            |
    And I wait for "8" seconds
    And I clear the value from field "fieldFederalAgencySF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 1. Federal Agency and Organizational Element to Which Report is Submitted is required to save. |
    And I enter value "{AUTOEnvData:StringOf100Chars}" into field "fieldFederalAgencySF428__c"
    When I click on "Save" in the page details
    Then I softly see field "1. Federal Agency and Organizational Element to Which Report is Submitted" as "{AUTOEnvData:StringOf100Chars}"
    When I click on "Edit" in the page details
    And I clear the value from field "fieldRecipientOrganizationNameSF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #280161
    Then I softly see the following messages in the page details :
      | Recipient Organization Name is required to save. |
    And I enter value "{AUTOEnvData:StringOf60Chars}" into field "fieldRecipientOrganizationNameSF428__c"
    When I click on "Save" in the page details
    Then I softly see field "Recipient Organization Name" as "{AUTOEnvData:StringOf60Chars}"
    When I click on "Edit" in the page details
    And I clear the value from field "fieldStreet1SF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #280184
    Then I softly see the following messages in the page details :
      | Street1 is required to save. |
    And I enter value "{AUTOEnvData:StringOf55Chars}" into field "fieldStreet1SF428__c"
    When I click on "Save" in the page details
    Then I softly see field "Street1" as "{AUTOEnvData:StringOf55Chars}"
    When I click on "Edit" in the page details
    And I clear the value from field "fieldCitySF428__c"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    #280193
    Then I softly see the following messages in the page details :
      | City is required to save. |
    And I enter value "{AUTOEnvData:StringOf35Chars}" into field "fieldCitySF428__c"
    When I click on "Save" in the page details
    Then I softly see field "City" as "{AUTOEnvData:StringOf35Chars}"
    When I click on "Edit" in the page details
    When I enter value "--None--" into field "fieldCountrySF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #280216
    Then I softly see the following messages in the page details :
      | Country is required to save. |
    #280243
    When I enter value "USA: UNITED STATES" into field "fieldCountrySF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
      | Classification                                                          | Cumulative |
      | a. Cash Receipts                                                        | -30        |
      | b. Cash Disbursements                                                   | -10        |
      | d. Total Federal funds authorized                                       | -30        |
      | e. Federal share of expenditures                                        | -20        |
      | f. Federal share of unliquated obligations                              | -5         |
      | i. Total recipient share required                                       | -30        |
      | j. Recipient share of expenditures                                      | -20        |
      | l. Total Federal share of program income earned                         | -30        |
      | m. Program income expended in accordance with the deduction alternative | -20        |
      | n. Program income expended in accordance with the addition alternative  | -5         |
    Then I softly see the following messages in the page details :
      | The amount cannot be less than zero. |

  @280159 @280206 @ValidateSPAuserseeFederalGrantorOtherIdentifyingNumberAssignedbyFederalAgencyismandatoryfiledonSF425formwhichacceptmaximum30alphanumericvalue @sprint-26-US-282689 @vaibhav @Forms
  Scenario: Validate SPA user see "Federal Grant or Other Identifying Number Assigned by Federal Agency is mandatory filed on SF425 form which accept maximum 30 alphanumeric value
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPA" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF425_Form" values from "ProgressReport_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
      | Classification                                                          | Cumulative |
      | a. Cash Receipts                                                        | 1000       |
      | b. Cash Disbursements                                                   | 500        |
      | d. Total Federal funds authorized                                       | 1000       |
      | e. Federal share of expenditures                                        | 1000       |
      | f. Federal share of unliquated obligations                              | 500        |
      | i. Total recipient share required                                       | 1000       |
      | j. Recipient share of expenditures                                      | 500        |
      | l. Total Federal share of program income earned                         | 1000       |
      | m. Program income expended in accordance with the deduction alternative | 500        |
      | n. Program income expended in accordance with the addition alternative  | 200        |
    When I enter the following values into flex table with id "---progressReport:-:sf425IndirectExpenseTableId---" by clicking "Add" :
      | Type  | Rate | Period From | Period To | Base | Federal Share |
      | Fixed | 100  | 25          | 30        | 10   | 10            |
    And I clear the value from field "fieldFederalGrantIdentifyingNumbe__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 2. Federal Grant or Other Identifying Number Assigned by Federal Agency (To report multiple grants, use FFR Attachment) is required to save. |
    And I enter value "{AUTOEnvData:StringOf30Chars}" into field "fieldFederalGrantIdentifyingNumbe__c"
    When I click on "Save" in the page details
    Then I softly see field "2. Federal Grant or Other Identifying Number Assigned by Federal Agency (To report multiple grants, use FFR Attachment)" as "{AUTOEnvData:StringOf30Chars}"
    When I click on "Edit" in the page details
    And I clear the value from field "fieldStateSf428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #280206
    Then I softly see the following messages in the page details :
      | State is required to save. |

  @286154 @286159 @ValidateSF425ASPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonform @sprint-1-US-283119 @vaibhav @Forms
  Scenario: Validate SF425A SPI user can able to save & validate form after entering correct & valid data on all fields present on form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I softly see the text containing "Expiration Date: 02/28/2025"
    And I enter "SF425_Form" values from "ProgressReport_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
      | Classification                                                          | Cumulative |
      | a. Cash Receipts                                                        | 1000       |
      | b. Cash Disbursements                                                   | 500        |
      | d. Total Federal funds authorized                                       | 1000       |
      | e. Federal share of expenditures                                        | 1000       |
      | f. Federal share of unliquated obligations                              | 500        |
      | i. Total recipient share required                                       | 1000       |
      | j. Recipient share of expenditures                                      | 500        |
      | l. Total Federal share of program income earned                         | 1000       |
      | m. Program income expended in accordance with the deduction alternative | 500        |
      | n. Program income expended in accordance with the addition alternative  | 200        |
    When I enter the following values into flex table with id "---progressReport:-:sf425IndirectExpenseTableId---" by clicking "Add" :
      | Type  | Rate | Period From | Period To | Base | Federal Share |
      | Fixed | 100  | 25          | 30        | 10   | 10            |
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Back" in the page details
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "4" seconds
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I softly see the text containing "Expiration Date: 02/28/2025"
    And I enter "SF425A_Form" values from "ProgressReport_Field_Values.xlsx"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I enter the following values into flex table with id "---progressReport:-:sf425AGrantCoveredTableId---" by clicking "New" :
      | Federal Grant Number | Recipient Account Number | Cumulative Federal Cash Disbursement |
      | 6723457              | 89376289                 | 500                                  |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #286159
    When I click on "Back" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail

  @279756 @279764 @279785 @ValidateUserseeFederalAgencyandOrganizationalElementtoWhichReportisSubmittedmandatorylabelonSF425A @sprint-1-US-283119 @vaibhav @Forms
  Scenario: Validate User see Federal Agency and Organizational Element to Which Report is Submitted mandatory label on SF425-A
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I softly see the text containing "Expiration Date: 02/28/2025"
    And I enter "SF425A_Form" values from "ProgressReport_Field_Values.xlsx"
    And I clear the value from field "fieldFederalAgencyandOrganizationalSF429__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 1. Federal Agency and Organizational Element to Which Report is Submitted (Box 1 on Page 1) is required to save. |
    And I enter value "{AUTOEnvData:StringOf100Chars}" into field "fieldFederalAgencyandOrganizationalSF429__c"
    When I click on "Save" in the page details
    Then I softly see field "1. Federal Agency and Organizational Element to Which Report is Submitted (Box 1 on Page 1)" as "{AUTOEnvData:StringOf100Chars}"
    When I click on "Edit" in the page details
    #279764
    And I clear the value from field "fieldRecipientOrganizationNameSF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 2. Recipient Organization (Box 3 on Page 1) is required to save. |
    And I enter value "{AUTOEnvData:StringOf60Chars}" into field "fieldRecipientOrganizationNameSF428__c"
    When I click on "Save" in the page details
    Then I softly see field "2. Recipient Organization (Box 3 on Page 1)" as "{AUTOEnvData:StringOf60Chars}"
    #279785
    When I click on "Edit" in the page details
    And I clear the value from field "fieldDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 4. Reporting Period End Date (Box 9 on Page 1) is required to save. |

  @279789 @279799 @ValidateSPAuserseeFederalGrantNumberismandatorylabelonSF425Aform @sprint-1-US-283119 @vaibhav @Forms
  Scenario: Validate SPA user see "Federal Grant Number" is mandatory label on SF425-A form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPA" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I softly see the text containing "Expiration Date: 02/28/2025"
    And I enter "SF425A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I enter the following values into flex table with id "---progressReport:-:sf425AGrantCoveredTableId---" by clicking "New" :
      | Federal Grant Number | Recipient Account Number | Cumulative Federal Cash Disbursement |
      |                      | 89376289                 | 250                                  |
    Then I softly see the following messages in the page details :
      | Required Field Missing |
    And I refresh the page
    #279799
    When I enter the following values into flex table with id "---progressReport:-:sf425AGrantCoveredTableId---" by clicking "New" :
      | Federal Grant Number | Recipient Account Number | Cumulative Federal Cash Disbursement |
      | 89376289849          |                          | 250                                  |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Required Field Missing |

  @286153 @ValidateSF425ASPIusercanabletosaveallfieldsbutvalidationisgeneratedonsavebuttonandvalidatebuttonafterenteringincorrectorblankdatadatainallfieldspresentonSF425form @sprint-1-US-283119 @vaibhav @Forms
  Scenario: Validate SF425 A SPI user can able to save all fields but validation is generated on save button and validate button after entering incorrect or blank data data in all fields present on SF 425form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Federal Financial Report Attachment - SF-425A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I softly see the text containing "Expiration Date: 02/28/2025"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 1. Federal Agency and Organizational Element to Which Report is Submitted (Box 1 on Page 1) is required to save. |
      | 2. Recipient Organization (Box 3 on Page 1) is required to save.                                                 |
      | 4. Reporting Period End Date (Box 9 on Page 1) is required to save.                                              |
    And I enter "SF425A_Form" values from "ProgressReport_Field_Values.xlsx"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I enter the following values into flex table with id "---progressReport:-:sf425AGrantCoveredTableId---" by clicking "New" :
      | Federal Grant Number | Recipient Account Number | Cumulative Federal Cash Disbursement |
      | 89376289             | 89376289                 | 250                                  |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | "Sum of Cumulative Federal Cash Disbursement" must be Equal to "10 b Cash Disbursement" in Transactions section of Federal Financial Report (SF-425). |

  @284854 @283885 @283920 @284017 @ValidateSF428SSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonform @sprint-26-US-282679 @vaibhav @Forms
  Scenario: Validate SF428 S SPI user can able to save & validate form after entering correct & valid data on all fields present on form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "4" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    #284854
    Then I softly see field "Status" as "Created"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text "Expiration Date: 11/30/2024"
    When I click on "Edit" in the page details
    #283885
    Then I softly see field "Annual Report (SF-428-A)" inside page block
    Then I softly do not see asterisk mark on "Annual Report (SF-428-A)"
    When I hovering mouse on help text icon inside page block detail "Annual Report (SF-428-A)"
    Then I softly see "Check to Select." shown as help text for label "Annual Report (SF-428-A)"
    #283920
    Then I softly see field "Final (Award Closeout) Report (SF-428-B)" inside page block
    Then I softly do not see asterisk mark on "Final (Award Closeout) Report (SF-428-B)"
    When I hovering mouse on help text icon inside page block detail "Final (Award Closeout) Report (SF-428-B)"
    Then I softly see "Check to select." shown as help text for label "Final (Award Closeout) Report (SF-428-B)"
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @284062 @ValidateSF428SINDusercanabletosaveallfieldbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF428Sform @sprint-26-US-282679 @vaibhav @Forms @Bug_Logged-326500 @wip
  Scenario: Validate SF428-S IND user can able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF-428-S form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "SUBRECIPIENT_ORG_IND_USER-Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "4" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Federal Grant or Other Identifying Number Assigned by Federal Awarding Agency (Block 2 of SF-428) is required to save. |
    And I enter value "78904" into field "fieldFederalGrantIdentifyingNumbe__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Selecting at least one applicable attachment in "Attachment Type". |
    When I click on "Edit" in the page details
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter value "Checked" into field "fieldAnnualReportSF428A__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details :
      | GP or ACQ is required to save.             |
      | Description is required to save.           |
      | Identification Number is required to save. |
      | Acquired Date is required to save.         |
      | Condition Code is required to save.        |
      | Acquisition Cost is required to save.      |

  @284129 @ValidateSF248SSPIonlyrecordownershouldhaveeditaccessonformotherusercanhaveonlyviewaccess @sprint-26-US-282679 @vaibhav @Forms
  Scenario: Validate SF248-S SPI only record owner should have edit access on form other user can have only view access
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "4" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Back" in the page details
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Validate" in page detail
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail

  @284139 @284101 @ValidateSF428SAdminusershouldnotseeEditbuttononforminForceclosestatusonprogressreport @sprint-26-US-282679 @vaibhav @Forms
  Scenario: Validate SF428 S Admin user should not see 'Edit' button on form in Force close status on progress report
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "4" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Back" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside table
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
      | Name          | Closeout |
      | Automation PM | Step 1   |
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
    When I click on "Override" in the page details
    And I wait for "4" seconds
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Force Closed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    #284101
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Force Closed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail

  @284097 @ValidateSF428SSPAusershouldnotseeEditbuttononforminSubmittedtothegrantorsentforreviedreviewedSubmittedforApprovalApprovedstatusofprogressreport @sprint-26-US-282679 @vaibhav @Forms
  Scenario: Validate SF428 S SPA user should not see 'Edit' button on form in Submitted to the grantor sent for review reviewed Submitted for Approval Approved status of progress report
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---progressReport:-:peerReviewersTableId---"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail

  @284123 @284133 @ValidateSF428SSPIuserseethepreviewandviewicononforminCreatedSentbackSrSubmittedtothegrantorsentforreviewreviewedSubmittedforApprovalApprovedstateofprogressreport @sprint-26-US-282679 @vaibhav @Forms
  Scenario: Validate SF428 S SPI user see the preview and view icon on form in Created/Sent back to S/r / Submitted to the grantor/sent for review/reviewed/Submitted for Approval/Approved state of progress report
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    #284133
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I click on "Back" in the page details
    And I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---progressReport:-:peerReviewersTableId---"
    #284133
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    #284133
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    #284133
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 25     | 7             |
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #284133
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "---progressReport:-:internalProgressReportFlexTableId---"
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    #284133
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail

  @284223 @ValidateSF428CSPIusercanabletosaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdataallfieldspresentonSF428Cform @sprint-26-US-282679 @vaibhav @Forms
  Scenario: Validate SF428C SPI user can able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF428C form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I softly see the text containing "Expiration Date: 11/30/2024"
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter "SF428C_Wrong_Data" values from "ProgressReport_Field_Values.xlsx"
    And I clear the value from field "fieldSaleProceedsMarketValue__c"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    And I wait for "6" seconds
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent ", If "(i) Request Federal Agency disposition instructions" option in "Federally-owned Property" is checked. |
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent " or Add comment in "Comments Section", If "(ii) Other" option in "Federally-owned Property" is checked.     |
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent ", If any option in "1b. Equipment Acquired under a Federal Award" is checked.                               |
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent ", If "3. Report Loss, Destruction or Theft of Federally-owned Property" is checked.                         |
      | Any one among "Sale Proceeds" or "Estimate of Current Fair Market Value" is required to be checked, if "2b. Sale of acquire equipment" is checked.                                                                              |
      | "Percentage of Federal participation" is required, if "2b. Sale of acquire equipment" is checked.                                                                                                                               |
      | "Federal Share" is required, if "2b. Sale of acquire equipment" is checked.                                                                                                                                                     |
      | "Selling and handling allowance", if "2b. Sale of acquired equipment" is checked.                                                                                                                                               |
      | Total Amount is required, if "2b. Sale of acquire equipment" is checked.                                                                                                                                                        |

  @329591 @ValidateSF425validationshoulddisplayonvalidatebutton @sprint-11-US-328863 @vaibhav @Forms
  Scenario: Validate SF425 validation should display on validate button
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Federal Financial Report - SF-425" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I softly see the text containing "Expiration Date: 02/28/2025"
    And I enter "SF425_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter value "-50" into field "fieldAcquisitionDateSF428A__c"
    And I enter value "1234" into field "fieldZipPostalCodeSF428__c"
    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
      | Classification                                                          | Cumulative |
      | a. Cash Receipts                                                        | 1000       |
      | b. Cash Disbursements                                                   | 500        |
      | d. Total Federal funds authorized                                       | 1000       |
      | e. Federal share of expenditures                                        | 1000       |
      | f. Federal share of unliquated obligations                              | 500        |
      | i. Total recipient share required                                       | 1000       |
      | j. Recipient share of expenditures                                      | 500        |
      | l. Total Federal share of program income earned                         | 1000       |
      | m. Program income expended in accordance with the deduction alternative | 500        |
      | n. Program income expended in accordance with the addition alternative  | 200        |
    When I enter the following values into flex table with id "---progressReport:-:sf425IndirectExpenseTableId---" by clicking "Add" :
      | Type  | Rate | Period From | Period To | Base | Federal Share |
      | Fixed | 100  | 25          | 30        | 10   | 10            |
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
      | Project/Grant Period From date cannot be after Project/Grant Period To date                           |
      | Project/Grant Period To date cannot be before Project/Grant Period From date                          |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field. |

  @282059 @ValidateSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF428Bform @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SPI user can able to save & validate form after entering correct & valid data on all fields present on SF-428-B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text "Expiration Date: 11/30/2024"
    And I click on "Edit" in the page details
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @282061 @ValidateSPIusercanablesaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF428Bform @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SPI user can able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF-428-B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I enter value "UnChecked" into field "fieldFederallyownedProperty__c"
    When I enter value "UnChecked" into field "fieldAcquiredEquipment__c"
    When I enter value "UnChecked" into field "fieldResidualUnusedSupplies__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Selecting at least one that apply in 'Report' is required. |
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldFederallyownedProperty__c"
    When I enter value "Checked" into field "fieldAcquiredEquipment__c"
    When I enter value "Checked" into field "fieldResidualUnusedSupplies__c"
    When I enter value "Checked" into field "fieldNoneoftheAbove__c"
    And I clear the value from field "fieldFederalAwardIdentifier__c"
    When I enter value "UnChecked" into field "fieldRequestTransfertoAward__c"
    When I enter value "UnChecked" into field "fieldRequestFederalAgency__c"
    When I enter value "UnChecked" into field "fieldOther__c"
    When I enter value "UnChecked" into field "fieldAcknowledgeEquipment__c"
    When I enter value "UnChecked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    And I clear the value from field "fieldTotalAmount__c"
    And I clear the value from field "fieldPercentageofFederalParticipation__c"
    And I clear the value from field "fieldFederalShare__c"
    And I clear the value from field "fieldSellingandHandlingAllowance__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | If "1d" is checked, uncheck "1a", "1b" and "1c" in 'Report' section.                                                                            |
      | One selection is required in "2a. Federally-owned Property", if "1a" is checked in 'Report' section.                                            |
      | One selection is required in "2b. Acquired Equipment with current fair market value of $5,000 or more", if "1b" is checked in 'Report' section. |
      | "Total Amount" is required in "2c. Reportable Residual Unused Supplies", if "1c" is checked in 'Report' section.                                |
      | "Percentage of Federal participation" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.         |
      | "Federal share" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.                               |
      | "Selling and handling allowance" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.              |

  @282061 @ValidateSPIusercanablesaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF428Bform @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SPI user can able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF-428-B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428B_2c_deselect" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Federal Award Identifier is required if "Request transfer to Award" is selected in the "2a. Federally-owned Property".                                                    |
      | One selection is required in "2c. Reports Residual Unused Supplies", If "1c" is checked in 'Report' section.                                                              |
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property".                   |
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |

  @280467 @ValidateSPIusercanseesectionReportSelectallthatapplyonSF428BformseefollowingoptiononthisfieldofSF428Bform @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SPI user can see section Report Select all that apply on SF 428 B form see following option on this field of SF 428 B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text "Expiration Date: 11/30/2024"
    And I click on "Edit" in the page details
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "11" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Selecting at least one that apply in 'Report' is required. |
    When I click on "Edit" in the page details
    And I refresh the page
    When I enter value "Checked" into field "fieldFederallyownedProperty__c"
    When I enter value "Checked" into field "fieldAcquiredEquipment__c"
    When I enter value "Checked" into field "fieldResidualUnusedSupplies__c"
    When I enter value "Checked" into field "fieldNoneoftheAbove__c"
    When I enter value "Checked" into field "fieldRequestTransfertoAward__c"
    When I enter value "Test" into field "fieldFederalAwardIdentifier__c"
    When I enter value "Checked" into field "fieldRequestFederalAgency__c"
    When I enter value "Checked" into field "fieldOther__c"
    When I enter value "Checked" into field "fieldAcknowledgeEquipment__c"
    When I enter value "Checked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    When I enter value "(i) Sale Proceeds OR" into field "fieldSaleProceedsrEstimateofCurrentFai__c"
    When I enter value "85" into field "fieldTotalAmount__c"
    When I enter value "85" into field "fieldPercentageofFederalParticipation__c"
    When I enter value "9999.99" into field "fieldFederalShare__c"
    When I enter value "9999.99" into field "fieldSellingandHandlingAllowance__c"
    When I enter value "Automation Test" into field "fieldComments__c"
    When I enter value "(i) Recipient request approved" into field "fieldAgencyresponsetorequested__c"
    When I enter value "(i) Recipient request approved" into field "fieldAgencyresponse__c"
    When I enter value "Checked" into field "fieldDisposeinaccordance__c"
    When I enter value "Checked" into field "fieldDisposeinaccordancewithattached__c"
    When I enter value "Automation Test" into field "fieldAORSignature__c"
    When I enter value "0" into field "fieldAcquisitionDateSF428A__c"
    When I enter value "John" into field "fieldName428B__c"
    When I enter value "9867589302" into field "fieldTelephone__c"
    When I enter value "test" into field "fieldTitle__c"
    When I enter value "automation@yopmail.com" into field "fieldEmailAddress__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | If "1d" is checked, uncheck "1a", "1b" and "1c" in 'Report' section. |

  @280505 @ValidateSPIusercanseefieldFederallyownedProperty&seefollowingoptionsunderthisfieldonCompleterelevantsectionsofSF428Bform @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SPI user can see field Federally owned Property see following options under this field on Complete relevant sections of SF-428-B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    When I enter value "Checked" into field "fieldFederallyownedProperty__c"
    Then I softly see fields "fieldRequestTransfertoAward__c" is in edit mode
    Then I softly see fields "fieldRequestFederalAgency__c" is in edit mode
    Then I softly see fields "fieldOther__c" is in edit mode
    Then I softly see that "(i) Acknowledge equipment acquired under this federal award will be retained for use as originally approved" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
    Then I softly see that "(iii) Federal Share" rendered in view mode only
    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
    Then I softly see field "(i) Request transfer to Award" inside page block
    Then I softly see field "Federal Award Identifier" inside page block
    Then I softly see field "(ii) Request Federal Agency disposition instructions" inside page block
    Then I softly see field "(iii) Other (Provide detail in Block 3 or attach request)" inside page block
    Then I softly see that "Federal Award Identifier" rendered in view mode only
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | One selection is required in "2a. Federally-owned Property", if "1a" is checked in 'Report' section. |
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldRequestTransfertoAward__c"
    When I enter value "Checked" into field "fieldOther__c"
    Then I softly see fields "fieldFederalAwardIdentifier__c" is in edit mode
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "3. Other" from computer
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Federal Award Identifier is required if "Request transfer to Award" is selected in the "2a. Federally-owned Property".                                  |
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldRequestFederalAgency__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Federal Award Identifier is required if "Request transfer to Award" is selected in the "2a. Federally-owned Property".                                  |
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    When I click on "Edit" in the page details
    When I enter value "111" into field "fieldFederalAwardIdentifier__c"
    When I enter value "UnChecked" into field "fieldOther__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Edit" in the page details
    And I clear the value from field "fieldFederalAwardIdentifier__c"
    And I clear the value from field "fieldRequestTransfertoAward__c"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    And I refresh the page
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @280531 @ValidateSPIusercanseefieldAcquiredequipmentwithcurrentfairmarketvalueof$5000ormoreSelectoneormoreandattachsupplementalsheetSF428SseefollowingoptionsunderthisfieldonCompleterelevantsectionsofSF428Bform @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SPI user can see field Acquired equipment with current fair market value of $5000 or more(Select one or more and attach supplemental sheet SF 428S & see following options under this field on Complete relevant sections of SF 428 B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    When I enter value "Checked" into field "fieldAcquiredEquipment__c"
    Then I softly see that "(i) Request transfer to Award" rendered in view mode only
    Then I softly see that "Federal Award Identifier" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "(iii) Other (Provide detail in Block 3 or attach request)" rendered in view mode only
    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
    Then I softly see that "(iii) Federal Share" rendered in view mode only
    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
    Then I softly see "(i) Acknowledge equipment acquired under this federal award will be retained for use as originally approved" inside page block detail
    Then I softly see "(ii) Request Federal Agency disposition instructions" inside page block detail
    Then I softly see fields "fieldAcknowledgeEquipment__c" is in edit mode
    Then I softly see fields "fieldRequestFederalAgencyDispositionInstr__c" is in edit mode
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | One selection is required in "2b. Acquired Equipment with current fair market value of $5,000 or more", if "1b" is checked in 'Report' section. |
    When I click on "Edit" in the page details
    When I enter value "UnChecked" into field "fieldFederallyownedProperty__c"
    When I enter value "Checked" into field "fieldAcquiredEquipment__c"
    When I enter value "Checked" into field "fieldAcknowledgeEquipment__c"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    And I refresh the page
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "3. Other" from computer
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    And I refresh the page
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I click on "Delete" icon for "3. Other" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @281840 @ValidateSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF428form @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SPI user can able to save & validate form after entering correct & valid data on all fields present on SF-428 form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Fill SF428-C Form
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-B Form
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-A Form
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "View" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text " Expiration Date: 11/30/2024"
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #SF 428 Form
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text "Expiration Date: 11/30/2024"
    When I click on "Edit" in the page details
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @281844 @ValidateSPIusercanabletosavallfieldsbutvalidationisgenerateonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF428form @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SPI user can able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF-428 form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text "Expiration Date: 11/30/2024"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 1. Federal Agency and Organizational Element to Which Report is Submitted is required to save.    |
      | 2. Federal Grant or Other Identifying Number Assigned by Federal Agency is required to save.      |
      | Recipient Organization Name is required to save.                                                  |
      | Street1 is required to save.                                                                      |
      | City is required to save.                                                                         |
      | 7. Supplemental Sheet is required to save.                                                        |
      | First Name is required to save.                                                                   |
      | Last Name is required to save.                                                                    |
      | Title is required to save.                                                                        |
      | 9b. Signature of Authorized Certifying Official is required to save.                              |
      | 9c. Telephone(area code,number, extension) of Authorized Certifying Official is required to save. |
      | 9d. E-mail Address of Authorized Certifying Official is required to save.                         |
      | 9e. Date Report Submitted (MM/DD/YYYY) is required to save.                                       |
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSupplementalSheet__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Final (Award Closeout) Report (SF-428-B) is required to be submitted as it is selected in field 6 'Attachment'. |
      | Annual Report (SF-428-A) is required to be submitted as it is selected in field 6 'Attachment'.                 |
      | Disposition Report/Request (SF-428-C) is required to be submitted as it is selected in field 6 'Attachment'.    |
      | SF-428S or equivalent document is required to be submitted as it is selected in field '7. Supplemental Sheet'.  |

  @281844
  Scenario: Validate the validation for fill the SF428-A,B,C,S form but not checked field in SF 428
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I click on "Edit" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428_field_not_filled" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    #Fill SF428-C Form
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-B Form
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-A Form
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "View" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text " Expiration Date: 11/30/2024"
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-S
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "4" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "View" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select the Final (Award Closeout) Report (SF-428-B) as required form is filled. |
      | Select the Annual Report (SF-428-A) as required form is filled.                 |
      | Select the Disposition Report/Request (SF-428-C) as required form is filled.    |
      | Select Supplement Sheet as Yes as required form is filled.                      |

  @282976 @282974 @ValidateSF428ASPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF428AformandCompleteBusinessFlow @sprint-26-US-282679 @vaibhav @Forms
  Scenario: Validate SF428 A SPI user can able to save & validate form after entering correct & valid data on all fields present on SF-428-A form and Complete Business flow
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text " Expiration Date: 11/30/2024"
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Back" in the page details
    #282976
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Send Back to Subrecipient" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "---progressReport:-:internalProgressReportFlexTableId---"
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"

  @281845 @ValidateusercanabletofillformsSF428ABSF428SsubmitprogressreportusershouldabletocompletebusinessworkflowApprovedProgressReport @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate user can able to fill forms SF 428, A, B, C & SF428 S submit progress report & user should able to complete business work flow & Approved Progress Report
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Fill SF428-C Form
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-B Form
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-A Form
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "View" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text " Expiration Date: 11/30/2024"
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-S
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #SF 428 Form
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text "Expiration Date: 11/30/2024"
    When I click on "Edit" in the page details
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSupplementalSheet__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Back" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation FO | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "---progressReport:-:internalProgressReportFlexTableId---"
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in flex table with id "---progressReport:-:formTableId---"

  @282975 @ValidateSF428ASPIusercanabletosaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF428Aform @sprint-26-US-282679 @vaibhav @Forms @TBE
  Scenario: Validate SF428 A SPI user can able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF428A form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Annual Report - SF-428-A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text " Expiration Date: 11/30/2024"
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details :
      | Description is required to save.      |
      | Identification is required to save.   |
      | Acquisition Date is required to save. |
      | Acquisition Cost is required to save. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Federal Grant or Other Identifying Number Assigned by Federal Agency is required to save. |
      | 1. Report Type is required to save.                                                       |
      | 2. Report As of is required to save.                                                      |
    And I enter value "1234" into field "fieldFederalGrantSF428A__c"
    And I enter value "(a) Individual (Reporting Federally-owned property for one award)" into field "fieldReportTypePiclikist__c"
    And I enter value "30 SEP" into field "fieldReportAsOf__c"
    And I enter value "Test" into field "fieldCommentsSF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | If year is selected, report type As of Year is required. |
    When I click on "Edit" in the page details
    And I enter value "Or" into field "fieldReportAsOf__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | If date is selected, report type As of Date is required. |

  @285221 @ValidateSF428AvalidationshouldbedisplayonparentformSF428ifchildformnotvalidatedbutselectyesonparentform @sprint-26-US-282679 @vaibhav @Forms @TBE
  Scenario: Validate SF428 A validation should be display on parent form SF428 if child form not validated but select yes on parent form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - SF-428" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text "Expiration Date: 11/30/2024"
    When I click on "Edit" in the page details
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    When I enter value "Unchecked" into field "fieldAnnualReportSF428A__c"
    When I enter value "Unchecked" into field "fieldFinalReportSF428B__c"
    When I enter value "Unchecked" into field "fieldDispositionReportRequestSF428C__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "5" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldAnnualReportSF428A__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Annual Report (SF-428-A) is required to be submitted as it is selected in field 6 'Attachment'. |
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldAnnualReportSF428A__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I select "Tangible Personal Property Report - Annual Report - SF-428-A" from dropdown at forms
    When I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    When I click on "Validate" in the page details
    And I wait for "4" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Select the Annual Report (SF-428-A) as required form is filled. |

  @280402 @ValidateSPIusercanseesection6AttachmentonSF428Formseebelowfieldsonsection @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SPI user can see section 6 Attachment on SF428 Form & see below fields on section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I click on "Edit" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    #SF428-B
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "View" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    #SF428-C
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "View" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    #SF428-A
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "View" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    #SF428
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "View" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Final (Award Closeout) Report (SF-428-B) is required to be submitted as it is selected in field 6 'Attachment'. |
      | Annual Report (SF-428-A) is required to be submitted as it is selected in field 6 'Attachment'.                 |
      | Disposition Report/Request (SF-428-C) is required to be submitted as it is selected in field 6 'Attachment'.    |
    #Fill SF428-C Form
    And I select "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-B Form
    And I select "Tangible Personal Property Report - Final Report - SF-428-B" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-A Form
    And I select "Tangible Personal Property Report - Annual Report - SF-428-A" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    And I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldAnnualReportSF428A__c"
    When I enter value "Unchecked" into field "fieldFinalReportSF428B__c"
    When I enter value "Unchecked" into field "fieldDispositionReportRequestSF428C__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select the Final (Award Closeout) Report (SF-428-B) as required form is filled. |
      | Select the Annual Report (SF-428-A) as required form is filled.                 |
      | Select the Disposition Report/Request (SF-428-C) as required form is filled.    |

  @280404 @ValidateSPIusercanseesection7SupplementalsheetonSF428Formseebelowoptiononfields @sprint-25-US-280119 @vaibhav @Forms @TBE
  Scenario: Validate SPI user can see section 7 Supplemental sheet on SF428 Form see below option on fields
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    Then I softly see field "7. Supplemental Sheet" inside page block
    Then I see radio button "Yes" for field "fieldSupplementalSheet__c"
    Then I see radio button "No" for field "fieldSupplementalSheet__c"
    And I enter value "Yes" into field "fieldSupplementalSheet__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | SF-428S or equivalent document is required to be submitted as it is selected in field '7. Supplemental Sheet'. |
     #Fill SF428-S
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    When I click on "Edit" in the page details
    And I enter value "No" into field "fieldSupplementalSheet__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select Supplement Sheet as Yes as required form is filled. |

  @284859 @ValidateSF428SvalidationshouldbedisplayonparentformSF428ifchildformnotvalidatedbutselectyeonparentform @sprint-26-US-282679 @vaibhav @Forms @TBE
  Scenario: Validate SF428S validation should be display on parent form SF428 if child form not validated but select yes on parent form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I enter "SF428_Supp_not_Selected" values from "ProgressReport_Field_Values.xlsx"
    Then I softly see field "7. Supplemental Sheet" inside page block
    Then I see radio button "Yes" for field "fieldSupplementalSheet__c"
    Then I see radio button "No" for field "fieldSupplementalSheet__c"
    When I click on "Save" in the page details
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 7. Supplemental Sheet is required to save. |
    And I enter value "Yes" into field "fieldSupplementalSheet__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | SF-428S or equivalent document is required to be submitted as it is selected in field '7. Supplemental Sheet'. |
     #Fill SF428-S
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    When I click on "Edit" in the page details
    And I enter value "No" into field "fieldSupplementalSheet__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select Supplement Sheet as Yes as required form is filled. |

  @285185 @ValidateSF428CvalidationshouldbedisplayonparentformSF428ifchildformnotvalidatedbutYESonparentform @sprint-26-US-282679 @vaibhav @Forms @TBE
  Scenario: Validate SF428 C validation should be display on parent form SF428 if child form not validated but YES on parent form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I click on "Edit" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428_field_not_filled" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldDispositionReportRequestSF428C__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Disposition Report/Request (SF-428-C) is required to be submitted as it is selected in field 6 'Attachment'. |
    #Fill SF428-C Form
    And I select "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldDispositionReportRequestSF428C__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Select the Disposition Report/Request (SF-428-C) as required form is filled. |

  @285229 @298720 @ValidateSF428validationshouldbedisplayonSF428ifchildSF428ASF428CformnotvalidatedbutSF428BformvalidatedifIselectall3optionsonAttachmentselectnooptiononsupplementalsheetValidateSF428Sform @sprint-26-US-282679 @vaibhav @Forms
  Scenario: Validate SF428 validation should be display on SF428 if child SF428A SF428C form not validated but SF-428-B form validated if I select all 3 options on Attachment & select no option on supplemental sheet & Validate SF 428 S form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    #Fill SF428-C Form
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428C_Wrong_Data" values from "ProgressReport_Field_Values.xlsx"
    And I clear the value from field "fieldSaleProceedsMarketValue__c"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent ", If "(i) Request Federal Agency disposition instructions" option in "Federally-owned Property" is checked. |
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent " or Add comment in "Comments Section", If "(ii) Other" option in "Federally-owned Property" is checked.     |
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent ", If any option in "1b. Equipment Acquired under a Federal Award" is checked.                               |
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent ", If "3. Report Loss, Destruction or Theft of Federally-owned Property" is checked.                         |
      | Any one among "Sale Proceeds" or "Estimate of Current Fair Market Value" is required to be checked, if "2b. Sale of acquire equipment" is checked.                                                                              |
      | "Percentage of Federal participation" is required, if "2b. Sale of acquire equipment" is checked.                                                                                                                               |
      | "Federal Share" is required, if "2b. Sale of acquire equipment" is checked.                                                                                                                                                     |
      | "Selling and handling allowance", if "2b. Sale of acquired equipment" is checked.                                                                                                                                               |
      | Total Amount is required, if "2b. Sale of acquire equipment" is checked.                                                                                                                                                        |
    #Fill SF428-B Form
    And I select "Tangible Personal Property Report - Final Report - SF-428-B" from dropdown at forms
    When I click on "Edit" in the page details
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-A Form
    And I select "Tangible Personal Property Report - Annual Report - SF-428-A" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter value "1234" into field "fieldFederalGrantSF428A__c"
    And I enter value "(a) Individual (Reporting Federally-owned property for one award)" into field "fieldReportTypePiclikist__c"
    And I enter value "30 SEP" into field "fieldReportAsOf__c"
    And I enter value "Test" into field "fieldCommentsSF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | If year is selected, report type As of Year is required. |
    #SF 428-S
    And I select "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" from dropdown at forms
    When I click on "Edit" in the page details
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #SF 428 Form
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    When I click on "Edit" in the page details
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Annual Report (SF-428-A) is required to be submitted as it is selected in field 6 'Attachment'.              |
      | Disposition Report/Request (SF-428-C) is required to be submitted as it is selected in field 6 'Attachment'. |
      | Select Supplement Sheet as Yes as required form is filled.                                                   |
    #298720
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldDispositionReportRequestSF428C__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Annual Report (SF-428-A) is required to be submitted as it is selected in field 6 'Attachment'. |
      | Select Supplement Sheet as Yes as required form is filled.                                      |

  @285223 @ValidateSF428BvalidationshouldbedisplayonparentformSF428ifchildformnotvalidatedbutselectyesonparentform @sprint-26-US-282679 @vaibhav @Forms
  Scenario: Validate SF428 B validation should be display on parent form SF428 if child form not validated but select yes on parent form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428B_2c_deselect" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Federal Award Identifier is required if "Request transfer to Award" is selected in the "2a. Federally-owned Property".                                                    |
      | One selection is required in "2c. Reports Residual Unused Supplies", If "1c" is checked in 'Report' section.                                                              |
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property".                   |
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    # SF-428
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    When I click on "Edit" in the page details
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    When I enter value "Unchecked" into field "fieldAnnualReportSF428A__c"
    When I enter value "Unchecked" into field "fieldFinalReportSF428B__c"
    When I enter value "Unchecked" into field "fieldDispositionReportRequestSF428C__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldFinalReportSF428B__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Final (Award Closeout) Report (SF-428-B) is required to be submitted as it is selected in field 6 'Attachment'. |
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldFinalReportSF428B__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    #Fill SF428-B Form
    And I select "Tangible Personal Property Report - Final Report - SF-428-B" from dropdown at forms
    When I click on "Edit" in the page details
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select the Final (Award Closeout) Report (SF-428-B) as required form is filled. |

  @280653 @ValidateSPIusercanseefieldReportsResidualUnusedSuppliesseefollowingoptionsunderthiieldonCompleterelevantsectionsofSF428Bform @sprint-25-US-280119 @vaibhav @Forms @BugLogged-281717
  Scenario: Validate SPI user can see field "Reports Residual Unused Supplies" & see following options under this field on Complete relevant section(s) of SF428B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "Checked" into field "fieldResidualUnusedSupplies__c"
    Then I softly see "2c. Reports Residual Unused Supplies" inside page block detail
    Then I softly see "Total Amount" inside page block detail
    Then I softly see "(ii) Percentage of Federal participation" inside page block detail
    Then I softly see "(iii) Federal Share" inside page block detail
    Then I softly see "(iv) Selling and handling allowance" inside page block detail
    Then I softly see fields "fieldSaleProceedsrEstimateofCurrentFai__c" is in edit mode
    #TO DO: commented below step due to Logged the bug for below validation Bug ID:- 281717 once bug reolved will uncomment this step
#    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see fields "fieldFederalShare__c" is in edit mode
    Then I softly see fields "fieldSellingandHandlingAllowance__c" is in edit mode
    Then I softly see that "(v) Amount remitted to the Federal Government" rendered in view mode only
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | One selection is required in "2c. Reports Residual Unused Supplies", If "1c" is checked in 'Report' section.                            |
      | "Percentage of Federal participation" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section. |
      | "Federal share" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.                       |
      | "Selling and handling allowance" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.      |
    When I click on "Edit" in the page details
    And I enter value "(i) Sale Proceeds OR" into field "fieldSaleProceedsrEstimateofCurrentFai__c"
    Then I softly see fields "fieldTotalAmount__c" is in edit mode
    Then I softly see fields "fieldFederalShare__c" is in edit mode
    Then I softly see fields "fieldSellingandHandlingAllowance__c" is in edit mode
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | "Total Amount" is required in "2c. Reportable Residual Unused Supplies", if "1c" is checked in 'Report' section.                        |
      | "Percentage of Federal participation" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section. |
      | "Federal share" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.                       |
      | "Selling and handling allowance" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.      |
    When I click on "Edit" in the page details
    And I enter value "66" into field "fieldTotalAmount__c"
    And I enter value "33" into field "fieldPercentageofFederalParticipation__c"
    And I enter value "44" into field "fieldFederalShare__c"
    And I enter value "11" into field "fieldSellingandHandlingAllowance__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @285156 @285161 @285162 @285163 @ValidateSF428BAddingfileisrequiredtypeSupplementalSheetSF428Srecipientequivalentisrequiredinall2optionsofAcquiredEquipmentwithcurrentfairmarketvalueoffieldwhen1bisselect1Reportsection @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF 428 B Adding file is required type Supplemental Sheet SF 428S or recipient equivalent" is required in" all 2 options of Acquired Equipment with current fair market value of field when 1b is select in 1 Report section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    When I enter value "Checked" into field "fieldAcquiredEquipment__c"
    Then I softly see that "(i) Request transfer to Award" rendered in view mode only
    Then I softly see that "Federal Award Identifier" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "(iii) Other (Provide detail in Block 3 or attach request)" rendered in view mode only
    Then I softly see fields "fieldAcknowledgeEquipment__c" is in edit mode
    Then I softly see fields "fieldRequestFederalAgencyDispositionInstr__c" is in edit mode
    When I enter value "Checked" into field "fieldAcknowledgeEquipment__c"
    When I enter value "Checked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    #285161
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Delete" icon for "1. Supplemental Sheet SF-428S or recipient equivalent" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    #285162
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldAcknowledgeEquipment__c"
    When I enter value "Unchecked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | One selection is required in "2b. Acquired Equipment with current fair market value of $5,000 or more", if "1b" is checked in 'Report' section. |
    #285163
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldAcknowledgeEquipment__c"
    When I enter value "Checked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @285271 @ValidateSF428BAddingfileisrequiredtypeAdditionalFileforCommentsisrequirediniiiotheroptionof2aFederallyOwnedPropertyfieldwhen1aisselectin11Reportsection @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF428 BAdding file is required type "Additional File for Comments", is required in (iii)other option of 2a. Federally Owned Property field when 1a is select in 1.1 Report section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    When I enter value "Checked" into field "fieldFederallyownedProperty__c"
    Then I softly see "2a." inside page block detail
    Then I softly see "(i) Request transfer to Award" inside page block detail
    Then I softly see "Federal Award Identifier" inside page block detail
    Then I softly see "(ii) Request Federal Agency disposition instructions" inside page block detail
    Then I softly see "(iii) Other (Provide detail in Block 3 or attach request)" inside page block detail
    When I enter value "Checked" into field "fieldOther__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |

  @285300 @285303 @285304 @285305 @285306 @ValidateSF428BUsershouldnotseevalidationforAdditionalfileforcommentswhenfilesSupplementalSheetSF428Sequivalentrecipientisattacheweselect1st2ndoptionfrom2afieldif1aisselect @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF428 B User should not see validation for Additional file for comments when files "Supplemental Sheet SF428S or equivalent recipient is attached if we select 1st 2nd option from 2a field if 1a is select
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    When I enter value "Checked" into field "fieldFederallyownedProperty__c"
    Then I softly see "2a." inside page block detail
    Then I softly see "(i) Request transfer to Award" inside page block detail
    Then I softly see "Federal Award Identifier" inside page block detail
    Then I softly see "(ii) Request Federal Agency disposition instructions" inside page block detail
    Then I softly see "(iii) Other (Provide detail in Block 3 or attach request)" inside page block detail
    Then I softly see that "(i) Acknowledge equipment acquired under this federal award will be retained for use as originally approved" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
    Then I softly see that "(iii) Federal Share" rendered in view mode only
    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
    Then I softly see fields "fieldRequestTransfertoAward__c" is in edit mode
    Then I softly see fields "fieldFederalAwardIdentifier__c" is in edit mode
    Then I softly see fields "fieldRequestFederalAgency__c" is in edit mode
    Then I softly see fields "fieldOther__c" is in edit mode
    And I enter value "Checked" into field "fieldRequestTransfertoAward__c"
    And I enter value "Test" into field "fieldFederalAwardIdentifier__c"
    When I enter value "Checked" into field "fieldRequestFederalAgency__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #285303
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldRequestFederalAgency__c"
    When I enter value "Unchecked" into field "fieldRequestTransfertoAward__c"
    When I enter value "Checked" into field "fieldOther__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on "Delete" icon for "1. Supplemental Sheet SF-428S or recipient equivalent" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "6" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    #285304
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldRequestTransfertoAward__c"
    And I enter value "11" into field "fieldFederalAwardIdentifier__c"
    When I enter value "Unchecked" into field "fieldRequestFederalAgency__c"
    When I enter value "Unchecked" into field "fieldOther__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "3. Other" from computer
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #285305
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldRequestTransfertoAward__c"
    And I enter value "11" into field "fieldFederalAwardIdentifier__c"
    When I enter value "Checked" into field "fieldRequestFederalAgency__c"
    When I enter value "Checked" into field "fieldOther__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I wait for "6" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    #285306
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldRequestTransfertoAward__c"
    When I enter value "Unchecked" into field "fieldRequestFederalAgency__c"
    When I enter value "Checked" into field "fieldOther__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on "Delete" icon for "1. Supplemental Sheet SF-428S or recipient equivalent" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I click on "Delete" icon for "3. Other" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "3. Other" from computer
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Additional File for Comments", if 'Other' is checked in "2a. Federally-owned Property". |

  @285432 @285443 @285445 @285446 @ValidateSF428BUsershouldseevalidationwhenfilesSupplementalSheetSF428Sisnotattachedifweselect2ndoptionfrom2bfieldthengettingvalidationforSupplementalssheetif1bisselect @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF428 B User should see validation when files Supplemental Sheet SF428S is not attached & if we select 2nd option from "2b field then getting validation for Supplementals sheet if 1 b is select
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "Checked" into field "fieldAcquiredEquipment__c"
    Then I softly see that "(i) Request transfer to Award" rendered in view mode only
    Then I softly see that "Federal Award Identifier" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "(iii) Other (Provide detail in Block 3 or attach request)" rendered in view mode only
    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
    Then I softly see that "(iii) Federal Share" rendered in view mode only
    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
    Then I softly see fields "fieldAcknowledgeEquipment__c" is in edit mode
    Then I softly see fields "fieldRequestFederalAgencyDispositionInstr__c" is in edit mode
    And I enter value "Checked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "3. Other" from computer
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    #285443
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Delete" icon for "1. Supplemental Sheet SF-428S or recipient equivalent" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    #285445,285446
    When I click on "Edit" in the page details
    And I enter value "Unchecked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    And I enter value "Checked" into field "fieldAcknowledgeEquipment__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    And I refresh the page
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Delete" icon for "1. Supplemental Sheet SF-428S or recipient equivalent" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    Then I softly see value "2. Additional File for Comments" for title "Classification" inside table "---progressReport:-:sf428cFormAttachmentTableId---"
    Then I softly see value "3. Other" for title "Classification" inside table "---progressReport:-:sf428cFormAttachmentTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |

  @285604 @ValidateSF428BUsershouldvalidateformwhenuserselect1a2bformfrom11sectionselectanyoneoptionfrom2aoneoptionfrom2bfieldselectrelatedfilesinfilessection @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF428 BUser should validate form when user select 1a & 2b form from 1.1 section & select any one option from 2a & one option from 2b field & select related files in files section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "Checked" into field "fieldFederallyownedProperty__c"
    When I enter value "Checked" into field "fieldAcquiredEquipment__c"
    Then I softly see fields "fieldRequestTransfertoAward__c" is in edit mode
    Then I softly see fields "fieldFederalAwardIdentifier__c" is in edit mode
    Then I softly see fields "fieldRequestFederalAgency__c" is in edit mode
    Then I softly see fields "fieldOther__c" is in edit mode
    Then I softly see fields "fieldAcknowledgeEquipment__c" is in edit mode
    Then I softly see fields "fieldRequestFederalAgencyDispositionInstr__c" is in edit mode
    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
    Then I softly see that "(iii) Federal Share" rendered in view mode only
    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
    And I enter value "Checked" into field "fieldOther__c"
    And I enter value "Checked" into field "fieldAcknowledgeEquipment__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "fieldRequestTransfertoAward__c"
    When I enter value "Test" into field "fieldFederalAwardIdentifier__c"
    When I enter value "Unchecked" into field "fieldOther__c"
    When I enter value "Checked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    And I refresh the page
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @285605 @ValidateSF428BUsershouldvalidateformwhenuserselect1b2cformfrom11sectionselectanyoneoptionfrom2boneoptionfrom2cfieldselectrelatedfilesinfilessection @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF428 B User should validate form when user select 1b 2c form from 1.1 section & select any one option from 2b & one option from 2c field & select related files in files section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "Checked" into field "fieldAcquiredEquipment__c"
    When I enter value "Checked" into field "fieldResidualUnusedSupplies__c"
    Then I softly see that "(i) Request transfer to Award" rendered in view mode only
    Then I softly see that "Federal Award Identifier" rendered in view mode only
    Then I softly see that "(ii) Request Federal Agency disposition instructions" rendered in view mode only
    Then I softly see that "(iii) Other (Provide detail in Block 3 or attach request)" rendered in view mode only
    Then I softly see that "(iii) Other (Provide detail in Block 3 or attach request)" rendered in view mode only
    Then I softly see fields "fieldAcknowledgeEquipment__c" is in edit mode
    Then I softly see fields "fieldRequestFederalAgencyDispositionInstr__c" is in edit mode
    Then I softly see fields "fieldSaleProceedsrEstimateofCurrentFai__c" is in edit mode
    Then I softly see fields "fieldTotalAmount__c" is in edit mode
    Then I softly see fields "fieldPercentageofFederalParticipation__c" is in edit mode
    Then I softly see fields "fieldFederalShare__c" is in edit mode
    Then I softly see fields "fieldSellingandHandlingAllowance__c" is in edit mode
    When I enter value "Checked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    When I enter value "(i) Sale Proceeds OR" into field "fieldSaleProceedsrEstimateofCurrentFai__c"
    When I enter value "66" into field "fieldTotalAmount__c"
    When I enter value "11" into field "fieldPercentageofFederalParticipation__c"
    When I enter value "22" into field "fieldFederalShare__c"
    When I enter value "44" into field "fieldSellingandHandlingAllowance__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldRequestFederalAgencyDispositionInstr__c"
    When I enter value "Checked" into field "fieldAcknowledgeEquipment__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @285606 @ValidateSF428BUsershouldvalidateformwhenuserselect1a1coptionfrom11sectionselectanyoneoptionfrom2aoneoptionfrom2cfieldselectrelatedfilesinfilessection @sprint-25-US-280119 @vaibhav @Forms
  Scenario: Validate SF428 B User should validate form when user select 1a & 1c option from 1.1 section & select any one option from 2a & one option from 2c field & select related files in files section
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter value "1234" into field "fieldFederalGrantIdentifyingNumbe__c"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "Checked" into field "fieldFederallyownedProperty__c"
    When I enter value "Checked" into field "fieldResidualUnusedSupplies__c"
    Then I softly see fields "fieldRequestTransfertoAward__c" is in edit mode
    Then I softly see fields "fieldRequestFederalAgency__c" is in edit mode
    Then I softly see fields "fieldOther__c" is in edit mode
    When I enter value "Checked" into field "fieldOther__c"
    Then I softly see that "Federal Award Identifier" rendered in view mode only
    When I enter value "(i) Sale Proceeds OR" into field "fieldSaleProceedsrEstimateofCurrentFai__c"
    When I enter value "66" into field "fieldTotalAmount__c"
    When I enter value "11" into field "fieldPercentageofFederalParticipation__c"
    When I enter value "22" into field "fieldFederalShare__c"
    When I enter value "44" into field "fieldSellingandHandlingAllowance__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldOther__c"
    When I enter value "Checked" into field "fieldRequestTransfertoAward__c"
    When I enter value "66" into field "fieldFederalAwardIdentifier__c"
    When I enter value "Checked" into field "fieldRequestFederalAgency__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I click on "Delete" icon for "2. Additional File for Comments" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I refresh the page
    And I wait for "7" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
