@AwardAttachmentsAndReportPreparer @regression @GrantsAwardsModule @parallel-regression
Feature: Award Attachment and Report preparer related scenarios
  Test all scenarios related to Award Attachments and Report preparer scenarios

  @66935 @verifyAddButtonAtAttachmentAndNotesPageBlockForAward-Created   @positive
  Scenario: Verify User can not see row level actions edit icon or not able to edit award which is in submitted for approval and Active status
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Attachments" sub tab
    Then I see the following top right buttons in table named "Attachments" :
      | Add |
    Then I see the following top right buttons in table named "Notes" :
      | Add |

  @66935 @verifyErrorMessageOnAddingNotesForAward-Created
  Scenario: Verify user can see error message while adding notes without entering details.
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Attachments" sub tab
    When I click on "Add" button inside attachments page block
    When I click modal button "Save"
    When I pause execution for "3" seconds
    Then I see the following messages in the page details :
      | Please enter Required fields |

  @66935 @verifyAdditionOfNotesAtAttachmentTabForAward-Created @smoke    @positive
  Scenario: Verify User can add remove attachment and notes from attachment blocks for Award
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Attachments" sub tab
    When I click on "Delete" icon for "Automation Notes" inside table
    When I close alertbox
    And I add notes records
    And I close "Add Notes" modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Automation Notes"

  @68040 @verifyAttachmentTypesOnAddAtAttachmentModal   @positive
  Scenario: Verify User can see all expected attachment Types inside Type Picklist field on Add Attachment modal
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Attachments" sub tab
    When I click on "AddAttachments" button inside attachments page block
    Then I see "Coversheet:Notice of Award:Interim Award Document:Supporting Document:Technical Review:Terms and Conditions:Other" inside Type selectbox

  @68040 @verifyAdditionOfAttachmentAtAttachmentSubTabForAward-Created @smoke  @positive
  Scenario: Verify user can add remove attachment from attachment blocks for Award
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Attachments" sub tab
    When I click on "Delete" icon for "AttachmentTesting.pdf" inside table
    When I close alertbox
    And I upload attachment "AttachmentTesting.pdf" of type "Coversheet"
    And I refresh the page
    Then I see table with header "Attachments" contains records "AttachmentTesting.pdf"

  @68040 @verifyErrorMessageOnAdditionOfAttachmentAtAttachmentSubTabForAward-Created
  Scenario: Verify user can error message while attaching attachment without details
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Attachments" sub tab
    When I click on "AddAttachments" button inside attachments page block
    When I click modal button "Save"
    When I pause execution for "3" seconds
    Then I see the following messages in the page details :
      | Please choose a Document for upload.   |
      | Please provide Attachment Description. |

  @68048 @verifyAdditionOfProgressAndFinancialReportPreparer @smoke   @positive
  Scenario: Verify user can add progress report and financial report preparer At Report preparer under roles sub tab
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Roles" sub tab
    Then I softly see "Progress Report Preparer" in flex table header "---prdoh_tableId:-:AwardReportPreparerTableId---"
    Then I softly see "Financial Report Preparer" in flex table header "---prdoh_tableId:-:AwardReportPreparerTableId---"
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Progress Report Preparer | Financial Report Preparer |
      |                          | Automation PM             |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Financial Report Preparer | Progress Report Preparer |
      | Automation PM             | Automation Admin         |
    Then I softly see value "Automation PM " for title "Financial Report Preparer" inside table "---prdoh_tableId:-:AwardReportPreparerTableId---"
    Then I softly see value "Automation Admin " for title "Progress Report Preparer" inside table "---prdoh_tableId:-:AwardReportPreparerTableId---"

  @68048 @verifyAddNameInPreparerNameFieldWithValidDataAtAwards-Draft  @positive
  Scenario: Verify user is able to input valid and invalid data and see the expected search result
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Roles" sub tab
    And I click on "Edit" icon for "Automation PM" inside flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---"
    And I enter value "Automation Admin" into field "ProgressReportPreparer__c"
    Then I softly see "Automation Admin" inside auto search result

  @68048 @verifyPermissionOfAssigningProgressAndFinancialReportPreparer   @positive
  Scenario Outline: Verify PI user is able to assign Report preparer and Non PI user is not able to assign report preparer
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Progress Report Preparer | Financial Report Preparer |
      |                          | Automation PM             |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Financial Report Preparer | Progress Report Preparer |
      | Automation PM             | Automation Admin         |
    Then I softly see value "Automation PM" for title "Financial Report Preparer" inside table "---prdoh_tableId:-:AwardReportPreparerTableId---"
    Then I softly see value "Automation Admin" for title "Progress Report Preparer" inside table "---prdoh_tableId:-:AwardReportPreparerTableId---"
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Roles" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Admin" in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---"

    Examples:
      | userType |
      | GRANTEE ADMIN    |
      | GRANTEE PO       |
      | GRANTEE DD       |
      |GRANTEE FO       |
      | GRANTEE EXE      |

  @68048 @verifyQuickSearchFunctionalityWithValidInValidDataAtReportPreparerPageBlock   @positive
  Scenario: Verify quick search behaviour with valid invalid data at Assign ReportPreparer page block
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Progress Report Preparer | Financial Report Preparer |
      |                          | Automation PM             |
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---" by clicking "Edit" :
      | Financial Report Preparer | Progress Report Preparer |
      | Automation PM             | Automation Admin         |
    And I perform quick search for "Automation PM" in "---prdoh_tableId:-:AwardReportPreparerTableId---" panel
    Then I softly see value "Automation PM" for title "Financial Report Preparer" inside table "---prdoh_tableId:-:AwardReportPreparerTableId---"
    And I perform quick search for "Invalid Input" in "---prdoh_tableId:-:AwardReportPreparerTableId---" panel
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AwardReportPreparerTableId---"

  @68048 @ValidateRefreshBehaviourFunctionalityAtReportPreparerPageBlock   @positive
  Scenario: verify user is able to refresh the content inside Report preparer page block
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    When I click on parallel lines menu bar with data target value "#AwardReportPreparerFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Report Preparer"
    Then I see table is refreshing

  @68048 @ValidateTotalRecordsCountAtReportPreparerPageBlock  @positive
  Scenario: verify user is able see total records count as same as total no of rows inside Report preparer page block
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    Then I see total records count is same as total row of table id "---prdoh_tableId:-:AwardReportPreparerTableId---" and table name "flextable"