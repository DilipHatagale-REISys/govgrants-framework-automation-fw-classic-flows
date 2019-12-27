@auditorApplication @wip
Feature: Validate all scenarios for Auditor Profile in Application Module

  @Auditor
  Scenario: Auditor should have view / read  only access to record.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Auditor" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Auditor" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I softly cannot see top right button "Qualify" in page detail
    Then I softly cannot see top right button "Create Application" in page detail
    Then I collect all the soft asserts