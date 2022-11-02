@directedAnnouncementsWB @grantor-regression @grantor-parallel-regression @announcement @regression
Feature: Validate all scenarios in the directed Announcement tab

  @219074 @219166 @AdminUserVerifiesInfoTextForDirectedAnnouncement @sprint-9-US-208408 @komal @Allocation
  Scenario: Verify when Admin user should able to see the Info Text for Directed Announcement
  |Verify focus area table should display above the Applicant Section for Directed Announcement|
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncementForAdmin" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal_Directed" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I hovering mouse on help text icon inside page block detail "Applicants"
    Then I softly see "Verify that all invited applicants are eligible to submit an application based on the eligibility criteria associated with this announcement" shown as help text
    #219166
    Then I softly see "Focus Areas" page block displayed

  @219077 @VerifyAdminuserseetheEGMSIDshouldbeclickablelinkinthecolumnofApplicationEGMSIDforDirectedAnnouncement @sprint-9-US-208408 @komal @Allocation
  Scenario: Verify Admin user see the EGMS ID should be clickable link  in the column of Application EGMS ID for Directed Announcement
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Proposal" sub tab
    Then I softly cannot see page block "Work Plan"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "ActiveFundingOpportunities" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "ActiveFundingOpportunities"
    #219077
    And I click on hyperlink containing value "{SavedValue:AppEgmdId}"
    Then I see the header is "Application" in the page details

  @219075 @AdminUserShouldAbleToSeeTwoColumnsInPublishedStateForDirectedAnnouncement @sprint-9-US-208408 @komal @Allocation
  Scenario: Verify Admin user should able to see the two columns in published state for Directed Announcement
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "ActiveFundingOpportunities" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "ActiveFundingOpportunities"
    When I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |

  @219078 @219081 @AdminUserShouldAbleToSeeTwoColumnsInApprovedOrUnderRevisionStateForDirectedAnnouncement @sprint-9-US-208408 @komal @Allocation
  Scenario: Verify Admin user should able to see the two columns in Approved/Under Revision state for Directed Announcement
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncementForAdmin" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal_Directed" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I enter "Directed_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:ADMIN Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name             | Announcement |
      | Automation ADMIN | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Approve" in the approval decision
    When I navigate to "Overview" sub tab
    #219078
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |
    #219081
    And I click on "Publish" in the page details
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |

  @219079 @AdminUserShouldAbleToSeeTwoColumnsInClosedStateForDirectedAnnouncement @sprint-9-US-208408 @komal @Allocation
  Scenario: Verify Admin user should able to see the two columns in Closed state for Directed Announcement
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{AUTOEnvData:ClosedStateAnnouncement}" in "ActiveFundingOpportunities" panel
    And I click on "View" icon for "{AUTOEnvData:ClosedStateAnnouncement}" inside flex table with id "ActiveFundingOpportunities"
    When I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |

  @219102 @219104 @VerifyEXeUserAbleToSeeSuccessMessageOnAddOrgModalAfterAddingActiveSubrecipieentOrg @sprint-9-US-208408 @komal @Allocation
  Scenario: Verify when EXE user click on the "Add Organization" button then user see modal with all the active S/R names for Directed Announcement.
  | Verify EXE user see the Success message after adding Organization & when Applicants are updated and this modal will stay open to associate more applicants: |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal_Directed" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Directed_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    #219102
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see "Add Organizations" opens in overLay window
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    Then I see the following rows under the following headers in table with id "---announcement:-:directedAddInviteApplicantTableId---" :
      | Organization                        | Applicant Type           |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | For Profit Organizations |
    #219104
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    Then I see the following messages in the page details contains:
      | Selected Applicants are associated successfully. |

  @219110 @219161 @VerifyPMusershouldremovethes/rbyclickingtheremoveicon&successmessageshouldbedisplayforDirectedAnnouncement @sprint-9-US-208408 @komal @Allocation
  Scenario: Verify PM user should remove the s/r, by clicking the remove icon, & success message should be display for Directed Announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal_Directed" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Directed_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click table top right button "Remove Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    #219110
    Then I softly see confirmation box with body "This action will remove the selected organization(s), Are you sure you want to proceed?" is displayed
    #219161
    And I click "Yes" on modal confirmation box
    Then I softly see the following messages in the page details :
      | Record removed successfully. |

  @219619 @219614 @IND/SPIUser_VerifyforDirectedannouncementinbudgetsummarysectionSubawardfloor&Subawardcellingfieldshouldbedisplay @sprint-11-US-204998 @komal @Allocation
  Scenario Outline: IND/SPI User_Verify for Directed announcement in budget summary section Subaward floor & Subaward celling field should be display.
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Financial Details"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    When I click on "Qualify" in the page details
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Financial Details"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Financial Details"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    Examples:
      | User |
      | SPI3 |
      | IND  |

  @226489 @219617 @219612 @IND/SPA/SPI-User_VerifyforCompetitiveannouncementinbudgetsummarysectionSubawardfloor&Subawardcellingfieldshouldbedisplay @sprint-11-US-204998 @komal @Allocation
  Scenario Outline: IND/SPA/SPI User_Verify for Competitive announcement in budget summary section Subaward floor & Subaward celling field should be display.
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Financial Details"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    When I click on "Qualify" in the page details
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Financial Details"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Financial Details"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    Examples:
      | User |
      | IND  |
      | SPA  |
      | SPI3 |

  @219459 @219476 @219571 @219575 @DirectedAnn_VerifyasSPIuserIcannotseesub-awardfloorandsub-awardceiling,undertheoverviewtabinopportunityoverviewsectiononAppWithFocusAreaYes @sprint-11-US-203541 @komal @Allocation
  Scenario Outline: Directed Ann_ Verify as SPA/SPI  user I see new 'Budget summary', 'Budget Summary by Focus Area' and Budgeted Amount section on App in budget tab only if Focus area set as 'Yes' on Ann
  | Directed Ann_ Verify as SPI user I cannot see  sub-award floor, sub-award ceiling under the overview tab in opportunity overview section on App |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #219459
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #219575
    Then I softly see field "Budgeted Amount" inside page block
    #219476
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    #219571
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Examples:
      | User |
      | SPA  |
      | SPI3 |

  @219479 @219572 @219577 @DirectedAnn_VerifyasINDuserIseenew'Budgetsummary'sectionontopofbudgettabonAppsetasfocusareais'No' @sprint-11-US-203541 @komal @Allocation
  Scenario: Directed Ann_ Verify as IND user I see new 'Budget summary' and 'Budgeted Amount' section on top of budget tab on App set as focus area is 'No'
    | Directed Ann_ Verify as IND user I should not see 'Budget Summary by Focus Area' section on App in budget tab if Focus area set as 'No' on Ann |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #219577
    Then I softly see field "Budgeted Amount" inside page block
    #219479
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    #219572
    Then I softly do not see "Budget Summary by Focus Area" page block displayed

  @219532 @219569 @DirectedAnn_VerifyvalidationmessageshouldbedisplaytoSPIonAppifuserenterbudgetedamountlessthansub-awardflooramountWithFocusAreaYes
  @DirectedAnn_VerifyvalidationmessageshouldbedisplaytoSPIonAppifuserenterbudgetedamountmorethansub-awardCeilingamountWithFocusAreaYes @sprint-11-US-203541 @komal @Allocation
  Scenario: Directed Ann_ Verify validation message should be display to SPI on App if user enter budgeted amount less than sub-award floor amount
  | Directed Ann_ Verify validation message should be display to SPI on App if user enter budgeted amount more than sub-award Ceiling amount  |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 900    | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    #219532
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
    #219569
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 11000  | 100        | 100            |
    When I click on "Submit Application" in the page details
#   TODO: Message disappearing shortly
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be less than or equal to the Subaward Ceiling Amount. Adjust the Budgeted Amount in the Budget period section. |

  @226900 @226896 @DirectedAnn_VerifyasSPI/SPAIsee'Requestedbudget'fieldnameshouldrenameas'BudgetedAmount'onAppunderoverviewtabwhenFocusarea=No @sprint-11-US-203541 @komal @Allocation
  Scenario Outline: Directed Ann_ Verify as SPA/SPI  user I see new 'Budget summary' and 'Budgeted Amount' section on App in budget tab only if Focus area set as 'No' on Ann
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #226900
    Then I softly see field "Budgeted Amount" inside page block
    #226896
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    Examples:
      | User |
      | SPA  |
      | SPI3 |

  @226907 @226908 @226913 @226914 @DirectedAnn_VerifyasINDuserIseenew'Budgetsummary'sectionontopofbudgettabonAppsetasfocusareais'Yes' @sprint-11-US-203541 @komal @Allocation
  Scenario: Directed Ann_ Verify as IND user I cannot see  sub-award floor and sub-award ceiling, under the overview tab in opportunity overview section on App when FA=YES
  | Directed Ann_ Verify as IND user I see 'Budget Summary by Focus Area' section on App in budget tab if Focus area set as 'Yes' on Ann |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #226907
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #226914
    Then I softly see field "Budgeted Amount" inside page block
    #226908
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    #226913
    Then I softly see "Budget Summary by Focus Area" page block displayed

  @226909 @226911 @DirectedAnn_VerifyvalidationmessageshouldbedisplaytoINDonAppifuserenterbudgetedamountlessthansub-awardflooramountWithFocusAreaYes
  @DirectedAnn_VerifyvalidationmessageshouldbedisplaytoINDonAppifuserenterbudgetedamountmorethansub-awardCeilingamountWithFocusAreaYes @sprint-11-US-203541 @komal @Allocation
  Scenario: Directed Ann_ Verify validation message should be display to IND on App if user enter budgeted amount less than sub-award floor amount
  | Directed Ann_ Verify validation message should be display to IND on App if user enter budgeted amount more than sub-award Ceiling amount  |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 900    | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation IND" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    #226909
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
    #226911
    And I refresh the page
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 11000  | 100        | 100            |
    When I click on "Submit Application" in the page details
#    TODO: Message disappearing shortly
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be less than or equal to the Subaward Ceiling Amount. Adjust the Budgeted Amount in the Budget period section. |

  @219631 @219632 @219654 @CompetitiveAnn_VerifyasSPIuserIcannotseesub-awardfloorandsub-awardceiling,undertheoverviewtabinopportunityoverviewsectiononApp @sprint-11-US-203541 @komal @Allocation
  Scenario Outline: Competitive Ann_ Verify as SPA/SPI  user I see new 'Budget summary' and 'Budget Summary by Focus Area' section on App in budget tab only if Focus area set as 'Yes' on Ann
  | Competitive Ann_ Verify as SPI user I cannot see  sub-award floor, sub-award ceiling and Budgeted Amount under the overview tab in opportunity overview section on App |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #219631
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #219661
    Then I softly see field "Budgeted Amount" inside page block
    #219632
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    #219654
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Examples:
      | User |
      | SPA  |
      | SPI3 |

  @219633 @219656 @219662 @CompetitiveAnn_VerifyasINDuserIseenew'Budgetsummary'sectionontopofbudgettabonAppsetasfocusareais'No' @sprint-11-US-203541 @komal @Allocation
  Scenario: Competitive Ann_ Verify as IND user I see new 'Budget summary' and 'Budgeted Amount' section on top of budget tab on App set as focus area is 'No'
  | Competitive  Ann_ Verify as IND user I should not see 'Budget Summary by Focus Area' section on App in budget tab if Focus area set as 'No' on Ann |
    Given I published "Competitive " type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #219662
    Then I softly see field "Budgeted Amount" inside page block
    #219633
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    #219656
    Then I softly do not see "Budget Summary by Focus Area" page block displayed

  @219642 @219648 @CompetitiveAnn_VerifyvalidationmessageshouldbedisplaytoSPIonAppifuserenterbudgetedamountlessthansub-awardflooramount
  @CompetitiveAnn_VerifyvalidationmessageshouldbedisplaytoSPIonAppifuserenterbudgetedamountmorethansub-awardCeilingamount @sprint-11-US-203541 @komal @Allocation
  Scenario: Competitive  Ann_ Verify validation message should be display to SPI on App if user enter budgeted amount less than sub-award floor amount
  | Competitive  Ann_ Verify validation message should be display to SPI on App if user enter budgeted amount more than sub-award Ceiling amount  |
    Given I published "Competitive " type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 900    | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    #219642
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
    #219648
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 11000  | 100        | 100            |
    When I click on "Submit Application" in the page details
#   TODO: Message disappearing shortly
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be less than or equal to the Subaward Ceiling Amount. Adjust the Budgeted Amount in the Budget period section. |
