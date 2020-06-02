@Closeout @BudgetPeriodCloseout @grantee-regression @grantee-parallel-regression
Feature: Budget Period Closeout related scenarios
  Test all scenarios related to budget period closeout

  @79983 @VerifyAddingAnAttachmentForBudgetPeriodCloseout   @smoke     @positive
  Scenario: Verify add edit and delete attachment for Budget period closeout using PI User
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
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Attachments" sub tab
    When I click on "AddAttachments" button inside attachments page block
    Then I see "Federal Closeout Document:Closeout Related Document:Supporting Document:Other" inside Type selectbox
    And I close modal by clicking the top right x button
    And I upload attachment "AttachmentTesting.pdf" of type "Federal Closeout Document"
    And I refresh the page
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"
    When I click on "Edit" attachment to upload attachment "AttachmentTesting.pdf" of type "Other"
    And I close modal by clicking the top right x button
    Then I softly see table with header "Attachments" contains records "Other"
    And I click on "Delete" icon for "AttachmentTesting.pdf" inside table
    When I close alertbox
    Then I softly do not see table with header "Attachments" contains records "Other"

  @70804 @VerifyAddingNotesForBudgetPeriodCloseout  @smoke     @positive
  Scenario: Verify add edit and delete notes for Budget period closeout using PI User
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
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Attachments" sub tab
    And I add notes records
    And I close modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Automation Notes"
    When I click on "Delete" icon for "Automation Notes" inside table
    When I close alertbox
    Then I softly do not see table with header "Notes" contains records "Automation Notes"

  @70807 @VerifyAssignApproversValidationsForBudgetPeriodCloseout    @BugID83688
  Scenario: Verify validations on assigning approver for Budget Period Closeouts in Roles tab as PI user
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Roles" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "---prdoh_tableId:-:CloseoutApproversTable---"
    And I enter value "Invalid" into field "Name__c"
    And I pause execution for "4" seconds
    Then I softly see "No matches found" inside auto search result
    And I refresh the page
    And I click on "Edit" icon for "Executive Approver" inside flex table with id "---prdoh_tableId:-:CloseoutApproversTable---"
    And I enter value "Invalid" into field "Name__c"
    And I pause execution for "4" seconds
    Then I softly see "No matches found" inside auto search result
    And I refresh the page
    And I click on "Edit" icon for "Program Approver" inside flex table with id "---prdoh_tableId:-:CloseoutApproversTable---"
    And I click on "Edit" icon for "Executive Approver" inside flex table with id "---prdoh_tableId:-:CloseoutApproversTable---"
    And I click on top right button "Save" in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---"
    Then I see the following messages in the page details :
      | Required Field Missing |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name             | Description                  |
      | Program Approver   | Automation Admin | Automation Approval required |
      | Executive Approver | Automation Admin | Automation Approval required |
    Then I see the following messages in the page details :
      | You cannot add a person for more than one role. |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name             | Description |
      | Program Approver   | Automation Admin |             |
      | Executive Approver | Automation PO    |             |
    Then I see the following messages in the page details :
      | Required Field Missing |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name             | Description                  |
      | Executive Approver | Automation Admin | Automation Approval required |
    Then I see the following messages in the page details :
      | Assign Executive Profile user, if Responsibility is Executive Approver. |

  @70807 @VerifyAssignApproversWithoutValidationsForBudgetPeriodCloseout   @smoke   @positive
  Scenario: Verify assigning approver for Budget Period Closeouts in Roles tab as PI user
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Roles" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "---prdoh_tableId:-:CloseoutApproversTable---"
    And I enter value "Automation Admin" into field "Name__c"
    And I pause execution for "4" seconds
    Then I softly see "Automation Admin" inside auto search result
    And I refresh the page
    And I click on "Edit" icon for "Executive Approver" inside flex table with id "---prdoh_tableId:-:CloseoutApproversTable---"
    And I enter value "Automation Exe" into field "Name__c"
    And I pause execution for "4" seconds
    Then I softly see "Automation Exe" inside auto search result
    And I refresh the page
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name             | Description                  |
      | Program Approver   | Automation Admin | Automation Approval required |
      | Executive Approver | Automation Exe   | Automation Approval required |
    Then I softly see value "Automation Admin" for title "Name" inside table "---prdoh_tableId:-:CloseoutApproversTable---"
    Then I softly see value "Automation Exe" for title "Name" inside table "---prdoh_tableId:-:CloseoutApproversTable---"
    Then I softly see value "Automation Approval required" for title "Description" inside table "---prdoh_tableId:-:CloseoutApproversTable---"

  @70882 @VerifyFieldsAvailableInCheckListSubTabForBudgetPeriodCloseoutRequest  @smoke   @positive
  Scenario: Verify editable fields in the CheckList SubTab for Budget Period Closeout Request
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
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

  @70811 @VerifyValidationsOnSubmittingBudgetPeriodCloseoutRequestForApprovals
  Scenario: Verify validations on submitting Budget period closeout request for approvals as PI user
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
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardProgressReportSchedule}"
    When I enter value "Quarterly" into field "fieldFrequency__c"
    When I enter value "Calendar" into field "fieldScheduleBase__c"
    When I enter value "30" into field "fieldDueDateDays__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I pause execution for "4" seconds
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Progress Report Preparer | Financial Report Preparer |
      |                          | Automation PM             |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Financial Report Preparer | Progress Report Preparer |
      | Automation PM             | Automation PM            |
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
      | operationType | batchName      | recordName                                  |
      | Batch         | ProgressReport | {SavedValue:Automation Runtime Grant Award} |
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    Then I softly can see top right button "New" in flex table with id "{prdoh_tableId:FinancialsReportTableId}"
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialsReportTableId}"
    When I enter value "240" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    When I click "{SavedValue:AWARDID}" lookup link
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details :
      | Roles tab: Please assign a Program Approver                                                         |
      | Roles Tab: Please assign a Executive Approver.                                                      |
      | There are one or more active progress reports. Please check the "Open Items" tab for more details.  |
      | There are one or more active financial reports. Please check the "Open Items" tab for more details. |
      | Please fill all the required fields in Check List tab before you Submit for Approval.               |
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    When I enter value "Yes" into field "fieldHaveTheRealPropertyStatus__c"
    When I enter value "Yes" into field "fieldHastheTangiblePersonalProperty__c"
    When I enter value "Yes" into field "fieldHaveAllFederalAndStateMBEWBE__c"
    When I enter value "Yes" into field "fieldOtherReportsRequiredbyTheFederalAward__c"
    When I enter value "Yes" into field "fieldHastheLobbyingandLitigationCertification__c"
    When I enter value "Yes" into field "fieldConfirmAllAuditConcernsMonitoring__c"
    When I enter value "Yes" into field "fieldHaveAllFederalMonitoringFindings__c"
    When I enter value "Yes" into field "fieldHaveAllApplicableFederalGrant__c"
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details :
      | Roles tab: Please assign a Program Approver                                                                      |
      | Roles Tab: Please assign a Executive Approver.                                                                   |
      | There are one or more active progress reports. Please check the "Open Items" tab for more details.               |
      | There are one or more active financial reports. Please check the "Open Items" tab for more details.              |
      | If there is an unspent balance remaining on this award then please explain unspent balance on the check list tab |

  @70811 @VerifyPIUserCanEdiDetailPageAfterSubmittingBudgetPeriodCloseoutRequestForApprovals
  Scenario: Verify edit action on page level after when the status of the budget period closeout request is submitted for approvals
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name             | Description                  |
      | Program Approver   | Automation Admin | Automation Approval required |
      | Executive Approver | Automation Exe   | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Roles" sub tab
    Then I softly cannot see row level action button "Edit" against "Program Approver" in flex table with id "{prdoh_tableId:CloseoutApproversTable}"
    Then I softly cannot see row level action button "Edit" against "Executive Approver" in flex table with id "{prdoh_tableId:CloseoutApproversTable}"

  @70814 @VerifySendBackToOwnerAsProgramApproverForBudgetPeriodCloseoutRequest  @BudgID81247  @smoke  @positive
  Scenario: Verify Program Approver Approves the Budget period closeout request
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PO  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When  I re-login as "PO" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I can see the approval decision
    When I select radio button "Send to Owner" in the approval decision
    Then I can see the comment box in the approval decision
    When I enter comment "Automation Testing" in the approval decision
    When I submit the approval in the approval decision
    When  I re-login as "PM" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Revise Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Override Open Items" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Edit" in the page details
    When I enter value "Editing Budget Period Closeout Request" into field "fieldReason__c"
    And I navigate to "Checklist" sub tab
    When I enter value "No" into field "fieldReviewExpenditures__c"
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"

  @70814 @VerifyReAssignApprovalDecisionAsProgramApproverForBudgetPeriodCloseoutRequest  @smoke    @positive
  Scenario: Verify reassign approval decision for budget period closeout request as program approver
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PO  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login as "PO" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I can see the approval decision
    And I select radio button "Reassign" in the approval decision
    And I select user "Automation FD" in the approval decision
    Then I can see the comment box in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I re-login as "FD" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I can see the approval decision
    Then I can see the approval decision
    And I select radio button "Reassign" in the approval decision
    And I select user "Automation FO" in the approval decision
    Then I can see the comment box in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I re-login as "FO" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I can see the approval decision
    When I select radio button "Send to Owner" in the approval decision
    Then I can see the comment box in the approval decision
    When I enter comment "Automation Testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Created"

  @70814 @VerifyApprovingBudgetPeriodCloseoutRequestAsProgramApprover  @smoke   @positive
  Scenario: Verify Approve decision for budget period closeout request as program approver
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PO  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login as "PO" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"

  @70815 @VerifySendBackToOwnerAsExecutiveApproverForBudgetPeriodCloseoutRequest @BudgID81247    @positive
  Scenario: Verify Send back approval decision as Executive Approver for the Budget Period Closeout Request
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PO  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login as "PO" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login as "EXE" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Reassign" in the approval decision
    And I select user "Automation FO" in the approval decision
    And I submit the approval in the approval decision without processing
    And I re-login as "FO" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Approved"
    And I re-login as "Exe" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I can see the approval decision
    When I select radio button "Send to Owner" in the approval decision
    Then I can see the comment box in the approval decision
    When I enter comment "Automation Testing" in the approval decision
    When I submit the approval in the approval decision
    When  I re-login as "PM" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Revise Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award{SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Override Open Items" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Edit" in the page details
    When I enter value "Editing Budget Period Closeout Request" into field "fieldReason__c"
    And I navigate to "Checklist" sub tab
    When I enter value "No" into field "fieldReviewExpenditures__c"
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Draft"
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see "Submitted for Approval" value in flex table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"

  @70815 @VerifyReAssignApprovalDecisionAsExecutiveApproverForBudgetPeriodCloseoutRequest    @positive
  Scenario: Verify reassign approval decision for budget period closeout request as executive approver
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login as "Exe" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    And I select radio button "Reassign" in the approval decision
    And I select user "Automation FD" in the approval decision
    Then I can see the comment box in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login as "FD" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I can see the approval decision
    And I select radio button "Reassign" in the approval decision
    And I select user "Automation FO" in the approval decision
    Then I can see the comment box in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I re-login as "FO" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I can see the approval decision
    When I select radio button "Send to Owner" in the approval decision
    Then I can see the comment box in the approval decision
    When I enter comment "Automation Testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Created"

  @70815 @VerifyApprovingBudgetPeriodCloseouRequestAsExecutiveApprover  @smoke   @positive
  Scenario: Verify approve decision for budget period closeout request as executive approver
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login as "Exe" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Approved"
    And I re-login as "PM" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Submit Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout Request for {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Submit To Grantor" in page detail

  @81256 @VerifySubmitToGrantorForBudgetPeriodCloseoutRequestAsPIUser    @positive
  Scenario:Verify if PI user can submit the budget period closeout request to grantor
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login as "Exe" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Approved"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Draft"
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see "Approved" value in flex table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I click on "View" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly can see top right button "Submit To Grantor" in page detail
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeSubmittedToGrantor__c"
    When I click modal button "Save"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Date/Time Submitted to Grantor" as "SubmitDate"
    Then I softly see field "{SavedValue:SubmitDate}" contains todays date withTime
    Then I softly can see top right button "Complete Closeout" in page detail
    And I refresh the page
    When I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    And I refresh the page
    And I navigate to "History" sub tab
    Then I see take snap shot getting saved with "Todays Date"
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Submitted"
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see "Submitted to Grantor" value in flex table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"

  @71049 @VerifyCompleterBudgetPeriodCloseoutRequestAsPIUser    @positive
  Scenario:Verify if PI user can complete the budget period closeout request
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login as "Exe" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Approve Budget Period Closeout Request" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Budget Period Closeout for Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Approved"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Draft"
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see "Approved" value in flex table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I click on "View" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly can see top right button "Submit To Grantor" in page detail
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeSubmittedToGrantor__c"
    When I click modal button "Save"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - All"
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see "Submitted to Grantor" value in flex table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I click on "View" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly can see top right button "Complete Closeout" in page detail
    And I click on "Complete Closeout" in the page details
    When I enter value "0" into field "fieldFederalCloseoutDate__c"
    When I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly see field "Status" as "Completed"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Grantor Closeout Date" as "CloseDate"
    Then I softly see field "{SavedValue:CloseDate}" contains todays date withTime
    When I click "{SavedValue:AwardID}" lookup link
    Then I softly see field "Status" as "Closed"
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Completed"
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see "Completed" value in flex table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I navigate to "Grants" sub tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly see "Active" value in flex table id "{prdoh_tableId:GrantsTable}"

  @71049 @VerifyGrantStatusIsClosedWhenTheBudgetPeriodCloseoutRequestForFinalBudgetPeriodIsCompleted @smoke     @positive
  Scenario:Verify if PI user can complete the budget period closeout request
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
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    And I enter value "Yes" into field "fieldBudgetCloseoutrequestRequired__c"
    And I click modal button "Save"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                  |
      | Program Approver | Automation PM | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "AwardID"
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    When I click on "Edit" icon for "Continuation" inside table with table id "{prdoh_tableId:GrantsAwardsRevisionTableId}" without processing
    When I enter value "No" into field "fieldIsNOGAAttachedPicklist__c"
    When I enter value "1" into field "fieldAwardIssueDate__c"
    When I enter value "Washington" into field "fieldPlace_of_Performance__c"
    And I click on "Save" in the page details
    Then I softly see value "No" for title "Is this award related to an application in the EGMS?" inside table "{prdoh_tableId:AwardRelatedApplicationTableId}"
    Then I softly see value "Yes" for title "Is a Budget Period Closeout Required?" inside table "{prdoh_tableId:GrantsLevelDetailsTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                  |
      | Program Approver | Automation PM | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I re-login as "Exe" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Approved"
    When I re-login as "PM" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    And I click on "View" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeSubmittedToGrantor__c"
    When I click modal button "Save"
    Then I softly can see top right button "Complete Closeout" in page detail
    And I click on "Complete Closeout" in the page details
    When I enter value "0" into field "fieldFederalCloseoutDate__c"
    When I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly see field "Status" as "Completed"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - Closed"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    When I click on "View" icon for "Closed" inside table with table id "{prdoh_tableId:GrantsTable}" without processing
    Then I softly see field "Status" as "Closed"
    And I navigate to "Awards" sub tab
    Then I see value "Closed" for title "Status" against the value "NA" inside table "{prdoh_tableId:GrantsAwardsRevisionTableId}"
    Then I see value "Closed" for title "Status" against the value "Continuation" inside table "{prdoh_tableId:GrantsAwardsRevisionTableId}"

  @71049 @VerifyContinuationAmendmendFromPeoplesoftIsCreatedWhenAwardForBudgetPeriod1IsClosed  @smoke    @positive  @BugID83690
  Scenario:Verify Continuation Amendment is created for second budget period when an award from first budget period is closed
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | 10        | -730        | -365      |
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
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    And I enter value "Yes" into field "fieldBudgetCloseoutrequestRequired__c"
    And I click modal button "Save"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                  |
      | Program Approver | Automation PM | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "AwardID"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
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
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:CloseoutApproversTable---" by clicking "Edit" :
      | Responsibility     | Name           | Description                  |
      | Program Approver   | Automation PM  | Automation Approval required |
      | Executive Approver | Automation Exe | Automation Approval required |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I re-login as "Exe" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Approved"
    When I re-login as "PM" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - All"
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    And I click on "View" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldDateTimeSubmittedToGrantor__c"
    When I click modal button "Save"
    Then I softly can see top right button "Complete Closeout" in page detail
    And I click on "Complete Closeout" in the page details
    When I enter value "0" into field "fieldFederalCloseoutDate__c"
    When I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly see field "Status" as "Completed"
    When I click "{SavedValue:AwardID}" lookup link
    Then I softly see field "Status" as "Closed"
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 20AUTON     | Amendment | {SavedValue:fainNumber} | Continuation  | -730        | 10        | -320        | -10       |
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
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    Then I softly see value "2" for title "Budget Period Number" against the value "Continuation" inside table "{prdoh_tableId:GrantsAwardsRevisionTableId}"
    Then I softly see value "1" for title "Version" against the value "Continuation" inside table "{prdoh_tableId:GrantsAwardsRevisionTableId}"
    Then I softly see value "Closed" for title "Status" against the value "NA" inside table "{prdoh_tableId:GrantsAwardsRevisionTableId}"
    Then I softly see value "Created" for title "Status" against the value "Continuation" inside table "{prdoh_tableId:GrantsAwardsRevisionTableId}"

  @71933 @VerifyInitiateCloseoutButtonAtCloseoutSubtabForManualBudgetPeriodCloseout     @positive
  Scenario: Verify PI User can see the Initiate closeout button at Budget period closeout request page block inside closeout sub tab Active Award
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    Then I softly can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"

  @71933 @VerifyVisibilityOfInitiateCloseoutButtonAtCloseoutSubtabFromUserOtherThanRecordOwner-ActiveAward
  Scenario: Verify Initiate closeout button should not be displayed for users other than PI user- Active Award
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    And I re-login as "EXE" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    Then I softly cannot see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"

  @71933 @VerifyValidationMessageOnCreatingManualBudgetPeriodCloseoutRequestusingInitiateCloseoutButtonAtCloseoutSubtab-ActiveAward
  Scenario: Verify validation messages when PI user tries to create a manual budget period closeout request
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    And I click on "Save and Continue" in the page details
    Then I softly see the following messages in the page details :
      | Closeout Type is Required to save. |
      | Reason is Required to save.        |

  @71933 @VerifyCreatingManualBudgetPeriodCloseoutRequestusingsingUsingInitiateCloseoutButtonAtCloseoutSubtab-ActiveAward @smoke  @positive
  Scenario: Verify PI user can create a manual budget period closeout request successfully
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    Then I softly see field "Closeout Type" as "Termination"
    Then I softly see field "Reason" as "Reason for the Budget Period Closeout Request"
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "{prdoh_tableId:PendingTask}" panel
    Then I softly see value "Complete Budget Period Closeout" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Complete Budget Period Closeout For Award {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    And I click on "Start" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I click "{SavedValue:AWARDID}" lookup link
    Then I softly see field "Status" as "Pending Closeout"
    And I navigate to "Closeout" sub tab
    Then I softly cannot see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    And I navigate to "Amendments" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---prdoh_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Management" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---prdoh_tableId:-:FinancialsReportTableId---"

  @71933 @VerifyCreatingManualBudgetPeriodCloseoutRequestWhenUIAmendmentRequestIsCreated-ActiveAward
  Scenario: Verify PI user can not create a manual budget period closeout request when UI Amendment Request is already created
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    When I click "{SavedValue:AWARDID}" lookup link
    And I navigate to "Closeout" sub tab
    Then I softly cannot see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"

  @79690 @VerifyFieldsValuesOnBudgtePeriodCloseoutDetailPageHeaderSection  @positive
  Scenario: Verify the field values on the header section of Budget PeriodCloseout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    And I enter value "Yes" into field "fieldBudgetCloseoutrequestRequired__c"
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    Then I save the field labeled "Budget Period" as "AwardBudgetPeriod"
    Then I save the field labeled "Amendment Number" as "AwardAmendmentNumber"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Budget Period" as "{SavedValue:AwardBudgetPeriod}"
    Then I softly see field "Amendment Number" as "{SavedValue:AwardAmendmentNumber}"

  @79690 @VerifyPagelevelbuttonsAvailabiltiyOnBudgetPeriodCloseoutRequestDetailPageAsPIUser  @positive
  Scenario: Verify availability of page level buttons on Budget Period closeout Request
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I save the field labeled "Internal Organization" as "AwardInternalOrganizationName"
    Then I save the field labeled "Funding Organization" as "AwardFundingOrganizationName"
    And I navigate to "Budget" sub tab
    Then I save the field labeled "Award to Date (Budget Period)" as "AwardtoDateAmountBudgetPeriod"
    And I navigate to "Actuals" sub tab
    Then I save the field labeled "Expenditures" as "AwardExpenditureAmountBudgetPeriod"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I softly see the text containing :
      | Award Overview           |
      | Closeout Request Details |
    Then I softly see field "Award Title" as "{SavedValue:Automation Runtime Grant Award}"
    Then I softly see field "Award EGMS ID" as "{SaVedValue:AwardID}"
    Then I softly see field "Internal Organization" as "{SavedValue:AwardInternalOrganizationName}"
    Then I softly see field "Funding Organization" as "{SavedValue:AwardFundingOrganizationName}"
    Then I softly see field "Expenditures (Budget Period)" as "{SavedValue:AwardExpenditureAmountBudgetPeriod}"
    Then I softly see field "Awarded to Date (Budget Period)" as "{SavedValue:AwardtoDateAmountBudgetPeriod}"
    Then I softly can see top right button "Override Open Items" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail

  @79690 @VerifyPagelevelbuttonsAvailabiltiyOnBudgetPeriodCloseoutRequestDetailPageAsEXEUser  @positive
  Scenario: Verify availability of page level buttons on Budget Period closeout Request Other Than PI user
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    Then I save the field labeled "EGMS ID" as "AWARDID"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AWARDID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AWARDID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I re-login as "EXE" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on "View" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    Then I softly cannot see top right button "Override Open Items" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail

  @79690 @VerifyFieldsAreEditableWhileEditingTheBudgetPeriodCloseoutDetailPage @Bug80063BugID80998 @smoke  @positive
  Scenario: Verify Editable Fields on Budget Period closeout Request
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - All"
    And I perform quick search for "{SavedValue:BPCloseoutEgmsId}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    And I click on "Edit" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see fields "fieldReason__c" is in edit mode
    Then I softly see fields "fieldDueDate__c" is in edit mode
    Then I softly see fields "fieldCloseoutDate__c" is in edit mode
    And I enter value "2" into field "DueDate__c"
    Then I softly see field "Grantor Closeout Date" as ""
    Then I softly see field "Date/Time Submitted to Grantor" as ""
    And I click on "Save and Continue" in the page details
    Then I softly see field "Days Left" as "2"

  @70820 @VerifyBudgetPeriodCloseoutsListPageActionsFromAwardRecord   @smoke  @positive
  Scenario: VerifyBudgetPeriodCloseoutsListPageFromAwardRecord
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Closeout EGMS ID" as "BPCloseoutEgmsId"
    When I click "{SavedValue:AWARDID}" lookup link
    And I navigate to "Closeout" sub tab
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    Then I softly see "Type" in flex table header "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    Then I softly see "Budget Period" in flex table header "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    Then I softly see "Closeout Due Date" in flex table header "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    Then I softly see "Assigned To" in flex table header "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    Then I softly see "Actions" in flex table header "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    Then I see total records count is same as total row of table id "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}" and table name "flextable"
    And I click on "View" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    And I softly see the text containing :
      | Award Overview           |
      | Closeout Request Details |
    When I click "{SavedValue:AWARDID}" lookup link
    And I click on "Edit" icon for "{SavedValue:BPCloseoutEgmsId}" inside flex table with id "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    Then I softly see fields "fieldReason__c" is in edit mode
    Then I softly see fields "fieldDueDate__c" is in edit mode
    Then I softly see fields "fieldCloseoutDate__c" is in edit mode
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
    And I navigate to "Overview" sub tab
    When I click "{SavedValue:AWARDID}" lookup link
    And I navigate to "Closeout" sub tab
    When I click on "Delete" icon for "{SavedValue:BPCloseoutEgmsId}" inside table with table id "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}" without processing
    Then I see confirmation box with body "Are you sure you want to permanently delete the budget period closeout?" is displayed
    When I click modal button "Yes"
    Then I softly do not see value "{SavedValue:BPCloseoutEgmsId}" for title "EGMS ID" inside table "{prdoh_tableId:AwardbudgetperiodcloseoutTableId}"
    Then I softly can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    Then I softly see field "Status" as "Active"

  @81201 @ValidateColumnsWithValuesOnBudgetPeriodCloseoutListPage  @smoke  @positive
  Scenario: verify columns with values on budget period closeout list page
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I save the field containing "Award Title" as "AwardTitle"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "Closeout EGMS ID" as "egmsId"
    And I save the field labeled "Status" as "status"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Closeout Type" as "CloseoutType"
    When I click on "Edit" in the page details
    And I enter value "10" into field "fieldDueDate__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "Closeout Due Date" as "CloseoutDueDate"
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see value "{SavedValue:egmsId}" for title "EGMS ID" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see value "{SavedValue:GrantAwardNumber}" for title "Grant Award Number" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see value "{SavedValue:AwardTitle}" for title "Award Title" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see value "{SavedValue:CloseoutType}" for title "Type" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see value "{SavedValue:BudgetPeriod}" for title "Budget Period" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see value "{SavedValue:CloseoutDueDate}" for title "Closeout Due Date" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see value "{SavedValue:status}" for title "Status" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"

  @81201 @ValidateFiltersForBudgetPeriodCloseOutViewIconForAllUsers  @smoke  @positive
  Scenario Outline: verify filters for budget period closeout and view icon for all users
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    Then I softly see the text containing :
      | Budget Period Closeout - All |
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Draft"
    Then I softly see the text containing :
      | Budget Period Closeout - Draft |
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Submitted"
    Then I softly see the text containing :
      | Budget Period Closeout - Submitted |
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Completed"
    Then I softly see the text containing :
      | Budget Period Closeout - Completed |
    When I re-login as "<userType>" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly cannot see row level action button "Delete" against "Created" in flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Examples:
      | userType |
      | EXE      |
      | Admin    |
      | PO       |
      | FD       |
      | FO       |

  @81201 @ValidateEditAndDeleteFunctionalityForBudgetPeriodCloseout @wip @BugLoggedWith80063  @positive
  Scenario: verify edit and delete functionality for budget period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I enter value "Budget Period Test" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Reason" as "Budget Period Test"
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    And I click on "Delete" icon for "{SavedValue:Automation Runtime Grant Award}" inside table with table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" without processing
    Then I see confirmation box with body "Are you sure you want to permanently delete the budget period closeout?" is displayed
    When I click modal button "Yes"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"

  @81201 @ValidateSortingFunctionalityForBudgetPeriodCloseout  @positive
  Scenario: verify sorting functionality for budget period closeout functionality
    When I login as "PM" user
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    When I click on "EGMS ID" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "EGMS ID" is in "Ascending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "EGMS ID" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "EGMS ID" is in "Descending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Grant Award Number" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Grant Award Number" is in "Ascending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Grant Award Number" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Grant Award Number" is in "Descending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Award Title" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Award Title" is in "Ascending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Award Title" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Award Title" is in "Descending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Type" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Type" is in "Ascending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Type" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Type" is in "Descending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Budget Period" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Budget Period" is in "Ascending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Budget Period" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Budget Period" is in "Descending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Closeout Due Date" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Closeout Due Date" is in "Ascending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Closeout Due Date" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Closeout Due Date" is in "Descending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Status" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Status" is in "Ascending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I click on "Status" column header inside table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly see content of expected column "Status" is in "Descending" order of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"

  @81201 @ValidateAdvanceSearchFunctionalityForBudgetPeriodCloseout @BugLoggedWith81355  @positive
  Scenario: verify advance search functionality for budget period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    When I click on advance filter "#advfBudgetPeriodCloseOutRequest" of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    When I enter advance filter values inside id "{prdoh_tableId:BudgetPeriodCloseoutAdvanceSearch}"
      | Status | equals to | Created |
    Then I softly see value "Created" for title "Status" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"

  @81201 @ValidateRefreshFunctionalityForBudgetPeriodCloseout  @positive
  Scenario: verify refresh functionality for budget period closeout
    When I login as "PM" user
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#BudgetPeriodCloseOutRequestFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Budget Period Closeout - All"
    Then I see table is refreshing

  @81201 @ValidateTotalRecordCountAtListViewBudgetPeriodCloseout-All  @positive
  Scenario Outline: verify total record count at list view budget period closeout-All
    Given I login as "<userType>" user
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - All"
    And I select value inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" is "All"
    Then I see total records count is same as total row of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" and table name "flextable"
    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |
      | PM1      |

  @81201 @ValidateTotalRecordCountAtListViewBudgetPeriodCloseoutDraft  @positive
  Scenario Outline: verify total record count at list view budget period closeout-Draft
    Given I login as "<userType>" user
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Draft"
    And I select value inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" is "All"
    Then I see total records count is same as total row of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" and table name "flextable"
    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |
      | PM1      |

  @81201 @ValidateTotalRecordCountAtListViewBudgetPeriodCloseout-Submitted  @positive
  Scenario Outline: verify total record count at list view budget period closeout-Submitted
    Given I login as "<userType>" user
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Submitted"
    Then I see total records count is same as total row of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" and table name "flextable"
    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |
      | PM1      |

  @ValidateTotalRecordCountAtListViewBudgetPeriodCloseout-Completed  @positive
  Scenario Outline: verify total record count at list view budget period closeout-Completed
    Given I login as "<userType>" user
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Budget Period Closeout - Completed"
    Then I see total records count is same as total row of table id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" and table name "flextable"
    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |
      | PM1      |

  @71134 @ValidateBudgetPeriodCloseoutRequestShouldBeCreated  @smoke  @positive
  Scenario: verify Budget period closeout request should be created
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    Then I softly see value "Yes" for title "Is a Budget Period Closeout Required?" inside table "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
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
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | AwardClose | null       |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Closeout" tab
    And I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see value "Created" for title "Status" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I save the field labeled "Closeout EGMS ID" as "closeoutEgmsid"
    And I save the field labeled "Award EGMS ID" as "AWARDID"
    And I click "{SavedValue:AWARDID}" lookup link
    Then I softly see field "Status" as "Pending Closeout"
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutEgmsid}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Complete Budget Period Closeout" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Complete Budget Period Closeout For {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    And I save the value from row "1" for column name "Created Date" as "createddate" from flex table "---prdoh_tableId:-:PendingTask---"
    Then I softly see column "Due Date" according to date "{SavedValue:createddate}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutEgmsid}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Closeout Type" as "Scheduled"

  @71143 @ValidateBudgetPeriodCloseoutRequestShouldBeCreatedForAmendedAward  @positive
  Scenario: verify Budget period closeout request should be created for Amended award
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | 10        | -730        | -365      |
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
    Then I softly see value "Yes" for title "Is a Budget Period Closeout Required?" inside table "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
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
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | AwardClose | null       |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see value "Created" for title "Status" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I save the field labeled "Closeout EGMS ID" as "closeoutEgmsid"
    And I save the field labeled "Award EGMS ID" as "AWARDID"
    And I click "{SavedValue:AWARDID}" lookup link
    Then I softly see field "Status" as "Pending Closeout"
    And I pause execution for "5" seconds
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 20AUTON     | Amendment | {SavedValue:fainNumber} | Continuation  | -730        | 10        | -320        | -10       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    Given  I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
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
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    And I enter value "Yes" into field "fieldBudgetCloseoutrequestRequired__c"
    And I click modal button "Save"
    Then I softly see value "Yes" for title "Is a Budget Period Closeout Required?" inside table "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:AwardRelatedApplicationTableId---"
    When I enter value "No" into field "fieldAwardrelatedapplication__c"
    And I click modal button "Save"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "Awardid"
    And I re-login as "ADMIN" user on "default" portal
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Awardid}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:Awardid}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | AwardClose | null       |
    When I re-login as "PM" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    Then I softly see value "Created" for title "Status" inside table "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    And I save the field labeled "Closeout EGMS ID" as "closeoutEgmsid"
    And I save the field labeled "Award EGMS ID" as "AWARDID"
    And I click "{SavedValue:AWARDID}" lookup link
    Then I softly see field "Status" as "Pending Closeout"
    When  I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutEgmsid}" in "---prdoh_tableId:-:PendingTask---" panel
    Then I softly see value "Complete Budget Period Closeout" for title "Task Type" inside table "{prdoh_tableId:PendingTask}"
    Then I softly see value "Complete Budget Period Closeout For {SavedValue:Automation Runtime Grant Award}" for title "Subject" inside table "{prdoh_tableId:PendingTask}"
    And I save the value from row "1" for column name "Created Date" as "createddate" from flex table "---prdoh_tableId:-:PendingTask---"
    Then I softly see column "Due Date" according to date "{SavedValue:createddate}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:closeoutEgmsid}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Closeout Type" as "Scheduled"

  @80912 @ValidateOverrideOpenItemsWithCreatedStatusReportsForBudgetPeriodCloseout @wip @BugLoggedWith81149 @smoke  @positive
  Scenario: verify Override Open Items With created Status Reports for Budget Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I enter value "0" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I see the header is "Closeout Title" in the page details
    And I navigate to "Open Items" sub tab
    Then I softly see the text containing :
      | Pending Progress Reports / Force Closed Reports  |
      | Pending Financial Reports / Force Closed Reports |
    Then I softly see value "Created" for title "Status" inside table "{prdoh_tableId:ProgressReportTableId}"
    Then I softly see value "Created" for title "Status" inside table "{prdoh_tableId:FinancialReportsOnAwards}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly can see row level action button "View" against "Created" in flex table with id "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    And I click on "Override Open Items" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to override and proceed with the closeout? The status of all open items will be changed to Forced Closed." is displayed
    And I click modal button "Yes"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:ProgressReportTableId}"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:FinancialReportsOnAwards}"

  @80912 @ValidateOverrideOpenItemsWithSubmittedForApprovalStatusReportsForBudgetPeriodCloseout @wip @BugLoggedWith81149  @positive
  Scenario: verify Override Open Items with submitted for approval status reports for Budget Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I enter value "0" into field "fieldReportDueDate__c"
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I see the header is "Closeout Title" in the page details
    And I navigate to "Open Items" sub tab
    Then I softly see the text containing :
      | Pending Progress Reports / Force Closed Reports  |
      | Pending Financial Reports / Force Closed Reports |
    Then I softly see value "Submitted for Approval" for title "Status" inside table "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see value "Submitted for Approval" for title "Status" inside table "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    Then I softly can see row level action button "View" against "Submitted for Approval" in flex table with id "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly can see row level action button "View" against "Submitted for Approval" in flex table with id "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    And I click on "Override Open Items" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to override and proceed with the closeout? The status of all open items will be changed to Forced Closed." is displayed
    And I click modal button "Yes"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"

  @80912 @ValidateOverrideOpenItemsWithApprovedStatusReportsForBudgetPeriodCloseout @wip @BugLoggedWith81149  @positive
  Scenario: verify Override Open Items with approved status reports for Budget Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I enter value "0" into field "fieldReportDueDate__c"
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I see the header is "Closeout Title" in the page details
    And I navigate to "Open Items" sub tab
    Then I softly see the text containing :
      | Pending Progress Reports / Force Closed Reports  |
      | Pending Financial Reports / Force Closed Reports |
    Then I softly see value "Approved" for title "Status" inside table "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see value "Approved" for title "Status" inside table "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    Then I softly can see row level action button "View" against "Approved" in flex table with id "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly can see row level action button "View" against "Approved" in flex table with id "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    And I click on "Override Open Items" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to override and proceed with the closeout? The status of all open items will be changed to Forced Closed." is displayed
    And I click modal button "Yes"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    And I click on "Override Open Items" in the page details
    Then I softly see the text containing :
      | No pending open items found. |

  @80912 @ValidateOverrideOpenItemsWithSubmittedToGrantorStatusReportsForBudgetPeriodCloseout @wip @BugLoggedWith81149   @positive
  Scenario: verify Override Open Items with Submitted to Grantor status reports for Budget Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    And I enter value "Yes" into field "fieldBudgetCloseoutrequestRequired__c"
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
    When I enter value "0" into field "fieldReportDueDate__c"
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I see the header is "Closeout Title" in the page details
    And I navigate to "Open Items" sub tab
    Then I softly see the text containing :
      | Pending Progress Reports / Force Closed Reports  |
      | Pending Financial Reports / Force Closed Reports |
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    Then I softly can see row level action button "View" against "Submitted to Grantor" in flex table with id "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly can see row level action button "View" against "Submitted to Grantor" in flex table with id "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    And I click on "Override Open Items" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to override and proceed with the closeout? The status of all open items will be changed to Forced Closed." is displayed
    And I click modal button "Yes"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSProgressReportID}" inside table "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSFinancialReportID}" inside table "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    And I navigate to "Monitoring" tab
    When I navigate to "{sidebar:ProgressReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:ProgressReports}" panel
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:ProgressReports}"
    When I navigate to "{sidebar:FinancialReportsLinkName}" content inside "{sidebar:MonitoringSubHeaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:FinancialReportsOnMonitoring}" panel
    Then I softly see value "Forced Closed" for title "Status" inside table "{prdoh_tableId:FinancialReportsOnMonitoring}"

  @80912 @ValidateOverrideOpenItemsForMultipleAwardsWithTwoDifferentBudgetPeriosdForBudgetPeriodCloseout @wip @BugLoggedWith81149  @positive
  Scenario: verify Override Open Items for multiple awards with two different budget periods for Budget Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | 10        | -730        | -365      |
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
    And I click on "View" icon for "{SavedValue:grantNumber}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:FinancialReportsOnAwards}"
    When I enter value "0" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I save the field containing "EGMS Financial Report ID" as "EGMSFinancialReportIDBP01"
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 20AUTON     | Amendment | {SavedValue:fainNumber} | Continuation  | -730        | 10        | -320        | -10       |
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
    When I enter value "0" into field "fieldReportDueDate__c"
    And I click on "Save" in the page details
    And I save the field containing "EGMS Financial Report ID" as "EGMSFinancialReportIDBP02"
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
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
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSProgressReportIDBP01}" inside table "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSProgressReportIDBP02}" inside table "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSFinancialReportIDBP01}" inside table "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    Then I softly see value "Forced Closed" for title "Status" against the value "{SavedValue:EGMSFinancialReportIDBP02}" inside table "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"

  @70875 @ValidatePermissionToViewOpenItemsSubTabForBudgetPeriodCloseout  @smoke  @positive
  Scenario Outline: verify permission to view Open Items sub-tab for budget period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    Then I softly can see "Open Items" sub tab at view detail page
    When I re-login as "<userType>" user on "default" portal
    And I navigate to "Closeout" tab
    When I navigate to "{sidebar:BudgetPeriodCloseoutLinkName}" content inside "{sidebar:CloseoutSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:BudgetPeriodCloseoutListTableId}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:BudgetPeriodCloseoutListTableId}"
    Then I softly can see "Open Items" sub tab at view detail page
    Examples:
      | userType |
      | EXE      |
      | Admin    |
      | PO       |
      | FD       |
      | FO       |
      | PM1      |

  @70875 @ValidatePendingProgressReportsSectionAndFinancialReportsSectionForBudgetPeriodCloseout  @positive
  Scenario: verify pending progress reports section and financial reports section for budget period closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -365        | 730       | -365        | -10       |
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:AwardbudgetperiodcloseoutTableId---"
    When I enter value "Termination" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Budget Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Open Items" sub tab
    Then I softly see "Progress Report EGMS ID" in flex table header "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see "Grant Award Number" in flex table header "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see "Amendment Number" in flex table header "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see "Reporting Period" in flex table header "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:PendingProgressReportForBudgetPeriod}"
    Then I softly see "Financial Report EGMS ID" in flex table header "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    Then I softly see "Grant Award Number" in flex table header "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    Then I softly see "Amendment Number" in flex table header "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    Then I softly see "Reporting Period" in flex table header "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:PendingFinancialReportForBudgetPeriod}"