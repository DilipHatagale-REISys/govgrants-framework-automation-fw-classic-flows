@auditorCloseout @auditor
Feature: Validate all scenarios for Auditor Profile in Closeout Request module

  @auditorCannotCreateCloseout
  Scenario: Validate Auditor should not be  able to  Create Closeout Request
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Permanent Award" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    Then I cannot see top right button "New" in flex table with id "---closeout:-:closeoutTableId---"

  @auditorCannotViewOverriddenCloseout
  Scenario: Validate Auditor cannot have view access to "Overrridden Status" Closoeut Record
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "Overridden" in "ProjectPeriodCloseoutGrantor" panel
    And I click on "View" icon for "Overridden" inside flex table with id "ProjectPeriodCloseoutGrantor"
    Then I see "No Records Found" inside flex table with id "ProjectPeriodCloseoutGrantor"

    @auditorCannotEditCreatedCloseoutRecordbyPM
    Scenario: Validate Auditor should not be  able to  Edit Closeout Request record created by PM
      When I login to "As a Grantor" app as "dynamicUser" user
      And I navigate to "Grants" tab
      When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
      And I click toggle button to select "Grants - Active"
      When I perform quick search for "Automation Permanent Award" in "---closeout:-:grantsTableId---" panel
      And I click on "View" icon for "Automation Permanent Award" inside flex table with id "---closeout:-:grantsTableId---"
      When I navigate to "Requests" sub tab
      And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
      When I enter "Creation" values from "Closeout_Field_Values.xlsx"
      And I click modal button "Save and Continue"
      And I enter "Edition" values from "Closeout_Field_Values.xlsx"
      When I click on "Save" in the page details
      And I get the "EGMS ID"
      When I re-login to "As a Grantor" app as "Auditor" user on "INTERNAL" portal
      And I navigate to "Closeout" tab
      When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
      And I click toggle button to select "Project Period Closeouts - All"
      And I perform quick search for "Record Id" in "ProjectPeriodCloseoutGrantor" panel
      Then I see "No Records Found" inside flex table with id "ProjectPeriodCloseoutGrantor"




