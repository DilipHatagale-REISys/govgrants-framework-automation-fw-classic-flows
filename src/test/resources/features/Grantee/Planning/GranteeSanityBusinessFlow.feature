@Grantee-SanityBusinessFlow @grantee-regression @grantee-parallel-regression
Feature: Sanity scenarios
  Test all scenarios for Sanity

  @61948 @validateStrategicPlan @validateStrategicPlanEditAndDelete @smoke @positive
  Scenario: Verify Only owner can edit and delete strategic plan
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Strategic}" in flex table with id "StrategicPlansParentFlexToggle"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime Strategic}" in flex table with id "StrategicPlansParentFlexToggle"

  @61987 @validateStrategicPlan @validateStrategicPlanGridViewColumns   @positive
  Scenario Outline: Verify Embedded strategic goals should have all the required columns
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "StrategicId"
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I expand nested table containing column value "{SavedValue:StrategicId}"
    Then I see "<ColumnName>" in flex table header "StrategicGoalsChildFlexToggle"
    Examples:
      | ColumnName         |
      | Strategic Goal     |
      | Month-Year Created |
      | EGMS ID            |

  @61987 @validateStrategicPlan @validateStrategicPlanGridView @smoke   @positive
  Scenario: Verify User can view strategic plans, goals and objectives.
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGID"
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I click on "Save and Continue" in the page details
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I expand nested table containing column value "{SavedValue:Automation Runtime Strategic}"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGID}" in flex table with id "StrategicGoalsChildFlexToggle"
    Then I softly can see row level action button "Delete" against "{SavedValue:EGID}" in flex table with id "StrategicGoalsChildFlexToggle"
    And I expand nested table containing column value "{SavedValue:EGID}"
    Then I softly can see row level action button "Edit" against "Automation Objective" in flex table with id "StrategicObjectivesChildFlexToggle"
    Then I softly can see row level action button "Delete" against "Automation Objective" in flex table with id "StrategicObjectivesChildFlexToggle"

  @62329 @validateStrategicPlan @validateStrategicPlanNotActivateSPforSameOrg  @positive
  Scenario: Verify user can not activate SP with same organization which is activated
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:EID}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic 2" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside table
    And I click on "Activate" in the page details
    Then I see the following messages in the page details :
      | An active strategic plan already exists for the internal organization. The current strategic plan must be deactivated before a new strategic plan can be made active. |

  @62150 @Projects @verifyProjectSortColumns  @positive
  Scenario Outline: Verify sorting column for projects
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    When I click on "<ColumnName>" column header inside table with id "{grantee_tableId:Projects}"
    Then I softly see content of expected column "<ColumnName>" is in "Descending" order of table id "{grantee_tableId:Projects}"
    When I click on "<ColumnName>" column header inside table with id "{grantee_tableId:Projects}"
    Then I softly see content of expected column "<ColumnName>" is in "Ascending" order of table id "{grantee_tableId:Projects}"
    Examples:
      | ColumnName            |
      | Internal Organization |
      | Name                  |
      | Status                |
      | EGMS ID               |

  @62258 @Projects @verifyProjectsHistorySubTabSort  @positive
  Scenario Outline: Verify user can Sort to history table by column
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:Projects}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I enter value "Automation Runtime Focus Area edit" into field "fieldTitle__c"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Runtime Focus Area edit1" into field "fieldTitle__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I navigate to "History" sub tab
    When I click on "<ColumnName>" column header inside table with id "History"
    Then I softly see content of expected column "<ColumnName>" is in "Ascending" order of table id "History"
    When I click on "<ColumnName>" column header inside table with id "History"
    Then I softly see content of expected column "<ColumnName>" is in "Descending" order of table id "History"
    Examples:
      | ColumnName    |
      | EGMS ID       |
      | New Value     |
      | Old Value     |
      | Changed By    |
      | Changed Field |

  @62585 @Projects @verifyProjectsDeactiveButtonInvalidUser
  Scenario Outline: Verify user <user> cannot see Deactivate button for Activated project
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Activate" in the page details
    And I pause execution for "3" seconds
    And I re-login with "<user>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:Projects}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I cannot see top right button "Deactivate" in page detail
    Examples:
      | user       |
      | GRANTEE PO |
      | GRANTEE FO |
      | GRANTEE FD |

  @61817 @ProgramsExternal @verifyProgramsExternalQuickSearchValid @smoke  @positive
  Scenario Outline: Verify User can perform quick search with valid data for Federal Programs
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I perform quick search for "<value>" in "FederalProgramsFlexToggle" panel
    Then I see value "<value>" for title "<ColumnName>" inside table "FederalProgramsFlexToggle"
    Examples:
      | value                                      | ColumnName     |
      | Animal And Plant Health Inspection Service | Federal Agency |
      | Wildlife Services                          | Title          |
      | 10.028                                     | CFDA           |

  @62082 @validateExternalFederalProgramsColumn @smoke   @positive
  Scenario Outline: Validate coumn of external federal program table is displayed as expected
    Given I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    Then I softly see "CFDA" in flex table header "EnhanceExternalProgramEnhancedGridgrid"
    Then I softly see "Title" in flex table header "EnhanceExternalProgramEnhancedGridgrid"
    Then I softly see "Federal Agency" in flex table header "EnhanceExternalProgramEnhancedGridgrid"
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE EXE   |
      | GRANTEE FO    |
      | GRANTEE PM1   |

  @62116 @KPI @validateAllOrgUserCanViewKPI  @positive
  Scenario: Verify all Organizational user can view created KPI.
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
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I see the header is "Key Performance Indicator" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime KPI}" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I see the header is "Key Performance Indicator" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime KPI}" in the page details

  @62123 @KPI @validateDeactivateKPI @smoke    @positive
  Scenario: Verify user can Deactivate KPI.
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
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Inactive" and is "red"

  @62200 @KPI @validateKPITitleField   @positive
  Scenario Outline: Verify Title field accept 255 characters only
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:KPITable}"
    And I enter value "Education" into field "fieldDomain__c"
    And I enter value "<enterValue>" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    Then I see the header is "Key Performance Indicator" in the page details
    Then I see the sub-header is "<requiredValue>" in the page details
    Examples:
      | enterValue                                                                                                                                                                                                                                                           | requiredValue                                                                                                                                                                                                                                                   |
      | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255title | titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitleti255 |

  @62191 @KPI @validateKPIAddAssociateForInactive @wip
  Scenario: Verify user click on associate without selecting objective.
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
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:PlanningAssociateObjectiveTableId}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:PlanningObjectiveModalTableId}"
    Then I see the following messages in the page details :
      | No Goals and Objectives are selected. |

  @62192 @KPI @validateKPIDeleteInActivate
  Scenario: Verify other user can not delete InActivated KPI.
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
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Deactivate" in the page details
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime KPI}" in flex table with id "{grantee_tableId:KPITable}"

  @62225 @KPI @validateKPIDeactivateActivateBTN  @positive
  Scenario: Verify user can see Activate button for Deactivated KPI.
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
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Deactivate" in the page details
    Then I can see top right button "Activate" in page detail

  @63246 @NotConverted @VerifyTheNewButtonAvailabilityForAnOpportunityOtherThanCreatedStatusSubmitForApproval
  Scenario: verify new button should not be displayed for an opportunity other than created status(Submit for Approval)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "No" into field "fieldPreApplicationNeeded__c"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name                              | Description     |
      | Program Approver   | {SavedValue:GRANTEE PM Username}  | Product Grantee |
      | Fiscal Approver    | {SavedValue:GRANTEE FO Username}  | Product Grantee |
      | Executive Approver | {SavedValue:GRANTEE EXE Username} | Product Grantee |
    And I click on "Submit for Approval" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @verifyErrorMessageAndAddMultipleReviewers
  Scenario: verify error message should be displayed while clicking on save button without adding data and User should be able to add multiple reviewers
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Created Date" as "CreatedDate"
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I save the field labeled "EGMS ID" as "LeadNumber"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on top right button "Save" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I see the text "Required Field Missing"
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    Then I softly see value "{SavedValue:GRANTEE PM Username}" for title "Reviewer Name" against the value "Program Reviewer" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @ValidateSendForReviewButtonIsDisplayedAndableToClickOnIt @smoke  @positive
  Scenario: verify after adding new peer review send for review button should be displayed and able to click on send for review icon
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Created Date" as "CreatedDate"
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I save the field labeled "EGMS ID" as "LeadNumber"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    Then I softly can see row level action button "Send for Review" against "{SavedValue:GRANTEE PM Username}" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."

  @63246 @NotConverted @ValidateAddingMultiplePeerReviewersForEachRole   @positive
  Scenario:verify User should be able to add multiple peer reviewers for each role
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Created Date" as "CreatedDate"
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I save the field labeled "EGMS ID" as "LeadNumber"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
      | {SavedValue:GRANTEE PO Username} | Program Reviewer | aaaaaa      | 1        | No                   |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer  | aaaaaaa     | 1        | No                   |
      | {SavedValue:GRANTEE PO Username} | Fiscal Reviewer  | aaaaaa      | 1        | No                   |
    Then I softly see value "Program Reviewer" for title "Responsibility" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Program Reviewer" for title "Responsibility" against the value "{SavedValue:GRANTEE PO Username}" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Fiscal Reviewer" for title "Responsibility" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Fiscal Reviewer" for title "Responsibility" against the value "{SavedValue:GRANTEE PO Username}" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @ValidateTheNewButtonAvailabilityForAnOpportunityOtherThanCreatedStatusConvertedToApplication
  Scenario: verify new button should not be displayed for an opportunity other than created status(Converted to Application)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I save the field labeled "EGMS ID" as "LeadNumber"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "No" into field "fieldPreApplicationNeeded__c"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name                              | Description     |
      | Program Approver   | {SavedValue:GRANTEE PM Username}  | Product Grantee |
      | Fiscal Approver    | {SavedValue:GRANTEE FO Username}  | Product Grantee |
      | Executive Approver | {SavedValue:GRANTEE EXE Username} | Product Grantee |
    And I click on "Submit for Approval" in the page details
    And I save the field labeled "EGMS ID" as "egmsid"
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Create Application" in the page details
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @66432 @NotConverted @ValidateAppropriateMessageClickingOnSendForReviewIconForMultipleProgramReviewers  @positive
  Scenario: verify appropriate message while clicking on send for review icon for multiple program reviewers
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
      | {SavedValue:GRANTEE PO Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "{SavedValue:GRANTEE PO Username}" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:HomePendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:HomePendingTask}"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:HomePendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:HomePendingTask}"

  @66479 @ValidateStatusOfReviewShouldBeChangeFromSentForReviewToInProgress  @positive
  Scenario: verify Review status should be change from sent for review to In Progress
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PO Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:HomePendingTask}" panel
    When I click on "Created Date" column header inside table with id "{grantee_tableId:HomePendingTask}"
    When I click on "Created Date" column header inside table with id "{grantee_tableId:HomePendingTask}"
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:HomePendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    And I close modal by clicking the top right x button
    Then I softly see value "In Progress" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Enter Review" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateActionsOnSubmitReviewButtonWhoIsNotTheRecordOwner  @positive
  Scenario: verify Confirmation message should be displayed and Review status at record level should be Review Completed(who is not the record owner)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Created Date" as "CreatedDate"
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I save the field labeled "EGMS ID" as "LeadNumber"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                     | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE EXE Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE EXE Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:HomePendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:HomePendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE EXE Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    And I click on "Submit Review" in the page details
    Then I softly see the text "Review successfully submitted"
    And I close modal by clicking the top right x button
    And I pause execution for "5" seconds
    Then I softly see value "Review Completed" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateReviewAfterSavingEnteredReviewWhoIsNotTheRecordOwner  @positive
  Scenario: verify  A record should get displayed for entered review(who is not the record owner)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Created Date" as "CreatedDate"
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I save the field labeled "EGMS ID" as "LeadNumber"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                     | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE EXE Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE EXE Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:HomePendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:HomePendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE EXE Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    When I get the "Review Date"
    And I save the field labeled "Review Date" as "ReviewDate"
    And I close modal by clicking the top right x button
    And I expand nested table containing column value "{SavedValue:GRANTEE EXE Username}"
    Then I softly see value "Passed" for title "Rating" against the value "enterreviewcmnt" inside table "GranteeOpportunityReviewersTempFlexToggle"
    Then I softly see value "enterreviewcmnt" for title "Comments" against the value "Passed" inside table "GranteeOpportunityReviewersTempFlexToggle"
    Then I softly see field "{SavedValue:ReviewDate}" contains todays date withTime
    And I click on "View" icon for "Passed" inside flex table with id "GranteeOpportunityReviewersTempFlexToggle"
    Then I see the following modal buttons :
      | Edit          |
      | Submit Review |

  @63186 @validateRequiredFieldsAtLeadCreationPage-NotYetQualifiedLeads
  Scenario:  Validate error messge for required fields while creating leads
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I click on "Save and Continue" in the page details
    Then  I see the following messages in the page details :
      | Opportunity Title is Required to save.                    |
      | Opportunity Number is Required to save.                   |
      | Application Due Date is Required to save.                 |
      | Funding Organization is Required to save.                 |
      | Eligible Applicants is Required to save.                  |
      | Lead Description is Required to save.                     |
      | Cost Sharing or Matching Requirement is Required to save. |

  @62830 @validateLeadQualificationWithDifferentUser-NotYetQualified-futureDate  @positive
  Scenario: Validate logged in users organization should not be displayed after qualifying lead with users having different organization - with lead future date
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM1" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Created Date" as "CreatedDate"
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I save the field labeled "EGMS ID" as "LeadNumber"
    And I click on "Qualify Lead" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    Then I softly see value "Children’s Health Insurance Program" for title "Qualifying Organization" against the value "GRANTEE PM1 Username" inside table "RelatedQualifiedLeadsgrid"
    Then I softly see value "{SavedValue:GRANTEE PM1 Username}" for title "Qualified By" against the value "Children’s Health Insurance Program" inside table "RelatedQualifiedLeadsgrid"

  @62830 @validateNoOfOrganizationAsTotalRecordsForAllQualificationTable  @positive
  Scenario: Validate All Qualifications table should contain number of record same as the number expected leads has been qualified - at qualified lead detail page
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM1" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Created Date" as "CreatedDate"
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I save the field labeled "EGMS ID" as "LeadNumber"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    Then I see total records count is same as total row of table id "RelatedQualifiedLeadsgrid" and table name "flextable"

  @62830 @validateQuickSearchOptionAtAllQualificationTable   @positive
  Scenario: Validate All Qualifications table quick search is working properly for valid and invalid search
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM1" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    When I perform quick search for "Children’s Health Insurance Program" in "RelatedQualifiedLeadsgrid" panel
    Then I softly see value "Children’s Health Insurance Program" for title "Internal Organization" inside table "RelatedQualifiedLeadsgrid"
    When I perform quick search for "Invalid" in "RelatedQualifiedLeadsgrid" panel
    Then I see "No Records Found" inside flex table with id "RelatedQualifiedLeadsgrid"
    When I perform quick search for "2 - Low" in "RelatedQualifiedLeadsgrid" panel
    Then I softly see value "Children’s Health Insurance Program" for title "Agency" inside table "RelatedQualifiedLeadsgrid"
    When I perform quick search for "Low - 2" in "RelatedQualifiedLeadsgrid" panel
    Then I see "No Records Found" inside flex table with id "RelatedQualifiedLeadsgrid"

  @63041 @validateRowAndTopLevelEditButtonAtQualifiedLeadTableWithDifferentUser
  Scenario: Validate edit button should not displayed at qualified lead table for user other than record owner
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Lead}" in flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    Then I softly cannot see top right button "Edit" in page detail
    And I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Lead}" in flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    Then I softly cannot see top right button "Edit" in page detail
    And I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Lead}" in flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    Then I softly cannot see top right button "Edit" in page detail

  @63041 @validateRelevancePicklistFieldWithBlankData
  Scenario:  Validate error message after submission with blank data as none inside Relevence pick list field
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Relevance is Required to save under Overview.     |
      | Impact is Required to save under Overview.        |
      | Justification is Required to save under Overview. |

  @61681 @validateOverviewTabForInternalOrganizations   @positive
  Scenario: Validate Overview sub tab for internal organizations detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I navigate to "Overview" sub tab
    And I softly see the text containing :
      | Overview           |
      | Address            |
      | Related Contacts   |
      |Child Organizations |
      | Indirect Rates     |
      |DUNS Numbers        |
      | System Information |
    Then I softly see field "Organization Abbreviation" as "BHDDHO"
    Then I softly see field "Street" as "Street"
    When I click "Mahananda Nyamagouda" lookup link
    When I click on "Edit" in the page details
    And I see the text :
      | You dont have permission to access this record. Please contact administrator. |

  @61706 @validateAddingOfDUNSNumberWithValidDataAtInternalUser  @positive
  Scenario: Validate addition of DUNS Number with valid inputs at internal organizations
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I click on "Edit" in the page details
    When I enter value "456784567" into field "fieldEINText__c"
    When I click on "Save and Continue" in the page details
    Then I softly see field "EIN" as "456784567"

  @61950 @validateAddingOfContactForNonFederalOrganization    @positive
  Scenario: Validate addition of contact for non federal organization at external non federal organization table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{grantee_tableId:NonFederalOrganizations}" panel
    When I click on "View" icon for "ACC-APG-Belvoir" inside flex table with id "{grantee_tableId:NonFederalOrganizations}"
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "automationExternalNonFederalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{grantee_tableId:NonFederalOrganizations}" panel
    When I click on "View" icon for "ACC-APG-Belvoir" inside flex table with id "{grantee_tableId:NonFederalOrganizations}"
    When I perform quick search for "Automation External Non Federal Contact Test" in "{grantee_tableId:RelatedContacts}" panel
    Then I see value "{SavedValue:firstName}" for title "Title" inside table "{grantee_tableId:RelatedContacts}"
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "automationExternalNonFederalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |

  @61424 @validateSortingOfColumnAtExternalContactstable   @positive
  Scenario: Validate columns of external contacts table is getting sorted in ascending/descending order on column click
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I click on "Full Name" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Full Name" is in "Ascending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "Full Name" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Full Name" is in "Descending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "Title" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Title" is in "Ascending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "Title" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Title" is in "Descending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    And I refresh the page
    When I click on "Email" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Email" is in "Ascending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "Email" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Email" is in "Descending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    And I refresh the page
    When I click on "Organization" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Organization" is in "Ascending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "Organization" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Organization" is in "Descending" order of table id "{grantee_tableId:ExternalFederalContacts}"

  @61760 @validateViewPageDetailForExternalFederalContactWithMultipleUsers  @positive
  Scenario Outline: Validate external federal contacts details is displayed for multiple user
    When I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I click on "Edit" in the page details
    When I enter value "Automation Federal Contact" into field "fieldTitle"
    And I click on "Save" in the page details
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "View" icon for "Automation Federal Contact" inside table
    And I softly see the text containing :
      | Contact Information |
      | Address Information |
      | System Information  |
    Then I softly see field "First Name" as "{SavedValue:firstName}"
    Then I softly see field "Created By" as "<userName>"

    Examples:
      | userType      | userName                            |
      | GRANTEE ADMIN | {SavedValue:GRANTEE ADMIN Username} |
      | GRANTEE PM    | {SavedValue:GRANTEE PM Username}    |
      | GRANTEE PO    | {SavedValue:GRANTEE PO Username}    |
      | GRANTEE FD    | {SavedValue:GRANTEE FD Username}    |
      | GRANTEE FO    | {SavedValue:GRANTEE FO Username}    |
      | GRANTEE EXE   | {SavedValue:GRANTEE EXE Username}   |

  @61932 @validateEditOfContactForNonFederalOrganizationUnderExternalContact  @positive
  Scenario Outline: Validate user can edit contacts of Non federal organization at external federal contact table
    When I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Department of Health" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "Edit" icon for "Automation External Non Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter value "Department of Health" into field "fieldAccountId"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click on "Save" in the page details
    Then I softly see field "Street" as "Automation Address Test"
    Then I softly see field "Organization" as "Health State Organization"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @62129 @validateSortingOfColumnAtInternalContactTable-myOrganizationContact  @positive
  Scenario: Validate columns of myOrganizationContact Table of internal contact is getting sorted in ascending/descending order on column click
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I click on "Full Name" column header inside table with id "{grantee_tableId:InternalContacts}"
    Then I softly see content of expected column "Full Name" is in "Ascending" order of table id "{grantee_tableId:InternalContacts}"
    When I click on "Full Name" column header inside table with id "{grantee_tableId:InternalContacts}"
    Then I softly see content of expected column "Full Name" is in "Descending" order of table id "{grantee_tableId:InternalContacts}"
    And I refresh the page
    When I click on "Title" column header inside table with id "{grantee_tableId:InternalContacts}"
    Then I softly see content of expected column "Title" is in "Ascending" order of table id "{grantee_tableId:InternalContacts}"
    When I click on "Title" column header inside table with id "{grantee_tableId:InternalContacts}"
    Then I softly see content of expected column "Title" is in "Descending" order of table id "{grantee_tableId:InternalContacts}"
    And I refresh the page
    When I click on "Email" column header inside table with id "{grantee_tableId:InternalContacts}"
    Then I softly see content of expected column "Email" is in "Ascending" order of table id "{grantee_tableId:InternalContacts}"
    When I click on "Email" column header inside table with id "{grantee_tableId:InternalContacts}"
    Then I softly see content of expected column "Email" is in "Descending" order of table id "{grantee_tableId:InternalContacts}"

  @62033 @validateAdminRecordShouldNotEditedByOthersUsersAtInternalContacts
  Scenario Outline: Validate contact record should not be edited by others users using created by field at Internal contact
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I re-login as "<userType>" user on "default" portal
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    When I click on "View" icon for "AutomationUser" inside flex table with id "{grantee_tableId:InternalContacts}"
    When I click "{SavedValue:GRANTEE ADMIN Username}" lookup link
    When I click on "Edit" in the page details
    And I see the text :
      | You dont have permission to access this record. Please contact administrator. |

    Examples:
      | userType    |
      | GRANTEE EXE |
      | GRANTEE PM  |