@Closeout @ProjectPeriodCloseout @grantee-regression @grantee-parallel-regression
Feature: Project Period Closeout related scenarios
  Test all scenarios related to project period closeout

  @71933 @VerifyCreatingScheduledProjectPeriodCloseoutRequest @smoke   @positive
  Scenario: Verify if scheduled project period closeout is created.
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
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
    Then I softly see value "No" for title "Is a Budget Period Closeout Required?" inside table "{prdoh_tableId:GrantsLevelDetailsTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | GrantClose | null       |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "Status" as "Active"
    And I navigate to "Awards" sub tab
    Then I softly see "Pending Closeout" value in flex table id "{prdoh_tableId:GrantsAwardsRevisionTableId}"
    And I navigate to "Closeout" sub tab
    Then I softly see "Scheduled" value in flex table id "{prdoh_tableId:GrantsProjectPeriodCloseoutTableId}"
    Then I softly see "Created" value in flex table id "{prdoh_tableId:GrantsProjectPeriodCloseoutTableId}"
    When I click on "View" icon for "Created" inside table with table id "{prdoh_tableId:GrantsProjectPeriodCloseoutTableId}" without processing
    And I save the field labeled "Closeout EGMS ID" as "PPCloseoutEgmsId"
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PPCloseoutEgmsId}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Complete Project Period Closeout" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Complete Project Period Closeout For {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    And I click on "Start" icon for "Complete Project Period Closeout" inside flex table with id "{prdoh_tableId:PendingTask}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Closeout Type" as "Scheduled"
    And I click "{SavedValue:GrantEGMSID}" lookup link
    And I navigate to "Closeout" sub tab
    When I click on "Edit" icon for "{SavedValue:PPCloseoutEgmsId}" inside table with table id "{prdoh_tableId:GrantsProjectPeriodCloseoutTableId}" without processing
    And I enter value "Project Period Closeout Reason Edited By Automation" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Reason" as "Project Period Closeout Reason Edited By Automation"
    And I click "{SavedValue:GrantEGMSID}" lookup link
    And I navigate to "Closeout" sub tab
    When I click on "Delete" icon for "{SavedValue:PPCloseoutEgmsId}" inside table with table id "{prdoh_tableId:GrantsProjectPeriodCloseoutTableId}" without processing
    Then I see confirmation box with body "Are you sure you want to permanently delete the project period closeout?" is displayed
    When I click modal button "Yes"
    Then I softly do not see value "{SavedValue:BPCloseoutEgmsId}" for title "EGMS ID" inside table "{prdoh_tableId:GrantsProjectPeriodCloseoutTableId}"

  @71697 @VerifyStatusOfAwarddWithDifferentBudgetPeriodsAfterCreatingProjectPeriodCloseoutRequest  @positive
  Scenario: Verify the status of the award of two different budget periods while creating the project period closeout request
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    Then I softly see value "No" for title "Is a Budget Period Closeout Required?" inside table "{prdoh_tableId:GrantsLevelDetailsTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                  |
      | Program Approver | Automation PM | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 20AUTON     | Amendment | {SavedValue:fainNumber} | Continuation  | -730        | -10       | -320        | -10       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I click on "Edit" icon for "Created" inside flex table with id "{prdoh_tableId:GrantsAwardsRevisionTableId}"
    When I enter value "No" into field "fieldIsNOGAAttachedPicklist__c"
    When I enter value "1" into field "fieldAwardIssueDate__c"
    When I enter value "Washington" into field "fieldPlace_of_Performance__c"
    And I click on "Save" in the page details
    Then I softly see value "No" for title "Is this award related to an application in the EGMS?" inside table "{prdoh_tableId:AwardRelatedApplicationTableId}"
    Then I softly see value "No" for title "Is a Budget Period Closeout Required?" inside table "{prdoh_tableId:GrantsLevelDetailsTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description       |
      | Program Approver | Automation PM | Approval required |
    And I click on "Submit For Approval" in the page details
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | GrantClose | null       |
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "Status" as "Active"
    And I navigate to "Closeout" sub tab
    Then I softly see "Created" value in flex table id "{prdoh_tableId:GrantsProjectPeriodCloseoutTableId}"
    And I navigate to "Awards" sub tab
    Then I see value "Pending Closeout" for title "Status" against the value "NA" inside table "{prdoh_tableId:GrantsAwardsRevisionTableId}"
    Then I see value "Pending Closeout" for title "Status" against the value "Continuation" inside table "{prdoh_tableId:GrantsAwardsRevisionTableId}"

  @71929 @VerifyInitiateCloseoutButtonForManualProjectPeriodCloseoutShouldBeDisplayedToPIuserWhenPPEndateIsNotExpired
  Scenario: Verify PI User can see the Initiate closeout button at project period closeout request page block inside closeout sub tab on Active Grant
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | 50        | -730        | -365      |
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
    Then I softly see value "No" for title "Is a Budget Period Closeout Required?" inside table "{prdoh_tableId:GrantsLevelDetailsTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "Status" as "Active"
    And I navigate to "Closeout" sub tab
    Then I softly can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"

  @71933 @VerifyCloseoutSubtabForProjectPeriodCloseoutNotAvailableForActiveGrant
  Scenario: Verify PI user should not see the closeout subtab for active grant when Is a Budget Period Closeout Required is set to Yes
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    And I enter value "Yes" into field "fieldBudgetCloseoutrequestRequired__c"
    And I click modal button "Save"
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
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "Status" as "Active"
    Then I softly cannot see "Closeout" sub tab at view detail page

  @71933 @VerifyCloseoutSubtabForProjectPeriodCloseoutNotAvailableForDraftGrant  @positive
  Scenario:Verify Project period closeout request should not be created for the grant when there is an award which is in Created State
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    And I enter value "No" into field "fieldBudgetCloseoutrequestRequired__c"
    And I click modal button "Save"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly cannot see "Closeout" sub tab at view detail page

  @71929 @VerifyCreatingManualProjectPeriodCloseoutAsPIuserOnActiveGrant  @positive
  Scenario: Verify PI User can create manual project period closeout from project period closeout request page block inside closeout sub tab on Active Grant
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    Then I softly see value "No" for title "Is a Budget Period Closeout Required?" inside table "{prdoh_tableId:GrantsLevelDetailsTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "Status" as "Active"
    Then I save the field labeled "EGMS ID" as "GRANTID"
    And I navigate to "Closeout" sub tab
    Then I softly can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Status" as "Created"
    And I save the field containing "Closeout EGMS ID" as "PPCloseoutEgmsId"
    Then I softly see field "Closeout Type" as "Early Completion"
    Then I softly see field "Reason" as "Reason for the Project Period Closeout Request"
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PPCloseoutEgmsId}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Complete Project Period Closeout" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Complete Project Period Closeout For {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    And I click on "Start" icon for "{SavedValue:PPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I click "{SavedValue:GRANTID}" lookup link
    Then I softly cannot see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Closeout" inside flex table with id "{prdoh_tableId:GrantsAwardsRevisionTableId}"
    And I navigate to "Management" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---prdoh_tableId:-:FinancialsReportTableId---"
    And I navigate to "Amendments" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---prdoh_tableId:-:AmendmentRequestTableId---"


  @71929 @VerifyFieldsOnCreateModeForProjectPeriodCloseoutAsPIuser  @positive
  Scenario: Verify fields available on project period closeout in editable
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    Then I softly see value "No" for title "Is a Budget Period Closeout Required?" inside table "{prdoh_tableId:GrantsLevelDetailsTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "Status" as "Active"
    Then I save the field labeled "EGMS ID" as "AwardID"
    Then I save the field labeled "Grant Number" as "CloseoutGrantNumber"
    Then I save the field labeled "Project Period" as "CloseoutProjectPeriod"
    Then I save the field labeled "Grant Title" as "CloseoutGrantTitle"
    And I navigate to "Closeout" sub tab
    Then I softly can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see fields "fieldReason__c" is in edit mode
    Then I softly see fields "fieldDueDate__c" is in edit mode
    Then I softly see fields "fieldCloseoutDate__c" is in edit mode
    Then I softly can see top right button "Save and Continue" in page detail
    Then I softly see field "Grant Number" as "{SavedValue:CloseoutGrantNumber}"
    Then I softly see field "Project Period" as "{SavedValue:CloseoutProjectPeriod}"
    Then I softly see field "Grant Title" as "{SavedValue:CloseoutGrantTitle}"
    And I clear the value from field "fieldDueDate__c"
    And I clear the value from field "fieldCloseoutDate__c"
    And I click on "Save and Continue" in the page details
    Then I softly see the following messages in the page details :
      | Closeout Type is Required to save.           |
      | Reason is Required to save.                  |
      | Closeout Effective Date is Required to save. |
      | Closeout Due Date is Required to save.       |

  @71929 @VerifyInitiateCloseoutButtonForManualProjectPeriodCloseoutShouldtBeDisplayedToPIuserWhenProjectPeriodEndDateIsCurrentDate  @positive
  Scenario: Verify if PI user can see the Initiate closeout button at project period closeout request page block inside closeout sub tab on Active Grant
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | 0         | -730        | 365       |
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
    Then I softly see value "No" for title "Is a Budget Period Closeout Required?" inside table "{prdoh_tableId:GrantsLevelDetailsTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "Status" as "Active"
    And I navigate to "Closeout" sub tab
    Then I softly can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"

  @71698 @VerifyPagelevelbuttonsAvailabiltiyOnProjecttPeriodCloseoutRequestDetailPageAsPIUser @BugID80995 @smoke  @positive
  Scenario: Verify availability of page level buttons on Project Period closeout Request
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    Then I softly see value "No" for title "Is a Budget Period Closeout Required?" inside table "{prdoh_tableId:GrantsLevelDetailsTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "Status" as "Active"
    Then I save the field labeled "EGMS ID" as "GRANTID"
    Then I save the field labeled "Grant Title" as "CloseoutGrantTitle"
    Then I save the field labeled "Internal Organization" as "AwardInternalOrganizationName"
    Then I save the field labeled "Funding Organization" as "AwardFundingOrganizationName"
    And I navigate to "Financials" sub tab
    Then I save the field labeled "Awarded to Date" as "GrantAwardedToDateAmount"
    Then I save the field labeled "Expenditures to Date" as "GrantExpenditureAmount"
    And I navigate to "Closeout" sub tab
    Then I softly can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "PPCloseoutEgmsId"
    Then I softly see field "Status" as "Created"
    And I softly see the text containing :
      | Grant Overview           |
      | Closeout Request Details |
    Then I softly can see top right button "Override Open Items" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly see field "Grant Title" as "{SavedValue:CloseoutGrantTitle}"
    Then I softly see field "Grant EGMS ID" as "{SaVedValue:GRANTID}"
    Then I softly see field "Internal Organization" as "{SavedValue:AwardInternalOrganizationName}"
    Then I softly see field "Funding Organization" as "{SavedValue:AwardFundingOrganizationName}"
    Then I softly see field "Expenditures (Project Period)" as "{SavedValue:GrantExpenditureAmount}"
    Then I softly see field "Awarded to Date (Project Period)" as "{SavedValue:GrantAwardedToDateAmount}"
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:ProjectPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Project Period Closeouts - Draft"
    And I perform quick search for "{SavedValue:PPCloseoutEgmsId}" in "{prdoh_tableId:ProjectPeriodCloseout}" panel
    Then I softly see "Created" value in flex table id "{prdoh_tableId:ProjectPeriodCloseout}"

  @71698 @VerifyFieldsAreEditableWhileEditingTheProjectPeriodCloseoutDetailPage @BugID80998  @positive
  Scenario: Verify the fields available edit and view mode for project period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    Then I softly see value "No" for title "Is a Budget Period Closeout Required?" inside table "{prdoh_tableId:GrantsLevelDetailsTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "Status" as "Active"
    Then I save the field labeled "Grant Number" as "CloseoutGrantNumber"
    Then I save the field labeled "Project Period" as "CloseoutProjectPeriod"
    And I navigate to "Closeout" sub tab
    Then I softly can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "PPCloseoutEgmsId"
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:ProjectPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "{SavedValue:PPCloseoutEgmsId}" in "{prdoh_tableId:ProjectPeriodCloseoutListTableId}" panel
    And I click on "Edit" icon for "{SavedValue:PPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:ProjectPeriodCloseoutListTableId}"
    Then I softly see field "Grant Number" as "{SavedValue:CloseoutGrantNumber}"
    Then I softly see field "Project Period" as "{SavedValue:CloseoutProjectPeriod}"
    Then I softly see field "Closeout Type" as "Early Completion"
    Then I softly see fields "fieldReason__c" is in edit mode
    Then I softly see fields "fieldDueDate__c" is in edit mode
    Then I softly see fields "fieldCloseoutDate__c" is in edit mode
    Then I softly see field "Grantor Closeout Date" as ""
    Then I softly see field "Date/Time Submitted to Grantor" as ""
    And I navigate to "Checklist" sub tab
    Then I softly see fields "fieldReviewExpenditures__c" is in edit mode
    Then I softly see fields "fieldEnsurejournalentriescompleted__c" is in edit mode
    Then I softly see fields "fieldIdentifyAllOutstandingInvoices__c" is in edit mode
    Then I softly see fields "fieldIdentifyOutstandinginvoices__c" is in edit mode
    Then I softly see fields "fieldPayrollExpenses__c" is in edit mode
    Then I softly see fields "fieldConfirmIndirectExpensesHaveBeenPost__c" is in edit mode
    Then I softly see fields "fieldReviewedPurchaseOrdersIfClosedCopy__c" is in edit mode
    Then I softly see fields "fieldReviewAndUpdatePersonnelAllocations__c" is in edit mode
    Then I softly see fields "fieldEnsureCostSharingcommitmentsmet__c" is in edit mode
    Then I softly see fields "fieldFinalFFRforAllFunds__c" is in edit mode
    Then I softly see fields "fieldIsThereAnUnspentBalance__c" is in edit mode
    Then I softly see fields "fieldAdvancePayments__c" is in edit mode
    Then I softly see fields "fieldAllFinancialReportingRequirements__c" is in edit mode
    Then I softly see fields "fieldEnsureCostSharingCommitmentsAreMet__c" is in edit mode
    Then I softly see fields "fieldPleaseExplainUnspentBalance__c" is in edit mode
    Then I softly see fields "fieldHaveTheRealPropertyStatus__c" is in edit mode
    Then I softly see fields "fieldHastheTangiblePersonalProperty__c" is in edit mode
    Then I softly see fields "fieldHaveAllFederalAndStateMBEWBE__c" is in edit mode
    Then I softly see fields "fieldOtherReportsRequiredbyTheFederalAward__c" is in edit mode
    Then I softly see fields "fieldHastheLobbyingandLitigationCertification__c" is in edit mode
    Then I softly see fields "fieldConfirmAllAuditConcernsMonitoring__c" is in edit mode
    Then I softly see fields "fieldHaveAllFederalMonitoringFindings__c" is in edit mode
    Then I softly see fields "fieldHaveAllApplicableFederalGrant__c" is in edit mode

  @71698 @VerifyEditAndSavefunctionalityForProjectPeriodCloseoutOverviewTabDetailPage  @positive
  Scenario: Verify PI user can edit and save the values for project period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    And I enter value "No" into field "fieldBudgetCloseoutrequestRequired__c"
    And I click modal button "Save"
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
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    Then I softly can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I clear the value from field "fieldDueDate__c"
    And I clear the value from field "fieldCloseoutDate__c"
    And I enter value "0" into field "fieldDueDate__c"
    And I enter value "0" into field "fieldCloseoutDate__c"
    And I enter value "Reason Edited By Automation" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Reason" as "Reason Edited By Automation"
    Then I softly see field "Days Left" as "0"
    When I hovering mouse on help text icon inside page block detail "Closeout Effective Date"
    And I pause execution for "2" seconds
    Then I softly see "Date from which the closeout is effective." shown as help text
    When I hovering mouse on help text icon inside page block detail "Days Left"
    And I pause execution for "2" seconds
    Then I softly see "Days remaining until the closeout is due" shown as help text

  @79984 @VerifyPIuserCanEditandSaveTheFieldsAvailableInCheckListSubTabForProjectPeriodCloseoutRequest @smoke  @positive
  Scenario: Verify checklist fields for project period closeout saved successfully
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    And I enter value "No" into field "fieldBudgetCloseoutrequestRequired__c"
    And I click modal button "Save"
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
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    Then I softly can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
    And I softly see the text containing :
      | Expenses                                   |
      | Personnel                                  |
      | Finance                                    |
      | Other Reports                              |
      | Property                                   |
      | Monitoring                                 |
      | Overall                                    |
      | Link to Federal Post-Award Reporting Forms |
    When I enter value "Yes" into field "fieldReviewExpenditures__c"
    When I enter value "Yes" into field "fieldEnsurejournalentriescompleted__c"
    When I enter value "Yes" into field "fieldIdentifyAllOutstandingInvoices__c"
    When I enter value "Yes" into field "fieldIdentifyOutstandinginvoices__c"
    When I enter value "Yes" into field "fieldPayrollExpenses__c"
    When I enter value "Yes" into field "fieldConfirmIndirectExpensesHaveBeenPost__c"
    When I enter value "Yes" into field "fieldReviewedPurchaseOrdersIfClosedCopy__c"
    When I enter value "Yes" into field "fieldReviewAndUpdatePersonnelAllocations__c"
    When I enter value "Yes" into field "fieldEnsureCostSharingcommitmentsmet__c"
    When I enter value "Yes" into field "fieldFinalFFRforAllFunds__c"
    When I enter value "Yes" into field "fieldIsThereAnUnspentBalance__c"
    When I enter value "Yes" into field "fieldAdvancePayments__c"
    When I enter value "Yes" into field "fieldAllFinancialReportingRequirements__c"
    When I enter value "Yes" into field "fieldEnsureCostSharingCommitmentsAreMet__c"
    When I enter value "Automation Test Run" into field "fieldPleaseExplainUnspentBalance__c"
    When I enter value "Yes" into field "fieldHaveTheRealPropertyStatus__c"
    When I enter value "Yes" into field "fieldHastheTangiblePersonalProperty__c"
    When I enter value "Yes" into field "fieldHaveAllFederalAndStateMBEWBE__c"
    When I enter value "Yes" into field "fieldOtherReportsRequiredbyTheFederalAward__c"
    When I enter value "Yes" into field "fieldHastheLobbyingandLitigationCertification__c"
    When I enter value "Yes" into field "fieldConfirmAllAuditConcernsMonitoring__c"
    When I enter value "Yes" into field "fieldHaveAllFederalMonitoringFindings__c"
    When I enter value "Yes" into field "fieldHaveAllApplicableFederalGrant__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Have all expenditures been reviewed for allowability?" as "Yes"
    Then I softly see field "Have all journal entries been completed and processed?" as "Yes"
    Then I softly see field "Have all outstanding payment requests (subrecipient or contractor) been received?" as "Yes"
    Then I softly see field "Have all payments (subrecipient or contractor) been issued?" as "Yes"
    Then I softly see field "Have all payroll charges been reconciled and adjusting journal entries posted?" as "Yes"
    Then I softly see field "Have all indirect expenses been posted to the award?" as "Yes"
    Then I softly see field "Have all purchase orders been reviewed to determine if they need to be liquidated or closed?" as "Yes"
    Then I softly see field "Have all personnel assigned to this award been moved to a new funding source?" as "Yes"
    Then I softly see field "Has the match requirement been met?" as "Yes"
    Then I softly see field "Does the FFR account for all funds awarded in the applicable reporting period (budget period or project period)?" as "Yes"
    Then I softly see field "Is there an unspent balance remaining on this award?" as "Yes"
    Then I softly see field "Has a refund been processed for any balance of unobligated cash that the federal agency paid in advance or paid and that are not authorized to be retained for use in other projects?" as "Yes"
    Then I softly see field "Have all financial reporting requirements been met?" as "Yes"
    Then I softly see field "If the match requirement was met with third party funds, is sufficient documentation attached?" as "Yes"
    Then I softly see field "Please explain unspent balance" as "Automation Test Run"
    Then I softly see field "Have the Real Property Status Report (SF-429 and related attachments) been filed?" as "Yes"
    Then I softly see field "Has the Tangible Personal Property Report (SF-428 and related forms) been filed?" as "Yes"
    Then I softly see field "Have all federal and state Minority Business Enterprise/Women's Business Enterprise (MBE/WBE) reporting requirements been met?" as "Yes"
    Then I softly see field "Have all other reports required in the terms and conditions of the award been filed with the awarding agency?" as "Yes"
    Then I softly see field "Have we received the Lobbying and Litigation Certifications (Standard Form LLL) from all contractors (at all tiers) with contracts in excess of $100,000?" as "Yes"
    Then I softly see field "Have all audit findings and concerns been addressed, if required?" as "Yes"
    Then I softly see field "Have all federal monitoring findings and concerns been addressed, if required?" as "Yes"
    Then I softly see field "Have all applicable federal grant requirements been met?" as "Yes"

  @71681 @ValidateEditAndUndoFunctionalityWhileAssignApproversForProjectPeriodCloseout  @positive
  Scenario: verify edit and undo functionality while assign approvers for project period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Roles" sub tab
    Then I softly see "Role" in flex table header "{prdoh_tableId:CloseoutApproversTable}"
    Then I softly see "Name" in flex table header "{prdoh_tableId:CloseoutApproversTable}"
    Then I softly see "Description" in flex table header "{prdoh_tableId:CloseoutApproversTable}"
    Then I softly can see row level action button "Edit" against "" in flex table with id "{prdoh_tableId:CloseoutApproversTable}"
    And I click on "Edit" icon for "Program Approver" inside flex table with id "{prdoh_tableId:CloseoutApproversTable}"
    Then I softly see fields "Responsibility__c" is in edit mode
    When I enter value "Assign Approver" into field "Responsibility__c"
    When I enter value "Automation PM" into field "Name__c"
    And I click on "Undo" icon for "Program Approver" inside flex table with id "{prdoh_tableId:CloseoutApproversTable}"
    Then I softly can see row level action button "Edit" against "" in flex table with id "{prdoh_tableId:CloseoutApproversTable}"
    And I edit the following rows inline in flex table with id "{prdoh_tableId:CloseoutApproversTable}" by clicking "Edit" :
      | Role             | Name          | Description                  |
      | Program Approver | Automation PM | Automation Approval required |
    Then I softly see value "Automation PM" for title "Name" inside table "{prdoh_tableId:CloseoutApproversTable}"

  @71681 @ValidateRefreshFunctionalityWhileAssignApproversForProjectPeriodCloseout   @positive
  Scenario: verify refresh functionality while Assign Approvers for Project Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Roles" sub tab
    When I click on parallel lines menu bar with data target value "#GrantorCloseoutRequestRolesAndResponsibilitiesFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Approvers"
    Then I see table is refreshing

  @71682 @ValidateRequiredFieldsOnSubmittingAProjectPeriodCloseoutRequestForApproval   @positive
  Scenario: verify required fields on Submitting a Project Period Closeout request for approval
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Roles" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details :
      | Roles tab: Please assign a Program Approver                                                                                                                                                                                  |
      | Roles Tab: Please assign a Executive Approver.                                                                                                                                                                               |
      | Checklist Tab: Has a refund been processed for any balance of unobligated cash that the federal agency paid in advance or paid and that are not authorized to be retained for use in other projects? field value is required |
      | Checklist Tab: Have all purchase orders been reviewed to determine if they need to be liquidated or closed? field value is required                                                                                          |
      | Checklist Tab: Have all federal and state Minority Business Enterprise/Women's Business Enterprise (MBE/WBE) reporting requirements been met? field value is required.                                                       |
      | Checklist Tab: Have we received the Lobbying and Litigation Certifications (Standard Form LLL) from all contractors (at all tiers) with contracts in excess of $100000? field value is required.                             |
      | Checklist Tab: Have all other reports required in the terms and conditions of the award been filed with the awarding agency? field value is required.                                                                        |
      | Checklist Tab: Have all applicable federal grant requirements been met? field value is required.                                                                                                                             |
      | Please fill all the required fields in Check List tab before you Submit for Approval.                                                                                                                                        |

  @71682 @ValidateSubmittingProjectPeriodCloseoutRequestForApprovals @smoke  @positive
  Scenario: verify submitting Project Period Closeout Request for approvals
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
    When I enter value "No" into field "fieldReviewExpenditures__c"
    When I enter value "No" into field "fieldIdentifyAllOutstandingInvoices__c"
    When I enter value "No" into field "fieldPayrollExpenses__c"
    When I enter value "No" into field "fieldReviewedPurchaseOrdersIfClosedCopy__c"
    When I enter value "No" into field "fieldEnsurejournalentriescompleted__c"
    When I enter value "No" into field "fieldIdentifyOutstandinginvoices__c"
    When I enter value "No" into field "fieldConfirmIndirectExpensesHaveBeenPost__c"
    When I enter value "No" into field "fieldReviewAndUpdatePersonnelAllocations__c"
    When I enter value "No" into field "fieldEnsureCostSharingcommitmentsmet__c"
    When I enter value "No" into field "fieldFinalFFRforAllFunds__c"
    When I enter value "No" into field "fieldIsThereAnUnspentBalance__c"
    When I enter value "No" into field "fieldAdvancePayments__c"
    When I enter value "No" into field "fieldAllFinancialReportingRequirements__c"
    When I enter value "No" into field "fieldEnsureCostSharingCommitmentsAreMet__c"
    When I enter value "unspent balance" into field "fieldPleaseExplainUnspentBalance__c"
    When I enter value "No" into field "fieldHaveTheRealPropertyStatus__c"
    When I enter value "No" into field "fieldHastheTangiblePersonalProperty__c"
    When I enter value "No" into field "fieldHaveAllFederalAndStateMBEWBE__c"
    When I enter value "No" into field "fieldOtherReportsRequiredbyTheFederalAward__c"
    When I enter value "No" into field "fieldHastheLobbyingandLitigationCertification__c"
    When I enter value "No" into field "fieldConfirmAllAuditConcernsMonitoring__c"
    When I enter value "No" into field "fieldHaveAllFederalMonitoringFindings__c"
    When I enter value "No" into field "fieldHaveAllApplicableFederalGrant__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:CloseoutApproversTable}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"

  @71685 @ValidateSendToOwnerApprovalDecisionForProjectPeriodCloseout @smoke  @positive
  Scenario: verify send to owner approval decision for projrct period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "2" seconds
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
    When I enter value "No" into field "fieldReviewExpenditures__c"
    When I enter value "No" into field "fieldIdentifyAllOutstandingInvoices__c"
    When I enter value "No" into field "fieldPayrollExpenses__c"
    When I enter value "No" into field "fieldReviewedPurchaseOrdersIfClosedCopy__c"
    When I enter value "No" into field "fieldEnsurejournalentriescompleted__c"
    When I enter value "No" into field "fieldIdentifyOutstandinginvoices__c"
    When I enter value "No" into field "fieldConfirmIndirectExpensesHaveBeenPost__c"
    When I enter value "No" into field "fieldReviewAndUpdatePersonnelAllocations__c"
    When I enter value "No" into field "fieldEnsureCostSharingcommitmentsmet__c"
    When I enter value "No" into field "fieldFinalFFRforAllFunds__c"
    When I enter value "No" into field "fieldIsThereAnUnspentBalance__c"
    When I enter value "No" into field "fieldAdvancePayments__c"
    When I enter value "No" into field "fieldAllFinancialReportingRequirements__c"
    When I enter value "No" into field "fieldEnsureCostSharingCommitmentsAreMet__c"
    When I enter value "unspent balance" into field "fieldPleaseExplainUnspentBalance__c"
    When I enter value "No" into field "fieldHaveTheRealPropertyStatus__c"
    When I enter value "No" into field "fieldHastheTangiblePersonalProperty__c"
    When I enter value "No" into field "fieldHaveAllFederalAndStateMBEWBE__c"
    When I enter value "No" into field "fieldOtherReportsRequiredbyTheFederalAward__c"
    When I enter value "No" into field "fieldHastheLobbyingandLitigationCertification__c"
    When I enter value "No" into field "fieldConfirmAllAuditConcernsMonitoring__c"
    When I enter value "No" into field "fieldHaveAllFederalMonitoringFindings__c"
    When I enter value "No" into field "fieldHaveAllApplicableFederalGrant__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "egmsid"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:CloseoutApproversTable}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Revise Project Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Project Period Closeout Request for Grant{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "Revise Project Period Closeout Request" inside flex table with id "{prdoh_tableId:PendingTask}"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
    When I enter value "No" into field "fieldReviewExpenditures__c"
    When I enter value "No" into field "fieldIdentifyAllOutstandingInvoices__c"
    When I enter value "No" into field "fieldPayrollExpenses__c"
    When I enter value "No" into field "fieldReviewedPurchaseOrdersIfClosedCopy__c"
    When I enter value "No" into field "fieldEnsurejournalentriescompleted__c"
    When I enter value "No" into field "fieldIdentifyOutstandinginvoices__c"
    When I enter value "No" into field "fieldConfirmIndirectExpensesHaveBeenPost__c"
    When I enter value "No" into field "fieldReviewAndUpdatePersonnelAllocations__c"
    When I enter value "No" into field "fieldEnsureCostSharingcommitmentsmet__c"
    When I enter value "No" into field "fieldFinalFFRforAllFunds__c"
    When I enter value "No" into field "fieldIsThereAnUnspentBalance__c"
    When I enter value "No" into field "fieldAdvancePayments__c"
    When I enter value "No" into field "fieldAllFinancialReportingRequirements__c"
    When I enter value "No" into field "fieldEnsureCostSharingCommitmentsAreMet__c"
    When I enter value "unspent balance" into field "fieldPleaseExplainUnspentBalance__c"
    When I enter value "No" into field "fieldHaveTheRealPropertyStatus__c"
    When I enter value "No" into field "fieldHastheTangiblePersonalProperty__c"
    When I enter value "No" into field "fieldHaveAllFederalAndStateMBEWBE__c"
    When I enter value "No" into field "fieldOtherReportsRequiredbyTheFederalAward__c"
    When I enter value "No" into field "fieldHastheLobbyingandLitigationCertification__c"
    When I enter value "No" into field "fieldConfirmAllAuditConcernsMonitoring__c"
    When I enter value "No" into field "fieldHaveAllFederalMonitoringFindings__c"
    When I enter value "No" into field "fieldHaveAllApplicableFederalGrant__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:CloseoutApproversTable}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"

  @71685 @ValidateReassignApprovalDecisionForProjectPeriodCloseout  @smoke  @positive
  Scenario: verify Reassign approval decision for projrct period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
    When I enter value "No" into field "fieldReviewExpenditures__c"
    When I enter value "No" into field "fieldIdentifyAllOutstandingInvoices__c"
    When I enter value "No" into field "fieldPayrollExpenses__c"
    When I enter value "No" into field "fieldReviewedPurchaseOrdersIfClosedCopy__c"
    When I enter value "No" into field "fieldEnsurejournalentriescompleted__c"
    When I enter value "No" into field "fieldIdentifyOutstandinginvoices__c"
    When I enter value "No" into field "fieldConfirmIndirectExpensesHaveBeenPost__c"
    When I enter value "No" into field "fieldReviewAndUpdatePersonnelAllocations__c"
    When I enter value "No" into field "fieldEnsureCostSharingcommitmentsmet__c"
    When I enter value "No" into field "fieldFinalFFRforAllFunds__c"
    When I enter value "No" into field "fieldIsThereAnUnspentBalance__c"
    When I enter value "No" into field "fieldAdvancePayments__c"
    When I enter value "No" into field "fieldAllFinancialReportingRequirements__c"
    When I enter value "No" into field "fieldEnsureCostSharingCommitmentsAreMet__c"
    When I enter value "unspent balance" into field "fieldPleaseExplainUnspentBalance__c"
    When I enter value "No" into field "fieldHaveTheRealPropertyStatus__c"
    When I enter value "No" into field "fieldHastheTangiblePersonalProperty__c"
    When I enter value "No" into field "fieldHaveAllFederalAndStateMBEWBE__c"
    When I enter value "No" into field "fieldOtherReportsRequiredbyTheFederalAward__c"
    When I enter value "No" into field "fieldHastheLobbyingandLitigationCertification__c"
    When I enter value "No" into field "fieldConfirmAllAuditConcernsMonitoring__c"
    When I enter value "No" into field "fieldHaveAllFederalMonitoringFindings__c"
    When I enter value "No" into field "fieldHaveAllApplicableFederalGrant__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "egmsid"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:CloseoutApproversTable}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I select radio button "Reassign" in the approval decision
    And I select user "Automation FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When  I re-login as "FO" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Approve Project Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Project Period Closeout for Grant {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{prdoh_tableId:PendingTask}"
    Then I softly see field "Status" as "Submitted for Approval"

  @71685 @ValidateReAssignedUserIsAbleToSendToOwnerTheProjectPeriodCloseout  @positive
  Scenario: verify re-assigned user is able to send to owner the Project Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
    When I enter value "No" into field "fieldReviewExpenditures__c"
    When I enter value "No" into field "fieldIdentifyAllOutstandingInvoices__c"
    When I enter value "No" into field "fieldPayrollExpenses__c"
    When I enter value "No" into field "fieldReviewedPurchaseOrdersIfClosedCopy__c"
    When I enter value "No" into field "fieldEnsurejournalentriescompleted__c"
    When I enter value "No" into field "fieldIdentifyOutstandinginvoices__c"
    When I enter value "No" into field "fieldConfirmIndirectExpensesHaveBeenPost__c"
    When I enter value "No" into field "fieldReviewAndUpdatePersonnelAllocations__c"
    When I enter value "No" into field "fieldEnsureCostSharingcommitmentsmet__c"
    When I enter value "No" into field "fieldFinalFFRforAllFunds__c"
    When I enter value "No" into field "fieldIsThereAnUnspentBalance__c"
    When I enter value "No" into field "fieldAdvancePayments__c"
    When I enter value "No" into field "fieldAllFinancialReportingRequirements__c"
    When I enter value "No" into field "fieldEnsureCostSharingCommitmentsAreMet__c"
    When I enter value "unspent balance" into field "fieldPleaseExplainUnspentBalance__c"
    When I enter value "No" into field "fieldHaveTheRealPropertyStatus__c"
    When I enter value "No" into field "fieldHastheTangiblePersonalProperty__c"
    When I enter value "No" into field "fieldHaveAllFederalAndStateMBEWBE__c"
    When I enter value "No" into field "fieldOtherReportsRequiredbyTheFederalAward__c"
    When I enter value "No" into field "fieldHastheLobbyingandLitigationCertification__c"
    When I enter value "No" into field "fieldConfirmAllAuditConcernsMonitoring__c"
    When I enter value "No" into field "fieldHaveAllFederalMonitoringFindings__c"
    When I enter value "No" into field "fieldHaveAllApplicableFederalGrant__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "egmsid"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:CloseoutApproversTable}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I select radio button "Reassign" in the approval decision
    And I select user "Automation FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When  I re-login as "FO" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Send to Owner" in the approval decision
    And  I re-login as "PM" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Revise Project Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "Revise Project Period Closeout Request" inside flex table with id "{prdoh_tableId:PendingTask}"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail

  @71685 @ValidateReAssignedUserIsAbleToReAssignTheProjectPeriodCloseout   @positive
  Scenario: verify re-assigned user is able to re-assign the Project Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
    When I enter value "No" into field "fieldReviewExpenditures__c"
    When I enter value "No" into field "fieldIdentifyAllOutstandingInvoices__c"
    When I enter value "No" into field "fieldPayrollExpenses__c"
    When I enter value "No" into field "fieldReviewedPurchaseOrdersIfClosedCopy__c"
    When I enter value "No" into field "fieldEnsurejournalentriescompleted__c"
    When I enter value "No" into field "fieldIdentifyOutstandinginvoices__c"
    When I enter value "No" into field "fieldConfirmIndirectExpensesHaveBeenPost__c"
    When I enter value "No" into field "fieldReviewAndUpdatePersonnelAllocations__c"
    When I enter value "No" into field "fieldEnsureCostSharingcommitmentsmet__c"
    When I enter value "No" into field "fieldFinalFFRforAllFunds__c"
    When I enter value "No" into field "fieldIsThereAnUnspentBalance__c"
    When I enter value "No" into field "fieldAdvancePayments__c"
    When I enter value "No" into field "fieldAllFinancialReportingRequirements__c"
    When I enter value "No" into field "fieldEnsureCostSharingCommitmentsAreMet__c"
    When I enter value "unspent balance" into field "fieldPleaseExplainUnspentBalance__c"
    When I enter value "No" into field "fieldHaveTheRealPropertyStatus__c"
    When I enter value "No" into field "fieldHastheTangiblePersonalProperty__c"
    When I enter value "No" into field "fieldHaveAllFederalAndStateMBEWBE__c"
    When I enter value "No" into field "fieldOtherReportsRequiredbyTheFederalAward__c"
    When I enter value "No" into field "fieldHastheLobbyingandLitigationCertification__c"
    When I enter value "No" into field "fieldConfirmAllAuditConcernsMonitoring__c"
    When I enter value "No" into field "fieldHaveAllFederalMonitoringFindings__c"
    When I enter value "No" into field "fieldHaveAllApplicableFederalGrant__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "egmsid"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:CloseoutApproversTable}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    When I select radio button "Reassign" in the approval decision
    And I select user "Automation FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login as "FO" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I select radio button "Reassign" in the approval decision
    And I select user "Automation PO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login as "PO" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Approve Project Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{prdoh_tableId:PendingTask}"
    Then I softly see field "Status" as "Submitted for Approval"

  @71687 @ValidateSubmitProjectPeriodCloseoutToGrantor @wip @BugLoggedWith80950   @positive
  Scenario: verify Submit Project Period Closeout to Grantor
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
    When I enter value "No" into field "fieldReviewExpenditures__c"
    When I enter value "No" into field "fieldIdentifyAllOutstandingInvoices__c"
    When I enter value "No" into field "fieldPayrollExpenses__c"
    When I enter value "No" into field "fieldReviewedPurchaseOrdersIfClosedCopy__c"
    When I enter value "No" into field "fieldEnsurejournalentriescompleted__c"
    When I enter value "No" into field "fieldIdentifyOutstandinginvoices__c"
    When I enter value "No" into field "fieldConfirmIndirectExpensesHaveBeenPost__c"
    When I enter value "No" into field "fieldReviewAndUpdatePersonnelAllocations__c"
    When I enter value "No" into field "fieldEnsureCostSharingcommitmentsmet__c"
    When I enter value "No" into field "fieldFinalFFRforAllFunds__c"
    When I enter value "No" into field "fieldIsThereAnUnspentBalance__c"
    When I enter value "No" into field "fieldAdvancePayments__c"
    When I enter value "No" into field "fieldAllFinancialReportingRequirements__c"
    When I enter value "No" into field "fieldEnsureCostSharingCommitmentsAreMet__c"
    When I enter value "unspent balance" into field "fieldPleaseExplainUnspentBalance__c"
    When I enter value "No" into field "fieldHaveTheRealPropertyStatus__c"
    When I enter value "No" into field "fieldHastheTangiblePersonalProperty__c"
    When I enter value "No" into field "fieldHaveAllFederalAndStateMBEWBE__c"
    When I enter value "No" into field "fieldOtherReportsRequiredbyTheFederalAward__c"
    When I enter value "No" into field "fieldHastheLobbyingandLitigationCertification__c"
    When I enter value "No" into field "fieldConfirmAllAuditConcernsMonitoring__c"
    When I enter value "No" into field "fieldHaveAllFederalMonitoringFindings__c"
    When I enter value "No" into field "fieldHaveAllApplicableFederalGrant__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "egmsid"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:CloseoutApproversTable}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When  I re-login as "EXE" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login as "PM" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:ProjectPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProjectPeriodCloseout}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProjectPeriodCloseout}"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeSubmittedToGrantor__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Date/Time Submitted to Grantor" as "DateSubmittedToGrantor"
    Then I softly see field "{SavedValue:DateSubmittedToGrantor}" contains todays date withTime
    Then I softly can see top right button "Complete Closeout" in page detail
    And I pause execution for "2" seconds
    When I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    And I refresh the page
    And I navigate to "History" sub tab
    Then I see take snap shot getting saved with "Todays Date"
    When I navigate to "{sidebar:ProjectPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Project Period Closeouts - Submitted"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProjectPeriodCloseout}" panel
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Grant Title" against the value "Submitted to Grantor" inside table "{prdoh_tableId:ProjectPeriodCloseout}"

  @71692 @ValidateCompleteProjectPeriodCloseout  @smoke   @positive
  Scenario: verify Complete Project Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
    When I enter value "No" into field "fieldReviewExpenditures__c"
    When I enter value "No" into field "fieldIdentifyAllOutstandingInvoices__c"
    When I enter value "No" into field "fieldPayrollExpenses__c"
    When I enter value "No" into field "fieldReviewedPurchaseOrdersIfClosedCopy__c"
    When I enter value "No" into field "fieldEnsurejournalentriescompleted__c"
    When I enter value "No" into field "fieldIdentifyOutstandinginvoices__c"
    When I enter value "No" into field "fieldConfirmIndirectExpensesHaveBeenPost__c"
    When I enter value "No" into field "fieldReviewAndUpdatePersonnelAllocations__c"
    When I enter value "No" into field "fieldEnsureCostSharingcommitmentsmet__c"
    When I enter value "No" into field "fieldFinalFFRforAllFunds__c"
    When I enter value "No" into field "fieldIsThereAnUnspentBalance__c"
    When I enter value "No" into field "fieldAdvancePayments__c"
    When I enter value "No" into field "fieldAllFinancialReportingRequirements__c"
    When I enter value "No" into field "fieldEnsureCostSharingCommitmentsAreMet__c"
    When I enter value "unspent balance" into field "fieldPleaseExplainUnspentBalance__c"
    When I enter value "No" into field "fieldHaveTheRealPropertyStatus__c"
    When I enter value "No" into field "fieldHastheTangiblePersonalProperty__c"
    When I enter value "No" into field "fieldHaveAllFederalAndStateMBEWBE__c"
    When I enter value "No" into field "fieldOtherReportsRequiredbyTheFederalAward__c"
    When I enter value "No" into field "fieldHastheLobbyingandLitigationCertification__c"
    When I enter value "No" into field "fieldConfirmAllAuditConcernsMonitoring__c"
    When I enter value "No" into field "fieldHaveAllFederalMonitoringFindings__c"
    When I enter value "No" into field "fieldHaveAllApplicableFederalGrant__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "egmsid"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:CloseoutApproversTable}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When  I re-login as "EXE" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login as "PM" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:ProjectPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProjectPeriodCloseout}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProjectPeriodCloseout}"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeSubmittedToGrantor__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Complete Closeout" in the page details
    When I enter value "0" into field "fieldFederalCloseoutDate__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Completed"
    When I navigate to "Overview" sub tab
    And I save the field containing "Grantor Closeout Date" as "GrantorCloseoutDate"
    Then I softly see field "{SavedValue:GrantorCloseoutDate}" contains todays date withoutTime
    And I save the field containing "Grant EGMS ID" as "GrantEGMSID"
    And I click "{SavedValue:GrantEGMSID}" lookup link
    Then I softly see field "Status" as "Closed"
    And I navigate to "Awards" sub tab
    Then I softly see value "Closed" for title "Status" inside table "{prdoh_tableId:GrantsAwardsRevisionTableId}"

  @71936 @ValidateUserCanAddMultipleAttachmentsForProjectPeriodCloseout @smoke   @positive
  Scenario: verify user can add multiple attchments for project period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Attachments" sub tab
    Then I see the following top right buttons in table named "Attachments" :
      | Add |
    When I click on "AddAttachments" button inside attachments page block
    Then I see "Federal Closeout Document:Other" inside Type selectbox
    And I close modal by clicking the top right x button
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I pause execution for "3" seconds
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I pause execution for "3" seconds
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"
    Then I softly see row level action icon "Edit" against "Other" in Attachment and Notes Table
    Then I softly see row level action icon "Delete" against "Other" in Attachment and Notes Table

  @71936 @ValidateUserCanEditAndDeleteAttachmentsForProjectPeriodCloseout   @positive
  Scenario: verify user can edit and delete attchments for project period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Attachments" sub tab
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I click on "Edit" icon for "Other" inside table
    And I pause execution for "2" seconds
    When I enter values "Edit Attachment" into textarea description field for Edit Attachment
    When I close modal by clicking the top right x button
    Then I softly see table with header "Attachments" contains records "Edit Attachment"
    When I click on "Delete" icon for "Edit Attachment" inside table
    When I pause execution for "3" seconds
    Then I see confirmation box with body "Record deleted successfully." is displayed

  @71679 @ValidateUserCanAddMultipleNotesForProjectPeriodCloseout  @smoke   @positive
  Scenario: verify user can add multiple notes for project period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Attachments" sub tab
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

  @71679 @ValidateUserCanEditAndDeleteNotesForProjectPeriodCloseout   @positive
  Scenario: verify user can edit and delete notes for project period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Attachments" sub tab
    And I add notes records
    And I close modal by clicking the top right x button
    When I click on "Edit" icon for "Automation Notes" inside table
    When I enter values "Edit Notes" into textarea description field for Edit Attachment
    And I close modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Edit Notes"
    When I click on "Delete" icon for "Edit Notes" inside table
    When I pause execution for "3" seconds
    Then I see confirmation box with body "Record deleted successfully." is displayed

  @80903 @ValidateOverrideOpenItemsForProjectPeriodCloseout  @smoke   @positive
  Scenario: verify Override Open Items for Project Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Progress Report Preparer | Financial Report Preparer |
      |                          | Automation PM             |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Financial Report Preparer | Progress Report Preparer |
      | Automation PM             | Automation PM            |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Quarterly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I see the header is "Closeout Title" in the page details
    And I navigate to "Open Items" sub tab
    Then I softly see the text containing :
      | Pending Progress Reports / Force Closed Reports  |
      | Pending Financial Reports / Force Closed Reports |
    Then I softly see value "Created" for title "Status" inside table "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see value "Created" for title "Status" inside table "{prdoh_tableId:PendingFinancialReport}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:PendingProgressReprt}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:PendingFinancialReport}"
    And I click on "Override Open Items" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to override and proceed with the closeout? The status of all open items will be changed to Forced Closed." is displayed
    And I click modal button "Yes"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingFinancialReport}"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:ProgressReportTableId}"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:FinancialReportsOnAwards}"

  @80903 @ValidateOverrideOpenItemsWithSubmittedForApprovalStatusReportsForProjectPeriodCloseout   @positive
  Scenario: verify Override Open Items with submitted for approval status reports for Project Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Progress Report Preparer | Financial Report Preparer |
      |                          | Automation PM             |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Financial Report Preparer | Progress Report Preparer |
      | Automation PM             | Automation PM            |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Quarterly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
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
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I see the header is "Closeout Title" in the page details
    And I navigate to "Open Items" sub tab
    Then I softly see the text containing :
      | Pending Progress Reports / Force Closed Reports  |
      | Pending Financial Reports / Force Closed Reports |
    Then I softly see value "Submitted for Approval" for title "Status" inside table "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see value "Submitted for Approval" for title "Status" inside table "{prdoh_tableId:PendingFinancialReport}"
    Then I softly can see row level action button "View" against "Submitted for Approval" in flex table with id "{prdoh_tableId:PendingProgressReprt}"
    Then I softly can see row level action button "View" against "Submitted for Approval" in flex table with id "{prdoh_tableId:PendingFinancialReport}"
    And I click on "Override Open Items" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to override and proceed with the closeout? The status of all open items will be changed to Forced Closed." is displayed
    And I click modal button "Yes"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingFinancialReport}"

  @80903 @ValidateOverrideOpenItemsWithApprovedStatusReportsForProjectPeriodCloseout  @positive
  Scenario: verify Override Open Items with approved status reports for Project Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Progress Report Preparer | Financial Report Preparer |
      |                          | Automation PM             |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Financial Report Preparer | Progress Report Preparer |
      | Automation PM             | Automation PM            |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Quarterly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
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
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    And I save the field containing "EGMS Progress Report ID" as "EGMSProgressReportID"
    When I "Approve" in the approval decision
    And  I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSProgressReportID}" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:EGMSProgressReportID}" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When  I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I save the field containing "EGMS Financial Report ID" as "EGMSFinancialReportID"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    And I "Approve" in the approval decision
    When  I re-login as "FD" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSFinancialReportID}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "{SavedValue:EGMSFinancialReportID}" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    When  I re-login as "EXE" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Approve Financial Report" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "Approve Financial Report" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When  I re-login as "PM" user on "default" portal
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I see the header is "Closeout Title" in the page details
    And I navigate to "Open Items" sub tab
    Then I softly see the text containing :
      | Pending Progress Reports / Force Closed Reports  |
      | Pending Financial Reports / Force Closed Reports |
    Then I softly see value "Approved" for title "Status" inside table "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see value "Approved" for title "Status" inside table "{prdoh_tableId:PendingFinancialReport}"
    Then I softly can see row level action button "View" against "Approved" in flex table with id "{prdoh_tableId:PendingProgressReprt}"
    Then I softly can see row level action button "View" against "Approved" in flex table with id "{prdoh_tableId:PendingFinancialReport}"
    And I click on "Override Open Items" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to override and proceed with the closeout? The status of all open items will be changed to Forced Closed." is displayed
    And I click modal button "Yes"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingFinancialReport}"

  @80903 @ValidateOverrideOpenItemsWithSubmittedToGrantorStatusReportsForProjectPeriodCloseout  @positive
  Scenario: verify Override Open Items with Submitted to Grantor status reports for Project Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Progress Report Preparer | Financial Report Preparer |
      |                          | Automation PM             |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Financial Report Preparer | Progress Report Preparer |
      | Automation PM             | Automation PM            |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Quarterly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
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
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    And I save the field containing "EGMS Progress Report ID" as "EGMSProgressReportID"
    When I "Approve" in the approval decision
    And  I re-login as "EXE" user on "default" portal
    And I pause execution for "5" seconds
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSProgressReportID}" in "{prdoh_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:EGMSProgressReportID}" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When  I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I save the field containing "EGMS Financial Report ID" as "EGMSFinancialReportID"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:FinancialReportApprovers}" by clicking "Edit" :
      | Role               | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Fiscal Approver    | Automation FD  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    And I "Approve" in the approval decision
    When  I re-login as "FD" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSFinancialReportID}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "{SavedValue:EGMSFinancialReportID}" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    When  I re-login as "EXE" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSFinancialReportID}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Start" icon for "{SavedValue:EGMSFinancialReportID}" inside flex table with id "{prdoh_tableId:PendingTask}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When  I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    When I click on "View" icon for "Approved" inside flex table with id "{prdoh_tableId:FinancialReportsOnMonitoring}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeReportSubmitted__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I see the header is "Closeout Title" in the page details
    And I navigate to "Open Items" sub tab
    Then I softly see the text containing :
      | Pending Progress Reports / Force Closed Reports  |
      | Pending Financial Reports / Force Closed Reports |
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "{prdoh_tableId:PendingFinancialReport}"
    Then I softly can see row level action button "View" against "Submitted to Grantor" in flex table with id "{prdoh_tableId:PendingProgressReprt}"
    Then I softly can see row level action button "View" against "Submitted to Grantor" in flex table with id "{prdoh_tableId:PendingFinancialReport}"
    And I click on "Override Open Items" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to override and proceed with the closeout? The status of all open items will be changed to Forced Closed." is displayed
    And I click modal button "Yes"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSProgressReportID}" inside table "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSFinancialReportID}" inside table "{prdoh_tableId:PendingFinancialReport}"
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:ProgressReports}"
    When I navigate to "{sidebar:FinancialReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"

  @80903 @ValidateOverrideOpenItemsForMultipleAwardsWithTwoDifferentBudgetPeriosdForProjectPeriodCloseout   @positive
  Scenario: verify Override Open Items for multiple awards with two different budget periods for Project Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -120      | -730        | -365      |
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
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Progress Report Preparer | Financial Report Preparer |
      |                          | Automation PM             |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Financial Report Preparer | Progress Report Preparer |
      | Automation PM             | Automation PM            |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Quarterly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:grantNumber}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I save the field containing "EGMS Progress Report ID" as "EGMSProgressReportIDBP01"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I save the field containing "EGMS Financial Report ID" as "EGMSFinancialReportIDBP01"
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 20AUTON     | Amendment | {SavedValue:fainNumber} | Continuation  | -850        | -120      | -350        | -120      |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I click on "Edit" icon for "Continuation" inside flex table with id "{prdoh_tableId:GrantsAwardsRevisionTableId}"
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
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Progress Report Preparer | Financial Report Preparer |
      |                          | Automation PM             |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Financial Report Preparer | Progress Report Preparer |
      | Automation PM             | Automation PM            |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Quarterly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I execute batch file:
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And  I re-login as "PM" user on "default" portal
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    And I click on "View" icon for "{SavedValue:grantNumber}" inside flex table with id "{prdoh_tableId:ProgressReports}"
    And I save the field containing "EGMS Progress Report ID" as "EGMSProgressReportIDBP02"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:grantNumber}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "370" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I save the field containing "EGMS Financial Report ID" as "EGMSFinancialReportIDBP02"
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    When I enter value "10" into field "fieldDueDate__c"
    And I click on "Save and Continue" in the page details
    Then I see the header is "Closeout Title" in the page details
    And I navigate to "Open Items" sub tab
    Then I softly see the text containing :
      | Pending Progress Reports / Force Closed Reports  |
      | Pending Financial Reports / Force Closed Reports |
    And I click on "Override Open Items" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to override and proceed with the closeout? The status of all open items will be changed to Forced Closed." is displayed
    And I click modal button "Yes"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSProgressReportIDBP01}" inside table "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSProgressReportIDBP02}" inside table "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSFinancialReportIDBP01}" inside table "{prdoh_tableId:PendingFinancialReport}"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSFinancialReportIDBP02}" inside table "{prdoh_tableId:PendingFinancialReport}"

  @71688 @ValidateToViewOpenItemsForProjectPeriodCloseout  @smoke   @positive
  Scenario Outline: verify to view open items for project period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
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
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    When I re-login as "<userType>" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:ProjectPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProjectPeriodCloseout}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:ProjectPeriodCloseout}"
    Then I softly can see "Open Items" sub tab at view detail page
    And I navigate to "Open Items" sub tab
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly see "Progress Report EGMS ID" in flex table header "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see "Grant Award Number" in flex table header "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see "Amendment Number" in flex table header "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see "Reporting Period" in flex table header "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:PendingProgressReprt}"
    Then I softly see "Financial Report EGMS ID" in flex table header "{prdoh_tableId:PendingFinancialReport}"
    Then I softly see "Grant Award Number" in flex table header "{prdoh_tableId:PendingFinancialReport}"
    Then I softly see "Amendment Number" in flex table header "{prdoh_tableId:PendingFinancialReport}"
    Then I softly see "Reporting Period" in flex table header "{prdoh_tableId:PendingFinancialReport}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:PendingFinancialReport}"
    Examples:
      | userType |
      | EXE      |
      | Admin    |
      | PO       |
      | FD       |
      | FO       |
      | PM1      |
      | PM       |