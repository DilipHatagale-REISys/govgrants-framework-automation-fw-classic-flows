@orgAwardLevelRiskAssessment @regression
Feature: Validate all scenarios in the Organizational Risk Assessment

  Background: To create a Organizational Risk Assessment
    Given I delete the record "SAN DIEGO ELECTRICAL TRAINING TRUST" from the object "ORGANIZATION RISKASSESSMENT"
    When I create a risk assessment record for organization "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:pendingTaskTableId---" panel

  @orgRiskAssessmentTaskcreatedForSubrecipient @smoke @deepika
  Scenario: Validate whether the task is created for SPI User for Organization Risk Assessment
   Then I see that "SAN DIEGO ELECTRICAL TRAINING TRUST" has been added in flextable with Id "---orgRiskAssessment:-:pendingTaskTableId---"

  @creationOfOrgRiskAssessmentTaskSubrecipient @smoke @deepika
    Scenario: Validate once the pending is created, the spi user can create the org risk asssesment
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "Green"
