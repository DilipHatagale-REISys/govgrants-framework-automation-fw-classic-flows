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
    And I click on "View" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text "Expiration Date: 11/30/2024"
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    And I wait for "8" seconds
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
    And I click on "View" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
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
    And I wait for "9" seconds
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
    And I click on "View" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
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
    And I wait for "7" seconds
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
    And I click on "View" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I click on "Edit" in the page details
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
    And I wait for "9" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    And I click on "View" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
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
    And I wait for "9" seconds
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
    And I click on "View" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
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
    And I wait for "6" seconds
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
    And I click on "View" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
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
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 2. Recipient Organization (Box 3 on Page 1) is required to save. |
    And I enter value "{AUTOEnvData:StringOf60Chars}" into field "fieldRecipientOrganizationNameSF428__c"
    And I wait for "3" seconds
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
    And I click on "View" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
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
    And I click on "View" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
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
    And I wait for "6" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
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
    And I wait for "7" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
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
    And I click on "View" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text "Expiration Date: 11/30/2024"
    And I click on "Edit" in the page details
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
    And I wait for "8" seconds
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
    And I click on "View" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0014"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
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
    And I wait for "6" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    And I wait for "7" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I wait for "9" seconds
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
    And I wait for "9" seconds
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
    And I wait for "9" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "3. Other" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "3. Other" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
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
    And I wait for "4" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
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
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Final (Award Closeout) Report (SF-428-B) is required to be submitted as it is selected in field 6 'Attachment'. |
      | Annual Report (SF-428-A) is required to be submitted as it is selected in field 6 'Attachment'.                 |
      | Disposition Report/Request (SF-428-C) is required to be submitted as it is selected in field 6 'Attachment'.    |
      | SF-428S or equivalent document is required to be submitted as it is selected in field '7. Supplemental Sheet'.  |

  @281844-1 @ValidatethevalidationforfilltheSF428ABCSformbutnotcheckedfieldinSF428
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "7" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
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
    And I wait for "6" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    And I wait for "7" seconds
    When I click on "Validate" in the page details
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "7" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Validate" in the page details
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
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

  @282975 @ValidateSF428ASPIusercanabletosaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF428Aform @sprint-26-US-282679 @vaibhav @Forms
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
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Federal Grant or Other Identifying Number Assigned by Federal Agency is required to save. |
      | 1. Report Type is required to save.                                                       |
      | 2. Report As of is required to save.                                                      |
    And I enter value "1234" into field "fieldFederalGrantSF428A__c"
    And I enter value "(a) Individual (Reporting Federally-owned property for one award)" into field "fieldReportTypePiclikist__c"
    And I enter value "30 SEP" into field "fieldReportAsOf__c"
    And I enter value "Test" into field "fieldCommentsSF428__c"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
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

  @285221 @ValidateSF428AvalidationshouldbedisplayonparentformSF428ifchildformnotvalidatedbutselectyesonparentform @sprint-26-US-282679 @vaibhav @Forms
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
    And I wait for "9" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    And I wait for "6" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    And I wait for "7" seconds
    When I click on "Validate" in the page details
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "6" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
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
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select the Final (Award Closeout) Report (SF-428-B) as required form is filled. |
      | Select the Annual Report (SF-428-A) as required form is filled.                 |
      | Select the Disposition Report/Request (SF-428-C) as required form is filled.    |

  @280404 @ValidateSPIusercanseesection7SupplementalsheetonSF428Formseebelowoptiononfields @sprint-25-US-280119 @vaibhav @Forms
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
    And I wait for "9" seconds
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
    And I wait for "7" seconds
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

  @284859 @ValidateSF428SvalidationshouldbedisplayonparentformSF428ifchildformnotvalidatedbutselectyeonparentform @sprint-26-US-282679 @vaibhav @Forms
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
    And I wait for "9" seconds
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
    And I wait for "6" seconds
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

  @285185 @ValidateSF428CvalidationshouldbedisplayonparentformSF428ifchildformnotvalidatedbutYESonparentform @sprint-26-US-282679 @vaibhav @Forms
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
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Disposition Report/Request (SF-428-C) is required to be submitted as it is selected in field 6 'Attachment'. |
    #Fill SF428-C Form
    And I select "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    When I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldDispositionReportRequestSF428C__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
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
    And I wait for "9" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
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
    And I wait for "7" seconds
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
    And I wait for "3" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    #285161
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "3. Other" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "3. Other" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "3. Other" from computer
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Adding file is required in "Files section" with classification "Supplemental Sheet SF-428S or recipient equivalent" is required, If "1b " is checked in 'Report' section. |
    #285443
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
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
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
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

  @282676 @288908 @ValidateSF429eSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF429form @sprint-26-US-282688 @vaibhav @Forms
  Scenario: Validate SF429 SPI user can able to save & validate form after entering correct & valid data on all fields present on SF-429 form
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    # SF429-A Form
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429-B Form
    And I select "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. NHPA Description" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. Environmental Compliance Requirements" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429-C Form
    And I select "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429C_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14c. Proposed Use" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14g. Environmental Compliance Requirements" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. NHPA Description" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. Encumbered Parties" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Request Reasons" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429 Form
    And I select "Real Property Status Report (Cover Page) - SF-429" from dropdown at forms
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #288908
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @282826 @288910 @ValidateSF429ASPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldpresentonSF429Aform @sprint-26-US-282688 @vaibhav @Forms
  Scenario: Validate SF429A SPI user can able to save & validate form after entering correct & valid data on all fields present on SF429A form
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #288910
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @282871 @ValidateSF429ASPIusercannotabletosavevalidateformafterenteringincorrectinvaliddataonallfieldspresentonSF429Aform @sprint-26-US-282688 @vaibhav @Forms
  Scenario: Validate SF429A SPI user can not able to save & validate form after entering incorrect invalid data on all fields present on SF429A form
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I wait for "6" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Federal Grant or Other Identifying Number Assigned by Federal Agency (#2 on cover page) is required to save. |
      | Street1 is required to save.                                                                                 |
      | City is required to save.                                                                                    |
      | State is required to save.                                                                                   |
      | ZIP / Postal Code is required to save.                                                                       |
    And I enter "SF429A_Form_incorrect_data" values from "ProgressReport_Field_Values.xlsx"
    And I wait for "10" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | The Gross Amount cannot be less than zero.                                                                                                   |
      | The Usable Amount cannot be less than zero.                                                                                                  |
      | The Land Acreage Amount cannot be less than zero.                                                                                            |
      | Federal Share cannot be less than zero.                                                                                                      |
      | Non Federal Share cannot be less than zero.                                                                                                  |
      | Federal Percentage cannot be less than zero.                                                                                                 |
      | Non Federal Percentage cannot be less than zero.                                                                                             |
      | The Amount of Funds in "16 (i)" section cannot be less than zero.                                                                            |
      | The Amount in "16 (ii)" section cannot be less than zero.                                                                                    |
      | The Amount of funds in "16 (iii)" section cannot be less than zero.                                                                          |
      | Value in "Electric" cannot be less than zero.                                                                                                |
      | Value in "Btu" cannot be less than zero.                                                                                                     |
      | Value in "Petroleum" cannot be less than zero.                                                                                               |
      | Value in "Natural Gas" cannot be less than zero.                                                                                             |
      | Value in "Other" cannot be less than zero.                                                                                                   |
      #Below Is the Framework side logged bug Bug Id:- 321742 Once this resolved update the error message
      | If \"Other\" is selected in \"Real Property Ownership Type\", Description is required.                                                       |
      | If "Yes" is selected in section 14g, Describing the Instrument used is mandatory.                                                            |
      | If "Yes" is selected in section 14g, Date is mandatory.                                                                                      |
      | If "Yes" is selected in section 14g, Entering the Jurisdiction is mandatory.                                                                 |
      | If "Other" option is selected in section 17, Justification in specify is required.                                                           |
      | Unit type is required, if amount entered in "14c. Land Acreage Amount".                                                                      |
      | Unit type required, if amount entered in "14d. Gross and Usable Square Footage/Meters".                                                      |
      | Values can only be entered against the Electric (KWh) or Electric (Btu).                                                                     |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                                        |
      | Adding file is required in "Files section" with classification "Environmental Compliance Requirements", if "Yes" option in "14j" is checked. |
      | Adding file is required in "Files section" with classification "NHPA", if "Yes" option in "14k" is checked.                                  |
      | Adding file is required in "Files section", if "Yes" option in "15" checked.                                                                 |

  @282918 @288917 @ValidateSF429BSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF429Bform @sprint-26-US-282693 @vaibhav @Forms
  Scenario: Validate SF429B SPI user can able to save & validate form after entering correct & valid data on all fields present on SF429B form
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I select "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" from dropdown at forms
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. NHPA Description" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. Environmental Compliance Requirements" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #288917
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @282920 @ValidateSF429BSPIusercannotabletosavevalidateformafterenteringincorrectinvaliddataonallfieldspresentonSF429Bform @sprint-26-US-282693 @vaibhav @Forms
  Scenario: Validate SF429B SPI user cannot able to save & validate form after entering incorrect & invalid data on all fields present on SF429B form
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I select "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" from dropdown at forms
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Federal Grant or Other Identifying Number Assigned by Federal Agency (#2 on cover page) is required to save. |
      | Street1 is required to save.                                                                                 |
      | City is required to save.                                                                                    |
      | State is required to save.                                                                                   |
      | ZIP / Postal Code is required to save.                                                                       |
    And I enter "SF429B_Form_incorrect_data" values from "ProgressReport_Field_Values.xlsx"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | If "Other" option is selected in "14k", Justification in specify is required.                                                                |
      | If "Other" option is selected in "14l", Justification in specify is required.                                                                |
      | If \"Other\" is selected in \"Real Property Ownership Type\", Description is required.                                                       |
      | Unit type is required, if amount entered in "14d. Land Acreage or Square Units".                                                             |
      | Unit type is required, if amount entered in "14e. Gross and Usable Square Footage/Meters".                                                   |
      | Values can only be entered against the Electric (KWh) or Electric (Btu) in section "14k"                                                     |
      | Values can only be entered against the Electric (KWh) or Electric (Btu) in section "14l"                                                     |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                                        |
      | Federal Percentage cannot be less than zero.                                                                                                 |
      | Non Federal Percentage cannot be less than zero.                                                                                             |
      | The Land Acreage Amount cannot be less than zero.                                                                                            |
      | The Gross Amount cannot be less than zero.                                                                                                   |
      | The Usable Amount cannot be less than zero.                                                                                                  |
      | Federal Share cannot be less than zero.                                                                                                      |
      | Non Federal Share cannot be less than zero.                                                                                                  |
      | Value in "Electric" in "14k" cannot be less than zero.                                                                                       |
      | Value in "Btu" in "14k" cannot be less than zero.                                                                                            |
      | Value in "Petroleum" in "14k" cannot be less than zero.                                                                                      |
      | Value in "Natural Gas" in "14k" cannot be less than zero.                                                                                    |
      | Value in "Other" in "14k" cannot be less than zero.                                                                                          |
      | Value in "Electric" in "14l" cannot be less than zero.                                                                                       |
      | Value in "Btu" in "14l" cannot be less than zero.                                                                                            |
      | Value in "Petroleum" in "14l" cannot be less than zero.                                                                                      |
      | Value in "Natural Gas" in "14l" cannot be less than zero.                                                                                    |
      | Value in "Other" in "14l" cannot be less than zero.                                                                                          |
      | Adding file is required in "Files section" with classification "Environmental Compliance Requirements", if "Yes" option in "14h" is checked. |
      | Adding file is required in "Files section" with classification "NHPA", if "Yes" option in "14i" is checked.                                  |
    When I click on "Edit" in the page details
    And I enter value "200" into field "fieldFederalSharePercentage__c"
    And I enter value "300" into field "fieldNon_FederalSharePercentage__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Federal Share Percentage must be equal to or less than 100%.     |
      | Non-Federal Share Percentage must be equal to or less than 100%. |

  @282930 @288918 @ValidateSF429CSPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF429Cform @sprint-26-US-282693 @vaibhav @Forms
  Scenario: Validate SF429C SPI user can able to save & validate form after entering correct & valid data on all fields present on SF-429C form
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429C_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14c. Proposed Use" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14g. Environmental Compliance Requirements" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. NHPA Description" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. Encumbered Parties" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Request Reasons" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #288918
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @282921 @ValidateSF429CSPIusercannotabletosavevalidateformafterenteringincorrectinvaliddataonallfieldpresentonSF429Cform @sprint-26-US-282693 @vaibhav @Forms
  Scenario: Validate SF429C SPI user cannot able to save & validate form after entering incorrect & invalid data on all fields present on SF-429C form
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I wait for "6" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Federal Grant or Other Identifying Number Assigned by Federal Agency (#2 on cover page) is required to save. |
      | Street 1 is required to save.                                                                                |
      | City is required to save.                                                                                    |
      | State is required to save.                                                                                   |
      | Zip Code is required to save.                                                                                |
    And I enter "SF429C_Form_incorrect_data" values from "ProgressReport_Field_Values.xlsx"
    And I wait for "6" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Unit type is required, if amount entered in " 13c. Land Acreage or Square Units ".                                                           |
      | Unit type is required, if amount entered in " 13d. Gross and Usable Square Footage/Meters ".                                                 |
      | Federal Percentage cannot be less than zero.                                                                                                 |
      | Non Federal Percentage cannot be less than zero.                                                                                             |
      | The Land Acreage Amount cannot be less than zero.                                                                                            |
      | The Gross Amount cannot be less than zero.                                                                                                   |
      | The Usable Amount cannot be less than zero.                                                                                                  |
      | Federal Share cannot be less than zero.                                                                                                      |
      | Non Federal Share cannot be less than zero.                                                                                                  |
      | Adding file is required in "Files section" with classification "Environmental Compliance Requirements", if "Yes" option in "14g" is checked. |
      | Adding file is required in "Files section" with classification "NHPA", if "Yes" option in "14h" is checked.                                  |
      | Adding file is required in "Files section" with classification "Proposed Use", if "Yes" option in "14c" is checked.                          |
      | Adding file is required in "Files section" with classification "Encumbered Parties" ,if "Yes" option in "14i" is checked.                    |
      | Adding file is required in "Files section" with classification "Request Reason", if "Yes" option in "15" is checked.                         |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                                        |
    When I click on "Edit" in the page details
    And I enter value "200" into field "fieldFederalSharePercentage__c"
    And I enter value "300" into field "fieldNon_FederalSharePercentage__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Federal Share Percentage must be equal to or less than 100%.     |
      | Non-Federal Share Percentage must be equal to or less than 100%. |

  @282701 @298878 @ValidateSF429SPIusercannotabletosaveallfieldsbutvalidationisgeneratedonvalidatebuttonafterenteringincorrectdatainallfieldspresentonSF429form @sprint-26-US-282688 @vaibhav @Forms
  Scenario: Validate SF429 SPI user cannot able to save all fields but validation is generated on validate button after entering incorrect data in all fields present on SF429 form
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Real Property Status Report (Cover Page) - SF-429" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 1. Federal Agency and Organizational Element to Which Report is Submitted is required to save.          |
      | 2. Federal Grant(s) or Other Identifying Number(s) Assigned by Federal Agency(ies) is required to save. |
      | Recipient Organization Name is required to save.                                                        |
      | Street1 is required to save.                                                                            |
      | City is required to save.                                                                               |
      | State is required to save.                                                                              |
      | ZIP / Postal Code is required to save.                                                                  |
      | First Name is required to save.                                                                         |
      | Last Name is required to save.                                                                          |
      | Email is required to save.                                                                              |
      | Phone is required to save.                                                                              |
      | First Name is required to save.                                                                         |
      | Last Name is required to save.                                                                          |
      | Title is required to save.                                                                              |
      | 11b. Signature of Authorized Certifying Official is required to save.                                   |
      | 11c. Telephone(area code,number, extension) of Authorized Certifying Official is required to save.      |
      | 11d. Email Address of Authorized Certifying Official is required to save.                               |
      | 11e. Date report submitted (MM/DD/YYYY) is required to save.                                            |
    And I enter values into fields
      | Value            | Field                                       |
      | 1234             | fieldFederalAgencyandOrganizationalSF429__c |
      | Health           | fieldFederalGrantIdentifyingNumberSF429__c  |
      | Automation Org   | fieldRecipientOrganizationNameSF429__c      |
      | 123              | fieldStreet1SF428__c                        |
      | New York         | fieldCitySF428__c                           |
      | NY: New York     | fieldStateSf428__c                          |
      | 12345            | fieldZipPostalCodeSF428__c                  |
      | John             | fieldFirstNameSF428__c                      |
      | Matthew          | fieldLastNameSF428__c                       |
      | john@yopmail.com | fieldEmailAddress__c                        |
      | 9786903473       | fieldTelephone__c                           |
      | Checked          | fieldAttachmentA__c                         |
      | Checked          | fieldAttachmentB__c                         |
      | Checked          | fieldAttachmentC__c                         |
      | John             | fieldTypeorPrintedFirstName__c              |
      | Matthew          | fieldTypeorPrintedLastName__c               |
      | Associate        | fieldTypeorPrintedTitle__c                  |
      | John Matthew     | fieldSubmittedBySF428__c                    |
      | 9786903473       | fieldTelephone2__c                          |
      | auto@yopmail.com | fieldEmailAddress2__c                       |
      | 0                | fieldDateReportSubmittedSF428__c            |
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Certify the Real Property Status Report (Cover Page)-SF-429 by checking the Acknowledgment Box before submitting to Grantor. |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                        |
      | Request to Acquire, Improve or Furnish (SF-429-B) is required to be submitted as it is selected in field 8 'Attachment'.     |
      | Disposition Request (SF-429-C) is required to be submitted as it is selected in field 8 'Attachment'.                        |
      | General Reporting (SF-429-A) is required to be submitted as it is selected in field 8 'Attachment'.                          |
    #298878
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
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"

  @298928 @298929 @282025 @ValidateSF429thatuserwillseeAttachmentsSectionAttachmentABCcheckbox @sprint-26-US-282688 @vaibhav @Forms
  Scenario: Validate SF 429 that user will see Attachments Section-Attachment A,B,C check box
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
    And I click on "Edit" icon for "Real Property Status Report (Cover Page) - SF-429" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF429_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Request to Acquire, Improve or Furnish (SF-429-B) is required to be submitted as it is selected in field 8 'Attachment'. |
      | Disposition Request (SF-429-C) is required to be submitted as it is selected in field 8 'Attachment'.                    |
      | General Reporting (SF-429-A) is required to be submitted as it is selected in field 8 'Attachment'.                      |
    # SF429-A Form
    And I select "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" from dropdown at forms
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429-B Form
    And I select "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. NHPA Description" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. Environmental Compliance Requirements" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429-C Form
    And I select "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429C_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14c. Proposed Use" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14g. Environmental Compliance Requirements" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. NHPA Description" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. Encumbered Parties" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Request Reasons" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429 Form
    And I select "Real Property Status Report (Cover Page) - SF-429" from dropdown at forms
    And I click on "Edit" in the page details
    When I enter value "Unchecked" into field "fieldAttachmentA__c"
    When I enter value "Unchecked" into field "fieldAttachmentB__c"
    When I enter value "Unchecked" into field "fieldAttachmentC__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Select the General Reporting (SF-429-A) as required form is filled.                      |
      | Select the Request to Acquire, Improve or Furnish (SF-429-B) as required form is filled. |
      | Select the Disposition Request (SF-429-C) as required form is filled.                    |

  @297940 @298087 @Validatesf429userwillseerecipientaccountandIdentifyingfieldvalidationsuponclickonsavebuttonifkeptblank @sprint-4-US-295000 @vaibhav @Forms
  Scenario: Validate sf 429 user will see recipient account and Identifying no field validations upon click on save button if kept blank
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
    And I click on "Edit" icon for "Real Property Status Report (Cover Page) - SF-429" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF429_Form" values from "ProgressReport_Field_Values.xlsx"
    And I clear the value from field "fieldRecipientAccountNumber__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | 5. Recipient Account or Identifying Number is required to save. |
    When I enter value "12345" into field "fieldRecipientAccountNumber__c"
    When I enter value "Unchecked" into field "fieldAcknowledgementSF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    #298087
    Then I softly see the following messages in the page details :
      | Certify the Real Property Status Report (Cover Page)-SF-429 by checking the Acknowledgment Box before submitting to Grantor. |

  @288253 @288898 @ValidateSF271SPIusercanabletosavevalidateformafterenteringcorrectvaliddataonallfieldspresentonSF271form @sprint-1-US-282698 @vaibhav @Forms
  Scenario: Validate SF271 SPI user can able to save & validate form after entering correct & valid data on all fields present on SF271 form
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040–0011"
    Then I softly see the text containing "Expiration Date: 01/31/2025"
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #288898
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @288257 @ValidateSF271SPIusercannotabletosavevalidateformafterenteringincorrectinvaliddataonallfieldspresentonSF271form @sprint-1-US-282698 @vaibhav @Forms
  Scenario: Validate SF271 SPI user can not able to save & validate form after entering incorrect &in valid data on all fields present on SF-271 form
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040–0011"
    Then I softly see the text containing "Expiration Date: 01/31/2025"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | 1. Type of Request is required to save.                                                                        |
      | 2. Basis of Request is required to save.                                                                       |
      | 3. Federal Sponsoring Agency and Organizational Element to Which This Report Is Submitted is required to save. |
      | From is required to save.                                                                                      |
      | To is required to save.                                                                                        |
      | Street1 is required to save.                                                                                   |
      | City is required to save.                                                                                      |
      | State is required to save.                                                                                     |
      | ZIP / Postal Code is required to save.                                                                         |
      | Street1 is required to save.                                                                                   |
      | City is required to save.                                                                                      |
      | State is required to save.                                                                                     |
      | ZIP / Postal Code is required to save.                                                                         |
      | Signature of Authorized Certifying Official is required to save.                                               |
      | Submitted On : is required to save.                                                                            |
      | Signature of Authorized Certifying Official is required to save.                                               |
      | Date Request Submitted is required to save.                                                                    |
    And I enter "SF271_incorrect_data" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | -12345   | -12345    | -12345     |
      | b. Preliminary expense                               | -12345   | -12345    | -12345     |
      | c. Land, structures, right-of-way                    | -12345   | -12345    | -12345     |
      | d. Architectural engineering basic fees              | -12345   | -12345    | -12345     |
      | e. Other architectural engineering fees              | -12345   | -12345    | -12345     |
      | f. Project inspection fees                           | -12345   | -12345    | -12345     |
      | g. Land development                                  | -12345   | -12345    | -12345     |
      | h. Relocation expense                                | -12345   | -12345    | -12345     |
      | i. Relocation payments to individuals and businesses | -12345   | -12345    | -12345     |
      | j. Demolition and removal                            | -12345   | -12345    | -12345     |
      | k. Construction and project improvement cost         | -12345   | -12345    | -12345     |
      | l. Equipment                                         | -12345   | -12345    | -12345     |
      | m. Miscellaneous cost                                | -12345   | -12345    | -12345     |
      | o. Deductions for program income                     | -12345   | -12345    | -12345     |
      | q. Federal share to date                             | -12345   | -12345    | -12345     |
      | r. Rehabilitation grants (100% reimbursement)        | -12345   | -12345    | -12345     |
      | t. Federal payments previously requested             | -12345   | -12345    | -12345     |
      | u. Amount requested for reimbursement                | -12345   | -12345    | -12345     |
    Then I softly see the following messages in the page details :
      | The amount cannot be less than zero. |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 45       | 12        | 23         |
      | u. Amount requested for reimbursement                | 35       | 13        | 12         |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Amount requested for reimbursement" should be same as the difference between the amounts of Line s and t. if different, adding file is required with classification "11.u.Amount requested for reimbursement. |
      | The Percentage cannot be less than zero.                                                                                                                                                                      |
      | Certify the Outlay Report and Request for Reimbursement for Construction Programs-SF-271 by checking the Acknowledgment Box before submitting to Grantor.                                                     |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                                                                                                         |
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter value "Final" into field "fieldTypeOfRequest__c"
    And I enter value "Cash" into field "fieldBasisOfRequest__c"
    And I enter value "200" into field "fieldProgramPercentage__c"
    And I enter value "300" into field "fieldFunctionPercentage__c"
    And I enter value "400" into field "fieldActivityPercentage__c"
    And I enter value "500" into field "fieldTotalPercentage271__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Percentage must equal to 100 or less than 100 is required to save. |

  @286657 @286504 @286519 @286672 @ValidateEXEusercanseeallbelowformsunderGrantorprogressReportareflowfromInternalProgramtoAnnouncementwhenweareusingsameprogramforcreatingAnnouncement @sprint-1-US-278368 @vaibhav @Forms @Buglogged-339404
  Scenario: Validate EXE user can see all below forms under Grantor progress Report are flow from Internal Program to Announcement when we are using same program for creating Announcement
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
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    Then I can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I perform quick search for "Community Initiative Progress Report" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "23" for title "Form Number" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration}" for title "Form Expiration" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Annual Report - SF-428-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration1" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration1}" for title "Form Expiration" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Final Report - SF-428-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration2" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration2}" for title "Form Expiration" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration3" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration3}" for title "Form Expiration" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration4" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration4}" for title "Form Expiration" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report (Cover Page) - SF-429" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration5" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration5}" for title "Form Expiration" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration6" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration6}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration7" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration7}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration8" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration8}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report - SF-425" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration9" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration9}" for title "Form Expiration" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report Attachment - SF-425A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration10" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration10}" for title "Form Expiration" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040–0011" for title "Form Number" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration11" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration11}" for title "Form Expiration" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly do not see "Is Available" in flex table header "---program:-:previewPackageTableId---"
    And I refresh the page
    #286672,286519
    When I click on "Preview" icon for "Grantor Payment Request Forms" inside table
    And I perform quick search for "Request for Advance or Reimbursement - SF-270" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0012" for title "Form Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpirationPay" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpirationPay}" for title "Form Expiration" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    Then I softly do not see "Is Available" in flex table header "---program:-:previewPackageTableId---"
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
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I click on parallel menu button in flex table title "Forms "
    And I select "Reset Table" from parallel lines dropdown of "Forms"
    And I wait for "3" seconds
    And I select value inside table "---program:-:previewPackageTableId---" is "20"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    And I refresh the page
    #286672
    When I click on "Preview" icon for "Grantor Payment Request Forms" inside table
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I delete the record "{SavedValue:announcementName}" from the object "announcement"

  @286659 @286678 @ValidateEXEusercanseeallbelowformsunderGrantorprogressReportareflowfromAnnouncementtoGrantwhenGrantiscreatedfromapplication @sprint-1-US-278368 @vaibhav @Forms
  Scenario: Validate EXE user can see all below forms under Grantor progress Report are flow from Announcement to Grant when Grant is created from application
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I refresh the page
   #286678
    When I click on "Preview" icon for "Grantor Payment Request Forms" inside table
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"

  @286663 @286680 @ValidatePOusercanseeallbelowformsareflowfromProgramtoGrantwhenDirectGrantiscreatedonGrantorprogressReport @sprint-1-US-278368 @vaibhav @Forms
  Scenario: Validate PO user can see all below forms are flow from Program to Grant when Direct Grant is created on Grantor progress Report
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
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I refresh the page
    #286680
    When I click on "Preview" icon for "Grantor Payment Request Forms" inside table
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"

  @287721 @ValidateEXEusercanseebelow13formsonProgressReportunderFilesFormssectionofProgressReport @sprint-1-US-278368 @vaibhav @Forms @Buglogged-339404
  Scenario: Validate EXE user can see below 13 forms on Progress Report under Files & Forms section of Progress Report
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "ProgressReports__c"
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
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Progress Report" for title "Report Type" against the value "Community Initiative Progress Report" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Community Initiative Progress Report" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report - SF-425" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Federal Financial Report - SF-425" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report Attachment - SF-425A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Federal Financial Report Attachment - SF-425A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - SF-428" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Tangible Personal Property Report - SF-428" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---progressReport:-:formTableId---"
    Then I softly see value "false" for title "Mandatory" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---progressReport:-:formTableId---"

  @286533 @286557 @ValidatePMusercanseebelow13formsonPreviewmodalofpackageswhenuserclickonviewicononGrantorProgressReportFormsunderBusinessFormssectiononsetuptabofAnnouncement @sprint-1-US-278368 @vaibhav @Forms @Buglogged-339404
  Scenario: Validate PM user can see below 13 forms on Preview modal of packages when user click on view icon on Grantor Progress Report Forms under Business Forms section on setup tab of Announcement
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
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    Then I can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
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
    Then I softly can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---announcement:-:businessFormlistTableId---"
    Then I softly can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I perform quick search for "Community Initiative Progress Report" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "23" for title "Form Number" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration}" for title "Form Expiration" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Annual Report - SF-428-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration1" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration1}" for title "Form Expiration" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Final Report - SF-428-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration2" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration2}" for title "Form Expiration" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration3" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration3}" for title "Form Expiration" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration4" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration4}" for title "Form Expiration" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report (Cover Page) - SF-429" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration5" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration5}" for title "Form Expiration" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration6" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration6}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration7" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration7}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration8" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration8}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report - SF-425" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration9" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration9}" for title "Form Expiration" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report Attachment - SF-425A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration10" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration10}" for title "Form Expiration" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040–0011" for title "Form Number" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration11" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration11}" for title "Form Expiration" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly do not see "Is Available" in flex table header "---program:-:previewPackageTableId---"
    And I refresh the page
    #286557
    When I click on "Preview" icon for "Grantor Payment Request Forms" inside table
    And I perform quick search for "Request for Advance or Reimbursement - SF-270" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Request for Advance or Reimbursement - SF-270" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Payment Request Report" for title "Report Type" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0012" for title "Form Number" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpirationPay" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpirationPay}" for title "Form Expiration" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Request for Advance or Reimbursement - SF-270" inside table "---program:-:previewPackageTableId---"
    Then I softly do not see "Is Available" in flex table header "---program:-:previewPackageTableId---"
    Then I delete the record "{SavedValue:announcementName}" from the object "announcement"

  @286633 @ValidatePMusercanseebelow13formsonPreviewmodalofpackageswhenuserclickonviewicononGrantorProgressReportFormsunderBusinessFormssectiononFilestabofGrant @sprint-1-US-278368 @vaibhav @Forms @Buglogged-339404
  Scenario: Validate PM user can see below 13 forms on Preview modal of packages when user click on view icon on Grantor Progress Report Forms under Business Forms section on Files tab of Grant
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
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
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
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    Then I softly can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---subAwardFromFDM:-:grantPackagesTableId---"
    Then I softly can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---subAwardFromFDM:-:grantPackagesTableId---"
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I perform quick search for "Community Initiative Progress Report" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Progress Report" for title "Report Type" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "23" for title "Form Number" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Community Initiative Progress Report" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration}" for title "Form Expiration" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - SF-428" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Annual Report - SF-428-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration1" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration1}" for title "Form Expiration" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Final Report - SF-428-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration2" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration2}" for title "Form Expiration" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration3" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration3}" for title "Form Expiration" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Tangible Property Report" for title "Report Type" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0018" for title "Form Number" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration4" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration4}" for title "Form Expiration" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report (Cover Page) - SF-429" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration5" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration5}" for title "Form Expiration" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration6" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration6}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration7" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration7}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0016" for title "Form Number" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration8" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration8}" for title "Form Expiration" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report - SF-425" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration9" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration9}" for title "Form Expiration" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report - SF-425" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Federal Financial Report Attachment - SF-425A" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Federal Financial Report" for title "Report Type" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040-0014" for title "Form Number" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration10" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration10}" for title "Form Expiration" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Federal Financial Report Attachment - SF-425A" inside table "---program:-:previewPackageTableId---"
    And I perform quick search for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Real Property Report" for title "Report Type" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "4040–0011" for title "Form Number" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    And I save the value from row "1" for column name "Form Expiration" as "formExpiration11" from flex table "---program:-:previewPackageTableId---"
    Then I softly see value "{SavedValue:formExpiration11}" for title "Form Expiration" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "false" for title "Is Mandatory" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Active" for title "Status" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---program:-:previewPackageTableId---"
    Then I softly do not see "Is Available" in flex table header "---program:-:previewPackageTableId---"

  @340112 @ValidateSF429AthatUsershouldnotbeabletoenterfromdategreaterthanTodate @sprint-12-US-328869
  Scenario: Validate SF 429A that User should not be able to enter from date greater than To date
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter value "150" into field "fieldPeriodStartDate__c"
    And I enter value "50" into field "fieldPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | From date cannot be after To date in the "Period and type of Federal Interest" section.  |
      | To date cannot be before From date in the "Period and type of Federal Interest" section. |

  @329629 @Validateusershouldabletosubmitandapprovedprogressreportwithoutfillingdatainanyfieldinall13forms @sprint-11-US-328863 @vaibhav @Forms
  Scenario: Validate user should able to submit and approved progress report without filling data in any field in all 13 forms
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @329603 @ValidateSF271validationshoulddisplayonvalidatebutton @sprint-11-US-328863 @vaibhav @Forms
  Scenario: Validate SF271 validation should display on validate button
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    Then I softly see the text containing "OMB Number: 4040–0011"
    Then I softly see the text containing "Expiration Date: 01/31/2025"
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter value "1234" into field "fieldZipPostalCodeSF428__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field. |

  @339610 @Validateusershouldbeabletosubmitandapprovedprogressreportwithfillingalldataonall13forms @sprint-12-US-328869 @vaibhav @Forms  @EndToEndFlow
  Scenario: Validate user should be able to submit and approved progress report with filling all data on all 13 forms
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    # SF-425
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
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
    When I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    When I click on "Back" in the page details
    # SF-425A
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "4" seconds
    And I click on "Edit" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF425A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---progressReport:-:sf425AGrantCoveredTableId---" by clicking "New" :
      | Federal Grant Number | Recipient Account Number | Cumulative Federal Cash Disbursement |
      | 6723457              | 89376289                 | 500                                  |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
     #Fill SF428-C Form
    And I select "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "9" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-B Form
    And I select "Tangible Personal Property Report - Final Report - SF-428-B" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-A Form
    And I select "Tangible Personal Property Report - Annual Report - SF-428-A" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Fill SF428-S
    And I select "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #SF 428 Form
    And I select "Tangible Personal Property Report - SF-428" from dropdown at forms
    When I click on "Edit" in the page details
    And I enter "SF428_Form" values from "ProgressReport_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSupplementalSheet__c"
    When I click on "Save" in the page details
    And I wait for "13" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429-A Form
    And I select "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    And I wait for "6" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429-B Form
    And I select "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. NHPA Description" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. Environmental Compliance Requirements" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429-C Form
    And I select "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429C_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14c. Proposed Use" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14g. Environmental Compliance Requirements" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14h. NHPA Description" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14i. Encumbered Parties" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Request Reasons" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429 Form
    And I select "Real Property Status Report (Cover Page) - SF-429" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #SF-271
    And I select "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Community Form
    And I select "Community Initiative Progress Report" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "9" seconds
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @329635 @Validateusershouldabletosubmitandaprovedprogressreportwithfillingpartialdataforsomefieldsondifferentdifferentformsfromall13forms @sprint-11-US-328863 @vaibhav @Forms @EndToEndFlow
  Scenario: Validate user should able to submit and approved progress report with filling partial data for some fields on different different forms from all 13 forms
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    # SF-425
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
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
    When I enter value "Unchecked" into field "fieldAcknowledgementSF428__c"
    When I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Certify the Federal Financial Report (SF-425) by checking the Acknowledgment Box before submitting to Grantor. |
    When I click on "Back" in the page details
    # SF-425A
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "4" seconds
    And I click on "Edit" icon for "Federal Financial Report Attachment - SF-425A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF425A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---progressReport:-:sf425AGrantCoveredTableId---" by clicking "New" :
      | Federal Grant Number | Recipient Account Number | Cumulative Federal Cash Disbursement |
      | 89376289             | 89376289                 | 250                                  |
    And I wait for "8" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | "Sum of Cumulative Federal Cash Disbursement" must be Equal to "10 b Cash Disbursement" in Transactions section of Federal Financial Report (SF-425). |
     #Fill SF428-C Form
    And I select "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428C_half_fill" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    #Fill SF428-B Form
    And I select "Tangible Personal Property Report - Final Report - SF-428-B" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter value "12345" into field "fieldFederalGrantIdentifyingNumbe__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    #Fill SF428-A Form
    And I select "Tangible Personal Property Report - Annual Report - SF-428-A" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    #Fill SF428-S
    And I select "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "9" seconds
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
      | Select Supplement Sheet as Yes as required form is filled. |
    # SF429-A Form
    And I select "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" from dropdown at forms
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter "SF429A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I refresh the page
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "14k. NHPA" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "15. Significant Change" from computer
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    # SF429-B Form
    And I select "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429B_half_fill" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    # SF429-C Form
    And I select "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429C_half_fill" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    # SF429 Form
    And I select "Real Property Status Report (Cover Page) - SF-429" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF429_half_fill" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    #SF-271
    And I select "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #Community Form
    And I select "Community Initiative Progress Report" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "Comm_half_fill" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Fill all the required data in the form before submitting. |
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @329934 @ValidateusershouldbeabletoeditallformsontheprogressreportwhichisreparentedtonewawardafterFCamendmentrequestandapproveprogressreportsuccessfullyPreconditionPartiallyfilledsomeformsonProgressreportofInitialaward @sprint-11-US-328848 @vaibhav @Forms @EndToEndFlow
  Scenario: Validate user should be able to edit all forms on the progress report which is reparented to new award after FC amendment request and approve progress report successfully Pre-condition Partially filled some forms on Progress report of Initial award
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    #Fill SF428-B Form
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter value "12345" into field "fieldFederalGrantIdentifyingNumbe__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "6" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    #Fill SF428-A Form
    And I select "Tangible Personal Property Report - Annual Report - SF-428-A" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428A_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    #Fill SF428-S
    And I select "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF428S_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428SDetailIndividualTableId---"
    When I enter in modal "SF428S_Details_Individual" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "9" seconds
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
      | Select Supplement Sheet as Yes as required form is filled. |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 3000                 | 150        | 150            |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                     |
      | 4100  | fieldRevisedCommitment__c |
    And I click on "Save" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I wait for "4" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I wait for "4" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Activated" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    #Fill SF428-C Form
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Community Initiative Progress Report" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Annual Report - SF-428-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report (Cover Page) - SF-429" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report - SF-425" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Federal Financial Report Attachment - SF-425A" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I softly see value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" for title "Form Name" inside table "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "SF428C_Form" values from "ProgressReport_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    And I wait for "2" seconds
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
    And I upload attachment without random number "Attachment.pdf" of type "1.a Individual item information" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1.b Consolidated Annual Report Attachments" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    When I click on "Validate" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #SF-271
    And I select "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" from dropdown at forms
    And I click on "Edit" in the page details
    And I enter "SF271_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---progressReport:-:sf271FormTableId---" by clicking "Edit" :
      | Classification                                       | Programs | Functions | Activities |
      | a. Administrative expense                            | 12345    | 12345     | 12345      |
      | b. Preliminary expense                               | 12345    | 12345     | 12345      |
      | c. Land, structures, right-of-way                    | 12345    | 12345     | 12345      |
      | d. Architectural engineering basic fees              | 12345    | 12345     | 12345      |
      | e. Other architectural engineering fees              | 12345    | 12345     | 12345      |
      | f. Project inspection fees                           | 12345    | 12345     | 12345      |
      | g. Land development                                  | 12345    | 12345     | 12345      |
      | h. Relocation expense                                | 12345    | 12345     | 12345      |
      | i. Relocation payments to individuals and businesses | 12345    | 12345     | 12345      |
      | j. Demolition and removal                            | 12345    | 12345     | 12345      |
      | k. Construction and project improvement cost         | 12345    | 12345     | 12345      |
      | l. Equipment                                         | 12345    | 12345     | 12345      |
      | m. Miscellaneous cost                                | 12345    | 12345     | 12345      |
      | o. Deductions for program income                     | 12345    | 12345     | 12345      |
      | q. Federal share to date                             | 12345    | 12345     | 12345      |
      | r. Rehabilitation grants (100% reimbursement)        | 12345    | 12345     | 12345      |
      | t. Federal payments previously requested             | 12345    | 12345     | 12345      |
      | u. Amount requested for reimbursement                | 12345    | 12345     | 12345      |
    And I wait for "9" seconds
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"