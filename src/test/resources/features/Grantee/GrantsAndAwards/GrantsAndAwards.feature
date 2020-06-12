@GrantsAndAwards @regression @GrantsAwardsModule @parallel-regression
Feature: Grants related scenarios
  Test all scenarios related to Grants and Award

  @66577 @ValidateColumnsAvailableInGrants-AllListView @smoke   @positive
  Scenario Outline: verify columns should get displayed in Grants-All table
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:GrantsTable}"
    Then I softly see "Grant Number" in flex table header "{prdoh_tableId:GrantsTable}"
    Then I softly see "Grant Title" in flex table header "{prdoh_tableId:GrantsTable}"
    Then I softly see "Funding Organization" in flex table header "{prdoh_tableId:GrantsTable}"
    Then I softly see "Project Period" in flex table header "{prdoh_tableId:GrantsTable}"
    Then I softly see "Award to Date" in flex table header "{prdoh_tableId:GrantsTable}"
    Then I softly see "Drawdown Restriction" in flex table header "{prdoh_tableId:GrantsTable}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:GrantsTable}"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66577 @verifyColumnValueAtGrants-AllTable   @positive
  Scenario Outline: Verify user can see all expected columns values at Grants - All table
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    Then I see value "<value>" for title "<ColumnName>" inside table "{prdoh_tableId:GrantsTable}"
    Examples:
      | value                       | ColumnName             |
      | Automation Testing Grants 1 | Grant Title            |
      | ANTU198201                  | Grant Number           |
      | GRNT-01742                  | EGMS ID                |
      | Automation PM               | Principal Investigator |

  @66577 @verifyRowLevelActionForGrants   @positive
  Scenario: Verify User can see row level actions icon for grants of status Draft with PI user and user can not see row level edit action for NON PI user
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly can see row level action button "View" against "Automation Testing Grants 1" in flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly can see row level action button "Edit" against "Automation Testing Grants 1" in flex table with id "{prdoh_tableId:GrantsTable}"
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly can see row level action button "View" against "Automation Testing Grants 1" in flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly cannot see row level action button "Edit" against "Automation Testing Grants 1" in flex table with id "{prdoh_tableId:GrantsTable}"

  @66577 @verifyEditRowLevelActionForPIUserAtGrants-Active_Grants-Closed
  Scenario: Verify User can not see row level actions edit icon for grants of status Active and closed
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "1CL0DP0143" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly cannot see row level action button "Edit" against "1CL0DP0143" in flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Closed"
    And I perform quick search for "1CL0DP0190" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly cannot see row level action button "Edit" against "1CL0DP0190" in flex table with id "{prdoh_tableId:GrantsTable}"

  @66577 @validateGrants-AllColumnsSorting   @positive
  Scenario: Verify User can see sort as per column
    When I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I click on "EGMS ID" column header inside table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see content of expected Flex table column "EGMS ID" is in "Ascending" order of table id "{prdoh_tableId:GrantsTable}"
    When I click on "EGMS ID" column header inside table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see content of expected Flex table column "EGMS ID" is in "Descending" order of table id "{prdoh_tableId:GrantsTable}"
    When I click on "Grant Number" column header inside table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see content of expected Flex table column "Grant Number" is in "Ascending" order of table id "{prdoh_tableId:GrantsTable}"
    When I click on "Grant Number" column header inside table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see content of expected Flex table column "Grant Number" is in "Descending" order of table id "{prdoh_tableId:GrantsTable}"
    When I click on "Grant Title" column header inside table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see content of expected Flex table column "Grant Title" is in "Ascending" order of table id "{prdoh_tableId:GrantsTable}"
    When I click on "Grant Title" column header inside table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see content of expected Flex table column "Grant Title" is in "Descending" order of table id "{prdoh_tableId:GrantsTable}"
    When I click on "Funding Organization" column header inside table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see content of expected Flex table column "Funding Organization" is in "Ascending" order of table id "{prdoh_tableId:GrantsTable}"
    When I click on "Funding Organization" column header inside table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see content of expected Flex table column "Funding Organization" is in "Descending" order of table id "{prdoh_tableId:GrantsTable}"

  @66577 @verifyDefaultListViewAtGtants   @positive
  Scenario: Verify default list view at Grants-All is selected
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    Then I see "Grants - All" is selected at program flex table

  @66577 @verifyListViewShowAllStatusRecord   @positive
  Scenario: Verify records having status Draft Active is shown for Grants-All list view
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I pause execution for "3" seconds
    Then I softly see "Draft" value in flex table id "{prdoh_tableId:GrantsTable}"
    And I refresh the page
    And I click toggle button to select "Grants - Active"
    And I pause execution for "3" seconds
    Then I softly see "Active" value in flex table id "{prdoh_tableId:GrantsTable}"
    And I refresh the page
    And I click toggle button to select "Grants - Closed"
    And I pause execution for "3" seconds
    Then I softly see "Closed" value in flex table id "{prdoh_tableId:GrantsTable}"

  @66577 @verifyTotalRecordCountAtListViewGrant-Draft   @positive
  Scenario Outline: Verify user can see total records count as per the selected list view as - Grants draft
    Given I login as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I select value inside table "{prdoh_tableId:GrantsTable}" is "All"
    And I pause execution for "2" seconds
    Then I see total records count is same as total row of table id "{prdoh_tableId:GrantsTable}" and table name "flextable"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66577 @verifyTotalRecordCountAtListViewGrant-Active   @positive
  Scenario Outline: Verify user can see total records count as per the selected list view as - Grants Active
    Given I login as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I select value inside table "{prdoh_tableId:GrantsTable}" is "All"
    And I pause execution for "2" seconds
    Then I see total records count is same as total row of table id "{prdoh_tableId:GrantsTable}" and table name "flextable"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PM1   |

  @66577 @verifyTotalRecordCountAtListViewGrant-closed   @positive
  Scenario: Verify user can see total records count as per the selected list view as - Grants closed
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Closed"
    And I select value inside table "{prdoh_tableId:GrantsTable}" is "All"
    Then I see total records count is same as total row of table id "{prdoh_tableId:GrantsTable}" and table name "flextable"

  @66577 @verifyQuickSearchFunctioanalityAtGrantsTable   @positive
  Scenario: Verify user is able to perform quick search according to available column content
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "GRNT-01742" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly see value "GRNT-01742" for title "EGMS ID" inside table "{prdoh_tableId:GrantsTable}"
    And I refresh the page
    When I perform quick search for "Invalid-GRNT-01742" in "{prdoh_tableId:GrantsTable}" panel
    Then I see "No Records Found" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I refresh the page
    When I perform quick search for "ANTU198201" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly see value "ANTU198201" for title "Grant Number" inside table "{prdoh_tableId:GrantsTable}"
    And I refresh the page
    When I perform quick search for "Invalid-ANTU198201" in "{prdoh_tableId:GrantsTable}" panel
    Then I see "No Records Found" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I refresh the page
    When I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly see value "Automation Testing Grants 1" for title "Grant Title" inside table "{prdoh_tableId:GrantsTable}"
    And I refresh the page
    When I perform quick search for "Invalid-Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    Then I see "No Records Found" inside flex table with id "{prdoh_tableId:GrantsTable}"

  @66577 @validateAdvanceSearchIsWorkingOrNotAtGrants  @positive
  Scenario: Validate advance search is working or not for correct and incorrect value at Grants table
    Given I login as "Admin" user
    And I navigate to "Grants" tab
    And I click toggle button to select "Grants - All"
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    When I click on advance filter "#advfGranteeGrants" of table id "{prdoh_tableId:GrantsTable}"
    When I enter advance filter values inside id "advfGranteeGrants"
      | EGMS ID | Contains | GRNT-01742 |
    Then I softly see value "GRNT-01742" for title "EGMS ID" inside table "{prdoh_tableId:GrantsTable}"
    And I refresh the page
    When I click on advance filter "#advfGranteeGrants" of table id "{prdoh_tableId:GrantsTable}"
    When I enter advance filter values inside id "advf{prdoh_tableId:GrantsTable}"
      | Grant Number | Contains | ANTU198201 |
    Then I softly see value "ANTU198201" for title "Grant Number" inside table "{prdoh_tableId:GrantsTable}"
    And I refresh the page
    When I click on advance filter "#advfGranteeGrants" of table id "{prdoh_tableId:GrantsTable}"
    When I enter advance filter values inside id "advf{prdoh_tableId:GrantsTable}"
      | Grant Title | Starts with | Automation Testing |
    Then I softly see value "Automation Testing Grants 1" for title "Grant Title" inside table "{prdoh_tableId:GrantsTable}"

  @66577 @validateRefreshOptionsAtGrantsTable   @positive
  Scenario: Validate Refresh option at Grants - All table is working or not
    Given I login as "Admin" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I click on parallel lines menu bar with data target value "#toggleFlexTableGranteeGrants"
    And I select "Refresh" from parallel lines dropdown of "Grants - All"
    Then I see table is refreshing

  @68174 @verifyRowLevelActionForAward @buglogged73546   @positive
  Scenario: Verify User can see row level actions icon for Award of status Draft with PI user and user can not see row level edit action for NON PI user
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly can see row level action button "View" against "Automation Testing Grants 1" in flex table with id "{prdoh_tableId:AwardsTable}"
    Then I softly can see row level action button "Edit" against "Automation Testing Grants 1" in flex table with id "{prdoh_tableId:AwardsTable}"
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Automation Testing Grants 1" in flex table with id "{prdoh_tableId:AwardsTable}"

  @68174 @verifyEditRowLevelActionForPIUserAtAwards-Active_Awards-Closed_Award-Amended @wip
  Scenario: Verify User can not see row level actions edit icon for grants of status Active and closed
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I perform quick search for "Task Creation Demo 6" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Task Creation Demo 6" in flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Closed"
    And I perform quick search for "Project Period Clouseout QA Testing BP1.1" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Project Period Clouseout QA Testing BP1.1" in flex table with id "{prdoh_tableId:AwardsTable}"

  @68174 @ValidateColumnsAvailableInAwards-AllListView @smoke @buglogged73546   @positive
  Scenario Outline: verify columns should get displayed in Awards-All table
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    Then I softly see "EGMS ID" in flex table header "{prdoh_tableId:AwardsTable}"
    Then I softly see "Grant Award Number" in flex table header "{prdoh_tableId:AwardsTable}"
    Then I softly see "Amendment Number" in flex table header "{prdoh_tableId:AwardsTable}"
    Then I softly see "Award Title" in flex table header "{prdoh_tableId:AwardsTable}"
    Then I softly see "Funding Organization" in flex table header "{prdoh_tableId:AwardsTable}"
    Then I softly see "Award to Date" in flex table header "{prdoh_tableId:AwardsTable}"
    Then I softly see "Principal Investigator" in flex table header "{prdoh_tableId:AwardsTable}"
    Then I softly see "Status" in flex table header "{prdoh_tableId:AwardsTable}"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @68174 @verifyColumnValueAtAward-AllTable   @positive
  Scenario Outline: Verify user can all expected columns values at Awards - All table
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    Then I see value "<value>" for title "<ColumnName>" inside table "{prdoh_tableId:AwardsTable}"
    Examples:
      | value                                      | ColumnName           |
      | 19ANTU198201                               | Grant Award Number   |
      | Automation Testing Grants 1                | Award Title          |
      | AWD-02115                                  | EGMS ID              |
      | 1                                          | Amendment Number     |
      | Centers For Disease Control And Prevention | Funding Organization |

  @68174 @verifyDefaultListViewAtAwards    @positive
  Scenario: Verify default list view at Awards-All is selected
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    Then I see "Awards - All" is selected at program flex table

  @68174 @validateAwards-AllColumnsSorting   @positive
  Scenario: Verify User can see sorting of record while clicking on respective colum
    When I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I click on "EGMS ID" column header inside table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see content of expected column "EGMS ID" is in "Ascending" order of table id "{prdoh_tableId:AwardsTable}"
    When I click on "EGMS ID" column header inside table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see content of expected column "EGMS ID" is in "Descending" order of table id "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    When I click on "Grant Award Number" column header inside table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see content of expected column "Grant Award Number" is in "Ascending" order of table id "{prdoh_tableId:AwardsTable}"
    When I click on "Grant Award Number" column header inside table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see content of expected column "Grant Award Number" is in "Descending" order of table id "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    When I click on "Award Title" column header inside table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see content of expected column "Award Title" is in "Ascending" order of table id "{prdoh_tableId:AwardsTable}"
    When I click on "Award Title" column header inside table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see content of expected column "Award Title" is in "Descending" order of table id "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    When I click on "Funding Organization" column header inside table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see content of expected column "Funding Organization" is in "Ascending" order of table id "{prdoh_tableId:AwardsTable}"
    When I click on "Funding Organization" column header inside table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see content of expected column "Funding Organization" is in "Descending" order of table id "{prdoh_tableId:AwardsTable}"

  @68174 @verifyMultipleListViewShowExpectedStatusRecord   @positive
  Scenario: Verify records having status Draft Active closed is shown for Awards-Draft Active Closed list view
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Draft"
    And I pause execution for "3" seconds
    Then I softly see "Created" value in flex table id "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    And I click toggle button to select "Awards - Active"
    And I pause execution for "3" seconds
    Then I softly see "Active" value in flex table id "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    And I click toggle button to select "Awards - Closed"
    And I pause execution for "3" seconds
    Then I softly see "Closed" value in flex table id "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    And I click toggle button to select "Awards - Amended"
    And I pause execution for "3" seconds
    Then I softly see "Amended" value in flex table id "{prdoh_tableId:AwardsTable}"

  @68174 @verifyTotalRecordCountAtListViewAwards-Draft   @positive
  Scenario Outline: Verify user can see total records count as per the selected list view as - Awards draft
    Given I login as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Draft"
    And I select value inside table "{prdoh_tableId:AwardsTable}" is "All"
    And I pause execution for "2" seconds
    Then I see total records count is same as total row of table id "{prdoh_tableId:AwardsTable}" and table name "flextable"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @68174 @verifyTotalRecordCountAtListViewAwards-Active   @positive
  Scenario Outline: Verify user can see total records count as per the selected list view as - Awards Active
    Given I login as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I select value inside table "{prdoh_tableId:AwardsTable}" is "All"
    And I pause execution for "2" seconds
    Then I see total records count is same as total row of table id "{prdoh_tableId:AwardsTable}" and table name "flextable"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |

  @68174 @verifyTotalRecordCountAtListViewAwards-Amended   @positive
  Scenario Outline: Verify user can see total records count as per the selected list view as - Awards Amended
    Given I login as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Amended"
    And I select value inside table "{prdoh_tableId:AwardsTable}" is "All"
    And I pause execution for "2" seconds
    Then I see total records count is same as total row of table id "{prdoh_tableId:AwardsTable}" and table name "flextable"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |

  @68174 @verifyTotalRecordCountAtListViewAwards-Closed   @positive
  Scenario Outline: Verify user can see total records count as per the selected list view as - Awards Closed
    Given I login as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Closed"
    And I select value inside table "{prdoh_tableId:AwardsTable}" is "All"
    And I pause execution for "2" seconds
    Then I see total records count is same as total row of table id "{prdoh_tableId:AwardsTable}" and table name "flextable"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |

  @68174 @verifyTotalRecordCountAtListViewAward-ActiveForDifferentOrganization   @positive
  Scenario Outline: Verify user of different organization can see same total records count as per the selected list view as - Grants Active
    Given I login as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Active"
    And I pause execution for "3" seconds
    And I select value inside table "{prdoh_tableId:AwardsTable}" is "All"
    And I pause execution for "5" seconds
    Then I see total records count is same as total row of table id "{prdoh_tableId:AwardsTable}" and table name "flextable"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PM1   |

  @68174 @verifyQuickSearchFunctioanalityAtAwardsTable    @positive
  Scenario: Verify user is able to perform quick search according to available column content at Awards Table
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    When I perform quick search for "AWD-02115" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly see value "AWD-02115" for title "EGMS ID" inside table "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    When I perform quick search for "Invalid-AWD-02115" in "{prdoh_tableId:AwardsTable}" panel
    Then I see "No Records Found" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    When I perform quick search for "19ANTU198201" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly see value "19ANTU198201" for title "Grant Award Number" inside table "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    When I perform quick search for "Invalid-19ANTU198201" in "{prdoh_tableId:AwardsTable}" panel
    Then I see "No Records Found" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    When I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly see value "Automation Testing Grants 1" for title "Award Title" inside table "{prdoh_tableId:AwardsTable}"
    And I refresh the page
    When I perform quick search for "Invalid-Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    Then I see "No Records Found" inside flex table with id "{prdoh_tableId:AwardsTable}"

  @66935 @verifyAwardDetailPage @smoke   @positive
  Scenario: Verify user of different organization can see same total records count as per the selected list view as - Grants Active
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see field "Award" as "Automation Testing Grants 1"

  @66935 @verifyPageLayoutEditActionButtonAtAwardDetailPageForPIUser @smoke   @positive
  Scenario: Verify PI user can see Edit button on detail Page
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    When I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I can see top right button "Edit" in page detail

  @66935 @verifyPageLayoutEditActionButtonAtAwardDetailPageNonPIUser @buglogged73546
  Scenario Outline: Verify Non PI user can not see Edit button on detail Page
    Given I login as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    When I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I cannot see top right button "Edit" in page detail

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66935 @verifyFieldsAtPageDetailsIsInReadAndEditModeForAwards    @positive
  Scenario: Verify expected fields is in read mode only and in edit mode only at awards detail page
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    When I click on "Edit" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see that "fieldGrant__c" rendered in view mode only
    Then I softly see that "fieldGrantAwardName__c" rendered in view mode only
    Then I softly see that "fieldAwardType__c" rendered in view mode only
    Then I softly see that "fieldVersionNumber__c" rendered in view mode only
    Then I softly see fields "fieldIsNOGAAttachedPicklist__c" is in edit mode
    Then I softly see fields "fieldAwardIssueDate__c" is in edit mode
    Then I softly see fields "fieldCashMatchPercentage__c" is in edit mode
    Then I softly see fields "fieldFederalTCLink__c" is in edit mode
    Then I softly see fields "fieldSeparateAttachmentforTandC__c" is in edit mode
    And I navigate to "Budget" sub tab
    Then I softly see that "fieldBudgetPeriodStartDate__c" rendered in view mode only
    Then I softly see that "fieldBudgetPeriodEndDate__c" rendered in view mode only
    Then I softly see that "fieldTotalAwardedBudget__c" rendered in view mode only
    Then I softly see that "fieldAwardedAmountthisActionFormula__c" rendered in view mode only

  @66935 @verifyAwardNotEditableWithStatus-SubmittedForApproval-Active @verifyAwardEditWithStatus-Draft @smoke
  Scenario: Verify User can not see row level actions edit icon or not able to edit award which is in submitted for approval and Active status
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 2" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Automation Testing Grants 2" in flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Automation Testing Grants 4" in flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "Edit" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter value "Yes" into field "fieldIsNOGAAttachedPicklist__c"
    And I click on "Save" in the page details
    Then I see field "NOA Received from Funding Organization?" as "Yes"

  @66935 @verifyAssociationAndDeletionOfContactAtAward-Created
  Scenario: Verify User can not see row level actions edit icon or not able to edit award which is in submitted for approval and Active status
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Overview" sub tab
    Then I softly can see row level action button "View" against "Grants Management Officer" in flex table with id "---prdoh_tableId:-:OtherKeyContactsTableId---"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:OtherKeyContactsTableId---"
    And I enter value "Amol Darekar" into field "fieldContact__c"
    And I enter value "Project Officer" into field "fieldRole__c"
    And I click modal button "Save"
    Then I softly see value "Project Officer" for title "Role" inside table "---prdoh_tableId:-:OtherKeyContactsTableId---"
    When I click on "Delete" icon for "Project Officer" inside flex table with id "---prdoh_tableId:-:OtherKeyContactsTableId---"
    Then I softly do not see value "Project Officer" for title "Role" inside table "---prdoh_tableId:-:OtherKeyContactsTableId---"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "Edit" against "Automation Testing Grants 1" in flex table with id "---prdoh_tableId:-:AwardProgressReportSchedule---"
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Management" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Testing Grants 1" in flex table with id "---prdoh_tableId:-:AwardProgressReportSchedule---"

  @66935 @verifyApplicationAdditionForAward-Created @smoke   @positive
  Scenario: Verify user is able relate application to an award inside related application page block
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardRelatedApplicationTableId---" by clicking "Edit" :
      | Application | Is this award related to an application in the EGMS? |
      | APP--027    | Yes                                                  |
    Then I softly see value "Yes" for title "Is this award related to an application in the EGMS?" inside table "---prdoh_tableId:-:AwardRelatedApplicationTableId---"
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:AwardRelatedApplicationTableId---" by clicking "Edit" :
      | Application | Is this award related to an application in the EGMS? |
      | APP--027    | No                                                   |
    Then I softly see value "No" for title "Is this award related to an application in the EGMS?" inside table "---prdoh_tableId:-:AwardRelatedApplicationTableId---"

  @66935 @verifyEditActionAtRelatedApplicationWithNOnPIUserForAward-Created
  Scenario: Verify Non PI user is not able to see row level edit action at related application page block
    Given I login as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Overview" sub tab
    Then I softly cannot see row level action button "Edit" against "No" in flex table with id "---prdoh_tableId:-:AwardRelatedApplicationTableId---"

  @66935 @verifyCashMatchedPercentageWithAllUsersForAward-Created @smoke   @positive
  Scenario Outline: Verify Required match value of Awarded application will be same for all user inside Awards detail page
    Given I login as "GRANTEE PM" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "Alaska Sea Grant State Fellowship Program" in "{prdoh_tableId:ApplicationTableId}" panel
    And I click on "View" icon for "Alaska Sea Grant State Fellowship Program" inside flex table with id "{prdoh_tableId:ApplicationTableId}"
    And I navigate to "Budget" sub tab
    And I save the field labeled "Required Match(%)" as "MatchPercentage"
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Overview" sub tab
    Then I softly see field "Cash Match Required (%)" as "{SavedValue:MatchPercentage}"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66935 @verifyCashMatchedPercentageFieldEditableForAward-Created @smoke  @positive
  Scenario: Verify Required match value(cash match) of Awarded application will be editable for PI user inside Awards detail page
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "fieldCashMatchPercentage__c" is in edit mode

  @66935 @verifyGrantsDetailsEditForAward-Created @smoke   @positive
  Scenario: Verify user is able relate application to an award inside related application page block
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:GrantsLevelDetailsTableId---" by clicking "Edit" :
      | Grant Type    | Empty Column Total Anticipated Award Amount over Project Period | Internal Program | Is a Budget Period Closeout Required? | Is the Grant on Drawdown Restriction? |
      | Project Grant | 10000                                                           | PG--0001         | No                                    | NO                                    |
    Then I softly see value "Project Grant" for title "Grant Type" inside table "---prdoh_tableId:-:GrantsLevelDetailsTableId---"
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 2" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 2" inside flex table with id "{prdoh_tableId:AwardsTable}"

  @66935 @verifyAssociateAndDeleteOfContactAtAward-Created @smoke  @positive
  Scenario: Verify User can not see row level actions edit icon or not able to edit award which is in submitted for approval and Active status
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "Overview" sub tab
    Then I softly can see row level action button "Delete" against "Grants Management Officer" in flex table with id "---prdoh_tableId:-:OtherKeyContactsTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---prdoh_tableId:-:OtherKeyContactsTableId---"

  @66222 @verifyUserPermissionForActionsIconAtAward-allStateOfAward
  Scenario Outline: Verify Users(PI and Non PI) can see cannot see row level actions icon of all state of Award
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly can see row level action button "Edit" against "Automation Testing Grants 1" in flex table with id "{prdoh_tableId:AwardsTable}"
    Then I softly can see row level action button "View" against "Automation Testing Grants 1" in flex table with id "{prdoh_tableId:AwardsTable}"
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Automation Testing Grants 1" in flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 2" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Automation Testing Grants 2" in flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Automation Testing Grants 4" in flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Amended"
    And I perform quick search for "Automation Testing Grants 7" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Automation Testing Grants 7" in flex table with id "{prdoh_tableId:AwardsTable}"
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Closed"
    And I perform quick search for "Automation Testing Grants 8" in "{prdoh_tableId:AwardsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Automation Testing Grants 8" in flex table with id "{prdoh_tableId:AwardsTable}"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66222 @verifyTopLevelButtonsAtPageLayoutForAward-Created @smoke   @positive
  Scenario: Verify User can see top level actions Submit for Approval button for Award in created status and Status as Active for Approved Award.
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I softly can see top right button "Submit For Approval" in page detail
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 4" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see field "Status" as "Active"

  @66222 @verifyAwardsPageDetails @smoke  @positive
  Scenario Outline: Verify all sub tabs at detail page of Award
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I softly see field "Grant Award Number" as "19ANTU198201"
    Then I softly see field "Status" as "Created"
    Then I softly see field "EGMS ID" as "AWD-02115"
    Then I softly see field "Amendment Number" as "1"
    Then I softly see field "Scope / Award Description" as "<text>"
    And I softly see the text containing :
      | Overview    |
      | Budget      |
      | Management  |
      | Monitoring  |
      | Roles       |
      | Attachments |
      | History     |
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 4" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I softly see the text containing :
      | Actuals |
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Amended"
    And I perform quick search for "Automation Testing Grants 7" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 7" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I softly see the text containing :
      | Actuals |
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - Closed"
    And I perform quick search for "Automation Testing Grants 8" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 8" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I softly see the text containing :
      | Actuals |

    Examples:
      | text                               |
      | Automation Grant Award Description |

  @66222 @verifyAwardsPageBlocksUnderOverviewSubTab @smoke    @positive
  Scenario: Verify all Expected page block under Overview sub tab of an Award
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Overview" sub tab
    And I softly see the text containing :
      | Related Application                |
      | Grant Level Details                |
      | Award Details                      |
      | Related Funding Programs           |
      | Principal Investigator Information |
      | Other Key Contacts                 |
      | Award Description                  |
      | Place of Performance               |
      | System Information                 |

  @66222 @verifyListViewOptionsAtAwards-AllTable @smoke    @positive
  Scenario: Verify all options of list at Award-all table is displayed
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I pause execution for "3" seconds
    Then I softly see "Awards - All" inside list view option of table "#GranteeActiveAwardsFlexToggle"
    Then I softly see "Awards - Draft" inside list view option of table "#GranteeActiveAwardsFlexToggle"
    Then I softly see "Awards - Active" inside list view option of table "#GranteeActiveAwardsFlexToggle"
    Then I softly see "Awards - Amended" inside list view option of table "#GranteeActiveAwardsFlexToggle"
    Then I softly see "Awards - Closed" inside list view option of table "#GranteeActiveAwardsFlexToggle"

  @66222 @verifyHelpTextIconAtAwardsPageDetails    @positive
  Scenario Outline: Verify Help text icon vith message inside award page detail on hovering
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    When I hovering mouse on help text icon inside page block detail "Maintenance of Effort is Required"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                                                                                                                               |
      | Is there a requirement placed on the grant program to provide a maintenance of effort (MOE) or maintenance of non-federal support of expenditures for the program/project? |

  @66222 @verifyColumnOfKeyContactTableForAward    @positive
  Scenario Outline: Verify all expected columns of key contacts section is displayed
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    Then I see "<ColumnName>" in flex table header "---prdoh_tableId:-:OtherKeyContactsTableId---"

    Examples:
      | ColumnName     |
      | Name           |
      | Role           |
      | Organization   |
      | Email          |
      | Business Phone |
      | Key Contact    |

  @66222 @verifyColumnOfRelatedApplicationTableForAward    @positive
  Scenario Outline: Verify all expected columns of Related Application section is displayed
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Overview" tab
    Then I see "<ColumnName>" in flex table header "---prdoh_tableId:-:AwardRelatedApplicationTableId---"

    Examples:
      | ColumnName                                           |
      | Is this award related to an application in the EGMS? |
      | Application                                          |

  @66222 @verifyAwardsPageBlocksUnderBudgetSubTab @smoke    @positive
  Scenario: Verify all Expected page block under On budget sub tab of an Award is displayed
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Budget" sub tab
    And I softly see the text containing :
      | Project Period Details |
      | Budget Period Details  |
      | Projects               |
      | Award Budget           |
    And I save the field labeled "Project Period Start Date" as "ProjectStartDate"
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectStartDate}"
    And I save the field labeled "Project Period End Date" as "ProjectEndDate"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectEndDate}"
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see field "Award to Date (Budget Period)" as "$0.00"
    Then I softly see field "Awarded Amount this Action" as "$0.00"

  @66222 @verifyColumnOfProjectSectionForAward @smoke   @positive
  Scenario Outline: Verify all expected columns of Project is displayed under budget sub tab
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Budget" tab
    Then I see "<ColumnName>" in flex table header "---prdoh_tableId:-:ProjectTableId---"

    Examples:
      | ColumnName   |
      | Project Code |
      | Project Name |

  @66222 @verifyAwardsPageBlocksUnderActualsSubTab @smoke    @positive
  Scenario: Verify all Expected page block under Actuals sub tab of an Award
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 4" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Actuals" sub tab
    And I softly see the text containing :
      | Financials Summary  |
      | Expenditure Details |
      | Drawdowns           |
    Then I softly see field "Total Awarded Budget" as "$0.00"
    Then I softly see field "Expenditures" as "$0.00"
    Then I softly see field "Remaining Budget" as "$0.00"
    Then I softly see field "Cash Match" as "$0.00"
    Then I softly see field "Cash Match Expenditures" as "$0.00"
    Then I softly see field "Remaining Cash Match" as "$0.00"
    Then I softly see field "Remaining Cash Match" as "$0.00"

  @66222 @verifyColumnOfExpenditureTableAndActualsTabDetailsForAward @smoke    @positive
  Scenario: Verify all expected columns of key contacts section is displayed
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 4" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Actuals" sub tab
    Then I see "Budget Category" in flex table header "---prdoh_tableId:-:ExpenditureDetailsTableId---"
    Then I see "Award Budget" in flex table header "---prdoh_tableId:-:ExpenditureDetailsTableId---"
    Then I see "Expenditures" in flex table header "---prdoh_tableId:-:ExpenditureDetailsTableId---"
    Then I see "Remaining Budget" in flex table header "---prdoh_tableId:-:ExpenditureDetailsTableId---"
    Then I see "Cash Match" in flex table header "---prdoh_tableId:-:ExpenditureDetailsTableId---"
    Then I see "Cash Match Expenditures" in flex table header "---prdoh_tableId:-:ExpenditureDetailsTableId---"
    Then I see "Remaining Cash Match" in flex table header "---prdoh_tableId:-:ExpenditureDetailsTableId---"
    And I navigate to "Management" sub tab
    And I softly see the text containing :
      | Progress Reports Schedule |
      | Progress Reports          |
      | Financial Reports         |
    Then I see "Report Title" in flex table header "---prdoh_tableId:-:AwardProgressReportSchedule---"
    Then I see "Report Type" in flex table header "---prdoh_tableId:-:AwardProgressReportSchedule---"
    Then I see "Frequency" in flex table header "---prdoh_tableId:-:AwardProgressReportSchedule---"
    Then I see "Reporting Period" in flex table header "---prdoh_tableId:-:AwardProgressReportSchedule---"
    Then I softly can see row level action button "View" against "Automation Testing Grants 4" in flex table with id "---prdoh_tableId:-:AwardProgressReportSchedule---"
    Then I softly can see row level action button "Edit" against "Automation Testing Grants 4" in flex table with id "---prdoh_tableId:-:AwardProgressReportSchedule---"
    Then I see "EGMS ID" in flex table header "---prdoh_tableId:-:ProgressReportTableId---"
    Then I see "Reporting Period" in flex table header "---prdoh_tableId:-:ProgressReportTableId---"
    Then I see "Report Due Date" in flex table header "---prdoh_tableId:-:ProgressReportTableId---"
    Then I see "Assigned To" in flex table header "---prdoh_tableId:-:ProgressReportTableId---"
    Then I softly can see row level action button "View" against "Automation Testing Grants 4" in flex table with id "---prdoh_tableId:-:AwardProgressReportSchedule---"
    Then I see "EGMS ID" in flex table header "---prdoh_tableId:-:FinancialsReportTableId---"
    Then I see "Reporting Period" in flex table header "---prdoh_tableId:-:FinancialsReportTableId---"
    Then I see "Report Due Date" in flex table header "---prdoh_tableId:-:FinancialsReportTableId---"
    Then I see "Assigned To" in flex table header "---prdoh_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    And I softly see the text containing :
      | Key Performance Indicators (KPI) |
      | Objectives                       |
      | Financial Reports                |
      | Special Conditions               |
    Then I see "KPI Title" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Measure" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Unit" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Current Value" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Current Value Date" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Target Value" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "EGMS Strategic Plan ID" in flex table header "---prdoh_tableId:-:ObjectiveTableId---"
    Then I see "Objective" in flex table header "---prdoh_tableId:-:ObjectiveTableId---"
    Then I see "Activities" in flex table header "---prdoh_tableId:-:ObjectiveTableId---"
    Then I see "Current Value" in flex table header "---prdoh_tableId:-:ObjectiveTableId---"
    Then I see "Current Value Date" in flex table header "---prdoh_tableId:-:ObjectiveTableId---"
    And I navigate to "Amendments" sub tab
    Then I see "EGMS ID" in flex table header "---prdoh_tableId:-:AmendmentsTableId---"
    Then I see "Request Type" in flex table header "---prdoh_tableId:-:AmendmentsTableId---"
    Then I see "Initiated By" in flex table header "---prdoh_tableId:-:AmendmentsTableId---"
    Then I see "Status" in flex table header "---prdoh_tableId:-:AmendmentsTableId---"

  @66222 @verifyApproverPageBlocksUnderRolesSubTab  @smoke     @positive
  Scenario: Verify all Expected page block under Roles sub tab of an Award-created
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    And I softly see the text containing :
      | Approvers       |
      | Report Preparer |
    Then I see "Name" in flex table header "---prdoh_tableId:-:ApproverTableId---"
    Then I see "Responsibility" in flex table header "---prdoh_tableId:-:ApproverTableId---"
    Then I see "Description" in flex table header "---prdoh_tableId:-:ApproverTableId---"
    Then I softly can see row level action button "Edit" against "Program Approver" in flex table with id "---prdoh_tableId:-:ApproverTableId---"

  @66102 @ValidatePermissionCheckForInternalUsersAtGrants @smoke   @positive
  Scenario Outline: verify all internal user able to view grants in Grants-All table
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly see value "Automation Testing Grants 1" for title "Grant Title" inside table "{prdoh_tableId:GrantsTable}"
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I see the sub-header is "Automation Testing Grants 1" in the page details

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66102 @ValidatePageBlockForInternalUsersAtGrants @smoke    @positive
  Scenario Outline: verify all internal user able to view grants in Grants-All table
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I softly see the text containing :
      | Overview    |
      | Awards      |
      | Financials  |
      | Management  |
      | Monitoring  |
      | Roles       |
      | Attachments |
      | History     |

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66102 @ValidatePageLayoutHeaderSectionWithInternalUsersAtGrants @smoke    @positive
  Scenario Outline: verify all internal user able to view page layout header section at grants detail page
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "EGMS ID" as "GRNT-01742"
    Then I softly see field "Status" as "Draft"
    And I pause execution for "2" seconds
    Then I softly see field "Grant Number" as "ANTU198201"
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I pause execution for "2" seconds
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 4" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I softly see field "Status" as "Active"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66102 @ValidateOverviewSubTabDeatailsWithInternalUsersAtGrants  @BugID82258 @smoke    @positive
  Scenario Outline: verify all internal user able to see page blocks inside overview subtab
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Overview" sub tab
    Then I softly see field "Grant Title" as "Automation Testing Grants 1"
    Then I softly see field "Funding Organization Code" as "6622335CD"
    Then I softly see field "Internal Organization Code" as "52100"
    And I softly see the text containing :
      | General Information                |
      | Project Period Details             |
      | Principal Investigator Information |
      | Other Key Contacts                 |
      | System Information                 |
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I see "Program Number" in flex table header "---prdoh_tableId:-:GrantRelatedFundingProgramsTableId---"
    Then I see "Program Title" in flex table header "---prdoh_tableId:-:GrantRelatedFundingProgramsTableId---"
    Then I softly see value "PL-480 Market Development and Technical Assistance" for title "Program Title" inside table "---prdoh_tableId:-:GrantRelatedFundingProgramsTableId---"
    Then I softly can see row level action button "View" against "PL-480 Market Development and Technical Assistance" in flex table with id "---prdoh_tableId:-:GrantRelatedFundingProgramsTableId---"
    Then I softly see field "Business Phone" as "(234) 786-5432"
    Then I softly see field "Email" as "automation.pm@yopmail.com"
    Then I see "Name" in flex table header "---prdoh_tableId:-:GrantsKeyContactTableId---"
    Then I see "Role" in flex table header "---prdoh_tableId:-:GrantsKeyContactTableId---"
    Then I see "Organization" in flex table header "---prdoh_tableId:-:GrantsKeyContactTableId---"
    Then I see "Email" in flex table header "---prdoh_tableId:-:GrantsKeyContactTableId---"
    Then I see "Business Phone" in flex table header "---prdoh_tableId:-:GrantsKeyContactTableId---"
    Then I see "Key Contact" in flex table header "---prdoh_tableId:-:GrantsKeyContactTableId---"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66102 @ValidateAwardSubTabDetailsWithInternalUsersAtGrants @smoke    @positive
  Scenario Outline: verify all internal user able to see details under Awards sub tab for grants
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I softly see the text containing :
      | Awards / Revisions |
    Then I see "Grant Award Number " in flex table header "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    Then I see "Budget Period Number" in flex table header "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    Then I see "Version" in flex table header "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    Then I see "Amendment Types" in flex table header "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    Then I see "Amendment Request ID" in flex table header "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    Then I see "Budget Period" in flex table header "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    Then I see "Awarded to Date" in flex table header "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    Then I see "Status" in flex table header "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66102 @ValidateRowLevelActionIconAtAwardSubTabDetailsWithORWithoutPIUser  @positive
  Scenario Outline: verify expected row level action icons displayed to Pi and Non PI user for grants under Award sub tab
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    Then I softly can see row level action button "View" against "19ANTU198201" in flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly can see row level action button "Edit" against "19ANTU198201" in flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    Then I softly can see row level action button "View" against "19ANTU198201" in flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    #Then I softly cannot see row level action button "Edit" against "191AUTOP0001" in flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly cannot see row level action button "Edit" against "19ANTU198201" in flex table with id "---prdoh_tableId:-:GrantsAwardsRevisionTableId---"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66222 @verifyHelpTextIconAtGrantPageDetails  @positive
  Scenario Outline: Verify Help text icon vith message inside grant page detail on hovering at Award/Revision page block under Award sub tab
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    When I hovering mouse on page block help text icon inside table "---prdoh_tableId:-:GrantsAwardsRevisionTableId---" with tooltip id "GranteeRelatedAwardstooltip"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                                                          |
      | This section displays all awards associated with this grant. To view details, click on the view icon. |

  @66102 @ValidateFinancialSubTabDetailsWithInternalUsersAtGrants @smoke    @positive
  Scenario Outline: verify all internal user able to see details under Financials sub tab for grants
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Financials" sub tab
    And I softly see the text containing :
      | Funding Information |
      | Grant Budget        |
    Then I softly see field "Total Anticipated Amount" as "$10,000.00"
    Then I softly see field "Awarded to Date" as "$0.00"
    Then I softly see field "Expenditures to Date" as "$0.00"
    Then I softly see field "Remaining Budget" as "$0.00"
    Then I softly see field "Cash Match to Date" as "$0.00"
    Then I softly see field "Cash Match Expenditures to Date" as "$0.00"
    Then I softly see field "Remaining Cash Match" as "$0.00"
    Then I softly see field "Total Drawdowns" as "$0.00"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66102 @verifyHelpTextIconAtFundingInformationPageBlockDetailsUndeFinancialSubTab  @positive
  Scenario Outline: Verify Help text icon with message inside funding information page block detail on hovering at Total Anticipated Amount field
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Financials" sub tab
    When I hovering mouse on help text icon inside page block detail "Total Anticipated Amount"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | userType      | new_helpText                                                |
      | GRANTEE ADMIN | Total funding anticipated across the entire project period. |
      | GRANTEE PM    | Total funding anticipated across the entire project period. |
      | GRANTEE PO    | Total funding anticipated across the entire project period. |
      | GRANTEE DD    | Total funding anticipated across the entire project period. |
      | GRANTEE FO    | Total funding anticipated across the entire project period. |
      | GRANTEE EXE   | Total funding anticipated across the entire project period. |

  @66102 @verifyFinancialPageBlockDetailsFieldsInEditModeUndeFinancialSubTab @buglogged75647 @smoke   @positive
  Scenario: Verify Total Anticipated Amount page detail field is in edit mode for PI user on edit detail page of grant
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "Edit" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Financials" sub tab
    Then I softly see fields "fieldTotalObligatedAmount__c" is in edit mode

  @66102 @ValidateGrantsBudgetDetailsUnderFinancialSubTabAtGrantDetailPage @smoke   @positive
  Scenario: verify all expected details are getting displayed at grants budget page block under financials sub tab At grants detail page
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Financials" sub tab
    Then I see "Award Title" in flex table header "---prdoh_tableId:-:GrantsBudgetTableId---"
    Then I see "Budget Period" in flex table header "---prdoh_tableId:-:GrantsBudgetTableId---"
    Then I see "Budget Period Start Date" in flex table header "---prdoh_tableId:-:GrantsBudgetTableId---"
    Then I see "Budget Period End Date" in flex table header "---prdoh_tableId:-:GrantsBudgetTableId---"
    When I expand nested table containing column value "Automation Testing Grants 1"
    Then I see "#" in flex table header "---prdoh_tableId:-:GrantsFinancialsByPrpjectTableId---"
    Then I see "Budget Category" in flex table header "---prdoh_tableId:-:GrantsFinancialsByPrpjectTableId---"
    Then I see "Award Budget" in flex table header "---prdoh_tableId:-:GrantsFinancialsByPrpjectTableId---"
    Then I see "Expenditures" in flex table header "---prdoh_tableId:-:GrantsFinancialsByPrpjectTableId---"
    Then I see "Remaining Budget" in flex table header "---prdoh_tableId:-:GrantsFinancialsByPrpjectTableId---"
    Then I see "Cash Match" in flex table header "---prdoh_tableId:-:GrantsFinancialsByPrpjectTableId---"
    Then I see "Cash Match Expenditures" in flex table header "---prdoh_tableId:-:GrantsFinancialsByPrpjectTableId---"
    Then I see "Remaining Cash Match" in flex table header "---prdoh_tableId:-:GrantsFinancialsByPrpjectTableId---"

  @66102 @ValidateManagementSubTabDetailsAtGrants @smoke   @positive
  Scenario: verify User able to see details under Management sub tab for grants
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Management" sub tab
    And I softly see the text containing :
      | Amendment Requests           |
      | Performance Progress Reports |
      | Financial Reports            |
    Then I see "EGMS ID" in flex table header "---prdoh_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I see "Award EGMS ID" in flex table header "---prdoh_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I see "Version Number" in flex table header "---prdoh_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I see "Budget Period Number" in flex table header "---prdoh_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I see "Status" in flex table header "---prdoh_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I see "Record Owner" in flex table header "---prdoh_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I see "EGMS ID" in flex table header "---prdoh_tableId:-:GrantsPerformanceProgressReportTableId---"
    Then I see "Award EGMS ID" in flex table header "---prdoh_tableId:-:GrantsPerformanceProgressReportTableId---"
    Then I see "Reporting Period" in flex table header "---prdoh_tableId:-:GrantsPerformanceProgressReportTableId---"
    Then I see "Budget Period Number" in flex table header "---prdoh_tableId:-:GrantsPerformanceProgressReportTableId---"
    Then I see "Status" in flex table header "---prdoh_tableId:-:GrantsPerformanceProgressReportTableId---"
    Then I see "EGMS ID" in flex table header "---prdoh_tableId:-:GrantsFinancialReportTableId---"
    Then I see "Award EGMS ID" in flex table header "---prdoh_tableId:-:GrantsFinancialReportTableId---"
    Then I see "Reporting Period" in flex table header "---prdoh_tableId:-:GrantsFinancialReportTableId---"
    Then I see "Budget Period Number" in flex table header "---prdoh_tableId:-:GrantsFinancialReportTableId---"
    Then I see "Status" in flex table header "---prdoh_tableId:-:GrantsFinancialReportTableId---"

  @66102 @ValidateRowLevelActionIconAtManagementSubTabDetails @smoke   @positive
  Scenario: verify expected row level action icons displayed inside Amendment Request Page block and financial report page block under management sub tab at grant detail page
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "BP CL QA Test BP1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "BP CL QA Test BP1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "CR-AWD-00317-00" in flex table with id "---prdoh_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I softly can see row level action button "View" against "FR-230" in flex table with id "---prdoh_tableId:-:GrantsFinancialReportTableId---"

  @66102 @ValidateMonitoringSubTabDetailsAtGrants @smoke   @positive
  Scenario: verify User able to see details under Monitoring sub tab for grants
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Monitoring" sub tab
    And I softly see the text containing :
      | Key Performance Indicators (KPI) |
      | Objectives                       |
      | Special Conditions               |
    Then I see "EGMS ID" in flex table header "---prdoh_tableId:-:GrantsObjectiveTableId---"
    Then I see "Objective" in flex table header "---prdoh_tableId:-:GrantsObjectiveTableId---"
    Then I see "Activities" in flex table header "---prdoh_tableId:-:GrantsObjectiveTableId---"
    Then I see "Month-Year Created" in flex table header "---prdoh_tableId:-:GrantsObjectiveTableId---"
    Then I see "Description" in flex table header "---prdoh_tableId:-:GrantsSpecialConditionTableId---"
    Then I see "Name" in flex table header "---prdoh_tableId:-:GrantsSpecialConditionTableId---"
    Then I see "EGMS ID" in flex table header "---prdoh_tableId:-:GrantsSpecialConditionTableId---"
    Then I see "Date Special Condition Effective Date" in flex table header "---prdoh_tableId:-:GrantsSpecialConditionTableId---"
    Then I see "Date Special Condition Removed" in flex table header "---prdoh_tableId:-:GrantsSpecialConditionTableId---"

  @66102 @ValidateCloseOutSubTabDetailsAtGrants   @positive
  Scenario: verify User able to see details under Closeout sub tab for grants
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 4" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I softly see the text containing :
      | Project Period Closeout Requests |
    Then I softly see "EGMS ID" in flex table header "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Type" in flex table header "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Project Period" in flex table header "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Closeout Due Date" in flex table header "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Assigned To" in flex table header "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Status" in flex table header "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"

  @66102 @ValidateInitiateButtonAtCloseOutSubTabDetailsAtGrants @smoke @wip
  Scenario: verify User able to see Initiate closeout button at Project Period Closeout Requests page block
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Test QA Test Award 123" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Test QA Test Award 123" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I pause execution for "2" seconds
    Then I can see top right button "Initiate Closeout" in flex table with id "---prdoh_tableId:-:GrantsProjectPeriodCloseoutTableId---"

  @66102 @ValidateAttachmentAndHistorySubTabDetailsAtGrants @smoke   @positive
  Scenario: verify User able to see details under Attachments and History sub tab for grants
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    When I navigate to "Attachments" sub tab
    Then I see the following top right buttons in table named "Attachments" :
      | Add |
    Then I see the following top right buttons in table named "Notes" :
      | Add |
    And I navigate to "History" sub tab
    Then I softly see the text containing :
      | Field History    |
      | Snapshot History |

  @66284 @ValidateGrantsDetailPageInEditMode-Grants-Draft
  Scenario Outline: verify User is navigated to grants edit page after clicking on edit icon of grant in draft state
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly can see row level action button "Edit" against "Draft" in flex table with id "{prdoh_tableId:GrantsTable}"
    And I click on "Edit" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    When I navigate to "Overview" sub tab
    Then I softly see fields "fieldProgram__c" is in edit mode
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I can see top right button "Edit" in page detail
    When I re-login as "<userType>" user on "default" portal
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    Then I softly cannot see row level action button "Edit" against "Draft" in flex table with id "{prdoh_tableId:GrantsTable}"
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I cannot see top right button "Edit" in page detail

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66284 @ValidateGrantsDetailPageInEditMode-Grants-Active
  Scenario Outline: verify User is not able to see edit button on page detail for Active grants detail page
    Given I login as "<userType>" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 4" inside flex table with id "{prdoh_tableId:GrantsTable}"
    Then I cannot see top right button "Edit" in page detail

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @66284 @verifyFieldsAtPageDetailsIsInReadAndEditModeForGrants @wip  @positive
  Scenario: Verify expected fields is in read mode only and in edit mode only at Grants detail page
    Given I login as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    When I click on "Edit" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Overview" sub tab
    Then I softly see that "fieldProjectTitle__c" rendered in view mode only
    Then I softly see that "fieldSponsorCode__c" rendered in view mode only
    Then I softly see that "fieldInternal_Organization_Code__c" rendered in view mode only
    Then I softly see that "fieldExternalOrganization__c" rendered in view mode only
    Then I softly see that "fieldInternalOrganization__c" rendered in view mode only
    Then I softly see that "fieldProjectPeriodStartDate__c" rendered in view mode only
    Then I softly see that "fieldProjectPeriodEndDate__c" rendered in view mode only
    Then I softly see fields "fieldGrantType__c" is in edit mode
    Then I softly see fields "fieldProgram__c" is in edit mode
    Then I softly see fields "fieldDataReportingSystem__c" is in edit mode
    Then I softly see fields "fieldBudgetCloseoutrequestRequired__c" is in edit mode
    Then I softly see fields "fielddrawdown_restriction__c" is in edit mode
    And I navigate to "Financials" sub tab

  @66284 @ValidateTotalRecordsOfInternalProgramInsideGrantDetailPage   @positive
  Scenario: verify total record count of internal program is same as inside of internal program lookup modal field at grants detail page
    Given I login as "GRANTEE PM" user
    When I navigate to "Planning" tab
    When I navigate to "{sidebar:InternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I save the total record value as "EnhanceGranteeStateProgramsgridTotalRecordId" from "Total Records" of table "EnhanceGranteeStateProgramsgrid"
    And I pause execution for "2" seconds
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I click search icon for look up field "Internal Program Lookup (New Window)" with clearing
    Then I softly see "Total records" value inside tableid "ModalDivID" as "{SavedValue:EnhanceGranteeStateProgramsgridTotalRecordId}"

  @66284 @ValidateSelectionInternalProgramAtGrantEditDetailPage-Grants-Draft  @positive
  Scenario: verify User is able to associate internal program to grants records
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "PG--0001" into field "fieldProgram__c"
    Then I softly see field "Internal Program" as "PG--0001"

  @66284 @ValidateEditingOfGrantDetailPageAtOverviewSubTab-Grants-Draft @smoke  @positive
  Scenario: verify User is able to edit grants details page
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "Project Grant" into field "fieldGrantType__c"
    And I enter value "PG--0001" into field "fieldProgram__c"
    And I enter value "Automation Test" into field "fieldDataReportingSystem__c"
    And I enter value "No" into field "fieldBudgetCloseoutrequestRequired__c"
    And I enter value "No" into field "fielddrawdown_restriction__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Internal Program" as "PG--0001"

  @66284 @ValidateEditingOfGrantDetailPageAtFinancialSubTab-Grants-Draft   @positive
  Scenario: verify User is able to edit grants details page
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "50000" into field "fieldTotalObligatedAmount__c"
    Then I softly see field "Total Anticipated Amount" as "$50,000.00"
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "-50000" into field "fieldTotalObligatedAmount__c"
    Then I softly see the following messages in the page details contains:
      | Financial Tab : Total Anticipated Amount should not negative. |
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    And I click on "Edit" in the page details
    And I click on "Cancel" in the page details
    Then I can see top right button "Edit" in page detail

  @66284 @verifyAttachmentSubTabFunctionalDetailsForGrant-Draft   @positive
  Scenario: Verify Attachment type and other details inside attachment sub tab at grants detail page
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    When I navigate to "Attachments" sub tab
    When I click on "Add" button inside attachments page block
    When I click modal button "Save"
    When I pause execution for "3" seconds
    Then I see the following messages in the page details :
      | Please choose a Document for upload.   |
      | Please provide Attachment Description. |
    Then I softly see "Coversheet:Notice of Award:Interim Award Document:Supporting Document:Technical Review:Terms and Conditions:Other" inside selectbox field "fieldOpportunityCategory__c"

  @66284 @verifyAdditionOfAttachmentUnderAttachmentSubTabForGrant-Draft @smoke   @positive
  Scenario: Verify user is able to add Attachment with type and other details inside attachment sub tab at grants detail page
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    When I navigate to "Attachments" sub tab
    When I upload attachment "AttachmentTesting.pdf" of type "Coversheet"
    When I pause execution for "3" seconds
    When I refresh the page
    Then I see table with header "Attachments" contains records "AttachmentTesting.pdf"

  @66284 @verifyAdditionOfNotesAtGrantDetailPageForGrant-Draft @smoke  @positive
  Scenario: Verify user is able to add Notes inside attachment sub tab at grants detail page
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    When I navigate to "Attachments" sub tab
    When I click on "Delete" icon for "Notes Record" inside table
    When I close alertbox
    And I add notes records
    And I close "Add Notes" modal by clicking the top right x button
    Then I see table with header "Notes" contains records "Notes Record"

  @66284 @verifyErrorMessageWhileAddingNotesForGrant-Draft
  Scenario: Verify Attachment type and other details inside attachment sub tab at grants detail page
    Given I login as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{sidebar:GrantsLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:GrantsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:GrantsTable}"
    When I navigate to "Attachments" sub tab
    When I click modal button "Save"
    When I pause execution for "3" seconds
    Then I see the following messages in the page details :
      | Please enter Required fields |