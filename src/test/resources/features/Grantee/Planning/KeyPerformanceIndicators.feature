@Grantee-Planning @Grantee-KPI @KPI @KeyPerformanceIndicators @grantee-regression @grantee-parallel-regression
Feature: Key Performance Indicators related scenarios
  Test all scenarios related to Key Performance Indicators

  @62116 @KPI @validateKPIQuickSearch @smoke  @positive
  Scenario Outline: Verify User can do quick search using <ColumnName>
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "<value>" in "{grantee_tableId:KPITable}" panel
    Then I softly see value "<value>" for title "<ColumnName>" inside table "{grantee_tableId:KPITable}"
    Examples:
      | ColumnName            | value                    |
      | EGMS ID               | KPI-0045                 |
      | Internal Organization | Department of Health     |
      | Title                 | Automation Permanent KPI |

  @62116 @KPI @validateKPIAdvanceSearch @positive
  Scenario Outline: Verify User can advance search using <ColumnName>
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    When I click on advance filter "#advfEnhanceMasterKPIs" of table id "{grantee_tableId:KPITable}"
    When I enter advance filter values inside id "advfEnhanceMasterKPIs"
      | <ColumnName> | <operator> | <value> |
    Then I softly see value "<value>" for title "<ColumnName>" inside table "{grantee_tableId:KPITable}"
    Examples:
      | ColumnName | value                    | operator |
      | EGMS ID    | KPI-0045                 | contains |
      | Title      | Automation Permanent KPI | contains |

  @62116 @KPI @validateKPSortAllColumns @positive
  Scenario Outline: Verify User can column sort of <ColumnName>
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    When I click on "<ColumnName>" column header inside table with id "{grantee_tableId:KPITable}"
    Then I softly see content of expected column "<ColumnName>" is in "Descending" order of table id "{grantee_tableId:KPITable}"
    When I click on "<ColumnName>" column header inside table with id "{grantee_tableId:KPITable}"
    Then I softly see content of expected column "<ColumnName>" is in "Ascending" order of table id "{grantee_tableId:KPITable}"
    Examples:
      | ColumnName            |
      | Internal Organization |
      | Title                 |
      | Status                |
      | Domain                |
      | EGMS ID               |

  @62116 @KPI @validateTotalNumberOfRecords @smoke  @positive
  Scenario: Verify Total number of records as per different status
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I select value inside table "{grantee_sidebar:SetUpSubheaderName}" is "10"
    And I pause execution for "3" seconds
    Then I see total records count is same as total row of table id "{grantee_sidebar:SetUpSubheaderName}" on click "Next"


  @62116 @KPI @validateKPIGridView @smoke
  Scenario: Verify user can view created KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I see the header is "Key Performance Indicator" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime KPI}" in the page details

  @62123 @KPI @validateKPIstatusBar @positive
  Scenario: Verify status bar on KPI view page.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I see status in Progress-bar is "Created" and is "green"

  @62123 @KPI @validateKPIinternalOrgHyperLink @smoke @positive
  Scenario: Verify internal organization is hyperlink on KPI view page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    When I click "Department of Health" lookup link
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Department of Health" in the page details

  @62123 @KPI @validateActivateKPI @smoke @positive
  Scenario: Verify user can activate KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @62123 @KPI @validateActivateKPInotEdit
  Scenario Outline: Verify user can not edit KPI which is activated.
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I cannot see top right button "Edit" in page detail
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @62123 @KPI @validateKPIAddAssociateForDraft @positive
  Scenario Outline: Verify user can add associate objective to KPI in draft status.
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:Objectives}"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "{grantee_tableId:StrategicPlans}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I softly see field "Status" as "Created"
    And I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:PlanningAssociateObjectiveTableId}"
    And I click "Associate" after selection of "Automation Objective" in the table "{grantee_tableId:PlanningObjectiveModalTableId}"
    And I close modal by clicking the top right x button
    Then I see value "Automation Objective" for title "Title" inside table "{grantee_tableId:PlanningAssociateObjectiveTableId}"
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE EXE   |

  @62123 @KPI @validateKPISystemInformationCreatedBy  @positive
  Scenario: Verify user can see correct system information(Created By) on KPI view page.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I pause execution for "3" seconds
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    Then I see field "Created by" as "{SavedValue:GRANTEE PM Username}"

  @62123 @KPI @validateKPISystemInformationCreatedDate  @positive
  Scenario: Verify user can see correct system information(Created Date) on KPI view page.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "{SavedValue:CreatedDate}" contains todays date withTime

  @62123 @KPI @validateKPISystemInformationModifiedBy @positive
  Scenario: Verify user can see correct system information(Modified By) on KPI view page.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I pause execution for "3" seconds
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I enter value "Automation KPI Description Edit" into field "fieldDescription__c"
    And I click on "Save" in the page details
    Then I see field "Last Modified by" as "{SavedValue:GRANTEE PM Username}"

  @62123 @KPI @validateKPISystemInformationModifiedDate   @positive
  Scenario: Verify user can see correct system information(Modified Date) on KPI view page.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I enter value "Automation KPI Description Edit" into field "fieldDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

  @62200 @KPI @validateUserCanSeeNewButton @smoke  @positive
  Scenario Outline: Verify user can see New button
    When I login to "As a Grantee" app as "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    Then I can see top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    Examples:
      | user          |
      | GRANTEE PM    |
      | GRANTEE EXE   |
      | GRANTEE ADMIN |

  @62200 @KPI @validateUserCanNotSeeNewButton @smoke
  Scenario Outline: Verify user can not see New button
    When I login to "As a Grantee" app as "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    Then I cannot see top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    Examples:
      | user       |
      | GRANTEE PO |
      | GRANTEE FD |
      | GRANTEE FO |

  @62200 @KPI @validateKPIMeasureField  @positive
  Scenario Outline: Verify Measure field accept 255 characters only
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "<enterValue>" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    Then I softly see field "Measure" as "<enterValue>"
    Examples:
      | enterValue                                                                                                                                                                                                                                                      |
      | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255 |

  @62200 @KPI @validateKPIValidationMessage
  Scenario: Verify validation message on Save and Continue button
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I click on "Save and Continue" in the page details
    Then I see the following messages in the page details :
      | Title is Required to save.               |
      | Domain is Required to save.              |
      | Measure is Required to save.             |
      | Unit of Measurement is Required to save. |
      | Indicator is Required to save.           |

  @62200 @KPI @validateKPICreated @smoke   @positive
  Scenario: Verify user can Create new KPI and move on view page.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    Then I see the header is "Key Performance Indicator" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime KPI}" in the page details

  @62122 @KPI @validateKPIOwnerCanSeeEditButton @smoke
  Scenario: Verify Other user(Not Owner) can not see edit button.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:Automation Runtime KPI}" in flex table with id "{grantee_tableId:KPITable}"

  @62122 @KPI @validateKPIOwnerCanSeeEditButton  @positive
  Scenario: Verify Only Owner can see edit button.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "KPID"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    Then I can see row level action button "Edit" against "{SavedValue:Automation Runtime KPI}" in flex table with id "{grantee_tableId:KPITable}"

  @62122 @KPI @validateKPIFieldValidationInEditMode
  Scenario: Verify warning messages on view page when edit fields are clear.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I pause execution for "3" seconds
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I enter value "--None--" into field "fieldDomain__c"
    And I clear the value from field "fieldDescription__c"
    And I clear the value from field "fieldTitle__c"
    And I clear the value from field "fieldUnit__c"
    And I clear the value from field "fieldOrientation__c"
    And I clear the value from field "fieldAgency__c"
    And I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Domain is Required to save under Overview.              |
      | Title is Required to save under Overview.               |
      | Measure is Required to save under Overview.             |
      | Unit of Measurement is Required to save under Overview. |
      | Indicator is Required to save under Overview.           |

  @62122 @KPI @validateKPITitleFieldInEditMode  @positive
  Scenario Outline: Verify Title field accept 255 characters only in edit mode
    When I delete the record "<requiredValue>" from the object "KPI"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I enter value "<enterValue>" into field "fieldTitle__c"
    And I click on "Save" in the page details
    Then I see the sub-header is "<requiredValue>" in the page details
    Examples:
      | enterValue                                                                                                                                                                                                                                                           | requiredValue                                                                                                                                                                                                                                                   |
      | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255title | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255 |

  @62191 @KPI @validateKPIAddAssociateForActive  @positive
  Scenario Outline: Verify user can add associate objective to KPI in Active status.
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicGoalsandObjective}"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "{grantee_tableId:Objectives}"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "KPID"
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:PlanningAssociateObjectiveTableId}"
    And I click "Associate" after selection of "Automation Objective" in the table "{grantee_tableId:PlanningObjectiveModalTableId}"
    And I close modal by clicking the top right x button
    Then I see value "Automation Objective" for title "Title" inside table "{grantee_tableId:PlanningAssociateObjectiveTableId}"
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE EXE   |

  @62191 @KPI @ValidateAssociateObjectiveForInactiveKPI
  Scenario: Verify user can not see associate button for inactive KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:PlanningAssociateObjectiveTableId---"
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Deactivate" in page detail
    And I click on "Deactivate" in the page details
    Then I softly see field "Status" as "Inactive"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:PlanningAssociateObjectiveTableId---"

  @62192 @KPI @validateKPIDelete @smoke  @positive
  Scenario: Verify user can delete KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "Delete" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I see the following messages in the page details :
      | Record deleted successfully. |

  @62192 @KPI @validateKPIOwnerCanDelete
  Scenario: Verify only owner can delete KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    Then I can see row level action button "Delete" against "{SavedValue:Automation Runtime KPI}" in flex table with id "{grantee_tableId:KPITable}"

  @62192 @KPI @validateKPIOtherCanNotDelete
  Scenario: Verify other user can not delete KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime KPI}" in flex table with id "{grantee_tableId:KPITable}"

  @62192 @KPI @validateKPIDeleteActivate @smoke
  Scenario: Verify other user cannot delete Activated KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime KPI}" in flex table with id "{grantee_tableId:KPITable}"

  @62225 @KPI @validateKPIActivateButton @smoke   @positive
  Scenario: Verify user can see activate button KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I can see top right button "Activate" in page detail

  @62225 @KPI @validateKPIActivateButtonOnlyRecordOwner
  Scenario: Verify Other user can not see activate button KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I cannot see top right button "Activate" in page detail

  @62225 @KPI @validateKPIActivateDeleteBTN @smoke
  Scenario: Verify user can not see Delete button for activated KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime KPI}" in flex table with id "{grantee_tableId:KPITable}"

  @62225 @KPI @validateKPIActivateEditBTN
  Scenario: Verify user can not see Edit button for activated KPI.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:Automation Runtime KPI}" in flex table with id "{grantee_tableId:KPITable}"

  @62225 @KPI @validateKPIActivateDeactivateBTN   @positive
  Scenario Outline: Verify user can see Deactivate button for activated KPI.
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "KPID"
    And I click on "Activate" in the page details
    Then I can see top right button "Deactivate" in page detail
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE EXE   |