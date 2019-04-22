@progressReport @regression
Feature: Validate all scenarios in Progress Report

  Background: To create a progress report

    Given I delete the record "Automation Permanent Award" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award  "Automation Permanent Award"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "8" seconds
    When I get the EGMS ID for record "Automation Permanent Award" having field name "Title__c" from the object "ProgressReports__c"
    When User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |

  @taskCreationForSubrecipientProgressReport
  Scenario: To assert the task creation for Progress Report
    Then I see status in Progress-bar is "Created" and is "green"

  @editProgressReport
  Scenario: To edit Progress Report
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @editKPIProgressReport
  Scenario: To edit KPI in Progress Report
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    Then I see that "7.00" has been added in flextable with Id "progressReport::kpiTableId"

  @formFillingProgressReport
  Scenario: To fill and complete the form in Progress Report
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "progressReport::formTableId"
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    Then I see that "100.00%" has been added in flextable with Id "progressReport::formTableId"

  @kpiOfProgressReportsnoteditable
  Scenario: To validate  KPI for progress report are not editable post submission of prog report to grantor.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    When I navigate to "Performance" sub tab
    Then I cannot see row level action button "Edit" against "Actions" in flex table with id "progressReport::kpiTableId"

  @submitProgressReportToGrantor
  Scenario: To submit Progress Report to Grantor
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @submittedProgressReportTableUpdate
  Scenario: To validate Submitted Progress Report Table is updated post report is submitted to Grantor.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    When I navigate to "Monitoring" tab
    And I navigate to "Manage Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Submitted Progress Reports" in "progressReport::progressReportFlexTableId"
    And I perform quick search for "Record Id" in "progressReport::progressReportFlexTableId" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "progressReport::progressReportFlexTableId"

  @spaUserBlockedfromSubmisionOfProgressReport @notfuctional
  Scenario: To validate SPA user is not allowed to Submit Progress Report
    When User "SPA" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Then I cannot see top right button "Submit to Grantor" in page detail

  @errorMessagesFieldsRequiredforSubmissionOfProgressReports
  Scenario: To validate Error Messages for fields required for Submission of Progress Report
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - Certify the progress report by checking the acknowledgment box before submitting to Grantor. |
      | Performance Tab - Enter at least one Key Accomplishment before submitting to Grantor.                       |
      | Performance Tab - Enter at least one Obstacle before submitting to Grantor.                                 |
      | Performance Tab - Enter at least one Plan before submitting to Grantor.                                     |
      | Forms and Attachments Tab - Fill all the required data in the form before submitting to Grantor.            |

  @internalSentProgressReportToSubRecipient
  Scenario: To send back the Progress Report
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Send Back to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent Back to Subrecipient" and is "red"

  @historyOfProgressReportSentToSubRecipient
  Scenario: To validate the field history status update on the internal side
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Send Back to Subrecipient" in the page details
    When I navigate to "History" sub tab
    Then I see value "Sent Back to Subrecipient" for title "New Value" inside table "History"

  @taskCreatedOnSendToSubrecipientProgressReport
  Scenario: To assert the task creation for Sub recipient user Progress Report after Progress Report is Sent back to Subrecipient.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Send Back to Subrecipient" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks"

  @resubmitProgressReportToGrantor
  Scenario: To validate SR user is able to Submit the Progress Report post Progress Report it was sent back for corrections by the Grantor.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Send Back to Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 25     | 7             |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @assignApproversToProgressReport
  Scenario: To assign or change the defualt approvers in Progress Report
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
#    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    When User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Then I see that "Automation PM" has been added in flextable with Id "flexGridProgressReportsRolesandResponsibilities"

  @submitProgressReportForApproval
  Scenario: To submit Progress Report for approval
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    When User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  @progressReportHappyPath
  Scenario: To approve Progress Report
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Approved" and is "green"

  @approveProgressReportOnResubmission
  Scenario: To validate Progress Report which were sent back to Sub Recipient by Grantor are approved successfully post revision
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Send Back to Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 95     | 7             |
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Approved" and is "green"

  @sendBacktoOwnerOfProgressReportByProgramApprover
  Scenario: To validate  Progress Report send back to owner functionality by program approver.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send to Owner" on the approval decision box
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @historyOfProgressReportsendbacktoOwnerOfProgressReport
  Scenario: To validate  field history update post Progress Report is send back to owner by program approver.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send to Owner" on the approval decision box
    When I navigate to "History" sub tab
    Then I see value "Submitted to Grantor" for title "New Value" inside table "History"

  @taskAssertionSendbacktOwnerOfProgressReportbyProgramApprover
  Scenario: To validate  task is not created for Grantor post Program Approver Sends back the progress report to Owner.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send Back" on the approval decision box
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks"

  @approvalofProgressReportSendbacktoOwnerOfProgressReportbyProgramApprover
  Scenario: To validate  Progress Report approval is successful post Program Approver Sends back the progress report to Owner.

    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send Back" on the approval decision box
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Monitoring" tab
    And I navigate to "Manage Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Submitted Progress Reports" in "progressReport::internalProgressReportFlexTableId"
    And I click on "View" icon for "Record Id" inside flex table with id "progressReport::internalProgressReportFlexTableId"
    Given I click on "Submit for Approval" in the page details
    When "2" Approvers "Automation PM,Automation FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Approved" and is "green"

  @progressReportsNotEditablePostSubmission
  Scenario: To validate progress report are not editable post submission of progress report to grantor.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    Then I cannot see top right button "Edit" in page detail

  @sendBacktoOwnerOfProgressReportbyFiscalApprover
  Scenario: To validate  Progress Report send back to owner functionality by Fiscal approver.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    Given I re-login to "As a Grantor" app as "Automation FO" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send Back" on the approval decision box
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @progressReportsTableUpdateOnAward
  Scenario: To validate Progress Reports Table on the award is updated with respect to approval of progress reports
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I click "Award__c" lookup link
    And I navigate to "Performance" sub tab
    Then I see value "7" for title "Actual" inside table "inlineEditGridGrantorAwardKeyOutcomes"

  @historyOfProgressReportsendbacktoOwnerOfProgressReportbyFiscalApprover
  Scenario: To validate  field history update post Progress Report is send back to owner by Fiscal approver.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I pause execution for "3" seconds
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send to Owner" on the approval decision box
    When I navigate to "History" sub tab
    Then I see value "Submitted to Grantor" for title "New Value" inside table "History"

  @taskAssertionSendbacktoOwnerOfProgressReportbyFiscalApprover
  Scenario: To validate  task is not created for Grantor post Fiscal Approver Sends back the progress report to Owner.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send to Owner" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I do not see value inside table with id "PhasePendingTasks"

  @approvalofProgressReportSendbacktOwnerOfProgressReportbyFiscalApprover
  Scenario: To validate  Progress Report approval is successful post Program Approver Sends back the progress report to Owner.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send to Owner" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Manage Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Submitted Progress Reports" in "progressReport::internalProgressReportFlexTableId"
    And I click on "View" icon for "Record Id" inside flex table with id "progressReport::internalProgressReportFlexTableId"
    Given I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Approved" and is "green"

  @taskAssertionForFiscalApproverPostSendBackProgressReportByProgramApprover
  Scenario: To validate  task is not created for Fiscal Approver post Program Approver Sends back the progress report to Owner.
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 3             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Monitoring    |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Send to Owner |                   |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks"

  @approvalOfProgressReport @progressReportHappyPathWithoutDefaultApprovers
  Scenario: To approve Progress Report by changing the defualt approvers in Progress Report
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "progressReport::kpiTableId" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    And I fill in the form "Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | AUTO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportsRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Approved" and is "green"