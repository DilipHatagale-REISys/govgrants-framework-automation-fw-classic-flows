@organizationalDeskReview @regression @siteVisit
Feature: Validate all scenarios in Organizational Desk Review

  Background: Creation of Organizational Desk Review
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table

  @54291 @54293 @54294 @organizationalDeskReviewCreationEditionAndParticipantAssociation @deepika
  Scenario: Validate the Creation and Edition and Participant Association for Org Level Desk Review
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    Then I softly see that "Automation EXE" has been added in flextable with Id "---orgLevelDeskReview:-:associateContactsId---"

  @54210 @monitoringTypeFiscalDR @deepika
  Scenario: Validate the Monitoring type 'Fiscal' for Organizational Desk Review
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Fiscal" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see field "Monitoring Type" as "Fiscal"

  @54295 @monitoringTypeProgramDR @deepika
  Scenario: Validate the Monitoring type 'Program' for Organizational Desk Review
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Program" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see field "Monitoring Type" as "Program"

  @54423 @orgDeskReviewTypeApplication @deepika
  Scenario: Validate the Desk Review Org Level type Application
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Application" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see field "Desk Review Type" as "Application"

  @54424 @orgDeskReviewTypeAward @deepika
  Scenario: Validate the Desk Review Org Level type Award
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see field "Desk Review Type" as "Award"

  @54425 @addParticipantsT0OrgDeskReviewInternalUser @deepika
  Scenario Outline: User will be able to add contacts or users from both internal and subrecipient organizations.
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "<User>" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    Then I see that "<User>" has been added in flextable with Id "---orgLevelDeskReview:-:associateContactsId---"
    Examples:
      | User           |
      | Automation SPI |
      | Automation EXE |

  @54458 @54459 @approverSectionnotifySubrecipientDeskReviewOrgLevel @smoke @deepika
  Scenario: Approver selection and Notify Subrecipient about the Desk Review Org Level
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Then I softly see that "Automation PM" has been added in flextable with Id "---orgLevelDeskReview:-:approverSiteVisitTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    And I click on "Notify" in the page details
    Then I softly see that "Automation Desk Review Org level" is in "Notified" status

  @54462 @addingOutcomeDeskReviewOrgLevel @deepika
  Scenario: Adding outcomes to Desk Review OrgLevel
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I softly see that "Automation Finding" has been added in flextable with Id "---orgLevelDeskReview:-:correctiveTableId---"

  @54572 @formFillingDeskReviewOrgLevel @smoke @deepika
  Scenario: Filling up of form in Desk Review Org Level
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    Then I see that "100%" has been added in flextable with Id "---orgLevelDeskReview:-:reportsTableId---"

  @54886 @54571 @66270 @submittingForAprovalOfDeskReviewOrgLevel @deepika
  Scenario: Validate the org level Desk Review Submitting for Approval | Validate Approvers Table is not editable for record owner and award owner end when the status of Org Level Desk Review is Submitted to Approval
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation PM" in flex table with id "---orgLevelDeskReview:-:correctiveTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"

  @54888 @55203 @deskReviewCorrectiveActionsSubmitToGrantoBySubrecipientOrgLevel @deepika
  Scenario: Validate Org Level Desk Review Submit to Grantor and Corrective Actions By Subrecipient
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"

  @55415 @viewOrgDeskReviewAcceptButtonAfterSRecipientsSubmission @deepika @smoke
  Scenario: Validate Submitted By field at Certification table should get updated on Org Desk Review at SR user end and User will be able to view the Desk Review Accept button after review the submission by Recipients
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    Then I can see top right button "Accept and Close" in page detail

  @55416 @56041 @55997 @submittingForApprovalSendBacktoOwnerReceivePendingTaskDROrgLevel @deepika
  Scenario: Validate user view the Submit for Approval button when record sent back to Recipients when outcomes are not properly addressed and recipients will be able to receive a pending task
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I softly can see top right button "Submit for Approval" in page detail
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    Then I softly see that "Automation Desk Review Org Level" has been added in flextable with Id "---deskreview:-:deskReviewGridViewTableId---"

  @55459 @54887 @deskReviewOrgLevelSendToSubrecipientWithOutAddingCorerctiveItems @deepika
  Scenario:  Validate User will not be able to submit the Desk Review Org Level to Grantor without adding corrective actions to findings.
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details :
      | Reports and Outcomes Tab - Enter corrective actions on all Findings outcomes using the "+" icons. |

  @55460 @approverForwardUserGetPendingTaskDeskReview @deepika
  Scenario: Validate when the Approver forward Org Level Desk Review to other user, the Pending Task will be created to the User
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Reassign" to user "Automation EXE" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "Green"

  @55793 @internalUserParticipantOrganizationalDeskReview @smoke @deepika
  Scenario Outline: Internal User participant Association of Organizational Desk Review
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "<User>" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    Then I see that "<User>" has been added in flextable with Id "---orgLevelDeskReview:-:associateContactsId---"
    Examples:
      | User           |
      | Automation EXE |

  @55797 @organizationalDeskReviewPurpose @deepika
  Scenario: Validate the Purpose of Desk Review Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Purpose is Required to save under Overview. |

  @55798 @organizationalDeskReviewSource @deepika
  Scenario: Validate the Source of Desk Review Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Source is Required to save under Overview. |

  @55806 @55803 @54461 @notifyConductButtonDeskReviewOrgLevel @smoke @deepika
  Scenario: User will be able to view the Notify and Conduct button on the Desk Review to complete the action items
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    Then I softly can see top right button "Notify" in page detail
    And I click on "Notify" in the page details
    Then I softly can see top right button "Conduct" in page detail
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"

  @55867 @55873 @54460 @75861 @NotifyTaskRecipientCannotCreateAndSeeReportAndOutcomesWhenInNotifiedStatusOrgDR @deepika
  Scenario: Validate whether the respective POC from the applicant organization will receive a pending task D will not be able to create / edit the Outcomes and cannot view the report or outcomes while in the Notified status.
  Validate the external user will receive an email notification when the org desk review is in notified status
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewId"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    Then I softly cannot see "Reports and Outcomes" sub tab at view detail page
    Then I softly see that "Automation Desk Review Org level" is in "Notified" status
    When I pause execution for "120" seconds
    Then I softly can see mail notification for "EXTERNAL" user with following subject:
      | Desk Review for {SavedValue:DeskReviewId} has been scheduled |

  @56001 @deskReviewWithoutFormFillingOrgLevel @deepika
  Scenario: User will not be able to submit the Desk Review for approval without completed forms
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details :
      | Reports and Outcomes Tab - Fill all the required data in the form before submitting. |

  @55999 @peerReviewDeskReviewOrgLevel @deepika
  Scenario: Validate the peer review on their Org Level Desk Review
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridSiteVisitReviewerRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridSiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click modal button "Submit Review"
    When I close modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Desk Review Reports - All"
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "In Progress" and is "green"

  @55998 @UploadsupportingDocumentChecklistFromWorkSpace @deepika @wip
  Scenario: User will be able to review the supporting document checklist submitted by the subrecipient
    When I navigate to "Attachments" sub tab
    And I upload attachment "InternalOrganization_Field_Values.xlsx" from workspace
    Then I see "InternalOrganization_Field_Values.xlsx" has been added in "Attachment" flex table

  @61061 @61995 @61059 @CreatedDateOfRAdisplayedOnOverviewTabAdditionOfAttachment @Keerti
  Scenario: Validate the Created Date of Desk Review display on Overview Tab and Adding Attachments- Organizational Desk Review
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Overview" sub tab
    Then I softly see field "Created Date" is not editable
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" from workspace
    Then I softly see "Announcement_Field_Values.xlsx" has been added in "Attachments" flex table

  @61992 @RecordOwnerCanViewSnapshotAfterODRIsSubmittedForApproval @skipOnJenkins
  Scenario: Validate Record Owner user is able to take Snapshot after Org Desk Review is Submitted for Approval status - Org Desk Review
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink which contains todays date with text "SnapShot on"
    When I download the file
    Then I softly see "{SavedValue:Record Id}" on page "1" of "govgrants" pdf file

  @61990 @RecordOwnerCanViewCompletedTask @keerti
  Scenario: Validate whether user is able to view the Completed task once approved under Monitoring Tab - Org Level Desk review
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homeCompletedTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---orgLevelDeskReview:-:homeCompletedTaskTableId---"

  @65069 @deleteCreatedOrgDeskReview @deepika
  Scenario: Validate whether user will be able to delete the created Org Desk Review
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly verify that field "Award__c" is not editable by entering "Select" value
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    When I navigate to "Related log" sub tab
    Then I softly can see row level action button "Delete" against "Automation Desk Review Org level" in flex table with id "DeskReview"
    When I click on "Delete" icon for "Automation Desk Review Org level" inside flex table with id "DeskReview"
    And I perform quick search for "Automation Desk Review Org level" in "DeskReview" panel
    Then I softly see "No Records Found" inside flex table with id "DeskReview"

  @65070 @historyOfOrgDeskReviewsendbacktoOwner @deepika
  Scenario: Validate History Field is getting Updated at Award owner End when Org Desk Review status is Submitted to Grantor.
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I softly can see top right button "Submit for Approval" in page detail
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Send to Owner" in the approval decision
    When I navigate to "History" sub tab
    Then I see value "Active" for title "New Value" inside table "History"

  @65071 @corerctiveActionsDueDate @deepika @smoke
  Scenario: Validate Org Level Desk Review Submit to Grantor and Corrective Actions By Subrecipient
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelDeskReview:-:homePhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:homePhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | -10      | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    Then I softly see the following messages in the page details contains:
      | Due date must be future date |

  @65072 @foUserCannotDeleteCreatedOrgDesskReview @deepika
  Scenario: Validate the Created Date of Risk Assessment display on Overview Tab and other than record onwer Fo user can delete the created Org Level Desk Review
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Overview" sub tab
    Then I softly see field "StartDate__c" is not editable
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    When I navigate to "Related log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    Then I softly see "No Records Found" inside flex table with id "DeskReview"

  @65073 @recordOwnerhasAccesstoDeleteassociatedContactand @deepika @wip
  Scenario: Validate whether record owner has access to delete the asoociated Contact and Award to Desk Review Org Level |
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on "Remove" icon for "Automation SPI" inside flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    And I click on "Remove" icon for "Automation Award for Amendment Request" inside flex table with id "---orgLevelDeskReview:-:selectAwardId---"
    Then I softly see "No Records Found" inside flex table with id "---orgLevelDeskReview:-:selectAwardId---"

  @65150 @reviewerCanNotEditAfterSubmittingtheReviewOrgLevel @deepika
  Scenario: Validate after submitting the review comments for Org Level Desk Review, the Edit button should will be unavailable for the reviewer
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridSiteVisitReviewerRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridSiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click modal button "Submit Review"
    When I close "Site Visit Reviewers" modal by clicking the top right x button
    Then I cannot see top right button "Edit" in page detail

  @72357 @deskReviewAcceptAndCloseOrgLevel @productBusinessFlowSanity
  Scenario: Validate once the Org level Desk Review is clicked on Accept and Close butted then status changes to closed
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside flex table with id "DeskReview"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside flex table with id "DeskReview"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"