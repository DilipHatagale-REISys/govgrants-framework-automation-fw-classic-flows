@auditorAmendmentRequest @auditor
Feature: Validate all scenarios for Auditor Profile in Amendment Request module

  @69172 @auditorCannotCreateAmendmentRequest @smoke
  Scenario: Validate Auditor should not be  able to  Create Amendment request
    Given I login to "As a Grantor" app as "Auditor" user
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    Then I cannot see top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"

  @69174 @auditorViewAccessToAmendmentRequest
  Scenario: Validate Auditor should have view Amendment Request Record that is created by PM user - Budget Period Change
    Given I delete the record "Automation Award for Amendment Request" from the object "Amendment Request"
    And I delete the record "Automation Award for Amendment Request" from the object "Payment Request"
    And I delete the record "Automation Award for Amendment Request" from the object "subaward"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    And I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Award for Amendment Request" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "Automation Award for Amendment Request" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "Automation Award for Amendment Request"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "Auditor" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Created" in "---auditor:-:amendmentRequestTableId---" panel
    Then I can see row level action button "View" against "Created" in flex table with id "---auditor:-:amendmentRequestTableId---"

  @69871 @audiorCanViewAmendmentRecordsofAllStatus @wip
  Scenario: Validate whether Audior Profile all the amendment records created by PM profile
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "Funding Change" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see values "	Funding Change" and "State" inside table

