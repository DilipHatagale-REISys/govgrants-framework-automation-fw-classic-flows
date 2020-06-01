@Monitoring @ProgressReports @grantee-regression @grantee-parallel-regression
Feature: Progress Reports related scenarios
  Test all scenarios related to Progress Reports

  @70801 @ValidateColumnsAndFiltersOnProgressReprtListPage  @positive
  Scenario: verify columns and filters on Progress Report list page
    When I login as "PM" user
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    Then I softly see the text containing :
      | Progress Reports - All |
    And I pause execution for "2" seconds
    And I click toggle button to select "Progress Reports - Draft"
    Then I softly see the text containing :
      | Progress Reports - Draft |
    And I pause execution for "2" seconds
    And I click toggle button to select "Progress Reports - Submitted"
    Then I softly see the text containing :
      | Progress Reports - Submitted |
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:ProgressReports}"
    Then I softly see "Grant Award Number" in flex table header "{prdoh_tableId:ProgressReports}"
    Then I softly see "Award Title" in flex table header "{prdoh_tableId:ProgressReports}"
    Then I softly see "Internal Organization " in flex table header "{prdoh_tableId:ProgressReports}"
    Then I softly see "Reporting Period" in flex table header "{prdoh_tableId:ProgressReports}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:ProgressReports}"
    Then I softly see "Assigned To" in flex table header "{prdoh_tableId:ProgressReports}"

  @70801 @ValidateColumnValuesAndActionsOnProgressReportListPage  @positive
  Scenario: verify column values and actions on progress report list page
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Quarterly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I save the field containing "Grant Award Number" as "GrantAwardNumber"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    Then I softly see value "{SavedValue:GrantAwardNumber}" for title "Grant Award Number" inside table "{prdoh_tableId:ProgressReports}"
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" inside table "{prdoh_tableId:ProgressReports}"
    Then I softly see value "Asistencia medica" for title "Internal Organization" inside table "{prdoh_tableId:ProgressReports}"
    Then I softly see value "Automation PM" for title "Assigned To" inside table "{prdoh_tableId:ProgressReports}"
    Then I softly see value "Created" for title "Status" inside table "{prdoh_tableId:ProgressReports}"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:ProgressReports}"

  @70801 @ValidateAvailabilityOfViewButtonOnProgressReprtListPageToAllInternalUsers  @positive
  Scenario Outline: verify availability of View button on progress report list page to all internal users
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "<userType>" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly cannot see row level action button "Delete" against "Created" in flex table with id "{prdoh_tableId:ProgressReports}"
    Examples:
      | userType |
      | EXE      |
      | Admin    |
      | PO       |
      | FD       |
      | FO       |

  @70801 @ValidateAdvanceSearchFunctionalityForProgressReportListPage   @positive
  Scenario: verify advance search functionality for progress report list page
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    When I click on advance filter "#advfGranteeProgressReports" of table id "{prdoh_tableId:ProgressReports}"
    When I enter advance filter values inside id "advfGranteeProgressReports"
      | Award Title | Starts with | {SavedValue:Automation Runtime Grant Award} |
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" inside table "{prdoh_tableId:ProgressReports}"
    And I refresh the page
    When I click on advance filter "#advfGranteeProgressReports" of table id "{prdoh_tableId:ProgressReports}"
    When I enter advance filter values inside id "advfGranteeProgressReports"
      | EGMS ID | Starts with | 9098 |
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:ProgressReports}"

  @70801 @ValidateEditAndDeleteFunctionalityForProgressReport  @positive
  Scenario: verify edit and delete functionality for progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly see fields "fieldReportDueDate__c" is in edit mode
    And I click on "Save" in the page details
    And I save the field containing "EGMS Progress Report ID" as "EgmsId"
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "Delete" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I navigate to "Management" sub tab
    And I perform quick search for "{SavedValue:EgmsId}" in "{prdoh_tableId:ProgressReportTableId}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:ProgressReportTableId}"

  @70802 @ValidateColumnsAndActionIconsOnProgressReportFromAward   @positive
  Scenario: verify columns and action icons on progress report from award
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I navigate to "Management" sub tab
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:ProgressReportTableId}"
    Then I softly see "Reporting Period" in flex table header "{prdoh_tableId:ProgressReportTableId}"
    Then I softly see "Report Due Date" in flex table header "{prdoh_tableId:ProgressReportTableId}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:ProgressReportTableId}"
    Then I softly see "Assigned To" in flex table header "{prdoh_tableId:ProgressReportTableId}"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "{prdoh_tableId:ProgressReportTableId}"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "{prdoh_tableId:ProgressReportTableId}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:ProgressReportTableId}"

  @70802 @ValidateAvailabilityOfViewButtonOnProgressReprtFromAwardToAllInternalUsers   @positive
  Scenario Outline: verify availability of View button on progress report from award to all internal users
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "<userType>" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:ProgressReportTableId}"
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "{prdoh_tableId:ProgressReportTableId}"
    Then I softly cannot see row level action button "Delete" against "Created" in flex table with id "{prdoh_tableId:ProgressReportTableId}"
    Examples:
      | userType |
      | EXE      |
      | Admin    |
      | PO       |
      | FD       |
      | FO       |

  @70802 @ValidateViewAndEditAndDeleteFunctionalityForProgressReportFromAward  @positive
  Scenario: verify edit and view and delete functionality for progress report from award
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:ProgressReportTableId}"
    Then I see the header is "Report" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    And I save the field containing "EGMS Progress Report ID" as "EgmsId"
    And I click on "Edit" in the page details
    Then I softly see fields "fieldReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "fieldReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "fieldReportDueDate__c" is in edit mode
    Then I softly can see top right button "Save" in page detail
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on "Delete" icon for "Created" inside flex table with id "{prdoh_tableId:ProgressReportTableId}"
    And I perform quick search for "{SavedValue:EgmsId}" in "{prdoh_tableId:ProgressReportTableId}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:ProgressReportTableId}"

  @70079 @validateTaskShouldCreatedForProgressReport @positive
  Scenario: verify task should created for progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:ProgressReportTableId}"
    And I save the field containing "EGMS Progress Report ID" as "EgmsId"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EgmsId}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Complete Progress Report" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Complete Progress Report for Award -{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "Complete Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    Then I see the header is "Report" in the page details
    Then I softly can see top right button "Edit" in page detail

  @70079 @ValidateUsercanAssociateAndDeleteNonKeyContactsOnProgressReport  @positive
  Scenario: verify User can associate and delete Non Key-contacts for progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I click on top right button "Associate" in flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    When I enter value "Automation PM" into field "fieldContact__c"
    When I enter value "Field Representative" into field "fieldRole__c"
    And I click modal button "Save"
    Then I softly see value "Field Representative" for title "Role" inside table "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    And I click on "Delete" icon for "Field Representative" inside flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    And I perform quick search for "Automation PM" in "{prdoh_tableId:OtherKeyContactsForFinancialReport}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"

  @70093 @ValidateUserCanAddMultipleAttachmentsOnProgressReport  @positive
  Scenario: verify user can add multiple attchments on progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Forms and Attachments" sub tab
    Then I see the following top right buttons in table named "Attachments" :
      | Add |
    When I click on "AddAttachments" button inside attachments page block
    Then I see "SF-PPR:Other" inside Type selectbox
    And I close modal by clicking the top right x button
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I pause execution for "3" seconds
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I pause execution for "3" seconds
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"
    Then I softly see row level action icon "Edit" against "Other" in Attachment and Notes Table
    Then I softly see row level action icon "Delete" against "Other" in Attachment and Notes Table

  @70093 @ValidateEditAnddeleteFunctionalityForAttachmentsOnProgressReport  @positive
  Scenario: verify edit and delete functionality for attachments on progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Forms and Attachments" sub tab
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I click on "Edit" icon for "Other" inside table
    And I pause execution for "2" seconds
    When I enter values "Edit Attachment" into textarea description field for Edit Attachment
    When I close modal by clicking the top right x button
    Then I softly see table with header "Attachments" contains records "Edit Attachment"
    When I click on "Delete" icon for "Other" inside table
    When I pause execution for "3" seconds
    Then I see confirmation box with body "Record deleted successfully." is displayed

  @70098 @ValidateUserCanAddMultipleNotesOnProgressReport   @positive
  Scenario: verify user can add multiple notes on progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Forms and Attachments" sub tab
    Then I see the following top right buttons in table named "Notes" :
      | Add |
    And I add notes records
    And I close modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Automation Notes"
    And I add notes records
    And I close modal by clicking the top right x button
    And I pause execution for "2" seconds
    Then I softly see table with header "Notes" contains records "Automation Notes"
    Then I softly see row level action icon "Edit" against "Automation PM" in Attachment and Notes Table
    Then I softly see row level action icon "Delete" against "Automation PM" in Attachment and Notes Table

  @70098 @ValidateEditAnddeleteFunctionalityForNotesOnProgressReport  @positive
  Scenario: verify edit and delete functionality for notes on progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Forms and Attachments" sub tab
    And I add notes records
    And I close modal by clicking the top right x button
    When I click on "Edit" icon for "Automation Notes" inside table
    When I enter values "Edit Notes" into textarea description field for Edit Attachment
    And I close modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Edit Notes"
    When I click on "Delete" icon for "Edit Notes" inside table
    When I pause execution for "3" seconds
    Then I see confirmation box with body "Record deleted successfully." is displayed

  @70079 @ValidateFieldsOnProgressReportThatAreCopiedFromAwardRecord  @positive
  Scenario: verify fields on progress report that are copied from award record
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Amendment Number" as "AmendmentNumber"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Funding Organization" as "fundingOrganization"
    And I save the field labeled "Internal Organization" as "internalOrganization"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly see field "Budget Period" as "{SavedValue:BudgetPeriod}"
    Then I softly see field "Internal Organization" as "{SavedValue:internalOrganization}"
    Then I softly see field "Funding Organization" as "{SavedValue:fundingOrganization}"
    Then I softly see field "EGMS Award ID" as "{SavedValue:EID}"
    Then I softly see field "Amendment Number" as "{SavedValue:AmendmentNumber}"

  @70088 @validateEditAndUndoFunctionalityWhileAssigningApproversForProgressReport   @positive
  Scenario: verify edit and undo functionality while assigning approvers for progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Roles" sub tab
    Then I softly see "Responsibility" in flex table header "{prdoh_tableId:FinancialReportApprovers}"
    Then I softly see "Name" in flex table header "{prdoh_tableId:FinancialReportApprovers}"
    Then I softly see "Description" in flex table header "{prdoh_tableId:FinancialReportApprovers}"
    Then I softly can see row level action button "Edit" against "" in flex table with id "{prdoh_tableId:FinancialReportApprovers}"
    And I click on "Edit" icon for "Program Approver" inside flex table with id "{prdoh_tableId:FinancialReportApprovers}"
    Then I softly see fields "Responsibility__c" is in edit mode
    When I enter value "Progress Report" into field "Responsibility__c"
    And I click on "Undo" icon for "Program Approver" inside flex table with id "{prdoh_tableId:FinancialReportApprovers}"
    Then I softly can see row level action button "Edit" against "" in flex table with id "{prdoh_tableId:FinancialReportApprovers}"
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility   | Name          | Description                  |
      | Program Approver | Automation PM | Automation Approval required |
    Then I softly see value "Automation PM" for title "Name" inside table "{prdoh_tableId:FinancialReportApprovers}"

  @70091 @ValidateSubmittingAProgressReportForApprovals  @positive
  Scenario: verify submitting a progress report for approvals
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I pause execution for "4" seconds
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    When I navigate to "Roles" sub tab
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Please add approvers to all roles. |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"

  @70090 @ValidateSendToOwnerApprovalDecisionForProgressReport   @positive
  Scenario: verify send to owner approval decision for progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I save the field containing "EGMS Progress Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    Then I softly see fields "fieldReportDueDate__c" is in edit mode
    And I click on "Save" in the page details
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Revise Progress Report" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    And I save the value from row "1" for column name "Created Date" as "createddate" from flex table "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "{SavedValue:createddate}" contains todays date withTime
    Then I softly see value "Revise Progress Report for -{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "Revise Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail

  @70090 @ValidateReassignApprovalDecisionForProgressReport   @positive
  Scenario: verify Reassign approval decision for progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I save the field containing "EGMS Progress Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I select radio button "Reassign" in the approval decision
    And I select user "Automation FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I pause execution for "2" seconds
    When I re-login as "FO" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Approve Progress Report" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    And I save the value from row "1" for column name "Created Date" as "createddate" from flex table "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "{SavedValue:createddate}" contains todays date withTime
    Then I softly see value "Approve Progress Report for Award -{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"

  @70129 @ValidateSubmittingProgressReportToGrantor   @positive
  Scenario: verify submitting progress report to grantor
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Progress Report" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I navigate to "Overview" sub tab
    And I save the field labeled "Date/Time Submitted to Grantor" as "DateSubmittedToGrantor"
    Then I softly see field "{SavedValue:DateSubmittedToGrantor}" contains todays date withTime
    Then I softly can see top right button "Revise Progress Report" in page detail
    Then I softly can see top right button "Record Grantor Decison" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Submitted to Grantor"

  @70164 @ValidatereviseProgressReport   @positive
  Scenario: verify revise progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I pause execution for "4" seconds
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Progress Report" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Revise Progress Report" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to revise the progress report?  The progress report will require an approval again after being revised." is displayed
    When I click modal button "Yes"
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" inside table "{prdoh_tableId:ProgressReports}"

  @70165 @ValidateEditFunctionalityForProgressReportAfterRevise   @positive
  Scenario: verify edit functionality for Progress report after revise
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Progress Report" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Revise Progress Report" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see fields "fieldReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "fieldReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "fieldReportDueDate__c" is in edit mode
    Then I softly can see top right button "Save" in page detail

  @70165 @ValidateUserCanAssociateAndDeleteNonKeyContactsAfterRevise  @positive
  Scenario: verify User can associate and delete Non Key-contacts after revise
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Progress Report" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Revise Progress Report" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    When I enter value "Automation PM" into field "fieldContact__c"
    When I enter value "Field Representative" into field "fieldRole__c"
    And I click modal button "Save"
    Then I softly see value "Field Representative" for title "Role" inside table "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    And I click on "Delete" icon for "Field Representative" inside flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    And I perform quick search for "Automation PM" in "{prdoh_tableId:OtherKeyContactsForFinancialReport}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"

  @70278 @ValidateUserIsAbleToSubmitTheProgressReportForApprovalAfterRevise   @positive
  Scenario: verify user is able to submit the progress report for approval after revise
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Progress Report" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Progress Reports - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Revise Progress Report" in the page details
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Progress Report" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly can see top right button "Revise Financial Report" in page detail
    Then I softly can see top right button "Record Grantor Decison" in page detail
    And I click on "Record Grantor Decison" in the page details
    When I enter value "Accepted" into field "fieldDecision__c"
    And I enter value "Accepted Decision" into field "fieldAdditionalDetails__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly see field "Status" as "Accepted"

  @70162 @ValidateRecordGrantorDecisionForProgressReport   @positive
  Scenario: verify Record Grantor decision for Progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Progress Report" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Record Grantor Decison" in the page details
    Then I softly see fields "fieldDecision__c" is in edit mode
    Then I softly see fields "fieldAdditionalDetails__c" is in edit mode
    When I enter value "Accepted" into field "fieldDecision__c"
    And I enter value "Accepted Decision" into field "fieldAdditionalDetails__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly see field "Status" as "Accepted"
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" against the value "Accepted" inside table "{prdoh_tableId:ProgressReports}"

  @70206 @validateMonitoringSchedulesAreCreatedAfterReportingRequirementIsSavedForActiveRecord   @positive
  Scenario: verify Monitoring schedules are created after Reporting requirement is saved for active record
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    When I "Approve" in the approval decision
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    And I select value inside table "{prdoh_tableId:ProgressReportsSchedule}" is "All"
    Then I see "12" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Bi-Monthly" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "6" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Quarterly" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "4" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "2" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Annually" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "1" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Not Applicable" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @70206 @ValidateEditFunctionalityForProgressReportsScheduleAndViewSchedulesSectionForActiveRecord   @positive
  Scenario: verify edit functionality for progress reports schedule and view Schedules section for active record
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    When I "Approve" in the approval decision
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I close modal by clicking the top right x button
    And I refresh the page
    Then I softly see value "Semi-Annually" for title "Frequency" inside table "{prdoh_tableId:AwardProgressReportSchedule}"
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Reporting Period Start Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Reporting Period End Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "User Notified" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Task Creation Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Due Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"

  @70012 @validateMonitoringSchedulesAreCreatedAfterReportingRequirementIsSavedForCreatedRecord   @positive
  Scenario: verify Monitoring schedules are created after Reporting requirement is saved for Created record
    And I create grants record:
      | grantTitle                     | grantNUmber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    And I select value inside table "{prdoh_tableId:ProgressReportsSchedule}" is "All"
    And I pause execution for "4" seconds
    Then I see "12" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Bi-Monthly" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "6" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Quarterly" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "4" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "2" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Annually" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "1" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Not Applicable" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @70012 @ValidateEditFunctionalityForProgressReportsScheduleAndViewSchedulesSectionForCreatedRecord   @positive
  Scenario: verify edit functionality for progress reports schedule and view Schedules section for Created record
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I pause execution for "4" seconds
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    Then I softly see value "Semi-Annually" for title "Frequency" inside table "{prdoh_tableId:AwardProgressReportSchedule}"
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Reporting Period Start Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Reporting Period End Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "User Notified" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Task Creation Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Due Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"

  @70209 @validateMonitoringSchedulesAreCreatedAfterReportingRequirementIsSavedForAmendedRecordThroughUI   @positive
  Scenario: verify Monitoring schedules are created after Reporting requirement is saved for Amended record through UI
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Internal" into field "fieldInitiatedBy__c"
    When I enter value "Key Personnel Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Record Grantor Decision" in the page details
    When I enter value "Accepted" into field "fieldDecision__c"
    When I enter value "RDSUBAccNumber-01" into field "fieldNOASubAccountNumber__c"
    When I enter value "RD-01" into field "fieldNOADocumentID__c"
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "Automation check with record decision as accepted" into field "fieldAdditionalDetails__c"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    And I click modal button "Save"
    And I click modal button "Save"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    And I select value inside table "{prdoh_tableId:ProgressReportsSchedule}" is "All"
    And I pause execution for "4" seconds
    Then I see "12" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Bi-Monthly" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "6" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Quarterly" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "4" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "2" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Annually" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "1" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Not Applicable" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @70209 @ValidateEditFunctionalityForProgressReportsScheduleAndViewSchedulesSectionForAmendedRecordThroughUI   @positive
  Scenario: verify edit functionality for progress reports schedule and view Schedules section for Amended Record Through UI
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Internal" into field "fieldInitiatedBy__c"
    When I enter value "Key Personnel Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Record Grantor Decision" in the page details
    When I enter value "Accepted" into field "fieldDecision__c"
    When I enter value "RDSUBAccNumber-01" into field "fieldNOASubAccountNumber__c"
    When I enter value "RD-01" into field "fieldNOADocumentID__c"
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "Automation check with record decision as accepted" into field "fieldAdditionalDetails__c"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    And I click modal button "Save"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I pause execution for "4" seconds
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    Then I softly see value "Semi-Annually" for title "Frequency" inside table "{prdoh_tableId:AwardProgressReportSchedule}"
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Reporting Period Start Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Reporting Period End Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "User Notified" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Task Creation Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Due Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"

  @80273 @validateMonitoringSchedulesAreCreatedAfterReportingRequirementIsSavedForAmendedRecordThroughPeopleSoft   @positive
  Scenario: verify Monitoring schedules are created after Reporting requirement is saved for Amended record through People soft
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    Then I softly see field "Status" as "Active"
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType      | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 19AUTON     | Amendment | {SavedValue:fainNumber} | Budget Redirection | 0           | 365       | 0           | 365       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    And I select value inside table "{prdoh_tableId:ProgressReportsSchedule}" is "All"
    And I pause execution for "4" seconds
    Then I see "12" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Bi-Monthly" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "6" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Quarterly" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "4" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "2" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Annually" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see "1" records inside flex table id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "3" seconds
    When I enter value "Not Applicable" into field "fieldFrequency__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @80273 @ValidateEditFunctionalityForProgressReportsScheduleAndViewSchedulesSectionForAmendedRecordThroughPeopleSoft   @positive
  Scenario: verify edit functionality for progress reports schedule and view Schedules section for Amended Record Through people soft
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    Then I softly see field "Status" as "Active"
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType      | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 19AUTON     | Amendment | {SavedValue:fainNumber} | Budget Redirection | 0           | 365       | 0           | 365       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I pause execution for "4" seconds
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    Then I softly see value "Semi-Annually" for title "Frequency" inside table "{prdoh_tableId:AwardProgressReportSchedule}"
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Reporting Period Start Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Reporting Period End Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "User Notified" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Task Creation Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Due Date" in flex table header "{prdoh_tableId:ProgressReportsSchedule}"

  @70083 @ValidateAssociatedKPIsOnAwardAreGettingCopiedToProgressReport @wip @BugLoggedWith80292   @positive
  Scenario Outline: verify Associated KPIs on award are getting copied to Progress report for all internal users
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "888" into field "fieldAgency__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:EID}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "KPID"
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:KPID}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:KPID}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "Goals1"
    And I click "Associate" after selection of "Automation Objective" in the table "popupflextable"
    And I close modal by clicking the top right x button
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Performance" sub tab
    And I softly see the text containing :
      | Key Performance Indicators (KPI) |
      | Objectives                       |
    Then I softly cannot see top right button "Associate" in flex table with id "{prdoh_tableId:KPIOnProgressReport}"
    Then I softly can see row level action button "Edit" against "" in flex table with id "{prdoh_tableId:KPIOnProgressReport}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:KPIOnProgressReport}"
    Then I softly cannot see row level action button "Delete" against "" in flex table with id "{prdoh_tableId:KPIOnProgressReport}"
    When I re-login with "<userType>" user
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Performance" sub tab
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "{prdoh_tableId:KPIOnProgressReport}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:KPIOnProgressReport}"
    Then I softly cannot see row level action button "Delete" against "Created" in flex table with id "{prdoh_tableId:KPIOnProgressReport}"
    Examples:
      | userType |
      | EXE      |
      | Admin    |
      | PO       |
      | FD       |
      | FO       |

  @70083 @ValidateAddedDataForReportedValueFieldInKPISectionAreGettingCopiedToLatestAward   @positive
  Scenario: verify added data for Reported Value field in KPI section are getting copied to latest award
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "888" into field "fieldAgency__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "Goals1"
    And I click "Associate" after selection of "Automation Objective" in the table "popupflextable"
    And I close modal by clicking the top right x button
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:KPIOnProgressReport}" by clicking "Edit" :
      | KPI Name                            | Reported Value | Reported Date |
      | {SavedValue:Automation Runtime KPI} | 20000          | 0             |
    Then I softly see value "20,000.00" for title "Reported Value" inside table "{prdoh_tableId:KPIOnProgressReport}"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    And I "Approve" in the approval decision
    And I pause execution for "4" seconds
    And I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Progress Report" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:Automation Runtime KPI}" for title "KPI Title" inside table "{prdoh_tableId:KeyPerformanceIndicatorTableId}"
    Then I softly see value "20,000.00" for title "Current Value" inside table "{prdoh_tableId:KeyPerformanceIndicatorTableId}"

  @70083 @ValidateAssociatedObjectivesOnAwardAreGettingCopiedToProgressReport @BugLoggedWith80292   @positive
  Scenario Outline: verify Associated Objectives on award are getting copied to Progress report
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "888" into field "fieldAgency__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "Goals1"
    And I click "Associate" after selection of "Automation Objective" in the table "popupflextable"
    And I close modal by clicking the top right x button
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I pause execution for "2" seconds
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Performance" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "{prdoh_tableId:ObjectivesFromProgressReport}"
    Then I softly can see row level action button "Edit" against "" in flex table with id "{prdoh_tableId:ObjectivesFromProgressReport}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:ObjectivesFromProgressReport}"
    Then I softly cannot see row level action button "Delete" against "" in flex table with id "{prdoh_tableId:ObjectivesFromProgressReport}"
    When I re-login as "<userType>" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Performance" sub tab
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "{prdoh_tableId:ObjectivesFromProgressReport}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:ObjectivesFromProgressReport}"
    Then I softly cannot see row level action button "Delete" against "Created" in flex table with id "{prdoh_tableId:ObjectivesFromProgressReport}"
    Examples:
      | userType |
      | EXE      |
      | Admin    |
      | PO       |
      | FD       |
      | FO       |

  @70083 @ValidateAddedDataForReportedValueFieldInObjectiveSectionAreGettingCopiedToLatestAward   @positive
  Scenario: verify added data for Reported Value field in KPI section are getting copied to latest award
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "888" into field "fieldAgency__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "Goals1"
    And I click "Associate" after selection of "Automation Objective" in the table "popupflextable"
    And I close modal by clicking the top right x button
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Semi-Annually" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
    And I pause execution for "2" seconds
    And I click on "Submit For Approval" in the page details
    When I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:ObjectivesFromProgressReport}" by clicking "Edit" :
      | Objective            | Reported Value | Reported Date |
      | Automation Objective | Ongoing        | 0             |
    Then I softly see value "Ongoing" for title "Reported Value" inside table "{prdoh_tableId:ObjectivesFromProgressReport}"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    And I "Approve" in the approval decision
    And I pause execution for "4" seconds
    And I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Progress Report" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Progress Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Monitoring" sub tab
    Then I softly see value "Ongoing" for title "Current Value" inside table "{prdoh_tableId:ObjectiveTableId}"

  @70206 @ValidateEditableFieldsForReportingRequirementsScreenForActiveRecord    @positive
  Scenario: verify Edit functionality for Reporting Requirements screen for Active record
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Frequency is Required to save.                     |
      | Schedule Base is Required to save.                 |
      | # of Days for Task Completion is Required to save. |
    And I pause execution for "2" seconds
    Then I softly see fields "fieldTitle__c" is in edit mode
    Then I softly see fields "fieldCalReportingStartDate__c" is in edit mode
    Then I softly see fields "fieldCalReportingEndDate__c" is in edit mode
    Then I softly see fields "fieldAgreement1__c" is in edit mode
    Then I softly see fields "fieldTaskAvailability__c" is in edit mode
    Then I softly see fields "fieldFrequency__c" is in edit mode
    Then I softly see fields "fieldScheduleBase__c" is in edit mode
    Then I softly see fields "fieldDueDateDays__c" is in edit mode
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
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
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I softly see the text containing :
      | Progress Reports Schedule |
      | Progress Reports          |
      | Financial Reports         |
    Then I softly see "Report Title" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Report Type" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Frequency" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Reporting Period" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Grant Award}" in flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Grant Award}" in flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Are you sure you want to edit the reporting requirement? The reporting schedule will be changed immediately upon saving. |
    And I close modal by clicking the top right x button

  @70206 @ValidateSchedulesShouldBeCreatedAccordingToStartDateAndEndDateOfCalendarAndReportingPeriodForActiveStatus   @positive
  Scenario: verify Schedules should be created according to Start date and End date of Calendar and Reporting Period for Active status
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    Then I softly see field "Status" as "Active"
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I save the field containing "Schedule Base" as "ScheduleBase"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Reporting Period End Date with Schedule Base "{SavedValue:ScheduleBase}" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    And I click modal button "Save"
    And I save the field containing "Schedule Base" as "ScheduleBase"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Reporting Period End Date with Schedule Base "{SavedValue:ScheduleBase}" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @70206 @ValidateTaskCreationDateAndDueDateShouldBePopulatedAccordingToNumberOfDaysAndUserNotifiedFieldForActiveStatus  @positive
  Scenario: verify task creation date and Due date should be populated according to number of days and User Notified field for active status
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I save the field containing "Lead Time (in Days) for Task Creation" as "TaskCreation"
    And I save the field containing "# of Days for Task Completion" as "TaskCompletion"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Task Creation Date with "{SavedValue:TaskCreation}" and Task Completion Date with "{SavedValue:TaskCompletion}" inside flex table "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Cross" symbol in flex table with id "{prdoh_tableId:ProgressReportsSchedule}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Progress Report Preparer | Progress Report Preparer |
      |                          | Automation PM            |
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
    Then I softly see field "Status" as "Active"
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see "check" symbol in flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @70012 @ValidateEditableFieldsOnReportingRequirementScreenForCreatedRecord    @positive
  Scenario: verify editable fields on Reporting Requirement screen for Created record
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I softly see the text containing :
      | Progress Reports Schedule |
      | Progress Reports          |
      | Financial Reports         |
    Then I softly see "Report Title" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Report Type" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Frequency" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Reporting Period" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Grant Award}" in flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Grant Award}" in flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Frequency is Required to save.                     |
      | Schedule Base is Required to save.                 |
      | # of Days for Task Completion is Required to save. |
    And I pause execution for "2" seconds
    Then I softly see fields "fieldTitle__c" is in edit mode
    Then I softly see fields "fieldCalReportingStartDate__c" is in edit mode
    Then I softly see fields "fieldCalReportingEndDate__c" is in edit mode
    Then I softly see fields "fieldAgreement1__c" is in edit mode
    Then I softly see fields "fieldTaskAvailability__c" is in edit mode
    Then I softly see fields "fieldFrequency__c" is in edit mode
    Then I softly see fields "fieldScheduleBase__c" is in edit mode
    Then I softly see fields "fieldDueDateDays__c" is in edit mode
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly see value "Monthly" for title "Frequency" inside table "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Are you sure you want to edit the reporting requirement? The reporting schedule will be changed immediately upon saving. |

  @70012 @ValidateTaskCreationDateAndDueDateShouldBePopulatedAccordingToNumberOfDaysAndUserNotifiedFieldForCreatedStatus   @positive
  Scenario: verify task creation date and Due date should be populated according to number of days and User Notified field for Created status
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I save the field containing "Lead Time (in Days) for Task Creation" as "TaskCreation"
    And I save the field containing "# of Days for Task Completion" as "TaskCompletion"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Task Creation Date with "{SavedValue:TaskCreation}" and Task Completion Date with "{SavedValue:TaskCompletion}" inside flex table "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Cross" symbol in flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @70012 @ValidateSchedulesShouldBeCreatedAccordingToStartDateAndEndDateOfCalendarAndReportingPeriodForCreatedStatus @positive
  Scenario: verify Schedules should be created according to Start date and End date of Calendar and Reporting Period for Created status
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I see field "fieldTaskAvailability__c" with prepopulated value as "30"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I save the field containing "Schedule Base" as "ScheduleBase"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Reporting Period End Date with Schedule Base "{SavedValue:ScheduleBase}" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    And I click modal button "Save"
    And I save the field containing "Schedule Base" as "ScheduleBase"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Reporting Period End Date with Schedule Base "{SavedValue:ScheduleBase}" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @70209 @ValidateEditableFieldsOnReportingRequirementScreenForAmendedRecordThroughUI    @positive
  Scenario: verify editable fields on Reporting Requirement screen for Amended record through UI
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Internal" into field "fieldInitiatedBy__c"
    When I enter value "Key Personnel Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Record Grantor Decision" in the page details
    When I enter value "Accepted" into field "fieldDecision__c"
    When I enter value "RDSUBAccNumber-01" into field "fieldNOASubAccountNumber__c"
    When I enter value "RD-01" into field "fieldNOADocumentID__c"
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "Automation check with record decision as accepted" into field "fieldAdditionalDetails__c"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    And I click modal button "Save"
    And I click modal button "Save"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    And I navigate to "Management" sub tab
    And I softly see the text containing :
      | Progress Reports Schedule |
      | Progress Reports          |
      | Financial Reports         |
    Then I softly see "Report Title" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Report Type" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Frequency" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Reporting Period" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Grant Award}" in flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Grant Award}" in flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Frequency is Required to save.                     |
      | Schedule Base is Required to save.                 |
      | # of Days for Task Completion is Required to save. |
    And I pause execution for "2" seconds
    Then I softly see fields "fieldTitle__c" is in edit mode
    Then I softly see fields "fieldCalReportingStartDate__c" is in edit mode
    Then I softly see fields "fieldCalReportingEndDate__c" is in edit mode
    Then I softly see fields "fieldAgreement1__c" is in edit mode
    Then I softly see fields "fieldTaskAvailability__c" is in edit mode
    Then I softly see fields "fieldFrequency__c" is in edit mode
    Then I softly see fields "fieldScheduleBase__c" is in edit mode
    Then I softly see fields "fieldDueDateDays__c" is in edit mode
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I pause execution for "2" seconds
    Then I softly see value "Monthly" for title "Frequency" inside table "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Are you sure you want to edit the reporting requirement? The reporting schedule will be changed immediately upon saving. |
    And I close modal by clicking the top right x button

  @70209 @ValidateTaskCreationDateAndDueDateShouldBePopulatedAccordingToNumberOfDaysAndUserNotifiedFieldForAmendedRecordThroughUI   @positive
  Scenario: verify task creation date and Due date should be populated according to number of days and User Notified field for Amended record through UI
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Internal" into field "fieldInitiatedBy__c"
    When I enter value "Key Personnel Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Record Grantor Decision" in the page details
    When I enter value "Accepted" into field "fieldDecision__c"
    When I enter value "RDSUBAccNumber-01" into field "fieldNOASubAccountNumber__c"
    When I enter value "RD-01" into field "fieldNOADocumentID__c"
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "Automation check with record decision as accepted" into field "fieldAdditionalDetails__c"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    And I click modal button "Save"
    And I click modal button "Save"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I save the field containing "Lead Time (in Days) for Task Creation" as "TaskCreation"
    And I save the field containing "# of Days for Task Completion" as "TaskCompletion"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Task Creation Date with "{SavedValue:TaskCreation}" and Task Completion Date with "{SavedValue:TaskCompletion}" inside flex table "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Cross" symbol in flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @70209 @ValidateSchedulesShouldBeCreatedAccordingToStartDateAndEndDateOfCalendarAndReportingPeriodForAmendedRecordThroughUI   @positive
  Scenario: verify Schedules should be created according to Start date and End date of Calendar and Reporting Period for Amended record through UI
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Internal" into field "fieldInitiatedBy__c"
    When I enter value "Key Personnel Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    When I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Record Grantor Decision" in the page details
    When I enter value "Accepted" into field "fieldDecision__c"
    When I enter value "RDSUBAccNumber-01" into field "fieldNOASubAccountNumber__c"
    When I enter value "RD-01" into field "fieldNOADocumentID__c"
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "Automation check with record decision as accepted" into field "fieldAdditionalDetails__c"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    And I click modal button "Save"
    And I click modal button "Save"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I see field "fieldTaskAvailability__c" with prepopulated value as "30"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I save the field containing "Schedule Base" as "ScheduleBase"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Reporting Period End Date with Schedule Base "{SavedValue:ScheduleBase}" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    And I click modal button "Save"
    And I save the field containing "Schedule Base" as "ScheduleBase"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Reporting Period End Date with Schedule Base "{SavedValue:ScheduleBase}" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @80273 @ValidateEditableFieldsOnReportingRequirementScreenForAmendedRecordThroughPeopleSoft   @positive
  Scenario: verify editable fields on Reporting Requirement screen for Amended record through People soft
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    Then I softly see field "Status" as "Active"
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType      | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 19AUTON     | Amendment | {SavedValue:fainNumber} | Budget Redirection | 0           | 365       | 0           | 365       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I softly see the text containing :
      | Progress Reports Schedule |
      | Progress Reports          |
      | Financial Reports         |
    Then I softly see "Report Title" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Report Type" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Frequency" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly see "Reporting Period" in flex table header "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Grant Award}" in flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Grant Award}" in flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Frequency is Required to save.                     |
      | Schedule Base is Required to save.                 |
      | # of Days for Task Completion is Required to save. |
    And I pause execution for "2" seconds
    Then I softly see fields "fieldTitle__c" is in edit mode
    Then I softly see fields "fieldCalReportingStartDate__c" is in edit mode
    Then I softly see fields "fieldCalReportingEndDate__c" is in edit mode
    Then I softly see fields "fieldAgreement1__c" is in edit mode
    Then I softly see fields "fieldTaskAvailability__c" is in edit mode
    Then I softly see fields "fieldFrequency__c" is in edit mode
    Then I softly see fields "fieldScheduleBase__c" is in edit mode
    Then I softly see fields "fieldDueDateDays__c" is in edit mode
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly see value "Monthly" for title "Frequency" inside table "{prdoh_tableId:AwardProgressReportSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Are you sure you want to edit the reporting requirement? The reporting schedule will be changed immediately upon saving. |
    And I close modal by clicking the top right x button

  @80273 @ValidateSchedulesShouldBeCreatedAccordingToStartDateAndEndDateOfCalendarAndReportingPeriodForAmendedRecordThroughPeopleSoft  @positive
  Scenario: verify Schedules should be created according to Start date and End date of Calendar and Reporting Period for Amended Record through PeopleSoft
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    Then I softly see field "Status" as "Active"
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType      | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 19AUTON     | Amendment | {SavedValue:fainNumber} | Budget Redirection | 0           | 365       | 0           | 365       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    Then I see field "fieldTaskAvailability__c" with prepopulated value as "30"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I save the field containing "Schedule Base" as "ScheduleBase"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Reporting Period End Date with Schedule Base "{SavedValue:ScheduleBase}" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    And I click modal button "Save"
    And I save the field containing "Schedule Base" as "ScheduleBase"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Reporting Period End Date with Schedule Base "{SavedValue:ScheduleBase}" inside flex table with id "{prdoh_tableId:ProgressReportsSchedule}"

  @80273 @ValidateTaskCreationDateAndDueDateShouldBePopulatedAccordingToNumberOfDaysAndUserNotifiedFieldForAmendedRecordThroughPeopleSoft   @positive
  Scenario: verify task creation date and Due date should be populated according to number of days and User Notified field for Amended record through RecordPeopleSoft
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 365       | -365        | 0         |
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
    Then I softly see field "Status" as "Active"
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType      | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 19AUTON     | Amendment | {SavedValue:fainNumber} | Budget Redirection | 0           | 365       | 0           | 365       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Monthly" into field "fieldFrequency__c"
    When I enter value "Reporting Period" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I save the field containing "Lead Time (in Days) for Task Creation" as "TaskCreation"
    And I save the field containing "# of Days for Task Completion" as "TaskCompletion"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I refresh the page
    When I expand nested table containing column value "{SavedValue:Automation Runtime Grant Award}"
    Then I see Task Creation Date with "{SavedValue:TaskCreation}" and Task Completion Date with "{SavedValue:TaskCompletion}" inside flex table "{prdoh_tableId:ProgressReportsSchedule}"
    Then I softly see "Cross" symbol in flex table with id "{prdoh_tableId:ProgressReportsSchedule}"