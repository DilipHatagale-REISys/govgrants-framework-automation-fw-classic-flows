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