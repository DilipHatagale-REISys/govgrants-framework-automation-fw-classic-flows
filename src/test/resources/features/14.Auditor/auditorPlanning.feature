@auditorPlanning
Feature: Validate all scenarios for Auditor Profile in Planning Module

  @67761 @auditorCannotCreateProgram @deepika
  Scenario Outline: Verify that Auditor user cannot create a Focus Area
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    Then I cannot see top right button "New" for "---focusarea:-:focusAreaTableId---" flex table
    Examples:
      | User    |
      | AUDITOR |

  @67762 @auditorCannotCreateEditFocusArea
  Scenario Outline: Validate Auditor should not be able to  Create/Edit Focus area
    Given I login to "As a Grantor" app as "AUDITOR" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    When I perform quick search for "<FocusArea>" in "---focusarea:-:focusAreaTableId---" panel
    Then I softly cannot see row level action button "Edit" against "<FocusArea>" in flex table with id "---focusarea:-:focusAreaTableId---"
    And I click on "View" icon for "<FocusArea>" inside flex table with id "---focusarea:-:focusAreaTableId---"
    Then I softly cannot see top right button "Activate" in page detail
    Then I collect all the soft asserts
    Examples:
      | User    | FocusArea                               |
      | AUDITOR | Automation Permanent Focus Area |

  @67763 @otherUsersCanCreateFocusArea
  Scenario Outline: Verify that other than Auditor user all other users can create a Focus Area
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    Then I can see top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    Examples:
      | User  |
      | PM    |
      | EXE   |
      | ADMIN |

  @67764 @auditorCannotCreateProgram @deepika
  Scenario Outline: Verify that Auditor user cannot create a new Program
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    Then I cannot see top right button "New" for "---program:-:programsTableId---" flex table
    Examples:
      | User    |
      | AUDITOR |

  @67765 @otherUsersCanCreateProgram
  Scenario Outline: Verify that other than Auditor user all other users can create a new Program
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    Then I can see top right button "New" in flex table with id "---program:-:programsTableId---"
    Examples:
      | User  |
      | PM    |
      | EXE   |
      | ADMIN |

  @67766 @auditorProfileCannotCReateEditReviewApproveProgram
  Scenario Outline: Validate Auditor user should not be able to Create/Edit/ Review/Approve internal program
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "<Program>" in "---program:-:programsTableId---" panel
    Then I softly cannot see row level action button "Edit" against "<Program>" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "<Program>" inside flex table with id "---program:-:programsTableId---"
    When I navigate to "Setup" sub tab
    Then I softly cannot see top right button "Associate" for "---program:-:focusAreaTableId---" flex table
    Then I softly cannot see top right button "Associate" for "---program:-:objectivesTableId---" flex table
    Then I softly cannot see top right button "Associate" for "---program:-:kpiTableId---" flex table
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Add" for "---program:-:peerReviewTableId---" flex table
    Then I softly cannot see top right button "Add" for "---program:-:approverTableId---" flex table
    Then I softly cannot see top right button "Submit For Approval" in page detail
    Then I softly cannot see top right button "Activate" in page detail
    Then I collect all the soft asserts
    Examples:
      | User    | Program                               |
      | AUDITOR | Automation Permanent Internal Program |
