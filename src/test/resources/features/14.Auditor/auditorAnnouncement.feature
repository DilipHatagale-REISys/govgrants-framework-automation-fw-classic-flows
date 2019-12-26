@auditorAnnouncement
Feature: Validate all scenarios for Auditor Profile in Announcement Module

  @auditorCannotCreateAnnouncement
  Scenario: Validate Auditor should not be able to  Create/Edit Focus area
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

  @otherUsersCanCreateAnnouncement
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

  @auditorProfileCannotEditAnnouncement @wip
  Scenario Outline: Validate Auditor user should not be able to Create/Edit/ Review/Approve internal program
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Draft"
    When I perform quick search for "<Announcement>" in "ActiveFundingOpportunitiesFormula" panel
    Then I cannot see row level action button "Edit" against "<Announcement>" in flex table with id "ActiveFundingOpportunitiesFormula"
    Examples:
      | User    | Announcement                                   |
      | AUDITOR | Automation Announcement for Application Intake |
