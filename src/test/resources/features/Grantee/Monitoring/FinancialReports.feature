@Monitoring @FinancialReports @grantee-regression @grantee-parallel-regression
Feature: Financial Reports related scenarios
  Test all scenarios related to Finantial Reports

  @71141 @ValidateToObserveAllColumnswithValuesOnFinancialReportListPage  @positive
  Scenario: verify to observe all columns with values on financial reports list page
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    Then I softly can see top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I save the field containing "EGMS Financial Report ID" as "EGMSFinRep"
    And I save the field containing "Budget Period" as "BudgetPeriod"
    And I save the field containing "Grant Award Number" as "GrantAwNo"
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    Then I softly see value "{SavedValue:EGMSFinRep}" for title "EGMS ID" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly see value "{SavedValue:GrantAwNo}" for title "Grant Award Number" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly see value "Asistencia medica" for title "Internal Organization" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly see value "{SavedValue:BudgetPeriod}" for title "Reporting Period" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly see value "Automation PM" for title "Assigned To" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly see value "Created" for title "Status" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"

  @71141 @ValidateAvailabilityOfViewButtonToAllInternalUsersAndDefaultFilterIsAll  @positive
  Scenario Outline: verify availability of View button to all internal users on list page and default filter is All
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    Then I softly see the text containing :
      | Financial Reports - All |
    When I re-login as "<userType>" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly cannot see row level action button "Delete" against "Created" in flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Examples:
      | userType |
      | EXE      |
      | Admin    |
      | PO       |
      | FD       |
      | FO       |

  @71141 @ValidateEditFunctionalityForFinancialReport  @positive
  Scenario: verify edit functionality for financial report
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "Edit" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    When I enter value "245" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I save the field containing "Report Due Date" as "ReportDueDate"
    And I refresh the page
    Then I softly see field "Report Due Date" as "{SavedValue:ReportDueDate}"

  @71141 @ValidateDeleteFunctionalityAndFilterListForFinancialReport   @positive
  Scenario: verify Delete functionality and filter list for financial report
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Financial Reports - All"
    Then I softly see the text containing :
      | Financial Reports - All |
    And I pause execution for "2" seconds
    And I click toggle button to select "Financial Reports - Draft"
    Then I softly see the text containing :
      | Financial Reports - Draft |
    And I pause execution for "2" seconds
    And I click toggle button to select "Financial Reports - Submitted"
    Then I softly see the text containing :
      | Financial Reports - Submitted |
    And I pause execution for "2" seconds
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "Delete" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnAwards}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"

  @70202 @ValidateToObserveThePendingTaskRecord   @positive
  Scenario: verify to Observe the pending task record
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Complete Financial Report for Award -{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Complete Financial Report for Award -{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Complete Financial Report" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    And I click on "Start" icon for "Complete Financial Report for Award -{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:PendingTask}"
    Then I softly see field "Award Title" as "{SavedValue:Automation Runtime Grant Award}"

  @70202 @ValidateHeaderSectionOnFinancialReportDetailsPage  @positive
  Scenario: verify header section on financial report details page
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I save the field containing "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly see field "Award Title" as "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Days Left" as "370"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail

  @70202 @ValidateEditableFieldsInOverviewSubTabAndHelpTextOnFinancialReportDetailsPage  @positive
  Scenario: verify editable fields on overview sub tab and help text on financial report details page
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I save the field containing "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "Edit" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly see fields "fieldReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "fieldReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "fieldReportDueDate__c" is in edit mode
    Then I softly see fields "fieldIsFinalReport__c" is in edit mode
    And I click on "Save" in the page details
    When I hovering mouse on help text icon inside page block detail "Report Due Date"
    Then I softly see "Date the report is due to the funding organization" shown as help text

  @70202 @ValidatefieldsThatAreCopiedFromAwardRecordOnFinancialReport  @positive
  Scenario: verify fields that are copied from award record on Financial report
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Internal Organization" as "InternalOrganization"
    And I save the field labeled "Amendment Number" as "AmendmentNumber"
    And I save the field labeled "EGMS Award Version Number" as "EGMSAwardVersionNumber"
    And I navigate to "Budget" sub tab
    And I save the field containing "Award to Date (Budget Period)" as "AwardtoDateBudgetPeriod"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Amendment Number" as "{SavedValue:AmendmentNumber}"
    Then I softly see field "Budget Period" as "{SavedValue:BudgetPeriod}"
    Then I softly see field "Internal Organization" as "{SavedValue:InternalOrganization}"

  @70533 @ValidateToObserveTheFormSection  @positive
  Scenario: verify to Observe the Form section
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I save the field containing "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I navigate to "Forms and Attachments" sub tab
    Then I softly see "Form Name" in flex table header "{prdoh_tableId:Forms}"
    Then I softly see "Form Number" in flex table header "{prdoh_tableId:Forms}"
    Then I softly see "Mandatory" in flex table header "{prdoh_tableId:Forms}"
    Then I softly see "Percentage" in flex table header "{prdoh_tableId:Forms}"
    Then I softly can see row level action button "Edit" against "16.67%" in flex table with id "{prdoh_tableId:Forms}"
    Then I softly can see row level action button "View" against "16.67%" in flex table with id "{prdoh_tableId:Forms}"
    Then I softly can see row level action button "Download Form" against "16.67%" in flex table with id "{prdoh_tableId:Forms}"

  @70533 @ValidateDownloadFormsFuntionality  @positive
  Scenario: verify download forms functionality
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I save the field containing "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I navigate to "Forms and Attachments" sub tab
    And I click on "Download Form" icon for "Federal Financial Report (SF-425)" inside flex table with id "{prdoh_tableId:Forms}"
    And I download the file
    Then I see "Federal Financial Report" on page "1" of "govgrants" pdf file

  @70533 @ValidateAvailabilityOfViewAndDownloadActionIconOnFormsForAllInternalUsers  @positive
  Scenario Outline: verify View and Download action icon should display for all internal users
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I save the field containing "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I navigate to "Forms and Attachments" sub tab
    Then I softly can see row level action button "View" against "16.67%" in flex table with id "{prdoh_tableId:Forms}"
    Then I softly can see row level action button "Download Form" against "16.67%" in flex table with id "{prdoh_tableId:Forms}"
    Examples:
      | userType |
      | EXE      |
      | Admin    |
      | PO       |
      | FD       |
      | FO       |

  @70533 @ValidateViewAndEditFunctionalityForForms  @positive
  Scenario: verify edit and view functionality for forms
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I save the field containing "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I navigate to "Forms and Attachments" sub tab
    And I click on "View" icon for "Federal Financial Report (SF-425)" inside flex table with id "{prdoh_tableId:Forms}"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    And I click on "Back" in the page details
    And I click on "Edit" icon for "Federal Financial Report (SF-425)" inside flex table with id "{prdoh_tableId:Forms}"
    When I enter value "US" into field "fieldCounty__c"
    And I click on "Save" in the page details
    Then I softly see field "County:" as "US"

  @70533 @ValidateUserCanAssociateAndDeleteNonKeyContactsOnOtherKeyContactsSection  @positive
  Scenario: verify user can associate and delete non key-contacts on other key contacts section
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    When I enter value "Automation PM" into field "fieldContact__c"
    When I enter value "Field Representative" into field "fieldRole__c"
    And I click modal button "Save"
    Then I softly see value "Field Representative" for title "Role" inside table "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    And I click on "Delete" icon for "Field Representative" inside flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    And I perform quick search for "Automation PM" in "{prdoh_tableId:OtherKeyContactsForFinancialReport}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"

  @70219 @ValidateUserCanAddMultipleAttachments  @positive
  Scenario: verify user can Add multiple attachments
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    When I navigate to "Forms and Attachments" sub tab
    Then I see the following top right buttons in table named "Attachments" :
      | Add |
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I pause execution for "3" seconds
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I pause execution for "3" seconds
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"
    Then I softly see row level action icon "Edit" against "Other" in Attachment and Notes Table
    Then I softly see row level action icon "Delete" against "Other" in Attachment and Notes Table

  @70220 @ValidateUserCanAddMultipleNotes  @positive
  Scenario: verify user can Add multiple notes
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    When I navigate to "Forms and Attachments" sub tab
    Then I see the following top right buttons in table named "Notes" :
      | Add |
    And I add notes records
    And I close modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Automation Notes"
    And I add notes records
    And I close modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Automation Notes"
    Then I softly see row level action icon "Edit" against "Automation PM" in Attachment and Notes Table
    Then I softly see row level action icon "Delete" against "Automation PM" in Attachment and Notes Table

  @70220 @ValidateEditAndDeleteFunctionalityForNotes @wip  @positive
  Scenario: verify edit and delete functionality for notes
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
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

  @70219 @ValidateEditAnddeleteFunctionalityForAttachments @wip  @positive
  Scenario: verify edit and delete functionality for attachments
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
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

  @70221 @validateEditAndUndoFunctionalityWhileAssignApprovers  @positive
  Scenario: verify edit and undo functionality while assign approvers
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    When I navigate to "Roles" sub tab
    Then I softly see "Responsibility" in flex table header "{prdoh_tableId:FinancialReportApprovers}"
    Then I softly see "Name" in flex table header "{prdoh_tableId:FinancialReportApprovers}"
    Then I softly see "Description" in flex table header "{prdoh_tableId:FinancialReportApprovers}"
    Then I softly can see row level action button "Edit" against "" in flex table with id "{prdoh_tableId:FinancialReportApprovers}"
    And I click on "Edit" icon for "Program Approver" inside flex table with id "{prdoh_tableId:FinancialReportApprovers}"
    Then I softly see fields "Responsibility__c" is in edit mode
    When I enter value "Fiscal Report" into field "Responsibility__c"
    And I click on "Undo" icon for "Program Approver" inside flex table with id "{prdoh_tableId:FinancialReportApprovers}"
    Then I softly can see row level action button "Edit" against "" in flex table with id "{prdoh_tableId:FinancialReportApprovers}"
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility   | Name          | Description                  |
      | Program Approver | Automation PM | Automation Approval required |
    Then I softly see value "Automation PM" for title "Name" inside table "{prdoh_tableId:FinancialReportApprovers}"

  @70230 @ValidateSubmittingAFinancialReportForApprovals  @positive
  Scenario: verify submitting a financial report for approvals
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"

  @70222 @ValidateTaskShouldGeneratedForAllApprovers  @positive
  Scenario: verify task should generated for all approvers
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I save the field containing "EGMS Financial Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Approve Financial Report" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Approve Financial Report for Award -{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login to "As a Grantee" app as "GRANTEE DD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Approve Financial Report" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Approve Financial Report for Award -{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Approve Financial Report" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Approve Financial Report for Award -{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @70225 @ValidateSubmittingFinancialReportToGrantor  @positive
  Scenario: verify submitting financial report to grantor
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I save the field containing "EGMS Financial Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE DD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Approved" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I navigate to "Overview" sub tab
    And I save the field containing "Date/Time Submitted to Grantor" as "DateSubmittedToGrantor"
    Then I softly see field "{SavedValue:DateSubmittedToGrantor}" contains todays date withTime
    Then I softly can see top right button "Revise Financial Report" in page detail
    Then I softly can see top right button "Record Grantor Decison" in page detail
    Then I softly see field "Status" as "Submitted to Grantor"

  @70222 @ValidateSendToOwnerApprovalDecision  @positive
  Scenario: verify send to owner approval decision
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:FinancialReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I save the field containing "EGMS Financial Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Revise Financial Report" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Revise Financial Report for -{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    And I save the value from row "1" for column name "Created Date" as "createddate" from flex table "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "{SavedValue:createddate}" contains todays date withTime
    When I click on "Start" icon for "Revise Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail

  @70222 @ValidateReassignApprovalDecision  @positive
  Scenario: verify Reassign approval decision
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I save the field containing "EGMS Financial Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I select radio button "Reassign" in the approval decision
    And I select user "Automation FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Approve Financial Report" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    And I save the value from row "1" for column name "Created Date" as "createddate" from flex table "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "{SavedValue:createddate}" contains todays date withTime
    Then I softly see value "Approve Financial Report for Award -{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"

  @70276 @ValidateRecordGrantorDecisionForFinancialReport  @positive
  Scenario: verify Record Grantor decision for Financial report
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I save the field containing "EGMS Financial Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE DD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Approved" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
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
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" against the value "Accepted" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"

  @70277 @ValidateReviseFinancialReport  @positive
  Scenario: verify revise Financial report
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I save the field containing "EGMS Financial Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE DD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Approved" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Revise Financial Report" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to revise the financial report?  The progress report will require an approval again after being revised." is displayed
    When I click modal button "Yes"
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Financial Reports - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"

  @70278 @ValidateEditFunctionalityForFinancialReportAfterRevise  @positive
  Scenario: verify edit functionality for Financial report after revise
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I save the field containing "EGMS Financial Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE DD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Approved" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Revise Financial Report" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see fields "fieldReportingPeriodStartDate__c" is in edit mode
    Then I softly see fields "fieldReportingPeriodEndDate__c" is in edit mode
    Then I softly see fields "fieldReportDueDate__c" is in edit mode
    When I enter value "245" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Partial" into field "fieldIsReportCompleted__c"
    And I click on "Save" in the page details
    Then I softly see field "Is the Financial Report Complete?" as "Partial"

  @70278 @ValidateUserCanAssociateAndDeleteNonKeyContactsAfterRevise  @positive
  Scenario: verify User can associate and delete Non Key-contacts after revise
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I save the field containing "EGMS Financial Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE DD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Approved" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Revise Financial Report" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    When I enter value "Automation PM" into field "fieldContact__c"
    When I enter value "Field Representative" into field "fieldRole__c"
    And I click modal button "Save"
    Then I softly see value "Field Representative" for title "Role" inside table "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    And I click on "Delete" icon for "Field Representative" inside flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"
    And I perform quick search for "Automation PM" in "{prdoh_tableId:OtherKeyContactsForFinancialReport}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:OtherKeyContactsForFinancialReport}"

  @70278 @ValidateUserIsAbleToSubmitTheFinancialReportForApprovalAfterRevise  @positive
  Scenario: verify user is able to submit the Financial report for approval after revise
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:AwardReportPreparerTableId}" by clicking "Edit" :
      | Financial Report Preparer | Financial Report Preparer |
      |                           | Automation PM             |
    And I refresh the page
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I save the field containing "EGMS Financial Report ID" as "egmsid"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE DD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Approved" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Revise Financial Report" in the page details
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE DD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Approve Financial Report" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Approve Financial Report" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Approved" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
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