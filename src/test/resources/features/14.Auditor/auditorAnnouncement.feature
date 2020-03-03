@auditorAnnouncement @auditor
Feature: Validate all scenarios for Auditor Profile in Announcement Module

  @69159 @auditorCannotCreateAnnouncement
  Scenario: Validate Auditor should not be able to  Create/Edit Announcement
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Draft"
    Then I softly cannot see top right button "New" in flex table with id "ActiveFundingOpportunitiesFormula"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    Then I softly cannot see top right button "New" in flex table with id "ActiveFundingOpportunitiesCompitive"
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Draft"
    Then I softly cannot see top right button "New" in flex table with id "ActiveFundingOpportunities"

  @69160 @otherUsersCanCreateAnnouncement
  Scenario Outline: Verify that other than Auditor user all other users can create a Announcement
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Draft"
    Then I softly can see top right button "New" in flex table with id "ActiveFundingOpportunitiesFormula"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    Then I softly can see top right button "New" in flex table with id "ActiveFundingOpportunitiesCompitive"
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Draft"
    Then I softly can see top right button "New" in flex table with id "ActiveFundingOpportunities"
    Examples:
      | User  |
      | PM    |
      | EXE   |
      | ADMIN |

  @69161 @auditorProfileCannotEditAnnouncement
  Scenario Outline: Validate Auditor user should not be able to Edit Announcement
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "<Announcement>" in "ActiveFundingOpportunitiesCompitive" panel
    Then I see the following rows under the following headers in table with id "ActiveFundingOpportunitiesCompitive" :
      | Announcement Name | Actions |
      | <Announcement>    | View    |
    Examples:
      | User    | Announcement                                |
      | AUDITOR | Automation Announcement for Pre-Application |

  @69162 @auditorCompetitiveAnnouncement
  Scenario: Validate Auditor should not be able to Create/Edit/Review/Approve announcement
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    Then I softly cannot see top right button "New" in flex table with id "ActiveFundingOpportunitiesCompitive"
    And I perform quick search for "Automation Announcement for Pre-Application" in "ActiveFundingOpportunitiesCompitive" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I navigate to "Setup" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see top right button "Submit For Approval" in page detail
    Then I softly cannot see top right button "Publish" in page detail