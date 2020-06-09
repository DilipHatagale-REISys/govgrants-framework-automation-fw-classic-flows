@PRDOHSanityBusinessFlow @grantee-regression @grantee-parallel-regression
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

  @61987 @validateStrategicPlan @validateStrategicPlanGridView   @positive
  Scenario Outline: Verify Embedded strategic goals should have all the required columns
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I expand nested table containing column value "{SavedValue:EID}"
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
      | user |
      | PO   |
      | FO   |
      | FD   |

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
    Then I softly see "EGMS ID" in flex table header "EnhanceExternalProgramEnhancedGridgrid"
    Then I softly see "CFDA" in flex table header "EnhanceExternalProgramEnhancedGridgrid"
    Then I softly see "Program Name" in flex table header "EnhanceExternalProgramEnhancedGridgrid"
    Then I softly see "Federal Agency" in flex table header "EnhanceExternalProgramEnhancedGridgrid"
    Then I softly see "Agency Abbreviation" in flex table header "EnhanceExternalProgramEnhancedGridgrid"
    Examples:
      | userType |
      | GRANTEE ADMIN    |
      | GRANTEE PM       |
      | PO       |
      | FD       |
      | EXE      |
      | FO       |
      | PM1      |

  @62120 @ProgramsInternal @EditInternalProgram   @positive
  Scenario: validate internal users like PM/PO can edit internal program
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:InternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "EnhanceGranteeStateProgramsgrid"
    When I enter "ProgramsInternalProgram" values from "Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter value "Automation Description" into field "fieldObjectives__c"
    And I click on "Save" in the page details
    Then I see field "Description" as "Automation Description"

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
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I see the header is "Key Performance Indicator" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime KPI}" in the page details
    And I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    And I pause execution for "10" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Fiscal Approver    | Automation PM  | prdoh       |
      | Executive Approver | Automation Exe | prdoh       |
    Then I click on "Save and Continue" in the page details
    Then I click on "Submit for Approval" in the page details
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
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on top right button "Save" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I see the text "Required Field Missing"
    And I click on "Remove record" icon for "Created" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | aaaaaaa     | 1        | No                   |
      | Automation PO | Fiscal Reviewer  | aaaaaa      | 2        | No                   |
    Then I softly see value "Automation PM" for title "Reviewer Name" against the value "Program Reviewer" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Automation PO" for title "Reviewer Name" against the value "Fiscal Reviewer" inside table "{grantee_tableId:OpportunityPeerReviewers}"

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
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | aaaaaaa     | 1        | No                   |
    When I hovering mouse on table id "{grantee_tableId:OpportunityPeerReviewers}" with table row level icon "Send for Review" for column value "Automation PM"
    Then I softly see "Send for Review" as title for "Automation PM" inside flex table action
    Then I softly can see row level action button "Send for Review" against "Automation PM" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on "Send for Review" icon for "Automation PM" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
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
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I navigate to "Responsibilities" sub tab
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | aaaaaaa     | 1        | No                   |
      | Automation PO | Program Reviewer | aaaaaa      | 1        | No                   |
      | Automation PM | Fiscal Reviewer  | aaaaaaa     | 1        | No                   |
      | Automation PO | Fiscal Reviewer  | aaaaaa      | 1        | No                   |
    Then I softly see value "Program Reviewer" for title "Responsibility" against the value "Automation PM" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Program Reviewer" for title "Responsibility" against the value "New user PM" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Fiscal Reviewer" for title "Responsibility" against the value "Automation PM" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Fiscal Reviewer" for title "Responsibility" against the value "New user PM" inside table "{grantee_tableId:OpportunityPeerReviewers}"

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
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name           | Description |
      | Program Approver   | Automation PM  | prdoh       |
      | Executive Approver | Automation Exe | prdoh       |
    Then I click on "Save and Continue" in the page details
    Then I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login with "Exe" user
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "DC - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Opportunities}" panel
    And I click on "Start" icon for "DC - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Opportunities}"
    When I "Approve" in the approval decision
    When I click on "Create Application" in the page details
    And I enter value "Automation PM" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
    And I re-login with "PM" user
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
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | Automation PM | Program Reviewer | aaaaaaa     | 1        | No                   |
      | Automation PO | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "Automation PO" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "Automation PO" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on "Send for Review" icon for "Automation PM" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "Automation PM" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" against the value "Automation PM" inside table "{grantee_tableId:PendingTask}"
    When I re-login with "PO" user
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" against the value "Automation PM" inside table "{grantee_tableId:PendingTask}"

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
    And I pause execution for "10" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name | Responsibility  | Description | Due Date | Allow Record Editing |
      | Automation PO | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "Automation PO" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I re-login with "PO" user
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    When I click on "Created Date" column header inside table with id "{grantee_tableId:PendingTask}"
    When I click on "Created Date" column header inside table with id "{grantee_tableId:PendingTask}"
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Automation PO" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
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
    And I click on "Qualify Lead" in the page details
    And I pause execution for "10" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description | Due Date | Allow Record Editing |
      | Automation Exe | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "Automation Exe" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "5" seconds
    And I re-login with "EXE" user
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    When I click on "Created Date" column header inside table with id "{grantee_tableId:PendingTask}"
    When I click on "Created Date" column header inside table with id "{grantee_tableId:PendingTask}"
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Automation Exe" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
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
    And I click on "Qualify Lead" in the page details
    And I pause execution for "10" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description | Due Date | Allow Record Editing |
      | Automation Exe | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "Automation Exe" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "5" seconds
    And I re-login with "EXE" user
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    When I click on "Created Date" column header inside table with id "{grantee_tableId:PendingTask}"
    When I click on "Created Date" column header inside table with id "{grantee_tableId:PendingTask}"
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Automation Exe" inside flex table with id "GranteeOpportunityReviewersTempFlexToggle"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    When I get the "Review Date"
    And I save the field labeled "Review Date" as "ReviewDate"
    And I close modal by clicking the top right x button
    And I expand nested table containing column value "Automation Exe"
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

  @62815 @validateFederalLeadsDetailsPage-All @smoke   @positive
  Scenario: Validate source field value on federal leads detail page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "Grants.gov" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "Grants.gov" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    Then I softly see field "Source" as "Grants.gov"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "Federal" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "Federal" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    Then I softly see field "Source" as "Federal"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "State" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "State" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    Then I softly see field "Source" as "State"
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "NGO" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "Source" column header inside table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I click on "View" icon for "NGO" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    Then I softly see field "Source" as "NGO"

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
    And I click on "Qualify Lead" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    Then I softly see value "Secretaria Auxiliar de Promocion de la Salud" for title "Qualifying Organization" against the value "PRDOH PMUser" inside table "RelatedQualifiedLeadsgrid"
    Then I softly see value "PRDOH PMUser" for title "Qualified By" against the value "Secretaria Auxiliar de Promocion de la Salud" inside table "RelatedQualifiedLeadsgrid"

  @62830 @validateQuickSearchAtRelatedProgram  @positive
  Scenario: Validate quick search is working properly for valid and invalid input at related program detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value "1" into field "fieldCloseDate__c"
    When I click on "Save and Continue" in the page details
    And I click on top right button "Associate" in flex table with id "RelatedLeadCFDANumbersgrid"
    When I perform quick search for "Agricultural Research Basic and Applied Research" in "toggleFlexTablepopupflextable" panel
    When I click "Associate" after selection of "Agricultural Research Basic and Applied Research" in the table "popupflextable"
    When I pause execution for "3" seconds
    And I close "Associate" modal by clicking the top right x button
    And I refresh the page
    And I click on top right button "Associate" in flex table with id "RelatedLeadCFDANumbersgrid"
    When I perform quick search for "Wildlife Services" in "toggleFlexTablepopupflextable" panel
    When I click "Associate" after selection of "Wildlife Services" in the table "popupflextable"
    When I pause execution for "3" seconds
    And I close "Associate" modal by clicking the top right x button
    And I refresh the page
    When I perform quick search for "Agricultural Research Basic and Applied Research" in "RelatedLeadCFDANumbersgrid" panel
    Then I softly see value "Agricultural Research Basic and Applied Research" for title "Program Title" inside table "RelatedLeadCFDANumbersgrid"
    When I perform quick search for "2 Agricultural Research Basic and Applied Research" in "RelatedLeadCFDANumbersgrid" panel
    Then I softly do not see value "2 Agricultural Research Basic and Applied Research" for title "Program Title" inside table "RelatedLeadCFDANumbersgrid"

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
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
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
    When I click on "Save and Continue" in the page details
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
    When I click on "Save and Continue" in the page details
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
    When I click on "Save and Continue" in the page details
    When I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I navigate to "Overview" sub tab
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "RelatedQualifiedLeadsgrid" panel
    Then I softly see value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" for title "Agency" inside table "RelatedQualifiedLeadsgrid"
    When I perform quick search for "Agency Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "RelatedQualifiedLeadsgrid" panel
    Then I see "No Records Found" inside flex table with id "RelatedQualifiedLeadsgrid"
    When I perform quick search for "2 - Low" in "RelatedQualifiedLeadsgrid" panel
    Then I softly see value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" for title "Agency" inside table "RelatedQualifiedLeadsgrid"
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
    And I re-login to "As a Grantee" app as "GRANTEE DD" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    Then I softly cannot see row level action button "Edit" against "AutomationDemoLead" in flex table with id "{grantee_tableId:QualifiedLeads}"
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
    When I enter value "--None--" into field "fieldRelevance__c"
    Then I softly see the following messages in the page details contains:
      | Relevance is Required to save under Overview.     |
      | Impact is Required to save under Overview.        |
      | Justification is Required to save under Overview. |

  @61681 @validateOverviewTabForInternalOrganizations   @positive
  Scenario: Validate Overview sub tab for internal organizations detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I navigate to "Overview" sub tab
    And I softly see the text containing :
      | Overview           |
      | Address            |
      | Related Contacts   |
      | Indirect Rates     |
      | System Information |
    Then I softly see field "Organization Abbreviation" as "ASFHS"
    Then I softly see field "Street" as "123 Salt Flats,"
    When I click "Ramu Loke" lookup link
    When I click on "Edit" in the page details
    And I see the text :
      | You dont have permission to access this record. Please contact administrator. |
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I click "Ramu Loke" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    Then I softly see field "About Me" as "Admin Address"

  @61683 @validateAttachmentTabTabForInternalOrganizations  @positive
  Scenario: Validate Attachment addition and take snap shot functionality at overview sub tab for internal organizations detail page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{grantee_tableId:InternalOrganizations}" panel
    Then I softly see value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" for title "Operational Unit" inside table "{grantee_tableId:InternalOrganizations}"
    When I perform quick search for "Oficina de Preparacion y Coordinacion de Respuesta en Salud Publica" in "{grantee_tableId:InternalOrganizations}" panel
    Then I softly see value "Oficina de Preparacion y Coordinacion de Respuesta en Salud Publica" for title "Operational Unit" inside table "{grantee_tableId:InternalOrganizations}"
    When I perform quick search for "Secretaria Auxiliar de Reglamentacion y Acreditacion de Facilidades de Salud" in "{grantee_tableId:InternalOrganizations}" panel
    Then I softly see value "Secretaria Auxiliar de Reglamentacion y Acreditacion de Facilidades de Salud" for title "Operational Unit" inside table "{grantee_tableId:InternalOrganizations}"
    When I click on "View" icon for "Secretaria Auxiliar de Reglamentacion y Acreditacion de Facilidades de Salud" inside table
    When I navigate to "Attachments" sub tab
    And I softly see the text containing :
      | Attachments    |
      | Record History |
    When I upload attachment "AttachmentTesting.pdf" of type "AGENCY DETAILS"
    When I pause execution for "3" seconds
    When I refresh the page
    Then I see table with header "Attachments" contains records "AttachmentTesting.pdf"
    When I click on "Delete" icon for "AttachmentTesting.pdf" inside table
    And I click modal button "Ok"
    When I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I pause execution for "8" seconds
    Then I softly see field "Internal Organization" as "Secretaria Auxiliar de Reglamentacion y Acreditacion de Facilidades de Salud"
    Then I see take snap shot getting saved with "Todays Date"

  @61749 @validateContactEditFunctionalityAtInternalOrganizations   @positive
  Scenario Outline: Validate last modified date and last modified by field value at internal organizations contacts view page with different users
    When I login to "As a Grantee" app as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Direccion General" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:RelatedContacts}" panel
    When I click on "Edit" icon for "{SavedValue:firstName}" inside table
    When I enter value "NY" into field "fieldMailingCity"
    And I click on "Save" in the page details
    Then I softly see field "City" as "NY"
    Then I softly see field "Last Modified By" as "<userName>"
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

    Examples:
      | userType | userName         |
      | ADMIN    | Automation Admin |
      | PM       | Automation PM    |
      | PO       | Automation PO    |
      | FD       | Automation FD    |
      | FO       | Automation FO    |
      | EXE      | Automation Exe   |

  @61706 @validateAddingOfDUNSNumberWithValidDataAtInternalUser  @positive
  Scenario: Validate addition of DUNS Number with valid inputs at internal organizations
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I click on "Edit" in the page details
    When I enter value "105817142" into field "fieldDUNS__c"
    When I click on "Save and Continue" in the page details
    Then I softly see field "DUNS" as "105817142"

  @61950 @validateAddingOfContactForNonFederalOrganization    @positive
  Scenario: Validate addition of contact for non federal organization at external non federal organization table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "AIDS Funding Collaborative A" in "{grantee_tableId:NonFederalOrganizations}" panel
    When I click on "View" icon for "AIDS Funding Collaborative A" inside flex table with id "{grantee_tableId:NonFederalOrganizations}"
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "automationExternalNonFederalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "AIDS Funding Collaborative A" in "{grantee_tableId:NonFederalOrganizations}" panel
    When I click on "View" icon for "AIDS Funding Collaborative A" inside flex table with id "{grantee_tableId:NonFederalOrganizations}"
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:RelatedContacts}" panel
    Then I see value "{SavedValue:firstName}" for title "Full Name" inside table "{grantee_tableId:RelatedContacts}"
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "automationExternalNonFederalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |

  @61424 @validateSortingOfColumnAtExternalContactstable   @positive
  Scenario: Validate columns of external contacts table is getting sorted in ascending/descending order on column click
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I click on "Last Name" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Last Name" is in "Ascending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "Last Name" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Last Name" is in "Descending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    And I refresh the page
    When I click on "First Name" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "First Name" is in "Ascending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "First Name" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "First Name" is in "Descending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    And I refresh the page
    When I click on "Title" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Title" is in "Ascending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "Title" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Title" is in "Descending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    And I refresh the page
    When I click on "Organization" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Organization" is in "Ascending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "Organization" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Organization" is in "Descending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    And I refresh the page
    When I click on "Email" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Email" is in "Ascending" order of table id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "Email" column header inside table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I softly see content of expected column "Email" is in "Descending" order of table id "{grantee_tableId:ExternalFederalContacts}"

  @61760 @validateViewPageDetailForExternalFederalContactWithMultipleUsers  @positive
  Scenario Outline: Validate external federal contacts details is displayed for multiple user
    When I login to "As a Grantee" app as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I click on "Edit" in the page details
    When I enter value "Automation Federal Contact" into field "fieldTitle"
    And I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "View" icon for "{SavedValue:firstName}" inside table
    And I softly see the text containing :
      | Contact Information |
      | Address Information |
      | System Information  |
    Then I softly see field "First Name" as "{SavedValue:firstName}"
    Then I softly see field "Created By" as "<userName>"

    Examples:
      | userType | userName         |
      | ADMIN    | Automation Admin |
      | PM       | Automation PM    |
      | PO       | Automation PO    |
      | FD       | Automation FD    |
      | FO       | Automation FO    |
      | EXE      | Automation Exe   |

  @61909 @validateAddingOfContactWithOrWithoutMandatoryFieldsAtFederalContacts @smoke
  Scenario: Validate adding of contacts with or without mandatory fields at External federal contact
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Last Name : You must enter a value |
    And I refresh the page
    When I enter value "automationtest" into field "fieldEmail"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Last Name : You must enter a value |
      | Email : Invalid Email Address.     |
    And I refresh the page
    When I enter "grantee_sidebarCRwithDuplicateEmail" values from "Field_Values.xlsx"
    When I enter value "USDA-NRCS-NHO" into field "fieldAccountId"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |
    And I refresh the page
    When I enter "grantee_sidebarCRWithInvalidPhone" values from "Field_Values.xlsx"
    When I enter value "USDA-NRCS-NHO" into field "fieldAccountId"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Mobile Phone should be number and (XXX) XXX-XXXX format. |
      | Phone Number should be number and (XXX) XXX-XXXX format. |
      | Zip Code should be number and XXXXX format.              |
    And I refresh the page
    When I enter "grantee_sidebarCRWithInvalidAddress" values from "Field_Values.xlsx"
    When I enter value "USDA-NRCS-NHO" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Street:Data value too large. (max length=255) |

  @61932 @validateEditOfContactForNonFederalOrganizationUnderExternalContact  @positive
  Scenario Outline: Validate user can edit contacts of Non federal organization at external federal contact table
    When I login to "As a Grantee" app as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "Edit" icon for "{SavedValue:firstName}" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click on "Save" in the page details
    Then I softly see field "Street" as "Automation Address Test"
    Then I softly see field "Organization" as "Health State Organization"

    Examples:
      | userType |
      | GRANTEE ADMIN    |
      | GRANTEE PM       |
      | PO       |
      | FO       |
      | EXE      |

  @62129 @validateSortingOfColumnAtInternalContactTable-myOrganizationContact  @positive
  Scenario: Validate columns of myOrganizationContact Table of internal contact is getting sorted in ascending/descending order on column click
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I click on "Last Name" column header inside table with id "{grantee_tableId:InternalContacts}"
    Then I softly see content of expected column "Last Name" is in "Ascending" order of table id "{grantee_tableId:InternalContacts}"
    When I click on "Last Name" column header inside table with id "{grantee_tableId:InternalContacts}"
    Then I softly see content of expected column "Last Name" is in "Descending" order of table id "{grantee_tableId:InternalContacts}"
    And I refresh the page
    When I click on "First Name" column header inside table with id "{grantee_tableId:InternalContacts}"
    Then I softly see content of expected column "First Name" is in "Ascending" order of table id "{grantee_tableId:InternalContacts}"
    When I click on "First Name" column header inside table with id "{grantee_tableId:InternalContacts}"
    Then I softly see content of expected column "First Name" is in "Descending" order of table id "{grantee_tableId:InternalContacts}"
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

  @62031 @validateAddingOfInternalContactWithOrWithoutMandatoryFields-myOrganizationContact @smoke
  Scenario: Validate Internal contact creation with valid Invalid data.
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
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
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |
    When I enter "ContactCreationWithInvalidPhone" values from "Field_Values.xlsx"
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Mobile Phone should be number and (XXX) XXX-XXXX format. |
      | Phone Number should be number and (XXX) XXX-XXXX format. |
      | Zip Code should be number and XXXXX format.              |
    And I refresh the page
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I enter "ContactCreationInvalidAddress" values from "Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Street:Data value too large. (max length=255) |

  @62033 @validateAdminRecordShouldNotEditedByOthersUsersAtInternalContacts
  Scenario Outline: Validate contact record should not be edited by others users using created by field at Internal contact
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I re-login as "<userType>" user on "default" portal
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    When I click on "View" icon for "{SavedValue:firstName}" inside flex table with id "{grantee_tableId:InternalContacts}"
    When I click "Automation Admin" lookup link
    When I click on "Edit" in the page details
    And I see the text :
      | You dont have permission to access this record. Please contact administrator. |

    Examples:
      | userType |
      | EXE      |
      | PM       |