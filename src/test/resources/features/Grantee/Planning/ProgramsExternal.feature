@Grantee-Planning @ProgramsExternalPlanning @grantee-regression @grantee-parallel-regression
Feature: Programs External related scenarios
  Test all scenarios related to Programs External

  @61817 @ProgramsExternal @verifyProgramsExternalColumnSortFederal @positive
  Scenario Outline: Verify User can sort all columns of Federal Programs
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    When I click on "<ColumnName>" column header inside table with id "{grantee_tableId:ExternalFederalPrograms}"
    Then I softly see content of expected column "<ColumnName>" is in "Descending" order of table id "{grantee_tableId:ExternalFederalPrograms}"
    When I click on "<ColumnName>" column header inside table with id "{grantee_tableId:ExternalFederalPrograms}"
    Then I softly see content of expected column "<ColumnName>" is in "Ascending" order of table id "{grantee_tableId:ExternalFederalPrograms}"
    Examples:
      | ColumnName     |
      | Federal Agency |
      | Title          |
      | CFDA           |

  @61817 @ProgramsExternal @verifyProgramsExternalTotalRecord @wip9001 @positive
  Scenario: Verify User can see total record of Federal Programs
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I select value inside table "{grantee_tableId:ExternalFederalPrograms}" is "100"
    And I pause execution for "5" seconds
    And I perform quick search for "Farm Service Agency" in "{grantee_tableId:ExternalFederalPrograms}" panel
    Then I see total records count in flex table "{grantee_tableId:ExternalFederalPrograms}"

  @61817 @ProgramsExternal @verifyProgramsExternalQuickSearchInValid
  Scenario Outline: Verify User can perform quick search with Invalid data for Federal Programs
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I perform quick search for "<value>" in "{grantee_tableId:ExternalFederalPrograms}" panel
    Then I do not see value "<value>" for title "<ColumnName>" inside table "{grantee_tableId:ExternalFederalPrograms}"
    Examples:
      | value                                   | ColumnName     |
      | InvalidUnited States Institute of Peace | Federal Agency |
      | Invalid Priority Grant Competition      | Title          |
      | Invalid FPG--1422                       | CFDA           |

  @61817 @ProgramsExternal @verifyProgramsExternalAdvancedSearchValid @positive
  Scenario Outline: Verify User can do advanced search with valid data for Federal Programs
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    When I click on advance filter "#advfFederalPrograms" of table id "{grantee_tableId:ExternalFederalPrograms}"
    When I enter advance filter values inside id "advfFederalPrograms"
      | <ColumnName> | contains | <value> |
    Then I see value "<value>" for title "<ColumnName>" inside table "{grantee_tableId:ExternalFederalPrograms}"
    Examples:
      | value                                      | ColumnName     |
      | Animal And Plant Health Inspection Service | Federal Agency |
      | Wildlife Services                          | Title          |
      | 10.028                                     | CFDA           |

  @61817 @ProgramsExternal @verifyProgramsExternalAdvancedSearchInValid
  Scenario Outline: Verify User can do advanced search with Invalid data for Federal Programs
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    When I click on advance filter "#advfFederalPrograms" of table id "{grantee_tableId:ExternalFederalPrograms}"
    When I enter advance filter values inside id "advfFederalPrograms"
      | <ColumnName> | contains | <value> |
    Then I do not see value "<value>" for title "<ColumnName>" inside table "{grantee_tableId:ExternalFederalPrograms}"
    Examples:
      | value                                   | ColumnName     |
      | InvalidUnited States Institute of Peace | Federal Agency |
      | Invalid Priority Grant Competition      | Title          |
      | Invalid FPG--1422                       | CFDA           |

  @61817 @ProgramsExternal @verifyProgramsExternalFederalView @smoke  @positive
  Scenario: Verify User can navigate to view page by clicking on view button for perticular record
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I perform quick search for "Wildlife Services" in "{grantee_tableId:ExternalFederalPrograms}" panel
    And I click on "View" icon for "Wildlife Services" inside table
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Wildlife Services" in the page details

  @61855 @ProgramsExternal @verifyProgramsExternalFederalAgencyHyperLink @smoke @positive
  Scenario: Verify User can navigate web page by clicking on hyperlink of federal agency
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I perform quick search for "Wildlife Services" in "{grantee_tableId:ExternalFederalPrograms}" panel
    And I click on "View" icon for "Wildlife Services" inside table
    And I click "Animal And Plant Health Inspection Service" lookup link
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Animal And Plant Health Inspection Service" in the page details

  @61997 @CreatingNon-FederalProgram @ValidateOrganizationInsideLookupFieldForNonFederalProgram @positive
  Scenario: validate organization is getting selected inside lookup modal for non federal program
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalPrograms}"
    And I enter value "AT-01" into field "fieldFederalProgramCFDA__c"
    And I enter value "Automation Runtime NF Program" into field "fieldProgramName__c"
    And I enter value "Automation Internal Org" into field "fieldIntermediateAccount__c"
    Then I see value "Automation Internal Org" inside lookup field "fieldIntermediateAccount__c"
    And I click modal button "Save and Continue"

  @61997 @CreatingNon-FederalProgram @ValidateInternalUserIsAbleToCreateNonFederalProgram @positive
  Scenario Outline: validate pm/po user is able to create new non-federal program
    Given I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalPrograms}"
    And I enter value "AT-01" into field "fieldFederalProgramCFDA__c"
    And I enter value "Automation Runtime NF Program" into field "fieldProgramName__c"
    And I enter value "Automation Internal Org" into field "fieldIntermediateAccount__c"
    And I click modal button "Save and Continue"
    And I enter value "Automation Objectives" into field "fieldObjectives__c"
    And I enter value "Automation Eligibility" into field "fieldApplicantEligibility__c"
    And I click on "Save" in the page details
    Then I see the header is "Non-Federal Program" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime NF Program}" in the page details
    Examples:
      | userType |
      | PM       |
      | PO       |

  @62108 @ProgramsExternal @EditNonFederalProgram   @positive
  Scenario Outline: validate PM user can edit non-federal program
    Given I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalPrograms}"
    And I enter value "AT-01" into field "fieldFederalProgramCFDA__c"
    And I enter value "Automation Runtime NF Program" into field "fieldProgramName__c"
    And I enter value "Automation Internal Org" into field "fieldIntermediateAccount__c"
    And I click modal button "Save and Continue"
    And I enter value "Automation Objectives" into field "fieldObjectives__c"
    And I enter value "Automation Eligibility" into field "fieldApplicantEligibility__c"
    And I click on "Save" in the page details
    Then I click on "Edit" in the page details
    And I enter value "NF-11" into field "fieldFederalProgramCFDA__c"
    Then I click on "Save" in the page details
    Then I see field "Program Number" as "NF-11"
    Examples:
      | userType |
      | PM       |
      | PO       |

  @62097 @ProgramsExternal @ViewNon-FederalPrograms  @positive
  Scenario: validate any user can can view non-federal programs and navigates to the external website in a new tab while clicking on Funding Organization field
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalPrograms}"
    And I enter value "AT-01" into field "fieldFederalProgramCFDA__c"
    And I enter value "Automation Runtime NF Program" into field "fieldProgramName__c"
    And I enter value "Automation Internal Org" into field "fieldIntermediateAccount__c"
    And I click modal button "Save and Continue"
    And I enter value "Automation Objectives" into field "fieldObjectives__c"
    And I enter value "Automation Eligibility" into field "fieldApplicantEligibility__c"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime NF Program}" in "{grantee_tableId:NonFederalPrograms}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime NF Program}" inside flex table with id "{grantee_tableId:NonFederalPrograms}"
    And I click "Automation Internal Org" lookup link
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "Automation Internal Org" in the page details

  @62097 @ProgramsExternal @verifyAllFieldsToBeInRead-OnlyModeInProgramsExternal @smoke  @positive
  Scenario: Verify User can not edit in read-only mode in programs external
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalPrograms}"
    And I enter value "AT-01" into field "fieldFederalProgramCFDA__c"
    And I enter value "Automation Runtime NF Program" into field "fieldProgramName__c"
    And I enter value "Automation Internal Org" into field "fieldIntermediateAccount__c"
    And I click modal button "Save and Continue"
    And I enter value "Automation Objectives" into field "fieldObjectives__c"
    And I enter value "Automation Eligibility" into field "fieldApplicantEligibility__c"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter value "NF-11" into field "fieldFederalProgramCFDA__c"
    Then I click on "Save" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime NF Program}" in "{grantee_tableId:NonFederalPrograms}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime NF Program}" inside flex table with id "{grantee_tableId:NonFederalPrograms}"
    Then I softly see field "Program Number" as "NF-11"

  @62006 @ProgramsExternal @EnterNon-FederalProgramFields   @positive
  Scenario Outline: validate PM user can enter all the fields
    Given I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalPrograms}"
    And I enter value "AT-01" into field "fieldFederalProgramCFDA__c"
    And I enter value "Automation Runtime NF Program" into field "fieldProgramName__c"
    And I enter value "Automation Internal Org" into field "fieldIntermediateAccount__c"
    And I click modal button "Save and Continue"
    And I enter value "Automation Objectives" into field "fieldObjectives__c"
    And I enter value "Automation Eligibility" into field "fieldApplicantEligibility__c"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter value "NF-11" into field "fieldFederalProgramCFDA__c"
    Then I click on "Save" in the page details
    Then I softly see field "Program Number" as "NF-11"
    Examples:
      | userType |
      | PM       |
      | PO       |