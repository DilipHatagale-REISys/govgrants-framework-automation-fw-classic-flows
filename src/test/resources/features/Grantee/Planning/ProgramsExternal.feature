@Planning @ProgramsExternalPlanning @grantee-regression @grantee-parallel-regression
Feature: Programs External related scenarios
  Test all scenarios related to Programs External

  @61817 @ProgramsExternal @verifyProgramsExternalColumnSortFederal @positive
  Scenario Outline: Verify User can sort all columns of Federal Programs
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    When I click on "<ColumnName>" column header inside table with id "{prdoh_tableId:ExternalFederalPrograms}"
    Then I softly see content of expected column "<ColumnName>" is in "Descending" order of table id "{prdoh_tableId:ExternalFederalPrograms}"
    When I click on "<ColumnName>" column header inside table with id "{prdoh_tableId:ExternalFederalPrograms}"
    Then I softly see content of expected column "<ColumnName>" is in "Ascending" order of table id "{prdoh_tableId:ExternalFederalPrograms}"
    Examples:
      | ColumnName          |
      | Federal Agency      |
      | Program Name        |
      | Agency Abbreviation |
      | EGMS ID             |
      | CFDA                |
      | Last Updated Date   |

  @61817 @ProgramsExternal @verifyProgramsExternalTotalRecord @wip9001 @positive
  Scenario: Verify User can see total record of Federal Programs
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I select value inside table "{prdoh_tableId:ExternalFederalPrograms}" is "100"
    And I pause execution for "5" seconds
    And I perform quick search for "DOI-USGS1" in "{prdoh_tableId:ExternalFederalPrograms}" panel
    Then I see total records count in flex table "{prdoh_tableId:ExternalFederalPrograms}"

  @61817 @ProgramsExternal @verifyProgramsExternalQuickSearchInValid
  Scenario Outline: Verify User can perform quick search with Invalid data for Federal Programs
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I perform quick search for "<value>" in "{prdoh_tableId:ExternalFederalPrograms}" panel
    Then I do not see value "<value>" for title "<ColumnName>" inside table "{prdoh_tableId:ExternalFederalPrograms}"
    Examples:
      | value                                   | ColumnName          |
      | USPIInvalid                             | Agency Abbreviation |
      | InvalidUnited States Institute of Peace | Federal Agency      |
      | Invalid Priority Grant Competition      | Program Name        |
      | Invalid FPG--1422                       | EGMS ID             |

  @61817 @ProgramsExternal @verifyProgramsExternalAdvancedSearchValid @positive
  Scenario Outline: Verify User can do advanced search with valid data for Federal Programs
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    When I click on advance filter "#advfFederalPrograms" of table id "{prdoh_tableId:ExternalFederalPrograms}"
    When I enter advance filter values inside id "advfFederalPrograms"
      | <ColumnName> | contains | <value> |
    Then I see value "<value>" for title "<ColumnName>" inside table "{prdoh_tableId:ExternalFederalPrograms}"
    Examples:
      | value                            | ColumnName          |
      | USIP                             | Agency Abbreviation |
      | United States Institute of Peace | Federal Agency      |
      | Priority Grant Competition       | Program Name        |
      | FPG--1422                        | EGMS ID             |

  @61817 @ProgramsExternal @verifyProgramsExternalAdvancedSearchInValid
  Scenario Outline: Verify User can do advanced search with Invalid data for Federal Programs
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    When I click on advance filter "#advfFederalPrograms" of table id "{prdoh_tableId:ExternalFederalPrograms}"
    When I enter advance filter values inside id "advfFederalPrograms"
      | <ColumnName> | contains | <value> |
    Then I do not see value "<value>" for title "<ColumnName>" inside table "{prdoh_tableId:ExternalFederalPrograms}"
    Examples:
      | value                                   | ColumnName          |
      | USIPInvalid                             | Agency Abbreviation |
      | InvalidUnited States Institute of Peace | Federal Agency      |
      | Invalid Priority Grant Competition      | Program Name        |
      | Invalid FPG--1422                       | EGMS ID             |

  @61817 @ProgramsExternal @verifyProgramsExternalFederalView @smoke  @positive
  Scenario: Verify User can navigate to view page by clicking on view button for perticular record
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I perform quick search for "FPG--1029" in "{prdoh_tableId:ExternalFederalPrograms}" panel
    And I click on "View" icon for "FPG--1029" inside table
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Agricultural Research Basic and Applied Research" in the page details

  @61855 @ProgramsExternal @verifyProgramsExternalFederalAgencyHyperLink @smoke @positive
  Scenario: Verify User can navigate web page by clicking on hyperlink of federal agency
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I perform quick search for "FPG--1029" in "{prdoh_tableId:ExternalFederalPrograms}" panel
    And I click on "View" icon for "FPG--1029" inside table
    And I click "Agricultural Research Service" lookup link
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Agricultural Research Service" in the page details

  @61855 @ProgramsInternal @verifyAllFieldsToBeInRead-OnlyModeInInternalPrograms @smoke @positive
  Scenario: Verify User can not edit in read-only mode
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:InternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    When I perform quick search for "Automation Internal Program" in "{prdoh_tableId:InternalProgramsListPage}" panel
    When I click on "View" icon for "Automation Internal Program" inside flex table with id "{prdoh_tableId:InternalProgramsListPage}"
    Then I see the header is "Internal Program" in the page details
    Then I see the sub-header is "Automation Internal Program" in the page details
    Then I softly see field "Name" as "Automation Internal Program"

  @61997 @CreatingNon-FederalProgram @ValidateOrganizationInsideLookupFieldForNonFederalProgram @positive
  Scenario: validate organization is getting selected inside lookup modal for non federal program
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:NonFederalPrograms}"
    When I enter "ProgramsExternalNFProgram" values from "Field_Values.xlsx"
    Then I click on "Save" in the page details
    Then I see value "Automation Non Federal Organization" inside lookup field "fieldAccount__c"

  @61997 @CreatingNon-FederalProgram @ValidateInternalUserIsAbleToCreateNonFederalProgram @positive
  Scenario: validate pm user is able to create new non-federal program
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click on top right button "New" in flex table with id "{prdoh_tableId:NonFederalPrograms}"
    When I enter "ProgramsExternalNFProgram" values from "Field_Values.xlsx"
    Then I click on "Save" in the page details
    Then I see the header is "Non-Federal Program" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime NF Program}" in the page details

  @62124 @InternalProgram @ViewInternalPrograms @smoke  @positive
  Scenario Outline: validate all profiles can view all internal programs
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:InternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalProgramsListPage}"
    When I enter "ProgramsInternalProgram" values from "Field_Values.xlsx"
    And I click on "Save" in the page details
    When I re-login as "<user type>" user on "default" portal
    And I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "{prdoh_tableId:InternalProgramsListPage}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "{prdoh_tableId:InternalProgramsListPage}"
    Then I see the header is "Internal Program" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Internal Program}" in the page details
    Examples:
      | user type |
      | Admin     |
      | PM        |
      | PO        |
      | FD        |
      | EXE       |
      | FO        |
      | PM1       |

  @62124 @InternalProgram @ViewInternalProgramsTableColumns @smoke  @positive
  Scenario Outline: validate Internal profile user can see all table columns for internal program table
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:InternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    Then I see "<fieldDisplayNames>" in flex table header "{prdoh_tableId:InternalProgramsListPage}"
    Examples:
      | fieldDisplayNames      |
      | EGMS ID                |
      | Program Name           |
      | Internal Organization  |
      | Primary Funding Source |
      | Program Subtype        |

  @62108 @ProgramsExternal @EditNonFederalProgram   @positive
  Scenario: validate PM user can edit non-federal program
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:NonFederalPrograms}"
    When I enter "ProgramsExternalNFProgram" values from "Field_Values.xlsx"
    Then I click on "Save" in the page details
    Then I click on "Edit" in the page details
    And I enter value "3" into field "FederalProgramCFDA__c"
    Then I click on "Save" in the page details
    Then I see field "Program Number" as "3"

  @62097 @ProgramsExternal @ViewNon-FederalPrograms  @positive
  Scenario: validate any user can can view non-federal programs and navigates to the external website in a new tab while clicking on Funding Organization field
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:NonFederalPrograms}"
    When I enter "ProgramsExternalNFProgram" values from "Field_Values.xlsx"
    Then I click on "Save" in the page details
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime NF Program}" in "{prdoh_tableId:NonFederalPrograms}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime NF Program}" inside flex table with id "{prdoh_tableId:NonFederalPrograms}"
    And I click "Automation Non Federal Organization" lookup link
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "Automation Non Federal Organization" in the page details

  @62097 @ProgramsExternal @verifyAllFieldsToBeInRead-OnlyModeInProgramsExternal @smoke  @positive
  Scenario: Verify User can not edit in read-only mode in programs external
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:NonFederalPrograms}"
    When I enter "ProgramsExternalNFProgram" values from "Field_Values.xlsx"
    Then I click on "Save" in the page details
    When I click on "Edit" in the page details
    And  I enter "EditNonFederalProgram" values from "Field_Values.xlsx"
    And I enter value "NF-11" into field "fieldFederalProgramCFDA__c"
    Then I click on "Save" in the page details
    And I re-login as "ADMIN" user on "default" portal
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime NF Program}" in "{prdoh_tableId:NonFederalPrograms}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime NF Program}" inside flex table with id "{prdoh_tableId:NonFederalPrograms}"
    Then I softly see field "Program Number" as "NF-11"

  @62114 @ProgramsInternal @ValidateOrganizationInsideLookupFieldsAtInternalProgram  @positive
  Scenario: validate PM user can create internal program
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:InternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalProgramsListPage}"
    When I enter "ProgramsInternalProgram" values from "Field_Values.xlsx"
    Then I see value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside lookup field "fieldIntermediateAccount__c"

  @62114 @ProgramsInternal @CreateInternalProgram @smoke  @positive
  Scenario Outline: validate PM  and PO users can create internal program
    Given I login as "<usertype>" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:InternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalProgramsListPage}"
    When I enter "ProgramsInternalProgram" values from "Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Internal Program" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Internal Program}" in the page details
    Examples:
      | usertype |
      | PO       |
      | PM       |

  @62006 @ProgramsExternal @EnterNon-FederalProgramFields   @positive
  Scenario Outline: validate PM user can enter all the fields
    Given I login as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ExternalPrograms}" content inside "{sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:NonFederalPrograms}"
    When I enter "ProgramsExternalNFProgram" values from "Field_Values.xlsx"
    Then I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter value "NF-11" into field "fieldFederalProgramCFDA__c"
    Then I click on "Save" in the page details
    Then I softly see field "Program Number" as "NF-11"
    Examples:
      | userType |
      | PM       |
      | PO       |