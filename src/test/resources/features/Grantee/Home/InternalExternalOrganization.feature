@Grantee-InternalExternalOrganization @grantee-regression @grantee-parallel-regression
Feature:Internal organization related scenarios
  Test all scenarios related to Internal organization

  @61962 @validateInternalLoginForProductGrantee @smoke @positive
  Scenario Outline: User enters correct username and password to login and reaches homepage
    When I login to "As a Grantor" app as "<userType>" user
    Then I am logged in
    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @61682 @validateRelatedLogsSubTabDetailsForInternalOrganizations @smoke @positive
  Scenario: Validate Related Logs sub tab details for internal organizations detail page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I navigate to "Related Log" sub tab
    Then I softly see the text containing :
      | Qualified Leads |
      | Opportunities   |
      | Applications    |
      | Grants          |

  @61682 @validateQuickSearchIsWorkingOrNotAtRelatedLogsSubTab @smoke @positive
  Scenario: Validate search is working properly for valid and invalid input value at Internal organization table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    And I pause execution for "2" seconds
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
    When I click on "Save" in the page details
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:RelatedLogsQualifiedLeadsTableId}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Title" inside table "{grantee_tableId:RelatedLogsQualifiedLeadsTableId}"
    When I perform quick search for "Invalid {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:RelatedLogsQualifiedLeadsTableId}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:RelatedLogsQualifiedLeadsTableId}"

  @61682 @validateAdvanceSearchIsWorkingOrNotAtRelatedLogSubTab @positive
  Scenario: Validate advance search is working or not for correct and incorrect value at qualified lead table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    When I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    When I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    And I click on "Qualify Lead" in the page details
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    And I save the field labeled "EGMS ID" as "EID"
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I navigate to "Related Log" sub tab
    When I click on advance filter "#advfAgencyQualifiedLeadsRelated" of table id "{grantee_tableId:RelatedLogsQualifiedLeadsTableId}"
    When I enter advance filter values inside id "advfAgencyQualifiedLeadsRelated"
      | EGMS ID | contains | {SavedValue:EID} |
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Title" inside table "{grantee_tableId:RelatedLogsQualifiedLeadsTableId}"
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I navigate to "Related Log" sub tab
    When I click on advance filter "#advfAgencyQualifiedLeadsRelated" of table id "{grantee_tableId:RelatedLogsQualifiedLeadsTableId}"
    When I enter advance filter values inside id "advfAgencyQualifiedLeadsRelated"
      | EGMS ID | contains | Invalid{SavedValue:EID} |
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:RelatedLogsQualifiedLeadsTableId}"

  @61682 @validateViewOfAllPageBlocksForRelatedLogsSubTab @positive
  Scenario: Validate page detail view for all page blocks at related logs sub tab at Internal Program table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    When I enter "LeadsCreation" values from "Field_Values.xlsx"
    And I enter opportunity value "OP-" into field "fieldOpportunityNumber__c"
    And I click modal button "Save and Continue"
    When I enter value "Other" into field "fieldOpportunityCategory__c"
    When I enter value "Other" into field "fieldFundingInstrumentType__c"
    When I enter value "Education" into field "fieldCategoryOfFundingActivity__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EID"
    And I click on "Activate" in the page details
    And I pause execution for "2" seconds
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
    And I click on "Edit" in the page details
    When I enter "OpportunityDetails" values from "Field_Values.xlsx"
    When I enter value "50%" into field "fieldProbabilityofWinningreceivingaGrant__c"
    And I navigate to "Overview" sub tab
    When I enter value "No" into field "fieldPreApplicationNeeded__c"
    And I pause execution for "2" seconds
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name                              | Description |
      | Program Approver   | {SavedValue:GRANTEE PM Username}  | prdoh       |
      | Executive Approver | {SavedValue:GRANTEE EXE Username} | prdoh       |
      | Fiscal Approver    | {SavedValue:GRANTEE FO Username}  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I save the field labeled "EGMS ID" as "egmsid"
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpenQualifiedTable}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpenQualifiedTable}"
    And I pause execution for "3" seconds
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Lead}" in the page details

  @61682 @validateRefreshAtInternalProgramsUnderRelatedLogForInternalOrganizations @positive
  Scenario: Validate Refresh option at Internal Program page block is working properly as expected
    Given I login as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I navigate to "Related Log" sub tab
    When I click on parallel lines menu bar with data target value "#AgencyQualifiedLeadsRelatedFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Qualified Leads"
    Then I see table is refreshing

  @61676 @validateEditSaveFunctionalityAtViewDetailPageForInternalOrganizations @positive
  Scenario: Validate at view detail page for internal organizations edit and save functionality is working correctly with admin user.
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Test Automation Organization" in the page details
    Then I softly see field "Organization Type" as "Agency"
    When I click "GMS Administrator" lookup link
    And I softly see the text containing :
      | Overview    |
      | Related Log |
      | Attachments |
      | Collab      |
    When I click on "Edit" in the page details
    When I enter value "121 Nelson Drive" into field "fieldBillingStreet"
    When I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly see field "Street" as "121 Nelson Drive"

  @61676 @validateEditFunctionalityOfInternalOrganizationsWithDifferentUsers
  Scenario Outline: Validate mentioned users can not edit internal organizations detail page
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | userType    |
      | GRANTEE PM  |
      | GRANTEE PO  |
      | GRANTEE FD  |
      | GRANTEE FO  |
      | GRANTEE EXE |

  @61659 @validateQuickSearchIsWorkingForCorrectValueAtViewOfInternalOrganizationTable @positive
  Scenario: Validate quick search is working or not for correct search value at internal organizations table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    Then I softly see value "Test Automation Organization" for title "Operational Unit" inside table "{grantee_tableId:InternalOrganizations}"
    When I perform quick search for "Test Record" in "{grantee_tableId:InternalOrganizations}" panel
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:InternalOrganizations}"

  @61659 @validateAdvanceSearchIsWorkingForIncorrectValueAtViewOfInternalOrganizationTable
  Scenario: Validate advance search is working or not for incorrect search value at internal organizations table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on advance filter "#advfInternalOrganizationHierarchy1" of table id "{grantee_tableId:InternalOrganizations}"
    When I enter advance filter values inside id "advfInternalOrganizationHierarchy1"
      | Operational Unit | contains | Test Automation Organization |
    Then I softly see value "Test Automation Organization" for title "Operational Unit" inside table "{grantee_tableId:InternalOrganizations}"
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on advance filter "#advfInternalOrganizationHierarchy1" of table id "{grantee_tableId:InternalOrganizations}"
    When I enter advance filter values inside id "advfInternalOrganizationHierarchy1"
      | Operational Unit | contains | Invalid Test Automation Organization |
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:InternalOrganizations}"

  @61659 @validateRefreshOptionIsWorkingOrNotAtInternalOrganizationTable @positive
  Scenario: Validate internal organization table is getting refresh with Refresh dropdown option click at internal organizations table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#InternalOrganizationHierarchy1FlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Internal Organization Hierarchy"
    Then I see table is refreshing

  @61659 @validateTotalRecordCountAtInternalOrganizationTable @positive @wip
  Scenario: Validate total records count is displayed as number of records in internal organization table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    Then I see total records count is same as total row of table id "{grantee_tableId:InternalOrganizations}" on click "Next"

  @61748 @validateContactViewFunctionalityAtInternalOrganizations @smoke @positive
  Scenario Outline: Validate contact view detail page with multiple users at internal organizations
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    And I navigate to "Overview" sub tab
    When I perform quick search for "{SavedValue:GRANTEE FO Username}" in "{grantee_tableId:RelatedContacts}" panel
    When I click on "View" icon for "{SavedValue:GRANTEE FO Username}" inside table
    When I click "Test Automation Organization" lookup link
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Test Automation Organization" in the page details

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @61752 @validateVisibilityOfDeleteIconforActiveAndNonActiveEgmsUserAtInternalOrganizations @smoke @positive
  Scenario: Validate delete icon is visible for active non avtive contacts at intenal organizations
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contact"
    And I pause execution for "2" seconds
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    And I close modal by clicking the top right x button
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    And I navigate to "Overview" sub tab
    When I perform quick search for "AutomationUser" in "{grantee_tableId:RelatedContacts}" panel
    Then I softly can see row level action button "Delete" against "AutomationUser" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I perform quick search for "{SavedValue:GRANTEE PO Username}" in "{grantee_tableId:RelatedContacts}" panel
    Then I softly can see row level action button "Delete" against "{SavedValue:GRANTEE PO Username}" in flex table with id "{grantee_tableId:RelatedContacts}"

  @61752 @validateDeletionOfActiveAndNonActiveContactFromRelatedContactsAtInternalOrganizations @positive
  Scenario: Validate contact deletion from related contacts for Active nonActive contacts at internal organizations
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contact"
    And I pause execution for "2" seconds
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    And I close modal by clicking the top right x button
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    And I navigate to "Overview" sub tab
    When I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:RelatedContacts}" panel
    When I click on "Delete" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:RelatedContacts}"
    Then I softly see the following messages in the page details contains:
      | You cannot delete this contact as it is associated with other records. |
    When I perform quick search for "AutomationUser" in "{grantee_tableId:RelatedContacts}" panel
    When I click on "Delete" icon for "AutomationUser" inside flex table with id "{grantee_tableId:RelatedContacts}"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

  @61741 @validateRelatedContactsListViewAtInternalOrganizations @smoke @positive
  Scenario Outline: Validate related contacts list view for internal organizations detail page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    Then I see "<fieldDisplayNames>" in flex table header "{grantee_tableId:RelatedContacts}"

    Examples:
      | fieldDisplayNames |
      | Full Name         |
      | Title             |
      | Email             |
      | Office Phone      |
      | Is User           |

  @61741 @validateSearchIsWorkingOrNotAtRelatedContactsTable @positive
  Scenario: Validate related contacts search is working or not  with case sensitive at related contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I perform quick search for "{SavedValue:GRANTEE EXE Username}" in "{grantee_tableId:RelatedContacts}" panel
    Then I softly see value "{SavedValue:GRANTEE EXE Username}" for title "Full Name" inside table "{grantee_tableId:RelatedContacts}"
    When I perform quick search for "Invalid {SavedValue:GRANTEE EXE Username}" in "{grantee_tableId:RelatedContacts}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:RelatedContacts}"

  @61741 @validateAdvanceFilterSearchIsWorkingForAtRelatedContactTable @positive
  Scenario: Validate advance search is working or not for correct incorrect search value at Related contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I click on advance filter "#advfGranteeContactsByInternalAccount" of table id "{grantee_tableId:RelatedContacts}"
    When I enter advance filter values inside id "advfGranteeContactsByInternalAccount"
      | Full Name | contains | {SavedValue:GRANTEE EXE Username} |
    Then I softly see value "{SavedValue:GRANTEE EXE Username}" for title "Full Name" inside table "{grantee_tableId:RelatedContacts}"
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I click on advance filter "#advfGranteeContactsByInternalAccount" of table id "{grantee_tableId:RelatedContacts}"
    When I enter advance filter values inside id "advfGranteeContactsByInternalAccount"
      | Full Name | contains | Invalid {SavedValue:GRANTEE EXE Username} |
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:RelatedContacts}"

  @61741 @validatePaginationFunctionalityIsWorkingOrNotAtRealtedContactsTable @positive @wip @notrequired
  Scenario: Validate pagination arrow is working fine at Related contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    And I click on page navigation arrow "{grantee_tableId:RelatedContacts}" for table id "Next"
    Then I see table "{grantee_tableId:RelatedContacts}" shows "Page 2 of 2"

  @61741 @validateShowEntriesDropdownFunctionalityIsWorkingOrNotAtRealtedContactsTable @positive @wip @notrequired
  Scenario: Validate show entries dropdown is working fine at Related contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    And I select value inside table "{grantee_tableId:RelatedContacts}" is "5"
    Then I see "5" records inside flex table id "{grantee_tableId:RelatedContacts}"

  @61741 @validateDefaultEntriesAtRelatedContactsTable @positive
  Scenario: Validate default count of records at Related contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    Then I see default record count of table "{grantee_tableId:RelatedContacts}" is as expected

  @61741 @validateTotalRecordsAtRelatedContactsTable @positive @wip @notrequired
  Scenario: Validate total records inside table is equal to total number of records present inside Related contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    And I select value inside table "{grantee_tableId:RelatedContacts}" is "All"
    Then I see total records count in flex table "{grantee_tableId:RelatedContacts}"

  @61741 @validateSortingOfColumnAtRelatedContactTableOfInternalOrganization @positive
  Scenario: Validate columns of federal organization table is getting sorted in ascending order on column click
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I click on "Full Name" column header inside table with id "{grantee_tableId:RelatedContacts}"
    Then I softly see content of expected column "Full Name" is in "Ascending" order of table id "{grantee_tableId:RelatedContacts}"
    When I click on "Full Name" column header inside table with id "{grantee_tableId:RelatedContacts}"
    Then I softly see content of expected column "Full Name" is in "Descending" order of table id "{grantee_tableId:RelatedContacts}"
    And I refresh the page
    When I click on "Title" column header inside table with id "{grantee_tableId:RelatedContacts}"
    Then I softly see content of expected column "Title" is in "Ascending" order of table id "{grantee_tableId:RelatedContacts}"
    When I click on "Title" column header inside table with id "{grantee_tableId:RelatedContacts}"
    Then I softly see content of expected column "Title" is in "Descending" order of table id "{grantee_tableId:RelatedContacts}"
    And I refresh the page
    When I click on "Email" column header inside table with id "{grantee_tableId:RelatedContacts}"
    Then I softly see content of expected column "Email" is in "Ascending" order of table id "{grantee_tableId:RelatedContacts}"
    When I click on "Email" column header inside table with id "{grantee_tableId:RelatedContacts}"
    Then I softly see content of expected column "Email" is in "Descending" order of table id "{grantee_tableId:RelatedContacts}"

  @61746 @validateAddingOfContactWithOrWithoutMandatoryFieldsAtInternalOrganizations @smoke
  Scenario: Validate contact related contacts for Active nonActive contacts at internal organizations
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Last Name : You must enter a value |
    And I refresh the page
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I enter value "automationtest" into field "fieldEmail"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Last Name : You must enter a value |
      | Email : Invalid Email Address.     |
    And I refresh the page
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I enter "ContactCreationDuplicateEmail" values from "Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |
    And I refresh the page
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I enter "ContactCreationWithInvalidPhone" values from "Field_Values.xlsx"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter Valid Phone Number |
      | Please Enter 5 Digit ZipCode    |
    And I refresh the page
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I enter "ContactCreationInvalidAddress" values from "Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Street:Data value too large. (max length=255) |

  @61746 @validateAddingOfContactWithDifferentUsers @positive
  Scenario Outline: Validate addition of contact with different users at internal organizations
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    And I click on top right button "New" in flex table with id "{grantee_tableId:RelatedContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I click modal button "Save"
    And I close modal by clicking the top right x button
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    When I perform quick search for "AutomationUser" in "{grantee_tableId:RelatedContacts}" panel
    Then I see value "AutomationUser" for title "Title" inside table "{grantee_tableId:RelatedContacts}"
    When I click on "Delete" icon for "AutomationUser" inside flex table with id "{grantee_tableId:RelatedContacts}"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @61885 @validateAddingOfIndirectRateAtInternalUser @positive
  Scenario: Validate addition of Indirect Rate with valid or invalid inputs at internal organizations
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
    And I navigate to "Overview" sub tab
    When I click on "Delete" icon for "Automation Indirect Rate" inside flex table with id "IndirectRateGridgrid"
    And I click on top right button "New" in flex table with id "IndirectRateGridgrid"
    When I enter in modal "IndirectFieldsValue" values from "Field_Values.xlsx"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "IndirectRateGridgrid"
    When I enter in modal "IndirectRateWithInvalidDate" values from "Field_Values.xlsx"
    And I pause execution for "2" seconds
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Two different indirect rate’s dates cannot have overlapping dates. |

  @61885 @validateRelatedColumnsOfIndirectRateAtInternalOrganizations @positive
  Scenario Outline: Validate Indirect Rate columns are displayed properly for internal organizations detail page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalOrganizations}" panel
    When I click on "View" icon for "Test Automation Organization" inside table
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
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{grantee_tableId:FederalOrganizations}" panel
    Then I softly see value "ACC-APG-Belvoir" for title "Organization Name" inside table "{grantee_tableId:FederalOrganizations}"

  @61725 @validateAdvanceSearchIsWorkingOrNotAtFederalOrganization @positive
  Scenario: Validate advance search is working or not at Federal organization table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on advance filter "#advfExternalOrganizationHierarchy" of table id "{grantee_tableId:FederalOrganizations}"
    When I enter advance filter values inside id "advfExternalOrganizationHierarchy"
      | Organization Name | contains | Belvoir |
    Then I see value "ACC-APG-Belvoir" for title "Organization Name" inside table "{grantee_tableId:FederalOrganizations}"

  @61725 @validateTotalRecordCountAtFederalOrganizationTable @positive
  Scenario: Validate total records count is displayed as number of records in federal organization table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I select value inside table "{grantee_tableId:FederalOrganizations}" is "100"
    Then I see total records count is same as total row of table id "{grantee_tableId:FederalOrganizations}" on click "Next"

  @61725 @validateNativePageAccessToAdminUsersAtFederalOrganization @smoke @positive
  Scenario: Validate govgrant set up option is visible only to admin user
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{grantee_tableId:FederalOrganizations}" panel
    When I click on "View" icon for "ACC-APG-Belvoir" inside table
    And I click on botton menu "sticky_bottom_Menu"
    Then I softly see "Enable GovGrants Setup" inside bottom menu

  @61725 @validateSortingOfColumnAtExternalFederalOrganization @positive
  Scenario: Validate columns of External federal organization table is getting sorted in ascending/descending order on column click
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on "Organization Name" column header inside table with id "{grantee_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Organization Name" is in "Ascending" order of table id "{grantee_tableId:FederalOrganizations}"
    When I click on "Organization Name" column header inside table with id "{grantee_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Organization Name" is in "Descending" order of table id "{grantee_tableId:FederalOrganizations}"
    And I refresh the page
    When I click on "Abbreviation" column header inside table with id "{grantee_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Abbreviation" is in "Ascending" order of table id "{grantee_tableId:FederalOrganizations}"
    When I click on "Abbreviation" column header inside table with id "{grantee_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Abbreviation" is in "Descending" order of table id "{grantee_tableId:FederalOrganizations}"
    And I refresh the page
    When I click on "Parent Organization" column header inside table with id "{grantee_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Parent Organization" is in "Ascending" order of table id "{grantee_tableId:FederalOrganizations}"
    When I click on "Parent Organization" column header inside table with id "{grantee_tableId:FederalOrganizations}"
    Then I softly see content of expected column "Parent Organization" is in "Descending" order of table id "{grantee_tableId:FederalOrganizations}"

  @61784 @validateInternalUserCanAccessFederalOrganization @smoke
  Scenario Outline: Validate different internal users can access federal organizations
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{grantee_tableId:FederalOrganizations}" panel
    When I click on "View" icon for "ACC-APG-Belvoir" inside table
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "ACC-APG-Belvoir" in the page details

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @61808 @validateFederalOrganizationAddress
  Scenario: Validate Address detail of Federal organization
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "ACC-APG-Belvoir" in "{grantee_tableId:FederalOrganizations}" panel
    When I click on "View" icon for "ACC-APG-Belvoir" inside table
    Then I softly see field "Street" as "1000 Defense Pentagon"
    Then I softly see field "State" as "DC"
    Then I softly see field "Zip Code" as "20301"
    Then I softly see field "Abbreviation" as "DOD-AMC-ACCAPGB"
    Then I softly see field "Website" as "www.defense.gov"
    Then I softly see field "City" as "Washington"
    When I click "www.defense.gov" lookup link
    Then I see new tab is opened

  @61596 @validateTotalRecordCountAtFederalOrganizationTableAsExpected @wip
  Scenario: Validate records count of federal organization table is same as displayed in entries
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I pause execution for "5" seconds
    Then I see "10" records inside flex table id "{grantee_tableId:FederalOrganizations}"

  @62555 @validateQuickSearchIsWorkingOrNotAtNonFederalOrganization
  Scenario: Validate search is working properly at Federal Organization table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalOrganizations}"
    When I enter "NonFederalOrganization" values from "Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime NF Organization}" in "{grantee_tableId:NonFederalOrganizations}" panel
    Then I softly see value "{SavedValue:Automation Runtime NF Organization}" for title "Organization" inside table "{grantee_tableId:NonFederalOrganizations}"
    And I refresh the page
    When I perform quick search for "Invalid Automation Non Federal Organization" in "{grantee_tableId:NonFederalOrganizations}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:NonFederalOrganizations}"

  @62555 @validateAdvanceSearchIsWorkingOrNotAtNonFederalOrganization
  Scenario: Validate advance search is working or not at Federal organization table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on advance filter "#advfNGOOrganizationHierarchy2" of table id "{grantee_tableId:NonFederalOrganizations}"
    When I enter advance filter values inside id "advfNGOOrganizationHierarchy2"
      | Organization Name | contains | {SavedValue:Automation Runtime NF Organization} |
    Then I softly see value "{SavedValue:Automation Runtime NF Organization}" for title "Organization Name" inside table "{grantee_tableId:NonFederalOrganizations}"
    And I refresh the page
    When I click on advance filter "#advfNGOOrganizationHierarchy2" of table id "{grantee_tableId:NonFederalOrganizations}"
    When I enter advance filter values inside id "advfNGOOrganizationHierarchy2"
      | Organization Name | contains | Invalid {SavedValue:Automation Runtime NF Organization} |
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:NonFederalOrganizations}"

  @62555 @validatePaginationFunctionalityIsWorkingOrNotAtNonFederalOrganizationTable @wip
  Scenario: Validate pagination arrow is working fine at non federal organization table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I click on page navigation arrow "{grantee_tableId:NonFederalOrganizations}" for table id "Next"
    Then I softly see table "{grantee_tableId:NonFederalOrganizations}" shows "Page 1 of 5"

  @62555 @validateRecordsAsPerShowEntriesDropdownAtNonFederalOrganizationTable @wip
  Scenario: Validate show entries dropdown is working fine and its showing same as records present in Non federal organization table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I select value inside table "{grantee_tableId:NonFederalOrganizations}" is "5"
    Then I see "5" records inside flex table id "{grantee_tableId:NonFederalOrganizations}"

  @62555 @validateSortingOfNonFederalOrganizationTableColumns
  Scenario: Validate columns of Non federal organization table is getting sorted in ascending/descending order on column click
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on "Organization Name" column header inside table with id "{grantee_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Organization Name" is in "Ascending" order of table id "{grantee_tableId:NonFederalOrganizations}"
    When I click on "Organization Name" column header inside table with id "{grantee_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Organization Name" is in "Descending" order of table id "{grantee_tableId:NonFederalOrganizations}"
    And I refresh the page
    When I click on "Abbreviation" column header inside table with id "{grantee_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Abbreviation" is in "Ascending" order of table id "{grantee_tableId:NonFederalOrganizations}"
    When I click on "Abbreviation" column header inside table with id "{grantee_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Abbreviation" is in "Descending" order of table id "{grantee_tableId:NonFederalOrganizations}"
    And I refresh the page
    When I click on "Organization Type" column header inside table with id "{grantee_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Organization Type" is in "Ascending" order of table id "{grantee_tableId:NonFederalOrganizations}"
    When I click on "Organization Type" column header inside table with id "{grantee_tableId:NonFederalOrganizations}"
    Then I softly see content of expected column "Organization Type" is in "Descending" order of table id "{grantee_tableId:NonFederalOrganizations}"

  @62555 @validateTotalRecordsAtNonFederalOrganizationTable
  Scenario Outline: Validate total records inside table is equal to total number of rows present inside External federal contacts table will all users
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I pause execution for "5" seconds
    And I select value inside table "{grantee_tableId:NonFederalOrganizations}" is "10"
    Then I see total records count is same as total row of table id "{grantee_tableId:NonFederalOrganizations}" on click "Next"


    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @62555 @validateNativePageAccessToAdminUsersAtNonFederalOrganization
  Scenario: Validate gov-grant set up option is visible only to admin user
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalOrganizations}"
    When I enter "NonFederalOrganization" values from "Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    When I click on "Save" in the page details
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime NF Organization}" in "{grantee_tableId:NonFederalOrganizations}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime NF Organization}" inside table
    And I click on botton menu "sticky_bottom_Menu"
    Then I softly see "Enable GovGrants Setup" inside bottom menu

  @62555 @validateRefreshOptionsAtAtNonFederalOrganizationTable
  Scenario: Validate Refresh option at External non federal organization is working or not
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I click on parallel lines menu bar with data target value "#NGOOrganizationHierarchy2FlexToggle"
    And I select "Refresh" from parallel lines dropdown of "Non-Federal Organizations"
    Then I see table is refreshing

  @61871 @validateCreationOfNonFederalOrganization @smoke
  Scenario Outline: Validate creation of new non federal organization record at Non federal Organization table
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:NonFederalOrganizations}"
    When I enter "NonFederalOrganization" values from "Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime NF Organization}" in the page details
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime NF Organization}" in "{grantee_tableId:NonFederalOrganizations}" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime NF Organization}" inside flex table with id "{grantee_tableId:NonFederalOrganizations}"
    When I enter value "virginia" into field "fieldBillingCity"
    When I click on "Save" in the page details
    Then I softly see field "City" as "virginia"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |

  @61986 @validateExternalNonFederalOrganizationDetailsWithContactSection @smoke
  Scenario: Validate all details with website link and contact section is proper at External Non-Federal Organization table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Automation Non Federal Organization" in "{grantee_tableId:NonFederalOrganizations}" panel
    When I click on "View" icon for "Automation Non Federal Organization" inside flex table with id "{grantee_tableId:NonFederalOrganizations}"
    And I softly see the text containing :
      | Address             |
      | Child Organizations |
      | Related Contacts    |
      | System Information  |
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "Automation Non Federal Organization" in the page details
#    Then I softly see value "Child Contact" for title "Full Name" inside table "{grantee_tableId:RelatedContacts}"
#    When I click "https://www.aidsfundingcollaborative.org" lookup link
#    Then I see new tab is opened