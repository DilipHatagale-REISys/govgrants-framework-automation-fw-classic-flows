@Planning @ProjectsPlanning @grantee-regression @grantee-parallel-regression
Feature: Projects related scenarios
  Test all scenarios related to Projects feature

  @62150 @Projects @verifyProjectAllActive   @positive
  Scenario: Verify User can see active project in Project All
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click toggle button to select "Projects - All"
    And I perform quick search for "Active" in "{prdoh_tableId:Projects}" panel
    Then I see value "Active" for title "Status" inside table "{prdoh_tableId:Projects}"

  @62150 @Projects @verifyProjectAllInactive   @positive
  Scenario: Verify User can see Inactive project in Project All
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click toggle button to select "Projects - All"
    And I perform quick search for "Inactive" in "{prdoh_tableId:Projects}" panel
    Then I see value "Inactive" for title "Status" inside table "{prdoh_tableId:Projects}"

  @62150 @Projects @verifyProjectAllDraft  @positive
  Scenario: Verify User can see draft project in Project All
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click toggle button to select "Projects - All"
    And I perform quick search for "Draft" in "{prdoh_tableId:Projects}" panel
    Then I see value "Draft" for title "Status" inside table "{prdoh_tableId:Projects}"

  @62150 @Projects @verifyProjectToggleOptions @smoke   @positive
  Scenario Outline: Verify User can use toggle with different options
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "<options>"
    And I pause execution for "2" seconds
    Then I see value "<status>" for title "Status" inside table "{prdoh_tableId:Projects}"
    Examples:
      | options             | status   |
      | Projects - Draft    | Draft    |
      | Projects - Active   | Active   |
      | Projects - Inactive | Inactive |

  @62150 @Projects @verifyProjectRecordCountAll   @positive
  Scenario Outline: Verify User can correct total count of record as per All statuse
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click toggle button to select "<options>"
    And I pause execution for "2" seconds
    And I select value inside table "{prdoh_tableId:Projects}" is "All"
    Then I see total records count in flex table "{prdoh_tableId:Projects}"
    Examples:
      | options           |
      | Projects - All    |
      | Projects - Active |
      | Projects - Draft  |

  @62150 @Projects @verifyProjectPagination   @positive
  Scenario: Verify pagination for projects
    Given I login as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on page navigation arrow "{prdoh_tableId:Projects}" for table id "Next"
    Then I see table "{prdoh_tableId:Projects}" shows "Page 2"

  @62150 @Projects @verifyProjectQuickSearchValid @smoke   @positive
  Scenario Outline: Verify User can perform quick search with valid data
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    And I save the field labeled "Project Name" as "PROJECTNAME"
    And I save the field labeled "Internal Organization" as "INTERNALORGANIZATION"
    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "<value>" in "{prdoh_tableId:Projects}" panel
    Then I see value "<value>" for title "<ColumnName>" inside table "{prdoh_tableId:Projects}"
    Examples:
      | value                                      | ColumnName            |
      | {SavedValue:INTERNALORGANIZATION}          | Internal Organization |
      | {SavedValue:Automation Runtime Focus Area} | Project Name          |
      | Active                                     | Status                |
      | {SavedValue:EID}                           | EGMS ID               |

  @62150 @Projects @verifyProjectQuickSearchInValid
  Scenario Outline: Verify User can perform quick search with invalid data
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    And I save the field labeled "Project Name" as "PROJECTNAME"
    And I save the field labeled "Internal Organization" as "INTERNALORGANIZATION"
    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "<value>" in "{prdoh_tableId:Projects}" panel
    Then I do not see value "<value>" for title "<ColumnName>" inside table "{prdoh_tableId:Projects}"
    Examples:
      | value                                             | ColumnName            |
      | Invalid{SavedValue:INTERNALORGANIZATION}          | Internal Organization |
      | Invalid{SavedValue:Automation Runtime Focus Area} | Project Name          |
      | Invalid Active                                    | Status                |
      | Invalid{SavedValue:EID}                           | EGMS ID               |

  @62150 @Projects @verifyProjectAdvancedSearchValid   @positive
  Scenario Outline: Verify User can perform advance search with valid data
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    And I save the field labeled "Project Name" as "PROJECTNAME"
    And I save the field labeled "Internal Organization" as "INTERNALORGANIZATION"
    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    When I click on advance filter "#advfGranteeServiceAreas" of table id "{prdoh_tableId:Projects}"
    When I enter advance filter values inside id "advfGranteeServiceAreas"
      | <ColumnName> | <operator> | <value> |
    Then I see value "<value>" for title "<ColumnName>" inside table "{prdoh_tableId:Projects}"
    Examples:
      | ColumnName   | value                                      | operator |
      | EGMS ID      | {SavedValue:EID}                           | contains |
      | Project Name | {SavedValue:Automation Runtime Focus Area} | contains |

  @62150 @Projects @verifyProjectAdvancedSearchInValid
  Scenario Outline: Verify User can perform advance search with Invalid data
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    And I save the field labeled "Project Name" as "PROJECTNAME"
    And I save the field labeled "Internal Organization" as "INTERNALORGANIZATION"
    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    When I click on advance filter "#advfGranteeServiceAreas" of table id "{prdoh_tableId:Projects}"
    When I enter advance filter values inside id "advfGranteeServiceAreas"
      | <ColumnName> | <operator> | <value> |
    Then I do not see value "<value>" for title "<ColumnName>" inside table "{prdoh_tableId:Projects}"
    Examples:
      | ColumnName   | value                                      | operator |
      | EGMS ID      | Invalid{SavedValue:EID}                    | contains |
      | Project Name | {SavedValue:Automation Runtime Focus Area} | contains |

  @62150 @Projects @verifyProjectRefreshViewPage   @positive
  Scenario: Verify User can refresh view page
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#GranteeServiceAreasFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Projects - All"
    Then I see table is refreshing

  @62182 @Projects @verifyProjectsUserNoSeeNewButton
  Scenario Outline: Verify User cannot see NEW button on view page
    Given I login as "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    Then I cannot see top right button "New" in flex table with id "{prdoh_tableId:OpportunityConvertedToApplication}"
    Examples:
      | user  |
      | PO    |
      | FO    |
      | EXE   |
      | ADMIN |

  @62182 @Projects @verifyProjectsUserSeeNewButton @smoke   @positive
  Scenario: Verify User can see NEW button on view page
    Given I login as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "2" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    Then I can see top right button "New" in flex table with id "{prdoh_tableId:OpportunityConvertedToApplication}"

  @62182 @Projects @verifyProjectsUserClickNewButton  @positive
  Scenario: Verify User can navigate to modal by clicking on New button
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I pause execution for "2" seconds
    Then I see "Project Details" page block displayed

  @62182 @Projects @verifyProjectsCancelModal
  Scenario: Verify User can navigate view page of projects
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I click on "Save and Continue" in the page details
    Then I softly see the following messages in the page details :
      | Project Name is Required to save. |

  @62182 @Projects @verifyProjectsEnterInfoForProject  @positive
  Scenario: Verify User can enter information in required field
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    Then I see value "{SavedValue:Automation Runtime Focus Area}" for title "Project Name" inside table "{prdoh_tableId:Projects}"

  @62182 @Projects @verifyProjectsAccept255InTitle   @positive
  Scenario Outline: Verify User can enter only 255 character in title field
    When I delete the record "<requiredValue>" from the object "FOCUS AREA"
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "<enterValue>" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "<requiredValue>" in "{prdoh_tableId:Projects}" panel
    Then I see value "<requiredValue>" for title "Project Name" inside table "{prdoh_tableId:Projects}"
    Examples:
      | enterValue                                                                                                                                                                                                                                                           | requiredValue                                                                                                                                                                                                                                                   |
      | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255title | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255 |

  @62258 @Projects @verifyProjectsViewPage   @positive
  Scenario: Verify user can click and navigate to view page by clicking view
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I see the header is "Project" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Focus Area}" in the page details

  @62258 @Projects @verifyProjectsOverviewTab @smoke   @positive
  Scenario: Verify user can see project details on Overview Tab
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I softly see field "Project Name" as "{SavedValue:Automation Runtime Focus Area}"
    Then I softly see field "Description" as "Automation Description"
    Then I softly see field "Internal Organization" as "Direccion General"

  @62258 @Projects @verifyProjectsOverviewSystemInformation @positive
  Scenario: Verify user can see System Information on Overview Tab
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I softly see field "Created by" as "Automation PM"
    Then I softly see field "Last Modified by" as "Automation PM"

  @62258 @Projects @verifyProjectsOverviewSystemInformationCDate   @positive
  Scenario: Verify user can see Created date
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "{SavedValue:CreatedDate}" contains todays date withTime

  @62258 @Projects @verifyProjectsOverviewSystemInformationMDate   @positive
  Scenario: Verify user can see Modified date
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

  @62258 @Projects @verifyProjectsInternalOrgLink @smoke   @positive
  Scenario: Verify user can navigate to other page by clicking on Internal Org Link
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click "Direccion General" lookup link
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Direccion General" in the page details

  @62258 @Projects @verifyProjectsCreatedByLink @smoke   @positive
  Scenario: Verify user can navigate to user page By created by link
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click "Automation PM" lookup link
    Then I see field "First Name" as "Automation"

  @62258 @Projects @verifyProjectsHistorySubTab @smoke  @positive
  Scenario: Verify user can navigate to history sub tab
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I navigate to "History" sub tab
    Then I softly see the text containing :
      | Field History    |
      | Snapshot History |

  @62183 @Projects @verifyProjectsNewStatusDraft  @positive
  Scenario: Verify User can see status as Drafts
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    Then I see value "Draft" for title "Status" inside table "{prdoh_tableId:Projects}"

  @62183 @Projects @verifyProjectsDescriptionValidate
  Scenario Outline: Verify Description field validation
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I clear the value from field "fieldDescription__c"
    And I enter value "<entervalue>" into field "fieldDescription__c"
    And I pause execution for "5" seconds
    And I click on "Save and Continue" in the page details
    Then I see the following messages in the page details :
      | Description:Data value too large. (max length=32768) |
    Examples:
      | entervalue                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | AutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAutomationDescriptionAut32768Automation |

  @62258 @Projects @verifyProjectsHistoryHelpText  @positive
  Scenario Outline: Verify user can see help text for history tab
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I navigate to "History" sub tab
    When I hovering mouse on help text icon inside "History" for table
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                              |
      | Quick Search is not supported for following columns : New Value,Old Value |

  @62258 @Projects @verifyProjectsHistorySearch   @positive
  Scenario: Verify user can search in history table
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Project Name" as "AutomationRuntimeFocusArea"
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I enter value "Automation Runtime Focus Area edit" into field "fieldTitle__c"
    And I click on "Save and Continue" in the page details
    And I save the field containing "Project Name" as "AutomationRuntimeFocusAreaEdit"
    And I save the field containing "EGMS ID" as "egmsid"
    And I navigate to "History" sub tab
    Then I softly see value "{SavedValue:egmsid}" for title "EGMS ID" inside table "History"
    Then I softly see value "Title" for title "Changed Field" inside table "History"
    Then I softly see value "Automation PM" for title "Changed By" inside table "History"
    Then I softly see value "{SavedValue:AutomationRuntimeFocusArea}" for title "Old Value" inside table "History"
    Then I softly see value "{SavedValue:AutomationRuntimeFocusAreaEdit}" for title "New Value" inside table "History"

  @62258 @Projects @verifyProjectsHistorySearchInvalid
  Scenario: Verify user can see message for invalid search in history table
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I navigate to "History" sub tab
    And I perform quick search for "Invalid" in "History" panel
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:ProjectsFieldHistory---"

  @62228 @Projects @verifyProjectsUserLogin @smoke   @positive
  Scenario Outline: Verify different user can navigate to view page
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I re-login with "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I see the header is "Project" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Focus Area}" in the page details
    Examples:
      | user |
      | FO   |
      | FD   |
      | PO   |
      | EXE  |

  @62262 @Projects @verifyProjectsRowLevelEditButton @smoke   @positive
  Scenario: Verify Owner can see row level edit button
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    Then I can see row level action button "Edit" against "Draft" in flex table with id "{prdoh_tableId:Projects}"

  @62262 @Projects @verifyProjectsRowLevelEditButton02
  Scenario Outline: Verify other than Owner can not see row level edit button
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I re-login with "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    Then I cannot see row level action button "Edit" against "Draft" in flex table with id "{prdoh_tableId:Projects}"
    Examples:
      | user |
      | FO   |
      | FD   |
      | PO   |
      | EXE  |

  @62262 @Projects @verifyProjectsActivatedNotEdit
  Scenario: Verify user cannot see edit button for activated project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Focus Area}" in flex table with id "{prdoh_tableId:Projects}"

  @62262 @Projects @verifyProjectsInActivatedNotEdit
  Scenario: Verify user cannot see edit button for InActivated project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I pause execution for "3" seconds
    And I click on "Deactivate" in the page details
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Focus Area}" in flex table with id "{prdoh_tableId:Projects}"

  @62262 @Projects @verifyProjectsDraftedEditAndSave  @positive
  Scenario: Verify user can edit and save drafted project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I clear the value from field "fieldDescription__c"
    And I enter value "Automation Description Edited" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    Then I see field "Description" as "Automation Description Edited"

  @62399 @Projects @verifyProjectsRowLevelDeleteButton  @positive
  Scenario: Verify Owner can see row level Delete button
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    Then I can see row level action button "Delete" against "{SavedValue:Automation Runtime Focus Area}" in flex table with id "{prdoh_tableId:Projects}"

  @62399 @Projects @verifyProjectsRowLevelDeleteButton02
  Scenario Outline: Verify other Owner cannot see row level Delete button
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I re-login with "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime Focus Area}" in flex table with id "{prdoh_tableId:Projects}"
    Examples:
      | user |
      | FO   |
      | FD   |
      | PO   |
      | EXE  |

  @62399 @Projects @verifyProjectsActivatedNotDelete
  Scenario: Verify user cannot see Delete button for activated project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime Focus Area}" in flex table with id "{prdoh_tableId:Projects}"

  @62399 @Projects @verifyProjectsInActivatedNotDelete
  Scenario: Verify user cannot see Delete button for InActivated project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I pause execution for "3" seconds
    And I click on "Deactivate" in the page details
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime Focus Area}" in flex table with id "{prdoh_tableId:Projects}"

  @62399 @Projects @verifyProjectsDelete @smoke  @positive
  Scenario: Verify user can Delete project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "Delete" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I see the following messages in the page details :
      | Record deleted successfully. |

  @62412 @Projects @verifyProjectsActivateButtonSee @smoke  @positive
  Scenario: Verify user can see activate button
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I can see top right button "Activate" in page detail

  @62412 @Projects @verifyProjectsActivatedButtonNotSee
  Scenario: Verify user can not see activate button on activated project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I cannot see top right button "Activate" in page detail

  @62412 @Projects @verifyProjectsActivatedButtonSeeInacivated  @positive
  Scenario: Verify user can see Activate button for InActivated project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I pause execution for "3" seconds
    And I click on "Deactivate" in the page details
    Then I can see top right button "Activate" in page detail

  @62412 @Projects @verifyProjectsActivatedProjectStatus  @positive
  Scenario: Verify user can see status as Active after activate project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    Then I see field "Status" as "Active"

  @62412 @Projects @verifyProjectsActivatedProjectApplication  @positive
  Scenario: Verify user can see activate projects to associate in Application
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I pause execution for "3" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "{sidebar:NotyetQualifiedLead}" content inside "{sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "5" seconds
    And I click on top right button "New" in flex table with id "{prdoh_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I click on "Save and Continue" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{sidebar:NotyetQualifiedLead}" content inside "{sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "10" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{sidebar:NotConvertedOpportunityLinkName}" content inside "{sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation Exe | prdoh       |
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I re-login with "EXE" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "DC - {SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Created Date" column header inside table with id "{prdoh_tableId:PendingTask}"
    When I click on "Created Date" column header inside table with id "{prdoh_tableId:PendingTask}"
    And I click on "Start" icon for "DC - {SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login with "PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "{sidebar:NotConvertedOpportunityLinkName}" content inside "{sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I enter value "Automation PM" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{sidebar:ApplicationLinkName}" content inside "{sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:Application}"
    And I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{prdoh_tableId:BudgetPeriodDetailsFromSetup}"
    And I click "Next" after selection of "BP01" in the table "{prdoh_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:AssociateProjectsModal}" panel
    Then I see value "{SavedValue:Automation Runtime Focus Area}" for title "Project Title" inside table "{prdoh_tableId:AssociateProjectsModal}"

  @62412 @Projects @verifyProjectsDeactivatedProjectApplication
  Scenario: Verify user can not see Deactivate projects to associate in Application
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I pause execution for "2" seconds
    And I click on "Deactivate" in the page details
    And I pause execution for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "{sidebar:NotyetQualifiedLead}" content inside "{sidebar:LeadsSubheaderName}" subheader on left panel
    And I pause execution for "5" seconds
    And I click on top right button "New" in flex table with id "{prdoh_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I click on "Save and Continue" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{sidebar:NotyetQualifiedLead}" content inside "{sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "10" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{sidebar:NotConvertedOpportunityLinkName}" content inside "{sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation Exe | prdoh       |
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I re-login with "EXE" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "DC - {SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Created Date" column header inside table with id "{prdoh_tableId:PendingTask}"
    When I click on "Created Date" column header inside table with id "{prdoh_tableId:PendingTask}"
    And I click on "Start" icon for "DC - {SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login with "PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "{sidebar:NotConvertedOpportunityLinkName}" content inside "{sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I enter value "Automation PM" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{sidebar:ApplicationLinkName}" content inside "{sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:Application}"
    And I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{prdoh_tableId:BudgetPeriodDetailsFromSetup}"
    And I click "Next" after selection of "BP01" in the table "{prdoh_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:AssociateProjectsModal}" panel
    Then I do not see value "{SavedValue:Automation Runtime Focus Area}" for title "Project Title" inside table "{prdoh_tableId:AssociateProjectsModal}"

  @62412 @Projects @verifyProjectsDraftProjectApplication
  Scenario: Verify user can not see draft projects to associate in Application
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    When I navigate to "Opportunities" tab
    When I navigate to "{sidebar:NotyetQualifiedLead}" content inside "{sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "10" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{sidebar:NotConvertedOpportunityLinkName}" content inside "{sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{prdoh_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation Exe | prdoh       |
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I re-login with "EXE" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "DC - {SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:PendingTask}" panel
    When I click on "Created Date" column header inside table with id "{prdoh_tableId:PendingTask}"
    When I click on "Created Date" column header inside table with id "{prdoh_tableId:PendingTask}"
    And I click on "Start" icon for "DC - {SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login with "PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "{sidebar:NotConvertedOpportunityLinkName}" content inside "{sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I enter value "Automation PM" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{sidebar:ApplicationLinkName}" content inside "{sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{prdoh_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{prdoh_tableId:Application}"
    And I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{prdoh_tableId:BudgetPeriodDetailsFromSetup}"
    And I click "Next" after selection of "BP01" in the table "{prdoh_tableId:AssociateProjectsModal}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:AssociateProjectsModal}" panel
    Then I do not see value "{SavedValue:Automation Runtime Focus Area}" for title "Project Title" inside table "{prdoh_tableId:AssociateProjectsModal}"

  @62585 @Projects @verifyProjectsDeactiveButtonValidUser @smoke   @positive
  Scenario Outline: Verify user <user> can see Deactivate button for Activated project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I pause execution for "3" seconds
    And I re-login with "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I can see top right button "Deactivate" in page detail
    Examples:
      | user  |
      | PM    |
      | ADMIN |
      | EXE   |

  @62585 @Projects @verifyProjectsDraftDeactiveButton @smoke
  Scenario: Verify user cannot see Deactivate button for Draft project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I cannot see top right button "Deactivate" in page detail

  @62585 @Projects @verifyProjectsInactiveDeactiveButton
  Scenario: Verify user cannot see Deactivate button for Inactivated project
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I pause execution for "2" seconds
    And I click on "Deactivate" in the page details
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I cannot see top right button "Deactivate" in page detail

  @62585 @Projects @verifyProjectsDeactiveProject  @positive
  Scenario: Verify user can see status of project as Inactive after Deactivate
    Given I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:ProjectsLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{prdoh_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I pause execution for "2" seconds
    And I click on "Deactivate" in the page details
    Then I see field "Status" as "Inactive"