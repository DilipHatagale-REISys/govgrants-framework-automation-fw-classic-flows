@Opportunities @Grantee-Opportunities @OpportunityDevelopment @grantee-regression @grantee-parallel-regression
Feature: Opportunities related scenarios
  Test all scenarios related to Opportunities

  @63052 @NotConverted @validateAdvanceSearchForOpportunitiesListView
  Scenario: verify advance search is working or not for opportunities -not converted to application list view
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
    And I pause execution for "2" seconds
    When I click on advance filter "#advfAnnouncementsGrantee" of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I enter advance filter values inside id "{grantee_tableId:OpportunityNotConvertedAdvanceFilterId}"
      | Status | Equals to | Draft |
    Then I softly see value "Draft" for title "Status" inside table "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I click on advance filter "#advfAnnouncementsGrantee" of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I enter advance filter values inside id "{grantee_tableId:OpportunityNotConvertedAdvanceFilterId}"
      | Status | Not equals to | Draft |
    Then I softly see value "Approved" for title "Status" inside table "{grantee_tableId:OpportunityNotConvertedToApplication}"

  @63052 @NotConverted @validateSortingForOpportunitiesListView @positive
  Scenario: verify columns of Opportunities Not Converted to Application List Page is getting sorted on column click
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
    When I click on "Opportunity Number" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Opportunity Number" is in "Ascending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Opportunity Number" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Opportunity Number" is in "Descending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Opportunity Title" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Opportunity Title" is in "Ascending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Opportunity Title" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Opportunity Title" is in "Descending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Funding Organization" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Funding Organization" is in "Ascending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Funding Organization" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Funding Organization" is in "Descending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Application Due Date" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Application Due Date" is in "Ascending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Application Due Date" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Application Due Date" is in "Descending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Internal Organization" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Internal Organization" is in "Ascending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Internal Organization" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Internal Organization" is in "Descending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Status" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Status" is in "Ascending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Status" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Status" is in "Descending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Created By" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Created By" is in "Ascending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Created By" column header inside table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see content of expected column "Created By" is in "Descending" order of table id "{grantee_tableId:OpportunityNotConvertedToApplication}"

  @63052 @NotConverted @validateAllInternalOrganizationsCanViewOpportunitiesAreViewableToAll @smoke @positive
  Scenario Outline: verify all users can view opportunities -Not Converted to Application List Page
    When I login to "As a Grantor" app as "<userType>" user
    And I navigate to "Opportunities" tab
    And I select value inside table "{grantee_tableId:Opportunities}" is "All"
    Then I see total records count is same as total row of table id "{grantee_tableId:Opportunities}" and table name "flexTable"
    Examples:
      | user type     |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE EXE   |
      | GRANTEE FO    |
      | GRANTEE PM1   |

  @63246 @NotConverted @VerifyUserCanViewForAOpportunityWithCreatedStatus @positive
  Scenario: verify user can view for opportunity with created status and New button should be displayed only for record owner
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
    Then I can see top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @VerifyUsersOtherThanRecordOwnerCannotAddReviewers
  Scenario: Verify Users Other Than Record Owner Can not Add Reviewers
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
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @validationOnNewButton @positive
  Scenario: verify save button should be displayed and row should get added while clicking on new button
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
    Then I softly can see top right button "Save" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "{SavedValue:GRANTEE PM Username}" for title "Reviewer Name" against the value "Program Reviewer" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @verifyRowShouldBeRemovedFromThePeerReviewTable
  Scenario: verify Added row should be removed from the peer review table while clicking on New button
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
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on "Remove record" icon for "Created" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I cannot see top right button "Save" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @validateQuickSearchDisabledOnTopLevelNewActionClick @positive
  Scenario: verify quick search disabled on top level new action click
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
    And I click on top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I see quick search is disabled at table id "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @ValidateAfterSavingReviewStatusShouldBeCreatedAndQuickSearchFunctionality @positive
  Scenario: Verify after saving peer review status should be created and quick search functionality work properly
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
      | Reviewer Name                     | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username}  | Program Reviewer | aaaaaaa     | 1        | No                   |
      | {SavedValue:GRANTEE PM1 Username} | Fiscal Reviewer  | aaaaaa      | 2        | No                   |
    And I pause execution for "2" seconds
    When I perform quick search for "Program Reviewer" in "{grantee_tableId:OpportunityPeerReviewers}" panel
    Then I softly see value "Created" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Program Reviewer" for title "Responsibility" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @ValidateAdvanceSearchFunctionality @positive
  Scenario: verify advance search functionality work properly
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
      | Reviewer Name                     | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username}  | Program Reviewer | aaaaaaa     | 1        | No                   |
      | {SavedValue:GRANTEE PM1 Username} | Fiscal Reviewer  | aaaaaa      | 2        | No                   |
    When I click on advance filter "#advfGranteeOpportunityReviewersTemp" of table id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter advance filter values inside id "{grantee_tableId:OpportunityPeerReviewers}"
      | Responsibility | equals to | Fiscal Reviewer |
    Then I see value "Fiscal Reviewer" for title "Responsibility" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @ValidateRecordOwnerCanDeleteAReview @smoke @positive
  Scenario: verify record owner can delete review
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
    And I click on "Delete" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I see the text "Record deleted successfully."

  @63246 @NotConverted @ValidateStatusOfTheOpportunityAfterSentForReview @positive
  Scenario: verify Status of the opportunity should be changed to Submitted for review after sent for review
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
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "2" seconds
    Then I see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @ValidateEditingReviewerRecord
  Scenario: verify User other than record owner should not be able to edit the record from the table
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
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see row level action button "Edit" against "Created" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @ValidateSameUserCannotBeAssignedToeachRoleForMultipleTimes @positive
  Scenario: verify appropriate validation message should be displayed while assigning same user to each role
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
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | aaaaaa      | 1        | No                   |
    Then I softly see the text "Person with Same Role cannot be added again"
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaa      | 1        | No                   |
    Then I softly see the text "Person with Same Role cannot be added again"

  @63246 @NotConverted @VerifyTheNewButtonAvailabilityForAnOpportunityOtherThanCreatedStatusReviewed
  Scenario: verify new button should not be displayed for an opportunity other than created status(Reviewed)
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
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @validateTheNewButtonAvailabilityForAnOpportunityOtherThanCreatedStatusConvertedToPre-Application
  Scenario: verify new button should not be displayed for an opportunity other than created status(Converted to Pre-Application)
    And I execute batch file:
      | operationType | objectType | recordName              | opportunitynumber |
      | CreateRecord  | FOA LEAD   | Automation Runtime Lead | OP-N              |
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I save the field labeled "EGMS ID" as "EID"
    And I click on "Activate" in the page details
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
    When I enter value "Yes" into field "fieldPreApplicationNeeded__c"
    When I enter value "-1" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name                              | Description |
      | Program Approver   | {SavedValue:GRANTEE PM Username}  | prdoh       |
      | Executive Approver | {SavedValue:GRANTEE EXE Username} | prdoh       |
      | Fiscal Approver    | {SavedValue:GRANTEE FO Username}  | prdoh       |
    And I click on "Submit for Approval" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "5" seconds
    When I perform quick search for "{SavedValue:EID}" in "{grantee_tableId:PendingTask}" panel
    And I save the value from row "1" for column name "EGMS ID" as "PendingEGMSID" from flex table "{grantee_tableId:PendingTask}"
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:PendingEGMSID} Created for Lead # {SavedValue:EID}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I pause execution for "2" seconds
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "BHDDHO - {SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "BHDDHO - {SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Pre-Application" in the page details
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @NotConverted @validateTheNewButtonAvailabilityForAnOpportunityOtherThanCreatedStatusConvertedToApplication
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
    When I enter value "-1" into field "fieldPreApplicationDueDate__c"
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name                              | Description |
      | Program Approver   | {SavedValue:GRANTEE PM Username}  | prdoh       |
      | Executive Approver | {SavedValue:GRANTEE EXE Username} | prdoh       |
      | Fiscal Approver    | {SavedValue:GRANTEE FO Username}  | prdoh       |
    And I click on "Save and Continue" in the page details
    And I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I pause execution for "2" seconds
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
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    And I enter value "{SavedValue:GRANTEE PM Username}" into field "ProjectDirectorContact__c"
    When I click on "Save and Continue" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @63246 @ValidateDueDateWhileAssigningAReviewerToAnOpportunity @positive
  Scenario: verify due date is passed then it shows appropriate message
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
    When I navigate to "Responsibilities" sub tab
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | aaaaaaa     | -1       | No                   |
    Then I see the following messages in the page details contains:
      | Due Date should be greater than Today's Date |

  @66432 @NotConverted @ValidateAppropriateMessageClickingOnSendForReviewForProgramReviewer @positive
  Scenario: verify appropriate message while clicking on send for review icon(Program Reviewer)
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly can see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted  @ValidateTheAvailabilityOfSendForReviewIconAtReviewRecordLevelForInternalUsersWhoAreNotRecordOwner
  Scenario Outline: Send for review icon should not be displayed for any internal users
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I pause execution for "2" seconds
    When I re-login as "<userType>" user on "default" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I cannot see row level action button "Sent for Review" against "Created" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Examples:
      | userType      |
      | GRANTEE PO    |
      | GRANTEE EXE   |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE ADMIN |

  @66432 @NotConverted @ValidateAppropriateMessageClickingOnSendForReviewForFiscalReviewer @positive
  Scenario: verify appropriate message while clicking on send for review icon(Fiscal Reviewer)
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly can see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateAppropriateMessageClickingOnSendForReviewForProgramReviewerWhoIsNotTheRecordOwner @positive
  Scenario: verify appropriate message while clicking on send for review icon(Program Reviewer who is not record owner)
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FO Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateAppropriateMessageClickingOnSendForReviewForFiscalReviewerWhoIsNotTheRecordOwner @positive
  Scenario: verify appropriate message while clicking on send for review icon(Fiscal Reviewer who is not record owner)
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FO Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateAppropriateMessageClickingOnSendForReviewIconForProgramReviewerWhoIsFromADifferentOrganization @positive
  Scenario: verify appropriate message while clicking on send for review icon for program reviewer who is from different organization
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                     | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM1 Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "	{SavedValue:GRANTEE PM1 Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    And I save the field labeled "EGMS ID" as "egmsid"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I re-login to "As a Grantee" app as "GRANTEE PM1" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateAppropriateMessageClickingOnSendForReviewIconForMultipleFiscalReviewers
  Scenario: verify appropriate message while clicking on send for review icon for multiple Fiscal reviewers
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
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
      | {SavedValue:GRANTEE FO Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    And I save the field labeled "EGMS ID" as "egmsid"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"
    And I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateTheColumnsAvailableInThePendingTaskList @smoke @positive
  Scenario: verify columns should get displayed in pending task list
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "5" seconds
    Then I softly see "EGMS ID" in flex table header "{grantee_tableId:PendingTask}"
    Then I softly see "Type" in flex table header "{grantee_tableId:PendingTask}"
    Then I softly see "Subject" in flex table header "{grantee_tableId:PendingTask}"
    Then I softly see "Assigned By" in flex table header "{grantee_tableId:PendingTask}"
    Then I softly see "Due Date" in flex table header "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateInformationAvailableInThePendingTask @smoke @positive
  Scenario: verify values should get displayed in the available columns
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
    And I get the "Opportunity Title"
    And I save the field labeled "Application Due Date" as "AppDueDate"
    And I save the field labeled "Opportunity Title" as "OpportunityTitle"
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Grantee opportunity" for title "Type" inside table "{grantee_tableId:PendingTask}"
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" inside table "{grantee_tableId:PendingTask}"
    Then I softly see value "{SavedValue:GRANTEE PM Username}" for title "Assigned By" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateSubjectValueAssignedByValueAndDueDateOnTheCreatedTaskForTheReviewer @positive
  Scenario: verify Subject value, assigned by value and due date on the created task for the reviewer
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
    And I get the "Opportunity Title"
    And I save the field labeled "Application Due Date" as "AppDueDate"
    And I save the field labeled "Opportunity Title" as "OpportunityTitle"
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:GRANTEE PM Username}" for title "Assigned By" inside table "{grantee_tableId:PendingTask}"
    Then I softly see value "{SavedValue:AppDueDate}" for title "Due Date" inside table "{grantee_tableId:PendingTask}"
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateResendForReviewAfterReviewerSubmitsTheReviewWithProgramReviewer @positive
  Scenario: record owner is able to resend for review after reviewer submits the review(program reviewer)
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
    And I get the "Opportunity Title"
    And I save the field labeled "Application Due Date" as "AppDueDate"
    And I save the field labeled "Opportunity Title" as "OpportunityTitle"
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
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:QualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:QualifiedLeads}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:QualifiedLeads}"
    When I click on "Convert to Opportunity" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    And I click on "Submit Review" in the page details
    And I close modal by clicking the top right x button
    And I click on "Resend for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateResendForReviewAfterReviewerSubmitsTheReviewWithFiscalReviewer @positive
  Scenario: record owner is able to resend for review after reviewer submits the review(fiscal reviewer)
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    And I click on "Submit Review" in the page details
    And I click on "Resend for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateCreatedDateOnTheCreatedTaskForTheReviewer @positive
  Scenario: verify Created date should display the date on which the record owner sent the review
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see field "{SavedValue:CreatedDate}" contains todays date withTime

  @66432 @NotConverted @ValidateAllowEditingOptionAsNoAfterClickingOnSendForReviewIconForProgramReviewer @positive
  Scenario: verify allow editing opton as No after clicking on send for review icon(Program reviewer with No option)
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
      | {SavedValue:GRANTEE FO Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateAllowEditingOptionAsYesAfterClickingOnSendForReviewIconForProgramReviewer @positive
  Scenario: verify allow editing option as Yes after clicking on send for review icon(Program reviewer with Yes option)
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
      | {SavedValue:GRANTEE FO Username} | Program Reviewer | aaaaaaa     | 1        | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "Yes" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateAllowEditingOptionAsYesAfterClickingOnSendForReviewIconForFiscalReviewer @positive
  Scenario: verify allow editing option as Yes after clicking on send for review icon(Fiscal Reviewer with Yes option)
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FO Username} | Fiscal Reviewer | aaaaaaa     | 1        | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "Yes" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateAllowEditingOptionAsNoAfterClickingOnSendForReviewIconForFiscalReviewer @positive
  Scenario: verify allow editing option as Yes after clicking on send for review icon(Fiscal Reviewer with No option)
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FO Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    Then  I softly see the text "Review Successfully Initiated."
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66432 @NotConverted @ValidateTheAvailabilityOfSendForReviewIconAtReviewRecordLevelForUserWhoIsRecordOwner @positive
  Scenario: verify the availability of send for review icon at review record level for user who is record owner
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
      | Reviewer Name                     | Responsibility   | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE EXE Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE EXE Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "5" seconds
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    And I click on "Submit Review" in the page details
    And I click on "Resend for Review" icon for "{SavedValue:GRANTEE EXE Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "5" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly can see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @ValidateQuickSearchFunctionalityForCreatedTask @positive
  Scenario: verify quick search functionality for created task is working
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
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"
    When I perform quick search for "{SavedValue:GRANTEE PM Username}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see value "{SavedValue:GRANTEE PM Username}" for title "Assigned By" against the value "{SavedValue:Automation Runtime Lead}" inside table "{grantee_tableId:PendingTask}"

  @66479 @ValidateTaskShouldNotBeRemovedFromThePendingTaskListUntilReviewerEntersTheReview @positive
  Scenario: verify the task should not be removed from the pending task list until reviewer enters the review
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
      | {SavedValue:GRANTEE FO Username} | Program Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I see value "Review Opportunity #{SavedValue:egmsid} Created for Lead #{SavedValue:LeadNumber}" for title "Subject" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:PendingTask}"

  @66479 @ValidatePlayButtonToExecuteTheTask @positive
  Scenario: verify actions column should only show Enter review icon at record level and Status should be Sent for review after clicking play button
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly can see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @ValidateHelpTextForEnterReviewModalWindow @positive
  Scenario: verify Help text should be displayed for fields of enter review modal window
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I hovering mouse on help text icon inside page block detail "Rating"
    Then I softly see "Rating: Passed, Failed, or Could Not Rate" shown as help text

  @66479 @ValidateUserShouldBeAbleToSelectDropDownFieldsFromRatrings @positive
  Scenario: verify user should be able to select drop down fields from Ratings on Enter Review modal
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    Then I see field "Rating" as "Passed"

  @66479 @ValidateReviewTypeFieldOnTheEnterReviewModalWindowForFiscal @positive
  Scenario: verify Value should be displayed as Fiscal if assigned reviewer is a Fiscal reviewer
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I see field "Review Type" as "Fiscal"

  @66479 @ValidateReviewTypeFieldOnTheEnterReviewModalWindowForProgram @positive
  Scenario: verify Value should be displayed as Program if assigned reviewer is a Program reviewer
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
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I see field "Review Type" as "Program"

  @66479 @ValidateErrorMessageForEnterReviewModalWindow
  Scenario: verify error message while saving enter review without entering required fields
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | Rating is Required to save.   |
      | Comments is Required to save. |

  @66479 @ValidateActionsAfterEnteringReviewWhoIsNotTheRecordOwner @positive
  Scenario: verify Record level status should changed from sent for review to In Progress after entering review(Reviewer who is not the record owner)
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FO Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    Then I softly see value "In Progress" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Enter Review" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateActionsAfterEnteringReviewTheRecordOwner @positive
  Scenario: verify Record level status should changed from sent for review to In Progress after entering review(Reviewer who is the record owner)
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    Then I softly see value "In Progress" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Enter Review" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateActionsOnSubmitReviewButtonWhoTheRecordOwner @positive
  Scenario: verify Confirmation message should be displayed and Review status at record level should be Review Completed(who is the record owner)
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Sent for Review" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I click modal button "Submit Review"
    And I pause execution for "2" seconds
    Then I softly see the text "Review successfully submitted."
    Then I softly see value "Review Completed" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateIfTheReviewerIsAbleToEditTheRecordIfAllowEditingForTheReviewerIsSetToNo
  Scenario: Verify if the reviewer is able to edit the record if allow editing for the reviewer is set to No
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FO Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "Edit" in page detail

  @66479 @TejalMarch2020 @ValidateAfterClickOnTheCompleteReviewButtonWhenTheRecordLevelStatusForAssignedReviewersIsCreated @positive
  Scenario: Verify after click on the complete review button when the record level status for assigned reviewer(s) is created
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateAfterClickOnTheCompleteReviewButtonWhenTheRecordLevelStatusForAssignedReviewersIsInProgress @positive
  Scenario: Verify after click on the complete review button when the record level status for assigned reviewer(s) is  In Progress
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "resendenterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see row level action button "Edit" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "In Progress" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateAfterClickOnTheCompleteReviewButtonWhenTheRecordLevelStatusForAssignedReviewersIsReviewCompleted @positive
  Scenario: Verify after click on the complete review button when the record level status for assigned reviewer(s) is Review Completed
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "resendenterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    And I click on "Submit Review" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see row level action button "Edit" against "Review Completed" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "Review Completed" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Review Completed" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateEnterForReviewButtonShouldNotBeDisplayedAtRecordLevelForAReviewerWhoIsAlsoARecordOwner
  Scenario: verify Enter for review button should not be displayed at record level for a reviewer who is also a record owner
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on "Complete Review" in the page details
    Then I softly cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateEnterForReviewButtonShouldNotBeDisplayedAtRecordLevelForAReviewerWhoIsNotARecordOwner
  Scenario: verify Enter for review button should not be displayed at record level for a reviewer who is not a record owner
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FO Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I click on "Complete Review" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I cannot see row level action button "Enter Review" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateEnterReviewShouldBeEditAfterSaveWhoIsNotTheRecordOwner @positive
  Scenario: verify edit functionality of Enter Review(who is not the record owner)
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
    And I click on "Send for Review" icon for "Created" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "2" seconds
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE EXE Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I click modal button "Edit"
    And I enter value "enterreviewcmnt11" into field "fieldReviewComments__c"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I click modal button "Save"
    And I pause execution for "5" seconds
    Then I see field "Comments" as "enterreviewcmnt11"

  @66479 @TejalMarch2020 @ValidateReviewAfterSavingEnteredReviewWhoIsTheRecordOwner @positive
  Scenario: verify  A record should get displayed for entered review(who is the record owner)
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I save the field labeled "Review Date" as "ReviewDate"
    And I pause execution for "5" seconds
    And I expand nested table containing column value "{SavedValue:GRANTEE PM Username}"
    Then I softly see value "Passed" for title "Rating" against the value "enterreviewcmnt" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "enterreviewcmnt" for title "Comments" against the value "Passed" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see field "{SavedValue:ReviewDate}" contains todays date withTime
    And I click on "View" icon for "Passed" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "5" seconds
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button

  @66479 @TejalMarch2020 @ValidateEnterReviewShouldBeEditAfterSaveWhoIsTheRecordOwner @positive
  Scenario: verify edit functionality of Enter Review(who is the record owner)
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
    And I pause execution for "2" seconds
    When I enter the following values into flex table with id "{grantee_tableId:OpportunityPeerReviewers}" by clicking "New" :
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "5" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And  I pause execution for "3" seconds
    And I click modal button "Edit"
    And I enter value "enterreviewcmnt11" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click modal button "Save"
    And I pause execution for "5" seconds
    Then I see field "Comments" as "enterreviewcmnt11"

  @66479 @TejalMarch2020 @ValidateEnterReviewModalWindowShouldGetDisplayedandRequiredFields
  Scenario: verify Enter review modal window should get displayed and required fields
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "2" seconds
    Then I softly see "Save" modal button
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Rating is Required to save.   |
      | Comments is Required to save. |

  @66479 @TejalMarch2020 @ValidateTheExpectedBehaviorOnTheDetailPageForTheRecordOwnerAfterTheReviewerSavesTheEnteredReview @positive
  Scenario: Verify the expected behavior on the detail page for the record owner after the reviewer saves the entered review
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    And I save the field labeled "Rating" as "rating"
    And I save the field labeled "Comments" as "cmnt"
    Then I softly see value "In Progress" for title "Status" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I cannot see row level action button "Edit" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I cannot see row level action button "Delete" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I cannot see row level action button "Enter Review" against "In Progress" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I expand nested table containing column value "{SavedValue:GRANTEE PM Username}"
    When I click on "View" icon for "enterreviewcmnt" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "2" seconds
    Then I softly see "Edit" modal button
    And I pause execution for "2" seconds
    Then I softly see "Submit Review" modal button

  @66479 @TejalMarch2020 @ValidateTheExpectedBehaviorOnTheDetailPageForTheRecordOwnerAfterTheReviewerSubmitsTheReview @positive
  Scenario: Verify the expected behavior on the detail page for the record owner after the reviewer submits the review
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I pause execution for "2" seconds
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "5" seconds
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    And I click on "Submit Review" in the page details
    Then I softly see value "Review Completed" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly can see row level action button "Resend for Review" against "Review Completed" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I expand nested table containing column value "{SavedValue:GRANTEE PM Username}"
    When I click on "View" icon for "enterreviewcmnt" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "5" seconds
    Then I softly cannot see "Edit" modal button
    Then I softly cannot see "Submit Review" modal button

  @66479 @TejalMarch2020 @ValidateIfTheReviewerIsAbleToSubmitAReviewAfterTheRecordOwnerReSendsAReviewLoginAsReviewer @positive
  Scenario: Verify if the reviewer is able to submit a review after the record owner re-sends a review(loginas reviewer who is not the record owner)
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FO Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    And I click on "Submit Review" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Resend for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I pause execution for "2" seconds
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "resendenterreviewcmnt" into field "fieldReviewComments__c"
    And I click modal button "Save"
    Then I softly see field "Comments" as "resendenterreviewcmnt"
    And I pause execution for "5" seconds
    And I click on "Edit" in the page details
    And I enter value "resendenterreviewcmnt11" into field "fieldReviewComments__c"
    And I pause execution for "2" seconds
    And I click modal button "Save"
    And I pause execution for "2" seconds
    And I click modal button "Save"
    Then I softly see field "Comments" as "resendenterreviewcmnt11"
    And I pause execution for "2" seconds
    And I click modal button "Submit Review"
    Then I softly see value "Review Completed" for title "Status" against the value "{SavedValue:GRANTEE FO Username}" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateAfterClickOnTheCompleteReviewButtonWhenTheRecordLevelStatusForAssignedReviewersIsSentForReview @wip @needpermntrecord @positive
  Scenario: Verify after click on the complete review button when the record level status for assigned reviewer(s) is Sent for review
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "New" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly cannot see row level action button "Delete" against "Sent for Review" in flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    Then I softly see value "Sent for Review" for title "Status" against the value "No" inside table "{grantee_tableId:OpportunityPeerReviewers}"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    Then I softly see the following messages in the page details :
      | No Records found |

  @66479 @TejalMarch2020 @ValidateIfTheReviewerIsAbleToSubmitAReviewAfterTheRecordOwnerReSendsAReviewLoginAsRecordOwner @positive
  Scenario: Verify if the reviewer is able to submit a review after the record owner re-sends a review(login as reviewer who is the record owner)
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE PM Username} | Fiscal Reviewer | aaaaaaa     | 1        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:egmsid}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "{SavedValue:egmsid}" inside flex table with id "{grantee_tableId:PendingTask}"
    And I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "enterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    And I click on "Submit Review" in the page details
    And I click on "Resend for Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I click on "Enter Review" icon for "{SavedValue:GRANTEE PM Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    When I enter value "Passed" into field "fieldRating__c"
    And I enter value "resendenterreviewcmnt" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    Then I softly see field "Comments" as "resendenterreviewcmnt"
    And I pause execution for "5" seconds
    And I click on "Edit" in the page details
    And I enter value "resendenterreviewcmnt11" into field "fieldReviewComments__c"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I click modal button "Save"
    Then I softly see field "Comments" as "resendenterreviewcmnt11"
    And I click on "Submit Review" in the page details
    And I pause execution for "2" seconds
    And I close modal by clicking the top right x button
    And I pause execution for "2" seconds
    Then I softly see value "Review Completed" for title "Status" against the value "{SavedValue:GRANTEE PM Username}" inside table "{grantee_tableId:OpportunityPeerReviewers}"

  @66479 @TejalMarch2020 @ValidateReviewerShouldNotBeAbleToEditTheOpportunityAfterRecordOwnerClicksOnCompleteReviewButton
  Scenario: verify Reviewer should not be able to edit the opportunity after record owner clicks on complete review button
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
      | Reviewer Name                    | Responsibility  | Description | Due Date | Allow Record Editing |
      | {SavedValue:GRANTEE FO Username} | Fiscal Reviewer | aaaaaaa     | 1        | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:GRANTEE FO Username}" inside flex table with id "{grantee_tableId:OpportunityPeerReviewers}"
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    And I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "Edit" in page detail

  @63146 @TejalMarch2020 @validateAdvanceSearchForOpportunitiesListViewForConvertedToApplication  @positive
  Scenario: verify advance search is working or not for opportubities - converted to application list view
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
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I click on advance filter "#advfExpiredFundingOpportunities" of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I enter advance filter values inside id "{grantee_tableId:OpportunityConvertedToApplicationAdvanceFilterId}"
      | Status | equals to | Converted to Application |
    Then I softly see value "Converted to Application" for title "Status" inside table "{grantee_tableId:OpportunityConvertedToApplication}"

  @63146 @TejalMarch2020 @validateQuickSearchForOpportunitiesListViewForConvertedToApplication @positive
  Scenario: verify quick search is working or not for opportubities - converted to application list view
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
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    When I click on "Save and Continue" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    Then I softly see value "{SavedValue:Automation Runtime Lead}" for title "Opportunity Title" inside table "{grantee_tableId:OpportunityConvertedToApplication}"
    And I refresh the page
    And I pause execution for "5" seconds
    When I perform quick search for "Converted to Application" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    Then I softly see value "Converted to Application" for title "Status" inside table "{grantee_tableId:OpportunityConvertedToApplication}"
    And I refresh the page
    And I pause execution for "5" seconds
    When I perform quick search for "Invalid Data" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"

  @63146 @TejalMarch2020  @validateSortingForOpportunitiesListViewForConvertedToApplication @positive
  Scenario: verify columns of Opportunities  Converted to Application List Page is getting sorted on column click
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
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    When I click on "Opportunity Number" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Opportunity Number" is in "Ascending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Opportunity Number" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Opportunity Number" is in "Descending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Opportunity Title" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Opportunity Title" is in "Ascending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Opportunity Title" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Opportunity Title" is in "Descending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Funding Organization" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Funding Organization" is in "Ascending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Funding Organization" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Funding Organization" is in "Descending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Application Due Date" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Application Due Date" is in "Ascending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Application Due Date" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Application Due Date" is in "Descending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Internal Organization" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Internal Organization" is in "Ascending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Internal Organization" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Internal Organization" is in "Descending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Status" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Status" is in "Ascending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"
    When I click on "Status" column header inside table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I softly see content of expected column "Status" is in "Descending" order of table id "{grantee_tableId:OpportunityConvertedToApplication}"

  @63146 @TejalMarch2020 @validateOpportunitiesConvertedToApplicationListPageHelpText  @positive
  Scenario Outline: Validate help text message at Opportunities Converted to Application List Page
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I hovering mouse on page block help text icon inside table "{grantee_tableId:OpportunityConvertedToApplication}" with tooltip id "ExpiredFundingOpportunitiestooltip"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                               |
      | Displayes opportunities for which organization has started an application. |

  @63353 @TejalMarch2020 @ValidateRecordOwnerCanBeAnApprover @positive
  Scenario: verify record owner can be an approver
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
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    And I pause execution for "2" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see field "Status" as "Approved"

  @63353 @TejalMarch2020 @ValidateAnyUserCanBeAnApprover @positive
  Scenario: verify any user can be an approver
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
      | Program Approver   | {SavedValue:GRANTEE PM1 Username} | Product Grantee |
      | Fiscal Approver    | {SavedValue:GRANTEE FO Username}  | Product Grantee |
      | Executive Approver | {SavedValue:GRANTEE EXE Username} | Product Grantee |
    And I click on "Submit for Approval" in the page details
    And I save the field labeled "EGMS ID" as "egmsid"
    And I pause execution for "5" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
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
    And I pause execution for "5" seconds
    And I re-login with "PM1" user
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    Then I softly see field "Status" as "Approved"

  @63353 @TejalMarch2020 @ValidateOneUserCannotBeInMoreThanOneApproverRole @positive
  Scenario: verify one user cannot be in more than one approver role
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
      | Responsibility     | Name                             | Description     |
      | Program Approver   | {SavedValue:GRANTEE PM Username} | Product Grantee |
      | Fiscal Approver    | {SavedValue:GRANTEE FO Username} | Product Grantee |
      | Executive Approver | {SavedValue:GRANTEE FO Username} | Product Grantee |
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | You cannot assign same user to multiple roles. |

  @63353 @TejalMarch2020 @ValidateFiscalApproverIsn'tNeededUnlessCostSharingOrMatchingIsRequired @BugLoggedWith73223 @positive
  Scenario: Verify that if fiscal approver isn't needed unless  cost sharing or matching is required
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
    When I enter value "Cash Match" into field "fieldCostSharing__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "{grantee_tableId:Approvers}" by clicking "Edit" :
      | Responsibility     | Name                              | Description     |
      | Program Approver   | {SavedValue:GRANTEE PM Username}  | Product Grantee |
      | Fiscal Approver    | {SavedValue:GRANTEE FO Username}  | Product Grantee |
      | Executive Approver | {SavedValue:GRANTEE EXE Username} | Product Grantee |
    And I pause execution for "2" seconds
    Then I softly see value "Fiscal Approver" for title "Responsibility" inside table "{grantee_tableId:Approvers}"

  @63353 @TejalMarch2020 @ValidateRejectingAnOpportunityWillMakeTheLeadAvailableToQualify @positive
  Scenario: Verify rejecting a opportunity will make the lead available to qualify
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
    And I pause execution for "5" seconds
    When I "Reject" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    Then I see field "Status" as "Qualified Lead"

  @63353 @TejalMarch2020 @ValidateRejectingAnOpportunityWillMakeTheQualifiedLeadAvailableToConvertToOpportunity @positive
  Scenario: Verify rejecting a opportunity will make the qualified lead available to convert to opportunity
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
    When I "Reject" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM1" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotyetQualifiedLead}" content inside "{grantee_sidebar:LeadsSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:LeadsNotYetQualified}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:LeadsNotYetQualified}"
    And I click on "Qualify Lead" in the page details
    And I pause execution for "2" seconds
    When I enter value "2 - Low" into field "fieldRelevance__c"
    When I enter value "2 - Low" into field "fieldImpact__c"
    When I enter value "Test Justification For Automation" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Convert to Opportunity" in the page details
    Then I see field "Status" as "Converted to Opportunity"

  @63357 @TejalMarch2020 @ValidateApproverCanSendBackApproval @wip @BugLoggedWith73237 @positive
  Scenario: verify Approver can send back approval
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
    And I pause execution for "5" seconds
    When I "Send to Owner" in the approval decision
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I click on "Start" icon for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" inside flex table with id "{grantee_tableId:PendingTask}"
    Then I see field "Status" as "Draft"

  @63355 @TejalMarch2020 @ValidateOpportunityApproverCanForwardApprovalTaskToAnyUser @positive
  Scenario: verify Opportunity approver can forward approval task to any user
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
    And I pause execution for "2" seconds
    When I select radio button "Reassign" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I select user "{SavedValue:GRANTEE FD Username}" in the approval decision
    And I submit the approval in the approval decision without processing
    And I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" in "{grantee_tableId:PendingTask}" panel
    And I pause execution for "2" seconds
    Then I see value "Approve Opportunity # {SavedValue:egmsid} Created for Lead # {SavedValue:LeadNumber}" for title "Subject" inside table "{grantee_tableId:PendingTask}"

  @63216 @TejalMarch2020 @ValidateOpportunitiesConvertedToApplicationDetailsPage @positive
  Scenario Outline: verify Opportunities Converted to Application Details page
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
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    And I pause execution for "3" seconds
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:NotConvertedOpportunityLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityNotConvertedToApplication}" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityNotConvertedToApplication}"
    When I click on "Create Application" in the page details
    When I click on "Save and Continue" in the page details
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "{grantee_sidebar:ConvertedApplicationLinkName}" content inside "{grantee_sidebar:OpportunitiesSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Lead}" in "{grantee_tableId:OpportunityConvertedToApplication}" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Lead}" inside flex table with id "{grantee_tableId:OpportunityConvertedToApplication}"
    Then I see field "Status" as "Converted to Application"
    Examples:
      | userType      |
      | GRANTEE PM    |
      | GRANTEE ADMIN |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE EXE   |
      | GRANTEE FO    |