@AwardDrawdown @regression @GrantsAwardsModule @parallel-regression
Feature: Award draw down related scenarios
  Test all scenarios related to Award draw down scenarios

  @77444 @verifyColumnOfDrawdownDetailsTable @smoke  @positive
  Scenario: Verify user is able to see expected column of draw down details table
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Actuals" sub tab
    Then I softly see "Class Field" in flex table header "{prdoh_tableId:DrawdownTableId}"
    Then I softly see "Revenue Account" in flex table header "{prdoh_tableId:DrawdownTableId}"
    Then I softly see "Fund Code" in flex table header "{prdoh_tableId:DrawdownTableId}"
    Then I softly see "Fiscal Year" in flex table header "{prdoh_tableId:DrawdownTableId}"
    Then I softly see "Journal ID" in flex table header "{prdoh_tableId:DrawdownTableId}"
    Then I softly see "Deposit ID" in flex table header "{prdoh_tableId:DrawdownTableId}"
    Then I softly see "Amount" in flex table header "{prdoh_tableId:DrawdownTableId}"
    Then I softly see "Accounting Date" in flex table header "{prdoh_tableId:DrawdownTableId}"

  @77444 @verifyColumnValuesOfDrawdownTable @smoke   @positive
  Scenario: Verify user is able to see columns values of draw down table
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I create drawdowns:
      | awardId                  | fainNumber              | code | stateBudgetCategory | amount  |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 10F  | E1110               | 5000.00 |
    And I execute batch file:
      | operationType | batchName | recordName |
      | Batch         | Drawdowns | null       |
    And I re-login as "PM" user on "default" portal
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Actuals" sub tab
    #And I perform quick search for "{SavedValue:codeNumber}" in "---prdoh_tableId:-:DrawdownTableId---" panel
    Then I softly see value "{SavedValue:codeNumber}" for title "Class Field" inside table "{prdoh_tableId:DrawdownTableId}"
    Then I softly see value "{SavedValue:statusBudgetCategory}" for title "Revenue Account" inside table "{prdoh_tableId:DrawdownTableId}"
    Then I softly see value "{SavedValue:amountValue}" for title "Amount" inside table "{prdoh_tableId:DrawdownTableId}"

  @77444 @verifyAmountTotalForDropdownTable   @positive
  Scenario: Verify user is able to see correct total amount for dropdown
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I create drawdowns:
      | awardId                  | fainNumber              | code | stateBudgetCategory | amount  |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 10F  | E1110               | 5000.00 |
    And I create drawdowns:
      | awardId                  | fainNumber              | code | stateBudgetCategory | amount   |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 10F  | E1110               | 10000.00 |
    And I execute batch file:
      | operationType | batchName | recordName |
      | Batch         | Drawdowns | null       |
    And I re-login as "PM" user on "default" portal
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Actuals" sub tab
    Then I see total sum for "Amount" column at table "{prdoh_tableId:DrawdownTableId}"

  @77444 @verifyDrawdownDetailsForTwoDifferentAwardHavingSameBudgetPeriod   @positive
  Scenario: Verify user is able to see same draw down details for two different award with same budget period
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I create drawdowns:
      | awardId                  | fainNumber              | code | stateBudgetCategory | amount   |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 10F  | E1110               | 10000.00 |
    And I execute batch file:
      | operationType | batchName | recordName |
      | Batch         | Drawdowns | null       |
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
    And I re-login as "PM" user on "default" portal
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:GrantsAwardsRevisionTableId}"
    And I click on "Edit" in the page details
    When I enter value "No" into field "fieldIsNOGAAttachedPicklist__c"
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "Washington" into field "fieldPlace_of_Performance__c"
    And I click on "Save" in the page details
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description       |
      | Program Approver | Automation Admin | Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "PEOPLESOFTAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PEOPLESOFTAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PEOPLESOFTAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I create drawdowns:
      | awardId                  | fainNumber              | code | stateBudgetCategory | amount  |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 05F  | E1110               | 2000.00 |
    And I execute batch file:
      | operationType | batchName | recordName |
      | Batch         | Drawdowns | null       |
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Amended" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Amended" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Actuals" sub tab
    And I save the value from row "1" for column name "Amount" as "AmendedDrawdownAmount" from flex table "{prdoh_tableId:DrawdownTableId}"
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Actuals" sub tab
    Then I softly see value "{SavedValue:AmendedDrawdownAmount}" for title "Amount" inside table "{prdoh_tableId:DrawdownTableId}"

  @77445 @verifyDrawdownDetailsOnFinancialTabForTwoDifferentAward   @positive
  Scenario: Verify user is able to see two different grant drawdown with different budget period
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
    Then I save the field labeled "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I create drawdowns:
      | awardId                  | fainNumber              | code | stateBudgetCategory | amount   |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 10F  | E1110               | 10000.00 |
    And I execute batch file:
      | operationType | batchName | recordName |
      | Batch         | Drawdowns | null       |
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 20AUTON     | Amendment | {SavedValue:fainNumber} | Continuation  | 0           | 730       | 380         | 730       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    And I re-login as "PM" user on "default" portal
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "{prdoh_tableId:GrantsAwardsRevisionTableId}"
    And I click on "Edit" in the page details
    When I enter value "No" into field "fieldIsNOGAAttachedPicklist__c"
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "Washington" into field "fieldPlace_of_Performance__c"
    And I click on "Save" in the page details
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description       |
      | Program Approver | Automation Admin | Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "PEOPLESOFTCONTINATIONAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PEOPLESOFTCONTINATIONAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PEOPLESOFTCONTINATIONAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I create drawdowns:
      | awardId                  | fainNumber              | code | stateBudgetCategory | amount  |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 05F  | E1110               | 2000.00 |
    And I execute batch file:
      | operationType | batchName | recordName |
      | Batch         | Drawdowns | null       |
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Financials" sub tab
    Then I softly see "Award Title" in flex table header "{prdoh_tableId:GrantDrawDownTableId}"
    Then I softly see "Budget Period" in flex table header "{prdoh_tableId:GrantDrawDownTableId}"
    Then I softly see "Budget Period Start Date" in flex table header "{prdoh_tableId:GrantDrawDownTableId}"
    Then I softly see "Budget Period End Date" in flex table header "{prdoh_tableId:GrantDrawDownTableId}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:GrantDrawDownTableId}"