@awardFromFDMWithAPI @regression
Feature: Validate all scenarios of Subaward From FDM and activating an Award using API

  @awardSiteVisitAndDeskReview
  Scenario Outline: Validate award site visit and desk review creation
    Given I delete the record "Automation Announcement for FDM" from the object "Progress Report"
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I delete the record "Automation Site Visit" from the object "Site Visit"
    And I delete the record "Automation Announcement for FDM" from the object "FDM"
    When I login to "As a Grantor" app as "dynamicUser" user
    Given I created award from approved FDM with announcement "Automation Announcement for FDM"
    And I activate award from FDM having application name "Automation Announcement for FDM"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Automation Announcement for FDM" in "ActiveGrants" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "flexGridRelatedAwards1"
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Site Visit" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"
    And I enter "Desk Review" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    Examples:
      | Award Name                      | Grant Name                      |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @38224 @awardHappyPathFromFDM @productBusinessFlowSanity
  Scenario: : Validate  the activation of subaward from FDM happy path and the status changes to Activated
    Given I delete the record "Automation Announcement for FDM" from the object "Progress Report"
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I delete the record "Automation Site Visit" from the object "Site Visit"
    And I delete the record "Automation Announcement for FDM" from the object "FDM"
    When I login to "As a Grantor" app as "dynamicUser" user
    Given I created award from approved FDM with announcement "Automation Announcement for FDM"
    And I activate award from FDM having application name "Automation Announcement for FDM"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Automation Announcement for FDM" in "ActiveGrants" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "flexGridRelatedAwards1"
    Then I see status in Progress-bar is "Activated" and is "green"

  @75517 @75519 @75521 @75518 @grantRelateLogsDetails
  Scenario Outline: To verify user able to search grant in grant section in Related log tab of announcement.
    Given I delete the record "Automation Announcement for FDM" from the object "Progress Report"
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I delete the record "Automation Site Visit" from the object "Site Visit"
    And I delete the record "Automation Announcement for FDM" from the object "FDM"
    When I login to "As a Grantor" app as "dynamicUser" user
    Given I created award from approved FDM with announcement "Automation Announcement for FDM"
    And I activate award from FDM having application name "Automation Announcement for FDM"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "<Grant Name>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I navigate to "Related Log" sub tab
    Then I softly see value "<Grant Name>" for title "Grant Title" inside table "---subAwardFromFDM:-:relatedloggrant---"
    And I click on advance filter "#advfAnnouncementActiveGrants" of table id "---announcement:-:annChecklist---"
    And I enter advance filter values inside id "advfAnnouncementActiveGrants"
      | EGMS ID | Contains | Invalid |
    Then I softly see "No Records Found" inside flex table with id "---subAwardFromFDM:-:relatedloggrant---"
    And I refresh the page
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---subAwardFromFDM:-:relatedloggrant---"
    And I click on advance filter "#advfAnnouncementActiveGrants" of table id "---announcement:-:annChecklist---"
    And I enter advance filter values inside id "advfAnnouncementActiveGrants"
      | EGMS ID | Contains | Record Id |
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---subAwardFromFDM:-:relatedloggrant---"
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:relatedloggrant---"
    Then I softly see field "Subaward" as "<Grant Name>"
    Examples:
      | Grant Name                      |
      | Automation Announcement for FDM |

  @75528 @FederalGrantRelateLogsDetails
  Scenario Outline: To verify user able to search Active Federal/NGO grant in Active Federal/NGO grant section in Related log tab of announcement
    Given I delete the record "Automation Announcement for FDM" from the object "Progress Report"
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I delete the record "Automation Site Visit" from the object "Site Visit"
    And I delete the record "Automation Announcement for FDM" from the object "FDM"
    When I login to "As a Grantor" app as "dynamicUser" user
    Given I created award from approved FDM with announcement "Automation Announcement for FDM"
    And I activate award from FDM having application name "Automation Announcement for FDM"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "<Grant Name>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I navigate to "Related Log" sub tab
    Then I softly see value "<Grant Name>" for title "Grant Title" inside table "---subAwardFromFDM:-:relatedloggrant---"
    Examples:
      | Grant Name                      |
      | Automation Announcement for FDM |