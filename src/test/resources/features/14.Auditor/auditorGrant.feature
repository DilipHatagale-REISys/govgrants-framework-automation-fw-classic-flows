@auditorGrant/Award @auditor
Feature: Validate all scenarios for Auditor Profile in Grant/Award

  @69168 @auditorCannotCreateGrantandSubaward
  Scenario: Validate Auditor should not be able to  Create/Edit Grant/subaward
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I perform quick search for "Automation Permanent Award" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "Automation Permanent Award" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I navigate to "Subawards" sub tab
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    Then I collect all the soft asserts

  @69169 @auditorCannotEDitActiveGrantAward
  Scenario: Validate Auditor do not have Edit permission for Grant/Subaward
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "Automation Permanent Award" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Award" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I click on "View" icon for "Automation Permanent Award" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I navigate to "Subawards" sub tab
    And I perform quick search for "Automation Permanent Award" in "---subAwardStandAlone:-:subawardsTableId---" panel
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Award" in flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    Then I collect all the soft asserts

  @69170 @auditorCanViewActiveGrantAward
  Scenario: Validate Auditor should have view / read  only access to Active Grant/Award
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "Automation Permanent Award" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "Automation Permanent Award" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see status in Progress-bar is "Active" and is "green"
    And I navigate to "Subawards" sub tab
    And I perform quick search for "Automation Permanent Award" in "---subAwardStandAlone:-:subawardsTableId---" panel
    When I click on "View" icon for "Automation Permanent Award" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    Then I softly see status in Progress-bar is "Activated" and is "green"
    Then I collect all the soft asserts

  @69304 @auditorCandownloadasPDF
  Scenario: Validate Verify User with Auditor profile has ability to download PDF files of record.
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "Automation Permanent Award" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Award" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I click on "View" icon for "Automation Permanent Award" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I click on "Menu" in the page details
    And I select "Download As PDF" from dropdown
    And I download the file
    Then I verify that "pdf" file is downloaded

  @audiorCanViewAmendmentRecordsofAllStatus
  Scenario: Validate whether Audior Profile all the amendment records created by Auditor profile
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "Funding Change" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    Then I see values "	Funding Change" and "State" inside table