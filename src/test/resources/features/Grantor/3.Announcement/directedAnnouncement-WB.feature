@directedAnnouncementsWB @grantor-regression @grantor-parallel-regression @announcement @regression @annoucementTemp
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
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
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
    And I navigate to "Forms and Files" sub tab
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
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |
    Then I softly see value "{SavedValue:AppEgmdId}" for title "Application EGMS ID" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "Submitted to Grantor" for title "Application Status" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    And I click on hyperlink containing value "{SavedValue:AppEgmdId}"
    Then I see the header is "Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

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
  Scenario: Verify Admin user should able to see the two columns in Approved Under Revision state for Directed Announcement
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
    When I click "Associate" after selection of "{SavedValue:ADMIN Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name             | Announcement |
      | Automation ADMIN | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
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
    When I save the value from row "1" for column name "Application EGMS ID" as "AppEgmdId" from flex table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |
    Then I softly see value "{SavedValue:AppEgmdId}" for title "Application EGMS ID" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "Submitted to Grantor" for title "Application Status" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    And I click on hyperlink containing value "{SavedValue:AppEgmdId}"
    Then I see the header is "Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @219102 @219104 @VerifyEXeUserAbleToSeeSuccessMessageOnAddOrgModalAfterAddingActiveSubrecipieentOrg @sprint-9-US-208408 @komal @Allocation
  Scenario: Verify when EXE user click on the "Add Organization" button then user see modal with all the active SR names for Directed Announcement.
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
      | Organization                        | Organization Type        |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | For-profit organizations |
    #219104
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Selected Applicants are associated successfully. |

  @219110 @219161 @VerifyPMusershouldremovethesrbyclickingtheremoveicon&successmessageshouldbedisplayforDirectedAnnouncement @sprint-9-US-208408 @komal @Allocation
  Scenario: Verify PM user should remove the sr, by clicking the remove icon, & success message should be display for Directed Announcement
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

  @219619 @INDUserVerifyforDirectedannouncementinbudgetsummarysectionSubawardfloor&Subawardcellingfieldshouldbedisplay @sprint-11-US-204998 @komal @Allocation
  Scenario Outline: IND User for Directed announcement in budget summary section Subaward floor & Subaward celling field should be display.
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "INVITED_APPLICANT_IND_ORG"
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

  @219614 @SPIUserVerifyforDirectedannouncementinbudgetsummarysectionSubawardfloor&Subawardcellingfieldshouldbedisplay @sprint-11-US-204998 @komal @Allocation
  Scenario Outline: SPI User for Directed announcement in budget summary section Subaward floor & Subaward celling field should be display.
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

  @219617 @219612 @SPASPIUserVerifyforCompetitiveannouncementinbudgetsummarysectionSubawardfloor&Subawardcellingfieldshouldbedisplay @sprint-11-US-204998 @komal @Allocation
  Scenario Outline: SPA SPI User for Competitive announcement in budget summary section Subaward floor & Subaward celling field should be display.
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
      | SPA  |
      | SPI3 |

  @226489 @INDSPASPIUserVerifyforCompetitiveannouncementinbudgetsummarysectionSubawardfloor&Subawardcellingfieldshouldbedisplay @sprint-11-US-204998 @komal @Allocation
  Scenario Outline: IND User for Competitive announcement in budget summary section Subaward floor & Subaward celling field should be display.
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "INVITED_APPLICANT_IND_ORG"
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

 @RerunPooja @238301 @237744 @VerifyvalidationmessageisdisplayedtoPMuserwhenenteredrecommendedbudgetisGreaterOrlessthantheBudgetedAmountonFDMrecordwhichiscreatedfromDirectedannouncement @sprint-14-US-224179 @komal @Allocation
  Scenario Outline: Verify validation message is displayed to PM user when entered recommended budget is greater than the Budgeted Amount on FDM record which is created from Directed announcement
  | Verify validation message is displayed to PM user when entered recommended budget is less than the Budgeted Amount on FDM record which is created from Directed announcement  |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "NEGOTIATION_NO"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    And I navigate to "Funding Decision Memo" sub tab
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    #238301
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 2000               | 1500                    | Yes                   | Recommended |
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Funding Decision Memo Tab - Recommended budget must be equal to the Budgeted Amount. |
    #237744
    And I refresh the page
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget |
      | <Announcement Name> | 500                |
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Funding Decision Memo Tab - Recommended budget must be equal to the Budgeted Amount. |

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PM   |

  @237897 @VerifyAdminuserisabletocreatesubawardfromFDMwhenenteredrecommendedbudgetisequaltoBudgetedAmountonFDMrecordwhichiscreatedfromDirectedannouncement @sprint-14-US-224179 @komal @Allocation
  Scenario Outline: Verify Admin user is able to create subaward from FDM when entered recommended budget is equal to Budgeted Amount on FDM record which is created from Directed announcement
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "NEGOTIATION_NO-Automation ADMIN user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    #237897
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000               | 1000                    | Yes                   | Recommended |
    And I click on "Submit for Approval" in the page details
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I pause execution for "7" seconds
    Then I softly see that "Subaward" is in "Created" status

    Examples:
      | Announcement Name                            | User  |
      | {SavedValue:Automation Runtime Announcement} | ADMIN |

  @220402 @VerifyAdminusershouldabletoaddmorethanoneBudgetPeriodunderbudgetperioddetailsforDirectedAnnouncement @sprint-8-US-208408 @komal @Allocation
  Scenario: Verify Admin user should able to add more than one Budget Period under budget period details for Directed Announcement
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement_Admin" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    Then I see the following rows under the following headers in table with id "---announcement:-:budgetPeriodTableId---" :
      | Budget Period Name |
      | BP01               |
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    Then I see the following rows under the following headers in table with id "---announcement:-:budgetPeriodTableId---" :
      | Budget Period Name |
      | BP01               |
      | BP02               |

  @219346 @234712 @DirectedAnnVerifyasPMuserIcanseeRecommendedBudgetcolumnisvisiblewhenAppstatusisnegotiationinitiated @sprint-13-US-224612 @sprint-10-US-203669 @komal @Allocation
  Scenario Outline:Directed Ann as PM user I can see Recommended Budget column is visible when App status is negotiation initiated
  | Direct Ann>>Verify PM when negotiation is initiated during FDM or from app layout then user should not get validation on UI on send to subrecipient button when the budgeted Amount is equal to the Recommended Budget |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    And I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    #234712
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Overview: Project Information" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    #219346
    And I refresh the page
    When I navigate to "Budget" sub tab
    Then I softly cannot see field "Recommended Budget" inside page block

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PM   |

  @234354 @234372 @DirectAnnVerifyPMusercanseetheRecommendedAmountBudgetedAmount&StateAllocationcolumnonRecommendedapplicationsectiononFDMlayout @sprint-13-US-224612 @komal @Allocation
  Scenario Outline: Direct Ann PM user can see the 'Recommended Amount' 'Budgeted Amount' 'State Allocation' column on Recommended application section on FDM layout
  | Direct Ann PM user can see the Show Subaward floor and Subaward Ceiling under overview section on FDM layout |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Funding Decision Memo" sub tab
    #234354
    Then I see the following headers in table with id "flexGridFundingDecisionMemoApplications" :
      | Recommended Budget | Budgeted Amount | State Allocation |
    #234372
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PM   |

  @234360 @DirectAnnVerifyPMusercanseeeditedtheBudgetedAmountfieldwhenusersendtheapplicationtosrfornegotiation&subrecipientaddbudgetonitwhenonceFDMisapproved @sprint-13-US-224612 @komal @Allocation
  Scenario Outline: Direct Ann PM user can see edited the Budgeted Amount field when user send the application to sr for negotiation subrecipient add budget on it when once FDM is approved
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1500               | 1500                    | Yes                   | Recommended |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Budget: Budget Details" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1500   | 100        | 100            | 100            |
    And I refresh the page
    And I navigate to "Budget" sub tab
    #234360
    Then I softly see field "Budgeted Amount" as "$1,500.00"
    Then I softly see field "Recommended Budget" as "$1,500.00"

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PM   |

  @234362 @DirectAnnVerifyPOusercanseethevalidationwhenthebudgetedAmountisnotequaltotheRecommendedamountwhenusertriedtoconverttoaward @sprint-13-US-224612 @komal @Allocation
  Scenario Outline: Direct Ann PO user can see the validation when the budgeted Amount is not equal to the Recommended amount when user tried to convert to award
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default-Automation PO user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1500               | 1500                    | Yes                   | Recommended |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    Then I can see row level action button "Create Subaward" against "<Announcement Name>" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    #234362
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The Budgeted Amount must be equal to The Recommended Budget Amount. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field and send the application back for revision to the subrecipient. |

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PO   |

  @234715 @DirectAnnVerifyPOusershouldseevalidationonsendtosrbuttonwhennegotiationisinitiatedduringFDMuserwhenuserselectonlybudgetsummarybyFocusAreasectionfornegotiationevenwhenbudgetedamountisequaltorecommendedamount @sprint-13-US-224612 @komal @Allocation
  Scenario Outline: Direct Ann PO user should see validation on send to s/r button when negotiation is initiated during FDM user when user select only budget summary by Focus Area section for negotiation even when budgeted amount is equal to recommended amount
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default-Automation PO user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    And I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    #234715
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    And I softly see the following messages in the page details contains:
      | Negotiation Tab: Please select "Budget Tab: Budget Details" with "Budget Tab: Budget Summary by Focus Area" in the Application Sections for the Negotiation field. |

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PO   |

  @234920 @DirectAnnVerifyPOusershouldseevalidationonsendtosrbuttonwhennegotiationisinitiatedCustomizedreviewstepwhenuserselectonlybudgetsummarybyFocusAreasectionfornegotiation @sprint-13-US-224612 @komal @Allocation
  Scenario Outline: Direct Ann PO user should see validation on send to s/r button when negotiation is initiated Customized review step when user select only budget summary by Focus Area section for negotiation
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
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
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PO | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "7" seconds
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "New" :
      | Step Order | Step Name       | Description |
      | 4          | Automation Test | Testing     |
    And I expand nested table containing column value "Automation Test"
    When I enter the following values into flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "New" :
      | Form Name       |
      | Automation Test |
    And I expand nested table containing column value "Automation Test"
    And I click on "Review Form" icon for "Automation Test" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    When I enter the following values into flex table with id "---applicationReview:-:reviewPanelCategoriesTableId---" by clicking "New" :
      | Section Order | Section Header  |
      | 1             | Automation Test |
    And I pause execution for "3" seconds
    #And I close "Review Form" modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    And I wait for "10" seconds
    When I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "SME Review" in the page details
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    #234920
    And I softly see the following messages in the page details contains:
      | Negotiation Tab: Please select "Budget Tab: Budget Details" with "Budget Tab: Budget Summary by Focus Area" in the Application Sections for the Negotiation field. |

    Examples:
      | Announcement Name                                     |
      | {SavedValue:Automation Runtime Directed Announcement} |

  @219360 @DirectedAnnVerifyasAdminuserIcanseeRecommendedbudgetfieldisvisibleunderbudgetsummarywhenAppstatusisnegotiationsubmitted @sprint-13-US-224612 @komal @Allocation @wip
  Scenario Outline: Directed Ann as Admin user I can see Recommended budget field is visible under budget summary when App status is negotiation submitted
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default-Automation ADMIN user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    And I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    And I enter value "Budget: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    Then I softly can see top right button "Complete Negotiation" in page detail
    #219360
    When I navigate to "Budget" sub tab
    Then I softly see field "Recommended Budget" inside page block

    Examples:
      | Announcement Name                            | User  |
      | {SavedValue:Automation Runtime Announcement} | ADMIN |

  @234918 @DirectAnnVerifyAdminusershouldseevalidationonsendtosrbuttonwhennegotiationisinitiatedonSMEreviewstepwhenuserselectonlybudgetsummarybyFocusAreasectionfornegotiation @sprint-13-US-224612 @komal @Allocation
  Scenario Outline: Direct Ann Admin user should see validation on send to s/r button when negotiation is initiated on SME review step when user select only budget summary by Focus Area section for negotiation
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default-Automation ADMIN user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "SME Review" in the page details
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    #234918
    And I softly see the following messages in the page details contains:
      | Negotiation Tab: Please select "Budget Tab: Budget Details" with "Budget Tab: Budget Summary by Focus Area" in the Application Sections for the Negotiation field. |

    Examples:
      | Announcement Name                            |
      | {SavedValue:Automation Runtime Announcement} |

  @234714 @234369 @DirectAnnVerifyAdminusershouldnotseevalidationonsendtosrbuttonwhennegotiationisinitiatedduringFDMuserwhenuserselectonlyBudgettabBudgetdetailssectionfornegotiationwhenrecommendedamountisequaltoBudgetedamount @sprint-13-US-224612 @komal @Allocation
  Scenario Outline: Direct Ann Admin user should not see validation on send to s/r button when negotiation is initiated during FDM user when user select only Budget tab Budget details section for negotiation when recommended amount is equal to Budgeted amount
  | Direct Ann>>Verify Admin user can see the value "Budget Tab: Focus Area" replaced with "Budget Tab: Budget Summary by Focus Area" in the Application section for Negotiation |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default-Automation ADMIN user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    #234369
    Then I see multipicklist field "fieldApplicationSectionsForRevision__c" contains value "Budget Tab: Budget Summary by Focus Area" under list "Application Sections for Revision - Available"
    Then I do not see multipicklist field "fieldApplicationSectionsForRevision__c" contains value "Budget: Focus Area" under list "Application Sections for Revision - Available"
    #234714
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget: Budget Details" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I cannot see the following messages in the page details contains:
      | Negotiation Tab: Please select "Budget Tab: Budget Details" with "Budget Tab: Budget Summary by Focus Area" in the Application Sections for the Negotiation field. |
    Then I softly see field "Status" as "Negotiation Initiated"

    Examples:
      | Announcement Name                            | User  |
      | {SavedValue:Automation Runtime Announcement} | ADMIN |

  @234412 @DirectAnnVerifyEXEusercannotseethevalidationwhenthebudgetedAmountisequaltotheRecommendedamountwhenusertriedtoconverttoaward @sprint-13-US-224612 @komal @Allocation
  Scenario Outline: Direct Ann EXE user can not see the validation when the budgeted Amount is equal to the Recommended amount when user tried to convert to award
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    #234368
    And I navigate to "Funding Decision Memo" sub tab
    Then I see the following rows under the following columns in table with id "flexGridFundingDecisionMemoApplications" :
      | Application Title   | Recommended Budget | Budgeted Amount |
      | <Announcement Name> | $1,000.00          | $1,000.00       |
    Then I can see row level action button "Create Subaward" against "<Announcement Name>" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    Then I can see row level action button "Initiate Negotiation" against "<Announcement Name>" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I pause execution for "4" seconds
    Then I softly see that "Subaward" is in "Created" status

    Examples:
      | Announcement Name                            |
      | {SavedValue:Automation Runtime Announcement} |

  @RerunPooja @234368 @234371 @DirectAnnVerifyEXEusercaninlineedittheRecommendedBudgetfieldunderRecommendedApplicationsectionbeforeFDMapproval @sprint-13-US-224612 @komal @Allocation
  Scenario Outline: Direct Ann EXE user can inline edit the Recommended Budget field under Recommended Application section before FDM approval
  | DirectAnn>>Verify EXE when negotiation is initiated during FDM or from app layout then it must mandatory for user to select the "Budget: Budget Details " picklist value  for Negotiation field when the budgeted Amount is not equal to the Recommended Budget |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "INVITED_APPLICANT_IND_ORG-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I navigate to "Funding Decision Memo" sub tab
    #234368
    Then I softly can see row level action button "Edit" against "<Announcement Name>" in flex table with id "flexGridFundingDecisionMemoApplications"
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1500               | 1500                    | Yes                   | Recommended |
    And I click on "Submit for Approval" in the page details
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    Then I softly cannot see row level action button "Edit" against "<Announcement Name>" in flex table with id "flexGridFundingDecisionMemoApplications"
    #234371
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I softly see the following messages in the page details contains:
      | Negotiation Tab: Please select "Budget Tab: Budget Details" with "Budget Tab: Budget Summary by Focus Area" in the Application Sections for the Negotiation field. |

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | EXE  |

  @RerunPooja @234234 @234238 @234240 @DirectAnnSPIusercanseeErrormessageonsubmittograntorbuttonwhenuserresubmittheapplicationafternegotiationFromFDMifcheckwhentheBudgetedamountmustbeequaltotheRecommendedAmount @sprint-13-US-224176 @komal @Allocation
  Scenario Outline: Direct Ann SPI user can see Error message on submit to grantor button when user resubmit the application after negotiation (From FDM), if check when the Budgeted amount must be equal to the  Recommended Amount
  | Direct Ann>> Verify SPI user can able to edit the Budget Summary by focus area section When the grantor select this Budget Tab: Budget Summary by Focus Area" in the picklist for negotiation (From FDM)& submit application to s/r side |
  | Direct Ann>> Verify SPI user can able to edit the Budget details section When the grantor select this Budget Tab: Budget Summary by Focus Area" in the picklist for negotiation (From FDM)then mandatory to select Budget details from picklist for negotiation |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
     And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1500               | 1500                    | Yes                   | Recommended |
    And I click on "Submit for Approval" in the page details
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Budget: Budget Details" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    #234234
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Budgeted Amount must be equal to the Recommended Amount. |
    #234238
    And I refresh the page
    When I navigate to "Budget" sub tab
    And I wait for "3" seconds
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    #234240
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1500   | 100        | 100            | 100            |
    And I refresh the page
    When I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,500.00"

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PM   |

  @RerunPooja @234235 @234239 @234237 @DirectAnnINDusercanseeErrormessageonsubmittograntorbuttonwhenuserresubmittheapplicationafternegotiationFromFDMifcheckwhentheBudgetedamountmustbeequaltotheRecommendedAmount @sprint-13-US-224176 @komal @Allocation
  Scenario Outline: Direct Ann IND user can see Error message on submit to grantor button when user resubmit the application after negotiation From FDM if check when the Budgeted amount must be equal to the Recommended Amount
  | Direct Ann>> Verify IND user can able to edit the Budget Summary by focus area section When the grantor select this Budget Tab: Budget Summary by Focus Area" in the picklist for negotiation (From FDM)& submit application to s/r side |
  | Direct Ann>> Verify IND user can not see Error message on submit to grantor button when user resubmit the application after negotiation (From FDM), if  Budgeted amount is equal to the  Recommended Amount  |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "INVITED_APPLICANT_IND_ORG"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1500               | 1500                    | Yes                   | Recommended |
    And I click on "Submit for Approval" in the page details
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Budget: Budget Details" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    #234235
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Budgeted Amount must be equal to the Recommended Amount. |
    #234239
    And I refresh the page
    When I navigate to "Budget" sub tab
    And I wait for "3" seconds
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    #234237
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1500   | 100        | 100            | 100            |
    And I refresh the page
    When I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,500.00"
    When I click on "Submit to Grantor" in the page details
    Then I cannot see the following messages in the page details contains:
      | Budget Tab - The Budgeted Amount must be equal to the Recommended Amount. |
    Then I softly see field "Status" as "Negotiation Submitted"

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PM   |

  @234225 @234229 @234228 @CompAnnSPIusercanseeErrormessageonsubmittograntorbuttonwhenuserresubmittheapplicationafternegotiationFromFDMifcheckwhentheBudgetedamountmustbeequaltotheRecommendedAmount @sprint-13-US-224176 @komal @Allocation
  Scenario Outline: Comp Ann SPI user can see Error message on submit to grantor button when user resubmit the application after negotiation From FDM if check when the Budgeted amount must be equal to the  Recommended Amount
  | Direct Ann>> Verify SPI user can able to edit the Budget Summary by focus area section When the grantor select this Budget Tab: Budget Summary by Focus Area" in the picklist for negotiation (From FDM)& submit application to s/r side |
  | Direct Ann>> Verify SPI user can able to edit the Budget details section When the grantor select this Budget Tab: Budget Summary by Focus Area" in the picklist for negotiation (From FDM)then mandatory to select Budget details from picklist for negotiation |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1500               | 1500                    | Yes                   | Recommended |
    And I click on "Submit for Approval" in the page details
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Budget: Budget Details" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    #234225
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Budgeted Amount must be equal to the Recommended Amount. |
    #234229
    And I refresh the page
    When I navigate to "Budget" sub tab
    And I wait for "3" seconds
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    #234228
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1500   | 100        | 100            | 100            |
    And I refresh the page
    When I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,500.00"
    When I click on "Submit to Grantor" in the page details
    Then I cannot see the following messages in the page details contains:
      | Budget Tab - The Budgeted Amount must be equal to the Recommended Amount. |
    Then I softly see field "Status" as "Negotiation Submitted"

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PM   |

  @234227 @234231 @234233 @CompAnnINDusercanseeErrormessageonsubmittograntorbuttonwhenuserresubmittheapplicationafternegotiationFromFDMifcheckwhentheBudgetedamountmustbeequaltotheRecommendedAmount @sprint-13-US-224176 @komal @Allocation
  Scenario Outline: Comp Ann IND user can see Error message on submit to grantor button when user resubmit the application after negotiation From FDM if check when the Budgeted amount must be equal to the Recommended Amount
  | Comp Ann>> Verify IND user can able to edit the Budget Summary by focus area section When the grantor select this Budget Tab: Budget Summary by Focus Area" in the picklist for negotiation (From FDM)& submit application to s/r side |
  | Comp Ann>> Verify IND user can able to edit the Budget details section When the grantor select this Budget Tab: Budget Summary by Focus Area" in the picklist for negotiation (From FDM)then mandatory to select Budget details from picklist for negotiation |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1500               | 1500                    | Yes                   | Recommended |
    And I click on "Submit for Approval" in the page details
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Budget: Budget Details" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    #234227
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Budgeted Amount must be equal to the Recommended Amount. |
    #234231
    And I refresh the page
    When I navigate to "Budget" sub tab
    And I wait for "3" seconds
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    #234233
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1500   | 100        | 100            | 100            |
    And I refresh the page
    When I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,500.00"

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PM   |

  @274013 @ValidateAnnownerPMUsershouldseefollowingcolumnnamesinthetableunderinvitedapplicantssectionwhenAnnisinPublishedApprovedClosedandUnderRevisionstatus @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate Ann owner(PM User) should see following column names in the table under invited applicants section when Ann is in Published, Approved, Closed, and Under Revision status
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PO | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | EGMS ID | Applicants  | Application EGMS ID | Application Status |Last Updated By | Last Updated |
    And I wait for "4" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | EGMS ID | Applicants  | Application EGMS ID | Application Status |Last Updated By | Last Updated |
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | EGMS ID | Applicants  | Application EGMS ID | Application Status |Last Updated By | Last Updated |
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    And I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | EGMS ID | Applicants  | Application EGMS ID | Application Status |Last Updated By | Last Updated |
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    And I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | EGMS ID | Applicants  | Application EGMS ID | Application Status |Last Updated By | Last Updated |
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{AUTOEnvData:ClosedStateAnnouncement}" in "ActiveFundingOpportunities" panel
    And I click on "View" icon for "{AUTOEnvData:ClosedStateAnnouncement}" inside flex table with id "ActiveFundingOpportunities"
    When I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | EGMS ID | Applicants  | Application EGMS ID | Application Status |Last Updated By | Last Updated |

  @111111
  Scenario: Negotiation Workflow
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
