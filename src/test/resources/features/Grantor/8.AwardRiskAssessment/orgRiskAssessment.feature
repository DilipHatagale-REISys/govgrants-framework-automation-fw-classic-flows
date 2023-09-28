@riskAssessment @orgAwardLevelRiskAssessment @regression @orgRiskAssessment
Feature: Validate all scenarios in the Organizational Risk Assessment

  Background: To create a Organizational Risk Assessment
    Given I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
    When I create a risk assessment record for organization "Automation Permanent Organization for Risk Assessment"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SA" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel

  @61970 @61971 @orgRiskAssessmentCreationAndTaskcreatedForSPI @deepika
  Scenario: Verify Task is generated for Signing Authority to Create Risk Assessment for an Organization and once the pending is created, the user can create the org risk asssesment
    Then I softly see that "Automation Permanent Organization for Risk Assessment" has been added in flextable with Id "---orgRiskAssessment:-:pendingTaskTableId---"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "Green"

  @61976 @61975 @requestNewAssessmentActiveRA @deepika @smoke
  Scenario: Validate whether Request New Assessment button is available for Authorized Signatory and  User can view the Active risk asssessment from Organization profile page
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I softly can see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I softly see that "Active" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @61977 @moderateRiskLevelColorChangesToYellow @deepika @wip
  Scenario: Validate the moderate level of Risk Assessment, that changes to Yellow color as per the provided Assessment.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I see "Risk Level" image as "yellow.png"

  @61982 @61978 @additonOfAttachmentWhenRAISActive @deepika
  Scenario: Validate one the Org RA is Active then there will be no add or Edit button on attachments flextable
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:OrganizationRiskAssesmentFilesTableId---"

  @61983 @completedTaskOnceOrgRAIsCreated @deepika
  Scenario: Validate whether SPI user is able to view the Completed task once Org Risk Assessment is Created
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:completedTaskTableId---" panel
    Then I see value "Automation Permanent Organization for Risk Assessment" for title "EGMS ID" inside table "---orgRiskAssessment:-:completedTaskTableId---"

  @61973 @assessmentFormEdition @deepika
  Scenario: Validate once the pending is created, the spi user can create the org risk asssesment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    When I click on "Save" in the page details
    Then I can see top right button "Submit" in page detail

  @61980 @addingAnAttachmentToOrgRA @deepika @buglogged112066
  Scenario: Validate whether SPI user can Add an attachment to Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentFileTableId---"
    And I upload attachment "Attachment.pdf" of type "AGENCY DETAILS" from computer
    Then I softly see "AGENCY DETAILS" has been added in "Organization Risk Assessment Files" flex table

  @62197 @pendingTaskCreatedForGrantor @deepika
  Scenario: Validate whether pending task is created for grantor when Authorized Signatory requested for Revision
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    And I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---riskassessment:-:homePendingTaskTableId---" panel
    Then I see values "Automation Permanent Organization for Risk Assessment" and "Provide or Decline Risk Assessment Access" inside table

  @62198 @grantorApprovalforRevision @deepika
  Scenario: Validate whether Grantor can approve the revision request for org level risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    And I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---riskassessment:-:homePendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---riskassessment:-:homePendingTaskTableId---"
    Then I softly can see top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I pause execution for "90" seconds
    Then I softly cannot see top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62312 @deleteIconfCreatedRiskAssessment @deepika
  Scenario: Validate whether Authorized Signatory can view the delete button across the created Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I can see row level action button "Delete" against "Created" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62313 @deleteMessageDisplayed @deepika
  Scenario: Validate whether Authorized Signatory has capable to delete the created Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "Delete" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see "No Records Found" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62314 @editRiskAssessment @deepika
  Scenario: Validate whether Authorized Signatory can Edit the Created Risk Assessment.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I can see row level action button "Edit" against "Created" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62315 @snapHistoryOfOrgRA @deepika @skipOnJenkins
  Scenario: Validate whether Snapshot is captured/(taken) automatically  by the system in the table Snapshot History when Risk Assessment is Activated
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Risk Assessment Snapshot"
    When I download the file
    Then I see "{SavedValue:EGMSID}" on page "1" of "govgrants" pdf file

  @62316 @historyOfRiskAssessment @deepika
  Scenario: To Validate field history update post Risk Assessment is clicked on Submit and is Active
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I navigate to "History" sub tab
    Then I see value "Active" for title "New Value" inside table "History"

  @62317 @messageInfoToAuthorizedSignatory @deepika @bug-82240
  Scenario: Validate when Request New Assessment button is clicked a message is displayed to Authrozed Signatory
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I see the following messages in the page details contains:
      | A request to create new assessment has been sent to the Grantor.  Once the request has been approved, you will receive an email and can proceed with an assessment revision. |

  @62513 @activeOrgLevelRiskAssessment @deepika
  Scenario: Validate upon click Submit Risk Assessment by Signing Authority the Risk Assessment turns active
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @62514 @saveAndContinueButtons @deepika
  Scenario: Validate as soon as user clicks Start icon of pending task record to create Risk Assessment then user will land in Save and Continue Page.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Save and Continue" in page detail

  @62515 @provideRevisionAccess @deepika @smoke
  Scenario: Validate whether Grantor can approve the revision request for org level risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I can see top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62516 @declineButtonViewForGrantor @deepika
  Scenario: Validate whether Grantor can Decline the revision request for org level risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    Then I can see top right button "Decline" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62517 @validateMessageDisplayedWhenProvideAccess @deepika
  Scenario: Validate the message is displayed when clicked on Provide Access for new Risk Assessment by Grantor
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I see the following messages in the page details contains:
      | Assessment Access granted. The subrecipient has received an email and access to revise the assessment. |

  @62518 @grantorCannotEditCreatedRA @deepika
  Scenario: Validate whether Grantor user can edit or modify the created Org Level Risk Assessment from Org View Page.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail

  @62519 @declineButtonViewForGrantor @deepika
  Scenario: Validate the task is not created for subrecipient user when when grantor declines the Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Decline" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I do not see values "EGMS ID" and "Automation Permanent Organization for Risk Assessment" inside table

  @62520 @77260 @taskCreationWhenGrantorProvideAccess @deepika
  Scenario: Validate task is created for Subrecipient User when Grantor provides access to Revise Risk Assessment | Validate when the external user request for new assessment, the internal user recives an email notification to Revise Risk Assessment for Subrecipient Organization
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I softly see values "Automation Permanent Organization for Risk Assessment" and "Revise Risk Assessment" inside table
    And I checkout to yopmail with mailid "automationspi1@yopmail.com"
    And I pause execution for "40" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Access has been granted to reviseOrganization Risk Assessment
      """

  @62305 @grantorProvidedAccessForRevisionRequest @deepika
  Scenario: Validate whether Grantor is able to provide access for the revision request of org level risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    Then I cannot see top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62306 @GrantorAddedAttachmentsSentForRevisionRequestOfOrgLevelRA @keerti
  Scenario: Validate whether Grantor is able add attachments when sent for revision request of org level risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add" in flex table with id "---orgRiskAssessment:-:orgriskSupportingDocTableId---"

  @62304 @EffectiveDatAandExpirationDatesForOrgLRAIsInCraetedStatus @keerti
  Scenario: Valdiate the Effective Date and Expiration Dates are not populated when Org Risk Assessment is in Craeted Status
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I softly do not see value "" for title "Effective From" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I softly do not see value "" for title "Effective Until" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62303 @OrgLRAOnceActiveThenCreatedDateIsTodaysDate @deepika
  Scenario: Validate once the Org Level Risk Assessment is Active, then the Created Date is Today's date
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I click on "Submit" in the page details
    When I navigate to "Overview" sub tab
    Then I see field "Created Date" is getting updated with todays date

  @62670 @requestRevisionButtonAvailability @deepika
  Scenario: Validate once grantor declines the Risk Assessment for Revision, the Request New Assessment button is again available for Signing Authority for new revision
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Decline" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I can see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62671 @validateRequestNewAssessmentButtonAvailbility @deepika
  Scenario: Validate once Signing Authority user clicks on Request New Assessment Button then the button is hidden from Flex table
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I cannot see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62672 @validateExpiredRAWhenSecIsActive @deepika @smoke
  Scenario: Validate as soon as user can activate the second Risk Assessment the first Risk Assessment will go in Expired State
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Revise Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Expired" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see that "Expired" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62673 @recordOwnerCannotEditDates @deepika
  Scenario: Validate Record Owner cannot edit the Organization Type under Overview tab of Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see field "Organization Type" is not editable

  @62522 @UserAllowedToRevise/UpdateRiskAssessment @keerti
  Scenario: Validate using the task, User should see be allowed to revise/update risk assessment i.e.. select other answers per their wish and submit and risk assessment should turn active.
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @62525 @UserCanviewCompletedTaskAfterProvideRevisionAccess @keerti 
  Scenario: Validate whether user is able to view the Completed task once Risk Assessment is Active after provide Revision Access
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "CompletedTasks" panel
    Then I see values "Automation Permanent Organization for Risk Assessment" and "Completed" inside table

  @62523 @ReviseRAButtonIsNotpresentedForSPAUsers @keerti
  Scenario: Validate the Revise Risk Assessment Button should not be present for SPA users that are not the SA.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I re-login as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I cannot see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62629 @RevisedRiskAssessmentShouldMarkFirstAsExpired @keerti 
  Scenario: Validate the Revised Risk Assessment should mark the Initial Risk Assessment as Expired.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID1"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Expired" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see value "Expired" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62945 @requestNewAssessmnetButtonIsNotAvailbleOnceClicked @deepika
  Scenario: Validate once 'Request New Assessmnet' Button is clicked then the button is not available once clicked
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I cannot see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62946 @acknowledgeOrgRiskAssessment @deepika @smoke 
  Scenario: Validate whether user can proceed without checkin 'Acknowledment' field for Org Level Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    When I click on "Save and Continue" in the page details
    Then I see the following messages in the page details contains:
      | Acknowledgement is required to save. |

  @62947 @disagreeAcknowledgeForRA @deepika 
  Scenario: Validate whether user is able to proceed further process without Acknowledging the Org Level Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter value "Checked" into field "Signature__c"
    When I click on "Save and Continue" in the page details
    And I get the "EGMS ID"
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @62948 @onceAcknowledgedRiskAssessmentISCreated @deepika 
  Scenario: Validate whether user is see the Acknowledge checkout and is Editable for Org Level Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter value "Checked" into field "Signature__c"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Then I see status in Progress-bar is "Created" and is "Green"

  @62949 @assessmentValuesareEditable @deepika 
  Scenario: Validate whether user is able to edit the assessment form once Grantor Provided Access for Revision
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter value "Checked" into field "Signature__c"
    When I click on "Save and Continue" in the page details
    When I navigate to "Assessment" sub tab
    And I enter "Risk Assessment Creation1" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"

  @62950 @AScanEditAssessment @deepika 
  Scenario: Validate whether AS have edit access for the assessment form
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter value "Checked" into field "Signature__c"
    When I click on "Save and Continue" in the page details
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit" in page detail

  @62951 @RAinCreatedStatusImpactOnAward @deepika
  Scenario Outline: Validate if SA has requested for revision of initial Risk Assessment  and it is being revised and present in Created sttaus does not make an impact on Award Activation system will always refer the active Risk Assessment.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter value "Checked" into field "Signature__c"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation4" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account1" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Encumbrance |
      | {SavedValue:fundingAccount1} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I pause execution for "10" seconds
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Execution Award} | {SavedValue:Automation Runtime Execution Award} |

  @62952 @orRiskAssessmentIsNotDisplayedForINDUser @deepika @issuewithINDUser
  Scenario:  Validate Data related to organization risk assessment should not be displayed on the Individual Profile view .
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Home" tab
    When I navigate to "Individual Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I cannot see page block "Organization Risk Assessments"

  @62804 @verifyFieldHistoryUpdatedPostSecondRiskAssessmentIsInActiveStatus @keerti
  Scenario: To Validate field history update post second Risk Assessment is in Active Status
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Revise Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    When I navigate to "History" sub tab
    Then I see value "Effective Date" for title "Changed Field" inside table "History"

  @62802 @createdDateOfRADisplayedOnOverviewTab @keerti
  Scenario: Validate the Created Date of Risk Assessment display on Overview Tab - Organizational Level Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I navigate to "Overview" sub tab
    Then I see field "Created Date" is not editable

  @62801 @UserCannotEditExpiredRA @keerti
  Scenario: Validate the User Cannot Edit the Expired Risk Assessmnet
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Revise Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Expired" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on "View" icon for "Expired" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    Then I cannot see top right button "Edit" in page detail

  @63072 @VerifyErrorMessageForAssessmentForm @keerti
  Scenario: Validate whether the system throws an error message to the user and cannot proceed further without completing the assessment form.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I clear the value from field "fieldQuality_Question_1__c"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    Then I see the following messages in the page details contains:
      | Assessment Tab - Complete all of the questions on the Risk Assessment form. |

  @63075 @VerifyEffectiveDateAndExpirationDate @keerti
  Scenario: Validate whether the Active Org Risk Assessment for Organization is updated for one year under Effective Date and Expiration Date fields inside flextable
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I navigate to "Overview" sub tab
    Then I see field "Effective Date" is getting updated with todays date
    And I save the field labeled "Effective Date" as "EffectiveDate"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I softly see value "{SavedValue:EffectiveDate}" for title "Effective From" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @63077 @VerifyTaskForNoPopUpWhenClickedOnRequestNewAssessment @keerti
  Scenario: Validate task is not created for Grantor when the SA user clicks as 'No' on pop up when clicked on Request New Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click table top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I click "No" on modal confirmation box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---riskassessment:-:homePendingTaskTableId---" panel
    Then I do not see values "Automation Permanent Organization for Risk Assessment" and "Provide or Decline Risk Assessment Access" inside table

  @63232 @VerifyDraftRAIsActivated @keerti @wip @cannotbeAutomated
  Scenario: Verify task is marked completfed if the user chooses to activate the risk assesment using the draft risk assessment instead of using the task
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "{SavedValue:EGMSID}" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "Edit" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @63229 @VerifyDraftORAIsPresentOnOrganizationalProfilePage @keerti
  Scenario: Verify Draft Organization Risk Assessment is present on Organizational Profile Page for a Signing Authority of the Organization
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I see that "{SavedValue:EGMSID}" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @63233 @verifyRiskAssessmemtException @deepika @smoke
  Scenario Outline: Validate system generates generates an exception at award activation if Organizational Risk Assessment is Created and not Active
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter in modal "Grant_Creation4" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter in modal "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside flex table with id "---subAwardStandalone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
#    And I enter "Contact_Creation" values from "RiskAssessment_Field_Values.xlsx"
#    And I click modal button "Save"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Project Role             | Is Key Personnel |
      | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "10" seconds
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    Then I see the following messages in the page details contains:
      | Your Organization does not have an active Risk Assessment. Create and activate a Risk Assessment as the Subaward cannot be accepted without an active Risk Assessment. |
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Execution Award} | {SavedValue:Automation Runtime Execution Award} |

  @63979 @grantorCanViewOverallRisk @deepika
  Scenario: Validate Internal User can also View the OverallRisk field on Risk Assessment Tab
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    Then I see field "Overall Risk" as "27.00%"

  @63980 @validateRiskAssesmentActiveInPDF @deepika @skipOnJenkins
  Scenario: Verify that user can check PDF files with validation for Org Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    And I click on "Menu" in the page details
    And I select "Download As PDF" from dropdown
    And I download the file
    Then I see "Active" on page "1" of "govgrants" pdf file

  @63981 @totalRecordsofOrgRiskAssesment @deepika 
  Scenario: Validate whether user is able is see total record when first risk assessment is expired and second is active
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I see total records count "Total Records:3" in flex table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @63982 @effectiveDatesOnOrgRiskAssessmentIsBlackDraftOnCreated @deepika
  Scenario: Verify that Effective and Expiration dates are blank when Org risk assessment is in created state
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see field name "StartDate__c" is blank in flex table
    Then I see field name "EndDate__c" is blank in flex table

  @63983 @acknowledgementOfRiskAssessment @deepika
  Scenario:  Validate that no records has been added to the Org Risk Assessment table when record is cancelled
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Cancel" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see "No Records Found" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64128 @grantorViewOrgRA @deepika
  Scenario: Validate Risk Assessment data/status should be displayed to internal user irrespective of the state of Risk Assessment.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    Then I see status in Progress-bar is "Created" and is "Green"

  @64127 @cretedStateOrgRiskAssessment @deepika 
  Scenario: Validate Risk Assessment should remain in created State if the 'AS' Edit the Risk Assessment and fill in the questionnaire and click Save
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see that "Created" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64126 @editdeleteButtonsOndraftORAPresentOnOrgProfilePage @deepika
  Scenario: Verify on Draft Organization Risk Assessment user should have the basic Edit Delete view Privileges for the SA of the Organization
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Revise Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I softly can see row level action button "Edit" against "Created" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64125 @taskMarkedCompletedUsingDraftRA
  Scenario: Verify task is marked completed if the user chooses to activate the risk assesment using the draft risk assessment instead of using the task
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:completedTaskTableId---" panel
    Then I see that "Automation Permanent Organization for Risk Assessment" has been added in flextable with Id "---orgRiskAssessment:-:completedTaskTableId---"

  @64124 @orRiskAssessmentTaskNotDisplayedForINDUser @deepika @issuewithINDUser
  Scenario:  Validate Task for submitting organizational Risk Assessment should not be generated for IND profile User .
    When I re-login as "IND" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I see "No Records Found" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"

  @64512 @orRiskAssessmentDisplayedToInternal @deepika
  Scenario: Validate Risk Assessment data/status should be displayed to internal user irrespective of the state of Risk Assessment for Active SR Organizations --> Organization Profile View
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    Then I can see "Risk Assessment" sub tab at view detail page

  @64513 @indRiskAssessmentDisplayedToInternal @deepika
  Scenario: Validate Risk Assessment data/status should be displayed to internal user irrespective of the state of Risk Assessment for Active SR Organizations --> Individual Profile View
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "{user:fullName}" in "---home:-:indActiveAccountId---" panel
    And I click on "View" icon for "{user:fullName}" inside flex table with id "---home:-:indActiveAccountId---" without waiting for record
    Then I can see "Risk Assessment" sub tab at view detail page

  @64514 @overallRiSKScoreWhenAssessmentSelectedDiffTypeQuestions @deepika
  Scenario: Validate the High level Risk Score, that shows the Overall Score as per the provided Assessment once Risk Assessment is Active
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues1" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I save the field labeled "Overall Score" as "OverallScore"
    Then I softly see field "Overall Score" as "{SavedValue:OverallScore}"

  @64515 @overallRiSKScoreWhenAssessmentSelectedDiffQuestions @deepika
  Scenario: Validate the Moderate Risk Score of Risk Assessment, that shows the Overall Score as per the provided Assessment once Risk Assessment is Active
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see field "Overall Score" as "27.0%"

  @64516 @overallRiSKScoreWhenAssessmentSelectedDiffSetQuestions @deepika @wip
  Scenario: Validate the Risk level of Risk Assessment, that shows the Overall Score as per the provided Assessment once Risk Assessment is Active
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues3" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see "Risk Level" image as "yellow.png"

  @64602 @taskIScreatedforSAOnceInternalUserProvideAccess @deepika
  Scenario: Validate the Revise Risk Assessment Button should not be present for SPI users that are not the SA.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I re-login as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I cannot see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64603 @taskIsNotCreatedForSPI @deepika
  Scenario: Verify Task is not generated for SPI to Create Risk Assessment for an Organization
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I create a risk assessment record for organization "Automation Permanent Organization for Risk Assessment"
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I do not see values "EGMS ID" and "Automation Permanent Organization for Risk Assessment" inside table

  @64605 @reviseAssessmentTaskAddedtoTheTable @deepika
  Scenario: Validate when internal user provide access for Risk assessmnet then task should be created for SA of Sub Recipient Organization.
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I see that "Revise Risk Assessment" has been added in flextable with Id "---orgRiskAssessment:-:pendingTaskTableId---"

  @64606 @reviseAssessmentTaskNotddedtoTheTable @deepika
  Scenario: Validate when internal user provide access for Risk assessmnet then task shouldn't be created for SPI of Sub Recipient Organization.
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    Then I do not see values "EGMS ID" and "Automation Permanent Organization for Risk Assessment" inside table

  @64607 @validateRA1ActiveWhenRA2Created @deepika @smoke
  Scenario: Validate a the second Risk Assessment is in created state when it is not submitted and first Risk Assessment is active
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Revise Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Revise Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "{SavedValue:EGMSID}" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see that "Active" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64608 @validateSaveandContinuebuttonWhenTaskIScreatedandStarted @deepika
  Scenario: Validate as soon as user clicks Start button for created pending task then the user will land in Save and Continue Page.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    Then I can see top right button "Save and Continue" in page detail

  @64610 @spiCannotViewOrgRiskAssessmentInCreatedStatus @deepika
  Scenario: Validate whether the org Risk Assessment that is in created state is visible to SPI user that are not SA
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Record Id" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see "No Records Found" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64611 @spiCanViewOrgRiskAssessmentInActiveStatus @deepika
  Scenario: Validate whether the org Risk Assessment that is in Active state is visible to SPI user that are not SA
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I softly see value "Active" for title "Status" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64612 @0rgRiskAssessmentIsnOtActiveIFQuestionsAreNotFilled @deepika 
  Scenario: Validate the Risk Assessment should not become active and also cannot be in Created Staus when prompt user to doesn't fill in all the questions.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
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
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    When I click on "Save and Continue" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see "No Records Found" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64613 @SPI2CannotRequestforRevision @deepika
  Scenario: Validate the SPI owner that is not an SA, does not have previlages to Request the org Ra for new revision
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    When I re-login as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I cannot see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @64733 @downloadOrgRaInPDF @skipOnJenkins
  Scenario: Validate whether user can Download the Active Org Risk assessment in PDF format.
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right parallel lines bar for "Organization Risk Assessments"
    And I select "Download as PDF" from parallel lines dropdown of "Organization Risk Assessments"
    Then I verify that "pdf" file is downloaded

  @64734 @downloadOrgRAInXLS @deepika @skipOnJenkins
  Scenario: Validate whether user can Download the Active Org Risk Assessment in XLS format
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right parallel lines bar for "Organization Risk Assessments"
    And I select "Download as XLS" from parallel lines dropdown of "Organization Risk Assessments"
    Then I verify that "xls" file is downloaded

  @65386 @requestNewAssessmentAvialabilityOnActiveRA @deepika @smoke
  Scenario: Validate whether Request New Assessment button is available for Authorized Signatory once the Risk Assessment is Active
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    Then I can see top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @65387 @verifyAllInternalUsersCanViewActiveOrgRA @deepika
  Scenario Outline: Validate whether internal user can see view the Active Risk Assessment from Internal Subrecipient Profile View Page
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I click on "Submit" in the page details
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see that "{SavedValue:EGMSID}" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Examples:
      | User |
      | PM   |
      | EXE  |
      | FO   |

  @65388 @validateInternalUserCannotViewCreatedStateRA
  Scenario: Validate whether Internal Users Can view the Org Risk Assessment that is in Created Status from Internal Subrecipient Profile View page
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see that "{SavedValue:EGMSID}" has been added in flextable with Id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @65389 @riskLevelISNAforCreatedStatusOrgRA @deepika
  Scenario: Validate when the Org Risk Assessment is in created state the Risk Assessment is hown as NA inside table
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Created" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    Then I see value "NA" for title "Risk Level" against the value "{SavedValue:EGMSID}" inside table "---orgRiskAssessment:-:orgRiskAssessmentTableId---"

  @65549 @recordOwnerCannotEditEffectiveandExpirationDatesOfRA @deepika
  Scenario: Validate Record Owner is not able to edit the Effective Dates under Overview tab of Risk Assessment
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I navigate to "Overview" sub tab
    Then I see field "Effective Date" is not editable
    Then I see field "Expiration Date" is not editable