@auditorHome
Feature: Validate all scenarios for Auditor Profile in Home Module

  @auditorCannotCreateEditInternalOrganizations
  Scenario Outline: Validate Auditor should not be  able to Create/Edit internal organization.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---home:-:internalOrganizationId---"
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    Then I softly cannot see row level action button "Edit" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @auditorCanViewInternalOrganizations
  Scenario Outline: Validate Auditor should have view / read  only access to record.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    Then I softly see that "Internal Organization" is in "Active" status
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @auditorPendingTask
  Scenario: Verify Auditor do not have any pending tasks by any phase and by any due date filter.
    When I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I softly see "No Records Found" inside flex table with id "HomePendingTasks"


