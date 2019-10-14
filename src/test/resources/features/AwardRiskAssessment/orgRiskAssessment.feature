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

  @61970 @orgRiskAssessmentTaskcreatedForSubrecipient @smoke @deepika
  Scenario: Validate whether the pending task to created for SPI user to create an Organization Risk Assessment
    Then I see that "SAN DIEGO ELECTRICAL TRAINING TRUST" has been added in flextable with Id "---orgRiskAssessment:-:pendingTaskTableId---"

  @61971 @creationOfOrgRiskAssessmentTaskSubrecipient @smoke @deepika
  Scenario: Validate once the pending is created, the spi user can create the org risk asssesment
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "Green"

  @61976 @requestNewAssessment @deepika @smoke
  Scenario: Validate whether Request New Assessment button is available for Authorized Signatory
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I can see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @61975 @createdRAfromOrgProfilePage @deepika
  Scenario: Validate whether User can view the created risk asssessment from Organization profile page
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see that "Active" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @61977 @moderateRiskLevelColorChangesToOrange @deepika
  Scenario: Validate the moderate level of Risk Assessment, that changes to Orange color as per the provided Assessment.
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "RiskAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I see field "Risk Level" as "Orange"

  @61978 @orgRiskRAActiveThenEDITButtonIsHidden @deepika
  Scenario: Validate once the Org Level Risk Assessment is Active, then User cannot see the Edit Button in the page details
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I cannot see top right button "Edit" in page detail

  @61982 @additonOfAttachmentWhenRAISActive @deepika
  Scenario: Validate the add button on attachments flextable is not available for Risk Assessment Owner once Active
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I navigate to "Attachments" sub tab
    Then I cannot see top right button "Add" for "Attachments" flex table

  @61983 @completedTaskOnceOrgRAIsCreated @deepika
  Scenario: Validate whether SPI user is able to view the Completed task once Org Risk Assessment is Created
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:completedTaskTableId---" panel
    Then I see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "EGMS ID" inside table "---orgRiskAssessment:-:completedTaskTableId---"

  @61973 @assessmentFormEdition @deepika @wip
  Scenario: Validate once the pending is created, the spi user can create the org risk asssesment
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "RiskAssessmentValues1" values from "RiskAssessment_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"
    Then I can see top right button "Submit" in page detail

  @61980 @addingAnAttachmentToOrgRA @deepika
  Scenario: Validate whether SPI user can Add an attachment to Risk Assessment
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "AGENCY DETAILS"
    Then I see "Announcement_Field_Values.xlsx" has been added in "Attachments" flex table

  @62197 @pendingTaskCreatedForGrantor @deepika
  Scenario: Validate whether pending task is created for grantor when Authorized Signatory requested for Revision
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---riskassessment:-:homePendingTaskTableId---" panel
    Then I do not see values "SAN DIEGO ELECTRICAL TRAINING TRUST" and "Automation Award for Risk Assessment" inside table

  @62198 @grantorApprovalforRevision @deepika @wip
  Scenario: Validate whether Grantor can approve the revision request for org level risk Assessment
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:homePendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---riskassessment:-:homePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    Then I see that "EGMS ID" is in "Approved" status