@AwardKPIAndObjectiveAndSpecialConditions @regression @GrantsAwardsModule @parallel-regression
Feature: Award KPI and Objective and special condition related scenarios
  Test all scenarios related to Award KPI&Objective and special condition scenarios

  @67968 @ValidateKPIPageBlockDetailsAtAwards
  Scenario Outline: verify top level Associate button should get displayed in Award KPI table under monitoring sub tab
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I softly see the text containing :
      | Key Performance Indicators (KPI) |
      | Objectives                       |
      | Special Conditions               |
    Then I see "KPI Title" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Measure" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Unit" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Current Value" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Current Value Date" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Target Value" in flex table header "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

    Examples:
      | userType |
      | GRANTEE ADMIN    |
      | GRANTEE PO       |
      | GRANTEE DD       |
      |GRANTEE FO       |
      | GRANTEE EXE      |

  @67968 @ValidateKPIModalDetailsAtAwards-withActiveKPI   @positive
  Scenario: verify details on KPI modal table coming while clicking on Associate button under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Title" in flex table header "---prdoh_tableId:-:AwardKPITableId---"
    Then I see "Organization" in flex table header "---prdoh_tableId:-:AwardKPITableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime KPI}" for title "Title" inside table "---prdoh_tableId:-:AwardKPITableId---"

  @67968 @ValidateKPIModalDetailsAtAwards-withDraftKPI
  Scenario: verify user should not be able to see KPI which is in draft state At KPI modal table coming while clicking on Associate button under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "Title" in flex table header "---prdoh_tableId:-:AwardKPITableId---"
    Then I see "Organization" in flex table header "---prdoh_tableId:-:AwardKPITableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AwardKPITableId---"

  @67968 @ValidateAdditionOfKPIAtAwards-WithActivatedKPI   @positive
  Scenario: verify user is able to add KPI while clicking on Associate button under monitoring sub tab
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | 0           | 730       | 0           | 365       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    Then I softly see value "{SavedValue:Automation Runtime KPI}" for title "KPI Title" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

  @67968 @ValidateAdditionOfKPIAtAwards-WithDraftOrInactiveKPI
  Scenario: verify user is able to add KPI while clicking on Associate button under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AwardKPITableId---"

  @67968 @ValidateAdditionOfKPIAndObjectiveAtAwards-WithActivatedKPI   @positive
  Scenario: verify user is able to add KPI while clicking on Associate button under monitoring sub tab and related objective getting added to objective page block
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    Then I softly see value "{SavedValue:Automation Runtime KPI}" for title "KPI Title" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see value "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." for title "Objective Title" inside table "---prdoh_tableId:-:ObjectiveTableId---"

  @67968 @ValidateAssociatedRecordDetailsOfKPIAndObjectiveAtAwards-WithActivatedKPI @smoke  @positive
  Scenario: verify user is able to see details of added KPI and related objective
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    Then I see only the following rows under the following headers in table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---" :
      | KPI Title                           | Measure                    | Unit       | Current Value | Current Value Date | Target Value | Actions              |
      | {SavedValue:Automation Runtime KPI} | Automation KPI Description | Walk Score | 0.00          |                    | 0.00         | View & Edit & Delete |
    Then I see only the following rows under the following headers in table with id "---prdoh_tableId:-:ObjectiveTableId---" :
      | EGMS Strategic Plan ID | Objective Title                                                                               | Activities | Current Value | Current Value Date | Actions              |
      | SPN-0075               | Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis. |            |               |                    | View & Delete & Edit |

  @67968 @ValidateAssociatedRecordViewOfKPIAndObjectiveAtAwards  @positive
  Scenario: verify user is able to see details of added KPI and related objective on click of view icon
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I save the field labeled "Key Performance Indicator" as "KPIndicator"
    Then I softly see field "Key Performance Indicator" as "{SavedValue:KPIndicator}"
    And I save the field labeled "Current Value" as "currentValue"
    Then I softly see field "Current Value" as "{SavedValue:currentValue}"
    And I save the field labeled "Target Value" as "targetValue"
    Then I softly see field "Target Value" as "{SavedValue:targetValue}"
    And I save the field labeled "Award" as "award"
    Then I softly see field "Award" as "{SavedValue:award}"

  @67968 @ValidateAwardLookupLinkDetailsPage @smoke  @positive
  Scenario: verify user is able to click on award lookup link on Associated KPI modal and see details of Award
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click "AWD-00315" lookup link
    And I pause execution for "3" seconds
    Then I softly see field "Award" as "Automation Testing Grants 1"

  @67968 @ValidateEditOfAssociatedKPI  @positive
  Scenario: verify user is able to edit current value and current value date fields of associated KPI
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    And I click on "Edit" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I enter value "5" into field "Actual__c"
    And I enter value "0" into field "ActualDate__c"
    And I enter value "10" into field "Target__c"
    And I click on top right button "Save" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see value "5.00" for title "Current Value" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see value "10.00" for title "Target Value" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

  @67968 @ValidateRequiredFieldsErrorMessgaeOfAssociatedKPIEdit
  Scenario: verify error message is coming up after clicking save button without entering any value while inline edit of associated KPI
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    And I click on "Edit" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on top right button "Save" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see the following messages in the page details :
      | Required Field Missing |

  @67968 @ValidateRowLevelEditActionWithPIUserAtAssociatedKPI  @positive
  Scenario: verify user is able to see edit action icon with PI user At Associated KPI
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime KPI}" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

  @67968 @ValidateRowLevelEditActionWithNONPIUserAtAssociatedKPI
  Scenario Outline: verify user should not be able to see edit action icon with NON PI user At Associated KPI
    When I login as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see row level action button "Delete" against "Automation KPI" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation KPI" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

    Examples:
      | userType |
      | GRANTEE ADMIN    |
      | GRANTEE PO       |
      | GRANTEE DD       |
      |GRANTEE FO       |
      | GRANTEE EXE      |

  @67968 @ValidatePositiveNegativeValuesOfAssociatedKPIEdit  @positive
  Scenario: verify user is able to enter positive/negative values in expected fields while inline editing of Associated KPI
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    And I click on "Edit" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I enter value "-5" into field "Actual__c"
    And I enter value "0" into field "ActualDate__c"
    And I enter value "-10" into field "Target__c"
    And I click on top right button "Save" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see value "(5.00)" for title "Current Value" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see value "(10.00)" for title "Target Value" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

  @67968 @ValidateDeletionOfAssociatedKPI @smoke    @positive
  Scenario: verify user is able to delete Associated KPI
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime KPI}" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on "Delete" icon for "{SavedValue:Automation Runtime KPI}" inside flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

  @67968 @ValidateAssociationAndDeletionOfKPIAtActiveAward
  Scenario: verify user should not be able see top level Asscoiate button and row level delete icon At KPI table for Active Award
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | 0           | 730       | 0           | 365       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Overview" sub tab
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "No" into field "fieldIsNOGAAttachedPicklist__c"
    When I enter value "Washington" into field "fieldPlace_of_Performance__c"
    And I click on "Save" in the page details
    And I click on "Edit" icon for "" inside flex table with id "---prdoh_tableId:-:AwardRelatedApplicationTableId---"
    When I enter value "No" into field "fieldAwardrelatedapplication__c"
    And I click modal button "Save"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---prdoh_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name             | Description                  |
      | Program Approver | Automation PM | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I navigate to "Monitoring" sub tab
    And I refresh the page
    Then I softly cannot see row level action button "Delete" against "{SavedValue:Automation Runtime KPI}" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

  @67968 @ValidateObjectiveBlockDetailsAtAwards @smoke
  Scenario Outline: verify top level Associate button should get displayed/not displayed in Award Objective table under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"

    Examples:
      | userType |
      | GRANTEE ADMIN    |
      | GRANTEE PO       |
      | GRANTEE DD       |
      |GRANTEE FO       |
      | GRANTEE EXE      |

  @67968 @ValidateAdditionOfObjectiveAtAwards @smoke  @positive
  Scenario: verify user is able to add KPI while clicking on Associate button under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Automation Objective" in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective " in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "Automation Objective" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    Then I softly see value "Automation Objective" for title "Objective Title" inside table "---prdoh_tableId:-:ObjectiveTableId---"
    Then I softly see value "{SavedValue:Automation Runtime KPI}" for title "KPI Title" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

  @67968 @ValidateQuickSearchFunctionalityAtAssociateObjectiveModal  @positive
  Scenario: verify user is able to search objective records on modal after clicking on Associate button under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Automation Objective" in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    Then I see "Objectives" in flex table header "---prdoh_tableId:-:ObjectiveTableId---"
    Then I see "Activities" in flex table header "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective " in "---prdoh_tableId:-:AwardKPITableId---" panel
    Then I softly see value "Automation Objective" for title "Objectives" inside table "---prdoh_tableId:-:AwardKPITableId---"

  @67968 @ValidateActiveObjectiveRecordAtAssociateObjectiveModal @smoke   @positive
  Scenario: verify user is able to search Active objective records on modal after clicking on Associate button under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Automation Objective" in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective " in "---prdoh_tableId:-:AwardKPITableId---" panel
    Then I softly see value "Automation Objective" for title "Objectives" inside table "---prdoh_tableId:-:AwardKPITableId---"

  @67968 @ValidateDraftObjectiveRecordAtAssociateObjectiveModal
  Scenario: verify user is not able to search Draft objective records on modal after clicking on Associate button under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective " in "---prdoh_tableId:-:AwardKPITableId---" panel
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AwardKPITableId---"

  @67968 @ValidateInactiveObjectiveRecordAtAssociateObjectiveModal
  Scenario: verify user is not able to search Inactive objective records on modal after clicking on Associate button under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    And I pause execution for "2" seconds
    And I click on "Deactivate" in the page details
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective " in "---prdoh_tableId:-:AwardKPITableId---" panel
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:AwardKPITableId---"

  @67968 @ValidateAssociationOfMultipleObjectiveRecordAtAssociateObjectiveModal    @positive
  Scenario: verify user is able to Associate multiple objective records  on modal after clicking on Associate button under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "View" icon for "Automation St Goal" inside flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective1" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description1" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I perform quick search for "Automation" in "---prdoh_tableId:-:PlanningObjectiveModalTableId---" panel
    And I check "Automation Objective,Automation Objective1" boxes in flex table with id "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    When I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective" in "---prdoh_tableId:-:AwardKPITableId---" panel
    And I check "Automation Objective,Automation Objective1" boxes in flex table with id "---prdoh_tableId:-:AwardKPITableId---"
    When I click on top right button "Save" in flex table with id "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    Then I softly see value "Automation Objective" for title "Objective Title" inside table "---prdoh_tableId:-:ObjectiveTableId---"
    Then I softly see value "Automation Objective1" for title "Objective Title" inside table "---prdoh_tableId:-:ObjectiveTableId---"

  @67968 @ValidateDetailOfAssociatedObjectiveAtAwards @wip @buglogged77030 @smoke   @positive
  Scenario: verify user is able see details of associated objective after clicking on view icon under monitoring sub tab
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Automation Objective" in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective " in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "Automation Objective" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    And I click on "View" icon for "Automation Objective" inside flex table with id "---prdoh_tableId:-:ObjectiveTableId---"

  @67968 @ValidateConfirmationMessageOnDeletionOfAssociatedObjectiveAtAwards   @positive
  Scenario: verify user is able to see confirmation message while deleting associated objective from objective page block
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Automation Objective" in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "Automation Objective" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    When I click on "Delete" icon for "Automation Objective" inside table with table id "---prdoh_tableId:-:ObjectiveTableId---" without processing
    Then I softly see confirmation box with body "Do you want to delete this Objective ? Once it is deleted it cannot be restored." is displayed

  @67968 @ValidateDeletionOfAssociatedObjectiveAtAwards @smoke   @positive
  Scenario: verify user is able to delete associated objective from objective page block
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Automation Objective" in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "Automation Objective" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    And I click on "Delete" icon for "Automation Objective" inside flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    Then I see "No Records Found" inside flex table with id "---prdoh_tableId:-:ObjectiveTableId---"

  @67968 @ValidateAssociationDeletionImpactOfMultipleObjectiveRecordAtAssociateObjectiveModal   @positive
  Scenario: verify user is able to see associated KPI after deleting one associate objective from multiple list of Associated objective records of same KPI
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "View" icon for "Automation St Goal" inside flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective1" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description1" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I perform quick search for "Automation" in "---prdoh_tableId:-:PlanningObjectiveModalTableId---" panel
    And I check "Automation Objective,Automation Objective1" boxes in flex table with id "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    When I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective" in "---prdoh_tableId:-:AwardKPITableId---" panel
    And I check "Automation Objective,Automation Objective1" boxes in flex table with id "---prdoh_tableId:-:AwardKPITableId---"
    When I click on top right button "Save" in flex table with id "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    And I click on "Delete" icon for "Automation Objective" inside flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    Then I softly see value "{SavedValue:Automation Runtime KPI}" for title "KPI Title" inside table "---prdoh_tableId:-:KeyPerformanceIndicatorTableId---"

  @67968 @ValidateDeleteIconVisibilityForPINonPIUserAtObjectiveBlockDetailsAtAwards
  Scenario Outline: verify row level delete action icon is displayed for only for PI user and not displayed for Non PI user at objective page block
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Automation Objective" in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "Automation Objective" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    Then I softly can see row level action button "Delete" against "Automation Objective" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    Then I softly can see row level action button "Edit" against "Automation Objective" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see row level action button "Delete" against "Automation Objective" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Objective" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"

    Examples:
      | userType |
      | GRANTEE ADMIN    |
      | GRANTEE PO       |
      | GRANTEE DD       |
      |GRANTEE FO       |
      | GRANTEE EXE      |

  @67968 @ValidateAssociationAndDeletionOfObjectiveAtActiveAward @wip @needtoaddObjectiveAtActiveAward
  Scenario: verify user should not be able see top level Assciate button and row level delete icon At KPI table for Active Award
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{prdoh_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 4" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I refresh the page
    Then I softly cannot see row level action button "Delete" against "Automation Objective" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"

  @67968 @ValidateEditOfAssociatedObjectiveAtAwards   @positive
  Scenario: verify user is able to edit associated objective at objective page block
    When I login as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceStrategicGoalObjectivesgrid"
    And I enter value "Automation St Goal" into field "StrategyTitle__c"
    And I enter value "Automation Goal Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on top right button "New" in flex table with id "EnhanceRelatedObjectivesgrid"
    And I enter value "Automation Objective" into field "fieldStrategyTitle__c"
    And I enter value "Automation Description" into field "fieldStrategyDescription__c"
    And I click on "Save and Continue" in the page details
    When I navigate to "{sidebar:StrategicPlanLinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Strategic}" in "StrategicPlansParentFlexToggle" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Strategic}" inside table
    And I click on "Activate" in the page details
    When I navigate to "{sidebar:KPILinkName}" content inside "{sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:KPITable}"
    And I enter value "Oral Health" into field "fieldDomain__c"
    And I enter value "Automation Runtime KPI" into field "fieldTitle__c"
    And I enter value "Automation KPI Description" into field "fieldDescription__c"
    And I enter value "Walk Score" into field "fieldUnit__c"
    And I enter value "Flat" into field "fieldOrientation__c"
    And I enter value "888" into field "fieldAgency__c"
    And I click on "Save and Continue" in the page details
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Automation Objective" in the table "---prdoh_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    And I perform quick search for "Automation Objective" in "---prdoh_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "Automation Objective" in the table "---prdoh_tableId:-:AwardKPITableId---"
    And I refresh the page
    And I click on "Edit" icon for "Automation Objective" inside flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    Then I softly see "Met:Ongoing:Unmet:--None--" inside selectbox field "ReportedValues__c"
    And I enter value "Met" into field "ReportedValues__c"
    And I enter value "0" into field "ActualDate__c"
    And I click on top right button "Save" in flex table with id "---prdoh_tableId:-:ObjectiveTableId---"
    Then I softly see value "Met" for title "Current Value" inside table "---prdoh_tableId:-:ObjectiveTableId---"

  @68039 @ValidateSpecialConditionsPageBlockDetailsAtAwards-Draft
  Scenario Outline: verify user able to see details of special conditions page block under monitoring sub tab for draft Awards
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    Then I see "EGMS ID" in flex table header "---prdoh_tableId:-:SpecialConditionTableId---"
    Then I see "Name" in flex table header "---prdoh_tableId:-:SpecialConditionTableId---"
    Then I see "Description" in flex table header "---prdoh_tableId:-:SpecialConditionTableId---"
    Then I see "Date Special Condition Effective Date" in flex table header "---prdoh_tableId:-:SpecialConditionTableId---"
    Then I see "Date Special Condition Removed" in flex table header "---prdoh_tableId:-:SpecialConditionTableId---"
    Then I softly can see top right button "New" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"

    Examples:
      | userType |
      | GRANTEE ADMIN    |
      | GRANTEE PO       |
      | GRANTEE DD       |
      |GRANTEE FO       |
      | GRANTEE EXE      |

  @68039 @ValidateSpecialConditionsPageBlockDetailsAtAwards-SubmitForApproval-Active
  Scenario: verify user is not able to see top level action button at special conditions page block under monitoring sub tab for submit for approval status Awards
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 2" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 2" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 4" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 4" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"

  @68039 @ValidateAddingSpecialConditionsDetailsAtAwards-Draft @smoke   @positive
  Scenario: verify user is able add special condition details under monitoring sub tab for draft status Awards
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on "Delete" icon for "Automation Special Conditions" inside flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    And I enter in modal value "Automation Special Conditions" into field "fieldTitle__c"
    And I enter in modal value "Automation Special Conditions description" into field "cke_1_contents"
    And I enter in modal value "0" into field "fieldEffectiveFrom__c"
    And I enter in modal value "1" into field "fieldEffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    Then I softly see value "Automation Special Conditions" for title "Name" inside table "---prdoh_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Edit" against "Automation Special Conditions" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "Automation Special Conditions" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Delete" against "Automation Special Conditions" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"

  @68039 @ValidateErrorMessageWhileAddingSpecialConditionsDetailsAtAwards-Draft
  Scenario: verify user is able see error message while adding special condition details under monitoring sub tab for draft status Awards
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "New" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Name is Required to save.        |
      | Description is Required to save. |

  @68039 @ValidateDeleteIconVisibilityForPIAndNonPIUserAtSpecialConditionsDetailsAtAwards-Draft
  Scenario Outline: verify user is able see error message while adding special condition details under monitoring sub tab for draft status Awards
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on "Delete" icon for "Automation Special Conditions" inside flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    And I enter in modal value "Automation Special Conditions" into field "fieldTitle__c"
    And I enter in modal value "Automation Special Conditions description" into field "cke_1_contents"
    And I enter in modal value "0" into field "fieldEffectiveFrom__c"
    And I enter in modal value "1" into field "fieldEffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    Then I softly can see row level action button "Delete" against "Automation Special Conditions" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Edit" against "Automation Special Conditions" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see row level action button "Delete" against "Automation Special Conditions" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Special Conditions" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"

    Examples:
      | userType |
      | GRANTEE ADMIN    |
      | GRANTEE PO       |
      | GRANTEE DD       |
      |GRANTEE FO       |
      | GRANTEE EXE      |

  @68039 @ValidateEditFunctionalityOfAddedSpecialConditionsRecordAtAwards-Draft   @positive
  Scenario: verify user is able to edit the added special conditions records
    Given I login as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "{sidebar:AwardsBudgetPeriodLinkName}" content inside "{sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{prdoh_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{prdoh_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on "Delete" icon for "Automation Special Conditions2" inside flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    And I enter in modal value "Automation Special Conditions1" into field "fieldTitle__c"
    And I enter in modal value "Automation Special Conditions description1" into field "cke_1_contents"
    And I enter in modal value "0" into field "fieldEffectiveFrom__c"
    And I enter in modal value "1" into field "fieldEffectiveTill__c"
    And I click modal button "Save"
    And I refresh the page
    Then I softly see value "Automation Special Conditions1" for title "Name" inside table "---prdoh_tableId:-:SpecialConditionTableId---"
    And I click on "Edit" icon for "Automation Special Conditions1" inside flex table with id "---prdoh_tableId:-:SpecialConditionTableId---"
    And I enter in modal value "Automation Special Conditions2" into field "fieldTitle__c"
    And I click modal button "Save"
    Then I softly see value "Automation Special Conditions2" for title "Name" inside table "---prdoh_tableId:-:SpecialConditionTableId---"