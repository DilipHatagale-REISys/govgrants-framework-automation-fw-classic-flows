@orgAwardLevelRiskAssessment @regression
Feature: Validate all scenarios in the Organizational Risk Assessment

  Background: To create a Organizational Risk Assessment
    Given I delete the record "SAN DIEGO ELECTRICAL TRAINING TRUST" from the object "ORGANIZATION RISKASSESSMENT"
    When I create a record "RiskAssessment" for the Organization "SAN DIEGO ELECTRICAL TRAINING TRUST" having object api name as "RiskAssesment__c"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I click on "Save" in the page details
    When I get the "EGMS ID"

 @orgRiskAssessmentTaskCreationForSubrecipient @smoke
  Scenario: To assert the task creation for Risk Assessment
    Then I see status in Progress-bar is "Created" and is "green"
