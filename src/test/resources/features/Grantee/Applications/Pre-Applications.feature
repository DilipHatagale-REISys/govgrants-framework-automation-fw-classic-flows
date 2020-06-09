@Pre-Applications @grantee-regression @grantee-parallel-regression
Feature: Pre-Applications related scenarios
  Test all scenarios related to Pre-Applications

  @63498 @TejalMarch2020 @ValidateColumnsOfPre-ApplicationListPage  @positive
  Scenario: verify columns of pre-application list page
    Given I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    Then I softly see "EGMS ID" in flex table header "{grantee_tableId:PreApplication}"
    Then I softly see "Opportunity Number" in flex table header "{grantee_tableId:PreApplication}"
    Then I softly see "Pre-Application Title" in flex table header "{grantee_tableId:PreApplication}"
    Then I softly see "Funding Organization" in flex table header "{grantee_tableId:PreApplication}"
    Then I softly see "Due Date" in flex table header "{grantee_tableId:PreApplication}"
    Then I softly see "Status" in flex table header "{grantee_tableId:PreApplication}"
    Then I softly see "Owner" in flex table header "{grantee_tableId:PreApplication}"
    Then I softly see "Actions" in flex table header "{grantee_tableId:PreApplication}"
    And I softly see the text containing :
      | Pre-Application - All |

  @63498 @TejalMarch2020 @ValidateSortingForPre-ApplicationListPage   @positive
  Scenario: verify Sorting for pre-application list page
    When I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I click on "EGMS ID" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "EGMS ID" is in "Ascending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "EGMS ID" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "EGMS ID" is in "Descending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Opportunity Number" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Opportunity Number" is in "Ascending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Opportunity Number" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Opportunity Number" is in "Descending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Pre-Application Title" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Pre-Application Title" is in "Ascending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Pre-Application Title" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Pre-Application Title" is in "Descending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Funding Organization" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Funding Organization" is in "Ascending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Funding Organization" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Funding Organization" is in "Descending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Due Date" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Due Date" is in "Descending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Status" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Status" is in "Ascending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Status" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Status" is in "Descending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Owner" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Owner" is in "Ascending" order of table id "{grantee_tableId:PreApplication}"
    When I click on "Owner" column header inside table with id "{grantee_tableId:PreApplication}"
    Then I softly see content of expected column "Owner" is in "Descending" order of table id "{grantee_tableId:PreApplication}"

  @63498 @TejalMarch2020 @ValidateAllFilterListRecordForPre-Application @needToExecute @wip   @positive
  Scenario: verify all filter list record for Pre-Application
    When I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    Then I softly see "Draft" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Reviewed" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Submitted for Review" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Rejected" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Not Accepted by Grantor" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Converted to Application" value in flex table id "{grantee_tableId:PreApplication}"

  @63498 @TejalMarch2020 @ValidateConvertedToApplicationFilterListRecordForPre-Application  @positive
  Scenario: verify Converted to Application filter list record for Pre-Application
    When I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - Converted to Application"
    Then I see value "Converted to Application" for title "Status" inside table "{grantee_tableId:PreApplication}"

  @63498 @TejalMarch2020 @ValidateDraftFilterListRecordForPre-Application @wip   @positive
  Scenario: verify draft filter list record for Pre-Application
    When I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - Draft"
    Then I softly see "Draft" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Reviewed" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Submitted for Review" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Rejected" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Approved" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Submitted for Approval to Application" value in flex table id "{grantee_tableId:PreApplication}"

  @63498 @TejalMarch2020 @ValidateSubmittedFilterListRecordForPre-Application @needtoexecute @wip   @positive
  Scenario: verify Submitted filter list record for Pre-Application
    When I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - Submitted"
    Then I softly see "Not Accepted by Grantor" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Accepted by Grantor" value in flex table id "{grantee_tableId:PreApplication}"
    Then I softly see "Submitted to Grantor" value in flex table id "{grantee_tableId:PreApplication}"

  @63498 @TejalMarch2020 @ValidateTotalCountOfRecordsForAllFilterOnPre-ApplicationListPage  @positive
  Scenario: verify total count of records for All filter on Pre-Application list page
    When I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And I select value inside table "{grantee_tableId:PreApplication}" is "All"
    And I pause execution for "5" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:PreApplication}" and table name "flextable"

  @63498 @TejalMarch2020 @ValidateTotalCountOfRecordsForConvertedToApplicationFilterOnPre-ApplicationListPage  @positive
  Scenario: verify total count of records for Converted to application filter on Pre-Application list page
    When I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - Converted to Application"
    And I select value inside table "{grantee_tableId:PreApplication}" is "All"
    And I pause execution for "5" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:PreApplication}" and table name "flextable"

  @63498 @TejalMarch2020 @ValidateTotalCountOfRecordsForSubmittedFilterOnPre-ApplicationListPage  @positive
  Scenario: verify total count of records for Submitted filter on Pre-Application list page
    When I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - Submitted"
    And I pause execution for "5" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:PreApplication}" and table name "flextable"

  @63498 @TejalMarch2020 @ValidateTotalCountOfRecordsForExpiredFilterOnPre-ApplicationListPage  @positive
  Scenario: verify total count of records for Expired filter on Pre-Application list page
    When I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - Expired"
    And I select value inside table "{grantee_tableId:PreApplication}" is "All"
    And I pause execution for "5" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:PreApplication}" and table name "flextable"

  @63498 @TejalMarch2020 @ValidateTotalCountOfRecordsForDraftFilterOnPre-ApplicationListPage  @positive
  Scenario: verify total count of records for Draft filter on Pre-Application list page
    When I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - Draft"
    And I pause execution for "5" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:PreApplication}" and table name "flextable"

  @63498 @TejalMarch2020 @ValidateQuickSearchFunctionalityWithValidAndInvalidDataOnPre-ApplicationListPage  @positive
  Scenario: verify quick search functionality with valid and invalid data
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Pre-Application Title" inside table "{grantee_tableId:PreApplication}"
    When I perform quick search for "abc265" in "{grantee_tableId:PreApplication}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:PreApplication}"

  @63498 @TejalMarch2020 @ValidateAdvanceSearchFunctionalityWithValidAndInvalidDataOnPre-ApplicationListPage   @positive
  Scenario: verify advance search functionality with valid and invalid data
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I click on advance filter "#advfOpenGranteePreApplications" of table id "{grantee_tableId:PreApplication}"
    When I enter advance filter values inside id "advfOpenGranteePreApplications"
      | Pre-Application Title | Starts with | {SavedValue:Automation Runtime Lead} |
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Pre-Application Title" inside table "{grantee_tableId:PreApplication}"
    And I refresh the page
    When I click on advance filter "#advfOpenGranteePreApplications" of table id "{grantee_tableId:PreApplication}"
    When I enter advance filter values inside id "advfOpenGranteePreApplications"
      | Opportunity Number | Starts with | 9098 |
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:PreApplication}"

  @63498 @TejalMarch2020 @validateRefreshFunctionalityForPre-Application  @positive
  Scenario: verify refresh functionality for Pre-Application
    Given I login as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I refresh the page
    Then I see table is refreshing

  @63498 @TejalMarch2020 @ValidateRecordNotCreatedByLoggedInUserOrganizationAreListed @wip @BugLoggedWith73656  @positive
  Scenario: verify record not created by logged in user organization are listed
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    When I re-login as "PM1" user on "default" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Pre-Application Title" inside table "{grantee_tableId:PreApplication}"

  @63498 @TejalMarch2020 @validateTotalRecordCountForUsersHavingSameOrganizationForPre-ApllicationListPage   @positive
  Scenario Outline: Validate total record count for Pre-Application list view with users having same organization
    Given I login as "<userType>" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - Draft"
    When I pause execution for "2" seconds
    Then I see total records count in flex table "{grantee_tableId:PreApplication}"
    Examples:
      | userType |
      | EXE      |
      | PM       |
      | PO       |
      | FD       |
      | FO       |

  @63674 @TejalMarch2020 @ValidatePre-ApplicationDetailsPageAndButtonsWhenPre-ApplicationIsInDraftState   @positive
  Scenario: verify Edit, Validate and Submit For Appoval buttons should be displayed to the record owner when Pre-Application is in Draft state
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly see field "Status" as "Draft"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail

  @63674 @TejalMarch2020 @ValidateButtonsWhenPre-ApplicationIsInSubmittedForReviewState   @positive
  Scenario: verify buttons when pre-application is in submitted for review state
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "Automation PM" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail

  @63674 @TejalMarch2020 @ValidateAssignedReviewerWithEditAccessShouldBeAbleToViewEditButtonForPre-Application   @positive
  Scenario: verify Assigned Reviewer With Edit Access should be able to View Edit button for Pre-Application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description | Due Date | Allow Record Editing |
      | Automation PO | Fiscal Reviewer | aaaaaaa     | 1        | Yes                  |
    And I click on "Send for Review" icon for "Automation PO" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I re-login as "PO" user on "default" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I can see top right button "Edit" in page detail

  @63674 @TejalMarch2020 @ValidateButtonsWhenPre-ApplicationIsInSubmittedforApprovalState
  Scenario: verify buttons when pre-application is in Submitted for Approval state
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    When I enter value "741123123" into field "fieldDUNS__c"
    When I enter value "ProjectAbstract" into field "fieldProjectAbstract__c"
    And I navigate to "Setup" sub tab
    When I enter value "Summary Budget" into field "fieldBudgetBuildupNeeded__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I check "Sample" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Projects"
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreAppOverview}" by clicking "Edit" :
      | Project Title | Budget Request |
      | Sample        | 25000          |
    And  I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    And I click on "Save and Continue" in the page details
    And I pause execution for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "5" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail

  @63674 @TejalMarch2020 @ValidatePre-ApplicationWithApprovedState   @positive
  Scenario: verify Pre-Application with Approved state
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"

  @63674 @TejalMarch2020 @ValidatePermissionsforNotARecordOwnerToViewEditPre-Application
  Scenario: verify Permissions to view Edit button for Pre-Application who is not a record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    When I re-login as "PO" user on "default" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    Then I cannot see row level action button "Edit" against "Draft" in flex table with id "{grantee_tableId:PreApplication}"

  @63674 @TejalMarch2020 @ValidatePermissionsforRecordOwnerToViewEditPre-Application   @positive
  Scenario: verify Permissions for record owner to view Edit button for Pre-Application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    Then I softly see value "Draft" for title "Status" inside table "{grantee_tableId:PreApplication}"
    Then I softly can see row level action button "Edit" against "Draft" in flex table with id "{grantee_tableId:PreApplication}"

  @63674 @TejalMarch2020 @ValidateEditButtonShouldNotBeDisplayedAfterReviewIsCompletedByTheAssignedReviewerForPreApplication
  Scenario: Edit button should not be displayed after review is completed by the assigned reviewer for pre application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description | Due Date | Allow Record Editing |
      | Automation PO | Fiscal Reviewer | aaaaaaa     | 1        | Yes                  |
    And I click on "Send for Review" icon for "Automation PO" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    And I click on "Complete Review" in the page details
    And I pause execution for "2" seconds
    And I re-login as "PO" user on "default" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I cannot see top right button "Edit" in page detail

  @63674 @TejalMarch2020 @ValidatePre-ApplicationDetailspage   @positive
  Scenario: verify Pre-Application Details page
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Setup" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Attachments" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page

  @63674 @TejalMarch2020 @ValidateHeaderSectionInPre-ApplicationDetailsPage   @positive
  Scenario: verify Header section in Pre-Application details page
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I see the header is "Pre Application" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Lead}" in the page details
    Then I softly see field "Status" as "Draft"
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    Then I softly see field "Days Left" as "0"
    Then I softly see status in Progress-bar is "Draft" and is "Green"

  @63674 @TejalMarch2020 @ValidatePre-ApplicationDetailPageLayout  @positive
  Scenario: Verify pre-application detail page layout
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Overview" sub tab
    And I softly see the text containing :
      | Opportunity Overview     |
      | Pre-Application Overview |
      | Related Programs         |
      | Project Abstract         |
      | System Information       |
    And I navigate to "Setup" sub tab
    And I softly see the text containing :
      | Project Period        |
      | Budget Information    |
      | Budget Period Details |
    And I navigate to "Budget" sub tab
    And I softly see the text containing :
      | Budget Overview       |
      | Indirect Rate Details |
      | Budget Period Details |
      | Program Income        |
    And I navigate to "Responsibilities" sub tab
    And I softly see the text containing :
      | Peer Reviewers |
      | Approvers      |
    And I navigate to "Attachments" sub tab
    And I softly see the text containing :
      | Attachments |
      | Notes       |
    And I navigate to "History" sub tab
    And I softly see the text containing :
      | Approval History |
      | Field History    |
      | Snapshot History |

  @63674 @TejalMarch2020 @ValidateFieldsOfSubTabsInPre-Application   @positive
  Scenario: verify fields of sub tab in pre-application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Lead}"
    And I navigate to "Setup" sub tab
    Then I softly see field "Budget Type" as "Non-Construction"
    And I navigate to "Budget" sub tab
    Then I softly see field "Cost Sharing or Match Requirement?" as "No Match"

  @63674 @TejalMarch2020 @ValidateToCheckPermissionsToViewAssociateButton
  Scenario: verify to Check Permissions for users other than record owner and  record owner to view Associate button
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Associate" in flex table with id "{grantee_tableId:PreAppOverview}"
    And I re-login as "PO" user on "default" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "{grantee_tableId:PreAppOverview}"

  @63674 @TejalMarch2020 @ValidateCheckPermissionForViewCreateBudgetPeriodAndAssociateFocusAreaButton  @positive
  Scenario Outline: verify permission for view create budget period and associate focus area button for record owner and non record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    Then I softly can see top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly can see top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly can see row level action button "Edit" against "BP01" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly can see row level action button "Delete" against "BP01" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I re-login to "As a Grantee" app as "userType" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    Then I softly cannot see top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly cannot see top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Examples:
      | userType |
      | ADMIN    |
      | FD       |
      | FO       |
      | EXE      |
      | PO       |

  @63674 @TejalMarch2020 @ValidateEditableFieldsOnSubTab  @positive
  Scenario: verify Editable fields on sub Tab for pre-application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see fields "fieldTitle__c" is in edit mode
    Then I softly see fields "fieldProjectPeriodStartDate__c" is in edit mode
    Then I softly see fields "fieldProjectPeriodEndDate__c" is in edit mode
    Then I softly see fields "fieldProjectDirectorContact__c" is in edit mode
    And I navigate to "Setup" sub tab
    Then I softly see fields "fieldBudgetBuildupNeeded__c" is in edit mode
    And I navigate to "Budget" sub tab
    Then I softly see fields "fieldMOEIndicator__c" is in edit mode
    Then I softly see fields "fieldFundingAgencyRestriction__c" is in edit mode
    Then I softly see fields "fieldProgramIncome__c" is in edit mode
    Then I softly see fields "fieldProgramIncomeJustification__c" is in edit mode

  @63674 @TejalMarch2020 @ValidateSummaryBudgetTemplateForBudgetPeriodDetails   @positive
  Scenario: verify Summary Budget template for Budget Period Details
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    When I enter value "Summary Budget" into field "fieldBudgetBuildupNeeded__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "2" seconds
    When I enter value "1" into field "fieldBudgetStartDate__c"
    When I enter value "2" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I check "Sample" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Period #" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "Start Date" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "End Date" in flex table header "{grantee_tableId:PreAppOverview}"
    And I expand nested table containing column value "BP01"
    And I expand nested table containing column value "Projects"
    Then I softly see "EGMS ID" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "Project Title" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "Budget Request" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "Actions" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I can see row level action button "Edit" against "$0" in flex table with id "{grantee_tableId:PreAppOverview}"

  @63674 @TejalMarch2020 @ValidateLineItemBudgetTemplateForBudgetPeriodDetails  @positive
  Scenario: verify Line Item Budget template for Budget Period Details
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    When I enter value "Line Item Budget" into field "fieldBudgetBuildupNeeded__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I enter value "1" into field "fieldBudgetStartDate__c"
    When I enter value "2" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I check "Sample" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Period #" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Budget Period Title" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Start Date" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "End Date" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    And I expand nested table containing column value "BP01"
    Then I softly see "Category" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Award Budget" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Cash Match" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Total Match" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Total Project Cost" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly can see row level action button "Edit" against "$0" in flex table with id "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"

  @63674 @TejalMarch2020 @ValidateDetailedLineItemBudgetTemplateForBudgetPeriodDetails  @positive
  Scenario: verify Detailed Line Item Budget template for Budget Period Details
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    When I enter value "Detailed Line Item Budget" into field "fieldBudgetBuildupNeeded__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "2" seconds
    When I enter value "1" into field "fieldBudgetStartDate__c"
    When I enter value "2" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I check "Sample" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Period #" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Start Date" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "End Date" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    And I expand nested table containing column value "BP01"
    Then I softly see "Category" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Award Budget" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Cash Match" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Total Match" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly see "Total Project Cost" in flex table header "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    Then I softly can see row level action button "Add Line Item Details" against "$0.00" in flex table with id "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"

  @63674 @TejalMarch2020 @ValidateOnClickOfAddLineItemButton  @positive
  Scenario: verify on click of add line item button
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    When I enter value "Detailed Line Item Budget" into field "fieldBudgetBuildupNeeded__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "2" seconds
    When I enter value "1" into field "BudgetStartDate__c"
    When I enter value "2" into field "BudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I check "Sample" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I click on "Add Line Item Details" icon for "Personnel" inside flex table with id "{grantee_tableId:BudgetDetailsForLineItemOnBudgetTab}"
    And I pause execution for "2" seconds
    Then I softly see "Title" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "Narrative" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "Award Budget" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "Cash Match" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "In-Kind Match" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "Total Match" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "Total Project Cost" in flex table header "{grantee_tableId:PreAppOverview}"
    Then I softly see "Actions" in flex table header "{grantee_tableId:PreAppOverview}"
    And I click on top right button "New" in flex table with id "{grantee_tableId:PreAppOverview}"
    Then I softly can see top right button "Save" in flex table with id "{grantee_tableId:PreAppOverview}"

  @63674 @TejalMarch2020 @ValidateHelpTextForProgramIncomeTreatmentTypeFieldFromBudgetTab  @positive
  Scenario Outline: verify Help Text for Program Income Treatment Type field from budget tab
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "3" seconds
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "3" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Budget" sub tab
    When I hovering mouse on help text icon inside page block detail "Program Income Treatment Type"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments). |

  @63674 @TejalMarch2020 @ValidateCheckPermissionsToViewNewButtonInPeerReviewersSectionForRecordOwner  @positive
  Scenario: verify Check Permissions to view New button in Peer Reviewers section for record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63674 @TejalMarch2020 @ValidateCheckPermissionsToViewNewButtonInPeerReviewersSectionForNotRecordOwner
  Scenario Outline: verify Check Permissions to view New button in Peer Reviewers section for not record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    When I re-login to "As a Grantee" app as "userType" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Examples:
      | userType |
      | ADMIN    |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @63674 @TejalMarch2020 @ValidateStatusAndActionFieldAfterReviewersDetailsAreAddedInPeerReviewSectionByRecordOwner  @positive
  Scenario: verify status and Action field after Reviewers details are added in Peer review section by record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | aaaaaaa     | 1        | No                   |
    Then I softly see value "Automation PM" for title "Reviewer Name" against the value "Program Reviewer" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "Created" for title "Status" against the value "Program Reviewer" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I can see row level action button "Edit" against "Created" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I can see row level action button "Delete" against "Created" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I can see row level action button "Send for Review" against "Created" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63674 @TejalMarch2020 @ValidateStatusOfReviewAfterPre-ApplicationIsSentForReview  @positive
  Scenario: verify status of review  after Pre-Application is sent for review
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "Automation PM" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    Then I see value "Sent for Review" for title "Status" against the value "Program Reviewer" inside table "{grantee_tableId:PreApplicationPeerReviewers}"

  @63674 @TejalMarch2020 @ValidateButtonsDisplayedToAssignedReviewerWhenPre-ApplicationIsSentforReview  @positive
  Scenario: verify buttons displayed to  assigned reviewer when Pre-Application is sent for review
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PO | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "Automation PO" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login as "PO" user on "default" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    Then I can see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63674 @TejalMarch2020 @ValidateActionsAfterClickOnCompleteReviewButton
  Scenario: verify actions after Click on Complete Review button
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "Automation PM" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I click on "Complete Review" in the page details
    And I pause execution for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly cannot see row level action button "Resend for Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63674 @TejalMarch2020 @ValidateAddedReviewByReviewer @wip @BugLoggedWith75461  @positive
  Scenario: verify Added Review by Reviewer
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I save the field labeled "Rating" as "rating"
    And I save the field labeled "Comments" as "comment"
    And I save the field labeled "Review Date" as "ReviewDate"
    And I close modal by clicking the top right x button
    And I expand nested table containing column value "Automation PM"
    Then I softly see value "Passed" for title "Rating" against the value "enterreviewcmnt" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "enterreviewcmnt" for title "Comments" against the value "Passed" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "{SavedValue:ReviewDate}" contains todays date withTime
    Then I softly can see row level action button "View" against "{SavedValue:ReviewDate}" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63674 @TejalMarch2020 @ValidatePre-ApplicationPageLevelButton @wip @BugLoggedWith75461  @positive
  Scenario: verify pre-application page level buttons
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | aaaaaaa     | 1        | No                   |
    Then I softly can see top right button "Submit For Approval" in page detail
    And I click on "Send for Review" icon for "Automation PM" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see the text "Review Successfully Initiated."
    Then I softly cannot see top right button "Submit For Approval" in page detail
    Then I softly can see top right button "Complete Review" in page detail

  @63674 @TejalMarch2020 @ValidateToCheckPermissionForViewButtonsOfAddedNotesForRecordOwner  @positive
  Scenario: verify to check permission for edit and delete buttons of added notes(Record Owner)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    And I add notes records
    And I close modal by clicking the top right x button
    Then I softly see row level action icon "Edit" against "Automation Notes" in Attachment and Notes Table
    Then I softly see row level action icon "Delete" against "Automation Notes" in Attachment and Notes Table

  @63674 @TejalMarch2020 @ValidateToCheckPermissionForViewButtonsOfAddedNotesForNotARecordOwner
  Scenario Outline: verify to check permission for edit and delete buttons of added notes(Not A Record Owner)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    And I add notes records
    And I close modal by clicking the top right x button
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "userType" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    Then I softly do not see row level action icon "Edit" against "Automation Notes" in Attachment and Notes Table
    Then I softly do not see row level action icon "Delete" against "Automation Notes" in Attachment and Notes Table
    Examples:
      | userType |
      | ADMIN    |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @63674 @TejalMarch2020 @ValidateCheckPermissionToViewNotesAddedToPre-Application  @positive
  Scenario Outline: verify to check permission to view added notes to pre-application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    And I add notes records
    And I close modal by clicking the top right x button
    When I re-login to "As a Grantee" app as "userType" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    When I click on "View" icon for "Automation Notes" inside table
    Then I see table with header "Notes" contains records "Notes Record"
    Examples:
      | userType |
      | ADMIN    |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @63674 @TejalMarch2020 @ValidateToCheckPermissionForViewEditButtonOfAddedAttachmentForRecordOwner  @positive
  Scenario: verify to Check permission for View Edit button of added Attachment(Record Owner)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I pause execution for "3" seconds
    Then I softly see row level action icon "Edit" against "Other" in Attachment and Notes Table
    Then I softly see row level action icon "Delete" against "Other" in Attachment and Notes Table

  @63674 @TejalMarch2020 @ValidateToCheckPermissionForViewEditButtonOfAddedAttachmentForNotARecordOwner
  Scenario Outline: verify to Check permission for View Edit button of added Attachment(Not A Record Owner)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "userType" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    Then I softly do not see row level action icon "Edit" against "Other" in Attachment and Notes Table
    Then I softly do not see row level action icon "Delete" against "Other" in Attachment and Notes Table
    Examples:
      | userType |
      | ADMIN    |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @63555 @TejalMarch2020 @ValidateToCheckTheDeleteButtonIsDisplayedOnTheListPageForOtherThanRecordOwner
  Scenario Outline: validate to check the delete button is displayed on the list page for other than record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I re-login to "As a Grantee" app as "userType" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    Then I cannot see row level action button "Delete" against "Draft" in flex table with id "{grantee_tableId:PreApplication}"
    Examples:
      | userType |
      | ADMIN    |
      | FD       |
      | FO       |
      | EXE      |

  @63555 @TejalMarch2020 @ValidateConfirmationMessageOnDeleteButton  @positive
  Scenario: validate confirmation message on delete button
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    When I click on "Delete" icon for "{SavedValue:Automation Runtime Lead}" inside table with table id "{grantee_tableId:PreApplication}" without processing
    Then I softly see confirmation box with body "Are you sure you want to permanently delete the draft pre-application?" is displayed
    When I click modal button "No"
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Pre-Application Title" against the value "Draft" inside table "{grantee_tableId:PreApplication}"
    When I click on "Delete" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly can see top right button "Create Pre-Application" in page detail

  @63507 @TejalMarch2020 @ValidateTheAvailabilityOfEditButtonOnTheListPageForRecordOwner  @positive
  Scenario Outline: verify the availabilibity of edit button on the list page for record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    Then I softly see value "Draft" for title "Status" against the value "{SavedValue:Automation Runtime Lead}" inside table "{grantee_tableId:PreApplication}"
    Then I softly can see row level action button "Edit" against "Draft" in flex table with id "{grantee_tableId:PreApplication}"
    And I re-login to "As a Grantee" app as "userType" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    Then I softly see value "Draft" for title "Status" against the value "{SavedValue:Automation Runtime Lead}" inside table "{grantee_tableId:PreApplication}"
    Then I cannot see row level action button "Edit" against "Draft" in flex table with id "{grantee_tableId:PreApplication}"
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | userType |
      | ADMIN    |
      | FD       |
      | FO       |
      | EXE      |
      | PM1      |

  @63507 @TejalMarch2020 @ValidateEditFunctionalityForPre-Application    @positive
  Scenario: verify validate edit functionality for pre-application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    When I click on "Cancel" in the page details
    Then I see the header is "Pre Application" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Lead}" in the page details
    When I click on "Edit" in the page details
    When I enter value "ProjectAbstract" into field "fieldProjectAbstract__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Project Abstract" as "ProjectAbstract"

  @63507 @TejalMarch2020 @ValidateProjectPeriodStartDateAndProjectPeriodEndDate    @positive
  Scenario: verify Project Period Start Date and Project Period End Date
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    When I enter value "-2" into field "ProjectPeriodStartDate__c"
    When I enter value "-1" into field "ProjectPeriodEndDate__c"
    When I click on "Save and Continue" in the page details
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    When I click on "Edit" in the page details
    When I enter value "1" into field "ProjectPeriodStartDate__c"
    When I enter value "1" into field "ProjectPeriodEndDate__c"
    When I click on "Save and Continue" in the page details
    Then I softly see the following messages in the page details contains:
      | Project period start date must be before project period end date |
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    When I enter value "1" into field "ProjectPeriodStartDate__c"
    When I enter value "-1" into field "ProjectPeriodEndDate__c"
    When I click on "Save and Continue" in the page details
    Then I softly see the following messages in the page details contains:
      | Project period start date must be before project period end date |
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    When I enter value "1" into field "ProjectPeriodStartDate__c"
    When I enter value "2" into field "ProjectPeriodEndDate__c"
    When I click on "Save and Continue" in the page details
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I navigate to "Setup" sub tab
    Then I softly see field "Estimated Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Estimated Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"

  @63507 @TejalMarch2020 @ValidateNon-EditableFieldsOnSetupAndBudgetSubTab
  Scenario: verify non-editable fiels on Setup and budget sub tab
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I navigate to "Overview" sub tab
    And I save the field labeled "Pre-Application Due Date" as "Pre-ApplicationDueDate"
    And I save the field labeled "Created Date" as "CreatedDate"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    And I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    When I enter value "1" into field "ProjectPeriodStartDate__c"
    When I enter value "2" into field "ProjectPeriodEndDate__c"
    When I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I navigate to "Setup" sub tab
    Then I softly see field "Estimated Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Estimated Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Type" as "Non-Construction"
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    Then I softly see field "Total Budget Request" as "$0.00"
    Then I softly see field "Cost Sharing or Match Requirement?" as "No Match"

  @63507 @TejalMarch2020 @ValidateNon-EditableFieldsOnOverviewSubTab @wip @BugLoggedWith75603  @positive
  Scenario: verify non-editable fiels on overview sub tab
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I navigate to "Overview" sub tab
    And I save the field labeled "Pre-Application Due Date" as "Pre-ApplicationDueDate"
    And I save the field labeled "Created Date" as "CreatedDate"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    And I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Lead}"
    Then I softly see field "Opportunity Number" as "AL-01"
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    And I pause execution for "3" seconds
    Then I softly see field "Award Ceiling" as "$30,000"
    Then I softly see field "Award Floor" as "$20,000"
    Then I softly see field "Opportunity Category" as "Discretionary"
    Then I softly see field "Pre-Application Due Date" as "{SavedValue:Pre-ApplicationDueDate}"
    Then I softly see field "Application Due Date" as "{SavedValue:ApplicationDueDate}"
    Then I softly see field "Total Budget Request" as "$0.00"
    Then I softly see field "Applying Internal Organization" as "Secretaria Auxiliar de Salud Familiar y Servicios Integrados"
    Then I softly see field "Created By" as "Automation PM"
    Then I softly see field "{SavedValue:CreatedDate}" contains todays date withTime
    Then I softly see field "Last Modified By" as "Automation PM"
    Then I softly see field "{SavedValue:LastModifiedDate}" contains todays date withTime

  @63507 @TejalMarch2020 @ValidateActionsOnBudgetSubTab @wip     @positive
  Scenario Outline: verify actions on budget sub tab
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Budget" sub tab
    And I pause execution for "2" seconds
    And I refresh the page
    When I enter value "Project 1" into field "fieldIndirect_Rate__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Indirect Rate" as "Project 1"
    And I click on "Cancel" in the page details
    And I click on "Edit" in the page details
    When I enter value "-----" into field "fieldProgramIncome__c"
    And I click on "Save and Continue" in the page details
    Then I softly see the text "Projected Program Income ($) : Invalid currency"
    When I click on "Cancel" in the page details
    And I click on "Edit" in the page details
    And I enter value "<enterValue>" into field "fieldProgramIncomeJustification__c"
    And I click on "Save and Continue" in the page details
    Then I softly see the text "Program Income Details:Data value too large. (max length=255)"
    When I click on "Cancel" in the page details
    And I click on "Edit" in the page details
    When I enter value "Invalid Data" into field "fieldFundingAgencyRestriction__c"
    And I click on "Save and Continue" in the page details
    Then I softly see the text "Restriction on Administrative or Indirect Costs : Invalid percent"
    Examples:
      | enterValue                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 |

  @63507 @TejalMarch2020 @ValidateModifiedDateOfPre-Appliaction  @positive
  Scenario: verify modified date of pre-application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    When I enter value "Project Abstract" into field "fieldProjectAbstract__c"
    When I click on "Save and Continue" in the page details
    Then I softly see field "Last Modified Date" contains todays date withTime

  @63507 @TejalMarch2020 @ValidateCancelAndSaveButtonActionOfAttachmentTab
  Scenario: verify cancel and save button action of attchment tab
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    When I click on "AddAttachments" button inside attachments page block
    And I close modal by clicking the top right x button
    Then I see the following top right buttons in table named "Attachments" :
      | Add |
    When I click on "AddAttachments" button inside attachments page block
    When I click modal button "Save"
    When I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Please choose a Document for upload.   |
      | Please provide Attachment Description. |

  @63507 @TejalMarch2020 @ValidateAttchmentDetails   @positive
  Scenario: verify attchment details
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    When I upload attachment "AttachmentTesting.pdf" of type "Other"
    When I pause execution for "3" seconds
    Then I softly see table with header "Attachments" contains records "AttachmentTesting.pdf"
    Then I softly see table with header "Attachments" contains records "Other"

  @63507 @TejalMarch2020 @ValidateNotesDetails   @positive
  Scenario: verify Notes details
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Attachments" sub tab
    When I click on "Add" button inside attachments page block
    When I click modal button "Save"
    When I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Please enter Required fields |
    And I close modal by clicking the top right x button
    And I add notes records
    And I close modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Notes Record"
    Then I softly see table with header "Notes" contains records "Automation Notes"

  @63909 @TejalMarch2020 @ValidateActionsOnCreateNewBudgetPeriodWindow @wip @BugLoggedWith75972
  Scenario: verify actions on Create New Budget Period Window
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "#LeadsFlexToggle" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "#LeadsFlexToggle"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "3" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "#AnnouncementsGranteeFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "#AnnouncementsGranteeFlexToggle"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
    And I edit the following rows inline in flex table with id "#AnnouncementRolesandResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name                  | Description |
      | Program Approver   | David Program Manager | prdoh       |
      | Executive Approver | Automation EXE        | prdoh       |
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    When I login as "EXE" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - All"
    And  I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "2" seconds
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Start Date is Required to save. |
      | End Date is Required to save.   |
    And I close modal by clicking the top right x button
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "2" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Start Date is Required to save. |
    And I close modal by clicking the top right x button
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "20" into field "fieldBudgetStartDate__c"
    And I pause execution for "4" seconds
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | End Date is Required to save. |
    And I close modal by clicking the top right x button
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "3" into field "fieldBudgetStartDate__c"
    And I enter value "2" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Budget end date can not be before start date |

  @63909 @TejalMarch2020 @ValidateBudgetPeriodDetailssection   @positive
  Scenario: verify Budget Period Details section
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "180" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I save the field labeled "Start Date" as "startdate"
    And I save the field labeled "End Date" as "enddate"
    And I close modal by clicking the top right x button
    And I pause execution for "5" seconds
    Then I softly see value "BP01" for title "Budget Period #" inside table "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly see value "{SavedValue:startdate}" for title "Start Date" inside table "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly see value "{SavedValue:enddate}" for title "End Date" inside table "{grantee_tableId:BudgetPeriodDetails}"
    And I click on "Edit" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly see field "Budget Period Name" as "BP01"

  @63909 @TejalMarch2020 @ValidateCreateMultipleBudgetPeriod  @positive
  Scenario: verify Record owner should be able to create multiple Budget period
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I pause execution for "2" seconds
    Then I softly see value "BP01" for title "Budget Period #" inside table "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "101" into field "fieldBudgetStartDate__c"
    And I enter value "185" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly see value "BP02" for title "Budget Period #" inside table "{grantee_tableId:BudgetPeriodDetails}"

  @63909 @TejalMarch2020 @ValidateEditBudgetPeriodWithValidDates  @positive
  Scenario: verify edit budget period with valid dates
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "75" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on "Edit" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "190" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I save the field labeled "Start Date" as "startdate"
    And I close modal by clicking the top right x button
    Then I softly see value "{SavedValue:startdate}" for title "Start Date" inside table "{grantee_tableId:BudgetPeriodDetails}"

  @63909 @TejalApril2020 @ValidateBudgetPeriodStartDateGreaterThanAndEndDateLessThanProjectPeriodDates
  Scenario: verify Budget Period Start date Greater than Project Period Start date and Budget Period End date Less than Project Period End date
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "55" into field "fieldBudgetStartDate__c"
    And I enter value "75" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The first budget period must begin on the project period start date |
      | The final budget period must end on the project period end date     |

  @63909 @TejalApril2020 @ValidateCreateBudgetperiodsWithHavingGapsBetweenEndDateOfFirstBudgetPeriodAndStartDateOfSecondBudgetPeriod
  Scenario: verify create Budget periods with having gaps between End Date of first budget period and Start date of second budget period
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "52" into field "fieldBudgetStartDate__c"
    And I enter value "60" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "65" into field "fieldBudgetStartDate__c"
    And I enter value "70" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Budget Period can not have gaps. Please check the start date of Budget Period BP02 and the end date of BP01 |

  @63909 @TejalApril2020 @ValidateEditBudgetPeriodWithEnteringEndDateGreaterThanExistingbudgetPeriodStartDate
  Scenario: verify Edit Budget Period with entering End date greater than Existing budget period Start date
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "55" into field "fieldBudgetStartDate__c"
    And I enter value "60" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    And I close modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "2" seconds
    And I enter value "62" into field "fieldBudgetStartDate__c"
    And I enter value "70" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on "Edit" icon for "BP02" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "59" into field "fieldBudgetStartDate__c"
    And I enter value "65" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Budget Periods cannot overlap. Please check the start date and end date of Budget Periods : BP02 and BP01 |

  @63909 @TejalApril2020 @ValidateEditBudgetPeriodWithEnteringStartDateLessThanExistingBudgetPeriodEndDate
  Scenario: verify Edit Budget Period with entering Start date less than Existing budget period End date
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "55" into field "fieldBudgetStartDate__c"
    And I enter value "75" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "76" into field "fieldBudgetStartDate__c"
    And I enter value "85" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on "Edit" icon for "BP02" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "70" into field "fieldBudgetStartDate__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Budget Periods cannot overlap. Please check the start date and end date of Budget Periods : BP02 and BP01 |

  @63909 @TejalApril2020 @ValidateToViewEditAndDeleteButtonsForBudgetPeriodRecord
  Scenario Outline: verify to view edit and delete buttons for budget period record
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "65" into field "fieldBudgetStartDate__c"
    And I enter value "75" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly can see row level action button "Edit" against "BP01" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly can see row level action button "Delete" against "BP01" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I re-login to "As a Grantee" app as "userType" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    Then I softly cannot see row level action button "Edit" against "BP01" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly cannot see row level action button "Delete" against "BP01" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Examples:
      | userType |
      | PO       |
      | EXE      |
      | FD       |
      | FO       |
      | ADMIN    |

  @63909 @TejalApril2020 @ValidateDeleteFunctionalityForBudgetPeriod  @positive
  Scenario: verify delete functionality for budget period
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "65" into field "fieldBudgetStartDate__c"
    And I enter value "75" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I save the field labeled "Start Date" as "startdate"
    And I close modal by clicking the top right x button
    When I click on "Delete" icon for "BP01" inside table with table id "{grantee_tableId:BudgetPeriodDetails}" without processing
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
    When I click modal button "No"
    Then I softly see value "BP01" for title "Budget Period #" against the value "{SavedValue:startdate}" inside table "{grantee_tableId:BudgetPeriodDetails}"
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"

  @63909 @TejalApril2020 @ValidateCreateStartDateAndEndDateLessThanExistingBudgetPeriodInTheBudgetPeriodDetailsSection  @positive
  Scenario: verify create Start date and End Date Less than Existing Budget period in the Budget Period details section
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "65" into field "fieldBudgetStartDate__c"
    And I enter value "75" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I save the field labeled "Start Date" as "startdate"
    And I close modal by clicking the top right x button
    And I pause execution for "5" seconds
    Then I softly see value "BP01" for title "Budget Period #" against the value "{SavedValue:startdate}" inside table "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "52" into field "fieldBudgetStartDate__c"
    And I enter value "60" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I save the field labeled "Start Date" as "startdate"
    And I close modal by clicking the top right x button
    And I pause execution for "5" seconds
    Then I softly see value "BP01" for title "Budget Period #" against the value "{SavedValue:startdate}" inside table "{grantee_tableId:BudgetPeriodDetails}"

  @63909 @TejalApril2020 @ValidateCreateBudgetPeriodWithStartDateAndEndDateOverlappingAlreadyExistingDatesInBudgetPeriodDetailsSection
  Scenario: verify create Budget Period with start date and end date overlapping already existing Dates in Budget Period Details section
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "65" into field "fieldBudgetStartDate__c"
    And I enter value "75" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "67" into field "fieldBudgetStartDate__c"
    And I enter value "77" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Budget Periods cannot overlap. Please check the start date and end date of Budget Periods : |
    And I enter value "72" into field "fieldBudgetStartDate__c"
    And I enter value "74" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Budget Periods cannot overlap. Please check the start date and end date of Budget Periods : |

  @63909 @TejalApril2020 @ValidateCreateBudgetPeriodWithStartDateAndEndDateLessThanAndGreaterThanProjectPeriodStartDateAndEndDate
  Scenario: verify Create Budget Period with start date and End Date less than Project Period Start Date and greater than project period end date
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "40" into field "fieldBudgetStartDate__c"
    And I enter value "45" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | The budget period dates must be equal to or within the project period dates. |
    And I enter value "205" into field "fieldBudgetStartDate__c"
    And I enter value "215" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | The budget period dates must be equal to or within the project period dates. |

  @63909 @TejalApril2020 @ValidateEditBudgetPeriodWithStartDateAndEndDateLessThanProjectPeriodStartDate
  Scenario: verify Edit Budget Period with start date and End Date less than Project Period Start Date
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "55" into field "fieldBudgetStartDate__c"
    And I enter value "60" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on "Edit" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "40" into field "fieldBudgetStartDate__c"
    And I enter value "45" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | The budget period dates must be equal to or within the project period dates. |

  @63909 @TejalApril2020 @ValidateRefreshFunctionalityForCreateBudgetPeriodDetails  @positive
  Scenario: verify refresh functionality for create budget period details
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    When I click on parallel lines menu bar with data target value "#PreAppSABudgetPeriodSetupFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Budget Period Details"
    Then I see table is refreshing

  @63909 @TejalApril2020 @ValidateQuickSearchFunctionalityForBudgetPeriodDetails    @positive
  Scenario: Quick Search functionality with valid, invalid and blank data for budget period details
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I enter value "65" into field "fieldBudgetStartDate__c"
    And I enter value "75" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    When I perform quick search for "BP01" in "{grantee_tableId:BudgetPeriodDetails}" panel
    Then I softly see value "BP01" for title "Budget Period #" inside table "{grantee_tableId:BudgetPeriodDetails}"
    When I perform quick search for "automation" in "{grantee_tableId:BudgetPeriodDetails}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"

  @63841 @TejalApril2020 @ValidateAvailabilityaOfSelectBudgetProjectsModalWindow   @positive
  Scenario: verify availability of Select Budget Projects modal window
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    Then I softly can see top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "No records are selected." inside flex table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I see total records count is same as total row of table id "{grantee_tableId:AssociateProjectsModal}" and table name "flextable"
    When I perform quick search for "BP01" in "{grantee_tableId:AssociateProjectsModal}" panel
    Then I softly see value "BP01" for title "Budget Period #" inside table "{grantee_tableId:AssociateProjectsModal}"
    When I close modal by clicking the top right x button
    Then I softly can see top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"

  @63841 @TejalApril2020 @ValidateRefreshFunctionalityForSelectBudgetPeriods   @positive
  Scenario: verify refresh functionality for Select Budget Periods
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I click on parallel lines menu bar with data target value "#toggleFlexTableSelectBudgetPeriod1"
    And I select "Refresh" from parallel lines dropdown of "Select Budget Period(s)"
    Then I see table is refreshing

  @63841 @TejalApril2020 @ValidateSortingFunctionalityForSelectBudgetPeriods  @positive
  Scenario: verify sorting functionality for Select Budget Periods
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "101" into field "fieldBudgetStartDate__c"
    And I enter value "190" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "2" seconds
    When I click on "Budget Period #" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "Budget Period #" is in "Ascending" order of table id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "Budget Period #" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "Budget Period #" is in "Descending" order of table id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "Start Date" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "Start Date" is in "Ascending" order of table id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "Start Date" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "Start Date" is in "Descending" order of table id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "End Date" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "End Date" is in "Ascending" order of table id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "End Date" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "End Date" is in "Descending" order of table id "{grantee_tableId:AssociateProjectsModal}"

  @63841 @TejalApril2020 @ValidateQuickSearchFunctionalityForSelectBudgetPeriods  @positive
  Scenario: verify Quick search functionality for Select Budget Periods
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I perform quick search for "BP01" in "{grantee_tableId:AssociateProjectsModal}" panel
    Then I softly see value "BP01" for title "Budget Period #" inside table "{grantee_tableId:AssociateProjectsModal}"
    When I perform quick search for "0029" in "{grantee_tableId:AssociateProjectsModal}" panel
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:AssociateProjectsModal}"

  @63841 @TejalApril2020 @ValidateAdvanceSearchFunctionalityForSelectBudgetPeriods  @positive
  Scenario: verify advance search functionality for Select Budget Periods
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "2" seconds
    When I click on advance filter "#advfpopupflextable1" of table id "{grantee_tableId:AssociateProjectsModal}"
    When I enter advance filter values inside id "{grantee_tableId:SelectBudgetPeriodsAdvanceFilter}"
      | Budget Period # | Starts with | BP |
    Then I softly see value "BP01" for title "Budget Period #" inside table "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "2" seconds
    When I click on advance filter "#advfpopupflextable1" of table id "{grantee_tableId:AssociateProjectsModal}"
    When I enter advance filter values inside id "{grantee_tableId:SelectBudgetPeriodsAdvanceFilter}"
      | Budget Period # | Starts with | DOC1 |
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:AssociateProjectsModal}"

  @63841 @TejalApril2020 @ValidateColumnsAvailableInTheSelectProject    @positive
  Scenario: verify available columns for select project
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "EGMS ID" in flex table header "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "Project Title" in flex table header "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "Internal Organization" in flex table header "{grantee_tableId:AssociateProjectsModal}"

  @63841 @TejalApril2020 @ValidateColumnValuesAvailableInTheSelectProject    @positive
  Scenario: verify available column values for select project
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "egmsid"
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    Then I softly see value "{SavedValue:egmsid}" for title "EGMS ID" inside table "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see value "{SavedValue:Automation Runtime Focus Area}" for title "Project Title" inside table "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see value "DC" for title "Internal Organization" inside table "{grantee_tableId:AssociateProjectsModal}"

  @63841 @TejalApril2020 @ValidateDraftProjects
  Scenario: verify draft projects should not be displayed
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:Projects}" panel
    Then I softly see value "Draft" for title "Status" inside table "{grantee_tableId:Projects}"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:AssociateProjectsModal}"

  @63841 @TejalApril2020 @ValidateInactiveProjects
  Scenario: verify Inactive projects should not be displayed
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I pause execution for "2" seconds
    And I click on "Deactivate" in the page details
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:Projects}" panel
    Then I softly see value "Inactive" for title "Status" inside table "{grantee_tableId:Projects}"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:AssociateProjectsModal}"

  @63841 @TejalApril2020 @ValidateRefreshFunctionalityForSelectProjects  @positive
  Scenario: verify refresh functionality for Select Projects
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    When I click on parallel lines menu bar with data target value "#toggleFlexTableSelectPreappGAT"
    And I select "Refresh" from parallel lines dropdown of "Select Project"
    Then I see table is refreshing

  @63841 @TejalApril2020 @ValidateSortingFunctionalityForSelectProjects  @positive
  Scenario: verify sorting functionality for Select Projects
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "EGMS ID" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "EGMS ID" is in "Ascending" order of table id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "EGMS ID" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "EGMS ID" is in "Descending" order of table id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "Project Title" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "Project Title" is in "Ascending" order of table id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "Project Title" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "Project Title" is in "Descending" order of table id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "Internal Organization" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "Internal Organization" is in "Ascending" order of table id "{grantee_tableId:AssociateProjectsModal}"
    When I click on "Internal Organization" column header inside table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see content of expected column "Internal Organization" is in "Descending" order of table id "{grantee_tableId:AssociateProjectsModal}"

  @63841 @TejalApril2020 @ValidateAvailabilityaOfSelectProjectsModalWindow  @positive
  Scenario: verify availability of Select Projects modal window
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "6" seconds
    Then I softly can see top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "No records are selected." inside flex table with id "{grantee_tableId:AssociateProjectsModal}"

  @63841 @TejalApril2020 @ValidateQuickSearchFunctionalityForSelectProject  @positive
  Scenario: verify available column values for select project
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    Then I softly see value "{SavedValue:Automation Runtime Focus Area}" for title "Project Title" inside table "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "abcd" in "{grantee_tableId:AssociateProjectsModal}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:AssociateProjectsModal}"

  @63841 @TejalApril2020 @ValidateMessageAfterSelectingOneBudgetPeriodWithOneAndMoreProjects @positive
  Scenario: verify message after selecting one budget period with one and more projects
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "Project Name" as "ProjectName1"
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area 2" into field "fieldTitle__c"
    And I enter value "Automation Description1" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "Project Name" as "ProjectName2"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I pause execution for "2" seconds
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:ProjectName1}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:ProjectName1}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "Projects added successfully to the pre-application" inside flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:ProjectName2}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:ProjectName2}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "Projects added successfully to the pre-application" inside flex table with id "{grantee_tableId:AssociateProjectsModal}"
    When I close modal by clicking the top right x button
    And I expand nested table containing column value "BP01"
    Then I softly see value "{SavedValue:ProjectName1}" for title "Project Title" inside table "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly see value "{SavedValue:ProjectName2}" for title "Project Title" inside table "{grantee_tableId:BudgetPeriodDetails}"

  @63841 @TejalApril2020 @ValidateMessageAfterSelectingOneProjectWithOneAndMoreBudgetPeriods  @positive
  Scenario: verify message after selecting one project with one and more budget periods
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "Project Name" as "ProjectName1"
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area 2" into field "fieldTitle__c"
    And I enter value "Automation Description1" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "Project Name" as "ProjectName2"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "101" into field "fieldBudgetStartDate__c"
    And I enter value "190" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:ProjectName1}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:ProjectName1}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "Projects added successfully to the pre-application" inside flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I check "BP02" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:ProjectName1}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:ProjectName1}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "The selected Projects have already been added to the pre-application." inside flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:ProjectName2}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:ProjectName2}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "Projects added successfully to the pre-application" inside flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    Then I see table is refreshing

  @63841 @TejalApril2020 @ValidateAvailabilityOfDeleteButtonForProjectsOnTheDetailPage
  Scenario Outline: verify availability of delete button for projects on the detail page
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Remove" against "DC" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I re-login to "As a Grantee" app as "userType" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly cannot see row level action button "Remove" against "DC" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Examples:
      | userType |
      | PO       |
      | EXE      |
      | FD       |
      | FO       |
      | ADMIN    |

  @63841 @TejalApril2020 @ValidateDeleteFunctionalityForProjectsOnTheDetailPage  @positive
  Scenario: verify delete functionality for projects on the detail page
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I expand nested table containing column value "BP01"
    And I click on "Remove" icon for "{SavedValue:Automation Runtime Focus Area}" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly see "Record deleted successfully." inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I see table is refreshing

  @64698 @TejalApril2020 @ValidateIndirectRateSearchListShouldBeDisplayed  @positive
  Scenario: verify Indirect Rate Search list should be displayed
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Budget" sub tab
    When I click search icon for look up field "Indirect Rate Lookup (New Window)" with clearing
    And I pause execution for "2" seconds
    Then I see modal box with body "Indirect Rates" is displayed

  @64698 @TejalApril2020 @ValidateQuickSearchFunctionalityForIndirectRateSearchList  @positive
  Scenario: verify quick search functionality for Indirect Rate Search list
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Budget" sub tab
    When I click search icon for look up field "Indirect Rate Lookup (New Window)" with clearing
    And I pause execution for "5" seconds
    And I perform quick search for "Test1" in "{grantee_tableId:IndirectRateModal}" panel
    Then I softly see value "Test1" for title "Title" inside table "{grantee_tableId:IndirectRateModal}"
    And I perform quick search for "t10" in "{grantee_tableId:IndirectRateModal}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:IndirectRateModal}"

  @64698 @TejalApril2020 @ValidateSelectingIndirectRate   @positive
  Scenario: Verify selecting Indirect Rate
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Budget" sub tab
    When I enter value "Test1" into field "fieldIndirect_Rate__c"
    And I click on "Save and Continue" in the page details
    When I save the field labeled "Indirect Budget Category" as "IndirectBudgetCategory"
    When I save the field labeled "Period From" as "PeriodFrom"
    When I save the field labeled "Period To" as "PeriodTo"
    Then I softly see field "Indirect Rate" as "Test1"
    Then I softly see field "Indirect Budget Category" as "{SavedValue:IndirectBudgetCategory}"
    Then I softly see field "Indirect Cost Rate" as "10.00"
    Then I softly see field "Indirect Cost Rate Type" as "Final"
    Then I softly see field "Period From" as "{SavedValue:PeriodFrom}"
    Then I softly see field "Period To" as "{SavedValue:PeriodTo}"

  @64698 @TejalApril2020 @ValidateIndirectRateLinkText  @positive
  Scenario: verify Indirect Rate Link Text
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Budget" sub tab
    When I enter value "Test1" into field "fieldIndirect_Rate__c"
    And I click on "Save and Continue" in the page details
    And I click "Test1" lookup link
    Then I see field "Title" as "Test1"

  @63693 @TejalApril2020 @ValidatePermissionForAssigningReviewersToPre-Application   @positive
  Scenario Outline: verify Permission for Assigning Reviewers to Pre-Application(New Button)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login to "As a Grantee" app as "userType" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Examples:
      | userType |
      | PO       |
      | EXE      |
      | FD       |
      | FO       |
      | ADMIN    |

  @63693 @TejalApril2020 @ValidateAssignReviewersToPre-Application   @positive
  Scenario: verify Assign Reviewers to Pre-Application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | aaaaaaa     | 1        | No                   |
    Then I softly see value "Automation PM" for title "Reviewer Name" against the value "Program Reviewer" inside table "{grantee_tableId:PreApplicationPeerReviewers}"

  @63693 @TejalApril2020 @ValidateCheckPermissionToAssignProgramReviewerAndFiscalReviewer  @positive
  Scenario: verify Check permission to assign Program Reviewer
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PO | Program Reviewer | aaaaaaa     | 1        | No                   |
    Then I softly see value "Automation PO" for title "Reviewer Name" against the value "Program Reviewer" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description | Due Date | Allow Record Editing |
      | PRDOH PMUser  | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    Then I softly see value "PRDOH PMUser" for title "Reviewer Name" against the value "Fiscal Reviewer" inside table "{grantee_tableId:PreApplicationPeerReviewers}"

  @63693 @TejalApril2020 @ValidateDueDateWithInvalidDate
  Scenario: verify Enter Due Date with Invalid date for Assigning Reviewers to Pre-Application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | automation review | -1       | No                   |
    Then I softly see "Due Date should be greater than Today's Date" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63693 @TejalApril2020 @ValidateAllowRecordEditingOptionWithYes
  Scenario: verify Allow Record Editing option with Yes with Created status
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation EXE | Program Reviewer | automation review | 1        | Yes                  |
    When I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly cannot see top right button "Edit" in page detail

  @63693 @TejalApril2020 @ValidateEditFunctionalityWithEditAccessForAssignedReviewerIsYesAndStateOfReviewIsReviewCompleted
  Scenario: verify Edit functionality with Edit Access for assigned reviewer is Yes and State of review is 'Review Completed'
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation EXE | Program Reviewer | automation review | 1        | Yes                  |
    And I click on "Send for Review" icon for "Automation EXE" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "5" seconds
    When I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I click modal button "Submit Review"
    And I pause execution for "2" seconds
    And I close modal by clicking the top right x button
    Then I softly see value "Review Completed" for title "Status" against the value "Yes" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly can see row level action button "Resend for Review" against "Review Completed" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly cannot see top right button "Edit" in page detail

  @63693 @TejalApril2020 @ValidateEditFunctionalityWithEditAccessForAssignedReviewerIsYesAndStateOfReviewIsSentForReview
  Scenario: verify Edit functionality with Edit Access for assigned reviewer is Yes and State of review is 'Sent for Review'
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | automation review | 1        | Yes                  |
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "5" seconds
    Then I softly see value "Sent for Review" for title "Status" against the value "Yes" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login to "As a Grantee" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly can see top right button "Edit" in page detail

  @63693 @TejalApril2020 @ValidateAllowRecordEditingOptionWithNoOption
  Scenario: verify Allow Record Editing option with No option
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation FD | Fiscal Reviewer | automation review | 1        | No                   |
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63693 @TejalApril2020 @ValidateActionsForAddedReviewersInPeerReviewSection    @positive
  Scenario: verify Added Reviewers in Peer Review Section
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | automation review | 1        | No                   |
    And I pause execution for "2" seconds
    Then I softly see value "Created" for title "Status" against the value "Automation PM" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly can see row level action button "Send for Review" against "Created" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63693 @TejalApril2020 @validateAddMultipleReviewersForEachRole  @positive
  Scenario: verify Add Multiple Reviewers for each role
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | automation review | 1        | No                   |
    And I pause execution for "2" seconds
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation FO | Program Reviewer | automation review | 1        | No                   |
    And I pause execution for "2" seconds
    Then I softly see value "Program Reviewer" for title "Responsibility" against the value "Automation FO" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "Fiscal Reviewer" for title "Responsibility" against the value "Automation FO" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation FD | Fiscal Reviewer | automation review | 1        | No                   |
    And I pause execution for "2" seconds
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | automation review | 1        | No                   |
    And I pause execution for "2" seconds
    Then I softly see value "Program Reviewer" for title "Responsibility" against the value "Automation FD" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "Fiscal Reviewer" for title "Responsibility" against the value "Automation FD" inside table "{grantee_tableId:PreApplicationPeerReviewers}"

  @63693 @TejalApril2020 @ValidateDeleteFunctionalityForAssignedReviwerBeforeSendingForReview  @positive
  Scenario: verify delete functionality for assigned reviwer before sending for review
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | automation review | 1        | No                   |
    Then I softly see value "Created" for title "Status" against the value "Automation PM" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    And I click on "Delete" icon for "Automation PM" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see "Record deleted successfully." inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63693 @TejalApril2020 @ValidateAddedReviewAfterClickOnExpandButton  @positive
  Scenario: verify Added Review after click on expand button
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation FD | Fiscal Reviewer | automation review | 1        | Yes                  |
    And I click on "Send for Review" icon for "Automation FD" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "5" seconds
    When I re-login to "As a Grantee" app as "FD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I save the field labeled "Review Date" as "reviewdate"
    And I close modal by clicking the top right x button
    When I expand nested table containing column value "Automation FD"
    Then I softly see value "Passed" for title "Rating" against the value "enterreviewcmnt" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "enterreviewcmnt" for title "Review Comments" against the value "Passed" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "{SavedValue:reviewdate}" for title "Review Date" against the value "Passed" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly can see row level action button "View" against "{SavedValue:reviewdate}" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63693 @TejalApril2020 @ValidateSendReviewFromLoggedInUserWhichIsAlsoTheRecordOwnerWithAllowRecordEditingOptionWithYesAndNo  @positive
  Scenario: verify Send review from logged in user which is also the record owner with Allow Record Editing option with Yes and no
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | automation review | 1        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | automation review | 1        | Yes                  |
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    Then I softly can see top right button "Edit" in page detail

  @63693 @TejalApril2020 @ValidateResponsibilityDropDownValues
  Scenario: verify responsibility drop down values and all required fields
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see ":Program Reviewer:Fiscal Reviewer:--None--" inside selectbox field "ReviewerRole__c"

  @63693 @TejalApril2020 @QuickSearchFunctionalityForPeerReviewersForPreApplication  @positive
  Scenario: verify quick search functionality for peer reviewers for pre application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | automation review | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I perform quick search for "Automation PM" in "{grantee_tableId:PreApplicationPeerReviewers}" panel
    Then I softly see value "Automation PM" for title "Reviewer Name" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    And I perform quick search for "test" in "{grantee_tableId:PreApplicationPeerReviewers}" panel
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @63693 @TejalApril2020 @ValidateRefreshFunctionalityForPeerReviewersInPreApplication  @positive
  Scenario: verify refresh functionality for peer reviewers in pre application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I click on parallel lines menu bar with data target value "#GranteePreApplicationReviewersTempFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Peer Reviewers"
    Then I see table is refreshing

  @63693 @TejalApril2020 @ValidateAddReviewersFunctionalityAfterRecordOwnerClickOnCompleteReviewButton
  Scenario: verify add Reviewers after record owner click on Complete Review button
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | automation review | 1        | Yes                  |
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    And I pause execution for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @66525 @TejalApril2020 @ValidateSendForReviewIconActionsForRecordOwner_ProgramReviewer  @positive
  Scenario: verify send for review icon actions for record owner(Program reviewer)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | automation review | 1        | Yes                  |
    Then I can see row level action button "Send for Review" against "Created" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I can see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66525 @TejalApril2020 @ValidateSendForReviewIconActionsForRecordOwner_FiscalReviewer  @positive
  Scenario: verify send for review icon actions for record owner(Fiscal Reviewer)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | automation review | 1        | Yes                  |
    Then I can see row level action button "Send for Review" against "Created" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly can see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66525 @TejalApril2020 @ValidateSendForReviewIconActionsForNotARecordOwner_FiscalReviewer @positive
  Scenario: verify send for review icon actions for not a record owner(Fiscal Reviewer)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | automation review | 1        | Yes                  |
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66525 @TejalApril2020 @ValidateSendForReviewIconActionsForNotARecordOwner_ProgramReviewer  @positive
  Scenario: verify send for review icon actions for not a record owner(Program Reviewer)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation FO | Program Reviewer | automation review | 1        | Yes                  |
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66525 @TejalApril2020 @ValidateSendForReviewIconActionsForReviewerWhoIsFromDifferentOrganization  @positive
  Scenario: verify send for review icon actions for program/fiscal reviewer who is from different organization
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | PRDOH PMUser  | Program Reviewer | automation review | 1        | Yes                  |
    And I pause execution for "5" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login as "PM1" user on "default" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66525 @TejalApril2020 @ValidateSendForReviewIconActionsForMultipleProgramReviewers  @positive
  Scenario: verify send for review icon actions for multiple Program Reviewers
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | automation review | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation EXE | Program Reviewer | automation review | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login to "As a Grantee" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"
    When I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66525 @TejalApril2020 @ValidateSendForReviewIconActionsForMultipleFiscalReviewers  @positive
  Scenario: verify send for review icon actions for multiple Fiscal Reviewers
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation FD | Fiscal Reviewer | automation review | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation EXE | Fiscal Reviewer | automation review | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login to "As a Grantee" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"
    When I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66525 @TejalApril2020 @ValidateColumnsAvailableInThePendingTaskList  @positive
  Scenario: verify columns available in the pending task list
    Given I login as "PM" user
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "5" seconds
    Then I softly see "EGMS ID" in flex table header "{grantee_tableId:PendingTask}"
    Then I softly see "Task Type" in flex table header "{grantee_tableId:PendingTask}"
    Then I softly see "Subject" in flex table header "{grantee_tableId:PendingTask}"
    Then I softly see "Assigned By" in flex table header "{grantee_tableId:PendingTask}"
    Then I softly see "Created Date" in flex table header "{grantee_tableId:PendingTask}"
    Then I softly see "Due Date" in flex table header "{grantee_tableId:PendingTask}"

  @66525 @TejalApril2020 @ValidateColumnValuesAvailableInThePendingTaskList @wip  @positive
  Scenario: verify column values available in the pending task list
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | automation review | 0        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"
    Then I softly see value "{SavedValue:egmsid}" for title "EGMS ID" inside table "{grantee_tableId:PendingTask}"
    Then I softly see value "Review Pre-Application (Grantee)" for title "Task Type" inside table "{grantee_tableId:PendingTask}"
    Then I softly see value "Automation PM" for title "Assigned By" inside table "{grantee_tableId:PendingTask}"
    Then I softly see field "Created Date" contains todays date withTime
    Then I softly see field "Due Date" contains todays date withTime

  @64646 @TejalApril2020 @ValidateEditFunctionalityForBudgetRequestWithSummaryBudgetLevel  @positive
  Scenario: verify edit functionality for budget request with Summary Budget level
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    Then I softly see field "Budget Level" as "Summary Budget"
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title                              | Budget Request |
      | {SavedValue:Automation Runtime Focus Area} | 25000          |
    Then I softly see value "$25,000.00" for title "Budget Request" inside table "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}"

  @64646 @TejalApril2020 @ValidateUserEntersBudgetRequestForMultipleProjectsWithSummaryBudgetLevel  @positive
  Scenario: verify user enters budget request for multiple projects with Summary Budget level
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I save the field labeled "Project Name" as "ProjectName1"
    And I click on "Activate" in the page details
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description1" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I save the field labeled "Project Name" as "ProjectName2"
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "101" into field "fieldBudgetStartDate__c"
    And I enter value "120" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:ProjectName1}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:ProjectName1}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP02" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:ProjectName2}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:ProjectName2}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title             | Budget Request |
      | {SavedValue:ProjectName1} | 25000          |
    And I pause execution for "2" seconds
    And I expand nested table containing column value "Projects" inside nested table containing "BP02"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title             | Budget Request |
      | {SavedValue:ProjectName2} | 20000          |
    And I refresh the page
    And I save the field labeled "Total Budget Request" as "totalbudgetrequest"
    Then I softly see field "Total Budget Request" as "{SavedValue:totalbudgetrequest}"

  @64738 @TejalApril2020 @ValidateUserEntersBudgetCategoryWithLineItemBudgetLevel  @positive
  Scenario: verify user enters budget category with Line Item Budget level
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    When I enter value "Line Item Budget" into field "fieldBudgetBuildupNeeded__c"
    And I click on "Save and Continue" in the page details
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetLevelWithLineItem}" by clicking "Edit" :
      | Category | Award Budget | Cash Match |
      | Travel   | 25000        | 10000      |
    And I pause execution for "2" seconds
    And I perform quick search for "Travel" in "{grantee_tableId:BudgetCategorySearch}" panel
    Then I softly see value "$25,000.00" for title "Award Budget" inside table "{grantee_tableId:BudgetLevelWithLineItem}"
    Then I softly see value "$10,000.00" for title "Cash Match" inside table "{grantee_tableId:BudgetLevelWithLineItem}"
    And I refresh the page
    And I save the field labeled "Total Budget Request" as "totalbudgetrequest"
    Then I softly see field "Total Budget Request" as "{SavedValue:totalbudgetrequest}"

  @66262 @TejalApril2020 @ValidateUserEntersBudgetCategoryWithDetailedLineItemBudgetLevel  @positive
  Scenario: verify user enters budget category with Detailed Line Item Budget level
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    When I enter value "Detailed Line Item Budget" into field "fieldBudgetBuildupNeeded__c"
    And I click on "Save and Continue" in the page details
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "5" seconds
    And I enter value "49" into field "fieldBudgetStartDate__c"
    And I enter value "100" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I click on "Add Line Item Details" icon for "Travel" inside flex table with id "{grantee_tableId:BudgetLevelWithLineItem}"
    When I enter the following values into flex table with id "{grantee_tableId:AddLineItemBudgetModal}" by clicking "New" :
      | Title                      | Narrative | Award Budget | Cash Match | In-Kind Match |
      | Automation Budget Category | Test      | 25000        | 20000      | 10000         |
    Then I softly see value "Automation Budget Category" for title "Title" inside table "{grantee_tableId:AddLineItemBudgetModal}"
    Then I softly see value "Test" for title "Narrative" inside table "{grantee_tableId:AddLineItemBudgetModal}"
    Then I softly see value "$25,000.00" for title "Award Budget" inside table "{grantee_tableId:AddLineItemBudgetModal}"
    Then I softly see value "$20,000.00" for title "Cash Match" inside table "{grantee_tableId:AddLineItemBudgetModal}"
    Then I softly see value "$10,000.00" for title "In-Kind Match" inside table "{grantee_tableId:AddLineItemBudgetModal}"
    Then I softly see value "$55,000.00" for title "Total Project Cost" inside table "{grantee_tableId:AddLineItemBudgetModal}"
    And I close modal by clicking the top right x button
    And I refresh the page
    And I save the field labeled "Total Budget Request" as "totalbudgetrequest"
    Then I softly see field "Total Budget Request" as "{SavedValue:totalbudgetrequest}"

  @66574 @TejalApril2020 @ValidatePlayButtonToExecuteTheTaskForPreApplication  @positive
  Scenario: verify play button to execute the task for pre application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | automation review | 0        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    Then I can see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"

  @66574 @TejalApril2020 @ValidateEnterReviewFunctionality  @positive
  Scenario: verify enter review functionality
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | automation review | 0        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I save the field labeled "Rating" as "rating"
    And I save the field labeled "Comments" as "comment"
    And I save the field labeled "Review Date" as "ReviewDate"
    And I close modal by clicking the top right x button
    And I expand nested table containing column value "Automation PM"
    Then I softly see value "Passed" for title "Rating" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "enterreviewcmnt" for title "Review Comments" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "{SavedValue:ReviewDate}" for title "Review Date" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly can see row level action button "View" against "{SavedValue:ReviewDate}" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"

  @66574 @TejalApril2020 @ValidateEnterReviewFunctionalityToReviewerWhoIsNotTheRecordOwner  @positive
  Scenario: verify enter review functionality to reviewer who is not the record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | automation review | 0        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login to "As a Grantee" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I save the field labeled "Rating" as "rating"
    And I save the field labeled "Comments" as "comment"
    And I save the field labeled "Review Date" as "ReviewDate"
    And I close modal by clicking the top right x button
    Then I softly see value "In Progress" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly cannot see row level action button "Resend for Review" against "In Progress" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I expand nested table containing column value "Automation FD"
    Then I softly see value "Passed" for title "Rating" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "enterreviewcmnt" for title "Review Comments" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "{SavedValue:ReviewDate}" for title "Review Date" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    And I click on "View" icon for "Passed" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "5" seconds
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button

  @66574 @TejalApril2020 @ValidateEditAndSubmitReviewFunctionalityForEnteredReview @positive
  Scenario: verify Edit and submit review functionality for entered review
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation PO | Fiscal Reviewer | automation review | 0        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    When I re-login as "PO" user on "default" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    And I click modal button "Edit"
    And I enter value "Failed" into field "fieldRating__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click modal button "Submit Review"
    And I pause execution for "2" seconds
    Then I softly see the text "Review successfully submitted"
    And I close modal by clicking the top right x button
    Then I softly see value "Review Completed" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly can see row level action button "Resend for Review" against "Review Completed" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I expand nested table containing column value "Automation PO"
    Then I softly see value "enterreviewcmnt11" for title "Review Comments" inside table "{grantee_tableId:PreApplicationPeerReviewers}"

  @66574 @TejalApril2020 @ValidatePageLevelEditFunctionalityWithallowEditingOptionIsSetToYes  @positive
  Scenario: verify page level edit functionality with allow editing option is set to yes
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    And I click on "Save" in the page details
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation EXE | Program Reviewer | automation review | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    When I clear the value from field "fieldTitle__c"
    And I click on "Save and Continue" in the page details
    Then I softly see the following messages in the page details contains:
      | Pre-Application Title is Required to save under Overview. |
    When I enter value "{SavedValue:Automation Runtime Lead}" into field "fieldTitle__c"
    When I enter value "Automation Project Abstract" into field "fieldProjectAbstract__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Project Abstract" as "Automation Project Abstract"

  @66574 @TejalApril2020 @ValidateResendReviewFunctionalityForReviewerWhoIsRecordOwner @wip @BugLoggedWith77474  @positive
  Scenario: verify resend review functionality for reviewer who is record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | automation review | 0        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    And I click modal button "Submit Review"
    And I close modal by clicking the top right x button
    And I click on "Resend for Review" icon for "Review Completed" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "resendcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    And I click modal button "Edit"
    And I enter value "Failed" into field "fieldRating__c"
    And I pause execution for "2" seconds
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click modal button "Submit Review"
    Then I softly see the text "Review successfully submitted"

  @66574 @TejalApril2020 @ValidateResendReviewFunctionalityForReviewerWhoIsNotARecordOwner @wip @BugLoggedWith77474 @positive
  Scenario: verify resend review functionality for reviewer who is not a record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description       | Due Date | Allow Record Editing |
      | Automation FD | Fiscal Reviewer | automation review | 0        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "FD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    And I click modal button "Submit Review"
    And I close modal by clicking the top right x button
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Resend for Review" icon for "Review Completed" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "FD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "resendcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    And I click modal button "Edit"
    And I enter value "Failed" into field "fieldRating__c"
    And I pause execution for "2" seconds
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click modal button "Submit Review"
    Then I softly see the text "Review successfully submitted"

  @66574 @TejalApril2020 @ValidateActionsAfterClickOnTheCompleteReviewButtonWhenTheRecordLevelStatusForAssignedReviewersIsSentForReview
  Scenario: verify actions after Click on the complete review button when the record level status for assigned reviewer(s) is Sent for Review
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | automation review | 2        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:PreApplicationPeerReviewers}"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    Then I softly cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    When I re-login to "As a Grantee" app as "FD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly do not see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66574 @TejalApril2020 @ValidateAvailabilityOfButtonsOnTheRecordIfAllowEditingForReviewerIsSetToYes @wip @BugLoggedWith77601  @positive
  Scenario: verify Verify availability of buttons on the record if allow editing for reviewer is set to yes
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description       | Due Date | Allow Record Editing |
      | Automation PO | Program Reviewer | automation review | 2        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:PreApplicationPeerReviewers}"
    And I pause execution for "2" seconds
    And I navigate to "Budget" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    When I re-login as "PO" user on "default" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Associate" in flex table with id "{grantee_tableId:PreAppOverview}"
    And I navigate to "Setup" sub tab
    Then I softly can see top right button "Create Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    Then I softly can see top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    Then I softly can see row level action button "Edit" against "$0.00" in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}"
    And I navigate to "Attachments" sub tab
    Then I see the following top right buttons in table named "Attachments" :
      | Add |
    Then I see the following top right buttons in table named "Notes" :
      | Add |

  @63833 @TejalApril2020 @ValidateAddApproversToPre-ApplicationFunctionality  @positive
  Scenario: verify Add Approvers to Pre-Application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | PRDOH PMUser   | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |

  @63833 @TejalApril2020 @ValidateResponsibilityFieldIsInReadOnlyModeFromApproversAndCheckSaveOption  @positive
  Scenario: responsibility field is in read only mode from approvers and check save option
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Program Approver" for title "Responsibility" inside table "{grantee_tableId:PreApplicationApprovers}"
    And I click on "Edit" icon for "Program Approver" inside flex table with id "{grantee_tableId:PreApplicationApprovers}"
    Then I softly can see top right button "Save" in flex table with id "{grantee_tableId:PreApplicationApprovers}"

  @63833 @TejalApril2020 @ValidateEditFunctionalityForApprovers  @positive
  Scenario: verify edit functionality for approvers
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | PRDOH PMUser   | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility   | Name          | Description |
      | Program Approver | Automation PM | prdoh       |
    Then I softly see value "Automation PM" for title "Name" inside table "{grantee_tableId:PreApplicationApprovers}"

  @63901 @TejalApril2020 @ValidateApproveFunctionalityForPre-Application  @positive
  Scenario: verify approve functionality for pre application
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title                              | Budget Request |
      | {SavedValue:Automation Runtime Focus Area} | 25000          |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    And I click on "Submit for Approval" in the page details
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    Then I can see the approval decision
    When I select radio button "Approve" in the approval decision
    Then I can see the comment box in the approval decision
    When I enter comment "Automation Testing" in the approval decision
    When I submit the approval in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"

  @63901 @TejalApril2020 @ValidateStateOfPre-ApplicationAfterGettingApprovalFromAllAssignedApprovers  @positive
  Scenario: verify State of Pre-Application after getting approval from All assigned approvers
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title                              | Budget Request |
      | {SavedValue:Automation Runtime Focus Area} | 25000          |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Approved"

  @63902 @TejalApril2020 @ValidateSendtoOwnerApproveFunctionality   @positive
  Scenario: verify send to Owner approve functionality
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I click on "Edit" in the page details
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title                              | Budget Request |
      | {SavedValue:Automation Runtime Focus Area} | 25000          |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    Then I can see the approval decision
    When I select radio button "Send to Owner" in the approval decision
    Then I can see the comment box in the approval decision
    When I enter comment "Automation Testing" in the approval decision
    When I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Draft"

  @63902 @TejalApril2020 @ValidateForwardApproveFunctionality  @positive
  Scenario: verify Forward approve functionality
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I click on "Edit" in the page details
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title                              | Budget Request |
      | {SavedValue:Automation Runtime Focus Area} | 25000          |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    And I click on "Submit for Approval" in the page details
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I select radio button "Forward" in the approval decision
    And I select user "Automation FD" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "As a Grantee" app as "FD" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I pause execution for "5" seconds
    Then I see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    Then I softly see field "Status" as "Submitted for Approval"

  @63902 @TejalApril2020 @ValidateRejectApproveFunctionality  @positive
  Scenario: verify Forward reject functionality
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title                              | Budget Request |
      | {SavedValue:Automation Runtime Focus Area} | 25000          |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    And I click on "Submit for Approval" in the page details
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"

  @65782 @TejalApril2020 @ValidateAvailabilityOfSubmitForApprovalButtonOnTheDetailsPageForDraftStatus   @positive
  Scenario: verify availability of Submit for Approval button on the Details page for draft status
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Draft"
    Then I softly can see top right button "Submit for Approval" in page detail

  @65782 @TejalApril2020 @ValidateRequiredFieldsOnSubmitforApprovalButton
  Scenario: verify Required fields on submit for approval button
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities Tab - Program Approver is required for Pre-Application submission.             |
      | Responsibilities Tab - Executive Approver is required for Pre-Application submission.           |
      | Overview Tab - Please fill-in "Project Abstract" before submitting for approval.                |
      | Overview tab- The total budget request amount must be within the award floor and award ceiling. |
      | Please assign Projects to budget period BP01, .                                                 |

  @65782 @TejalApril2020 @ValidateAfterClickOnSubmitForApprovalButtonWithEnteringDataInAllFields  @positive
  Scenario: Click on Submit for Approval button with entering Data in all fields
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title                              | Budget Request |
      | {SavedValue:Automation Runtime Focus Area} | 25000          |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"

  @64543 @TejalApril2020 @ValidateSubmitToGrantorButtonActions @wip @BugLoggedWith77635
  Scenario: verify Submit to Grantor button actions
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title                              | Budget Request |
      | {SavedValue:Automation Runtime Focus Area} | 25000          |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    And I click on "Submit for Approval" in the page details
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedOn__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly can see top right button "Record Decision" in page detail
    When I navigate to "History" sub tab
    Then I softly see value "Submitted to Grantor" for title "New Value" inside table "{grantee_tableId:FieldHistoryForPreApplication}"
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Pre-Application - Submitted"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:Automation Runtime Lead}" inside table "{grantee_tableId:PreApplicationPeerReviewers}"

  @64669 @TejalApril2020 @ValidateRecordDecisionButtonActionsWithAcceptedOption @wip @BugLoggedWith77636  @positive
  Scenario: verify Record Decision button actions with accepted option
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I login to "As a Grantee" app as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
      | Fiscal Approver    | Automation FO  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "Projects" inside nested table containing "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromBudgetTab}" by clicking "Edit" :
      | Project Title                              | Budget Request |
      | {SavedValue:Automation Runtime Focus Area} | 25000          |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:PreApplicationApprovers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation EXE | prdoh       |
    And I click on "Submit for Approval" in the page details
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedOn__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Record Decision" in the page details
    When I enter value "Accepted" into field "fieldDecision__c"
    And I click modal button "Save"
    Then I softly see field "Status" as "Accepted by Grantor"
    Then I softly can see top right button "Create Application" in page detail
    When I navigate to "History" sub tab
    Then I softly see value "Accepted by Grantor" for title "New Value" inside table "{grantee_tableId:FieldHistoryForPreApplication}"
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    Then I softly see value "Accepted by Grantor" for title "Status" against the value "{SavedValue:Automation Runtime Lead}" inside table "{grantee_tableId:PreApplicationPeerReviewers}"