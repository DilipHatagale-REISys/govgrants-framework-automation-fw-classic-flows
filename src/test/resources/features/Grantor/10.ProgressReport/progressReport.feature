@progressReport @regression @parallel-regression @progressReportWithBackground
Feature: Validate all scenarios in Progress Report

  Background: To create a progress report
    And I activated standalone subaward "Automation Runtime award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I click on "Save" in the page details
    When I get the "EGMS ID"

  @51097 @51098 @createAndEditProgressReport
  Scenario: To assert the task creation and edition for Progress Report
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"

  @51099 @51100 @51102 @51101 @51103 @editKPIProgressReportformFilling
  Scenario: To edit KPI in Progress Report | To fill and complete the form in Progress Report | To validate KPI for progress report are not editable post submission of prog report to grantor.
  To submit Progress Report to Grantor | To validate Submitted Progress Report Table is updated post report is submitted to Grantor.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    Then I softly see that "7" has been added in flextable with Id "---progressReport:-:kpiTableId---"
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Then I softly see that "100%" has been added in flextable with Id "---progressReport:-:formTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I navigate to "Performance" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Permanent KPI for Regression" in flex table with id "---progressReport:-:kpiTableId---"
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Reporting" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:progressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:progressReportFlexTableId---"

  @51104 @58535 @spaUserBlockedfromSubmisionOfProgressReport
  Scenario: To validate SPA user is not allowed to Submit Progress Report | Verify Sub-recipient user is not allowed to Edit the Schedules created on active award when Progress report is generated.
    When I re-login as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:recipientsRelatedSubAwardsTableId---"
    And I navigate to "Terms" sub tab
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---progressreport:-:progressReportsScheduleId---"

  @51105 @51106 @51107 @51108 @internalSentProgressReportToSubRecipient
  Scenario: To send back the Progress Report | To validate Error Messages for fields required for Submission of Progress Report | To validate the field history status update on the internal side
  To assert the task creation for Sub recipient user Progress Report after Progress Report is Sent back to Subrecipient.
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Forms and Attachments Tab - Fill all the required data in the form before submitting to Grantor. |
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent Back to Subrecipient" and is "red"
    When I navigate to "History" sub tab
    Then I softly see value "Sent Back to Subrecipient" for title "New Value" inside table "History"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"

  @51109 @resubmitProgressReportToGrantor @smoke
  Scenario: To validate SR user is able to Submit the Progress Report post Progress Report it was sent back for corrections by the Grantor. | To assign or change the defualt approvers in Progress Report
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Then I softly see that "Automation PM" has been added in flextable with Id "---progressReport:-:approversTableId---"
    Given I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 25     | 7             |
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"

  @59048 @51113 @approveProgressReportOnResubmission
  Scenario: To validate Progress Report which were sent back to Sub Recipient by Grantor are approved successfully post revision | Validate Internal User cannot add Peer Reviewers when Progress report status is Submitted for Approval
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    Given I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 95     | 7             |
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---progressReport:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"

  @51111 @51114 @51115 @51116 @sendBacktoOwnerOfProgressReportByProgramApprover
  Scenario: To validate Progress Report send back to owner functionality by program approver. |  To validate field history update post Progress Report is send back to owner by program approver.
  To validate  task is not created for Grantor post Program Approver Sends back the progress report to Owner. | To submit Progress Report for approval
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I navigate to "History" sub tab
    Then I softly see value "Submitted to Grantor" for title "New Value" inside table "History"
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---progressReport:-:pendingTaskTableId---"

  @51117 @51120 @approvalofProgressReportSendbacktoOwnerOfProgressReportbyProgramApprover @smoke
  Scenario: To validate  Progress Report approval is successful post Program Approver Sends back the progress report to Owner | To validate Progress Reports Table on the award is updated with respect to approval of progress reports
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Send to Owner" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:internalProgressReportFlexTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:subawardsTableId---"
    And I navigate to "Performance" sub tab
    Then I softly see value "7" for title "Actual" against the value "Automation Permanent KPI for Regression" inside table "---progressReport:-:awardKPITableId---"

  @51118 @51119 @51121 @sendBacktoOwnerOfProgressReportbyFiscalApprover @smoke
  Scenario: To validate Progress Report send back to owner functionality by Fiscal approver. |  To validate progress report are not editable post submission of progress report to grantor.
  To validate  field history update post Progress Report is send back to owner by Fiscal approver.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I navigate to "History" sub tab
    Then I softly see value "Submitted to Grantor" for title "New Value" inside table "History"

  @59678 @51122 @taskAssertionSendbacktoOwnerOfProgressReportbyFiscalApprover
  Scenario: To validate  task is not created for Grantor post Fiscal Approver Sends back the progress report to Owner. | Validate Approvers Table is editable at award owner end when the status of progress report is Submitted to Grantor.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Then I softly can see row level action button "Edit" against "Automation PM" in flex table with id "---progressReport:-:approversTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Send to Owner" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I see "No Records Found" inside flex table with id "---progressReport:-:pendingTaskTableId---"

  @51123 @approvalofProgressReportSendbacktOwnerOfProgressReportbyFiscalApprover
  Scenario: To validate  Progress Report approval is successful post Fiscal Approver Sends back the progress report to Owner
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Send to Owner" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:internalProgressReportFlexTableId---"
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"

  @51124 @taskAssertionForFiscalApproverPostSendBackProgressReportByProgramApprover
  Scenario: To validate task is not getting created for Fiscal Approver post Program Approver Sends back the progress report to Owner.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 3             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Send to Owner" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I see "No Records Found" inside flex table with id "---progressReport:-:pendingTaskTableId---"

  @51125 @58887 @approvalOfProgressReport @progressReportHappyPathWithoutDefaultApprovers @smoke
  Scenario: To approve Progress Report by changing the default approvers in Progress Report | Validate only approved records are displayed when Internal user select approved option at list view under monitoring tab
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - Approved"
    Then I softly see all values "Approved" under column "Status" inside flextable with id "---progressReport:-:internalProgressReportFlexTableId---"

  @55313 @55316 @verifyDraftProgressReportNotDisplayedOnGrantAtInternal @mahadev
  Scenario Outline: Verify generated progress report should not displayed at management tab of grant | Verify Progress Report table is getting updated at Sub-recipient user end on award
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Management" sub tab
    Then I softly do not see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:grantorGrantProgressReportTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Performance" sub tab
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @57646 @57690 @verifyProgressReportTablUpdatedWithStatusSubmittedForApprovalAtSubPortal @mahadev
  Scenario Outline: Verify Progress report table get updated with status Submitted for Approval at grantee portal | To edit Progress Report
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Key Accomplishments" as "Key accomplishments for this reporting period"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Performance" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientAwardProgressReportTableId---"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @34931 @submitProgressReportToGrantorInternalUser @jitendra
  Scenario Outline: Verify that all internal users can view submitted Progress Reports
    And I click on "Edit" in the page details
    When I enter "Edition" values from "<progressReportSheet>"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "<kpiTableId>" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "<formTableId>"
    And I enter "Form Fields" values from "<progressReportSheet>"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - Submitted"
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---"
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    Examples:
      | progressReportSheet              | kpiTableId                        | formTableId                        |
      | ProgressReport_Field_Values.xlsx | ---progressReport:-:kpiTableId--- | ---progressReport:-:formTableId--- |

  @55310 @editProgressReportSchedule @jitendra
  Scenario Outline: To edit Progress Report
    And I click on "Edit" in the page details
    When I enter "Edition" values from "<progressReportSheet>"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "<activeGrantsTableId>" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "<subawardsTableId>"
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "<progressReportsScheduleId>"
    And I enter value "Annually" into field "fieldFrequency__c"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    Then I see value "Annually" for title "Frequency" inside table "<progressReportsScheduleId>"
    Examples:
      | progressReportsScheduleId                        | progressReportSheet              | subawardsTableId                        | activeGrantsTableId                        |
      | ---progressReport:-:progressReportsScheduleId--- | ProgressReport_Field_Values.xlsx | ---progressReport:-:subawardsTableId--- | ---progressReport:-:activeGrantsTableId--- |

  @59679 @58763 @45730 @ProgramApproverSenBackPRToOwner @jitendra
  Scenario: Validate  Progress Report send back to owner functionality by program approver. | Validate Performance Tab under Subaward view at Sub-recipient user is getting updated when Progress report status is Submitted to Grantor on active subaward
  Validate Submit for Approval button disappear from Progress report once Award owner click on it.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    And I save the field labeled "Subaward ID" as "SubawardID"
    And I click "{SavedValue:SubawardID}" lookup link
    When I navigate to "Performance" sub tab
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Submitted to Grantor" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "green"

  @59680 @58742 @validateInternalUserIsNotAllowedToEditProgressReportWhoseStatusIsSendBackToSubRecipient @mahadev
  Scenario: Validate Internal User is not allowed to Edit the Progress report generated whose status is Send back to sub-recipient on active award
  Validate Internal user is not able to see Send Back to Subrecipient button once Progress report is send back to subrecipient.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail
    When I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Record Id}" in flex table with id "---progressreport:-:internalProgressReportFlexTableId---"

  @58774 @validateManagementSubtabOnGrantviewProgressReportTableIsUpdatedWhenProgressReportStatusIsSubmittedForApproval  @mahadev
  Scenario Outline: Validate management sub tab on grant view  progress report table is getting updated when Progress report status is Submitted for Approval on active subaward
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    When I navigate to "Management" sub tab
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Submitted for Approval" inside table "---progressReport:-:recipientGrantProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @58662 @NotEditButtonInPRScheduleForSPI @jitendra
  Scenario: Validate SPI user is not allowed to change the Progress report Schedule on Active subaward when status of Progress Report is submitted to Grantor.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Submit to Grantor" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:recipientsRelatedSubAwardsTableId---"
    When I navigate to "Terms" sub tab
    Then I cannot see row level action button "Edit" against "Progress Report" in flex table with id "---progressreport:-:progressReportsScheduleId---"

  @58896 @validateInternalUserWithAnotherProfileButFromSameOrganizationCanViewProgressReportWhoseStatusSubmittedToGrantorAtManagementTab  @mahadev
  Scenario Outline: Validate Internal User with another profile but same organization can view the Progress report whose status is Submitted to Grantor at Management Tab
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 8/29/2022     |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---"
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---"
    When I save the field labeled "EGMS ID" as "Record Id"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Management" sub tab
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Submitted to Grantor" inside table "---progressReport:-:grantorGrantProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @59039 @59042 @validateInternalUserIsAllowedToAddProgramApproverOnProgressReport  @mahadev
  Scenario: Validate Internal user is allowed to add Program Approver when Progress report status is Submitted to Grantor | Validate SPI user 'does not' have edit access to Performance Narrative Table under Progress report when Progress report state is Submitted to Grantor State.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Performance" sub tab
    Then I softly do not see that the fields in flex table title as "Performance Narrative" are editable
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
    Then I softly see value "Automation PM" for title "Name" against the value "Automation Test Description" inside table "---progressReport:-:approversTableId---"

  @58893 @validateMultipleProgressReports  @mahadev
  Scenario Outline: Validate initially generated progress report remains the same at progress reports table when another Progress report is generated on active award
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---"
    When I navigate to "Performance" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientAwardProgressReportTableId---"
    When I save the field labeled "EGMS ID" as "ProgressReport2"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---"
    When I navigate to "Performance" sub tab
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:Record Id}" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:ProgressReport2}" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime award} |

  @58753 @PMNoPRshown @jitendra
  Scenario: Validate Internal user should not see progress report under Sub-award performance tab when Progress report is in Draft status.
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Performance" sub tab
    Then I do not see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:progressReportFlexTableId---"

  @58756 @PerformanceTabUpdate @jitendra
  Scenario: Validate Performance Tab under Subaward View at Internal user is getting updated when Progress report status is  Submitted to Grantor on active subaward.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Submit to Grantor" in the page details
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Performance" sub tab
    Then I see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:Record Id}" inside table "---progressReport:-:grantorProgressReportsTableId---"

  @58881 @58882 @ListViewSPISeeAprrovedPR @jitendra
  Scenario: Verify that Sub-recipient User will be able to see Approved Progress Report on active award by using List View. | Verify that Sub-recipient User will be able to see Submitted Progress Report on active award by using List View.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Reporting" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:progressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:progressReportFlexTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Reporting" subheader on left panel
    When I click toggle button to select "Progress Reports - Approved"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:progressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:progressReportFlexTableId---"

  @59044 @58883 @SeeApprovedPROnActiveAwardByInternalUser @jitendra
  Scenario: Verify that Internal User will be able to see Approved Progress Report on active award by using List View. |Validate SPI user is not able to edit forms table under forms and attachments view when Progress report state is Submitted for Approval.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:recipientActiveGrantId---"
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Submitted for Approval" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---"
    And I navigate to "Forms and Attachments" sub tab
    Then I cannot see row level action button "Edit" against "Community Initiative Progress Report" in flex table with id "---progressReport:-:formTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Approved"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:internalProgressReportFlexTableId---"

  @58884 @SeeSendBackToSubrecipientPROnActiveAwardByInternalUser @jitendra
  Scenario: Verify that Internal User will be able to see Send back to Sub-recipient Progress Report record on active award by using List View .
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    Given I click on "Send Back to Subrecipient" in the page details
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:internalProgressReportFlexTableId---"

  @58959 @NoViewAccessToOtherOrganisationuSERPR @jitendra
  Scenario: Validate Internal User with different organization should not be able to view the Progress report with submitted to Grantor state.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    Given I re-login to "As a Grantor" app as "SIMON PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I do not see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:internalProgressReportFlexTableId---"

  @59278 @59136 @CanNotSubmitPRWithNotFillingReqData @jitendra
  Scenario: Validate Sub-recipient user is not allowed to submit progress report to grantor when required data is not filled under Forms and Attachments Tab.
  Validate if SR user keep the Actual field under performance tab as empty validate message is display on Progress report when KPI is selected as Yes on Grant
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual |
      | Automation Permanent KPI for Regression |        |
    Then I softly see value "0" for title "Actual" against the value "Automation Permanent KPI for Regression" inside table "---progressReport:-:kpiTableId---"
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "ErrorForm" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Forms and Attachments Tab - Fill all the required data in the form before submitting to Grantor. |

  @59567 @58773 @NoEditAccessForFormsSPI @jitendra
  Scenario: Validate Management Tab under Grant view at Internal user is getting updated when Progress report status is Submitted for Approval on active subaward.
  Validate Submitted By field at Certification table should get updated on Progress report at SR user end when Progress report status is Submitted to Grantor
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Submitted By:" as "Automation SPI"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:grantorGrantProgressReportTableId---"

  @59568 @59280 @validateSRUserIsAbleToViewSnapshot @mahadev @skipOnJenkins
  Scenario: Validate SR user is able to view the Snapshot after Progress report is Submitted to Grantor status | Validate Submitted On field at Certification table should get updated on Progress report at SR user end when Progress report status is Submitted to Grantor
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Submitted On:" is getting updated with todays date
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Progress Report Snapshot"
    When I download the file
    Then I softly see "Submitted to Grantor" on page "1" of "govgrants" pdf file

  @59675 @59674 @validateSendBackToSRUser @mahadev
  Scenario: Validate Pending Task is created for SR user when Award owner Sent Back the Progress report | Validate Pending Task is created for Award Owner when Progress report status is submitted to Grantor
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"

  @59677 @59676 @allowsEditAfterSentBackToSR @jitendra @bugged-80498
  Scenario: Validate SR is able to Edit the Progress report when Award owner Sent Back the Progress report | Validate History Field is getting Updated at Award owner End when Progress report status is Submitted to Grantor.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "History" sub tab
    Then I softly see value "Submitted to Grantor" for title "Old Value" inside table "History"
    When I navigate to "Forms and Attachments" sub tab
    When I add the Notes for progress report
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Sent Back to Subrecipient" and is "red"

  @59773 @59774 @59776 @59777 @validateSRUserEntersKPIActualValue @mahadev
  Scenario: Validate SR user is able to enter Actual field value at KPI under performance tab at Progress report | Validate SR user is able to select Reported Date field at KPI under performance tab at Progress report
  Validate SR user is able to enter Actual field value at KPI under performance tab more than the Target Value at Progress report | Validate SR user is able to enter Actual field value at KPI under performance tab less than the Target Value at Progress repor
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 10     | 7             |
    Then I softly see value "10" for title "Actual" against the value "Automation Permanent KPI for Regression" inside table "---progressReport:-:kpiTableId---"
    And I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 0             |
    When I save the value from row "1" for column name "Reported Date" as "ReportedDate" from flex table "---progressReport:-:kpiTableId---"
    Then I softly see the Reported Date field contains todays date
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 100    | 7             |
    Then I softly see value "100" for title "Actual" against the value "Automation Permanent KPI for Regression" inside table "---progressReport:-:kpiTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 2      | 7             |
    Then I softly see value "2" for title "Actual" against the value "Automation Permanent KPI for Regression" inside table "---progressReport:-:kpiTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |

  @59775 @validateActualFieldAtInternalSide @mahadev
  Scenario: Validate Actual field updated by SR user reflect the same value at Internal user end when Progress report status is Submitted to Grantor
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 10     | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I navigate to "Performance" sub tab
    Then I see value "10" for title "Actual" against the value "Automation Permanent KPI for Regression" inside table "---progressReport:-:kpiTableId---"

  @59832 @59571 @validateSRUserCannotEditPreviousDateField @mahadev
  Scenario: Validate SR user is not able to edit the Previous Actual field on KPI table under Performance tab at Progress report
  Validate Supporting checklist Table is empty if Supporting document checklist data is not added at Grant at SR user end. | Validate SR user is not able to edit the Previous Actual field on KPI table under Performance tab at Progress report
    When I navigate to "Forms and Attachments" sub tab
    Then I softly see "No Records Found" inside flex table with id "---progressreport:-:progressReportChecklistsTableId---"
    And I navigate to "Performance" sub tab
    When I click on "Edit" icon for "Automation Permanent KPI for Regression" inside flex table with id "---progressReport:-:kpiTableId---"
    Then I softly see field "PreviousActual__c" is not editable
    Then I softly see field "PreviousDate__c" is not editable

  @59829 @validateSRUserCannotEditKPIOnceSubmittedToGrantor @mahadev
  Scenario: Validate SR user is not able to update the KPI actuals field value once Progress report is Submitted to Grantor
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 10     | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Performance" sub tab
    Then I cannot see row level action button "Edit" against "Automation Permanent KPI for Regression" in flex table with id "---progressreport:-:kpiTableId---"

  @59833 @59834 @validateSRUserAbleToAddNewValueAtActualField @mahadev
  Scenario Outline: Validate SR user is allowed to add a new value in actual field at KPI table on Progress report when already one Progress report is Submitted to Grantor
  Validate SR user is allowed to add a new value Reported Date field at KPI table at Progress report when already one Progress report is Submitted to Grantor
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 10     | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c,false"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---"
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 10     | 7             |
    Then I softly see value "10" for title "Actual" against the value "Automation Permanent KPI for Regression" inside table "---progressReport:-:kpiTableId---"
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 10     | 0             |
    When I save the value from row "1" for column name "Reported Date" as "ReportedDate" from flex table "---progressReport:-:kpiTableId---"
    Then I softly see the Reported Date field contains todays date
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @59899 @validateSubmittedProgressReportsAtManagementTabOnGrantAtInternalSide @mahadev
  Scenario Outline: Validate Progress Reports table at Management tab on grant overview is getting updated with progress report whose status is Submitted to Grantor at Award owner End
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---"
    When I navigate to "Management" sub tab
    Then I see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---progressReport:-:grantorGrantProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @59900 @validateSentBackProgressReportsAtManagementTabOnGrantAtInternalSide @mahadev
  Scenario Outline: Validate Progress Reports at Management tab on Grant is getting updated with Progress report whose status is sent back to sub recipient at Award owner End
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I click on "Send Back to Subrecipient" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---"
    When I navigate to "Management" sub tab
    Then I see value "Sent Back to Subrecipient" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---progressReport:-:grantorGrantProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @59901 @validateSubmittedForApprovalProgressReportsAtManagementTabOnGrantAtInternalSide @mahadev
  Scenario Outline: Validate Progress Reports at Management tab on Grant overview is getting updated with Progress report whose status is submitted for approval at Award owner End
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---"
    When I navigate to "Management" sub tab
    Then I see value "Submitted for Approval" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---progressReport:-:grantorGrantProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @59902 @validateApprovedProgressReportsAtManagementTabOnGrantAtInternalSide @mahadev
  Scenario Outline: Validate Progress Reports at Management tab on Grant overview is getting updated with Progress report whose status is Approved at Award owner End
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---"
    When I navigate to "Management" sub tab
    Then I see value "Approved" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---progressReport:-:grantorGrantProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @59898 @validateSRUserIsAbleToViewSnapshotHistory @mahadev @skipOnJenkins
  Scenario: Validate SR user is able to view the Snapshot after Progress report is Submitted to Grantor status
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Progress Report Snapshot"
    When I download the file
    Then I see "Submitted to Grantor" on page "1" of "govgrants" pdf file

  @59830 @59828 @validateINTERNALUserCannotEditKPIOnceSubmittedToGrantor @jitendra
  Scenario: Validate Internal user cannot have access to Edit the KPI actuals field value submitted by SR user on Progress report whose status is Submitted to Grantor. | Validate Previous Actual field on KPI table under Performance tab is present at SR User on Progress report.
    When I navigate to "Performance" sub tab
    Then I softly see value "0" for title "Actual" inside table "---progressReport:-:kpiTableId---"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 10     | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I navigate to "Performance" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Permanent KPI for Regression" in flex table with id "---progressreport:-:kpiTableId---"

  @60024 @59835 @59838 @TWOPRKPIValueSameCheck @jitendra
  Scenario Outline: Validate Previous Actual field on KPI table under Performance tab at Progress report overview is getting updated with reference to the recently approved Progress report.
  Validate Final Report? field under Report Overview table at overview tab on Progress report is present | Validate Previous Date field on KPI table under Performance tab at Progress report overview is getting updated with reference to the recently approved Progress report
    When I navigate to "Overview" sub tab
    Then I see field "Final Report?" inside page block
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 200    | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Send to Owner" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - Submitted"
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:internalProgressReportFlexTableId---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I create a post award record "ProgressReport" for the Award "<Grant Name>" having object api name as "ProgressReports__c,false"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---"
    When I navigate to "Management" sub tab
    And I click on "Edit" icon for "Created" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---"
    And I navigate to "Performance" sub tab
    Then I softly see value "200.00" for title "Actual" against the value "Automation Permanent KPI for Regression" inside table "---progressReport:-:kpiTableId---"
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 10     | 0             |
    When I save the value from row "1" for column name "Reported Date" as "ReportedDate" from flex table "---progressReport:-:kpiTableId---"
    Then I softly see the Reported Date field contains todays date
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @60020 @60022 @60021 @60023 @validateReviewedProgressReportsAtManagementTabOnGrantAtInternalSide @mahadev
  Scenario Outline: Validate Progress Reports Table at Management tab on Grant overview is getting updated with Progress report whose status is Reviewed at Award owner end | Validate Progress Reports Table at Management tab on Grant overview is getting updated with Progress report whose status is Submitted for Review at SR User end
  Validate Progress Reports Table at Management tab on Grant overview is getting updated with Progress report whose status is Submitted for Review at Award owner end | Validate Progress Reports Table at Management tab on Grant overview is getting updated with Progress report whose status is Reviewed at SR user end
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---"
    When I navigate to "Management" sub tab
    Then I softly see value "Submitted for Review" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---progressReport:-:grantorGrantProgressReportTableId---"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---"
    When I navigate to "Management" sub tab
    Then I softly see value "Submitted for Review" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---progressReport:-:recipientGrantProgressReportTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---progressReport:-:peerReviewersTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Complete Review" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---"
    When I navigate to "Management" sub tab
    Then I softly see value "Reviewed" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---progressReport:-:grantorGrantProgressReportTableId---"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---"
    When I navigate to "Management" sub tab
    Then I softly see value "Reviewed" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---progressReport:-:recipientGrantProgressReportTableId---"
    Examples:
      | Grant Name                            |
      | {SavedValue:Automation Runtime award} |

  @59571 @59839 @updateKPIValue @jitendra
  Scenario: Validate Supporting checklist Table is empty if Supporting document checklist data is not added at Grant at SR user end. |Validate Actual Field value on (KPIs) table under performance tab at subaward overview is getting updated with the values entered by SR user when PR status is Approved.
    When I navigate to "Forms and Attachments" sub tab
    Then I see "No Records Found" inside flex table with id "---progressreport:-:ProgressReportChecklistTableId---"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    Given I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 95     | 7             |
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Performance" sub tab
    Then I softly see value "95" for title "Actual" against the value "Automation Permanent KPI for Regression" inside table "---progressReport:-:kpiTableId---"

  @59904 @validatePRStatusAfterApprovedOn @jitendra
  Scenario: Validate Progress Reports Table at Management tab on Grant overview is getting updated with Progress report whose status is Approved at SR User End
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    Given I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 95     | 7             |
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    And I navigate to "Management" sub tab
    Then I see value "Approved" for title "Status" inside table "---progressReport:-:recipientGrantProgressReportTableId---"

  @59906 @PRStatusSentBackSR @jitendra
  Scenario: Validate Progress Reports Table at Management tab on Grant overview is getting updated with Progress report whose status is sent back to sub recipient at SR User End
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    And I navigate to "Management" sub tab
    Then I see value "Sent Back to Subrecipient" for title "Status" inside table "---progressReport:-:recipientGrantProgressReportTableId---"

  @59905 @validateProgressReportsTableAtManagementTabWithStatusIsSubmittedToGrantor @Keerti
  Scenario: Validate Progress Reports Table at Management tab on Grant overview is getting updated with Progress report whose status is Submitted to Grantor at SR User End
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:recipientActiveGrantId---"
    When I navigate to "Management" sub tab
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Submitted to Grantor" inside table "---progressReport:-:recipientGrantProgressReportTableId---"

  @59907 @validateProgressReportsTableAtManagementTabWithStatusIsSubmittedForApproval @Keerti
  Scenario: Validate Progress Reports Table at Management tab on Grant overview is getting updated with Progress report whose status is submitted for approval at SR User End
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:activeGrantsTableId---"
    When I navigate to "Management" sub tab
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Submitted for Approval" inside table "---progressReport:-:grantorGrantProgressReportTableId---"

  @60298 @60297 @60306 @validateApprovalofProgressReportByForwardedApprover @mahadev
  Scenario: Validate Progress report can be approved by the approver to whom Progress report is forwarded | Validate Progress report Approver can Forward Progress report to anyone from same organisation
  Validate other Internal user else than Approver did not receive pending Task for Final marked Progress report.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Reassign" to user "Automation EXE" in the approval decision
    And I pause execution for "1" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"

  @60305 @60104 @DisabledFinalField @jitendra
  Scenario: Validate Award Owner is not able to Edit the Final Report? field on Program report whose status is Submitted to Grantor | Validate Non Award Owner did not receive pending Task for Final Marked Progress report else than award owner.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    When I navigate to "Management" sub tab
    When I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:grantorGrantProgressReportTableId---"
    And I navigate to "Overview" sub tab
    Then I softly verify that field "IsFinalReport__c" is not editable by entering "Select" value

  @60572 @60571 @validateSubmissionOfReview @mahadev
  Scenario: Validate Peer reviewer can submit the review for the assigned progress report | Validate Peer reviewer can Edit the Entered review before Submitting it to Award owner for Progress report
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---progressReport:-:peerReviewersTableId---"
    And I enter values into fields
      | Value           | Field             |
      | Passed          | Rating__c         |
      | Test Automation | ReviewComments__c |
    When I click modal button "Save"
    When I click modal button "Save"
    Then I softly see field "Comments" as "Test Automation"
    And I click on submit review
    When I close "Enter Review" modal by clicking the top right x button
    Then I softly see value "Submitted" for title "Status" inside table "---progressReport:-:peerReviewersTableId---"

  @60570 @PendingTaskWillNotCreateForAwardOwnerAfterPRSendBackToOwnerByProgramApprover @Keerti
  Scenario: Validate On Send back to Owner by program approver will not create pending task for Award owner.
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I click on "Send Back to Subrecipient" in the page details
    When I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"

  @60569 @60573 @ReviewIsUpdatedAtAwardownerafterPeerReviewSubmitted @Keerti
  Scenario: Validate Once Peer reviewer submit the review to award owner, the review is updated at Award owner end also. | Validate Award owner can send Progress report for Peer Reviewer When Progress report status is Submitted for Grantor.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---"
    Then I softly see the following messages in the page details contains:
      | Review Successfully Initiated |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---progressReport:-:peerReviewersTableId---"
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I navigate to "Responsibilities" sub tab
    And I expand nested table containing column value "Automation FO"
    Then I softly see value "Cannot Rate" for title "Rating" inside table "GrantorProgressReportReviewsTempFlexToggle"

  @60574 @AwardOwnerCanAddMultiplePeerReviewerForPR @Keerti
  Scenario: Validate Award owner can add Multiple Peer reviewer for Progress report whose status is Submitted to grantor
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        |
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 7        |
    Then I see value "Automation FO" for title "Reviewer Name" inside table "---progressReport:-:peerReviewersTableId---"
    Then I see value "Automation PM" for title "Reviewer Name" inside table "---progressReport:-:peerReviewersTableId---"

  @60575 @PendingTaskIsCreatedForProgramApproverWhenPRStatusIsSubmittedForReview  @Keerti
  Scenario: Validate Pending Task is created for Program Approver When Progress report status is Submitted for Review from at Peer Reviewer table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Program Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"

  @45741 @validateReportFrequencyField   @jitendra
  Scenario: Validate on Progress report, Report Frequency field at Report Overview table under Overview tab is same as Award
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:recipientActiveGrantId---"
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---"
    Then I see field "Report Frequency" as "Monthly"

  @60576 @PendingTaskSubmitToReview @jitendra
  Scenario: Validate Pending Task is created for Fiscal Approver When Progress report status is Submitted for Review from Peer Reviewer table.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressreport:-:GrantorProgressReportReviewerTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"

  @61088 @61091 @validateObjectivesCarriedFromAwardToPR @mahadev @wip
  Scenario: Validate if Objectives Required? field is yes at Grant, Objectives are associated at award then it is carried at Progress report at SR End
  Validate Objectives table at Performance Tab on Progress report should not be editable at SR user end
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---progressReport:-:objectivesTableId---"
    And I navigate to "Performance" sub tab
    Then I softly see value "Automation Permanent Objective" for title "Title" inside table "---progressReport:-:objectivesTableId---"

  @61095 @61094 @validateDownloadOfObjectivesInCSV @mahadev @skipOnJenkins
  Scenario: Validate SR User can Download the Objectives associated at award on progress report in CSV format | Validate SR User can Download the Objectives associated at award on progress report in PDF format
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I select "Download as CSV" from parallel lines dropdown of "Objectives"
    And I download the file
    Then I softly verify that "xls" file is downloaded
    And I select "Download as PDF" from parallel lines dropdown of "Objectives"
    When I download the file
    Then I softly see "Test Automation Organization" on page "1" of "govgrants" pdf file

  @61093 @59198 @61096 @PRISNotEditableOnPerformanceTabAfterPRStatusSummitedForGrantor @keerti
  Scenario: Validate Objectives table at Performance Tab on Progress report should not be editable at Award owner end when Progress report status is Submitted to Grantor. | Validate SR User is able to take snapshot of the Progress report when it is submitted to Grantor on active subaward
  Validate SR User can View the Objectives associated at award on progress report.
    When I navigate to "Performance" sub tab
    And I click on "View" icon for "Automation Permanent Objective" inside table
    And I navigate to "Overview" sub tab
    Then I softly see field "Title" as "Automation Permanent Objective"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Progress Report" as name
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I navigate to "Performance" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Record Id}" in flex table with id "AwardStrategicGoalsObjectives"

  @61097 @PRISNoteditableAtPAOnPerformaceTab @keerti
  Scenario: Validate Objectives table at Performance Tab on Progress report should not be editable at Program approver end when Progress report status is Submitted for Approval.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Performance" sub tab
    Then I cannot see row level action button "Edit" against "{SavedValue:Record Id}" in flex table with id "AwardStrategicGoalsObjectives"

  @72352 @progressReportHappyPath @productBusinessFlowSanity
  Scenario: Validate once the Progress Report approval process is complated then the status changes to approved
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"