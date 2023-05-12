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

  @284062 @ValidateSF428SINDusercanabletosaveallfieldbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF428Sform @sprint-26-US-282679 @vaibhav @Forms @Bug_Logged-326500 @TBE
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
    And I enter value "Test" into field "fieldFederalGrantIdentifyingNumbe__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Selecting at least one applicable attachment in "Attachment Type". |
    When I click on "Edit" in the page details
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details :
      | GP or ACQ is required to save.             |
      | Description is required to save.           |
      | Identification Number is required to save. |
      | Acquired Date is required to save.         |
      | Condition Code is required to save.        |
      | Acquisition Cost is required to save.      |

  @284129 @ValidateSF248SSPIonlyrecordownershouldhaveeditaccessonformotherusercanhaveonlyviewaccess @sprint-26-US-282679 @vaibhav @Forms @TBE
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
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
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
    Then I cannot see row level action button "Edit" against "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail

  @284139 @284101 @ValidateSF428SAdminusershouldnotseeEditbuttononforminForceclosestatusonprogressreport @sprint-26-US-282679 @vaibhav @Forms @TBE
  Scenario: Validate SF428 S Admin user should not see 'Edit' button on form in Force close status on progress report
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation ADMIN user" of type "Competitive"
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
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
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
      | Name             | Closeout |
      | Automation ADMIN | Step 1   |
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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