@Grantee-pdfRelatedScenariosForAllModule @onlyLocalExecution @skipOnJenkins
Feature: PDF download and validate scenarios from all modules
  Test all scenarios related to pdf validation

  @62116 @KPI @verifyDownloadCorrectPdf @positive
  Scenario Outline: Verify User can download correct pdf
    Given I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#EnhanceMasterKPIsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Key Performance Indicators (KPI) - All"
    And I download the file
    Then I see "Key Performance Indicators (KPI) - All" on page "1" of "govgrants" pdf file
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @61948 @validateStrategicPlan @strategiplandownload @positive
  Scenario Outline: Verify User can download correct pdf
    Given I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#StrategicPlansParentFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Strategic Plans - All"
    And I download the file
    Then I see "Strategic Plans - All" on page "1" of "govgrants" pdf file
    Examples:
      | userType    |
      | GRANTE PM   |
      | GRANTEE PO  |
      | GRANTEE FD  |
      | GRANTEE FO  |
      | GRANTEE EXE |

  @61424 @validateDownloadAsPDFAtExternalContactstable  @positive
  Scenario: Validate external contacts lists are visisble to users in downloaded pfd file
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#FederalContactsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Federal Contacts"
    And I download the file
    Then I see "Federal Contacts" on page "1" of "govgrants" pdf file

  @61682 @validateDownloadPDFAtInternalProgramsUnderRelatedLogForInternalOrganizations @wip @positive
  Scenario: Validate download as pdf option at Internal Programs is getting downloaded properly with expected content
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I navigate to "Related Log" sub tab
    When I click on parallel lines menu bar with data target value "#AgencyProgramsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Internal Programs"
    And I download the file
    Then I see "Internal Programs" on page "1" of "govgrants" pdf file

  @67968 @ValidateDownloadAsPDFOptionAtKPITable    @positive
  Scenario: verify user should be able to download pdf file at KPI table
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
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Activate" in the page details
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:PlanningAssociateObjectiveTableId---"
    And I click "Associate" after selection of "Increase the proportion of cancer survivors who are living 5 years or longer after diagnosis." in the table "---grantee_tableId:-:PlanningObjectiveModalTableId---"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "{grantee_sidebar:AwardsBudgetPeriodLinkName}" content inside "{grantee_sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{grantee_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{grantee_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---grantee_tableId:-:AwardKPITableId---" panel
    When I click "Save" after selection of "{SavedValue:Automation Runtime KPI}" in the table "---grantee_tableId:-:AwardKPITableId---"
    And I refresh the page
    When I click on parallel lines menu bar with data target value "#AwardKeyOutcomesFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Key Performance Indicators (KPI)"
    And I download the file
    Then I see "Key Performance Indicators (KPI)" on page "1" of "govgrants" pdf file

  @62815 @validateDownloadPDFAtLeadsTable-NotYetQualified  @positive
  Scenario: Validate download as pdf option at Leads table is getting downloaded properly with expected content
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#LeadsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Leads Not Yet Qualified - All"
    And I download the file
    Then I see "EGMS ID" on page "1" of "govgrants" pdf file

  @61817 @ProgramsExternal @verifyProgramsExternalFederalProgaram   @positive
  Scenario: Verify User can download correct pdf for federal program
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ExternalPrograms}" content inside "{grantee_sidebar:ProgramsSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#FederalProgramsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Federal Programs"
    And I download the file
    Then I see "Federal Programs" on page "1" of "govgrants" pdf file

  @61748 @validateDownloadPDFAtRelatedContactForInternalOrganizations @positive
  Scenario: Validate download as pdf option at related contact is getting downloaded properly with expected content
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" inside table
    When I click on parallel lines menu bar with data target value "#ContactsByAccountFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Related Contacts"
    And I download the file
    Then I see "Related Contacts" on page "1" of "govgrants" pdf file

  @68048 @ValidateDownloadPDFFunctionalityAtReportPreparerPageBlock  @positive
  Scenario: verify user is able to download and see the content inside downloaded pdf file at Report preparer page block
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{grantee_sidebar:AwardsBudgetPeriodLinkName}" content inside "{grantee_sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{grantee_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{grantee_tableId:AwardsTable}"
    And I navigate to "Roles" sub tab
    When I click on parallel lines menu bar with data target value "#AwardReportPreparerFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Report Preparer"
    And I download the file
    Then I see "Report Preparer" on page "1" of "govgrants" pdf file

  @63052 @NotConverted @validateDownloasAsPDFForOpportunitiesListView @positive
  Scenario: verify download as pdf option at opportubities -not converted to application list view is working fine or not
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Opportunities" tab
    And I click toggle button to select "Opportunities - Not Converted to Application"
    When I click on parallel lines menu bar with data target value "#toggleFlexTableOpportunitysGrantee"
    And I select "Download as PDF" from parallel lines dropdown of "Opportunities - Not Converted to Application"
    And I download the file
    Then I see "Opportunities - Not Converted to Application" on page "1" of "govgrants" pdf file

  @62830 @validateDownloadAsPDFAtProgramsTable   @positive
  Scenario: Validate download as pdf option is working properly at Programs table on modal
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value "1" into field "fieldCloseDate__c"
    When I click on "Save and Continue" in the page details
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:RelatedPrograms}"
    When I click on parallel lines menu bar with data target value "#toggleFlexTableSelectFOALeadCFDA"
    And I select "Download as PDF" from parallel lines dropdown of "Programs"
    And I download the file
    Then I see "Programs" on page "1" of "govgrants" pdf file

  @63498 @TejalMarch2020 @validateDownloasAsPDFForPre-ApplicationListView   @positive
  Scenario: verify download as pdf option at Pre-Application list view is working fine or not
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#OpenGranteePreApplicationsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Pre-Application - All"
    And I download the file
    Then I see "Pre-Application - All" on page "1" of "govgrants" pdf file

  @61725 @validateListsOfFederalOrganizationAndPDFFileDownloadAtFederalOrganization @positive
  Scenario Outline: Validate organization lists are visisble to users at External organizations
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I softly see the text containing :
      | Federal Organizations     |
      | Non-Federal Organizations |
    When I click on parallel lines menu bar with data target value "#ExternalOrganizationHierarchyFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Federal Organizations"
    And I download the file
    Then I see "Federal Organizations" on page "1" of "govgrants" pdf file

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE DD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @62555 @validateListsOfNonFederalOrganizationAndPDFFileDownloadAtNonFederalOrganization @wip
  Scenario: Validate organization lists are visisble to users inside downloaded pdf file at External organizations
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I softly see the text containing :
      | Federal Organizations     |
      | Non-Federal Organizations |
    When I click on parallel lines menu bar with data target value "#NGOOrganizationHierarchyFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Non-Federal Organizations"
    And I download the file
    Then I see "Non-Federal Organizations" on page "1" of "govgrants" pdf file

  @62129 @validateDownloadPDFAtInternalContacts-myOrganizationContact  @positive
  Scenario: Validate download as pdf option at Internal contacts is getting downloaded properly with expected content
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contacts"
    When I click on parallel lines menu bar with data target value "#StateContactsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "My Organization’s Contacts"
    And I download the file
    Then I see "My Organization’s Contacts" on page "1" of "govgrants" pdf file

  @66577 @validateDownloadAsPDFAtGrantsTable  @positive
  Scenario: Validate download as pdf option at Grant - All list view and downloaded file should contains text Grants - All
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "{grantee_sidebar:GrantsLinkName}" content inside "{grantee_sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I click on parallel lines menu bar with data target value "#toggleFlexTableGranteeGrants"
    And I select "Download as PDF" from parallel lines dropdown of "Grants - All"
    And I download the file
    Then I see "Grants - All" on page "1" of "govgrants" pdf file

  @62020 @validateDownloadAsPDFAtInternalContact-myOrganizationContact  @positive
  Scenario: Validate My Organization’s Contacts lists are visisble to users in downloaded pfd file
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contacts"
    When I click on parallel lines menu bar with data target value "#StateContactsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "My Organization’s Contacts"
    And I download the file
    Then I see "My Organization’s Contacts" on page "1" of "govgrants" pdf file

  @62123 @KPI @validateKPIDownloadPDF @positive
  Scenario: Verify user can download PDF from KPI view page.
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
    When I navigate to "{grantee_sidebar:KPILinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime KPI}" in "{grantee_tableId:KPITable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    And I click on "Menu" in the page details
    And I select "Download As PDF" from dropdown
    And I download the file
    Then I see "Key Performance Indicator - {SavedValue:Automation Runtime KPI}" on page "1" of "govgrants" pdf file

  @62830 @validateDownloadAsPDFAtRelatedProgramTable @positive
  Scenario: Validate download as pdf option is working or not at related program table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value "1" into field "fieldCloseDate__c"
    When I click on "Save and Continue" in the page details
    When I click on parallel lines menu bar with data target value "#RelatedLeadCFDANumbersFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Related Programs"
    And I download the file
    Then I see "Related Programs" on page "1" of "govgrants" pdf file

  @62955 @verifyDownloadAsPDFOptionAtQualifiedLeadDetail  @positive
  Scenario: Validate content inside downloaded pdf file at Qualified lead detail page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I enter value "1" into field "fieldCloseDate__c"
    When I click on "Save and Continue" in the page details
    And I click on "Qualify Lead" in the page details
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
    When I pause execution for "5" seconds
    And I click on "Menu" in the page details
    And I select "Download As PDF" from dropdown
    And I download the file
    Then I see "Lead - AutomationDemoLead" on page "1" of "govgrants" pdf file

  @68998 @ValidateDownloadPDFFunctionalityAtReportPreparerPageBlockAtAmendedAward-PeopleSoft    @positive
  Scenario: verify user is able to download and see the content inside downloaded pdf file at Report preparer page block - AmendedAward-PeopleSoft
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
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{grantee_sidebar:AwardsBudgetPeriodLinkName}" content inside "{grantee_sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{grantee_tableId:AwardsTable}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{grantee_tableId:AwardsTable}"
    And I navigate to "Overview" sub tab
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "No" into field "fieldIsNOGAAttachedPicklist__c"
    When I enter value "Washington" into field "fieldPlace_of_Performance__c"
    And I click on "Save" in the page details
    And I click on "Edit" icon for "" inside flex table with id "---grantee_tableId:-:AwardRelatedApplicationTableId---"
    When I enter value "No" into field "fieldAwardrelatedapplication__c"
    And I click modal button "Save"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                   | Description                  |
      | Program Approver | GRANTEE ADMIN Username | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    Then I save the field labeled "EGMS ID" as "EID"
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:EID}" inside flex table with id "---grantee_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    Then I softly see field "Status" as "Active"
    And I create grants record:
      | grantTitle                                  | grantNumber | awardType | fainNumber              | amendmentType      | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | {SavedValue:Automation Runtime Grant Award} | 19AUTON     | Amendment | {SavedValue:fainNumber} | Budget Redirection | 0           | 365       | 0           | 365       |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    When I navigate to "{grantee_sidebar:GrantsLinkName}" content inside "{grantee_sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{grantee_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{grantee_tableId:GrantsTable}"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "{grantee_tableId:GrantsAwardsRevisionTableId}"
    And I navigate to "Roles" sub tab
    When I click on parallel lines menu bar with data target value "#AwardReportPreparerFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Report Preparer"
    And I download the file
    Then I see "Report Preparer" on page "1" of "govgrants" pdf file

  @68039 @ValidateDownloadPDFFunctionalityAtSpecialConditionPageBlock-Draft @smoke  @positive
  Scenario: verify user is able to download and see the content inside downloaded pdf file at special condition page block
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{grantee_sidebar:AwardsBudgetPeriodLinkName}" content inside "{grantee_sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I perform quick search for "Automation Testing Grants 1" in "{grantee_tableId:AwardsTable}" panel
    And I click on "View" icon for "Automation Testing Grants 1" inside flex table with id "{grantee_tableId:AwardsTable}"
    And I navigate to "Monitoring" sub tab
    When I click on parallel lines menu bar with data target value "#toggleFlexTableGranteeTermsandConditions"
    And I select "Download as PDF" from parallel lines dropdown of "Special Conditions"
    And I download the file
    Then I see "Special Conditions" on page "1" of "govgrants" pdf file

  @71681 @ValidateDownloadAsPDFFunctionalityWhileAssignApproversForProjectPeriodCloseout   @positive
  Scenario: verify download as pdf functionality while Assign Approvers for Project Period Closeout
    And I create grants record:
      | grantTitle                     | grantNumber | awardType | fainNumber | amendmentType | ppStartDate | ppEndDate | bpStartDate | bpEndDate |
      | Automation Runtime Grant Award | 19AUTON     | New       | TION       | NA            | -730        | -10       | -730        | -365      |
    And I create project record:
      | grantId                  | fainNumber              |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} |
    And I enter project budget details:
      | awardId                  | fainNumber              | fundCode |
      | {SavedValue:grantNumber} | {SavedValue:fainNumber} | 001      |
    And I execute batch file:
      | operationType | batchName  | recordName |
      | Batch         | PeopleSoft | null       |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "{grantee_sidebar:AwardsBudgetPeriodLinkName}" content inside "{grantee_sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Awards - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{grantee_tableId:AwardsTable}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{grantee_tableId:AwardsTable}"
    And I navigate to "Overview" sub tab
    When I enter value "0" into field "fieldAwardIssueDate__c"
    When I enter value "No" into field "fieldIsNOGAAttachedPicklist__c"
    When I enter value "Washington" into field "fieldPlace_of_Performance__c"
    And I click on "Save" in the page details
    And I click on "Edit" icon for "" inside flex table with id "---grantee_tableId:-:AwardRelatedApplicationTableId---"
    When I enter value "No" into field "fieldAwardrelatedapplication__c"
    And I click modal button "Save"
    And I navigate to "Roles" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                   | Description                  |
      | Program Approver | GRANTEE ADMIN Username | Automation Approval required |
    And I click on "Submit For Approval" in the page details
    And I save the field containing "EGMS ID" as "AwardID"
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardID}" inside flex table with id "---grantee_tableId:-:PendingTask---"
    When I select radio button "Approve" in the approval decision
    And I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "{grantee_sidebar:GrantsLinkName}" content inside "{grantee_sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Grant Award}" in "{grantee_tableId:GrantsTable}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Grant Award}" inside flex table with id "{grantee_tableId:GrantsTable}"
    And I navigate to "Closeout" sub tab
    And I click on top right button "Initiate Closeout" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter value "Early Completion" into field "fieldCloseoutTypeManual__c"
    When I enter value "Reason for the Project Period Closeout Request" into field "fieldReason__c"
    And I click on "Save and Continue" in the page details
    And I navigate to "Roles" sub tab
    When I click on parallel lines menu bar with data target value "#GrantorCloseoutRequestRolesAndResponsibilitiesFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Approvers"
    And I download the file
    Then I see "Approvers" on page "1" of "govgrants" pdf file

  @63146 @TejalMarch2020 @validateDownloasAsPDFForOpportunitiesListViewForAllInternalUsers @positive
  Scenario Outline: verify download as pdf option at opportubities - converted to application list view is working fine or not for all internal users
    Given I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Opportunities" tab
    And I click toggle button to select "Opportunities - Converted to Application"
    When I click on parallel lines menu bar with data target value "#toggleFlexTableOpportunitysGrantee"
    And I select "Download as PDF" from parallel lines dropdown of "Opportunities - Converted to Application"
    And I download the file
    Then I see "Opportunities - Converted to Application" on page "1" of "govgrants" pdf file
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE EXE   |
      | GRANTEE FO    |

  @63909 @TejalApril2020 @ValidateDownloadPDFFunctionalityForBudgetPeriodDetails  @positive
  Scenario: verify download pdf functionality for budget period details
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
    And I pause execution for "3" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
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
    When I enter value "-1" into field "fieldPreApplicationDueDate__c"
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name                 | Description |
      | Program Approver   | GRANTEE PM Username  | prdoh       |
      | Executive Approver | GRANTEE EXE Username | prdoh       |
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "DC - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "DC - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    When I click on parallel lines menu bar with data target value "#PreAppSABudgetPeriodSetupFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Budget Period Details"
    And I download the file
    Then I see "Budget Period Details" on page "1" of "govgrants" pdf file

  @63841 @TejalApril2020 @ValidateDownloadPDFFunctionalityForSelectBudgetPeriods   @positive
  Scenario: verify download pdf functionality for Select Budget Periods
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
    And I pause execution for "3" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
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
    When I enter value "-1" into field "fieldPreApplicationDueDate__c"
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name                 | Description |
      | Program Approver   | GRANTEE PM Username  | prdoh       |
      | Executive Approver | GRANTEE EXE Username | prdoh       |
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "DC - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "DC - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Setup" sub tab
    And I click on top right button "Associate Projects" in flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I click on parallel lines menu bar with data target value "#toggleFlexTableSelectBudgetPeriod1"
    And I select "Download as PDF" from parallel lines dropdown of "Select Budget Period(s)"
    And I download the file
    Then I see "Select Budget Period(s)" on page "1" of "govgrants" pdf file

  @63841 @TejalApril2020 @ValidateDownloadPDFFunctionalityForSelectProjects  @positive
  Scenario: verify download pdf functionality for Select Projects
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
    And I pause execution for "3" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
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
    When I enter value "-1" into field "fieldPreApplicationDueDate__c"
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name                 | Description |
      | Program Approver   | GRANTEE PM Username  | prdoh       |
      | Executive Approver | GRANTEE EXE Username | prdoh       |
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "DC - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "DC - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
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
    And I select "Download as PDF" from parallel lines dropdown of "Select Project"
    And I download the file
    Then I see "Select Project" on page "1" of "govgrants" pdf file

  @81201 @ValidateDownloadAsPDFFunctionalityForBudgetPeriodCloseout  @positive
  Scenario: verify download as pdf functionality for budget period closeout
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Closeout" tab
    When I navigate to "{grantee_sidebar:BudgetPeriodCloseoutLinkName}" content inside "{grantee_sidebar:CloseoutSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#BudgetPeriodCloseOutRequestFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Budget Period Closeout - All"
    And I download the file
    Then I see "Budget Period Closeout - All" on page "1" of "govgrants" pdf file

  @68278 @validateDownloadAsPDFAtAmendmentRequestTable @smoke   @positive
  Scenario: Validate download as pdf option at Amendment Request - All list view and downloaded file should contains text Amendment Request - All
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Grants" tab
    When I navigate to "{grantee_sidebar:AmendmentRequestLinkName}" content inside "{grantee_sidebar:GrantsAwardsAmendmentSubheaderName}" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I click on parallel lines menu bar with data target value "#GranteeAmendmentRequestsFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Amendment Requests - All"
    And I download the file
    Then I see "Amendment Requests - All" on page "1" of "govgrants" pdf file

  @63693 @TejalApril2020 @ValidateDownloadAsPDFFunctionalityForPeerReviewersInPreApplication  @positive
  Scenario: verify Download as PDF functionality for peer reviewers in pre application
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
    And I pause execution for "3" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save and Continue" in the page details
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
    When I enter value "-1" into field "fieldPreApplicationDueDate__c"
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name                 | Description |
      | Program Approver   | GRANTEE PM Username  | prdoh       |
      | Executive Approver | GRANTEE EXE Username | prdoh       |
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "DC - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "DC - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:PreApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PreApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PreApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:PreApplicationPeerReviewers}" by clicking "New" :
      | Reviewer Name       | Responsibility   | Description       | Due Date | Allow Record Editing |
      | GRANTEE PM Username | Program Reviewer | automation review | 1        | Yes                  |
    When I click on parallel lines menu bar with data target value "#GranteePreApplicationReviewersTempFlexToggle"
    And I select "Download as PDF" from parallel lines dropdown of "Peer Reviewers"
    And I download the file
    Then I see "Peer Reviewers" on page "1" of "govgrants" pdf file