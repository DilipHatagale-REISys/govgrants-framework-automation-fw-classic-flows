@Applications @Grantee-Application @grantee-regression @grantee-parallel-regression
Feature: Applications related scenarios
  Test all scenarios related to Applications

  @63216 @TejalMarch2020 @ValidateButtonsShouldNotBeDisplayedWhenOpportunityIsInConvertedToApplicationState
  Scenario: verify Buttons should not be displayed on details page when Opportunity is in Converted to Application Stateq
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit" in page detail

  @63216 @TejalMarch2020 @ValidateHeaderSection   @positive
  Scenario: Verify Header section
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I save the field labeled "Funding Opportunity Number" as "OpportunityNumber"
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Lead}" in the page details
    Then I softly see field "Funding Opportunity Number" as "{SavedValue:OpportunityNumber}"
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    Then I softly see field "Status" as "Converted to Application"
    Then I softly see field "Days Left" as "1"

  @63216 @TejalMarch2020 @ValidateSubTabsOnOpportunitiesConvertedToApplicationDetailPage  @positive
  Scenario: Verify opportunities converted to application detail page
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page

  @63216 @TejalMarch2020 @ValidateOverviewTabPageLayout   @positive
  Scenario: Verify overview tab page layout
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I navigate to "Overview" sub tab
    And I softly see the text containing :
      | Lead Information              |
      | Opportunity Information       |
      | Opportunity Specific Settings |
      | External Programs             |
      | Eligibility                   |
      | Additional Information        |
      | Financial Details             |
      | System Information            |

  @63216 @TejalMarch2020 @ValidateOverviewTabInformationSection   @positive
  Scenario: Verify overview tab Information section
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I navigate to "Overview" sub tab
    Then I softly see field "Internal Organization" as "Children’s Health Insurance Program"
    Then I softly see field "Budget Type" as "Non-Construction"
    Then I softly see field "Pre-Application Required" as "No"
    Then I softly see field "Letter of Intent Required" as "No"
    Then I softly see field "Number of Agencies that have Qualified this Lead" as "1"
    Then I softly see field "Funding Opportunity Title" as "{SavedValue:Automation Runtime Lead}"
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    Then I softly see field "Opportunity Category" as "Discretionary"
    Then I softly see field "Description" as "Lead created for Automation Testing"
    Then I softly see field "Award Ceiling" as "$30,000.00"
    Then I softly see field "Award Floor" as "$20,000.00"
    Then I softly see field "Estimated Total Program Funding" as "$50,000.00"
    Then I softly see field "Is Program Income Allowed" as "No"
    Then I softly see field "Are Indirect Costs Allowed?" as "No"
    Then I softly see field "Created by" as "{SavedValue:GRANTEE PM Username}"
    Then I softly see field "Last Modified by" as "{SavedValue:GRANTEE PM Username}"

  @63216 @TejalMarch2020 @ValidateEvaluationTabPageLayout   @positive
  Scenario: Verify evaluation tab page layout
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I navigate to "Evaluation" sub tab
    And I softly see the text containing :
      | Evaluation               |
      | Organizational Readiness |
      | Collaboration Details    |
      | Eligibility              |
      | Financial Overview       |
      | Certifications and Other |

  @63216 @TejalMarch2020 @ValidateViewEvaluationSection   @positive
  Scenario: Verify view Evaluation section
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I navigate to "Evaluation" sub tab
    Then I softly see field "Have we previously received an award from this sponsoring agency?" as "No"
    Then I softly see field "What is the estimated probability of receiving a grant award?" as "50%"
    Then I softly see field "Have other internal organizations within the Department qualified this lead?" as "No"

  @63216 @TejalMarch2020 @ValidateResponsibilitiesSubTabPageLayout  @positive
  Scenario: Verify responsibilities Sub tab page layout
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    And I softly see the text containing :
      | Peer Reviewers |
      | Approvers      |

  @63216 @TejalMarch2020 @ValidateAttachmentsSubTabPageLayout  @positive
  Scenario: Verify Attachments Sub tab page layout
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Files" sub tab
    And I softly see the text containing :
      | Application Files |
      | Notes             |

  @63216 @TejalMarch2020 @ValidateHistorySubTabPageLayout    @positive
  Scenario: Verify History Sub tab page layout
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "History" sub tab
    And I softly see the text containing :
      | Approval History   |
      | Field History      |
      | Submission History |
      | Snapshot History   |

  @64818 @TejalApril2020 @ValidateButtonsForApplicationWhichIsInDraftState  @positive
  Scenario: verify buttons for application which is in draft state
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    Then I softly can see top right button "Edit" in page detail
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Associate" in flex table with id "{grantee_tableId:ApplicationExternalProgramsTableId}"
    And I navigate to "Setup" sub tab
    Then I softly can see top right button "Create New Budget Period" in flex table with id "{grantee_tableId:ApplicationSetup}"
    Then I softly can see top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsTableIdApplication}"
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I navigate to "Files" sub tab
    Then I see the following top right buttons in table named "Attachments" :
      | Add Files |
    Then I see the following top right buttons in table named "Notes" :
      | Add |

  @64818 @TejalApril2020 @ValidateStatusAndActionFieldOnPeerReviewerTable   @positive
  Scenario: verify status and Action field on peer review table
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PO Username} | Fiscal Reviewer | Automation Description | 1        | Yes                  |
    Then I softly see value "Created" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly can see row level action button "Send for Review" against "Created" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PO Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly can see top right button "Complete Review" in page detail

  @65051 @TejalApril2020 @ValidateDeleteApplicationFunctionality   @positive
  Scenario: verify delete application functionaliy
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    Then I softly can see row level action button "Delete" against "Draft" in flex table with id "{grantee_tableId:Application}"
    When I click on "Delete" icon for "{SavedValue:Automation Runtime Lead}" inside table with table id "{grantee_tableId:Application}" without processing
    Then I softly see confirmation box with body "Are you sure you want to permanently delete the draft application?" is displayed
    When I click modal button "Yes"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:Application}"

  @65126 @TejalApril2020 @ValidateCreateFunctinalityForAnApplicationFromAPre-Application  @positive
  Scenario: verify Create an Application from a Pre-Application
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldProjectDirectorContact__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldFedBizOps__c"
    And I enter value "546787654" into field "fieldDUNS__c"
    And I enter value "NA" into field "fieldCounty__c"
    And I enter value "1st District" into field "fieldCongressionaldistrict__c"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactTableIdApplication}"
    And I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:ContactModalTableIdApplication}" panel
    And I check "{SavedValue:GRANTEE PM Username}" boxes in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I close modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsTableIdApplication}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationBudgetDetailsTableId}" by clicking "Edit" :
      | Category Name | Award Budget |
      | Personnel     | 25,000       |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationApprovers}" by clicking "Edit" :
      | Responsibility   | Name                              | Description         |
      | Program Approver | {SavedValue:GRANTEE PM Username}  | Grantee Application |
      | Fiscal Approver  | {SavedValue:GRANTEE EXE Username} | Grantee Application |
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedOn__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Record Decision" in the page details
    When I enter value "Accepted" into field "fieldDecision__c"
    And I click modal button "Save"
    When I click on "Create Application" in the page details
    When I enter value "49" into field "fieldProjectPeriodStartDate__c"
    When I enter value "199" into field "fieldProjectPeriodEndDate__c"
    When I enter value "{SavedValue:Automation Runtime Lead}" into field "fieldTitle__c"
    When I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldProjectDirectorContact__c"
    And I click on "Save and Continue" in the page details
    When I save the field labeled "Project Period Start Date" as "startdate"
    When I save the field labeled "Project Period End Date" as "enddate"
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Lead}"
    Then I softly see field "Project Period Start Date" as "startdate"
    Then I softly see field "Project Period End Date" as "enddate"
    Then I softly see field "Project Director/Principal Investigator" as "{SavedValue:GRANTEE PM Username}"
    Then I softly see field "Status" as "Draft"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    When I navigate to "Setup" sub tab
    Then I softly see field "Project Period Start Date" as "{SavedValue:startdate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:enddate}"
    When I navigate to "Overview" sub tab
    And I click "{SavedValue:GRANTEE PM Username}" lookup link
    Then I see the header is "Contact" in the page details
    Then I see the sub-header is "{SavedValue:GRANTEE PM Username}" in the page details

  @64885 @TejalApril2020 @ValidateAllTheValuesAvailableShouldBeCopiedOverFromTheOpportunityRecord  @positive
  Scenario: verify All the values available should be copied over from the opportunity record
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldProjectDirectorContact__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldFedBizOps__c"
    And I enter value "546787654" into field "fieldDUNS__c"
    And I enter value "NA" into field "fieldCounty__c"
    And I enter value "1st District" into field "fieldCongressionaldistrict__c"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactTableIdApplication}"
    And I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:ContactModalTableIdApplication}" panel
    And I check "{SavedValue:GRANTEE PM Username}" boxes in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I close modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsTableIdApplication}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationBudgetDetailsTableId}" by clicking "Edit" :
      | Category Name | Award Budget |
      | Personnel     | 25,000       |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationApprovers}" by clicking "Edit" :
      | Responsibility   | Name                              | Description         |
      | Program Approver | {SavedValue:GRANTEE PM Username}  | Grantee Application |
      | Fiscal Approver  | {SavedValue:GRANTEE EXE Username} | Grantee Application |
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedOn__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Record Decision" in the page details
    When I enter value "Accepted" into field "fieldDecision__c"
    And I click modal button "Save"
    When I click on "Create Application" in the page details
    And I click on "Save and Continue" in the page details
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Lead}"
    Then I softly see field "Opportunity Number" as "{SavedValue:FundingOppNumber}"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    Then I softly see field "Application Title" as "{SavedValue:PreApplicationTitle}"

  @64885 @TejalApril2020 @ValidateDefaultFilterForListAndSortingFunctionalityForAnApplication   @positive
  Scenario: verify  default filter for list and sorting functionality for an Application
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    Then I softly see the text containing :
      | Applications - All |
    When I click on "EGMS ID" column header inside table with id "{grantee_tableId:Application}"
    Then I softly see content of expected column "EGMS ID" is in "Ascending" order of table id "{grantee_tableId:Application}"
    When I click on "EGMS ID" column header inside table with id "{grantee_tableId:Application}"
    Then I softly see content of expected column "EGMS ID" is in "Descending" order of table id "{grantee_tableId:Application}"
    When I click on "Application Title" column header inside table with id "{grantee_tableId:Application}"
    Then I softly see content of expected column "Application Title" is in "Ascending" order of table id "{grantee_tableId:Application}"
    When I click on "Application Title" column header inside table with id "{grantee_tableId:Application}"
    Then I softly see content of expected column "Application Title" is in "Descending" order of table id "{grantee_tableId:Application}"
    When I click on "Funding Organization" column header inside table with id "{grantee_tableId:Application}"
    Then I softly see content of expected column "Funding Organization" is in "Ascending" order of table id "{grantee_tableId:Application}"
    When I click on "Funding Organization" column header inside table with id "{grantee_tableId:Application}"
    Then I softly see content of expected column "Funding Organization" is in "Descending" order of table id "{grantee_tableId:Application}"
    When I click on "Status" column header inside table with id "{grantee_tableId:Application}"
    Then I softly see content of expected column "Status" is in "Ascending" order of table id "{grantee_tableId:Application}"
    When I click on "Status" column header inside table with id "{grantee_tableId:Application}"
    Then I softly see content of expected column "Status" is in "Descending" order of table id "{grantee_tableId:Application}"

  @64818 @TejalApril2020 @ValidatePermissionForAllInternalOrganizationusersForViewApplication @positive
  Scenario Outline: verify Permission for all users for view Application
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    Then I softly see field "Application Title" as "{SavedValue:Automation Runtime Lead}"
    Then I softly can see top right button "Edit" in page detail
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    Then I softly see field "Application Title" as "{SavedValue:Automation Runtime Lead}"
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @64818 @TejalApril2020 @ValidateApplicationDetailsPage @positive
  Scenario: verify Application Details page
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    Then I see the header is "Application" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Lead}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:egmsid}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    Then I softly see field "Days left" as "1"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Setup" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Collab" sub tab at view detail page
    Then I softly see status in Progress-bar is "Created" and is "Green"

  @64818 @TejalApril2020 @ValidateOverviewSubTab   @positive
  Scenario: verify Overview sub tab
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    Then I softly see the text containing :
      | Opportunity Overview         |
      | Application Overview         |
      | External Programs            |
      | Project Abstract             |
      | Primary Place of Performance |
      | Contacts                     |
      | System Information           |
    And I save the field labeled "Opportunity Number" as "OpportunityNumber"
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Lead}"
    Then I softly see field "Opportunity Number" as "{SavedValue:OpportunityNumber}"
    Then I softly see field "Funding Organization" as "USDA-NRCS-NHO"
    Then I softly see field "Award Floor" as "$20,000"
    Then I softly see field "Award Ceiling" as "$30,000"
    Then I softly see field "Funding Organization Contact" as ""
    Then I softly see field "Lead URL" as "https://www.grants.gov/web/grants/view-opportunity.html?oppId="
    Then I softly see field "Application Title" as "{SavedValue:Automation Runtime Lead}"
    Then I softly see field "Total Budget Request" as "$0.00"
    Then I softly see field "DUNS" as ""
    Then I softly see field "EIN" as "384705988"
    Then I softly see field "Project Director/Principal Investigator" as ""
    Then I softly see field "Authorized Organization Representative (AOR)" as ""
    Then I softly see field "Project Abstract" as "Project Abstract"
    Then I softly see "Program Numbers" in flex table header "{grantee_tableId:ApplicationExternalProgramsTableId}"
    Then I softly see "Title" in flex table header "{grantee_tableId:ApplicationExternalProgramsTableId}"
    Then I softly see "Actions" in flex table header "{grantee_tableId:ApplicationExternalProgramsTableId}"

  @64818 @TejalApril2020 @ValidateSetupSubTab    @positive
  Scenario: verify setup and Budget sub tab
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Setup" sub tab
    Then I softly see the text containing :
      | Project Period        |
      | Budget Period Details |
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see "Budget Period #" in flex table header "{grantee_tableId:ApplicationSetup}"
    Then I softly see "Start Date" in flex table header "{grantee_tableId:ApplicationSetup}"
    Then I softly see "End Date" in flex table header "{grantee_tableId:ApplicationSetup}"
    Then I softly see "Actions" in flex table header "{grantee_tableId:ApplicationSetup}"
    When I expand nested table containing column value "BP01"
    Then I softly see "EGMS ID" in flex table header "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"
    Then I softly see "Project Name" in flex table header "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"
    Then I softly see "Internal Organization" in flex table header "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"
    When I navigate to "Budget" sub tab
    Then I softly see the text containing :
      | Budget Overview          |
      | Budget Details           |
      | Budget Level Information |
    Then I softly see field "Total Budget Request" as "$0.00"
    Then I softly see field "Total Project Cost" as "$0.00"
    Then I softly see field "Total Direct Cost" as "$0.00"
    Then I softly see field "Total Indirect Cost" as "$0.00"
    Then I softly see field "Total Match" as "$0.00"
    Then I softly see field "Maintenance of Effort Required?" as "No"
    Then I softly see field "Are Indirect Costs Allowed?" as "No"

  @64818 @TejalApril2020 @ValidateTemplateForBudgetPeriodDetails   @positive
  Scenario: verify template for Budget Period Details
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I click on "Edit" in the page details
    And I navigate to "Budget" sub tab
    When I enter value "Line Item Budget" into field "fieldBudgetLevel__c"
    And I click on "Save and Continue" in the page details
    Then I softly see field "Budget Level" as "Line Item Budget"
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Period #" in flex table header "{grantee_tableId:ApplicationBudgetDetailsTableId}"
    Then I softly see "Start Date" in flex table header "{grantee_tableId:ApplicationBudgetDetailsTableId}"
    Then I softly see "End Date" in flex table header "{grantee_tableId:ApplicationBudgetDetailsTableId}"
    When I expand nested table containing column value "BP01"
    Then I softly see "Category Name" in flex table header "{grantee_tableId:BudgetCategoryForLineItemBudget}"
    Then I softly see "Award Budget" in flex table header "{grantee_tableId:BudgetCategoryForLineItemBudget}"
    Then I softly see "Cash Match" in flex table header "{grantee_tableId:BudgetCategoryForLineItemBudget}"
    Then I softly see "Non-Cash Match" in flex table header "{grantee_tableId:BudgetCategoryForLineItemBudget}"
    Then I softly see "Total Project Cost" in flex table header "{grantee_tableId:BudgetCategoryForLineItemBudget}"

  @64818 @TejalApril2020 @ValidateChecklistAndResponsibilitiesSubTab @positive
  Scenario: verify checklist and responsibilities sub tab
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Checklist" sub tab
    Then I softly see field "1.a IT Requirements Comments" as ""
    Then I softly see field "2.a Space Requirements Comments" as ""
    Then I softly see field "3.a State specific forms Comments" as ""
    Then I softly see field "4.a Training Requirements Comments" as ""
    When I navigate to "Responsibilities" sub tab
    Then I softly see the text containing :
      | Peer Reviewers |
      | Approvers      |
    Then I softly see "Reviewer Name" in flex table header "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see "Responsibility" in flex table header "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see "Description" in flex table header "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see "Due Date" in flex table header "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see "Allow Record Editing" in flex table header "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see "Status" in flex table header "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see "Name" in flex table header "{grantee_tableId:ApplicationApprovers}"
    Then I softly see "Responsibility" in flex table header "{grantee_tableId:ApplicationApprovers}"
    Then I softly see "Description" in flex table header "{grantee_tableId:ApplicationApprovers}"
    Then I softly see "Actions" in flex table header "{grantee_tableId:ApplicationApprovers}"

  @64818 @TejalApril2020 @ValidateAttachmentsAndHistorySubTab   @positive
  Scenario: verify Attachments and History sub tab
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I navigate to "Files" sub tab
    Then I softly see the text containing :
      | Application Files |
      | Notes             |
    When I navigate to "History" sub tab
    Then I softly see the text containing :
      | Approval History   |
      | Field History      |
      | Submission History |
      | Snapshot History   |
    Then I see the following headers in table with id "{grantee_tableId:ApprovalHistory}" :
      | Date | Assigned To | Actual Approver | Comments | Status | Overall Status |
    Then I softly see "EGMS ID" in flex table header "{grantee_tableId:FieldHistory}"
    Then I softly see "Changed Field" in flex table header "{grantee_tableId:FieldHistory}"
    Then I softly see "New Value" in flex table header "{grantee_tableId:FieldHistory}"
    Then I softly see "Old Value" in flex table header "{grantee_tableId:FieldHistory}"
    Then I softly see "Changed By" in flex table header "{grantee_tableId:FieldHistory}"
    Then I softly see "Changed On" in flex table header "{grantee_tableId:FieldHistory}"

  @64818 @TejalApril2020 @ValidatePermissionToViewNotesAddedToApplication   @positive
  Scenario Outline: verify permission to view notes added to Application
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I navigate to "Files" sub tab
    And I add notes records
    And I close modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Automation Notes"
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Files" sub tab
    Then I softly see table with header "Notes" contains records "Automation Notes"
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @64818 @TejalApril2020 @ValidateToViewSubmitToGrantorAndReviseOption @positive
  Scenario: verify to View Submit To Grantor and revise Option
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldProjectDirectorContact__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldFedBizOps__c"
    And I enter value "546787654" into field "fieldDUNS__c"
    And I enter value "NA" into field "fieldCounty__c"
    And I enter value "1st District" into field "fieldCongressionaldistrict__c"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactTableIdApplication}"
    And I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:ContactModalTableIdApplication}" panel
    And I check "{SavedValue:GRANTEE PM Username}" boxes in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I close modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsTableIdApplication}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationBudgetDetailsTableId}" by clicking "Edit" :
      | Category Name | Award Budget |
      | Personnel     | 25,000       |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationApprovers}" by clicking "Edit" :
      | Responsibility   | Name                              | Description         |
      | Program Approver | {SavedValue:GRANTEE PM Username}  | Grantee Application |
      | Fiscal Approver  | {SavedValue:GRANTEE EXE Username} | Grantee Application |
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Submit to Grantor" in page detail

  @64913 @TejalApril2020 @ValidateCreateAndDeleteNewBudgetPeriodFunctionality   @positive
  Scenario: verify create new budget period functionality
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I navigate to "Setup" sub tab
    Then I see the following headers in table with id "{grantee_tableId:BudgetPeriodDetailsFromSetup}" :
      | Budget Period # | Start Date | End Date | Actions |
    And I click on "Edit" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I enter value "55" into field "fieldBudgetStartDate__c"
    When I enter value "65" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I save the field labeled "Start Date" as "StartDate"
    And I save the field labeled "End Date" as "EndDate"
    And I close modal by clicking the top right x button
    Then I softly see value "{SavedValue:StartDate}" for title "Start Date" inside table "{grantee_tableId:BudgetPeriodDetailsFromSetup}"
    Then I softly see value "{SavedValue:EndDate}" for title "End Date" inside table "{grantee_tableId:BudgetPeriodDetailsFromSetup}"
    And I click on "Delete" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetailsFromSetup}"
    And I perform quick search for "BP01" in "{grantee_tableId:BudgetPeriodDetailsFromSetup}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:BudgetPeriodDetailsFromSetup}"

  @64913 @TejalApril2020 @ValidateCreatingeMultipleBudgetPeriodsInBudgetPeriodDetailsSection  @positive
  Scenario: verify Creating multiple Budget Periods in Budget Period Details section
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I enter value "55" into field "fieldBudgetStartDate__c"
    When I enter value "65" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I save the field labeled "Start Date" as "StartDate"
    And I close modal by clicking the top right x button
    Then I softly see value "BP01" for title "Budget Period #" against the value "{SavedValue:StartDate}" inside table "{grantee_tableId:BudgetPeriodDetailsFromSetup}"
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromSetup}"
    And I pause execution for "5" seconds
    When I enter value "51" into field "fieldBudgetStartDate__c"
    When I enter value "54" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly see value "BP02" for title "Budget Period #" against the value "{SavedValue:StartDate}" inside table "{grantee_tableId:BudgetPeriodDetailsFromSetup}"

  @65288 @TejalApril2020 @ValidateSelectingMultipleBudgetPeriodsForSingleProject  @positive
  Scenario: verify selecting multiple budget periods for single project
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "Project Name" as "ProjectName1"
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area 2" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "Project Name" as "ProjectName2"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I enter value "55" into field "fieldBudgetStartDate__c"
    When I enter value "65" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I save the field labeled "Start Date" as "StartDate"
    And I close modal by clicking the top right x button
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromSetup}"
    And I pause execution for "5" seconds
    When I enter value "66" into field "fieldBudgetStartDate__c"
    When I enter value "75" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromSetup}"
    And I pause execution for "2" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I check "BP02" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectsModal}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectsModal}"
    Then I softly see "Projects added succesfully to Application." inside flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I expand nested table containing column value "BP01"
    Then I softly see value "{SavedValue:Automation Runtime Focus Area}" for title "Project Name" inside table "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"
    And I expand nested table containing column value "BP02"
    Then I softly see value "{SavedValue:Automation Runtime Focus Area}" for title "Project Name" inside table "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"

  @65288 @TejalApril2020 @ValidateSelectingMultipleProjectsForSingleBudgetPeriod
  Scenario: verify selecting multiple projects for single Budget Period
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "Project Name" as "ProjectName1"
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area 2" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "Project Name" as "ProjectName2"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I enter value "55" into field "fieldBudgetStartDate__c"
    When I enter value "65" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I save the field labeled "Start Date" as "StartDate"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromSetup}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:ProjectName1}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:ProjectName1}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I perform quick search for "{SavedValue:ProjectName2}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:ProjectName2}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    Then I softly see "Projects added succesfully to Application." inside flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I expand nested table containing column value "BP01"
    Then I softly see value "{SavedValue:ProjectName1}" for title "Project Name" inside table "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"
    Then I softly see value "{SavedValue:ProjectName2}" for title "Project Name" inside table "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"

  @65288 @TejalApril2020 @ValidateSelectingMultipleProjectsForMultipleBudgetPeriods
  Scenario: verify selecting multiple projects for multiple Budget Periods
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "Project Name" as "ProjectName1"
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area 2" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "Project Name" as "ProjectName2"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "BP01" inside flex table with id "{grantee_tableId:BudgetPeriodDetails}"
    When I enter value "55" into field "fieldBudgetStartDate__c"
    When I enter value "65" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I save the field labeled "Start Date" as "StartDate"
    And I close modal by clicking the top right x button
    And I click on top right button "Create New Budget Period" in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromSetup}"
    And I pause execution for "5" seconds
    When I enter value "66" into field "fieldBudgetStartDate__c"
    When I enter value "75" into field "fieldBudgetEndDate__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsFromSetup}"
    And I pause execution for "2" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I check "BP02" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:ProjectName1}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:ProjectName1}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I perform quick search for "{SavedValue:ProjectName2}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:ProjectName2}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    Then I softly see "Projects added succesfully to Application." inside flex table with id "{grantee_tableId:AssociateProjectsModal}"
    And I close modal by clicking the top right x button
    And I expand nested table containing column value "BP01"
    Then I softly see value "{SavedValue:ProjectName1}" for title "Project Name" inside table "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"
    Then I softly see value "{SavedValue:ProjectName2}" for title "Project Name" inside table "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"
    Then I softly can see row level action button "Remove" against "DC" in flex table with id "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"
    And I expand nested table containing column value "BP02"
    Then I softly see value "{SavedValue:ProjectName1}" for title "Project Name" inside table "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"
    Then I softly see value "{SavedValue:ProjectName2}" for title "Project Name" inside table "{grantee_tableId:ChildBudgetPeriodDetailsFromBudgetOfSetUp}"

  @66253 @TejalApril2020 @ValidateEnterFunctionalityForSummaryBudgetForAnApplication  @positive
  Scenario: verify Enter Summary Budget for an Application
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldProjectDirectorContact__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldFedBizOps__c"
    And I enter value "546787654" into field "fieldDUNS__c"
    And I enter value "NA" into field "fieldCounty__c"
    And I enter value "1st District" into field "fieldCongressionaldistrict__c"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactTableIdApplication}"
    And I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:ContactModalTableIdApplication}" panel
    And I check "{SavedValue:GRANTEE PM Username}" boxes in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I close modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsTableIdApplication}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationBudgetDetailsTableId}" by clicking "Edit" :
      | Category Name | Award Budget |
      | Personnel     | 25,000       |
    Then I softly see value "$25,000.00" for title "Award Budget" inside table "{grantee_tableId:ApplicationBudgetDetailsTableId}"
    And I refresh the page
    And I save the field labeled "Total Budget Request" as "TotalBudgetRequest"
    Then I softly see field "Total Budget Request" as "{SavedValue:TotalBudgetRequest}"

  @66260 @TejalApril2020 @ValidateEnterFunctionalityForLineItemBudgetForAnApplication  @positive
  Scenario: verify Enter Line Item Budget for an Application
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldProjectDirectorContact__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldFedBizOps__c"
    And I enter value "546787654" into field "fieldDUNS__c"
    And I enter value "NA" into field "fieldCounty__c"
    And I enter value "1st District" into field "fieldCongressionaldistrict__c"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactTableIdApplication}"
    And I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:ContactModalTableIdApplication}" panel
    And I check "{SavedValue:GRANTEE PM Username}" boxes in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I close modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsTableIdApplication}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationBudgetDetailsTableId}" by clicking "Edit" :
      | Category Name | Award Budget |
      | Personnel     | 25,000       |
    And I pause execution for "2" seconds
    And I expand nested table containing column value "BP01"
    And I perform quick search for "Travel" in "{grantee_tableId:BudgetCategoryForLineItemBudget}" panel
    Then I softly see value "$25,000.00" for title "Award Budget" inside table "{grantee_tableId:BudgetCategoryForLineItemBudget}"
    Then I softly see value "$25,000.00" for title "Total Project Cost" inside table "{grantee_tableId:BudgetCategoryForLineItemBudget}"
    And I refresh the page
    And I save the field labeled "Total Budget Request" as "totalbudgetrequest"
    Then I softly see field "Total Budget Request" as "{SavedValue:totalbudgetrequest}"

  @65321 @TejalApril2020 @ValidateRequiredFieldsOnSaveAndEditableFieldsForPeerReview
  Scenario: verify required fields on save and editable fields for peer review
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see ":Program Reviewer:Fiscal Reviewer:" inside selectbox field "ReviewerRole__c"
    And I click on top right button "Save" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see "Required Field Missing" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    When I refresh the page
    And I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    Then I softly see value "{SavedValue:GRANTEE PM Username}" for title "Reviewer Name" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Yes" for title "Allow Record Editing" inside table "{grantee_tableId:ApplicationPeerReview}"
    And I click on top right button "New" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "Name__c"
    And I pause execution for "4" seconds
    Then I softly see "{SavedValue:GRANTEE PM Username}" inside auto search result

  @65321 @TejalApril2020 @ValidateEditAndDeleteFunctionalityForPeerReviewers  @positive
  Scenario: verify edit and delete functionality for peer reviewers
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    Then I softly see "Saved Successfully!" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "Edit" :
      | Responsibility  | Reviewer Name                    | Description        |
      | Fiscal Reviewer | {SavedValue:GRANTEE PO Username} | Edited Description |
    And I pause execution for "2" seconds
    Then I softly see value "{SavedValue:GRANTEE PO Username}" for title "Reviewer Name" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Edited Description" for title "Description" inside table "{grantee_tableId:ApplicationPeerReview}"
    And I click on "Delete" icon for "{SavedValue:GRANTEE PO Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I perform quick search for "{SavedValue:GRANTEE PO Username}" in "{grantee_tableId:ApplicationPeerReview}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"

  @65321 @TejalApril2020 @ValidateAddFunctionalityForMultipleProgramAndFiscalReviewers
  Scenario: verify add functionality for multiple program and fiscal reviewers
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FD Username} | Program Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FD Username} | Fiscal Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    Then I softly see value "Program Reviewer" for title "Responsibility" against the value "{SavedValue:GRANTEE FD Username}" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Fiscal Reviewer" for title "Responsibility" against the value "{SavedValue:GRANTEE FD Username}" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Program Reviewer" for title "Responsibility" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Fiscal Reviewer" for title "Responsibility" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:ApplicationPeerReview}"

  @66531 @TejalApril2020 @ValidateActionsAfterClickOnSendForReviewIconForProgramReviewerWhoIsNotTheRecordOwner  @positive
  Scenario: verify actions after Click on send for review icon for program reviewer who is not the record owner
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I save the field labeled "Application Title" as "ApplicationTitle"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FD Username} | Fiscal Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FD Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I pause execution for "2" seconds
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:ApplicationTitle}" for title "Subject" inside table "{grantee_tableId:PendingTask}"
    Then I softly see value "{SavedValue:GRANTEE PM Username}" for title "Assigned By" inside table "{grantee_tableId:PendingTask}"
    When I click on "{SavedValue:GRANTEE PM Username}" icon for "{SavedValue:Automation Runtime Lead}" inside table
    Then I softly see field "Title" as "Automation Program Manager"

  @66531 @TejalApril2020 @ValidateActionsAfterClickOnSendForReviewButtonForReviewerWhoIsFromADifferentOrganization  @positive
  Scenario: verify actions after Click on send for review button for program/fiscal reviewer who is from a different organization.
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                     | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM1 Username} | Fiscal Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM1 Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I pause execution for "2" seconds
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I re-login to "As a Grantee" app as "GRANTEE PM1" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66531 @TejalApril2020 @ValidateClickFunctionalityForSendForReviewIconForMultipleProgramAndFiscalReviewers
  Scenario: verify Click functionality for send for review icon for multiple Program and Fiscal reviewer(s)
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I pause execution for "2" seconds
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see field "Status" as "Submitted for Review"
    When I refresh the page
    And I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I pause execution for "2" seconds
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see field "Status" as "Submitted for Review"
    When I refresh the page
    And I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PO Username} | Fiscal Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PO Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I pause execution for "2" seconds
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see field "Status" as "Submitted for Review"
    When I refresh the page
    And I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PO Username} | Program Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PO Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I pause execution for "2" seconds
    Then I softly see "Review Successfully Initiated." inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66531 @TejalApril2020 @ValidateResendForReviewFunctionalityForReviewerWhoIsNotARecordOwner  @positive
  Scenario: verify resend for review functionality for reviewer who is not a record owner
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FD Username} | Program Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FD Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    And I click modal button "Submit Review"
    And I pause execution for "2" seconds
    And I close modal by clicking the top right x button
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Resend for Review" icon for "Review Completed" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66531 @TejalApril2020 @ValidateResendForReviewFunctionalityForReviewerWhoIsARecordOwner  @positive
  Scenario: verify resend for review functionality for reviewer who is a record owner
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    And I click modal button "Submit Review"
    And I pause execution for "2" seconds
    And I close modal by clicking the top right x button
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Resend for Review" icon for "Review Completed" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Sent for Review" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66535 @TejalApril2020 @ValidateEnterReviewFunctionalityForAnApplication  @positive
  Scenario: verify Enter review functionality for an application
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I pause execution for "5" seconds
    And I save the field labeled "Rating" as "rating"
    And I save the field labeled "Comments" as "comments"
    And I close modal by clicking the top right x button
    Then I softly see value "In Progress" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"
    When I expand nested table containing column value "{SavedValue:GRANTEE PM Username}"
    Then I softly see value "{SavedValue:rating}" for title "Rating" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "{SavedValue:comments}" for title "Comments" inside table "{grantee_tableId:ApplicationPeerReview}"
    And I click on "View" icon for "{SavedValue:reviewdate}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    When I click modal button "Edit"
    And I enter value "Failed" into field "fieldRating__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click modal button "Submit Review"
    And I pause execution for "2" seconds
    Then I softly see the text "Review successfully submitted"
    And I close modal by clicking the top right x button
    And I pause execution for "2" seconds
    Then I softly see value "Failed" for title "Rating" inside table "{grantee_tableId:ApplicationPeerReview}"
    Then I softly see value "Review Completed" for title "Status" inside table "{grantee_tableId:ApplicationPeerReview}"

  @66535 @TejalApril2020 @ValidateCompleteReviewFunctionalityWhenTheRecordLevelStatusForAssignedReviewerIsSentForReview  @positive
  Scenario: verify complete review functionality when the record level status for assigned reviewer(s) is Sent for Review
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:ApplicationPeerReview}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description            | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | Automation Description | 1        | Yes                  |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:ApplicationPeerReview}"
    And I pause execution for "5" seconds
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly cannot see row level action button "Delete" against "Sent for Review" in flex table with id "{grantee_tableId:ApplicationPeerReview}"
    Then I softly cannot see row level action button "Send for Review" against "Sent for Review" in flex table with id "{grantee_tableId:ApplicationPeerReview}"

  @65395 @TejalApril2020 @ValidateAddApproversToApplicationFunctionality  @positive
  Scenario: verify Add Approvers to Application functionality
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Program Approver" for title "Responsibility" inside table "{grantee_tableId:ApplicationApprovers}"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationApprovers}" by clicking "Edit" :
      | Responsibility   | Name                             | Description         |
      | Program Approver | {SavedValue:GRANTEE PM Username} | Grantee Applictaion |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "{SavedValue:GRANTEE PM Username}" for title "Name" inside table "{grantee_tableId:ApplicationApprovers}"
    And I click on "Edit" icon for "Fiscal Approver" inside flex table with id "{grantee_tableId:ApplicationApprovers}"
    Then I softly can see top right button "Save" in flex table with id "{grantee_tableId:ApplicationApprovers}"
    And I enter value "{SavedValue:GRANTEE PO Username}" into field "Name__c"
    And I pause execution for "8" seconds
    Then I softly see "{SavedValue:GRANTEE PO Username}" inside auto search result

  @65781 @TejalApril2020 @ValidateSubmitAndApproveFunctionalityForAnApplication   @positive
  Scenario: verify Submit and approve functionality for an Application
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldProjectDirectorContact__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldFedBizOps__c"
    And I enter value "546787654" into field "fieldDUNS__c"
    And I enter value "NA" into field "fieldCounty__c"
    And I enter value "1st District" into field "fieldCongressionaldistrict__c"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactTableIdApplication}"
    And I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:ContactModalTableIdApplication}" panel
    And I check "{SavedValue:GRANTEE PM Username}" boxes in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I close modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsTableIdApplication}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationBudgetDetailsTableId}" by clicking "Edit" :
      | Category Name | Award Budget |
      | Personnel     | 25,000       |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationApprovers}" by clicking "Edit" :
      | Responsibility   | Name                              | Description         |
      | Program Approver | {SavedValue:GRANTEE PM Username}  | Grantee Application |
      | Fiscal Approver  | {SavedValue:GRANTEE EXE Username} | Grantee Application |
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Approved"

  @65399 @TejalApril2020 @ValidateActionsAfterClickOnSubmitToGrantorButton @wip @BugLoggedWith78727   @positive
  Scenario: verify actions after click on Submit To Grantor Button
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldProjectDirectorContact__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldFedBizOps__c"
    And I enter value "546787654" into field "fieldDUNS__c"
    And I enter value "NA" into field "fieldCounty__c"
    And I enter value "1st District" into field "fieldCongressionaldistrict__c"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactTableIdApplication}"
    And I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:ContactModalTableIdApplication}" panel
    And I check "{SavedValue:GRANTEE PM Username}" boxes in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I close modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsTableIdApplication}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationBudgetDetailsTableId}" by clicking "Edit" :
      | Category Name | Award Budget |
      | Personnel     | 25,000       |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationApprovers}" by clicking "Edit" :
      | Responsibility   | Name                              | Description         |
      | Program Approver | {SavedValue:GRANTEE PM Username}  | Grantee Application |
      | Fiscal Approver  | {SavedValue:GRANTEE EXE Username} | Grantee Application |
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedOn__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly can see top right button "Record Decision" in page detail
    Then I softly can see top right button "Revise" in page detail
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I pause execution for "2" seconds
    And I click toggle button to select "Applications - Submitted"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:Automation Runtime Lead}" inside table "{grantee_tableId:Application}"

  @65424 @TejalApril2020 @ValidateActionsOnRecordDecisionButtonForAnApplication @positive
  Scenario: verify actions on record decision button for an application
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldProjectDirectorContact__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldFedBizOps__c"
    And I enter value "546787654" into field "fieldDUNS__c"
    And I enter value "NA" into field "fieldCounty__c"
    And I enter value "1st District" into field "fieldCongressionaldistrict__c"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactTableIdApplication}"
    And I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:ContactModalTableIdApplication}" panel
    And I check "{SavedValue:GRANTEE PM Username}" boxes in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I close modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsTableIdApplication}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationBudgetDetailsTableId}" by clicking "Edit" :
      | Category Name | Award Budget |
      | Personnel     | 25,000       |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationApprovers}" by clicking "Edit" :
      | Responsibility   | Name                              | Description         |
      | Program Approver | {SavedValue:GRANTEE PM Username}  | Grantee Application |
      | Fiscal Approver  | {SavedValue:GRANTEE EXE Username} | Grantee Application |
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedOn__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Record Decision" in the page details
    When I enter value "Awarded" into field "fieldDecision__c"
    And I enter value "Awarded Decision" into field "fieldRejectionComments__c"
    And I click modal button "Save"
    And I close modal by clicking the top right x button
    Then I softly see field "Status" as "Awarded"
    Then I softly can see top right button "Create Award" in page detail
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I pause execution for "2" seconds
    And I click toggle button to select "Applications - Submitted"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    Then I softly see value "Awarded" for title "Status" against the value "{SavedValue:Automation Runtime Lead}" inside table "{grantee_tableId:Application}"

  @65476 @TejalApril2020 @ValidateActionsOnReviseButtonForAnApplication @positive
  Scenario: verify actions on revise button for an application
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
    And I pause execution for "2" seconds
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:ProjectsLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:GranteeProjectTableId}"
    And I enter value "Automation Runtime Focus Area" into field "fieldTitle__c"
    And I enter value "Automation Description" into field "fieldDescription__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    When I enter value "Project Abstract Value" into field "fieldProjectAbstract__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldProjectDirectorContact__c"
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "fieldFedBizOps__c"
    And I enter value "546787654" into field "fieldDUNS__c"
    And I enter value "NA" into field "fieldCounty__c"
    And I enter value "1st District" into field "fieldCongressionaldistrict__c"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactTableIdApplication}"
    And I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:ContactModalTableIdApplication}" panel
    And I check "{SavedValue:GRANTEE PM Username}" boxes in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:ContactModalTableIdApplication}"
    And I close modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "{grantee_tableId:BudgetPeriodDetailsTableIdApplication}"
    And I pause execution for "3" seconds
    And I check "BP01" boxes in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I pause execution for "2" seconds
    And I click on top right button "Next" in flex table with id "{grantee_tableId:AssociateFocusAreaModalTableId}"
    And I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "{grantee_tableId:AssociateProjectModal2}" panel
    And I check "{SavedValue:Automation Runtime Focus Area}" boxes in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I click on top right button "Associate" in flex table with id "{grantee_tableId:AssociateProjectModal2}"
    And I close modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationBudgetDetailsTableId}" by clicking "Edit" :
      | Category Name | Award Budget |
      | Personnel     | 25,000       |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:ApplicationApprovers}" by clicking "Edit" :
      | Responsibility   | Name                              | Description         |
      | Program Approver | {SavedValue:GRANTEE PM Username}  | Grantee Application |
      | Fiscal Approver  | {SavedValue:GRANTEE EXE Username} | Grantee Application |
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "{grantee_sidebar:ApplicationLinkName}" content inside "{grantee_sidebar:ApplicationSubheaderName}" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:Application}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:Application}"
    And I click on "Submit to Grantor" in the page details
    When I enter value "0" into field "fieldSubmittedOn__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click on "Revise" in the page details
    And I click on "Save" in the page details
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail