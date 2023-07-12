@awardFromFDMWithAPI @grantor-regression @grantor-parallel-regression @grantAndAward @regression
Feature: Validate all scenarios of Subaward From FDM and activating an Award using API

  Background: Activating Subaward from FDM using API
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "dynamicUser" user

  @50999 @51000 @awardSiteVisitAndDeskReview
  Scenario Outline: Validate award site visit and desk review creation
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "GrantorActiveGrantsgrid" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "GrantorActiveGrantsgrid" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "flexGridRelatedAwards1" without waiting for record
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Site Visit" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"
    And I enter "Desk Review" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @75517 @75519 @75521 @75518 @grantRelateLogsDetails
  Scenario Outline: To verify user able to search grant in grant section in Related log tab of announcement.
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "<Grant Name>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "ActiveFundingOpportunitiesCompitive" without waiting for record
    When I navigate to "Related Log" sub tab
    Then I softly see value "<Grant Name>" for title "Grant Title" inside table "---subAwardFromFDM:-:relatedloggrant---"
    And I click on advance filter "#advfAnnouncementActiveGrants" of table id "---announcement:-:AnnouncementGrantsTableId---"
    And I enter advance filter values inside id "advfAnnouncementActiveGrants"
      | EGMS ID | Contains | Invalid |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:AnnouncementGrantsTableId---"
    And I refresh the page
    Then I softly see value "<Grant Name>" for title "Grant Title" inside table "---announcement:-:AnnouncementGrantsTableId---"
    And I refresh the page
    And I save the value from row "1" for column name "EGMS ID" as "GrantEGMSID" from flex table "---announcement:-:AnnouncementGrantsTableId---"
    And I click on advance filter "#advfAnnouncementActiveGrants" of table id "---announcement:-:AnnouncementGrantsTableId---"
    And I enter advance filter values inside id "advfAnnouncementActiveGrants"
      | EGMS ID | Contains | {SavedValue:GrantEGMSID} |
    Then I softly see value "{SavedValue:GrantEGMSID}" for title "EGMS ID" inside table "---subAwardFromFDM:-:relatedloggrant---"
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardFromFDM:-:relatedloggrant---" without waiting for record
    And I save the field labeled "Active Subaward" as "ActiveSubaward"
    Then I softly see field "Active Subaward" as "{SavedValue:ActiveSubaward}"
    Examples:
      | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @75528 @FederalGrantRelateLogsDetails
  Scenario Outline: To verify user able to search Active Federal/NGO grant in Active Federal/NGO grant section in Related log tab of announcement
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "<Grant Name>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "ActiveFundingOpportunitiesCompitive" without waiting for record
    When I navigate to "Related Log" sub tab
    Then I see value "<Grant Name>" for title "Grant Title" inside table "---subAwardFromFDM:-:relatedloggrant---"
    Examples:
      | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @660961 @defaultPackageAssociateWithSubaward1 @aashish
  Scenario: : To Verify that the Default package associated with subaward should be displayed correctly |
  To verify that Initiate Desk review button appear on site visit table of management tab of Award owner after Subaward is activated
    Given I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "GrantorActiveGrantsgrid" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "GrantorActiveGrantsgrid" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "flexGridRelatedAwards1" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    Then I softly see that "Subaward" is in "Activated" status
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Files" sub tab
    Then I softly see value "Grantor Site Visit Forms" for title "Package Name" inside table "---subAwardStandAlone:-:grantpkagestableid---"
    Then I softly see value "Grantor Progress Report Forms" for title "Package Name" inside table "---subAwardStandAlone:-:grantpkagestableid---"
    Then I softly see value "Organization Desk Review" for title "Package Name" inside table "---subAwardStandAlone:-:grantpkagestableid---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly can see top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"

  @68650 @continuationAndVersionCheckAfterPeriodicRenewalAmendmentFromFDM @jitendra @aashish @smoke
  Scenario Outline: Validate that after periodic renewal amendment Subaward type changes from Initial to Continuation and the Version number is still retained at 1 also the Status changes to pending Activation from Activated
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "Project Period Start Date"
    And I save the field labeled "Project Period End Date" as "Project Period End Date"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I refresh the page
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriod"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date                             | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:Project Period Start Date} | {SavedValue:updatedBudgetPeriod} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request  |
      | {SavedValue:PM Username} | Amendment Request  |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Amendment Request |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request  |
      | {SavedValue:FO Username} | Amendment Request  |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Subaward Budget | Cash Match | Non Cash Match |
      | Construction    | 1000                    | 100        | 0              |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Subaward Type" as "continuation"
    Then I softly see field "Version Number" as "1"
    Then I softly see that "{SavedValue:Automation Runtime FDM Announcement}" is in "Pending Activation" status
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @75542 @75541 @validateFederalNGORelateLogsDetails @meenakshi @wip
  Scenario Outline: To verify user able to search grant in grant section in Related log tab of announcement.
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "<Grant Name>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "ActiveFundingOpportunitiesCompitive" without waiting for record
    When I navigate to "Related Log" sub tab
    And I click on advance filter "#advfGranteeGrantsByAccount" of table id "---announcement:-:activeFederalTableId---"
    And I enter advance filter values inside id "advfGranteeGrantsByAccount"
      | EGMS ID | Contains | Invalid |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:activeFederalTableId---"
    And I refresh the page
    And I click on advance filter "#advfGranteeGrantsByAccount" of table id "---announcement:-:activeFederalTableId---"
    And I enter advance filter values inside id "advfGranteeGrantsByAccount"
      | EGMS ID | Contains | Record Id |
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---announcement:-:activeFederalTableId---"
    Examples:
      | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} |
