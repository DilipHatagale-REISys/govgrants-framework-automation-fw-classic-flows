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
    Then I collect all the soft asserts

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
    Then I collect all the soft asserts
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
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Announcement" in "ActiveFundingOpportunitiesCompitive" panel
    Then I cannot see row level action button "Edit" against "<Announcement>" in flex table with id "ActiveFundingOpportunitiesCompitive"
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
    And I perform quick search for "Automation Announcement for Auditor" in "ActiveFundingOpportunitiesCompitive" panel
    When I click on "View" icon for "Automation Announcement for Auditor" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" for "---announcement:-:fundingAccountsTableId---" flex table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Associate" for "---announcement:-:contactTableId---" flex table
    When I navigate to "Setup" sub tab
    Then I softly cannot see top right button "Associate" for "---announcement:-:objectivesTableId---" flex table
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" for "---announcement:-:approversTableId---" flex table
    Then I softly cannot see top right button "New" for "---announcement:-:reviewersTableId---" flex table
    Then I softly cannot see top right button "Submit For Approval" in page detail
    Then I softly cannot see top right button "Publish" in page detail
    Then I collect all the soft asserts