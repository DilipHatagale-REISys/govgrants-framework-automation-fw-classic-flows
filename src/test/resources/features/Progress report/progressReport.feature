@progressReport
Feature: Validate all scenarios in Progress Report

  Background: Navigate to Award
    Given I delete the record "Automation Progress Report" from the object "Progress Report"

  @taskCreationForSubrecipientProgressReport @progressReport @all
  Scenario: To assert the task creation for Progress Report
    When User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    Then I see status in Progress-bar is "Created" and is "green"

  @editProgressReport @progressReport @all
  Scenario: To edit Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @editKPIProgressReport @progressReport @all
  Scenario: To edit KPI in Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    Then I see that "7" has been added in flextable with Id "flexGridProgressReportKeyOutcomes"

  @kpiOfProgressReportsnoteditable @progressReport @all
  Scenario: To validate  KPI for progress report are not editable post submission of prog report to grantor.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    When I navigate to "Performance" sub tab
    Then I cannot see row level action button "Edit" against "Actions" in flex table with id "flexGridProgressReportKeyOutcomes"

  @formFillingProgressReport @progressReport @all
  Scenario: To fill and complete the form in Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Medicaid Community Initiative Progress Report" inside flex table with id "FormComponent"
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    Then I see that "100.00%" has been added in flextable with Id "FormComponent"

  @submitProgressReportToGrantor @progressReport @all
  Scenario: To submit Progress Report to Grantor
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @submittedProgressReportTableUpdate @progressReport @all
  Scenario: To validate Submitted Progress Report Table is updated post report is submitted to Grantor.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    When I navigate to "Monitoring" tab
    And I navigate to "Manage Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Submitted Progress Reports" in "GrantorProgressReportsExternal"
    And I perform quick search for "Record Id" in "Submitted Progress Reports" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "GrantorProgressReportsExternal"

  @spaUserBlockedfromSubmisionOfProgressReport @progressReport @all
  Scenario: To validate SPA user is not allowed to Submit Progress Report
    Given User "SPA" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Then I cannot see top right button "Submit to Grantor" in page detail

  @errorMessagesFieldsRequiredforSubmissionOfProgressReports @progressReport @all
  Scenario: To validate Error Messages for fields required for Submission of Progress Report by .
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details :
      | Forms and Attachments Tab - Fill all the required data in the form before submitting to Grantor. |

  @internalSentProgressReportToSubRecipient  @progressReport @all
  Scenario: To send back the Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Send Back to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent Back to Subrecipient" and is "red"

  @historyOfProgressReportSentToSubRecipient  @progressReport @all
  Scenario: To validate the field history status update on the internal side
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Send Back to Subrecipient" in the page details
    When I navigate to "History" sub tab
    Then I see value "Sent Back to Subrecipient" for title "New Value" inside table "History"

  @taskCreatedOnSendToSubrecipientProgressReport  @progressReport @all
  Scenario: To assert the task creation for Sub recipient user Progress Report after Progress Report is Sent back to Subrecipient.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Send Back to Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks"

  @resubmitToGrantorProgressReport @progressReport @all
  Scenario: To validate SR user is able to Submit the Progress Report post Progress Report it was sent back for corrections by the Grantor.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Send Back to Subrecipient" in the page details
    And User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 25     | 01/03/2019    |
      | Automation Announcement KPI | 85     | 01/03/2019    |
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @assignApproversToProgressReport @progressReport @all
  Scenario: To assign or change th defualt approvers in Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    When User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    Then I see that "Automation PM" has been added in flextable with Id "ProgressReportsRolesandResponsibilities"

  @submitProgressReportForApproval @progressReport @all
  Scenario: To submit Progress Report for approval
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    When User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  @approvalOfProgressReport @progressReportHappyPath @progressReport @all
  Scenario: To approve Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Approve the Progress Report"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Approve       |                   |
    Then I see status in Progress-bar is "Approved" and is "green"

  @approveProgressReportOnResubmission @progressReport @all
  Scenario: To validate Progress Report which were sent back to Sub Recipient by Grantor are approved successfully post revision
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Send Back to Subrecipient" in the page details
    And User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 95     | 08/02/2019    |
      | Automation Announcement KPI | 100    | 08/02/2019    |
    And I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    Given I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Approve the Progress Report"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Approved" and is "green"

  @sendBacktoOwnerOfProgressReportByProgramApprover  @progressReport @all
  Scenario: To validate  Progress Report send back to owner functionality by program approver.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    Given I click on "Submit for Approval" in the page details
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send Back" on the approval decision box
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @historyOfProgressReportsendbacktoOwnerOfProgressReport @progressReport @all  			####the individual annotation is to be changed - done
  Scenario: To validate  field history update post Progress Report is send back to owner by program approver.

    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    Given I click on "Submit for Approval" in the page details
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send Back" on the approval decision box
    When I navigate to "History" sub tab
    Then I see value "Submitted to Grantor" for title "New Value" inside table "History"

  @taskAssertionSendbacktOwnerOfProgressReportbyProgramApprover @progressReport @all
  Scenario: To validate  task is not created for Grantor post Program Approver Sends back the progress report to Owner.

    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    Given I click on "Submit for Approval" in the page details
    Given I re-login to "As a Grantor" app as "Automation PM" user
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

  @approvalofProgressReportSendbacktOwnerOfProgressReportbyProgramApprover @progressReport @all
  Scenario: To validate  Progress Report approval is successful post Program Approver Sends back the progress report to Owner.

    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Send Back" on the approval decision box
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Monitoring" tab
    And I navigate to "Manage Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Submitted Progress Reports" in "GrantorProgressReportsInternal"
    And I click on "View" icon for "Record Id" inside flex table with id "GrantorProgressReportsInternal"
    Given I click on "Submit for Approval" in the page details
    When "2" Approvers "Automation PM,Automation FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Approved" and is "green"

  @progressReportsNotEditablePostSubmission @progressReport @all
  Scenario: To validate progress report are not editable post submission of progress report to grantor.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    Then I cannot see top right button "Edit" in page detail

  @sendBacktoOwnerOfProgressReportbyFiscalApprover @progressReport @all
  Scenario: To validate  Progress Report send back to owner functionality by Fiscal approver.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    Given I click on "Submit for Approval" in the page details
    Given I re-login to "As a Grantor" app as "Automation PM" user
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

  @progressReportsTableUpdateOnAward @progressReport @all
  Scenario: To validate Progress Reports Table on the award is updated with respect to approval of progress reports
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I click "Award__c" lookup link
    And I navigate to "Performance" sub tab
    Then I see value "7" for title "Actual" inside table "inlineEditGridGrantorAwardKeyOutcomes"

  @historyOfProgressReportsendbacktoOwnerOfProgressReportbyFiscalApprover  @progressReport @all
  Scenario: To validate  field history update post Progress Report is send back to owner by Fiscal approver.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    Given I click on "Submit for Approval" in the page details
    Given I re-login to "As a Grantor" app as "Automation PM" user
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
    When I navigate to "History" sub tab
    Then I see value "Submitted to Grantor" for title "New Value" inside table "History"

  @taskAssertionSendbacktOwnerOfProgressReportbyFiscalApprover @progressReport @all
  Scenario: To validate  task is not created for Grantor post Fiscal Approver Sends back the progress report to Owner.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    Given I click on "Submit for Approval" in the page details
    Given I re-login to "As a Grantor" app as "Automation PM" user
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
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks"

  @approvalofProgressReportSendbacktOwnerOfProgressReportbyFiscalApprover @progressReport @all
  Scenario: To validate  Progress Report approval is successful post Program Approver Sends back the progress report to Owner.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    Given I click on "Submit for Approval" in the page details
    Given I re-login to "As a Grantor" app as "Automation PM" user
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
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Monitoring" tab
    And I navigate to "Manage Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Submitted Progress Reports" in "GrantorProgressReportsInternal"
    And I click on "View" icon for "Record Id" inside flex table with id "GrantorProgressReportsInternal"
    Given I click on "Submit for Approval" in the page details
    When "2" Approvers "Automation PM,Automation FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Approved" and is "green"

  @taskAssertionForFiscalApproverPostSendBackProgressReportByProgramApprover @progressReport @all
  Scenario: To validate  task is not created for Fiscal Approver post Program Approver Sends back the progress report to Owner.
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    Given I click on "Submit for Approval" in the page details
    When "1" Approvers "Automation PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Send Back  |                   |
    Given I re-login to "As a Grantor" app as "FO" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks"

  @approvalOfProgressReport @progressReportHappyPathWithoutDefaultApprovers @progressReport @all
  Scenario: To approve Progress Report by changing the defualt approvers in Progress Report
    Given User "SPI" receives the task for "Complete Progress Report"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Edition" in excel "ProgressReport_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "flexGridProgressReportKeyOutcomes" by clicking "Edit" :
      | Title                       | Actual | Reported Date |
      | Automation Program KPI      | 7      | 01/03/2019    |
      | Automation Announcement KPI | 7      | 01/03/2019    |
    And I fill in the form "Medicaid Community Initiative Progress Report" from sheet "Form Fields" in excel "ProgressReport_Field_Values.xlsx"
      | Actions     | Step 1                | Step 2        |
      | Navigation  | Forms and Attachments |               |
      | FlexTable   | Edit                  | FormComponent |
      | Form Button | Save                  | Back          |
      | Validation  | Validate              | FormComponent |
    Given I click on "Submit to Grantor" in the page details
    And User "EXE" receives the task for "Review Progress Report"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Monitoring        | As a Grantor | DEMO   |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    When I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                  | Step 2 | Step 3           |
      | Subtab     | Responsibilities                        |        |                  |
      | Approver 1 | ProgressReportsRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | ProgressReportsRolesandResponsibilities | Edit   | Fiscal Approver  |
    Given I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Approve the Progress Report"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Approve       |                   |
    Then I see status in Progress-bar is "Approved" and is "green"