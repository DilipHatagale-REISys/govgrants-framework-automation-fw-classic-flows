@regression @parallel-regression @progressReport @progressReportNB
Feature: Validate scenarios in Progress Report without background

  @37184 @ValidateScheduleFrequencyQuarterlyScheduleBaseAsCalendar @mahadev
  Scenario Outline: Verify on Active award User is allowed to select Frequency as Quarterly when schedule base is Calendar
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ScheduleQuartelyCalendar" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:13" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @37228 @34932 @34938 @34945 @34946 @45732 @58534 @validateScheduleFrequencyAnnuallyScheduleBaseAsCalendar @mahadev
  Scenario Outline: Verify on Active award User is allowed to select Frequency as  Annually when schedule base is Calendar | Validate User is allowed to change frequency as Annually, schedule base as calendar on progress report schedule when the award is active
  Verify on Active award User is allowed to select Frequency as Semi-Annually  when schedule base is Calendar | Verify on Active award User is allowed to select Frequency as Bi-Monthly when schedule base is Calendar
  Verify Sub-recipient user are not allowed to Edit the Progress Report Schedule table on active subaward | Validate User is allowed to change frequency as Annually, schedule base as calendar on active award and progress report should be created
  Validate User is not allowed to select schedule dates less than 60 days when frequency is Bi-Monthly
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    Then I softly can see row level action button "Edit" against "Progress Report" in flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ScheduleAnnuallyCalendar" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see field "Frequency" as "Annually"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    Then I softly see total records count "Total Records:2" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ScheduleSemiAnnually" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    Then I softly see total records count "Total Records:3" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ScheduleBiMonthly" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    Then I softly see total records count "Total Records:7" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "BI-MonthlyError" values from "Errors.xlsx"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | The time between Schedule Start Date and Schedule End Date must be greater than or equal to 365 days if Annually frequency is selected. |
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Progress Report" in flex table with id "---progressreport:-:progressReportsScheduleId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @34936 @validateUserIsNotAllowedToSelectReportingPeriodStartDateBeforeProjectPeriodStartDateOnActiveAward @mahadev
  Scenario Outline: Validate User is not allowed to save reporting Period Start date less than Project Period Start Date on active award
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "Progress Report StartDate Error" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | Schedule Start date cannot be before Budget Period Start Date |
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55312 @taskCreationForSubrecipientProgressReportAtGranteePortal @mahadev
  Scenario: Validate  task is created for Sub-recipient user when batch is executed on active award
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"

  @45733 @37232 @45744 @45738 @SelectDesiredFrequencyAsMonthlywithScheduleBaseAsReportingPeriod @jitendra
  Scenario Outline: Verify Reporting Period End Date is same as the Schedule End Date (Active award) | Validate User is not allowed to select schedule dates less than 120 days when frequency is Semi-Annually
  Verify if Schedule Start date field is not selected then it should not allow to create the schedule | Verify Reporting Period Start Date is same as the Schedule Start Date (Active)
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I navigate to last page in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    And I get the value from row "last row" for column name "Reporting Period End Date" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    Then I softly verify that the Schedule end date is matching with Reporting Period End Date
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "SemiAnnuallyError" values from "Errors.xlsx"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | The time between Schedule Start Date and Schedule End Date must be greater than or equal to 28 days if Monthly frequency is selected. |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "Progress Report"
    And I get the value from row "1" for column name "Reporting Period Start Date" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    Then I softly verify that the Schedule start date is matching with Reporting Period start Date
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "NoScheduleStartDateError" values from "Errors.xlsx"
    And I enter value "" into field "CalReportingStartDate__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Reporting Period Start Date is Required to save. |
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55314 @34934 @updateOfSemiAnnualFrequencyOnModalBeforeClose @jitendra
  Scenario Outline: Validate User is allowed to change frequency Not applicable to Semi-Annually , schedule base as calendar on progress report schedule when the award is active
  Verify User is allowed to change frequency as Monthly, on progress report schedule when Progress report is approved on active award
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "Progress Report Semi-Annually" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Terms" sub tab
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "ScheduledEndDateAfterStartDate" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Schedule End date cannot be after Project Period End Date |
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @58532 @58665 @58737 @verifyUserIsAllowedToChangeFrequencyAsMonthlyOnProgressReportSchedule  @mahadev
  Scenario Outline: Verify User is allowed to change frequency as Monthly, on progress report schedule when Progress report is approved on active award
  Verify User is allowed to change frequency as Quarterly,on active award when Progress report is approved by Program approver
  Verify Subaward is getting updated with Progress report schedules at Sub-recipient end on active award
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    And I refresh the page
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 95     | 7             |
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Monthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see field "Frequency" as "Monthly"
    And I refresh the page
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Quarterly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see field "Frequency" as "Quarterly"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @34944 @validateInternalUserIsAbleToSeeSchedulesGeneratedUnderScheduledActivitiesOnActiveAward  @mahadev
  Scenario Outline: Validate Internal User is able to see the Schedules generated under Scheduled Activities on active award
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    And I expand nested table containing column value "Progress Report"
    When I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---progressreport:-:progressReportsTaskScheduleId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Monitoring Schedules" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Scheduled Activities - All"
    When I perform quick search for "{SavedValue:EGMSID}" in "---progressreport:-:monitoringScheduleGrantorTableId---" panel
    Then I see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---progressReport:-:monitoringScheduleGrantorTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @65419 @checkSheduleCreatedAfternegotiationAccepted @jitendra
  Scenario Outline: Verify once batch is run and User edit the Frequency then the Schedule should be generated accordingly
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I enter value "Automation Runtime Award" into field "ProjectTitle__c"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:recipientsRelatedAwards2FlexToggleTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:recipientsRelatedAwards2FlexToggleTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Monthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    Then I see value "Monthly" for title "Frequency" inside table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55397 @VerifyOnceBatchIsRunAndUserEditFrequencyThenSchedulesShouldBeGeneratedAccordingly  @mahadev
  Scenario Outline: Verify Once Batch is run and User edit the Frequency then the Schedule should be generated accordingly
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    Then I softly see value "Quarterly" for title "Frequency" inside table "---progressReport:-:progressReportsScheduleId---"
    And I navigate to "Terms" sub tab
    When I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    When I expand nested table containing column value "Progress Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID1" from flex table "---progressReport:-:progressReportsTaskScheduleId---"
    When I collapse nested table containing column value "Progress Report"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Quarterly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I expand nested table containing column value "Progress Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID2" from flex table "---progressReport:-:progressReportsTaskScheduleId---"
    Then I softly see progress report table is getting updated with count "Total Records:5" inside flextable with Id "---progressReport:-:progressReportsTaskScheduleId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @34935 @58751 @ValidateOnActiveAwardProgressReportIsCreatedAtSubRecipientEndWhenBatchIsExecuted @mahadev
  Scenario Outline: : Validate sub-recipient user can see progress report under Performance tab at Sub-award View when Batch is executed | Validate on active award Progress report is created at Sub-recipient end when batch is executed
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:recipientGrantProgressReportTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Created" inside table "---progressReport:-:recipientAwardProgressReportTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @55307 @58664 @updateOfSemiAnnualFrequencyOnModalBeforeClose @jitendra
  Scenario Outline: Validate User is allowed to change frequency as Annually, schedule base as calendar on progress report schedule when Progress report is submitted to Grantor
  Validate SPA user is not allowed to change the Progress report Schedule on Active subaward when status of Progress Report is  created
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPA" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientsRelatedSubAwardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---progressreport:-:progressReportsScheduleId---"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Annually" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    Then I softly see value "Annually" for title "Frequency" inside table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @58885 @34937 @verifySubrecipientUserAbleToSeeDraftProgressReportAtMonitoringTab @mahadev
  Scenario: Verify that sub-recipient user will be able to see Draft Progress Report at Progress Reports - Draft table on active award by using List View | Validate draft progress report at under monitoring tab is not present at Internal User end using List view
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    Then I softly cannot see toggle option "Progress Reports - Draft" inside flex table id "---progressReport:-:internalProgressReportFlexTableId---"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Reporting" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "Record Id" in "---progressReport:-:progressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" against the value "Created" inside table "---progressReport:-:progressReportFlexTableId---"

  @58967 @validateUserNotifiedColumnIsUpdatedWithACheckedMarkForMultipleProgressReportsScheduleWhenGeneratedForSRUser @mahadev
  Scenario Outline: Validate user notified column is updated with a tick mark for multiple Progress reports Schedule when task is generated for SR user
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c,false"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c,false"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    And I expand nested table containing column value "Progress Report"
    Then I can see "2" record value is checked for field name "TaskCreated__c"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59132 @validateSRUserNotAllowedToSubmitPRToGrantorWhenAcknowledgemetNotChecked @mahadev
  Scenario: Validate Sub-recipient user is not allowed to submit progress report to grantor when Acknowledgement box is not checked at Overview tab
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "ErrorForAck" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - Certify the progress report by checking the acknowledgment box before submitting to Grantor. |

  @59133 @validateSRUserNotAllowedToSubmitPRToGrantorWhenKeyAccomplishmentNotEntered @mahadev
  Scenario: Validate sub-recipient user is not allowed to submit progress report to grantor when Key Accomplishments  not entered
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "KeyAccError" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Performance Tab - Enter at least one Key Accomplishment before submitting to Grantor. |

  @59134 @validateSRUserNotAllowedToSubmitPRToGrantorWhenObstacleNotEntered @mahadev
  Scenario: Validate Sub-recipient user is not allowed to submit progress report to grantor when Obstacle is not entered at Performance tab
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "ObstacleError" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Performance Tab - Enter at least one Obstacle before submitting to Grantor. |

  @59135 @validateSRUserNotAllowedToSubmitPRToGrantorWhenPlanNotEntered @mahadev @bugged-80237
  Scenario: Validate Sub-recipient user is not allowed to submit progress report to grantor when Plan is not entered at Performance tab
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "PlanError" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Performance Tab - Enter at least one Plan before submitting to Grantor. |

  @59137 @58524 @NoPRSubmitToGrantorIfSupportDocIsMissing @jitendra
  Scenario Outline: Validate Sub-recipient user is not allowed to submit progress report to grantor when Supporting document is missing under Forms and Attachments Tab.
  Validate User is allowed to change frequency as Quarterly, on progress report schedule when progress report status is Submitted to Approval on active award
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Forms and Attachments Tab - Supporting Documents are missing. |
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
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
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter "Progress Report Quarterly" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see field "Frequency" as "Quarterly"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59199 @59200 @NotModifySupportDocListAfterSubmitToGrantor @jitendra
  Scenario Outline: Validate SR User is not able to modify Supporting Documents Checklist table when Progress report is Submitted to Grantor | Validate SR User is able to modify Supporting Documents Checklist table when Progress report status is sent back to sub-recipient
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Document" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly cannot see row level action button "Attach" against "Automation" in flex table with id "---progressReport:-:progressReportChecklistsTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    And I refresh the page
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Reporting" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Attachments" sub tab
    Then I softly can see row level action button "Attach" against "Automation" in flex table with id "---progressReport:-:progressReportChecklistsTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59189 @validateSubmitProgressReportWithoutUploadingSupportingDocument @mahadev
  Scenario Outline: Validate SR is allowed to submit Progress report to grantor without uploading Supporting document When Supporting document checklist is selected Optional at Grant
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    When I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59190 @validateSubrecipientDocumentLinkFieldValueIsNotApplicable @mahadev
  Scenario Outline: Validate by default Subrecipient document link field value is Not Applicable at SR user end when Supporting document checklist is selected Mandatory at Grant
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Forms and Attachments" sub tab
    Then I see value "Not Applicable" for title "Subrecipient Document Link" against the value "Active" inside table "---progressreport:-:progressReportChecklistsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59193 @validateDocumentLinkFieldValueChangeToViewHyperlink @mahadev
  Scenario Outline: Validate once document is uploaded by SR user than Document Link field value change to view hyperlink on created Progress report
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Attach" icon for "Active" inside flex table with id "flexGridProgressReportChecklists" without waiting for record
    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "flexGridProgressReportChecklists"
    When I close "Upload Document" modal by clicking the top right x button
    Then I see value "View" for title "Subrecipient Document Link" against the value "Active" inside table "flexGridProgressReportChecklists"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59283 @validateSubrecipientDocumentLinkFieldValueIsNotApplicableWhenOptional @mahadev
  Scenario Outline: Validate by default Template Link field value is Not Applicable at Progress report if template is not uploaded by award owner at Grant
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Forms and Attachments" sub tab
    Then I see value "Not Applicable" for title "Subrecipient Document Link" against the value "Active" inside table "---progressreport:-:progressReportChecklistsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59284 @validateSubrecipientDocumentLinkFieldValueIsNotApplicableWhenOptional @jitendra
  Scenario Outline: Validate at SR User side Template Link field value is View Hyperlink at Progress report if template is uploaded by award owner at Grant.
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    Then I see value "View" for title "Template Link" against the value "Active" inside table "---progressreport:-:ProgressReportChecklistTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59289 @TemplateLinkOptional @jitendra
  Scenario Outline: Validate  Supporting Checklist Table at Progress Report is generated with the latest updated data by award owner at SR User End
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Attachments" sub tab
    And I edit the following rows inline in flex table with id "---progressreport:-:grantChecklistsTableId---" by clicking "Edit" :
      | Description | Required |
      | Automation  | Optional |
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Forms and Attachments" sub tab
    Then I see value "Optional" for title "Required" against the value "Automation" inside table "---progressreport:-:progressReportChecklistsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59140 @attachementSavedSuccessfully @jitendra
  Scenario Outline: Validate SR user is able to attach the document from Upload file from computer option when Supporting document checklist is selected Mandatory at Grant
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    Then I see the following messages in the page details contains:
      | Attachment saved successfully |
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59569 @validateSubmittedByFieldNotDisplayedOnPR @mahadev
  Scenario Outline: Validate Submitted By field at Certification table is not present on Progress report at SR user end when the progress report status is Created
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    Then I cannot see field "Submitted By:" inside page block
    Examples:
      | Grant Name                            | Award Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59565 @validateSupportingDocumentUploadedIsReflectingUnderAttachmentsTable @mahadev
  Scenario Outline: Validate document uploaded at supporting  document checklist table is getting reflected at Attachments table also in progress report
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Attachments" sub tab
    When I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "---progressReport:-:progressReportChecklistsTableId---"
    When I close "Upload Document" modal by clicking the top right x button
    Then I see "Program_Field_Values.xlsx" has been added in "Attachments" flex table
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @58880 @validateDraftProgressReportNotDisplayedToAwardOwner @mahadev
  Scenario: Verify that Internal user is not be able to see Draft Progress Report on active award by using List View
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"

  @59671 @validateSupportingDocumentUploadedIsAbleToViewByAwardOwner @mahadev
  Scenario Outline: Validate Internal User is able to view the uploaded supporting documents by SPI user when Progress report status is submitted to Grantor
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Attachments" sub tab
    When I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "---progressReport:-:progressReportChecklistsTableId---"
    When I close "Upload Document" modal by clicking the top right x button
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Attachments" sub tab
    Then I see "Automation SPI" has been added in "Attachments" flex table
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59672 @validateAwardOwnerCanNotDeleteSupportingDocumentChecklist @mahadev
  Scenario Outline: Validate Internal User is not able to delete the uploaded supporting documents by SPI user when Progress report status is submitted to Grantor
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Attachments" sub tab
    When I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "---progressReport:-:progressReportChecklistsTableId---"
    When I close "Upload Document" modal by clicking the top right x button
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Attachments" sub tab
    Then I cannot see row level action button "Delete" against Value "Automation SPI" inside "Attachments" flex table
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59673 @validateAwardOwnerCanNotUploadSupportingDocumentChecklist @mahadev
  Scenario Outline: Validate Internal User is not able to upload new supporting documents when Progress report status is submitted to Grantor
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Attachments" sub tab
    When I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "---progressReport:-:progressReportChecklistsTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Attachments" sub tab
    Then I cannot see top right button "Add" for "Attachments" flex table
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @59298 @MandatorySuppDocState @jitendra
  Scenario Outline: Validate Previous created Progress report remains the same at SR user end when Supporting checklist Table is updated by Award Owner
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Attachments" sub tab
    And I edit the following rows inline in flex table with id "---progressreport:-:grantChecklistsTableId---" by clicking "Edit" :
      | Description | Required |
      | Automation  | Optional |
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressreport:-:recipientActiveGrantTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressreport:-:recipientActiveGrantTableId---" with wait for record
    When I navigate to "Management" sub tab
    And I click on "Edit" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Forms and Attachments" sub tab
    Then I see value "Mandatory" for title "Required" against the value "Active" inside table "---progressreport:-:progressReportChecklistsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59573 @59572 @59188 @59574 @59288 @dowloadAttachment @jitendra
  Scenario Outline: : Validate SR User is able to download the uploaded document from attachment table on Progress report | Validate SR user is able to download the document from Subrecipient Document Link field when document is uploaded.
  Validate SR user is able to Delete the documents uploaded at supporting document checklist table at progress report | Validate SR User can View the template document at Progress report if template is uploaded by award owner at Grant level.
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Document" modal by clicking the top right x button
    Then I softly see "Program_Field_Values.xlsx" has been added in "Attachments" flex table
    And I refresh the page
    When I click on "Download" icon under attachment flex table
    Then I softly verify that the file "Program_Field_Values.xlsx" is downloaded
    And I click on hyperlink containing value "View"
    Then I softly verify that the file "Program_Field_Values.xlsx" is downloaded
    When I click on "Delete" icon under attachment flex table
    Then I softly do not see "Program_Field_Values.xlsx" has been added in "Attachments" flex table
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59196 @59197 @downloadPRthroughLinkPDF @jitendra @skipOnJenkins
  Scenario Outline: Validate SR User is able to download Supporting document checklist table in PDF format at Progress report with Status as Active.| Validate SR User is able to download Supporting document checklist table in XLS format when the table status is Active.
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    And I close modal by clicking the top right x button
    And I select "Download as PDF" from parallel lines dropdown of "Supporting Documents Checklist"
    And I download the file
    Then I softly verify that "pdf" file is downloaded
    And I see "Active" on page "1" of "govgrants" pdf file
    And I select "Download as XLS" from parallel lines dropdown of "Supporting Documents Checklist"
    And I download the file
    Then I softly verify that "xls" file is downloaded
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @60106 @60025 @60107 @validateFinalReportFieldIsEditable @mahadev
  Scenario Outline: Validate Final Report? field is editable when the Progress report status is Sent Back to Subrecipient | Validate System should generate pending task for award owner for the Final Progress report when the status is Submitted to Grantor
  Validate SR User is able to submit final progress report by selecting the checkbox and marking the Progress report as final
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    And I refresh the page
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Then I softly see checkbox field "Final Report?" is editable
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @60108 @60109 @validatePendingTaskForFinalProgressReportForProgramApproval @mahadev
  Scenario Outline: Validate pending task for Program approver for the Final Progress report when the status is Submitted for Approval
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:Record Id}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @60193 @60195 @60194 @60192 @validatePendingTaskForProgramApproverWhenFinalPRIsPendingToBeApproved @mahadev
  Scenario Outline: Validate System should generate pending task for Program approver for the next Progress report when Report marked Final is pending at his end
  Validate System should generate pending task for Fiscal approver for the next Progress report when Report marked Final is pending at his end | Validate System should generate pending task for Award Owner for the next Progress report when Report marked Final is pending at his end for Submitted for Approval
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I save the field labeled "EGMS ID" as "ProgresReport1"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport2"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgressReport2}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgressReport2}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgressReport2}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    When I click on "View" icon for "Sent Back to Subrecipient" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - This Progress Report cannot be submitted to the Grantor because a report marked as the Final report has been approved. |
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @59903 @validateProgressReportTableOnGrant @mahadev
  Scenario Outline: Validate Progress Reports Table at Management tab on Grant overview is getting updated with Progress report whose status is Created at SR User End
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    Given I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "<Award Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    When I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I see value "Record ID" for title "EGMS ID" inside table "---progressReport:-:recipientGrantProgressReportTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @60190 @60191 @deniedToSumbAnotherPRAfterPRisApproved @jitendra
  Scenario Outline: Verify User is allowed to change frequency as Monthly, on progress report schedule when Progress report is approved on active award
  Verify User is allowed to change frequency as Monthly, on progress report schedule when Progress report is approved on active award
    And I activated standalone subaward "Automation Runtime Award" with properties "NO_RISK_ASSESSMENT"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I save the field labeled "EGMS ID" as "PR1EGMSID"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I can see the message "<Error Message>" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PR1EGMSID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{savedValue:PR1EGMSID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PR1EGMSID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{savedValue:PR1EGMSID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    Then I can see the message "<Error Message>" in the approval decision
    Examples:
      | Award Name                            | Error Message                                                                                                                                                              |
      | {SavedValue:Automation Runtime Award} | This Progress Report cannot be approved because a report marked as the Final report has been approved. Send Back to Owner will allow the Owner to notify the Subrecipient. |

  @59195 @validateErrorMessageForForm @Keerti
  Scenario: Validate SR User is not allowed to submit progress report to Grantor When All forms Percentage is less than 100%
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientAwardProgressReportTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "ErrorForm" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details contains:
      | Forms and Attachments Tab - Fill all the required data in the form before submitting to Grantor. |

  @60299 @60300 @60301 @validateApprovalOfFinalPRByProgramApprover @mahadev
  Scenario Outline: Validate program approver can approve the Progress report which is Marked as Final | Validate Fiscal approver can approve the Progress report which is Marked as Final
  Validate Program approver cannot reject the Progress Report which is marked as final
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
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
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see that "{SavedValue:Record Id}" is in "Submitted for Approval" status
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see that "{SavedValue:Record Id}" is in "Approved" status
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @60303 @validateAwardOwnerCanSendBackFinalPR @mahadev
  Scenario Outline: Validate Award Owner can send Progress report to Sub-recipient for edition which is marked as Final
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent Back to Subrecipient" and is "red"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @60196 @validateSRUserCanSubmitPR @mahadev
  Scenario Outline: Validate SR User can Submit another Progress report if Final marked Progress report is pending for Submit for approval at Award owner end
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @60304 @validateAwardOwnerCanSendFinalPrforApproval @jitendra
  Scenario Outline: Validate Program report Marked as Final is Submitted for Approval when it is Submitted to Grantor after send back to Sub-recipient Status
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    When I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Given I click on "Send Back to Subrecipient" in the page details
    And I refresh the page
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 25     | 7             |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @60882 @validateFiscalApprovercannotForwardProgressReportWhenFinalprogressreportAlreadyApproved @mahadev
  Scenario Outline: Validate Fiscal Approver cannot Forward the Progress report when Final progress report request is already approved
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:subawardsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport2"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Reassign" to user "Automation EXE" in the approval decision
    Then I can see the message "<Error Message>" in the approval decision
    Examples:
      | Award Name                            | Grant Name                            | Error Message                                                                                                                                                              |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} | This Progress Report cannot be approved because a report marked as the Final report has been approved. Send Back to Owner will allow the Owner to notify the Subrecipient. |

  @60883 @validateProgramApproverCanApproveProgressReportWhenFinalprogressreportAlreadyApproved @mahadev
  Scenario Outline: Validate Program Approver can Send back Progress report to Owner when Final progress report request is already approved
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport2"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @60884 @validateFiscalApprovercanSendBackProgressReportWhenFinalprogressreportAlreadyApproved @mahadev
  Scenario Outline: Validate Fiscal Approver can send back Progress report to owner when Final progress report request is already approved
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport2"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @60880 @validateFiscalApprovercannotApproveProgressReportWhenFinalprogressreportAlreadyApproved @mahadev
  Scenario Outline: Validate Fiscal Approver cannot Approve the Progress report when Final progress report request is already approved
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    And I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:subawardsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport2"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I can see the message "<Error Message>" in the approval decision
    Examples:
      | Award Name                            | Grant Name                            | Error Message                                                                                                                                                              |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} | This Progress Report cannot be approved because a report marked as the Final report has been approved. Send Back to Owner will allow the Owner to notify the Subrecipient. |

  @60919 @fundingorgOnPROverviewTab @jitendra
  Scenario: Validate on Progress report Funding Organization field at Report Overview table under Overview tab is same as Award
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I see field "Funding Organization" as "Test Automation Organization"

  @60920 @subawardTitleOnPROverviewTab @jitendra
  Scenario: Validate on Progress report Subaward Title field at Report Overview table under Overview tab is same as Award
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I see field "Subaward Title" as "{SavedValue:Automation Runtime Award}"

  @60921 @budgetPeriodOnPROverviewTab @jitendra
  Scenario: Validate on Progress report Budget Period field at Report Overview table under Overview tab is same as Award.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:recipientsRelatedSubAwardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I see field "Budget Period" as "{savedValue:BudgetPeriod}"

  @60922 @budgetPeriodOnPROverviewTab @jitendra
  Scenario: Validate on Progress report Awarded Budget field at Subaward Spending table under Performance tab is same as Award
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:recipientsRelatedSubAwardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I save the field labeled "Total Subaward Amount this Budget Period" as "BudgetPeriodAmount"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Then I see field "Awarded Budget" as "{savedValue:BudgetPeriodAmount}"

  @60924 @orgNameOnPROverviewTab @jitendra
  Scenario: Validate on Progress report Organization Name field at Report Overview table under Overview tab is same as at Award.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressreport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I see field "Organization Name" as "SAN DIEGO ELECTRICAL TRAINING TRUST"

  @60879 @validateProgramApprovercannotApprovePRWhenFinalPRAlreadyApproved @mahadev @smoke
  Scenario Outline: Validate Program approver is not allowed to approve the pending progress report if another Final Progress report is approved
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport2"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I can see the message "<Error Message>" in the approval decision
    Examples:
      | Award Name                            | Grant Name                            | Error Message                                                                                                                                                              |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} | This Progress Report cannot be approved because a report marked as the Final report has been approved. Send Back to Owner will allow the Owner to notify the Subrecipient. |

  @61090 @validateObjectiveNotDisplayedInPR @mahadev
  Scenario Outline: Validate if Objectives Required? field is No at Grant, then Objectives table should not present on Progress report at SR End
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I cannot see page block "Objectives"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @61092 @validateMultipleObjectivesInPRCarriedFromAward @mahadev @bugged-80238
  Scenario Outline: Validate if Objectives Required? field is yes at Grant, Multiple Objectives are associated at award then it is carried at Progress report at SR End
    When I delete the record "{SavedValue:Automation Runtime Award}" from the object "Amendment Request"
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Then I softly see value "Automation Permanent Objective" for title "Title" inside table "---progressReport:-:objectivesTableId---"
    Then I softly see value "Automation Permanent Objective2" for title "Title" inside table "---progressReport:-:objectivesTableId---"
    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime Award} |

  @60881 @validateProgramApprovercannotApproveProgressReportWhenFinalprogressreportApproved @mahadev
  Scenario Outline: Validate Program Approver cannot approve the progress report when Final progress report is already approved
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c,false"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "FinalProgressReport" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport2"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgressReport2}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgressReport2}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I can see the message "<Error Message>" in the approval decision
    Examples:
      | Award Name                            | Grant Name                            | Error Message                                                                                                                                                                                                       |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} | Any approval decision on the Progress Report cannot be made at this time because a report marked as the Final Report has already been approved. Send Back to Owner will allow the owner to notify the Subrecipient. |

  @62779 @PercentagePeriodAtPRAfterPaymentRequest @jitendra
  Scenario Outline: Verify Submitted for approval report Percentage of Budget Remaining field remains the same on Progress report when the Payment request type is Reimbursement with Approved Status.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I get the "EGMS ID"
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientAwardProgressReportTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    And I save the field labeled "Perentage of Budget Remaining" as "PercentageRemainingBudget"
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:grantorGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see field "Perentage of Budget Remaining" as "{savedValue:PercentageRemainingBudget}"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62246 @62237 @validateReviewedPRAfterTCAmendmentIsCarryForwardedA @mahadev
  Scenario Outline: Validate progress report with reviewed status is carry forwarded after TC amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgresReportID"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Justification" into field "fieldTncComments__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Other"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Performance" sub tab
    Then I softly see value "Reviewed" for title "Status" against the value "{SavedValue:ProgresReportID}" inside table "---progressreport:-:grantorProgressReportsTableId---"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see value "Reviewed" for title "Status" against the value "{SavedValue:ProgresReportID}" inside table "---progressreport:-:recipientAwardProgressReportTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62245 @62238 @validateSubmittedForReviewPRAfterTCAmendmentIsCarryForwardedAonAwardAtInternalportal @mahadev
  Scenario Outline: Validate progress report with Submitted for Review status is carry forwarded at internal portal on award after Terms and conditions amendment
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgresReportID"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Justification" into field "fieldTncComments__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Other"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    When I navigate to "Performance" sub tab
    Then I softly see value "Submitted for Review" for title "Status" against the value "{SavedValue:ProgresReportID}" inside table "---progressreport:-:grantorProgressReportsTableId---"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see value "Submitted for Review" for title "Status" against the value "{SavedValue:ProgresReportID}" inside table "---progressreport:-:recipientAwardProgressReportTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63112 @validateReviewedPRStatusAfterCloseoutApprovalAtTermination @jitendra
  Scenario Outline: Verify Progress report with Reviewed status changed to  Force Closed when closeout request is approved with type as Termination by award owner.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport1"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:ProgressReport1}" inside table "---progressreport:-:grantorProgressReportsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63111 @validateSubmittedForGrantorPRStatusAfterCloseoutApprovalAtTermination @jitendra
  Scenario Outline: Verify Progress report with Submitted to Grantor status changed to  Force Closed when closeout request is approved with type as Termination by award owner.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport1"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:ProgressReport1}" inside table "---progressreport:-:grantorGrantProgressReportTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63105 @validateSubmittedForGrantorPRStatusAfterCloseoutApprovalAtEarlyCompletion @jitendra
  Scenario Outline: Verify Progress report with Submitted to Grantor status changed to Force Closed when closeout request is approved with type as Early completion by award owner.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport1"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:ProgressReport1}" inside table "---progressreport:-:grantorGrantProgressReportTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63106  @validateReviewedPRStatusAfterCloseoutApproval @mahadev
  Scenario Outline: Verify Progress report with Reviewed status changed to Force Closed when closeout request is approved with type as Early completion by award owner
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport1"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:ProgressReport1}" inside table "---progressreport:-:grantorProgressReportsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63107  @validatePRStatusAfterCloseoutApprovalAtSPIEnd @mahadev
  Scenario Outline: Verify Progress report with Send back to Sub-recipient status changed to Force Closed when closeout request is approved with type as Early completion by award owner
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport1"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Send Back to Subrecipient" in the page details
    And I refresh the page
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:ProgressReport1}" inside table "---progressreport:-:recipientAwardProgressReportTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63103 @63118 @validatePRCreatedStatusAfterCloseoutApprovalAtSPIEndEarlyCompletion @jitendra
  Scenario Outline: Verify Progress report with created status changed to Force Closed when closeout request is approved with type as Early completion by award owner.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:Record Id}" inside table "---progressreport:-:recipientAwardProgressReportTableId---"
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientsRelatedSubAwardsTableId---"
    When I navigate to "Performance" sub tab
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63108 @validatePRCreatedStatusAfterCloseoutApprovalAtSPIEndTermination @jitendra
  Scenario Outline: Verify Progress report with created status changed to  Force Closed when closeout request is approved with type as Termination by award owner.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:Record Id}" inside table "---progressreport:-:recipientAwardProgressReportTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63104 @validateSubmittedForApprovalPRStatusAfterCloseoutApprovalWithTypeEarlyCompletion @jitendra
  Scenario Outline: Verify Progress report with Submitted for approval status changed to  Force Closed when closeout request is approved with type as Termination by award owner
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport1"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Management" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:grantorGrantProgressReportTableId---" without waiting for record
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:ProgressReport1}" inside table "---progressreport:-:grantorProgressReportsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63110  @validateSubmittedForApprovalPRStatusAfterCloseoutApproval@mahadev
  Scenario Outline: Verify Progress report with Submitted for approval status changed to  Force Closed when closeout request is approved with type as Termination by award owner
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:ProgressReport1}" inside table "---progressreport:-:grantorProgressReportsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63113  @validateSentBackTOSRPRStatusAfterCloseoutApproval  @mahadev
  Scenario Outline: Verify Progress report with Sent Back to SR User status changed to Force Closed when closeout request is approved with type as Termination by award owner
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport1"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Given I click on "Send Back to Subrecipient" in the page details
    And I refresh the page
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:ProgressReport1}" inside table "---progressreport:-:grantorProgressReportsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63114  @validateApprovedPRStatusAfterTerminationCloseoutApproval  @mahadev
  Scenario Outline: Verify Progress report with Approved status did not changed when closeout request is approved with type as Termination by award owner at SR user end overview Management Tab on Grant
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport1"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    Then I see value "Approved" for title "Status" against the value "{SavedValue:ProgressReport1}" inside table "---progressreport:-:grantorGrantProgressReportTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63115  @validateApprovedPRStatusAfterEarlyCompletionCloseoutApproval  @mahadev
  Scenario Outline: Verify Progress report with Approved status did not changed when closeout request is approved with type as Early completion by award owner at Award owner end user end overview Performance Tab on Subaward
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "ProgressReport1"
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:subawardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see value "Approved" for title "Status" against the value "{SavedValue:ProgressReport1}" inside table "---progressreport:-:grantorProgressReportsTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63116  @validateProgressBarWithForceClosedStatus  @mahadev
  Scenario Outline: Verify Progress bar is shown for the Progress report when Closeout request is approved at SR user end
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "---progressReport:-:recipientAwardProgressReportTableId---" without waiting for record
    Then I see status in Progress-bar is "Force Closed" and is "Red"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @63117  @validateFormsTableOnceCloseoutApproved  @mahadev
  Scenario Outline: Verify Progress report All Forms table under Forms and attachment should not be editable once closeout request is approved
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    When I perform quick search for "Force Closed" in "---progressReport:-:recipientAwardProgressReportTableId---" panel
    And I click on "View" icon for "Force Closed" inside flex table with id "---progressReport:-:recipientAwardProgressReportTableId---" without waiting for record
    When I navigate to "Forms and Attachments" sub tab
    Then I cannot see row level action button "Edit" against "Community Initiative Progress Report" in flex table with id "---progressReport:-:formTableId---"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62765 @62777 @62774 @VerifyYTDExpendituresFieldAfterPRSubmittedForReview  @keerti
  Scenario Outline: Verify Submitted for review report YTD Expenditures field remains the same on Progress report at Award Owner end when the Payment request type is Reimbursement with Approved Status.
  Verify Submitted to Grantor report YTD Expenditures field remains the same on Progress report at Award Owner end when the Payment request type is Reimbursement with Approved Status. | Verify YTD Expenditures field get updated on Progress report at SR user end when the Payment request type is Reimbursement with Approved Status.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Performance" sub tab
    When I save the field labeled "YTD Expenditures" as "YTDAmount"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see field "YTD Expenditures" as "$20.00"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:grantorGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see field "YTD Expenditures" inside page block
    Then I softly see field "YTD Expenditures" as "$20.00"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62778 @VerifyRemainingBudgetFieldAfterPRSubmittedForReview  @jitendra
  Scenario Outline: Verify Reviewed report Remaining Budget field is getting updated on Progress report at Award Owner user end when the Payment request type is Reimbursement with Approved Status.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Performance" sub tab
    When I save the field labeled "YTD Expenditures" as "YTDAmount"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:grantorGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see field "YTD Expenditures" as "$20.00"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62780 @62767 @VerifyYTDExpendituresFieldAfterPRApproved @keerti
  Scenario Outline: Verify Approved report YTD Expenditures field remains the same on Progress report at SR user end when the Payment request type is Reimbursement with Approved Status.
  Verify Remaining Budget field get updated on Progress report at SR user end when the Payment request type is Reimbursement with Approved Status.
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Performance" sub tab
    When I save the field labeled "YTD Expenditures" as "YTDAmount"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:grantorGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see field "YTD Expenditures" as "$20.00"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    And I save the field labeled "Remaining Budget" as "BudgetRemaining2"
    Then I softly see value "BudgetRemaining1" is "less than" the value "BudgetRemaining2"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62763 @validatePercentageOfBudgetFieldDecreased  @mahadev
  Scenario Outline: Verify Percentage of Budget Remaining field get decrease on Progress report at SR user end when the Payment request type is Reimbursement with Approved Status
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I navigate to "Performance" sub tab
    When I save the field labeled "Perentage of Budget Remaining" as "BudgetRemaining1"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    And I save the field labeled "Perentage of Budget Remaining" as "BudgetRemaining2"
    Then I see value "BudgetRemaining2" is "less than" the value "BudgetRemaining1"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62768  @validateAwardedBudgetFieldRemainsSame  @mahadev
  Scenario Outline: Verify Awarded Budget field remains the same on Progress report at SR user end when the Payment request type is Reimbursement with Approved Status
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I navigate to "Performance" sub tab
    When I save the field labeled "Awarded Budget" as "AwardedBudget"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see field "Awarded Budget" as "{SavedValue:AwardedBudget}"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62769 @62772 @validatePercentageOfBudgetAndRemainingBudgetFieldSameAfterAdvPRApproved   @mahadev
  Scenario Outline: Verify (Percentage of Budget Remaining | Remaining Budget) field remains the same on Progress report at SR user end when the Payment request type is Advance with Approved Status
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    And I save the field labeled "Remaining Budget" as "RemainingBudget"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see field "Perentage of Budget Remaining" as "100.00%"
    Then I see field "Remaining Budget" as "{savedValue:RemainingBudget}"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62773 @62770 @62915 @validateAwardedBudgetFieldSameAfterAdvPRApproved   @mahadev
  Scenario Outline: Verify (Remaining Budget field |Awarded Budget field | YTD Expenditures) remains the same on Progress report at SR user end when the Payment request type is Advance with Approved Status
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:recipientActiveGrantId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---progressReport:-:recipientActiveGrantId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:recipientGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see field "YTD Expenditures" as "$0.00"
    Then I softly see field "Awarded Budget" as "$1,000.00"
    Then I softly see field "Remaining Budget" as "$1,000.00"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62916 @62917 @validateAwardedBudgetFieldSameAfterAdvPRApproved   @mahadev
  Scenario Outline: Verify (Perentage of Budget Remaining | YTD Expenditures) fields gets updated on Progress report at award owner end
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 20                       | 10         | 10             |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:grantorGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see field "Perentage of Budget Remaining" as "98.00%"
    Then I softly see field "YTD Expenditures" as "$20.00"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @62918 @62919 @validateFieldSameAfterAdvPRApproved   @mahadev
  Scenario Outline: Verify (Remaining Budget |Awarded Budget ) fields remains the same on Progress report at award owner end when advance PR is approved
    And I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI" user
    And I delete the record "<Award Name>" from the object "Progress Report"
    And I delete the record "<Award Name>" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "<Award Name>" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I get the "EGMS ID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name          | Description                 |
      | Fiscal Approver | Automation FO | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:grantorGrantProgressReportTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I softly see field "Remaining Budget" as "$1,000.00"
    Then I softly see field "Awarded Budget" as "$1,000.00"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |