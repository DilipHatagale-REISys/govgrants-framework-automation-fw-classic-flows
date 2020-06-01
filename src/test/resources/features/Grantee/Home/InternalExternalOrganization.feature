@InternalExternalOrganization @grantee-regression @grantee-parallel-regression
Feature:Internal organization related scenarios
  Test all scenarios related to Internal organization

  @61962 @validateInternalLoginForPuertorico @smoke @positive
  Scenario Outline: User enters correct username and password to login and reaches homepage
    When I login as "<userType>" user
    Then I am logged in
    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @61682 @validateRelatedLogsSubTabDetailsForInternalOrganizations @smoke @positive
  Scenario: Validate Related Logs sub tab details for internal organizations detail page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I navigate to "Related Log" sub tab
    Then I softly see the text containing :
      | Internal Programs |
      | Opportunities     |
      | Applications      |
      | Grants            |

  @61682 @validateQuickSearchIsWorkingOrNotAtRelatedLogsSubTab @smoke @positive
  Scenario: Validate search is working properly for valid and invalid input value at Internal organization table
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:InternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "EnhanceGranteeStateProgramsgrid"
    When I enter "ProgramsInternalProgram" values from "Field_Values.xlsx"
    And I click on "Save" in the page details
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "{prdoh_tableId:InternalProgram}" panel
    Then I softly see value "{SavedValue:Automation Runtime Internal Program}" for title "Title" inside table "{prdoh_tableId:InternalProgram}"
    When I perform quick search for "Invalid Automation Internal Program" in "{prdoh_tableId:InternalProgram}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:InternalProgram}"

  @61682 @validateAdvanceSearchIsWorkingOrNotAtRelatedLogSubTab @positive
  Scenario: Validate advance search is working or not for correct and incorrect value at Internal Programm table
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:InternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "EnhanceGranteeStateProgramsgrid"
    When I enter "ProgramsInternalProgram" values from "Field_Values.xlsx"
    And I click on "Save" in the page details
    And I re-login as "ADMIN" user on "default" portal
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I navigate to "Related Log" sub tab
    When I click on advance filter "#advfAgencyPrograms" of table id "{prdoh_tableId:OpportunityConvertedToApplication}"
    When I enter advance filter values inside id "advfAgencyPrograms"
      | Title | starts with | Automation |
    Then I softly see value "{SavedValue:Automation Runtime Internal Program}" for title "Title" inside table "{prdoh_tableId:InternalProgram}"
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I navigate to "Related Log" sub tab
    When I click on advance filter "#advfAgencyPrograms" of table id "{prdoh_tableId:InternalProgram}"
    When I enter advance filter values inside id "advfAgencyPrograms"
      | Title | starts with | 2Automation |
    Then I softly do not see value "2Automation" for title "Title" inside table "{prdoh_tableId:InternalProgram}"

  @61682 @validateViewOfAllPageBlocksForRelatedLogsSubTab @positive
  Scenario: Validate page detail view for all page blocks at related logs sub tab at Internal Program table
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login as "PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{sidebar:NotyetQualifiedLead}" content inside "{sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I pause execution for "2" seconds
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:InternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "EnhanceGranteeStateProgramsgrid"
    When I enter "ProgramsInternalProgram" values from "Field_Values.xlsx"
    And I click on "Save" in the page details
    And I re-login as "Admin" user on "default" portal
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "{prdoh_tableId:InternalProgram}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "{prdoh_tableId:InternalProgram}"
    Then I see the header is "Internal Program" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Internal Program}" in the page details
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Direccion General" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Direccion General" inside table
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:OpenQualifiedTable}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:OpenQualifiedTable}"
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Lead}" in the page details

  @61682 @validateRefreshAtInternalProgramsUnderRelatedLogForInternalOrganizations @positive
  Scenario: Validate Refresh option at Internal Program page block is working properly as expected
    When I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I navigate to "Related Log" sub tab
    When I click on parallel lines menu bar with data target value "#AgencyProgramsFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Internal Programs"
    Then I see table is refreshing

  @61676 @validateEditSaveFunctionalityAtViewDetailPageForInternalOrganizations @positive
  Scenario: Validate at view detail page for internal organizations edit and save functionality is working correctly with admin user.
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in the page details
    Then I softly see field "Organization Type" as "Agency"
    When I click "SYSTEM" lookup link
    And I softly see the text containing :
      | Overview    |
      | Related Log |
      | Attachments |
      | History     |
    When I click on "Edit" in the page details
    When I enter value "121 Nelson Drive" into field "fieldBillingStreet"
    When I click on "Save and Continue" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly see field "Street" as "121 Nelson Drive"

  @61676 @validateEditFunctionalityOfInternalOrganizationsWithDifferentUsers
  Scenario Outline: Validate mentioned users can not edit internal organizations detail page
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | userType |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @61667 @validateViewInternalOrganizations @checkChildOrganizationNotAvailable @wip
  Scenario: Validate view detail page of parent and child organization for internal organizations detail page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    Then I softly see field "Internal Organization" as "Secretaria Auxiliar de Salud Familiar y Servicios Integrados"
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I expand nested table containing column value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados"
    When I click on "View" icon for "Central Office of AIDS Issues and Communicable Diseases" inside table
    Then I softly see field "Internal Organization" as "Central Office of AIDS Issues and Communicable Diseases"

  @61659 @validateViewOfInternalOrganizationList @wip
  Scenario Outline: Validate help text message at quick search of child table at internal organizations detail page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I expand nested table containing column value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados"
    When I hovering mouse on help text icon inside "DivisionsFlexToggle" for table
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                   |
      | Quick Search is Case Sensitive |

  @61659 @validateQuickSearchIsWorkingForCorrectValueAtViewOfInternalOrganizationTable @positive
  Scenario: Validate quick search is working or not for correct search value with case sensitive at internal organizations table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    Then I softly see value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" for title "Organization Name" inside table "{prdoh_tableId:InternalOrganizations}"
    When I perform quick search for "Test Record" in "{prdoh_tableId:InternalOrganizations}" panel
    Then I see "No Records Found" inside flex table with id "{prdoh_tableId:InternalOrganizations}"

  @61659 @validateAdvanceSearchIsWorkingForIncorrectValueAtViewOfInternalOrganizationTable
  Scenario: Validate advance search is working or not for incorrect search value at internal organizations table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on advance filter "#advfInternalOrganizationHierarchy1" of table id "{prdoh_tableId:InternalOrganizations}"
    When I enter advance filter values inside id "advfInternalOrganizationHierarchy1"
      | Organization Name | contains | Secretaria Auxiliar de Salud Familiar y Servicios |
    Then I softly see value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" for title "Organization Name" inside table "{prdoh_tableId:InternalOrganizations}"
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on advance filter "#advfInternalOrganizationHierarchy1" of table id "{prdoh_tableId:InternalOrganizations}"
    When I enter advance filter values inside id "advfInternalOrganizationHierarchy1"
      | Organization Name | contains | secretaria auxiliar de salud familiar y servicios |
    Then I softly do not see value "Secretaria Auxiliar de Salud Familiar y Servicios" for title "Organization Name" inside table "{prdoh_tableId:InternalOrganizations}"

  @61659 @validateRefreshOptionIsWorkingOrNotAtInternalOrganizationTable @positive
  Scenario: Validate internal organization table is getting refresh with Refresh dropdown option click at internal organizations table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#InternalOrganizationHierarchy1FlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Internal Organization Hierarchy"
    Then I see table is refreshing

  @61659 @validateTotalRecordCountAtInternalOrganizationTable @positive
  Scenario: Validate total records count is displayed as number of records in internal organization table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    Then I see total records count is same as total row of table id "{prdoh_tableId:InternalOrganizations}" and table name "flexTable"

  @61748 @validateContactViewFunctionalityAtInternalOrganizations @smoke @positive
  Scenario Outline: Validate contact view detail page with multiple users at internal organizations
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I perform quick search for "Automation Test Record" in "{prdoh_tableId:RelatedContacts}" panel
    When I click on "View" icon for "Automation Test Record" inside table
    When I click "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" lookup link
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in the page details

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @61752 @validateVisibilityOfDeleteIconforActiveAndNonActiveEgmsUserAtInternalOrganizations @smoke @positive
  Scenario: Validate delete icon is visible for active non avtive contacts at intenal organizations
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contacts"
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Direccion General" into field "fieldAccountId"
    When I click on "Save" in the page details
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Direccion General" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Direccion General" inside table
    When I perform quick search for "Automation PM" in "{prdoh_tableId:RelatedContacts}" panel
    Then I softly can see row level action button "Remove" against "Automation PM" in flex table with id "{prdoh_tableId:RelatedContacts}"
    When I perform quick search for "AutomationUser" in "{prdoh_tableId:RelatedContacts}" panel
    Then I softly can see row level action button "Remove" against "AutomationUser" in flex table with id "{prdoh_tableId:RelatedContacts}"

  @61752 @validateDeletionOfActiveAndNonActiveContactFromReletedContactsAtInternalOrganizations @positive
  Scenario: Validate contact deletion from related contacts for Active nonActive contacts at internal organizations
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contacts"
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Direccion General" into field "fieldAccountId"
    When I click on "Save" in the page details
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Direccion General" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Direccion General" inside table
    When I perform quick search for "Automation PM" in "{prdoh_tableId:RelatedContacts}" panel
    When I click on "Remove" icon for "Automation PM" inside flex table with id "{prdoh_tableId:RelatedContacts}"
    Then I softly see the following messages in the page details contains:
      | You cannot delete an internal contact who is an active EGMS user. Please contact your system administrator to deactivate the user.After deactivation, the internal contact can be deleted. |
    When I perform quick search for "AutomationUser" in "{prdoh_tableId:RelatedContacts}" panel
    When I click on "Remove" icon for "AutomationUser" inside flex table with id "{prdoh_tableId:RelatedContacts}"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

  @61741 @validateRealtedContactsListViewAtInternalOrganizations @smoke @positive
  Scenario Outline: Validate related contacts list view for internal organizations detail page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    Then I see "<fieldDisplayNames>" in flex table header "{prdoh_tableId:RelatedContacts}"

    Examples:
      | fieldDisplayNames     |
      | Full Name             |
      | Title                 |
      | Email                 |
      | Office Phone          |
      | Organization          |
      | Registered EGMS User? |

  @61741 @validateSearchIsWorkingOrNotAtRealtedContactsTable @positive
  Scenario: Validate related contacts search is working or not  with case sensitive at related contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Direccion General" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Direccion General" inside table
    When I perform quick search for "Automation Program Manager" in "{prdoh_tableId:RelatedContacts}" panel
    Then I softly see value "Automation Program Manager" for title "Title" inside table "{prdoh_tableId:RelatedContacts}"
    When I perform quick search for "Invalid Test Automation Test Automation Record" in "{prdoh_tableId:RelatedContacts}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:RelatedContacts}"

  @61741 @validateAdvanceFilterSearchIsWorkingForAtRelatedContactTable @positive
  Scenario: Validate advance search is working or not for correct incorrect search value at Related contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I click on advance filter "#advfContactsByAccount" of table id "{prdoh_tableId:RelatedContacts}"
    When I enter advance filter values inside id "advfContactsByAccount"
      | Full Name | starts with | Automation Test Record |
    Then I softly see value "Automation Test Record" for title "Full Name" inside table "{prdoh_tableId:RelatedContacts}"
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I click on advance filter "#advfContactsByAccount" of table id "{prdoh_tableId:RelatedContacts}"
    When I enter advance filter values inside id "advfContactsByAccount"
      | Full Name | starts with | #Automation |
    Then I softly do not see value "#Automation Test Record" for title "Full Name" inside table "{prdoh_tableId:RelatedContacts}"

  @61741 @validateSearchHelpTextAtRelatedContactstable @FunctionalityNotPresent @wip
  Scenario Outline: Validate help text context at related contacts table search
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I hovering mouse on help text icon inside "{prdoh_tableId:RelatedContacts}" for table
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                   |
      | Quick Search is Case Sensitive |

  @61741 @validatePaginationFunctionalityIsWorkingOrNotAtRealtedContactsTable @positive
  Scenario: Validate pagination arrow is working fine at Related contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    And I click on page navigation arrow "{prdoh_tableId:RelatedContacts}" for table id "Next"
    Then I see table "{prdoh_tableId:RelatedContacts}" shows "Page 2"

  @61741 @validateShowEntriesDropdownFunctionalityIsWorkingOrNotAtRealtedContactsTable @positive
  Scenario: Validate show entries dropdown is working fine at Related contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    And I select value inside table "{prdoh_tableId:RelatedContacts}" is "5"
    Then I see "5" records inside flex table id "{prdoh_tableId:RelatedContacts}"

  @61741 @validateDefaultEntriesAtRealtedContactsTable @positive
  Scenario: Validate default count of records at Related contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    Then I see default record count of table "{prdoh_tableId:RelatedContacts}" is as expected

  @61741 @validateTotalRecordsAtRealtedContactsTable @positive
  Scenario: Validate total records inside table is equal to total number of records present inside Related contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    And I select value inside table "{prdoh_tableId:RelatedContacts}" is "All"
    Then I see total records count in flex table "{prdoh_tableId:RelatedContacts}"

  @61741 @validateSortingOfColumnAtRelatedContacttableOfInternalOrganization @positive
  Scenario: Validate columns of federal organization table is getting sorted in ascending order on column click
    Given I login as "ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I click on "Full Name" column header inside table with id "{prdoh_tableId:RelatedContacts}"
    Then I softly see content of expected column "Full Name" is in "Ascending" order of table id "{prdoh_tableId:RelatedContacts}"
    When I click on "Full Name" column header inside table with id "{prdoh_tableId:RelatedContacts}"
    Then I softly see content of expected column "Full Name" is in "Descending" order of table id "{prdoh_tableId:RelatedContacts}"
    And I refresh the page
    When I click on "Title" column header inside table with id "{prdoh_tableId:RelatedContacts}"
    Then I softly see content of expected column "Title" is in "Ascending" order of table id "{prdoh_tableId:RelatedContacts}"
    When I click on "Title" column header inside table with id "{prdoh_tableId:RelatedContacts}"
    Then I softly see content of expected column "Title" is in "Descending" order of table id "{prdoh_tableId:RelatedContacts}"
    And I refresh the page
    When I click on "Email" column header inside table with id "{prdoh_tableId:RelatedContacts}"
    Then I softly see content of expected column "Email" is in "Ascending" order of table id "{prdoh_tableId:RelatedContacts}"
    When I click on "Email" column header inside table with id "{prdoh_tableId:RelatedContacts}"
    Then I softly see content of expected column "Email" is in "Descending" order of table id "{prdoh_tableId:RelatedContacts}"

  @61746 @validateAddingOfContactWithOrWithoutMandatoryFieldsAtInternalOrganizations @smoke
  Scenario: Validate contact related contacts for Active nonActive contacts at internal organizations
    Given I login as "ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    And I click on top right button "New" in flex table with id "{prdoh_tableId:RelatedContacts}"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Last Name : You must enter a value |
    And I refresh the page
    When I enter value "automationtest" into field "fieldEmail"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Last Name : You must enter a value |
      | Email : Invalid Email Address.     |
    And I refresh the page
    When I enter "ContactCreationDuplicateEmail" values from "Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |
    When I enter "ContactCreationWithInvalidPhone" values from "Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Mobile Phone should be number and (XXX) XXX-XXXX format. |
      | Phone Number should be number and (XXX) XXX-XXXX format. |
      | Zip Code should be number and XXXXX format.              |
    And I refresh the page
    When I enter "ContactCreationInvalidAddress" values from "Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Street:Data value too large. (max length=255) |

  @61746 @validateAddingOfContactWithDifferentUsers @positive
  Scenario Outline: Validate addition of contact with different users at internal organizations
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Direccion General" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Direccion General" inside table
    And I click on top right button "New" in flex table with id "{prdoh_tableId:RelatedContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Direccion General" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Direccion General" inside table
    When I perform quick search for "AutomationUser" in "{prdoh_tableId:RelatedContacts}" panel
    Then I see value "AutomationUser" for title "Title" inside table "{prdoh_tableId:RelatedContacts}"
    When I click on "Remove" icon for "AutomationUser" inside flex table with id "{prdoh_tableId:RelatedContacts}"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @61885 @validateAddingOfIndirectRateAtInternalUser @positive
  Scenario: Validate addition of Indirect Rate with valid or invalid inputs at internal organizations
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    And I navigate to "Overview" sub tab
    When I click on "Delete" icon for "Automation Indirect Rate" inside flex table with id "IndirectRateGridgrid"
    And I click on top right button "New" in flex table with id "IndirectRateGridgrid"
    When I enter in modal "IndirectFieldsValue" values from "Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "IndirectRateGridgrid"
    When I enter in modal "IndirectRateWithInvalidDate" values from "Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Indirect Rates can not overlap. Please check the "Date From" and "Date To" dates of the Indirect Rates |

  @61885 @validateRealtedColumnsOfIndirectRateAtInternalOrganizations @positive
  Scenario Outline: Validate Indirect Rate columns are displayed properly for internal organizations detail page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    Then I see "<fieldDisplayNames>" in flex table header "IndirectRateGridgrid"

    Examples:
      | fieldDisplayNames              |
      | Title                          |
      | Date From                      |
      | Date To                        |
      | Approved Indirect Cost Rate(%) |
      | Indirect Cost Rate Type        |
      | Budget Categories              |

  @61725 @validateQuickSearchIsWorkingOrNotAtFederalOrganization @positive
  Scenario: Validate search is working properly at Federal Organization table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{prdoh_tableId:FederalOrganizations}" panel
    Then I softly see value "ACC-APG-Belvoir" for title "Federal Organization" inside table "{prdoh_tableId:FederalOrganizations}"

  @61725 @validateAdvanceSearchIsWorkingOrNotAtFederalOrganization @positive
  Scenario: Validate advance search is working or not at Federal organization table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on advance filter "#advfExternalOrganizationHierarchy" of table id "{prdoh_tableId:FederalOrganizations}"
    When I enter advance filter values inside id "advfExternalOrganizationHierarchy"
      | Federal Organization | contains | Belvoir |
    Then I see value "ACC-APG-Belvoir" for title "Federal Organization" inside table "{prdoh_tableId:FederalOrganizations}"

  @61725 @validateTotalRecordCountAtFederalOrganizationTable @positive
  Scenario: Validate total records count is displayed as number of records in federal organization table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    And I select value inside table "{prdoh_tableId:FederalOrganizations}" is "10"
    Then I see total records count is same as total row of table id "{prdoh_tableId:FederalOrganizations}" and table name "flexGrid"

  @61725 @validateNativePageAccessToAdminUsersAtFederalOrganization @smoke @positive
  Scenario: Validate govgrant set up option is visible only to admin user
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{prdoh_tableId:FederalOrganizations}" panel
    When I click on "View" icon for "ACC-APG-Belvoir" inside table
    And I click on botton menu "sticky_bottom_Menu"
    Then I softly see "Enable GovGrants Setup" inside bottom menu

  @61725 @validateSortingOfColumnAtExternalFederalOrganization @positive
  Scenario: Validate columns of External federal organization table is getting sorted in ascending/descending order on column click
    Given I login as "ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on "Federal Organization" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Federal Organizations" is in "Ascending" order of table id "{prdoh_tableId:FederalOrganizations}"
    When I click on "Federal Organization" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Federal Organizations" is in "Descending" order of table id "{prdoh_tableId:FederalOrganizations}"
    And I refresh the page
    When I click on "Abbreviation" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Abbreviation" is in "Ascending" order of table id "{prdoh_tableId:FederalOrganizations}"
    When I click on "Abbreviation" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Abbreviation" is in "Descending" order of table id "{prdoh_tableId:FederalOrganizations}"
    And I refresh the page
    When I click on "Parent Organization" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Parent Organization" is in "Ascending" order of table id "{prdoh_tableId:FederalOrganizations}"
    When I click on "Parent Organization" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Parent Organization" is in "Descending" order of table id "{prdoh_tableId:FederalOrganizations}"

  @61784 @validateInternalUserCanAccessFederalOrganization @smoke
  Scenario Outline: Validate different internal users can access federal organizations
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{prdoh_tableId:FederalOrganizations}" panel
    When I click on "View" icon for "ACC-APG-Belvoir" inside table
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "ACC-APG-Belvoir" in the page details

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @61808 @validateFederalOrganizationAddress
  Scenario: Validate Address detail of Federal organization
    Given I login as "ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{prdoh_tableId:FederalOrganizations}" panel
    When I click on "View" icon for "ACC-APG-Belvoir" inside table
    Then I softly see field "Organization Name" as "ACC-APG-Belvoir"
    Then I softly see field "Street" as "1000 Defense Pentagon"
    Then I softly see field "State" as "DC"
    Then I softly see field "Zip Code" as "20301"
    Then I softly see field "Abbreviation" as "DOD-AMC-ACCAPGB"
    Then I softly see field "Website" as "www.defense.gov"
    Then I softly see field "City" as "Washington"
    When I click "www.defense.gov" lookup link
    Then I see new tab is opened

  @61808 @validateReadOnlyModeOfAddressFieldsAtExternalFederalOganization @smoke
  Scenario: Validate address fields is in view mode at External Federal organization
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{prdoh_tableId:FederalOrganizations}" panel
    When I click on "View" icon for "ACC-APG-Belvoir" inside table
    Then I softly see field "Organization Name" as "ACC-APG-Belvoir"

  @61596 @validateSortingOfFederalOrganizationtableColumns
  Scenario: Validate columns of federal organization table is getting sorted in ascending/descending order on column click
    Given I login as "ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on "Federal Organization" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Federal Organization" is in "Ascending" order of table id "{prdoh_tableId:FederalOrganizations}"
    When I click on "Federal Organization" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Federal Organization" is in "Descending" order of table id "{prdoh_tableId:FederalOrganizations}"
    And I refresh the page
    When I click on "Abbreviation" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Abbreviation" is in "Ascending" order of table id "{prdoh_tableId:FederalOrganizations}"
    When I click on "Abbreviation" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Abbreviation" is in "Descending" order of table id "{prdoh_tableId:FederalOrganizations}"
    And I refresh the page
    When I click on "Parent Organization" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Parent Organization" is in "Ascending" order of table id "{prdoh_tableId:FederalOrganizations}"
    When I click on "Parent Organization" column header inside table with id "{prdoh_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Parent Organization" is in "Descending" order of table id "{prdoh_tableId:FederalOrganizations}"
    And I refresh the page

  @61596 @validateTotalRecordCountAtFederalOrganizationTableAsExpected @wip
  Scenario: Validate records count of federal organization table is same as displayed in entries
    Given I login as "ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I pause execution for "5" seconds
    Then I see "10" records inside flex table id "{prdoh_tableId:FederalOrganizations}"

  @62555 @validateQuickSearchIsWorkingOrNotAtNonFederalOrganization
  Scenario: Validate search is working properly at Federal Organization table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:NonFederalOrganizations}"
    When I enter "NonFederalOrganization" values from "Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime NF Organization}" in "{prdoh_tableId:NonFederalOrganizations}" panel
    Then I softly see value "{SavedValue:Automation Runtime NF Organization}" for title "Organization" inside table "{prdoh_tableId:NonFederalOrganizations}"
    And I refresh the page
    When I perform quick search for "Invalid Automation Non Federal Organization" in "{prdoh_tableId:NonFederalOrganizations}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:NonFederalOrganizations}"

  @62555 @validateAdvanceSearchIsWorkingOrNotAtNonFederalOrganization
  Scenario: Validate advance search is working or not at Federal organization table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on advance filter "#advfNGOOrganizationHierarchy" of table id "{prdoh_tableId:NonFederalOrganizations}"
    When I enter advance filter values inside id "advfNGOOrganizationHierarchy"
      | Organization | contains | Collaborative |
    Then I softly see value "AIDS Funding Collaborative A" for title "Organization" inside table "{prdoh_tableId:NonFederalOrganizations}"
    And I refresh the page
    When I click on advance filter "#advfNGOOrganizationHierarchy" of table id "{prdoh_tableId:NonFederalOrganizations}"
    When I enter advance filter values inside id "advfNGOOrganizationHierarchy"
      | Organization | contains | Demo |
    Then I softly do not see value "Demo" for title "Organization" inside table "{prdoh_tableId:NonFederalOrganizations}"

  @62555 @validatePaginationFunctionalityIsWorkingOrNotAtNonFederalOrganizationTable @wip
  Scenario: Validate pagination arrow is working fine at non federal organization table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    And I click on page navigation arrow "{prdoh_tableId:NonFederalOrganizations}" for table id "Next"
    Then I softly see table "{prdoh_tableId:NonFederalOrganizations}" shows "Page 2"

  @62555 @validateRecordsAsPerShowEntriesDropdownAtNonFederalOrganizationTable @wip
  Scenario: Validate show entries dropdown is working fine and its showing same as records present in Non federal organization table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    And I select value inside table "{prdoh_tableId:NonFederalOrganizations}" is "5"
    Then I see "5" records inside flex table id "{prdoh_tableId:NonFederalOrganizations}"

  @62555 @validateHelpTextAtNonFederalOrganizatioQuickSearch @wip
  Scenario Outline: Validate help text content on mouse hover at Non federal organization
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I hovering mouse on help text icon inside "{prdoh_tableId:NonFederalOrganizations}" for table
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                   |
      | Quick Search is Case Sensitive |

  @62555 @validateSortingOfNonFederalOrganizationTableColumns
  Scenario: Validate columns of Non federal organization table is getting sorted in ascending/descending order on column click
    Given I login as "ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on "Organization" column header inside table with id "{prdoh_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Organization" is in "Ascending" order of table id "{prdoh_tableId:NonFederalOrganizations}"
    When I click on "Organization" column header inside table with id "{prdoh_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Organization" is in "Descending" order of table id "{prdoh_tableId:NonFederalOrganizations}"
    And I refresh the page
    When I click on "Abbreviation" column header inside table with id "{prdoh_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Abbreviation" is in "Ascending" order of table id "{prdoh_tableId:NonFederalOrganizations}"
    When I click on "Abbreviation" column header inside table with id "{prdoh_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Abbreviation" is in "Descending" order of table id "{prdoh_tableId:NonFederalOrganizations}"
    And I refresh the page
    When I click on "Organization Type" column header inside table with id "{prdoh_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Organization Type" is in "Ascending" order of table id "{prdoh_tableId:NonFederalOrganizations}"
    When I click on "Organization Type" column header inside table with id "{prdoh_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Organization Type" is in "Descending" order of table id "{prdoh_tableId:NonFederalOrganizations}"
    And I refresh the page

  @62555 @validateTotalRecordsAtNonFederalOrganizationTable
  Scenario Outline: Validate total records inside table is equal to total number of rows present inside External federal contacts table will all users
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I pause execution for "5" seconds
    Then I see total records count is same as total row of table id "{prdoh_tableId:NonFederalOrganizations}" and table name "flextable"

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @62555 @validateNativePageAccessToAdminUsersAtNonFederalOrganization
  Scenario: Validate govgrant set up option is visible only to admin user
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:NonFederalOrganizations}"
    When I enter "NonFederalOrganization" values from "Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime NF Organization}" in "{prdoh_tableId:NonFederalOrganizations}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime NF Organization}" inside table
    And I click on botton menu "sticky_bottom_Menu"
    Then I softly see "Enable GovGrants Setup" inside bottom menu

  @62555 @validateRefreshOptionsAtAtNonFederalOrganizationTable
  Scenario: Validate Refresh option at External non federal organization is working or not
    When I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#NGOOrganizationHierarchyFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Non-Federal Organizations"
    Then I see table is refreshing

  @61871 @validateCreationOfNonFederalOrganization @smoke
  Scenario Outline: Validate creation of new non federal organization record at Non federal Organization table
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:NonFederalOrganizations}"
    When I enter "NonFederalOrganization" values from "Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    Then I softly see field "Non-Federal Organization" as "Automation Non Federal Organization"
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime NF Organization}" in "{prdoh_tableId:NonFederalOrganizations}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime NF Organization}" inside flex table with id "{prdoh_tableId:NonFederalOrganizations}"
    When I enter value "virginia" into field "fieldBillingCity"
    When I click on "Save and Continue" in the page details
    Then I softly see field "City" as "virginia"

    Examples:
      | userType |
      | ADMIN    |
      | PM       |

  @61986 @validateExternalNonFederalOrganizationDetailsWithContactSection @smoke
  Scenario: Validate all details with website link and contact section is proper at External Non-Federal Organization table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "AIDS Funding Collaborative A" in "{prdoh_tableId:NonFederalOrganizations}" panel
    When I click on "View" icon for "AIDS Funding Collaborative A" inside flex table with id "{prdoh_tableId:NonFederalOrganizations}"
    And I softly see the text containing :
      | Address             |
      | Child Organizations |
      | Related Contacts    |
      | System Information  |
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "AIDS Funding Collaborative A" in the page details
    Then I softly see value "Child Contact" for title "Full Name" inside table "{prdoh_tableId:RelatedContacts}"
    When I click "https://www.aidsfundingcollaborative.org" lookup link
    Then I see new tab is opened