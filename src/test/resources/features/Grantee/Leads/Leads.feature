@Leads @grantee-regression @grantee-parallel-regression
Feature: Leads related scenarios
  Test all scenarios related to Leads

  @62815 @validateLeadsListView-AllHelpText   @positive
  Scenario Outline: Validate help text message at Leads page block inside enhancedLeadtable for Leads Not Yet Qualified -All
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "{grantee_tableId:LeadsNotYetQualified}" with tooltip id "LeadsFlexGridtooltip"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                                                                                                                      |
      | · Leads Not Yet Qualified - All: Shows all leads that are posted on grants.gov or created within the system, and that have not been qualified by my organization. |

  @62815 @validateLeadsListView-ClosedHelpText @wip   @positive
  Scenario Outline: Validate help text message at Leads page block inside enhancedLeadtable for Leads Not Yet Qualified -Closed
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - Closed"
    When I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "{grantee_tableId:LeadsNotYetQualified}" with tooltip id "LeadsFlexGridtooltip"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                                                                                                                                   |
      | · Leads Not Yet Qualified - Open: Shows leads that are not yet qualified by my organization and that have an application due date that is either in the future or not defined. |

  @62815 @validateLeadsListView-OpenHelpText   @positive
  Scenario Outline: Validate help text message at Leads page block inside enhancedLeadtable for Leads Not Yet Qualified -Open
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - Open"
    When I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "{grantee_tableId:LeadsNotYetQualified}" with tooltip id "LeadsFlexGridtooltip"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                                                                                                         |
      | · Leads Not Yet Qualified - Closed: Shows leads that are not yet qualified by my organization and that have an application due date that has passed. |

  @62815 @validateLeadsListViewQuickSearchHelpText @wip  @positive
  Scenario Outline: Validate help text message at Leads inside enhancedLeadtable for Quick search
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - Open"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "{grantee_tableId:LeadsNotYetQualified}" with tooltip id "LeadsquickSearchFlexGridtooltip"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                   |
      | Quick Search is Case Sensitive |

  @62815 @validateDefaultCountOfRecordAtLeadsTableAsExpected  @positive
  Scenario: Validate default records count of records for Leads not yet qualified table is same as displayed in entries
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    Then I see "10" records inside flex table id "{grantee_tableId:LeadsNotYetQualified}"

  @62815 @validateQuickSearchIsWorkingForCorrectIncorrectValueAtLeadsTable @smoke  @positive
  Scenario: Validate quick search is working or not for correct incorrect search value with case sensitive at Leads table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "Automation Demo Lead" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I softly see value "Automation Demo Lead" for title "Opportunity Title" inside table "{grantee_tableId:LeadsNotYetQualified}"
    When I perform quick search for "Manual Lead 235" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I softly do not see value "Manual Lead 2" for title "Opportunity Title" inside table "{grantee_tableId:LeadsNotYetQualified}"

  @62815 @validateAdvanceSearchIsWorkingForCorrectIncorrectValueAtLeadsTable  @positive
  Scenario: Validate advance search is working or not for incorrect search value at at Leads table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I click on advance filter "#advfLeads" of table id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter advance filter values inside id "advfLeads"
      | Opportunity Title | contains | Automation Demo Lead |
    Then I softly see value "Automation Demo Lead" for title "Opportunity Title" inside table "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I click on advance filter "#advfLeads" of table id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter advance filter values inside id "advfLeads"
      | Opportunity Title | contains | Incorrect data |
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I click on advance filter "#advfLeads" of table id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter advance filter values inside id "advfLeads"
      | Opportunity Number | starts with | ADL |
    Then I softly see value "ADL-01" for title "Opportunity Number" inside table "{grantee_tableId:LeadsNotYetQualified}"

  @62815 @validateOrganizationLinkIsWorkingOrNot @smoke  @positive
  Scenario: Validate organization link is redirecting to proper organization page on click insideLeads table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    And I pause execution for "3" seconds
    When I perform quick search for "Automation Demo Lead" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "USDA-NRCS-NHO" icon for "Automation Demo Lead" inside table
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "USDA-NRCS-NHO" in the page details

  @62815 @validateTotalRecordCountForLead-Closed  @positive
  Scenario: Validate total record count for Leads Not Yet Qualified-All list view at leads table for lead-closed
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - Closed"
    When I pause execution for "3" seconds
    And I select value inside table "{grantee_tableId:LeadsNotYetQualified}" is "All"
    When I pause execution for "5" seconds
    Then I see total records count in flex table "{grantee_tableId:LeadsNotYetQualified}"

  @62815 @validateTotalRecordCountForLead-Open   @positive
  Scenario: Validate total record count for Leads Not Yet Qualified-All list view at leads table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - Open"
    When I perform quick search for "Federal" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I pause execution for "3" seconds
    And I select value inside table "{grantee_tableId:LeadsNotYetQualified}" is "100"
    And I pause execution for "3" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:LeadsNotYetQualified}" on click "Next"

  @62815 @validateTotalRecordCountForUsersHavingSameOrganization  @positive
  Scenario Outline: Validate total record count for Leads Not Yet Qualified-All list view with users having same organization at leads table
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I pause execution for "2" seconds
    When I perform quick search for "Defense Threat Reduction Agency" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I see total records count in flex table "{grantee_tableId:LeadsNotYetQualified}"

    Examples:
      | userType    |
      | GRANTEE EXE |
      | GRANTEE PM  |

  @62815 @validatePaginationFunctionalityIsWorkingOrNotAtLeadsTable-NotYetQualified   @positive
  Scenario: Validate pagination arrow is working fine at leads not yet qualified table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on page navigation arrow "{grantee_tableId:LeadsNotYetQualified}" for table id "Next"
    Then I see table "{grantee_tableId:LeadsNotYetQualified}" shows "Page 2"

  @62815 @validateShowEntriesDropdownFunctionalityIsWorkingOrNotAtLeadsTable  @positive
  Scenario: Validate show entries dropdown is working fine at Leads not yet qualified table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I select value inside table "{grantee_tableId:LeadsNotYetQualified}" is "5"
    Then I see "5" records inside flex table id "{grantee_tableId:LeadsNotYetQualified}"

  @62815 @validateRefreshOptionsAtLeadsTable  @positive
  Scenario: Validate Refresh option at Leads not yet qualified table is working or not
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#LeadsFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Leads Not Yet Qualified - All"
    Then I see table is refreshing

  @62815 @validateApplicationDueDateForLeads-ClosedListView  @positive
  Scenario: Validate Application due date is passed date for closed Leads
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    And I enter value "-1" into field "fieldCloseDate__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    And I click on "Save" in the page details
    And I save the field labeled "Application Due Date" as "PreviousDate"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - Closed"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    Then I see field "{SavedValue:PreviousDate}" contains previous date

  @62815 @validateApplicationDueDateForLeads-OpenListView   @positive
  Scenario: Validate Application due date is current date for open Leads
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I save the field labeled "Application Due Date" as "currentDate"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - Open"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I pause execution for "3" seconds
    When I navigate to "Overview" sub tab
    Then I see field "{SavedValue:currentDate}" contains current date

  @62815 @validateApplicationDueDateForLeads-AllListView   @positive
  Scenario: Validate Application due date is current date for All Leads list view
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I save the field labeled "Application Due Date" as "currentDate"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I pause execution for "3" seconds
    When I navigate to "Overview" sub tab
    Then I see field "{SavedValue:currentDate}" contains current date

  @62815 @validateTotalRecordCountAsPerRow-AllListView   @positive
  Scenario: Validate total records count is equal to number of rows atLeads Not Yet Qualified Yet- AllListView table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I pause execution for "4" seconds
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I pause execution for "4" seconds
    And I select value inside table "{grantee_tableId:LeadsNotYetQualified}" is "100"
    And I pause execution for "3" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:LeadsNotYetQualified}" on click "Next"

  @62815 @validateTotalRecordCountAsPerRow-OpenListView   @positive
  Scenario: Validate total records count is equal to number of rows atLeads Not Yet Qualified Yet- OpenListView table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - Open"
    When I pause execution for "4" seconds
    When I perform quick search for "Federal" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I pause execution for "4" seconds
    And I select value inside table "{grantee_tableId:LeadsNotYetQualified}" is "100"
    And I pause execution for "3" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:LeadsNotYetQualified}" on click "Next"

  @62815 @validateTotalRecordCountAsPerRow-ClosedListView  @positive
  Scenario: Validate total records count is equal to number of rows atLeads Not Yet Qualified Yet- ClosedListView table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - Closed"
    When I pause execution for "4" seconds
    When I perform quick search for "State" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I pause execution for "4" seconds
    And I select value inside table "{grantee_tableId:LeadsNotYetQualified}" is "100"
    And I pause execution for "3" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:LeadsNotYetQualified}" on click "Next"

  @62830 @validateVisibilityOfEditButtonToRecordOwnerForLeads-NotYetQualified @smoke
  Scenario Outline: Validate Edit should displayed only to record owner on page details for Leads Not Yet Qualified
    When I login to "As a Grantee" app as "<userType>" user
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
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I can see top right button "Edit" in page detail

    Examples:
      | userType    |
      | GRANTEE PM  |
      | GRANTEE PO  |
      | GRANTEE EXE |

  @62830 @validateVisibilityOfEditButtonToDifferentUsersForLeads-NotYetQualified
  Scenario: Validate Edit button should not be displayed to other users who didnot created the record on page details for Leads Not Yet Qualified
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "ADMIN" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I cannot see top right button "Edit" in page detail

  @62830 @validateVisibilityOfQualifyLeadButtonToExpectedUserAtLeads-NotYetQualified @smoke  @positive
  Scenario Outline: Validate Qualify Leads button should displayed only to EXE PM user for which application due date is future/current on page details for Leads Not Yet Qualified
    When I login to "As a Grantee" app as "<userType>" user
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
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    Then I can see top right button "Qualify Lead" in page detail

    Examples:
      | userType    |
      | GRANTEE PM  |
      | GRANTEE EXE |

  @62830 @validateVisibilityOfQualifyLeadButtonForExpiredLeads-NotYetQualified
  Scenario: Validate Qualify Leads button should displayed only to any user for which application due date is expired on page details for Leads Not Yet Qualified
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - Closed"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I cannot see top right button "Qualify Lead" in page detail

  @62830 @validateHeaderOverview-NotYetQualified @smoke  @positive
  Scenario: Validate header overview non editable field at page details of Leads Not Yet Qualified
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I save the field labeled "Opportunity Number" as "OpportunityNumber"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Lead}" in the page details
    Then I softly see field "Opportunity Number" as "{SavedValue:OpportunityNumber}"
    Then I softly see field "State" as "Closed"
    Then I softly see field "Days Left" as "0"

  @62830 @validateHeaderOverviewDaysLeftField-NotYetQualified  @positive
  Scenario: Validate header overview days left field with respect to Application due date at page details of Leads Not Yet Qualified
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I softly see field "Days Left" as "1"

  @62830 @validateHeaderOverviewStatusFieldAsExpired-NotYetQualified  @positive
  Scenario: Validate header overview Status field value should be expired for passed application due date at page details of Leads Not Yet Qualified
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I softly see field "State" as "Closed"

  @62830 @validateHeaderOverviewStatusFieldAsActive-NotYetQualified  @positive
  Scenario: Validate header overview status field value is Active with respect to Application due date is future date at page details of Leads Not Yet Qualified
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I softly see field "State" as "Posted"

  @62830 @validateGeneralInformationSection-NotYetQualified  @positive
  Scenario: Validate General information of Overview sub tab at page details of Leads Not Yet Qualified
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I save the field labeled "Opportunity Number" as "OpportunityNumber"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    Then I softly see field "Opportunity Number" as "{SavedValue:OpportunityNumber}"
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Lead}"
    Then I softly see field "Opportunity Category" as "Other"
    Then I softly see field "Funding Instrument Type" as "Other"
    Then I softly see field "Category Of Funding Activity" as "Education"

  @62830 @validateGeneralInformationLookUpLink @smoke  @positive
  Scenario: Validate look up link inside General information of Overview sub tab at page details of Leads Not Yet Qualified
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    When I click "USDA-NRCS-NHO" lookup link
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "USDA-NRCS-NHO" in the page details

  @62830 @validateGeneralInformationGrantsGovLinks @NotworkInProduct @smoke  @positive
  Scenario: Validate grants gov url is working fine and it opening new tab on click at page details of Leads Not Yet Qualified
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value "1" into field "fieldCloseDate__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    When I enter value "www.google.com" into field "fieldManualLeadURL__c"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    When I click "www.google.com" lookup link
    Then I see new tab is opened

  @62830 @validateRelatedProgramsForLead  @positive
  Scenario: Validate related program section page block contains record that users added
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:RelatedPrograms}"
    When I perform quick search for "Agricultural Research Basic and Applied Research" in "{grantee_tableId:AssociateProjects}" panel
    When I click "Associate" after selection of "Agricultural Research Basic and Applied Research" in the table "{grantee_tableId:PlanningObjectiveModalTableId}"
    When I pause execution for "3" seconds
    And I close "Associate" modal by clicking the top right x button
    Then I softly see value "Agricultural Research Basic and Applied Research" for title "Program Title" inside table "{grantee_tableId:RelatedPrograms}"

  @62830 @validateColumnsOfRelatedProgram @smoke
  Scenario Outline: Validate expected column is present at related program section page block
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    Then I see "<fieldDisplayNames>" in flex table header "{grantee_tableId:RelatedPrograms}"

    Examples:
      | fieldDisplayNames |
      | Program Number    |
      | Program Title     |

  @62830 @validateRelatedProgramDetailPage @smoke  @positive
  Scenario: Validate user is able to navigated to related program detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:RelatedPrograms}"
    When I perform quick search for "Agricultural Research Basic and Applied Research" in "{grantee_tableId:AssociateProjects}" panel
    When I click "Associate" after selection of "Agricultural Research Basic and Applied Research" in the table "{grantee_tableId:PlanningObjectiveModalTableId}"
    When I pause execution for "3" seconds
    And I close "Associate" modal by clicking the top right x button
    And I refresh the page
    When I click on "View" icon for "Agricultural Research Basic and Applied Research" inside flex table with id "{grantee_tableId:RelatedPrograms}"
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Agricultural Research Basic and Applied Research" in the page details

  @62830 @validateQuickSearchForProgramsTable  @positive
  Scenario: Validate quick search is working properly for valid and invalid input at Programs table on modal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:RelatedPrograms}"
    When I perform quick search for "Direct and Counter-cyclical Payments Program" in "{grantee_tableId:AssociateProjects}" panel
    Then I softly see value "Direct and Counter-cyclical Payments Program" for title "Program Title" inside table "{grantee_tableId:AssociateProjects}"
    When I perform quick search for "2 Direct and Counter-cyclical Payments Program" in "{grantee_tableId:AssociateProjects}" panel
    Then I softly do not see value "2 Direct and Counter-cyclical Payments Program" for title "Program Title" inside table "{grantee_tableId:AssociateProjects}"
    When I perform quick search for "10.004" in "{grantee_tableId:AssociateProjects}" panel
    Then I softly see value "10.004" for title "Program Number" inside table "{grantee_tableId:AssociateProjects}"
    When I perform quick search for "2 10.004" in "{grantee_tableId:AssociateProjects}" panel
    Then I softly do not see value "2 10.004" for title "Program Number" inside table "{grantee_tableId:AssociateProjects}"

  @62830 @validateRefreshAtListOfCFDATable  @positive
  Scenario: Validate Refresh option is working properly at List of CFDA table on modal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:RelatedPrograms}"
    When I click on parallel lines menu bar with data target value "#toggleFlexTableSelectFOALeadCFDA"
    And I select "Refresh" from parallel lines dropdown of "Programs"
    Then I see table is refreshing

  @62830 @validateAddingOfRelatedProgramWithSameUsedRecord
  Scenario: Validate already used/added related programs is not displayed under Programs table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:RelatedPrograms}"
    When I perform quick search for "Agricultural Research Basic and Applied Research" in "{grantee_tableId:AssociateProjects}" panel
    When I click "Associate" after selection of "Agricultural Research Basic and Applied Research" in the table "{grantee_tableId:PlanningObjectiveModalTableId}"
    When I pause execution for "3" seconds
    And I close "Associate" modal by clicking the top right x button
    And I refresh the page
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:RelatedPrograms}"
    When I perform quick search for "Agricultural Research Basic and Applied Research" in "{grantee_tableId:AssociateProjects}" panel
    Then I softly do not see value "Agricultural Research Basic and Applied Research" for title "Program Title" inside table "{grantee_tableId:AssociateProjects}"

  @62830 @validateRefreshAtRelatedProgramTable  @positive
  Scenario: Validate Refresh option is working properly at related program table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:RelatedPrograms}"
    When I perform quick search for "Agricultural Research Basic and Applied Research" in "{grantee_tableId:AssociateProjects}" panel
    When I click "Associate" after selection of "Agricultural Research Basic and Applied Research" in the table "{grantee_tableId:PlanningObjectiveModalTableId}"
    When I pause execution for "3" seconds
    And I close "Associate" modal by clicking the top right x button
    And I refresh the page
    When I click on parallel lines menu bar with data target value "#RelatedLeadCFDANumbersFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Related Programs"
    Then I see table is refreshing

  @62830 @validateEligibiltySectionPageBlockDetails  @positive
  Scenario: Validate values of fields inside Eligibility page block at leads detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    Then I softly see field "Eligible Applicants" as "State governments"
    Then I softly see field "Additional Eligibility Information" as "Dummy eligibility information for Automation"

  @62830 @validateAdditionalInformationPageBlockDetails  @positive
  Scenario: Validate values of fields inside additional information page block at leads detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    Then I softly see field "Lead Description" as "Demo Leads creation for Automation"
    Then I softly see field "Grantor Contact Information" as "Demo Leads creation for Automation"

  @62830 @validateColumnsOfAllQualificationTable @smoke  @positive
  Scenario Outline: Validate expected column are present for All qualifications table at leads detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    Then I see "<fieldDisplayNames>" in flex table header "{grantee_tableId:AllQualificationsTable}"

    Examples:
      | fieldDisplayNames       |
      | Qualifying Organization |
      | Qualified By            |
      | Qualified On            |
      | Impact                  |
      | Relevance               |

  @62830 @validateNoOfOrganizationAsZeroForAllQualificationTable  @positive
  Scenario: Validate All Qualifications table should not contain record
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:AllQualificationsTable}"

  @62830 @validateColumnsValuesForAllQualificationsTable  @positive
  Scenario: Validate All Qualifications table columns should contain any values - at qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see value "Secretaria Auxiliar de Promocion de la Salud" for title "Internal Organization" against the value "PRDOH PMUser" inside table "{grantee_tableId:AllQualificationsAfterQualifiedLead}"

  @62830 @validateQualifiedLeadAgenciesDetailPageForAllQualificationsTable  @positive
  Scenario: Validate qualifying organization should have same as internal organization value for qualified leads records
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    When I click on "View" icon for "Secretaria Auxiliar de Promocion de la Salud" inside flex table with id "{grantee_tableId:AllQualificationsTable}"
    Then I softly see field "Qualifying Organization" as "Secretaria Auxiliar de Promocion de la Salud"
    Then I softly see value "Secretaria Auxiliar de Promocion de la Salud" for title "Internal Organization" against the value "PRDOH PMUser" inside table "{grantee_tableId:AllQualificationsAfterQualifiedLead}"
    Then I softly see value "2 - Low" for title "Impact" against the value "2 - Low" inside table "{grantee_tableId:AllQualificationsAfterQualifiedLead}"
    Then I softly see value "2 - Low" for title "Relevance" against the value "2 - Low" inside table "{grantee_tableId:AllQualificationsAfterQualifiedLead}"

  @62830 @validateQualifyByLinkForQualifiedLeadAgencyAtAllQualificationTable  @positive
  Scenario: Validate qualify by link opens and navigated to users profile page on click for qualified lead agency record.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    When I click on "View" icon for "Secretaria Auxiliar de Promocion de la Salud" inside flex table with id "{grantee_tableId:AllQualificationsTable}"
    Then I softly see field "Qualifying Organization" as "Secretaria Auxiliar de Promocion de la Salud"
    When I click on "PRDOH PMUser" icon for "Secretaria Auxiliar de Promocion de la Salud" inside table
    Then I softly see field "First Name" as "PRDOH"
    Then I softly see field "Last Name" as "PMUser"
    Then I softly see field "Organization Name" as "Secretaria Auxiliar de Promocion de la Salud"

  @62830 @validateAdvanceSearchOptionIsWorkingAtAllQualificationTable @wip  @positive
  Scenario: Validate advance search is working or not for incorrect search value at at All Qualification table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "3 - Medium" into field "fieldRelevance__c"
    When I enter value "1 - NA" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "ADMIN" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    When I click on advance filter "#advfRelatedQualifiedLeads" of table id "{grantee_tableId:AllQualificationsTable}"
    When I enter advance filter values inside id "advfRelatedQualifiedLeads"
      | Impact | equals to | 1 - NA |
    Then I softly see value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" for title "Internal Organization" inside table "{grantee_tableId:AllQualificationsTable}"
    And I refresh the page
    When I click on advance filter "#advfRelatedQualifiedLeads" of table id "{grantee_tableId:AllQualificationsTable}"
    When I enter advance filter values inside id "advfRelatedQualifiedLeads"
      | Relevance | equals to | 3 - Medium |
    Then I softly do not see value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" for title "Internal Organization" inside table "{grantee_tableId:AllQualificationsTable}"
    When I enter advance filter values inside id "advfRelatedQualifiedLeads"
      | Relevance | equals to | --None-- |
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:AllQualificationsTable}"

  @62830 @validateSystemInformationForQualifiedLeadRecordAtAllQualificationTable  @positive
  Scenario: Validate system information of qualified lead record at all qualification table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "3 - Medium" into field "fieldRelevance__c"
    When I enter value "1 - NA" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "ADMIN" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I softly see field "Last Modified By" as "Automation PM"
    Then I softly see field "Created By" as "Automation PM"

  @62830 @validateSystemInformationLookUpLinkForQualifiedLeadRecordAtAllQualificationTable  @positive
  Scenario: Validate created by look up link redirected to profile page of qualified lead record at all qualification table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "3 - Medium" into field "fieldRelevance__c"
    When I enter value "1 - NA" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "ADMIN" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    When I click "Automation PM" lookup link
    Then I softly see field "Organization Name" as "Direccion General"
    Then I softly see field "Profile Name" as "Program Manager"
    Then I softly see field "Title" as "Automation Program Manager"

  @62830 @validateEditingOfProfileFromSystemInformationLookUpLinkForQualifiedLeadRecordAtAllQualificationTable @byAdminUserOnly  @positive
  Scenario: Validate admin user is able to edit the profile by clicking on created by lookup link of qualified lead record at all qualification table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "3 - Medium" into field "fieldRelevance__c"
    When I enter value "1 - NA" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "ADMIN" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    When I click "Automation PM" lookup link
    When I click on "Edit" in the page details
    When I enter value "Automation Program Manager" into field "fieldTitle"
    When I click on "Save" in the page details
    Then I softly see field "Title" as "Automation Program Manager"

  @62830 @validateEditingOfProfileFromSystemInformationLookUpLinkForQualifiedLeadRecordAtAllQualificationTable @byPMUserOnly  @positive
  Scenario: Validate record owner or PM user is able to edit the profile by clicking on created by lookup link of qualified lead record at all qualification table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "3 - Medium" into field "fieldRelevance__c"
    When I enter value "1 - NA" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click "Automation PM" lookup link
    When I click on "Edit" in the page details
    When I enter value "Automation Program Manager" into field "fieldTitle"
    When I click on "Save" in the page details
    Then I softly see field "Title" as "Automation Program Manager"

  @62830 @validateFinancialTabDetailsForQualifiedLeadRecordAtAllQualificationTable @wip @decimalIssue  @positive
  Scenario: Validate financial tab details  of qualified lead record at all qualification table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "3 - Medium" into field "fieldRelevance__c"
    When I enter value "1 - NA" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I pause execution for "2" seconds
    Then I softly see field "Estimated Total Program Funding" as "$50,000.00"
    Then I softly see field "Award Ceiling" as "$30,000.00"
    Then I softly see field "Award Floor" as "$20,000.00"
    Then I softly see field "Cost Sharing or Matching Requirement" as "No"

  @62830 @validateHelpTextInsideFinancialTabForQualifiedLeadRecordAtAllQualificationTable  @positive
  Scenario Outline: Validate help text message coming inside financial tab fields of qualified lead record at all qualification table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "3 - Medium" into field "fieldRelevance__c"
    When I enter value "1 - NA" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I pause execution for "2" seconds
    When I hovering mouse on page block help text icon inside table "myTabbedContent" with tooltip id "EstimatedTotalProgramFunding__ctooltip"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                     |
      | Estimated total funding expected for the program |

  @62830 @validateTopLevelAddButtonAtAttachmentPageBlock  @positive
  Scenario Outline: Validate Attachment page block top level action button of qualified lead record at all qualification table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Attachments" sub tab
    Then I see the following top right buttons in table named "Attachments" :
      | Add |
    Then I see the following top right buttons in table named "Notes" :
      | Add |

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @62830 @validateAttachmentAndNotesPageBlock @smoke   @positive
  Scenario Outline: Validate Attachment page block at all qualification table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    And I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Attachments" sub tab
    And I softly see the text containing :
      | Attachments |
      | Notes       |

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @63123 @validateAccessOfQualifyingLeadOfUserAtLeadNotYetQualified-All
  Scenario: Validate access permission of qualifying leads to admin, PO users is not allowed.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I cannot see top right button "Qualify Lead" in page detail
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I cannot see top right button "Qualify Lead" in page detail

  @63123 @validateQualifyLeadButtonVisibilityToUsersAtLeadNotYetQualified-All-futureapplicationduedate  @positive
  Scenario Outline: Validate qualify lead button is visible to EXE,PM user with lead having future application due date.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"

    Examples:
      | userType    |
      | GRANTEE EXE |
      | GRANTEE PM  |

  @63123 @validateQualifyLeadButtonVisibilityToUsersAtLeadNotYetQualified-All-passedapplicationduedate  @positive
  Scenario Outline: Validate qualify lead button is visible to EXE,PM user with lead having passed application due date.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I cannot see top right button "Qualify Lead" in page detail

    Examples:
      | userType    |
      | GRANTEE EXE |
      | GRANTEE PM  |

  @63123 @validateEditModeOfFieldsAtQualifyingLeadDetailPage @smoke  @positive
  Scenario: Validate fields is in edit mode at detail page of qualifying leads.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    And I click on "Qualify Lead" in the page details
    Then I softly see fields "fieldAgency__c" is in edit mode
    Then I softly see fields "fieldRelevance__c" is in edit mode
    Then I softly see fields "fieldImpact__c" is in edit mode
    Then I softly see fields "fieldJustification__c" is in edit mode

  @63123 @validateRequiredFieldMessageAtQualifyingLeadDetailPage
  Scenario: Validate mandatory fields required message on qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    And I click on "Qualify Lead" in the page details
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Relevance is Required to save under Overview.     |
      | Impact is Required to save under Overview.        |
      | Justification is Required to save under Overview. |

  @63123 @validateFieldsIsInViewModeAtQualifyingLeadDetailPage  @positive
  Scenario: Validate fields is in view mode after clicking on cancel button on qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    And I click on "Qualify Lead" in the page details
    When I pause execution for "2" seconds
    And I click on "Cancel" in the page details
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Lead}"

  @63123 @validateFieldsValuesAreSameAsUsersEnteredAtQualifyingLeadDetailPage  @positive
  Scenario: Validate fields values are same as user enter after qualifying the lead on qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    And I navigate to "Financials" sub tab
    When I enter value "50000" into field "fieldEstimatedTotalProgramFunding__c"
    When I enter value "30000" into field "fieldAwardCeiling__c"
    When I enter value "20000" into field "fieldAwardFloor__c"
    And I click on "Save" in the page details
    And I save the field labeled "Opportunity Number" as "OpportunityNumber"
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    When I pause execution for "2" seconds
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Lead}"
    Then I softly see field "Opportunity Number" as "{SavedValue:OpportunityNumber}"
    Then I softly see field "Qualifying Organization" as "Direccion General"
    When I navigate to "Financials" sub tab
    Then I softly see field "Estimated Total Program Funding" as "$50,000"
    Then I softly see field "Award Ceiling" as "$30,000"
    Then I softly see field "Award Floor" as "$20,000"

  @63123 @validateQualificationDetailsAtQualifyingLeadDetailPage   @positive
  Scenario: Validate user is able to enter qualification details fields values while qualifying the lead on qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    And I click on "Qualify Lead" in the page details
    When I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Qualifying Organization" as "Direccion General"
    Then I softly see field "Relevance" as "2 - Low"
    Then I softly see field "Impact" as "2 - Low"
    Then I softly see field "Justification" as "Test Justification For Automation"

  @63123 @validateErrorMsgForQualificationDetailsAtQualifyingLeadDetailPage
  Scenario: Validate user is getting error message while qualifying lead without entering Qualification details
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    And I click on "Qualify Lead" in the page details
    When I pause execution for "2" seconds
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Relevance is Required to save under Overview.     |
      | Impact is Required to save under Overview.        |
      | Justification is Required to save under Overview. |

  @63123 @validateQualifyLeadWithDifferentUser  @positive
  Scenario: Validate user is able to qualify the lead which is already qualified by another user at qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I perform quick search for "Direccion General" in "{grantee_tableId:AllQualificationsAfterQualifiedLead}" panel
    Then I softly see value "Direccion General" for title "Internal Organization" against the value "Automation PM" inside table "{grantee_tableId:AllQualificationsAfterQualifiedLead}"

  @63123 @validateQualifyingLeadAfterLeadConvertedToOpportunity  @positive
  Scenario: Validate user is getting error message while qualifying lead which is already converted to opportunity by another user at qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I click on "Convert to Opportunity" in the page details
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    Then I see the following messages in the page details contains:
      | You are unable to qualify this lead because the lead has already been converted to an opportunity by an internal organization. |

  @63123 @validateQualifyingFederalLead @checkwithLookupField @wip  @positive
  Scenario: Validate user is able to qualify federal leads at qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value "1" into field "fieldCloseDate__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    And I click on "Save" in the page details
    And I save the field labeled "Opportunity Number" as "OpportunityNumber"
    And I click on "Qualify Lead" in the page details
    When I pause execution for "2" seconds
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Lead}"
    Then I softly see field "Opportunity Number" as "{SavedValue:OpportunityNumber}"
    Then I softly see field "Qualifying Organization" as "Secretaria Auxiliar de Salud Familiar y Servicios Integrados"

  @63123 @validateQualifyingStateLead @checkwithLookupField @wip  @positive
  Scenario: Validate user is able to qualify federal leads at qualified lead detail page
    When I delete the record "AutomationDemoLead" from the object "FOA LEAD"
    When I delete the record "AutomationDemoLead" from the object "QUALIFIED LEAD"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value "ACC-APG-Edgewood" into field "fieldFederalAgency__c"
    When I enter value "1" into field "fieldCloseDate__c"
    When I click on "Save and Continue" in the page details
    And I click on "Qualify Lead" in the page details
    When I pause execution for "2" seconds
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    Then I softly see field "Opportunity Title" as "AutomationDemoLead"
    Then I softly see field "Opportunity Number" as "AL-01"
    Then I softly see field "Qualifying Organization" as "Secretaria Auxiliar de Salud Familiar y Servicios Integrados"

  @63123 @validateQualifyingNGOLead @checkwithLookupField @wip  @positive
  Scenario: Validate user is able to qualify federal leads at qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value "Health State Organization" into field "fieldFederalAgency__c"
    When I enter value "1" into field "fieldCloseDate__c"
    When I click on "Save and Continue" in the page details
    And I click on "Qualify Lead" in the page details
    When I pause execution for "2" seconds
    Then I softly see field "Funding Organization" as "Health State Organization"
    Then I softly see field "Opportunity Title" as "AutomationDemoLead"
    Then I softly see field "Opportunity Number" as "AL-01"
    Then I softly see field "Qualifying Organization" as "Secretaria Auxiliar de Salud Familiar y Servicios Integrados"

  @63123 @validateQualifyingLeadForOtherOrganization @smoke  @positive
  Scenario: Validate user of one organization is able to qualify the lead of other organization
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"

  @63123 @validateQualifyingLeadOfSameOrgaization  @positive
  Scenario: Validate user is able to qualify lead of own organization after qaulification of lead of other organization
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I re-login to "As a Grantee" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"

  @63123 @validateQualifiedLeadShouldNotPresentAtLeadsTable  @positive
  Scenario: Validate already qualified lead should not be displayed at Not yet qualified leads table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I softly do not see value "{SavedValue:Automation Runtime Lead}" for title "Opportunity Title" inside table "{grantee_tableId:LeadsNotYetQualified}"

  @63041 @validateTopLevelRowLevelEditButtonAtQualifiedLeadTableWithRecordOwner  @positive
  Scenario Outline: Validate edit button should displayed at qualified lead table for record owner only
    When I login to "As a Grantee" app as "<userType>" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    Then I softly can see row level action button "Edit" against "Qualified Lead" in flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    Then I softly can see top right button "Edit" in page detail

    Examples:
      | userType    |
      | GRANTEE PM  |
      | GRANTEE EXE |

  @63041 @validateEditOfQualifiedLeadWithOwnerUser  @positive
  Scenario Outline: Validate owner of qualified lead record is able to edit qualified lead
    When I login to "As a Grantee" app as "<userType>" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Qualifying Organization" as "Direccion General"
    Then I softly see field "Relevance" as "2 - Low"
    Then I softly see field "Impact" as "2 - Low"
    Then I softly see field "Justification" as "Test Justification For Automation"

    Examples:
      | userType    |
      | GRANTEE PM  |
      | GRANTEE EXE |

  @63041 @validateEditOfQualifiedLeadWithOtherUser @BugLoggedWith84758
  Scenario: Validate other user of qualified lead record is able to edit qualified lead
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    Then I softly cannot see row level action button "Edit" against "Qualified Lead" in flex table with id "{grantee_tableId:QualifiedLeads}"
    And I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    Then I softly cannot see row level action button "Edit" against "Qualified Lead" in flex table with id "{grantee_tableId:QualifiedLeads}"
    And I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    Then I softly cannot see row level action button "Edit" against "Qualified Lead" in flex table with id "{grantee_tableId:QualifiedLeads}"

  @63041 @validateEditFunctionalityAtfQualifiedLead @smoke  @positive
  Scenario: Validate qualified record should opened in edit mode after editing the record with row level action
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    Then I softly see fields "fieldRelevance__c" is in edit mode
    Then I softly see fields "fieldImpact__c" is in edit mode
    Then I softly see fields "fieldJustification__c" is in edit mode

  @63041 @validateCancelButtonFunctionalityAtfQualifiedLead @smoke  @positive
  Scenario: Validate Cancel button functionality at qualified lead
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    And I pause execution for "2" seconds
    When I click on "Cancel" in the page details
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    Then I see value "{SavedValue:Automation Runtime Lead}" for title "Opportunity Title" inside table "{grantee_tableId:QualifiedLeads}"

  @63041 @validateSaveAndContinueFunctionalityAtQualifyingLeadDetailPage @smoke
  Scenario: Validate record owner is getting error message while qualifying lead with clicking on save and continue button without entering Qualification details
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    And I click on "Qualify Lead" in the page details
    When I pause execution for "2" seconds
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Relevance is Required to save under Overview.     |
      | Impact is Required to save under Overview.        |
      | Justification is Required to save under Overview. |

  @63041 @validateLookupFieldDetailsWithBlankData  @positive
  Scenario: Validate lookup modal with header is getting displayed on click of lookup search icon
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click search icon for look up field "Qualifying Organization Lookup (New Window)" with clearing
    Then I see modal box with body "Organization" is displayed

  @63041 @validateTableColumnOnLookupModalWithBlankData  @positive
  Scenario: Validate lookup modal column is getting displayed on click of lookup search icon
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click search icon for look up field "Qualifying Organization Lookup (New Window)" with clearing
    Then I softly see "Organization Name" in table header on lookup Modal
    Then I softly see "Code" in table header on lookup Modal

  @63041 @validateBottomFieldsOfLookupModalWithBlankData  @positive
  Scenario: Validate lookup modal bottom fields
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click search icon for look up field "Qualifying Organization Lookup (New Window)" with clearing
    Then I softly see lookup modal bottom fields "Show" displayed
    Then I softly see lookup modal bottom fields "Total records" displayed
    Then I softly see lookup modal bottom fields "Page" displayed

  @63041 @validateOrganizationSelectionWithBlankData  @positive
  Scenario: Validate lookup field contains selected value after selection from lookup modal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I enter value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" into field "fieldAgency__c"
    Then I see value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside lookup field "fieldAgency__c"

  @63041 @validateOrganizationSelectionWithValidData  @positive
  Scenario: Validate lookup field contains expected organization after selecting it from look up modal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click search icon for look up field "Qualifying Organization Lookup (New Window)" without clearing
    When I click on "Select" icon for "Direccion General" inside flex table with id "{grantee_tableId:OrganizationModal}"
    Then I see value "Direccion General" inside lookup field "fieldAgency__c"

  @63041 @validateBottomFieldsOfLookupModalWithValidData  @positive
  Scenario: Validate lookup modal contains total record field after entering valid data inside lookup search box and clicking on search icon
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click search icon for look up field "Qualifying Organization Lookup (New Window)" without clearing
    Then I see lookup modal bottom fields "Total records" displayed

  @63041 @validateOrganizationOnLookupModalWithValidData  @positive
  Scenario: Validate lookup modal contains expected organization inside table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click search icon for look up field "Qualifying Organization Lookup (New Window)" without clearing
    Then I see value "Direccion General" for title "Organization Name" inside table "{grantee_tableId:OrganizationModal}"

  @63041 @validateOrganizationOnLookupModalWithPartialData  @positive
  Scenario: Validate lookup modal contains expected organization inside table after entering partial data inside lookup search box
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click search icon for look up field "Qualifying Organization Lookup (New Window)" with clearing
    When I perform quick search for "Secretaria Auxiliar de Promocion" in "{grantee_tableId:OrganizationModal}" panel
    Then I see value "Secretaria Auxiliar de Promocion de la Salud" for title "Organization Name" inside table "{grantee_tableId:OrganizationModal}"

  @63041 @validateBottomFieldsOfLookupModalWithPartialData  @positive
  Scenario:  Validate lookup modal contains total record field after entering partial data inside lookup search box and clicking on search icon
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click search icon for look up field "Qualifying Organization Lookup (New Window)" with clearing
    When I perform quick search for "Secretaria Auxiliar de Promocion" in "{grantee_tableId:OrganizationModal}" panel
    Then I softly see "Organization Name" in table header on lookup Modal
    Then I softly see "Code" in table header on lookup Modal
    Then I softly see lookup modal bottom fields "Total records" displayed

  @63041 @validateLookupModalWithInvalidData
  Scenario:  Validate lookup modal contains no records agter entering invalid data to search
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click search icon for look up field "Qualifying Organization Lookup (New Window)" with clearing
    When I perform quick search for "Invalid lead" in "{grantee_tableId:OrganizationModal}" panel
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:OrganizationModal}"

  @63041 @validateRelevancePicklistField  @positive
  Scenario:  Validate Relevence pick list field having options inside it as expected
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    Then I see "--None--:1 - NA:2 - Low:3 - Medium:4 - High:5 - Very High" inside selectbox field "fieldRelevance__c"

  @63041 @validateImpactPicklistFieldValues  @positive
  Scenario:  Validate Impact pick list field having options inside it as expected
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    Then I see "--None--:1 - NA:2 - Low:3 - Medium:4 - High:5 - Very High" inside selectbox field "fieldRelevance__c"

  @63041 @validateImpactPicklistFieldWithBlankData
  Scenario:  Validate error message after submission with blank data as none inside Impact pick list field
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I enter value "--None--" into field "fieldImpact__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Relevance is Required to save under Overview.     |
      | Impact is Required to save under Overview.        |
      | Justification is Required to save under Overview. |

  @63084 @VerifyValidateButtonVisibilityForPMAndEXEUser  @positive
  Scenario Outline:  Validate PM and EXE user id getting validate button inside qualified record detail page
    When I login to "As a Grantee" app as "<userType>" user
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
    And I pause execution for "3" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    Then I can see top right button "Validate" in page detail

    Examples:
      | userType    |
      | GRANTEE EXE |
      | GRANTEE PM  |

  @63084 @VerifyFunctionalityOfValidateButtonWithCorrectData  @positive
  Scenario: Validate user is able validate the Qualified record with success message
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I click on "Validate" in the page details
    Then I see the following messages in the page details contains:
      | The lead has been validated successfully. You may now convert the lead to an opportunity |

  @63227 @validateOpportunityStatusAfterConvertToOpportunity  @positive
  Scenario Outline: Validate status of opportunity after converting it to opportunity
    When I login to "As a Grantee" app as "<userType>" user
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
    And I click on "Convert to Opportunity" in the page details
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Draft" and is "Green"
    Then I can see top right button "Validate" in page detail
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit for Approval" in page detail

    Examples:
      | userType    |
      | GRANTEE EXE |
      | GRANTEE PM  |

  @63227 @validateConvertOpportunityToLeadBySameOrganizationUsers  @positive
  Scenario: Validate one user of organizaion1 is qualifying lead and the same qualified lead can be converted by another user of organization1
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    And I click on "Convert to Opportunity" in the page details
    Then I see field "Status" as "Draft"

  @63227 @validateConvertOpportunityToLeadByDifferentOrganizationUsers  @positive
  Scenario: Validate one user of organizaion1 is qualifying lead and the same qualified lead can be converted by another user of organization2
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "GRANTEE PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    And I click on "Convert to Opportunity" in the page details
    Then I see field "Status" as "Draft"

  @63227 @verifyValidationMessageComingWhileConvertingQualifiedLeadwithSameOrganizationUser @positive
  Scenario: Validate message coming while converting already qualified lead to opportunity with same organization user
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I click on "Convert to Opportunity" in the page details
    Then I softly see field "Status" as "Converted to Opportunity"
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    And I click on "Convert to Opportunity" in the page details
    Then I see the following messages in the page details contains:
      | You are unable to convert this lead to an opportunity because the lead has already been converted to an opportunity by an internal organization. |

  @62955 @verifyTakeSnapShotOptionAtQualifiedLeadDetail @wip  @positive
  Scenario: Validate take snapshot option at Qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    And I refresh the page
    When I navigate to "History" sub tab
    Then I see take snap shot getting saved with "Todays Date"

  @62955 @verifyQualifiedLeadDetailsPage @smoke  @positive
  Scenario: Validate page layout details at qualified leads detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I softly see the text containing :
      | Overview   |
      | Financials |
      | History    |
    Then I softly see field "Qualifying Organization" as "Direccion General"
    Then I softly see field "Status" as "Qualified Lead"

  @63186 @validateNewButtonDisplayedForSpecificUser-NotYetQualifiedLeads @smoke   @positive
  Scenario Outline: Validate New top level button is displayed at Not Yet Qualified table
    When I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    Then  I can see top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"

    Examples:
      | userType    |
      | GRANTEE EXE |
      | GRANTEE PM  |
      | GRANTEE PO  |

  @63186 @validateNewButtonNotDisplayedForSpecificUser-NotYetQualifiedLeads @smoke
  Scenario Outline: Validate New top level button is not displayed at NotYetQualified table
    When I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    Then  I cannot see top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"

    Examples:
      | userType   |
      | GRANTEE FD |
      | GRANTEE FO |

  @63186 @validateNewButtonIsDisplayedForSpecificUser-NotYetQualifiedLeads @BugLogged71173  @positive
  Scenario: Validate New top level button is displayed at Not Yet Qualified table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I click on "Cancel" in the page details
    And I pause execution for "5" seconds
    Then  I can see top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"

  @63186 @validatePicklistFieldsValues-NotYetQualifiedLeads  @positive
  Scenario:  Validate picklist fields should have values as expected on edit page while creating leads and also checking page navigated to edit mode
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    Then I see "--None--:Discretionary:Other:Earmark:Continuation:Mandatory" inside selectbox field "fieldOpportunityCategory__c"

  @63186 @validateCategoryOfFundingOrganizationField @buglogged71538
  Scenario: Verify validation message coming for description fields for opportunity category
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value " " into field "fieldCategoryExplanation__c"
    And I click modal button "Save and Continue"
    Then  I see the following messages in the page details :
      | Funding Organization is Required to save under Overview. |

  @63186 @validateFieldsMaximumCharacterAcceptance  @positive
  Scenario Outline: Verify fields should accept only maximum limits of character as 255 while creating opportunity
    When I delete the record "<requiredValue>" from the object "FOA LEAD"
    When I delete the record "<requiredValue>" from the object "QUALIFIED LEAD"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    And I enter value "<enterValue>" into field "fieldOpportunityTitle__c"
    And I click on "Save and Continue" in the page details
    Then I see field "Opportunity Title" as "<requiredValue>"
    Examples:
      | enterValue                                                                                                                                                                                                                                                           | requiredValue                                                                                                                                                                                                                                                   |
      | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255title | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255 |

  @63186 @validateFieldsForNegativeValuesAcceptance  @positive
  Scenario: Verify fields should not accept negative valued
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    And I navigate to "Financials" sub tab
    When I enter value "-50000" into field "fieldEstimatedTotalProgramFunding__c"
    When I enter value "-30000" into field "fieldAwardCeiling__c"
    When I enter value "-20000" into field "fieldAwardFloor__c"
    And I click on "Save" in the page details
    Then  I see the following messages in the page details :
      | The Award Ceiling cannot be less than the Award Floor                                                                    |
      | Financials tab - Negative values are not allowed for Estimated Total Program Funding, Award Ceiling, Award Floor fields. |

  @63186 @validateFormatOfEnteredValueAtFields @positive
  Scenario: Verify entered numeric values should get formatted with comma after saving record
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    And I navigate to "Financials" sub tab
    When I enter value "50000" into field "fieldEstimatedTotalProgramFunding__c"
    When I enter value "30000" into field "fieldAwardCeiling__c"
    When I enter value "20000" into field "fieldAwardFloor__c"
    And I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    Then I softly see field "Estimated Total Program Funding" as "$50,000.00"
    Then I softly see field "Award Ceiling" as "$30,000.00"
    Then I softly see field "Award Floor" as "$20,000.00"

  @63186 @validateExpectedNoOfAwardFieldsWithCharacterValuesAcceptance
  Scenario: Verify system should display error message while entering character value inside Expected no of Award fields
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    When I enter value "abcdefgh" into field "fieldExpectedNumberofAwards__c"
    And I click on "Save" in the page details
    Then  I see the following messages in the page details :
      | Expected Number of Awards : Invalid number |

  @63186 @validateCreationOfLeadWithNonFederalOrganizationWithSourceAsState @wip  @positive
  Scenario: Verify user is able to create lead with Non federal organization with source as state
    When I delete the record "Automation Non Federal Organization" from the object "Account"
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalOrganizations}"
    When I enter "NonFederalOrganization" values from "Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    Then I softly see field "Non-Federal Organization" as "Automation Non Federal Organization"
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value "Automation Non Federal Organization" into field "fieldFederalAgency__c"
    And I click on "Save and Continue" in the page details
    Then I see field "Source" as "State"

  @63186 @validateCreationOfLeadWithNonFederalOrganizationWithSourceAsNGO @wip  @positive
  Scenario: Verify user is able to create lead with Non federal organization with source as NGO
    When I delete the record "Automation Non Federal Organization" from the object "Account"
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalOrganizations}"
    When I enter "NonFederalOrganization" values from "Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    Then I softly see field "Non-Federal Organization" as "Automation Non Federal Organization"
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value "AIDS Funding Collaborative" into field "fieldFederalAgency__c"
    And I click on "Save and Continue" in the page details
    Then I see field "Source" as "NGO"

  @63186 @validateCreationOfLeadWithNonFederalOrganizationWithSourceAsFederal  @positive
  Scenario: Verify user is able to create lead with Non federal organization with source as Federal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    Then I see field "Source" as "Federal"

  @63186 @validateCreationOfLeadWithSameOpportunityNumber @wip  @positive
  Scenario: Verify user is not able to create lead with same opportunity number for same organization
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    Then I see field "Source" as "Federal"
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    Then  I see the following messages in the page details :
      | A lead(LD-10799) already exists with the Opportunity Number AL-01 for the Agency USDA-NRCS-NHO |

  @63186 @validateCreationOfLeadWithSameOpportunityNumberForDifferentOrganization @wip  @positive
  Scenario: Verify user is able to create lead with same opportunity number for different organization
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    Then I see field "Source" as "Federal"
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    When I enter value "AIDS Funding Collaborative" into field "fieldFederalAgency__c"
    And I click on "Save" in the page details
    Then I see field "Source" as "NGO"

  @63186 @validateAllFieldsValidationErrorMessage
  Scenario: Verify all validation error message for fields while lead creation
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details :
      | Funding Organization is Required to save under Overview.                   |
      | Opportunity Number is Required to save under Overview.                     |
      | Opportunity Title is Required to save under Overview.                      |
      | Opportunity Category is Required to save under Overview.                   |
      | Application Due Date is Required to save under Overview.                   |
      | Funding Instrument Type is Required to save under Overview.                |
      | Eligible Applicants is Required to save under Overview.                    |
      | Lead Description is Required to save under Overview.                       |
      | Grantor Contact Information is Required to save under Overview.            |
      | Cost Sharing or Matching Requirement is Required to save under Financials. |

  @63186 @validateFundingOrganizationLookupSearchField  @positive
  Scenario: Verify user is able to search with federal organization create lead with Non federal organization with source as Federal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I click search icon for lookup "Funding Organization Lookup (New Window)"
    When I perform quick search for "USDA-NRCS-NHO" in "{grantee_tableId:OrganizationModal}" panel
    Then I see value "USDA-NRCS-NHO" for title "Organization Name" inside table "{grantee_tableId:OrganizationModal}"

  @63201 @validateEditIconVisibilityForSpecificUsers-PM-EXE-PO @smoke @buglogged72968  @positive
  Scenario Outline: Verify row level edit action is visible for expected user
    When I login to "As a Grantee" app as "<userType>" user
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
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Lead}" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"

    Examples:
      | userType    |
      | GRANTEE PM  |
      | GRANTEE PO  |
      | GRANTEE EXE |

  @63201 @validateEditIconVisibilityForSpecificUsers-ADMIN-FD-FO @smoke
  Scenario Outline: Verify row level edit action is not visible for expected user
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Lead}" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE FO    |
      | GRANTEE FD    |

  @63201 @verifyEditActionVisibilityWithDifferentUserOfSameProfile
  Scenario: Validate row level edit action should not displayed to different user of same profile
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "GRANTEE PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Lead}" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"

  @63201 @validateFieldsIsInEditMode  @positive
  Scenario: Verify page details fields is in edit mode after editing already created lead.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I softly see fields "fieldOpportunityNumber__c" is in edit mode
    Then I softly see fields "fieldOpportunityTitle__c" is in edit mode
    Then I softly see fields "fieldOpportunityCategory__c" is in edit mode
    Then I softly see fields "fieldDescription__c" is in edit mode
    Then I softly see fields "fieldCloseDate__c" is in edit mode
    Then I softly see fields "fieldGrantorContactEmailDescription__c" is in edit mode
    And I navigate to "Financials" sub tab
    Then I softly see fields "fieldEstimatedTotalProgramFunding__c" is in edit mode
    Then I softly see fields "fieldAwardCeiling__c" is in edit mode
    Then I softly see fields "fieldRateOfMatch__c" is in edit mode

  @63201 @validateFieldsIsInViewMode  @positive
  Scenario: Verify page details fields is in view mode after editing already created lead_EGMS Lead
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "Philippines USAID-Manila" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "Philippines USAID-Manila" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Grants.gov URL" as "grantsgovurl"
    Then I softly see field "Grants.gov URL" as "{SavedValue:grantsgovurl}"

  @63201 @validateAdditionOfAttachment  @positive
  Scenario: Verify user is able to add attchment while creating leads
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside table
    When I navigate to "Attachments" sub tab
    When I upload attachment "AttachmentTesting.pdf" of type "FOA Documents"
    When I pause execution for "3" seconds
    When I refresh the page
    Then I see table with header "Attachments" contains records "AttachmentTesting.pdf"

  @63201 @validateErrorMessageWhileAdditionOfAttachment
  Scenario: Verify user is able to get validation message while adding attchment
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside table
    When I navigate to "Attachments" sub tab
    When I click on "AddAttachments" button inside attachments page block
    And I pause execution for "3" seconds
    When I click modal button "Save"
    When I pause execution for "3" seconds
    Then I see the following messages in the page details :
      | Please choose a Document for upload.   |
      | Please provide Attachment Description. |

  @63201 @validateAttachmentTypeValues  @positive
  Scenario: Verify user is able to see expected values inside Type fields on attchment modal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside table
    When I navigate to "Attachments" sub tab
    When I click on "AddAttachments" button inside attachments page block
    Then I see "FOA Documents:RFA Documents:Program Related Documents:Other" inside Type selectbox

  @63201 @validateAdditionOfNotes  @positive
  Scenario: Verify user is able to add notes while creating leads
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside table
    When I navigate to "Attachments" sub tab
    And I add notes records
    And I close "Add Notes" modal by clicking the top right x button
    Then I see table with header "Notes" contains records "Notes Record"

  @63201 @validateErrorMessageWhileAdditionOfNotes
  Scenario: Verify user is able to get validation message while adding attchment
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside table
    When I navigate to "Attachments" sub tab
    When I click on "Add" button inside attachments page block
    When I click modal button "Save"
    When I pause execution for "3" seconds
    Then I see the following messages in the page details :
      | Please enter Required fields |

  @63201 @validateDeletionOfAttachmentRecord  @positive
  Scenario: Verify user is able to delete added record attchment
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside table
    When I navigate to "Attachments" sub tab
    When I upload attachment "AttachmentTesting.pdf" of type "FOA Documents"
    When I pause execution for "3" seconds
    When I click on "Delete" icon for "AttachmentTesting.pdf" inside table
    When I pause execution for "3" seconds
    Then I see confirmation box with body "Record deleted successfully." is displayed

  @63201 @validateDeletionOfAddedNotes  @positive
  Scenario: Verify user is able to delete already created notes record
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside table
    When I navigate to "Attachments" sub tab
    And I add notes records
    And I close "Add Notes" modal by clicking the top right x button
    When I click on "Delete" icon for "Notes Record" inside table
    Then I see confirmation box with body "Record deleted successfully." is displayed

  @63201 @validateErrorMessageForAwardCeilingAndAwardFloorFields @positive
  Scenario: Verify user is getting validation message while entering award ceiling value is less than award floor value on lead creation
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    And I navigate to "Financials" sub tab
    When I enter value "20000" into field "fieldAwardCeiling__c"
    When I enter value "30000" into field "fieldAwardFloor__c"
    And I click on "Save" in the page details
    Then I see the following messages in the page details :
      | The Award Ceiling cannot be less than the Award Floor |

  @63172 @validateDeleteIconDisplayedToRecordOwner  @positive
  Scenario: Verify row level delete button is displayed to record owner of created lead
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I can see row level action button "Delete" against "{SavedValue:Automation Runtime Lead}" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"

  @63172 @validateDeleteIconDisplayedToAdmin  @positive
  Scenario Outline: Verify row level delete button is displayed to Admin of record created by EXE PM PO
    When I login to "As a Grantee" app as "<userType>" user
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
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I can see row level action button "Delete" against "{SavedValue:Automation Runtime Lead}" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"

    Examples:
      | userType    |
      | GRANTEE EXE |
      | GRANTEE PM  |
      | GRANTEE PO  |

  @63172 @validateDeletionOfLeadRecordWithPM_EXE_PO_ADMIN  @positive
  Scenario Outline: Verify manually created lead can be deleted by specific users
    When I login to "As a Grantee" app as "<userType>" user
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
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "Delete" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I see the text :
      | Record deleted successfully. |

    Examples:
      | userType    |
      | GRANTEE EXE |
      | GRANTEE PM  |
      | GRANTEE PO  |

  @63172 @validateDeleteIconNotDisplayedToFD_FOUser
  Scenario Outline: Verify row level delete button should not be displayed to FD FO user for record created bt EXE PM PO
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime Lead}" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"

    Examples:
      | userType   |
      | GRANTEE FO |
      | GRANTEE FD |

  @63172 @validateDeleteIconNotDisplayedToRecordOwner_Admin   @positive
  Scenario Outline: Verify row level delete button should not be displayed to record owner and Admin user after lead has been qualified
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    Examples:
      | userType      |
      | GRANTEE ADMIN |

  @63172 @validateConfirmationMessageOnRecordDeletion  @positive
  Scenario: Verify confirmation message on deletion of manually created lead
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "Delete" icon for "{SavedValue:Automation Runtime Lead}" inside table with table id "{grantee_tableId:LeadsNotYetQualified}" without processing
    Then I see confirmation box with body "Are you sure you want to permanently delete the lead?" is displayed

  @63172 @validateRecordDeletionOfCreatedLead @positive
  Scenario: Verify record has been deleted while clicking on delete icon from table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "Delete" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    Then I do not see value "{SavedValue:Automation Runtime Lead}" for title "Organization Title" inside table "{grantee_tableId:LeadsNotYetQualified}"