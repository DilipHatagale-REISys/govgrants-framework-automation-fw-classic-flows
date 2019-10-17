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
  Scenario: Verify Task is generated for Signing Authority to Create Risk Assessment for an Organization.
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

  @62198 @grantorApprovalforRevision @deepika
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
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---riskassessment:-:homePendingTaskTableId---" panel
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---riskassessment:-:homePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    Then I see that "EGMS ID" is in "Approved" status

  @62312 @deleteIconfCreatedRiskAssessment @deepika
  Scenario: Validate whether Authorized Signatory can view the delete button across the created Risk Assessment
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I can see row level action button "Delete" against "Created" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62313 @deleteMessageDisplayed @deepika
  Scenario: Validate whether Authorized Signatory has capable to delete the created Risk Assessment
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "Delete" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I see the following messages in the page details contains:
      | Record deleted successfully. |

  @62314 @editRiskAssessment @deepika
  Scenario: Validate whether Authorized Signatory can Edit the Created Risk Assessment.
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I can see row level action button "Edit" against "Created" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62315 @snapHistoryOfOrgRA @deepika @wip
  Scenario: Validate whether Snapshot is captured/(taken) automatically  by the system in the table Snapshot History when Risk Assessment is Activated
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Risk Assessment Snapshot.pdf"
    When I download the file
    Then I see "Organization Risk Assessment" on page "1" of "govgrants" pdf file

  @62316 @historyOfRiskAssessment @deepika
  Scenario: To Validate field history update post Risk Assessment is clicked on Submit and is Active
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I navigate to "History" sub tab
    Then I see field "New Value" is getting updated with todays date

  @62317 @messageInfoToAuthorizedSignatory @deepika @wip
  Scenario: Validate when Request New Assessment button is clicked a message is displayed to Authrozed Signatory
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
    Then I see the following messages in the page details contains:
      | A request to create new assessment has been sent to the Grantor. Once the request has been approved, you will receive an email and can proceed with an assessment revision. |

  @62513 @activeOrgLevelRiskAssessment @deepika @smoke
  Scenario: Validate upon click Submit Risk Assessment by Signing Authority the Risk Assessment turns active
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
    Then I see status in Progress-bar is "Active" and is "Green"

  @62514 @saveAndContinueButtons @smoke @deepika
  Scenario: Validate as soon as user clicks Start icon of pending task record to create Risk Assessment then user will land in Save and Continue Page.
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    Then I can see top right button "Save and Continue" in page detail

  @62515 @provideRevisionAccess @deepika
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
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see top right button "Provide Access" for "---orgRiskAssessment:-:orgRiskAssessmentTableId---" flex table

  @62516 @declineButtonViewForGrantor @deepika
  Scenario: Validate whether Grantor can Decline the revision request for org level risk Assessment
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
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    Then I can see top right button "Decline" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62517 @validateMessageDisplayedWhenProvideAccess @deepika
  Scenario: Validate the message is displayed when clicked on Provide Access for new Risk Assessment by Grantor
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
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I see the following messages in the page details contains:
      | Assessment Access granted. The subrecipient has received an email and access to revise the assessment. |

  @62518 @grantorCannotEditCreatedRA @deepika
  Scenario: Validate whether Grantor user can edit or modify the created Org Level Risk Assessment from Org View Page.
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I cannot see top right button "Edit" in page detail

  @62519 @declineButtonViewForGrantor @deepika
  Scenario: Validate the task is not created for subrecipient user when when grantor declines the Risk Assessment
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
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Decline" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I do not see values "EGMS ID" and "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table

  @62520 @taskCreationWhenGrantorProvideAccess @deepika
  Scenario: Validate task is created for Subrecipient User when Grantor provides access to Revise Risk Assessment
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
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I see values "SAN DIEGO ELECTRICAL TRAINING TRUST" and "Revise Risk Assessment" inside table

  @62305 @grantorProvidedAccessForRevisionRequest @deepika
  Scenario: Validate whether Grantor is able to provide access for the revision request of org level risk Assessment
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
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    Then I can see top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62306 @GrantorAddedAttachmentsSentForRevisionRequestOfOrgLevelRA @keerti
  Scenario: Validate whether Grantor is able add attachments when sent for revision request of org level risk Assessment
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentFlexTableId---" panel
    And I navigate to "Attachments" sub tab
    Then I see top right button "Add" for "Attachments" flex table

  @62304 @EffectiveDatAandExpirationDatesForOrgLRAIsInCraetedStatus @keerti
  Scenario: Valdiate the Effective Date and Expiration Dates are not populated when Org Risk Assessment is in Craeted Status
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentFlexTableId---" panel
    Then I see value "" for title "Effective Date" against the value "{SavedValue:EGMSID}" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I see value "" for title "Expiration Date" against the value "{SavedValue:EGMSID}" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62303 @OrgLRAIsActiveThenUserCannotSeeEditButton @keerti
  Scenario: Validate once the Org Level Risk Assessment is Active, then User cannot see the Edit Button in the page details
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I save Todays Date
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see value "{SavedValue:Todays Date}" for title "Effective Date" against the value "{SavedValue:EGMSID}" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I see value "{SavedValue:Expiration Date}" for title "Expiration Date" against the value "{SavedValue:EGMSID}" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62670 @requestRevisionButtonAvailability @deepika
  Scenario: Validate once grantor declines the Risk Assessment for Revision, the Request New Assessment button is again available for Signing Authority for new revision
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
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Decline" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I can see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62671 @validateRequestNewAssessmentButtonAvailbility @deepika
  Scenario: Validate once Signing Authority user clicks on Request New Assessment Button then the button is hidden from Flex table
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
    Then I cannot see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62672 @validateExpiredRAWhenSecIsActive @deepika
  Scenario: Validate as soon as user can activate the second Risk Assessment the first Risk Assessment will go in Expired State
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
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "View" icon for "Revise Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I perform quick search for "Expired" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see that "Expired" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62673 @recordOwnerCannotEditDates @deepika
  Scenario: Validate Record Owner is not able to edit the Effective Dates under Overview tab of Risk Assessment
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    Then I see field "Organization Type" is not editable

  @62522 @UserAllowedToRevise/UpdateRiskAssessment @keerti
  Scenario: Validate using the task, User should see be allowed to revise/update risk assessment i.e.. select other answers per their wish and submit and risk assessment should turn active.
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation1" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @62525 @UserCanviewCompletedTaskAfterProvideRevisionAccess @keerti
  Scenario: Validate whether user is able to view the Completed task once Risk Assessment is Active after provide Revision Access
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "CompletedTasks" panel
    Then I see values "SAN DIEGO ELECTRICAL TRAINING TRUST" and "Revise Risk Assessment" inside table

  @62523 @ReviseRAButtonIsNotpresentedForSPAUsers @keerti
  Scenario: Validate the Revise Risk Assessment Button should not be present for SPA users that are not the SA.
    When I click on "Start" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I re-login as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I cannot see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"