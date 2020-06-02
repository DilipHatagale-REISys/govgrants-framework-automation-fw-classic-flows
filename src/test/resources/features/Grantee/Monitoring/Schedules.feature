@Monitoring @Schedules @grantee-regression @grantee-parallel-regression
Feature: Schedules related scenarios
  Test all scenarios related to Schedules

  @70215 @ValidateListPageFilterOptionsAndObserveColumns  @positive
  Scenario: verify list page filter options and observe columns
    When I login as "PM" user
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:SchedulesLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Scheduled Activities - All"
    Then I softly see the text containing :
      | Scheduled Activities - All |
    And I pause execution for "2" seconds
    And I click toggle button to select "Scheduled Activities - Next 30 Days"
    Then I softly see the text containing :
      | Scheduled Activities - Next 30 Days |
    And I pause execution for "2" seconds
    And I click toggle button to select "Scheduled Activities - Next 90 Days"
    Then I softly see the text containing :
      | Scheduled Activities - Next 90 Days |
    And I pause execution for "2" seconds
    And I click toggle button to select "Scheduled Activities - Next 180 Days"
    Then I softly see the text containing :
      | Scheduled Activities - Next 180 Days |
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:ScheduledListPage}"
    Then I softly see "Grant Award Number" in flex table header "{prdoh_tableId:ScheduledListPage}"
    Then I softly see "Award Title" in flex table header "{prdoh_tableId:ScheduledListPage}"
    Then I softly see "Type" in flex table header "{prdoh_tableId:ScheduledListPage}"
    Then I softly see "Task Created" in flex table header "{prdoh_tableId:ScheduledListPage}"
    Then I softly see "Due Date" in flex table header "{prdoh_tableId:ScheduledListPage}"
    Then I softly see "Assigned To" in flex table header "{prdoh_tableId:ScheduledListPage}"

  @70215 @ValidateViewFunctionalityForSchedules @positive
  Scenario: verify view functionality for schedules
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | 0           | 730       | 0           | 365       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Overview" sub tab
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "No" into field "fieldIsNOGAAttachedPicklist__c"
    When I enter value "Washington" into field "fieldPlace_of_Performance__c"
    And I click on "Save" in the page details
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:AwardRelatedApplicationTableId---"
    When I enter value "No" into field "fieldAwardrelatedapplication__c"
    And I click modal button "Save"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I save the field containing "EGMS ID" as "egmsid"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I save the field labeled "Reporting Period Start Date" as "ReportingPeriodStartDate"
    And I close modal by clicking the top right x button
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:SchedulesLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Scheduled Activities - All"
    And I pause execution for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ScheduledListPage}" panel
    Then I can see row level action button "View" against "Ramu Loke" in flex table with id "{prdoh_tableId:ScheduledListPage}"
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ScheduledListPage}"
    Then I softly see field "Award Title" as "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see field "Report Type" as "Progress Report"
    Then I softly see field "Report Title" as "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see field "EGMS Award ID" as "{SavedValue:egmsid}"