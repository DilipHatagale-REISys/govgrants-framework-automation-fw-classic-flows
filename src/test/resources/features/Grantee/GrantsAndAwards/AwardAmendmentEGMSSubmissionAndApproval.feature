@AwardAmendmentEGMS @AwardAmendmentFromEGMSSubmissionAndApproval @regression @GrantsAwardsModule @parallel-regression
Feature: Award amendment through EGMS related scenarios
  Test all scenarios related to Award amendment and Amendment submitted for approval and amendment approval through EGMS scenarios

  @68018 @verifyPermissionAccessOfTopLevelButtonAtAmendmentRequest   @positive
  Scenario: Verify expected user is able to see New button at Amendment request page block at Active awards
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---prdoh_tableId:-:AmendmentsTableId---"

  @68018 @verifyFieldsDetailsOnAmendmentRequestCreationPage @smoke  @positive
  Scenario: Verify user is able to see expected fields details after clicking New button at Amendment request page block at Active awards
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    Then I softly see fields "fieldAmendmentNumber__c" is in edit mode
    Then I softly see fields "fieldInitiatedBy__c" is in edit mode
    Then I softly see fields "fieldAmendment_Type__c" is in edit mode
    Then I softly see fields "fieldJustification__c" is in edit mode
    Then I softly see fields "fieldOtherAmendmentTypeDetails__c" is in edit mode
    Then I softly see field "EGMS Award ID" as "{SavedValue:EID}"

  @68018 @verifyErrorMessageForRequiredFieldOnAmendmentRequestCreationPage
  Scenario: Verify user is able to see error message for required fields while saving amendment request without entering details
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    And I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Amendment Types is Required to save.               |
      | Initiated By is Required to save.                  |
      | Amendment Purpose and Summary is Required to save. |

  @68018 @verifyPickListValuesOnAmendmentRequestCreationPage   @positive
  Scenario: Verify user is able to see expected pick list dropdown values for fields Amendment types and Initiated by
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    Then I softly see "--None--:Internal:Grantor" inside selectbox field "fieldInitiatedBy__c"
    Then I softly see "Key Personnel Change:Scope of Work Change:Other" inside selectbox field "fieldAmendment_Type__c"

  @68018 @verifyHelpTextIconAtPickListFieldOnAmendmentRequestCreationPage  @positive
  Scenario Outline: Verify user is able to see help text message on hovering mouse on help text icon on Initiated By picklist field
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I hovering mouse on help text icon inside page block detail "Initiated By"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                      |
      | Indicates the organization requesting the amendment to the award. |

  @68018 @verifyCreationOfAmendmentRequest    @positive
  Scenario: Verify user is able to create amendment request with valid input data
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    Then I softly see value "{SavedValue:AwardEID}" for title "EGMS ID" inside table "{prdoh_tableId:AmendmentsTableId}"

  @68018 @verifyCreationOfAmendmentRequestWithAmendmentTypeOther  @positive
  Scenario: Verify user is able to create amendment request with Amendment type as Others
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Internal" into field "fieldInitiatedBy__c"
    When I enter value "Other" into field "fieldAmendment_Type__c"
    When I enter value "Enhancement Needed in Award" into field "fieldOtherAmendmentTypeDetails__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    Then I softly see value "{SavedValue:AwardEID}" for title "EGMS ID" inside table "{prdoh_tableId:AmendmentsTableId}"

  @68018 @verifyCreationOfAmendmentRequestWithMultipleCombinationOfAmendmentTypeAndInitiatedBy  @positive
  Scenario: Verify user is able to create amendment request with different combination of Amendment type and Initiated By picklist value
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    Then I softly see value "{SavedValue:AwardEID}" for title "EGMS ID" inside table "{prdoh_tableId:AmendmentsTableId}"

  @68024 @verifyRowLevelActionIconAtAmendmentListViewPage-Draft @smoke  @positive
  Scenario: Verify user is able to see row level action icon for create amendment request or in draft state Amendment request
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:AwardEID}" in flex table with id "---prdoh_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:AwardEID}" in flex table with id "---prdoh_tableId:-:AmendmentRequestTableId---"

  @68024 @verifyEditOfCreatedAmendedRequest @rowleveleditnotworking @buglogged77633 @smoke    @positive
  Scenario: Verify user is able to edit Amendment request which is in draft state
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Edit" in the page details
    When I enter value "Automation modification needed in Award 1" into field "fieldJustification__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Amendment Purpose and Summary" as "Automation modification needed in Award 1"

  @68024 @verifyAmendedRequestPageDetail @positive
  Scenario: Verify user is able to see expected details at Amendment request page details
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Edit" in the page details
    And I softly see the text containing :
      | General information  |
      | Award Description    |
      | Place of Performance |
      | Other Key Contacts   |
      | Other Changes        |
    Then I softly see fields "fieldOtherAmendmentTypeDetails__c" is in edit mode
    Then I softly see fields "fieldJustification__c" is in edit mode
    Then I softly see fields "fieldGrantAwardDescription__c" is in edit mode
    Then I softly see fields "fieldPlace_of_Performance__c" is in edit mode
    Then I softly see fields "fieldFederalTCLink__c" is in edit mode
    Then I softly see fields "fieldSeparateAttachmentT_C__c" is in edit mode
    Then I softly see fields "fieldOtherChangeDescription__c" is in edit mode
    Then I softly see field "EGMS Award ID" as "{SavedValue:EID}"
    Then I softly see field "Amendment Types" as "Key Personnel Change"
    Then I softly see field "Initiated By" as "Internal"

  @68024 @verifyAssociationKeyPerformanceIndicatorAtAmendedRequestPageDetail @smoke   @positive
  Scenario: Verify user is able to add KPI at Amendment request page details
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
    And I navigate to "Planning" tab
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---"
    And I refresh the page
    Then I softly see value "{SavedValue:Automation Runtime KPI}" for title "KPI Name" inside table "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"

  @68024 @verifyEditAndDeletionOfAssociatedKeyPerformanceIndicatorAtAmendedRequestPageDetail   @positive
  Scenario: Verify user is able to edit and delete associated KPI at Amendment request page details
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
    And I navigate to "Planning" tab
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---"
    And I refresh the page
    And I click on "Edit" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    Then I softly see fields "Actual__c" is in edit mode
    Then I softly see fields "ActualDate__c" is in edit mode
    Then I softly see fields "Target__c" is in edit mode
    And I click on "Undo" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    And I click on "Delete" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"

  @68024 @verifyAssociationDeletionOfObjectiveAtAmendedRequestPageDetail   @positive
  Scenario: Verify user is able to associate and delete objective at Amendment request page details
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
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentObjectiveTableId---"
    And I perform quick search for "Automation Objective" in "---prdoh_tableId:-:AmendmentObjectiveAssociationmodalTableId---" panel
    When I click "Save" after selection of "Automation Objective" in the table "---prdoh_tableId:-:AmendmentObjectiveAssociationmodalTableId---"
    And I refresh the page
    Then I softly see value "Automation Objective" for title "Objective" inside table "---prdoh_tableId:-:AmendmentObjectiveTableId---"
    And I click on "Delete" icon for "Automation Objective" inside flex table with id "---prdoh_tableId:-:AmendmentObjectiveTableId---"
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AmendmentObjectiveTableId---"

  @68024 @verifyAssociationOfKeyContactAtAmendedRequestPageDetail @smoke   @positive
  Scenario: Verify user is able to associate key contacts at Amendment request page details
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    When I enter value "Automation PM" into field "fieldContact__c"
    When I enter value "Project Officer" into field "fieldRole__c"
    When I enter value "checked" into field "fieldKeyContact__c"
    And I click modal button "Save"
    Then I softly see value "Automation PM" for title "Name" inside table "---prdoh_tableId:-:AmendmentKeyContactsTableId---"

  @68024 @verifyEditAndDeleteOfKeyContactAtAmendedRequestPageDetail   @positive
  Scenario: Verify user is able to edit and delete the associated key contacts at Amendment request page details
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    When I enter value "Automation PM" into field "fieldContact__c"
    When I enter value "Project Officer" into field "fieldRole__c"
    When I enter value "checked" into field "fieldKeyContact__c"
    And I click modal button "Save"
    Then I softly see value "Automation PM" for title "Name" inside table "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    And I click on "Edit" icon for "Automation PM" inside flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    When I enter value "Grants Management Specialist" into field "Role__c"
    And I click on top right button "Save" in flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    Then I softly see value "Grants Management Specialist" for title "Role" inside table "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    And I click on "Delete" icon for "Automation PM" inside flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"

  @68024 @verifyAssociationOfSpecialConditionAtAmendedRequestPageDetail   @positive
  Scenario: Verify user is able to associate special condition at Amendment request page details
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on top right button "New" in flex table with id "---prdoh_tableId:-:AmendmentSpecialConditionTableId---"
    And I enter in modal value "Automation Amendment Special Conditions" into field "fieldTitle__c"
    And I enter in modal value "Automation Amendment Special Conditions description" into field "cke_1_contents"
    And I enter in modal value "0" into field "fieldEffectiveFrom__c"
    And I enter in modal value "1" into field "fieldEffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    Then I softly see value "Automation Amendment Special Conditions" for title "Name" inside table "---prdoh_tableId:-:AmendmentSpecialConditionTableId---"

  @68278 @verifyPermissionOfInternalUsersToViewAtAmendmentListViewPage-Draft @smoke   @positive
  Scenario Outline: Verify expected user is able to see amendment inside Amendment request list page
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    And I re-login as "<userType>" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" inside table "---prdoh_tableId:-:AmendmentRequestTableId---"

    Examples:
      | userType |
      | ADMIN    |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @68278 @validateConfirmationMessageOnRecordDeletionAtAmendmentListViewPage-Draft   @positive
  Scenario: Verify confirmation message on deletion of manually created amendment request inside Amendment request list page
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    And I re-login as "<userType>" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    When I click on "Delete" icon for "{SavedValue:AwardEID}" inside table with table id "{prdoh_tableId:AmendmentRequestTableId}" without processing
    Then I see confirmation box with body "Are you sure you want to permanently delete the draft amendment request?" is displayed

  @68278 @validateDeletionWithConfirmationBoxOptionAtAmendmentListViewPage-Draft  @positive
  Scenario: Verify user is able to delete created amendment using confirmation box option as yes inside Amendment request list page
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    When I click on "Delete" icon for "{SavedValue:AwardEID}" inside table with table id "{prdoh_tableId:AmendmentRequestTableId}" without processing
    Then I see confirmation box with body "Are you sure you want to permanently delete the draft amendment request?" is displayed
    When I click modal button "Yes"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"

  @68278 @validateEditFunctionalityOfAmendmentAtAmendmentListViewPage-Draft @smoke   @positive
  Scenario: Verify user is able to edit created amendment from amendment list view page
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    Then I softly see field "Status" as "Created"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    When I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Edit" in the page details
    When I enter value "Edit check at amendment" into field "fieldJustification__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Amendment Purpose and Summary" as "Edit check at amendment"

  @68278 @ValidateColumnsAvailable-AllListViewAtAmendmentListViewPage @smoke  @positive
  Scenario Outline: verify columns should get displayed in Amendment request-All table
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see "Amendment Number" in flex table header "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see "Award Title" in flex table header "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see "Amendment Types" in flex table header "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see "Initiated By" in flex table header "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see "Created By" in flex table header "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see "Created On" in flex table header "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:AmendmentRequestTableId}"

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @68278 @validateColumnsValuesAtAmendmentListViewPage-Draft @smoke   @positive
  Scenario: Verify user is able to see values for each colums at amendment list view page
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    And I save the field labeled "Amendment Number" as "AMENDMENTNUMBER"
    And I save the field labeled "Amendment Types" as "AMENDMENTTYPES"
    And I save the field labeled "Initiated By" as "INITIATEDBY"
    Then I softly see field "Status" as "Created"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I softly see value "{SavedValue:AwardEID}" for title "EGMS ID" inside table "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see value "{SavedValue:AMENDMENTNUMBER}" for title "Amendment Number" inside table "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" inside table "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see value "{SavedValue:AMENDMENTTYPES}" for title "Amendment Types" inside table "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see value "{SavedValue:INITIATEDBY}" for title "Initiated By" inside table "{prdoh_tableId:AmendmentRequestTableId}"

  @68278 @verifyListViewOptionsAtAmendmentRequest-AllTable @smoke    @positive
  Scenario Outline: Verify all options of list at Amendment Request - All table is displayed
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I pause execution for "3" seconds
    Then I softly see "Amendment Requests - All" inside list view option of table "#GranteeAmendmentRequestsFlexToggle"
    Then I softly see "Amendment Requests - Draft" inside list view option of table "#GranteeAmendmentRequestsFlexToggle"
    Then I softly see "Amendment Requests - Submitted" inside list view option of table "#GranteeAmendmentRequestsFlexToggle"
    Then I softly see "Amendment Requests - Accepted" inside list view option of table "#GranteeAmendmentRequestsFlexToggle"

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @68278 @verifyDefaultListViewAtAmendmentRequest @smoke   @positive
  Scenario: Verify default list view at Amendment Request-All is selected
    Given I login as "PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    Then I see "Amendment Requests - All" is selected at program flex table

  @68278 @verifyListViewShowAllStatusRecordAtAmendmentRequestListView @smoke   @positive
  Scenario: Verify records having status Draft Active is shown for Amendment Request - All list view
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Draft"
    And I pause execution for "3" seconds
    Then I softly see "Created" value in flex table id "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see "Submitted for Approval" value in flex table id "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see "Rejected" value in flex table id "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see "Approved" value in flex table id "{prdoh_tableId:AmendmentRequestTableId}"
    And I refresh the page
    And I click toggle button to select "Amendment Requests - Submitted"
    And I pause execution for "3" seconds
    Then I softly see "Submitted to Grantor" value in flex table id "{prdoh_tableId:AmendmentRequestTableId}"
    And I refresh the page
    And I click toggle button to select "Amendment Requests - Accepted"
    And I pause execution for "3" seconds
    Then I softly see "	Accepted" value in flex table id "{prdoh_tableId:AmendmentRequestTableId}"

  @68278 @verifyQuickSearchFunctionalityAtAmendmentRequestTable @smoke    @positive
  Scenario: Verify user is able to perform quick search according to available column content at amendment request table
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    And I save the field labeled "Amendment Number" as "AMENDMENTNUMBER"
    And I save the field labeled "Amendment Types" as "AMENDMENTTYPES"
    And I save the field labeled "Initiated By" as "INITIATEDBY"
    Then I softly see field "Status" as "Created"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I softly see value "{SavedValue:AwardEID}" for title "EGMS ID" inside table "{prdoh_tableId:AmendmentRequestTableId}"
    And I refresh the page
    When I perform quick search for "Invalid{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I see "No Records Found" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" inside table "{prdoh_tableId:AmendmentRequestTableId}"
    And I refresh the page
    When I perform quick search for "Invalid{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I see "No Records Found" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"

  @68278 @validateAdvanceSearchIsWorkingOrNotAtAmendmentRequestTable      @positive
  Scenario: Validate advance search is working or not for correct and incorrect value at Amendment Request table
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "{prdoh_tableId:AmendmentsTableId}"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    When I enter value "Grantor" into field "fieldInitiatedBy__c"
    When I enter value "Scope of Work Change" into field "fieldAmendment_Type__c"
    When I enter value "Automation modification needed in Award" into field "fieldJustification__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEID"
    And I save the field labeled "Amendment Number" as "AMENDMENTNUMBER"
    And I save the field labeled "Amendment Types" as "AMENDMENTTYPES"
    And I save the field labeled "Initiated By" as "INITIATEDBY"
    Then I softly see field "Status" as "Created"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    When I click on advance filter "#advfGranteeAmendmentRequests" of table id "{prdoh_tableId:AmendmentRequestTableId}"
    When I enter advance filter values inside id "advfGranteeAmendmentRequests"
      | EGMS ID | contains | {SavedValue:AwardEID} |
    Then I softly see value "{SavedValue:AwardEID}" for title "EGMS ID" inside table "{prdoh_tableId:AmendmentRequestTableId}"
    And I refresh the page
    When I click on advance filter "#advfGranteeAmendmentRequests" of table id "{prdoh_tableId:AmendmentRequestTableId}"
    When I enter advance filter values inside id "advfGranteeAmendmentRequests"
      | Initiated By | equals to | {SavedValue:INITIATEDBY} |
    Then I softly see value "{SavedValue:INITIATEDBY}" for title "Initiated By" inside table "{prdoh_tableId:AmendmentRequestTableId}"

  @68278 @validateRefreshOptionsAtAmendmentRequestTable @smoke     @positive
  Scenario: Validate Refresh option at Amendment Request - All table is working or not
    Given I login as "PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I click on parallel lines menu bar with data target value "#GranteeAmendmentRequestsFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Amendment Requests - All"
    Then I see table is refreshing

  @68037 @verifyAdditionDeletionOfAttachmentAtAmendedRequestPageDetail @smoke    @positive
  Scenario: Verify user is able to add and delete attachments at Amendment request page details
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Attachments" sub tab
    And I upload attachment "AttachmentTesting.pdf" of type "Workplan"
    And I refresh the page
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"
    When I click on "Delete" icon for "AttachmentTesting.pdf" inside table
    When I close alertbox
    Then I softly do not see table with header "Attachments" contains records "AttachmentTesting.pdf"

  @68037 @verifyAttachmentTypesOnAddAttachmentModalAtAmendedRequestPageDetail   @positive
  Scenario: Verify user is able to see attachment types at Amendment request page details
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Attachments" sub tab
    When I click on "AddAttachments" button inside attachments page block
    Then I see "Workplan:Progress Report:Budget Narrative:Renewal Application:SF-424A:SF-424B:Performance Measure Report:Other" inside Type selectbox

  @73836 @verifyAdditionDeletionOfNotesAtAmendedRequestPageDetail @smoke     @positive
  Scenario: Verify user is able to add and delete notes at Amendment request page details
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Attachments" sub tab
    And I add notes records
    And I close "Add Notes" modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Automation Notes"
    When I click on "Delete" icon for "Automation Notes" inside table
    When I close alertbox
    Then I softly do not see table with header "Notes" contains records "Automation Notes"

  @73836 @verifyErrorMessageOnAddingNotesAtAmendedRequestPageDetail
  Scenario: Verify user is able to see error message while adding notes without entering required fields details at Amendment request page details
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Attachments" sub tab
    When I click on "Add" button inside attachments page block
    When I click modal button "Save"
    When I pause execution for "3" seconds
    Then I see the following messages in the page details :
      | Please enter Required fields |

  @68192 @verifyAssigningApproverAtAmendedRequestPageDetail @smoke    @positive
  Scenario: Verify user is able to assign approver for Amendment request page details
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    Then I softly see value "Automation Admin" for title "Name" inside table "---prdoh_tableId:-:AmendmentApproverRolesTableId---"

  @68192 @verifyApproverQuickSearchWithValidInvalidDataAtAmendedRequestPageDetail    @positive
  Scenario: Verify user is able to search added approver with valid name and vice versa
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I perform quick search for "Automation Admin" in "---prdoh_tableId:-:AmendmentApproverRolesTableId---" panel
    Then I softly see value "Automation Admin" for title "Name" inside table "---prdoh_tableId:-:AmendmentApproverRolesTableId---"
    And I perform quick search for "Invalid Input" in "---prdoh_tableId:-:AmendmentApproverRolesTableId---" panel
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---"

  @68192 @verifyErrorMessageOnAssigningApproverAtAmendedRequestPageDetail
  Scenario: Verify user is able to see error message while assigning approver without details at amendment request
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---"
    And I click on top right button "Save" in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---"
    Then I see the following messages in the page details :
      | Required Field Missing |

  @68192 @verifyEditOfAssignedApproverAtAmendedRequestPageDetail   @positive
  Scenario: Verify user is able to edit already assigned approvers under Approver page block of roles sub tab at amendment request
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description       |
      | Program Approver | Automation Admin | Approval required |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                  |
      | Program Approver | Automation PM | Automation Approval required |
    And I perform quick search for "Automation Approval required" in "---prdoh_tableId:-:AmendmentApproverRolesTableId---" panel
    Then I softly see value "Automation PM" for title "Name" inside table "---prdoh_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see value "Automation Approval required" for title "Description" inside table "---prdoh_tableId:-:AmendmentApproverRolesTableId---"

  @68192 @verifyAddNameInApproverNameFieldWithValidDataAtAmendedRequestPageDetail   @positive
  Scenario: Verify user is able to input valid data and see the search result at amendment request
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---"
    And I enter value "Automation Admin" into field "Name__c"
    And I pause execution for "4" seconds
    Then I softly see "Automation Admin" inside auto search result
    And I refresh the page
    And I click on "Edit" icon for "Program Approver" inside flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---"
    And I enter value "Invalid" into field "Name__c"
    And I pause execution for "4" seconds
    Then I softly see "No matches found" inside auto search result

  @68192 @verifyRowAndTopLevelActionOfApproverAtAmendedRequestPageDetail   @positive
  Scenario: Verify user is able to see top level save button and row level edit icon under Approver at amendment request
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    Then I softly can see row level action button "Edit" against "Program Approver" in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---"
    And I click on "Edit" icon for "Program Approver" inside flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly can see top right button "Save" in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---"

  @68202 @verifyVisibilityOfSubmitForApprovalActionAtAmendedRequestPageDetail
  Scenario Outline: Verify PI user/Non PI user is able to see/do not submit for approval button in the detail page at amendment request
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly can see top right button "Submit For Approval" in page detail
    And I re-login as "<userType>" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Amendments" sub tab
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly cannot see top right button "Submit For Approval" in page detail

    Examples:
      | userType |
      | ADMIN    |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @68202 @verifyRequiredFieldErrorMessageOnAmendedRequestSubmitForApproval
  Scenario: Verify user is able to see error message for required fields on submission of amendment request for approval
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit For Approval" in the page details
    Then I see the following messages in the page details :
      | Roles Tab : You must enter a value for Program Approver. |

  @68202 @verifySubmissionOfAmendmentRequestForApproval @smoke    @positive
  Scenario: Verify user is able to submit amendment request for approval
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"

  @68202 @verifySubmitForApprovalActionAtAmendmentAward-submittedForApproval
  Scenario: Verify user is not able to see submit for approval button at amendment request detail page when status is in submitted for approval
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly cannot see top right button "Submit For Approval" in page detail

  @68279 @verifyVisibilityOfAmendmentRequestApprovalDecisionBox   @positive
  Scenario: Verify user is able to see all expected approval decision box at amendment request approval detail page
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reassign | Send to Owner | Reject |

  @68279 @verifyAmendmentRequestApprovalFunctionalityWithApproveAction  @positive
  Scenario: Verify user is able to submit/Approve Amendment request successfully while selecting Approve action
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"

  @68279 @verifyAmendmentRequestApprovalFunctionalityWithReassign   @positive
  Scenario: Verify user is able to Reassign Amendment Request to any of internal users While selecting Reassign option from Approval decision box
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
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I "Reassign" to user "Automation PM" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"

  @68383 @verifySubmitToGrantorButtonAtApprovedAmendmentRequest   @positive
  Scenario: Verify user is able to see submit to grantor button on approved amendment request detail page
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly can see top right button "Submit To Grantor" in page detail

  @68383 @verifySubmitToGrantorModalTitleAtApprovedAmendmentRequest  @positive
  Scenario: Verify user is able to see modal title as same as Award name on submit to grantor button click
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    Then I see "Amendment Request - Automation Runtime Grant Award 1" displayed in modal

  @68383 @verifyErrorMessageForRequiredFieldOnSubmitToGrantor
  Scenario: Verify user is able to see error message for required fields after submitting approved amended award to grantor
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    Then I see the following messages in the page details :
      | Submitted to Grantor On is Required to save. |

  @68383 @verifySubmissionOfAmendmentRequestToGrantor     @positive
  Scenario: Verify user is able to submit Approved amendment request to grantor
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I save the field labeled "Date/Time Submitted to Grantor" as "AMENDMENTSUBMISSIONTOGRANTORDATE"
    Then I softly see field "Date/Time Submitted to Grantor" as "{SavedValue:AMENDMENTSUBMISSIONTOGRANTORDATE}"
    Then I softly see field "Status" as "Submitted to Grantor"

  @68383 @verifySubmittedAmendmentRequestAtAmendmentRequestListView @smoke   @positive
  Scenario: Verify user is able to see submitted amendment request inside Amendment Request list view
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Submitted"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I softly see value "{SavedValue:AwardEID}" for title "EGMS ID" inside table "{prdoh_tableId:AmendmentRequestTableId}"

  @68383 @verifyvisibilityOfButtonsAmendmentRequestPageDetails-SubmittedToGrantor  @positive
  Scenario: Verify user is able to see Revice Amendment and Record Grantor Decision buttons on page details of submitted Amendment request
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    Then I softly can see top right button "Revise Amendment" in page detail
    Then I softly can see top right button "Record Grantor Decision" in page detail

  @68383 @verifyFieldHistorySectionWithAmendmentRequestStatus-SubmittedToGrantor   @positive
  Scenario: Verify user is able to see details of submitted Amendment request inside history sub tab
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I navigate to "History" sub tab
    Then I softly see value "{SavedValue:AwardEID}" for title "EGMS ID" inside table "History"
    Then I softly see value "SubmittedToGrantor" for title "Changed Field" inside table "History"

  @68383 @verifyTakeSnapshotFunctionalityAtAmendmentRequestStatus-SubmittedToGrantor @smoke   @positive
  Scenario: Verify user is able to see details of submitted Amendment request inside history sub tab
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I navigate to "History" sub tab
    When I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    And I refresh the page
    When I navigate to "History" sub tab
    Then I see take snap shot getting saved with "Todays Date"

  @68375 @verifyFunctionalityOfReviseAmendmentButton    @positive
  Scenario: Verify user is able to revise the amendment after clicking on revise amendment button
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    Then I softly see field "Status" as "Created"

  @68375 @verifyConfirmationMessageOnReviseAmendment @smoke   @positive
  Scenario: Verify user is able to see confirmation message coming while revise the amendment after clicking on revise amendment button
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details without processing
    Then I see confirmation box with body "Are you sure you want to revise the amendment request? The amendment request will require an approval again after being revised" is displayed

  @68375 @verifyVisibilityOfButtonsOnReviseAmendmentDetailPage   @positive
  Scenario: Verify user is able to see Edit validate and submit for approval buttons on revise amendment detail page
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail

  @68375 @verifyRequiredFieldsErrorMessageOnReviseAmendmentDetailPage @wip
  Scenario: Verify user is able to see error message for required field after clicking on save button without entering fields values on revise amendment detail page
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I click on "Edit" in the page details
    And I click on "Save and Continue" in the page details
    Then I see the following messages in the page details :
      | Required Field Missing |

  @68375 @verifyEditOfDetailsOnReviseAmendmentDetailPage   @positive
  Scenario: Verify user is able to edit details of revise amendment on detail page
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation modification needed for revise amendment" into field "fieldJustification__c"
    When I enter value "Automation Description for revise amendment" into field "fieldGrantAwardDescription__c"
    When I enter value "Virginia" into field "fieldPlace_of_Performance__c"
    When I enter value "www.google.com" into field "fieldFederalTCLink__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Amendment Purpose and Summary" as "Automation modification needed for revise amendment"
    Then I softly see field "Award Description" as "Automation Description for revise amendment"
    Then I softly see field "Location" as "Virginia"
    Then I softly see field "Terms and Conditions Link" as "www.google.com"

  @68375 @verifyAssociationKeyPerformanceIndicatorAtReviseAmendmentDetailPage   @positive
  Scenario: Verify user is able to add KPI at Amendment revise page details
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
    And I navigate to "Planning" tab
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---"
    And I refresh the page
    Then I softly see value "{SavedValue:Automation Runtime KPI}" for title "KPI Name" inside table "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"

  @68375 @verifyEditAndDeletionOfAssociatedKeyPerformanceIndicatorAtReviseAmendmentDetailPage   @positive
  Scenario: Verify user is able to edit and delete associated KPI at Amendment revise page details
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
    And I navigate to "Planning" tab
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
    And I perform quick search for "{SavedValue:KPID}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:KPID}" inside table
    And I click on "Activate" in the page details
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---"
    And I refresh the page
    And I click on "Edit" icon for "Automation KPI" inside flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    When I enter value "10" into field "Actual__c"
    When I enter value "0" into field "ActualDate__c"
    When I enter value "10" into field "Target__c"
    And I click on top right button "Save" in flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    Then I softly see value "10" for title "Current Value" inside table "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    Then I softly see value "10" for title "Target Value" inside table "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    And I click on "Delete" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"

  @68375 @verifyAssociationDeletionOfObjectiveAtReviseAmendmentDetailPage    @positive
  Scenario: Verify user is able to associate and delete objective at Amendment revise page details
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
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentObjectiveTableId---"
    And I perform quick search for "Automation Objective" in "---prdoh_tableId:-:AmendmentObjectiveAssociationmodalTableId---" panel
    When I click "Save" after selection of "Automation Objective" in the table "---prdoh_tableId:-:AmendmentObjectiveAssociationmodalTableId---"
    And I refresh the page
    Then I softly see value "Automation Objective" for title "Objective" inside table "---prdoh_tableId:-:AmendmentObjectiveTableId---"
    And I click on "Delete" icon for "Automation Objective" inside flex table with id "---prdoh_tableId:-:AmendmentObjectiveTableId---"
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AmendmentObjectiveTableId---"

  @68375 @verifyAssociationOfKeyContactAtReviseAmendmentDetailPage   @positive
  Scenario: Verify user is able to associate key contacts at Amendment revise page details
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    When I enter value "Automation PM" into field "fieldContact__c"
    When I enter value "Project Officer" into field "fieldRole__c"
    When I enter value "checked" into field "fieldKeyContact__c"
    And I click modal button "Save"
    Then I softly see value "Automation PM" for title "Name" inside table "---prdoh_tableId:-:AmendmentKeyContactsTableId---"

  @68375 @verifyEditAndDeleteOfKeyContactAtReviseAmendmentDetailPage  @positive
  Scenario: Verify user is able to edit and delete the associated key contacts at Amendment revise page details
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    When I enter value "Automation PM" into field "fieldContact__c"
    When I enter value "Project Officer" into field "fieldRole__c"
    When I enter value "checked" into field "fieldKeyContact__c"
    And I click modal button "Save"
    Then I softly see value "Automation PM" for title "Name" inside table "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    And I click on "Edit" icon for "Automation PM" inside flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    When I enter value "Grants Management Specialist" into field "Role__c"
    And I click on top right button "Save" in flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    Then I softly see value "Grants Management Specialist" for title "Role" inside table "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    And I click on "Delete" icon for "Automation PM" inside flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"

  @68375 @verifyAssociationOfSpecialConditionAtReviseAmendmentDetailPage @smoke  @positive
  Scenario: Verify user is able to associate special condition at Amendment revise page details
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I click on top right button "New" in flex table with id "---prdoh_tableId:-:AmendmentSpecialConditionTableId---"
    And I enter in modal value "Automation Amendment Special Conditions" into field "fieldTitle__c"
    And I enter in modal value "Automation Amendment Special Conditions description" into field "cke_1_contents"
    And I enter in modal value "0" into field "fieldEffectiveFrom__c"
    And I enter in modal value "1" into field "fieldEffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    Then I softly see value "Automation Amendment Special Conditions" for title "Name" inside table "---prdoh_tableId:-:AmendmentSpecialConditionTableId---"

  @68375 @verifyAdditionDeletionOfAttachmentAtReviseAmendmentDetailPage  @positive
  Scenario: Verify user is able to add and delete attachments at Amendment revise page details
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I navigate to "Attachments" sub tab
    And I upload attachment "AttachmentTesting.pdf" of type "Workplan"
    And I refresh the page
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"
    When I click on "Delete" icon for "AttachmentTesting.pdf" inside table
    When I close alertbox
    Then I softly do not see table with header "Attachments" contains records "AttachmentTesting.pdf"

  @68375 @verifyEditApproverDetailsAtReviseAmendmentDetailPage  @positive
  Scenario: Verify user is able to edit or modify approver details of Amendment revise
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                  |
      | Program Approver | Automation PM | Automation Approval required |
    Then I softly see value "Automation PM" for title "Name" inside table "---prdoh_tableId:-:AmendmentApproverRolesTableId---"

  @68375 @verifySubmissionOfAmendmentRevise    @positive
  Scenario: Verify user is able to submit Revise amendment for approval
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"

  @68375 @verifyApprovalOfAmendmentRevise   @positive
  Scenario: Verify user is able to submit Revise amendment for approval
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Revise Amendment" in the page details
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "AMENDMENTREVISESUBMISSION"
    Then I softly see field "Status" as "Submitted for Approval"
    And I re-login as "ADMIN" user on "default" portal
    And I navigate to "HOME" tab
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AMENDMENTREVISESUBMISSION}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AMENDMENTREVISESUBMISSION}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AMENDMENTREVISESUBMISSION}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AMENDMENTREVISESUBMISSION}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Submit To Grantor" in page detail

  @68384 @verifyRecordingDecisionAmendmentDetailPageAndErrorMessageForRequiredField
  Scenario: Verify user is able to see fields details on recording decision detail page and error message for required fields on save
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Record Grantor Decision" in the page details
    Then I softly see fields "fieldDecision__c" is in edit mode
    Then I softly see fields "fieldAmendmentNumber__c" is in edit mode
    Then I softly see fields "fieldNOASubAccountNumber__c" is in edit mode
    Then I softly see fields "fieldNOADocumentID__c" is in edit mode
    Then I softly see fields "fieldAwardIssueDate__c" is in edit mode
    Then I softly see fields "fieldAdditionalDetails__c" is in edit mode
    Then I see "Amendment Request - Automation Runtime Grant Award 1" displayed in modal
    And I click modal button "Save"
    And I click modal button "Save"
    Then I see the following messages in the page details :
      | Decision is Required to save. |

  @68384 @verifyRecordingDecisionFunctionalityWithDecisionAsAccepted  @positive
  Scenario: Verify user is able to perform functionality of Record Decision while filling details with decision as accepted
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    Then I softly see field "Decision" as "Accepted"
    And I refresh the page
    Then I softly can see top right button "Activate Amended Award" in page detail

  @68384 @verifyRecordingDecisionFunctionalityWithDecisionAsNotAccepted  @positive
  Scenario: Verify user is able to perform functionality of Record Decision while filling details with decision as not accepted
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Record Grantor Decision" in the page details
    When I enter value "Not Accepted" into field "fieldDecision__c"
    When I enter value "RDSUBAccNumber-01" into field "fieldNOASubAccountNumber__c"
    When I enter value "RD-01" into field "fieldNOADocumentID__c"
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "Automation check with record decision as accepted" into field "fieldAdditionalDetails__c"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    And I click modal button "Save"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    Then I softly see field "Decision" as "Not Accepted"
    And I refresh the page
    Then I softly cannot see top right button "Activate Amended Award" in page detail

  @68384 @verifyAmendmentListViewWithAcceptedRecordingDecisionRecords @smoke   @positive
  Scenario: Verify user is able to see accepted record decision records inside amendment requests list view
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I save the field labeled "EGMS ID" as "ACCEPTEDRECORDDECISION"
    And I refresh the page
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:ACCEPTEDRECORDDECISION}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I softly see value "{SavedValue:ACCEPTEDRECORDDECISION}" for title "EGMS ID" inside table "{prdoh_tableId:AmendmentRequestTableId}"

  @68384 @verifyAmendmentListViewWithNotAcceptedRecordingDecisionRecords  @positive
  Scenario: Verify user is able to see not accepted record decision records inside amendment requests list view
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Submit To Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedToGrantor__c"
    And I click modal button "Save"
    And I click on "Record Grantor Decision" in the page details
    When I enter value "Not Accepted" into field "fieldDecision__c"
    When I enter value "RDSUBAccNumber-01" into field "fieldNOASubAccountNumber__c"
    When I enter value "RD-01" into field "fieldNOADocumentID__c"
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "Automation check with record decision as accepted" into field "fieldAdditionalDetails__c"
    When I enter value "10" into field "fieldAmendmentNumber__c"
    And I click modal button "Save"
    And I click modal button "Save"
    And I save the field labeled "EGMS ID" as "NOTACCEPTEDRECORDDECISION"
    And I refresh the page
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Submitted"
    And I perform quick search for "{SavedValue:NOTACCEPTEDRECORDDECISION}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    Then I softly see value "{SavedValue:NOTACCEPTEDRECORDDECISION}" for title "EGMS ID" inside table "{prdoh_tableId:AmendmentRequestTableId}"

  @68374 @verifyActivateAmendedAwardFunctionalityWithProgressBarStatus @smoke  @positive
  Scenario: Verify user is able to Activate Amended Award and progress bar status is green and active
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    Then I softly see field "Decision" as "Accepted"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "Green"

  @68374 @verifyNewlyCreatedAwardAfterActivateAmendedAward    @positive
  Scenario: Verify user is able to see newly created award inside award list view after Activate Amended Award
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    Then I softly see field "Decision" as "Accepted"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - Active"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly see value "{SavedValue:Automation Runtime Grant Award}" for title "Award Title" inside table "{prdoh_tableId:AwardsTable}"

  @68374 @verifyStatusOfAwardAtRelatedGrantListVIewPage   @positive
  Scenario: Verify user is able to see both Amended Award and Active Award inside related grant
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    Then I softly see field "Decision" as "Accepted"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Amended" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    Then I softly see value "Amended" for title "Status" inside table "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    Then I softly see value "Active" for title "Status" inside table "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"

  @68374 @verifyOverviewDetailsCopiedToNewAward @buglogged79639   @positive
  Scenario: Verify user is able to see expected details are getting copied from amended award to newly created award
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on "Edit" in the page details
    When I enter value "Automation justification value check for new award" into field "fieldJustification__c"
    When I enter value "Automation data check for new award" into field "fieldOtherAmendmentTypeDetails__c"
    When I enter value "www.google.com" into field "fieldFederalTCLink__c"
    When I enter value "Yes" into field "fieldSeparateAttachmentT_C__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "Amendment Number" as "AMENDMENTNUMBER"
    And I save the field labeled "If Other amendment type, explain" as "OTHERAMENDMENTTYPE"
    And I save the field labeled "Separate Attachment for Terms and Conditions?" as "TERMSANDCONDITIONS"
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyContactsTableId---"
    When I enter value "Automation PM" into field "fieldContact__c"
    When I enter value "Project Officer" into field "fieldRole__c"
    When I enter value "checked" into field "fieldKeyContact__c"
    And I click modal button "Save"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:APPROVEDAMENDMENTREQUESTID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:APPROVEDAMENDMENTREQUESTID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
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
    Then I softly see field "Decision" as "Accepted"
    And I save the field labeled "NOA Sub-Account Number" as "NOASUBACCOUNTNUMBER"
    And I save the field labeled "NOA Document ID" as "NOADOCUMENTID"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Overview" sub tab
    Then I softly see field "Amendment Number" as "{SavedValue:AMENDMENTNUMBER}"
    Then I softly see field "Separate Attachment for Terms and Conditions?" as "{SavedValue:TERMSANDCONDITIONS}"
    Then I softly see field "NOA Sub-Account Number" as "{SavedValue:NOASUBACCOUNTNUMBER}"
    Then I softly see field "NOA Document ID" as "{SavedValue:NOADOCUMENTID}"
    Then I softly see value "Automation PM" for title "Name" inside table "---prdoh_tableId:-:AmendmentKeyContactsTableId---"

  @68374 @verifyAssociatedKPIAtAmendedAwardCopiedToActivatedAwardFromUI  @positive
  Scenario: Verify user is able to see associated KPI at amended award is getting copied to UI activated award
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
    And I navigate to "Planning" tab
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---"
    And I refresh the page
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:APPROVEDAMENDMENTREQUESTID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:APPROVEDAMENDMENTREQUESTID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
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
    Then I softly see field "Decision" as "Accepted"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:Automation Runtime KPI}" for title "KPI Title" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

  @68374 @verifyBudgetPeriodDetailsAtAmendedAwardCopiedToActivatedAwardFromUI @buglogged79954  @positive
  Scenario: Verify user is able to see budget period details at amended award is getting copied to UI activated award
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Budget" sub tab
    And I save the field labeled "Budget Period Start Date" as "BPSD"
    And I save the field labeled "Budget Period End Date" as "BPED"
    And I save the field labeled "Award to Date (Budget Period)" as "AwardToDate"
    And I save the field labeled "Carry-Forward this Action" as "CarryForwarded"
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
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    Then I softly see field "Decision" as "Accepted"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BPSD}"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BPED}"
    Then I softly see field "Award to Date (Budget Period)" as "{SavedValue:AwardToDate}"
    Then I softly see field "Carry-Forward this Action" as "{SavedValue:CarryForwarded}"
    Then I softly see field "Awarded Amount this Action" as "$0.00"

  @68374 @verifyModifiedAssociatedKPIAtAmendedAwardCopiedToActivatedAwardFromUI  @positive
  Scenario: Verify user is able to see modification in associated KPI at amended award is getting copied to UI activated award
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
    And I navigate to "Planning" tab
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AmendmentKPIAssociationmodalTableId---"
    And I refresh the page
    And I click on "Edit" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    When I enter value "10" into field "Actual__c"
    When I enter value "15" into field "Target__c"
    And I click on top right button "Save" in flex table with id "---prdoh_tableId:-:AmendmentKeyPerformanceIndicatorTableId---"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:APPROVEDAMENDMENTREQUESTID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:APPROVEDAMENDMENTREQUESTID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
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
    Then I softly see field "Decision" as "Accepted"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:Automation Runtime KPI}" for title "KPI Title" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see value "10" for title "Current Value" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see value "15" for title "Target Value" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

  @68374 @verifyAssociatedObjectiveCopiedToActivatedAwardFromUI   @positive
  Scenario: Verify user is able to see associated objective at amended award is getting copied to UI activated award
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
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:AmendmentObjectiveTableId---"
    And I perform quick search for "Automation Objective" in "---prdoh_tableId:-:AmendmentObjectiveAssociationmodalTableId---" panel
    When I click "Save" after selection of "Automation Objective" in the table "---prdoh_tableId:-:AmendmentObjectiveAssociationmodalTableId---"
    And I refresh the page
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:APPROVEDAMENDMENTREQUESTID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:APPROVEDAMENDMENTREQUESTID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
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
    Then I softly see field "Decision" as "Accepted"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "Automation Objective" for title "Objective" inside table "---prdoh_tableId:-:ObjectiveTableId---"

  @68374 @verifyAssociatedSpecialConditionsCopiedToActivatedAwardFromUI  @positive
  Scenario: Verify user is able to see associated special condition at amended award is getting copied to UI activated award
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
    And I save the field labeled "EGMS ID" as "EID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
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
    And I click toggle button to select "Amendment Requests - Draft"
    And I perform quick search for "{SavedValue:AwardEID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:AwardEID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
    And I click on top right button "New" in flex table with id "---prdoh_tableId:-:AmendmentSpecialConditionTableId---"
    And I enter in modal value "Automation Amendment Special Conditions" into field "fieldTitle__c"
    And I enter in modal value "Automation Amendment Special Conditions description" into field "cke_1_contents"
    And I enter in modal value "0" into field "fieldEffectiveFrom__c"
    And I enter in modal value "1" into field "fieldEffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AmendmentApproverRolesTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation Admin | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "EAMENDMENTREQUESTID"
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EAMENDMENTREQUESTID}" in "---prdoh_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EAMENDMENTREQUESTID}" inside flex table with id "---prdoh_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Approved"
    And I save the field labeled "EGMS ID" as "APPROVEDAMENDMENTREQUESTID"
    And I re-login as "PM" user on "default" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AmendmentRequestLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:APPROVEDAMENDMENTREQUESTID}" in "{prdoh_tableId:AmendmentRequestTableId}" panel
    And I click on "View" icon for "{SavedValue:APPROVEDAMENDMENTREQUESTID}" inside flex table with id "{prdoh_tableId:AmendmentRequestTableId}"
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
    Then I softly see field "Decision" as "Accepted"
    And I refresh the page
    And I click on "Activate Amended Award" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I perform quick search for "Active" in "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "Automation Amendment Special Conditions" for title "Name" inside table "---prdoh_tableId:-:SpecialConditionTableId---"