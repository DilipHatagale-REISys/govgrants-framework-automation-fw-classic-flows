@siteVisit @regression
Feature: Validate all scenarios in the Site Visit

  Background: Data setup for Site Visit
    Given I delete the record "Automation Site Visit" from the object "Site Visit"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"

  @51081 @51082 @51083 @61201 @siteVisitCreationEditionParticipantAssociationCreatedDate @smoke
  Scenario: Validate the creation, edition, created date and ParticipantAsociation
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---sitevisits:-:siteVisitContactsTableId---"
    Then I softly see that "Automation EXE" has been added in flextable with Id "---sitevisits:-:participantsTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see field "Created Date" is not editable
    Then I collect all the soft asserts

  @51084 @51085 @51086 @notifyPendingTaskForSubrecipientSiteVisit @smoke
  Scenario: Notify Subrecipient and the respective POC from the applicant organization will receive a pending task about the Site Visit
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    Then I softly see that "Automation EXE" has been added in flextable with Id "---sitevisits:-:approverSiteVisitTableId---"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Then I softly see that "Automation Site Visit" is in "Notified" status
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    Then I softly see that "Automation Site Visit" is in "Notified" status
    Then I collect all the soft asserts

  @51087 @51088 @51090 @addingOutcomeSiteVisitAndSubmittingForApprovalSiteVisit
  Scenario: Validate conduct, adding outcomes and submitting site visits for approval
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I softly see that "Automation Finding" has been added in flextable with Id "---sitevisits:-:correctiveTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    Then I collect all the soft asserts

  @51089 @56010 @formFillingSiteVisitUploadAttachment @smoke
  Scenario: User will be able to review the supporting document checklist submitted by the subrecipient and Filling up of form in Site Visit
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I navigate to "Attachments" sub tab
    And I upload attachment "InternalOrganization_Field_Values.xlsx" from workspace
    Then I softly see "InternalOrganization_Field_Values.xlsx" has been added in "Attachment" flex table
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    Then I see that "100.00%" has been added in flextable with Id "---sitevisits:-:reportsTableId---"
    Then I collect all the soft asserts

  @51091 @51092 @approvalOfSiteVisit
  Scenario: Approval of Site Visit and Send Site Visit to Subrecipient
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "Automation Site Visit" inside table
    Given I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"
    Then I collect all the soft asserts

  @51093 @51094 @siteVisitCorrectiveActionsBySubrecipientAndSubmitToGrantor @smoke
  Scenario: Site Visit Corrective Actions By Subrecipient and Submit to Grantor by Subrecipient
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    Then I collect all the soft asserts

  @39180 @siteVisitAddCorrectiveActionsByFOUser @smoke @deepika
  Scenario Outline: Verify that only recipient user can add corrective actions and not by Internal User on status send to subrecipeint for Award level
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    Given I click on "Send to Subrecipient" in the page details
    And I navigate to "Reports and Outcomes" tab
    And I expand nested table containing column value "Automation Observation"
    Then I do not see value "New" for title "Automation Observation" inside table "---sitevisits:-:correctiveTableId---"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @39159 @siteVisitDeleteAccesstoOwner @smoke @deepika
  Scenario Outline: Verify that record owner can delete created state site visit from Award level
    Given I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "Delete" icon for "<Site Visit Name>" inside table
    Then I do not see values "Automation Site Visit" and "Title" inside table
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @39169 @reportsAndOutcomesEditAccess @deepika
  Scenario: Verify that upon conduct,  Reports And Outcomes tab are editable to the internal user for an award  level site visit
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    Then I can see row level action button "Edit" against "General Review Form" in flex table with id "---sitevisits:-:reportsTableId---"

  @35666 @54225 @61200 @recordOnwerConductSiteVisit @deepika
  Scenario: Verify that PM user (other than record owner) is able to conduct or Notify and user can view location and date of performance
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    Then I softly see field "Country" is not editable
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    Then I softly cannot see row level action button "Delete" against "Record id" in flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I softly cannot see top right button "Conduct" in page detail

  @54221 @siteVisitNotifiedByFOuser @deepika
  Scenario: Verify user (record owner only) is able to plan and notify created site visit to subrecipient and other user cannot notify  - Award Level
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I cannot see top right button "Notify" in page detail

  @55211 @siteVisitsWithOutAddingCorerctiveItems @deepika
  Scenario:  User will not be able to submit the Site Visit to Grantor without adding corrective actions to findings.
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details :
      | Reports and Outcomes Tab - Enter corrective actions on all Findings outcomes using the "+" icons. |

  @55209 @55208 @subrecipientCannotSeeReportAndOutcomesWhenInNotifiedStatus @deepika
  Scenario:  Applicant is not able to view the report or outcomes while in the Notified status and User will not be able to submit the Site Visit for approval without completed forms
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    Then I softly cannot see "Reports and Outcomes" sub tab at view detail page
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details :
      | Reports and Outcomes Tab - Fill all the required data in the form before submitting. |
    Then I collect all the soft asserts

  @55275 @approverPendingTaskUnderMonitoringAward @deepika
  Scenario: Validate whether the approver will be able to view the Pending task under Monitoring
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I see that "Approve Site Visit" has been added in flextable with Id "---sitevisits:-:monitoringTabPhasePendingTasks---"

  @55277 @55276 @approverForwardUserGetPendingTask @deepika
  Scenario: Validate when the Approver forward Site Visit to other user, the Pending Task will be created to the User
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Reassign,Automation EXE" on the approval decision box
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I softly see that "Approve Site Visit" has been added in flextable with Id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    Then I collect all the soft asserts

  @61861 @55278 @55210 @pmUserCanFOuserCannotViewAcceptandCloseSiteVisits @deepika
  Scenario: Validate the Infomation send to the subrecipients other than record owner, Fo user cannot accept and close the site visits and PM can accept and close
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I softly cannot see top right button "Accept and Close" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I softly can see top right button "Accept and Close" in page detail

  @55461 @60838 @reportsAndOutcomesTabAfterNotifiedStatus @deepika
  Scenario: Validate Validate Approvers Table is not editable for record owner and Reports and Outcome Tab visibility after Notified Status
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    Then I softly can see row level action button "Edit" against "Automation EXE" in flex table with id "---sitevisits:-:approverSiteVisitTableId---"
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Then I softly can see top right button "Conduct" in page detail

  @55792 @internalParticipantAssociationSiteVisit @deepika
  Scenario Outline: Internal Participant Association of Site Visit
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "<Internal>" in the table "---sitevisits:-:siteVisitContactsTableId---"
    Then I see that "<Internal>" has been added in flextable with Id "---sitevisits:-:participantsTableId---"
    Examples:
      | Internal       |
      | Automation EXE |

  @55872 @55796 @55805 @recipientsCannotCreateOutcomesSV @deepika
  Scenario: Recipients will not be able to create / edit the Site Visit Outcomes and view the Notify and Conduct button on the Site Visit
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    Then I softly can see top right button "Notify" in page detail
    And I click on "Notify" in the page details
    Then I softly can see top right button "Conduct" in page detail
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    Then I cannot see "Reports and Outcomes" sub tab at view detail page
    Then I collect all the soft asserts

  @56009 @55212 @sendBacktoOwnerReceivePendingTaskSV @deepika
  Scenario: Validate when Site Visit record sent back to Recipients when outcomes are not properly addressed and recipients will be able to receive a pending task
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Send to Owner" on the approval decision box
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    Then I collect all the soft asserts

  @60830 @56038 @FieldHistoryUpdatedSendBackToOwnerByPM @keerti
  Scenario:  To Validate field history update post Award level Site Visit is send back to owner by program approver and Submit for Approval button
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Then I softly can see top right button "Submit for Approval" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Send to Owner" on the approval decision box
    When I navigate to "History" sub tab
    When I perform quick search for "{SavedValue:Record Id}" in "flexTableDivId" panel
    Then I softly see value "Created" for title "Old Value" inside table "flexTableDivId"
    Then I collect all the soft asserts

  @60833 @theSnapshotAfterSiteVisitsIsSendToSubrecipient @keerti
  Scenario: Validate whether record Owner is able to view the Snapshot after Site Visits Send to Subrecipient
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I click on "Send to Subrecipient" in the page details
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Site Visit -Send to Subrecipient"
    When I download the file
    Then I see "Sent to Subrecipient" on page "1" of "govgrants" pdf file

  @60832 @theSnapshotAfterSubmitForApproval @keerti
  Scenario: Validate whether record Owner is able to view the Snapshot after Site Visits Accepted and Closed
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "Automation Site Visit" inside table
    And I click on "Accept And Close" in the page details
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Site Visit - Accept And Close"
    When I download the file
    Then I see "Closed" on page "1" of "govgrants" pdf file

  @60834 @AdditionOfAttachmentForAwardSiteVisits @keerti
  Scenario: Validating addition of attachment to Award Site Visits
    When I navigate to "Attachments" sub tab
    And I upload attachment "Announcement_Field_Values.xlsx" from workspace
    Then I see "Announcement_Field_Values.xlsx" has been added in "Attachments" flex table

  @60839 @56013 @60837 @60840 @peerReviewerCanNotEdit/EnterReviewComments @keerti
  Scenario: Validate system does not allow the peer reviewer to edit/Enter review comments and Edit button hidden if the Site Visits marked as complete review
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I navigate to "Overview" sub tab
    Then I softly see field "StartDate__c" is not editable
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:reviewersFlexTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---sitevisits:-:reviewersFlexTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click modal button "Submit Review"
    When I close "Site Visit Reviewers" modal by clicking the top right x button
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see row level action button "Enter Review" against "Automation FO" in flex table with id "---sitevisits:-:reviewersFlexTableId---"
    Then I collect all the soft asserts

  @60835 @60831 @TaskIsNotCreatedForFiscalApproverWhenProgramApproverSendsBackSiteVisitToOwner @keerti
  Scenario: To Validate  Approvers Table is not editable and field history update Award Level Site Visits  is send back to owner by Fiscal Approver
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Send to Owner" on the approval decision box
    When I navigate to "History" sub tab
    When I perform quick search for "{SavedValue:Record Id}" in "flexTableDivId" panel
    Then I softly see value "Created" for title "Old Value" inside table "flexTableDivId"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I softly see "No Records Found" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    Then I collect all the soft asserts

  @61178 @addAttachmentToSiteVisit @deepika @wip
  Scenario: Validate whether PM will be able to add any specific docuements required along with the supporting documents details under the attachments section
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Other"
    Then I see "Announcement_Field_Values.xlsx" has been added in "Attachments" flex table

  @61860 @approverCompletedTaskSiteVisits @deepika
  Scenario: Validate whether user is able to view the Completed task once approved under Monitoring Tab
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:homePendingTasksTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:homePendingTasksTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:completedTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---riskassessment:-:completedTaskTableId---"

  @61863 @validatePendingTaskCreationforSiteVisitsUnderHomeTab @deepika
  Scenario: Validate whether pending task is created for Program approver under Home Tab when the award owner submits the Site Visits for approval
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:homePendingTasksTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:homePendingTasksTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:homePendingTasksTableId---" panel
    Then I see that "Approve Site Visit" has been added in flextable with Id "---sitevisits:-:homePendingTasksTableId---"

  @61864 @61862 @61865 @otherThanRecordOnwerFoUserCannotSubmitForApproval @deepika
  Scenario: Validate Non award owner can't / does not have permission to Site Visits for Approval and is able to view created Site Visits under Monitoring tab
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I softly see status in Progress-bar is "Created" and is "Green"
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I collect all the soft asserts

  @61866 @validatePendingTaskCreationforSiteVisits @deepika
  Scenario: Validate whether pending task is created for Program approver under Home Tab when the award owner submits the Site Visits for approval
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:homePendingTasksTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:homePendingTasksTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I see that "Approve Site Visit" has been added in flextable with Id "---sitevisits:-:monitoringTabPhasePendingTasks---"

  @61870 @61867 @peerReviewIntiationownerToAddProgramReviewerInSiteVisit @deepika
  Scenario: Validate whether user is to able to intiate the peer review process and  owner is allowed to add a peer reviewer of type Program Reviewer for Site Visits
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:homePendingTasksTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:homePendingTasksTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:reviewersFlexTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    Then I softly see that "Sent for Review" has been added in flextable with Id "---sitevisits:-:reviewersFlexTableId---"
    Then I collect all the soft asserts

  @61868 @taskIsNotCreatedToSecondApproverWhenPORejectsInSiteVisits @deepika
  Scenario: Validate Pending task is not created to fiscal approver when program approver performs send to the owner.
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Send to Owner" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---sitevisits:-:monitoringTabPhasePendingTasks---"

  @61869 @creationofSecondSiteVisitswhenFirstIsCreated @deepika
  Scenario: Validate whether Pm user can create second Site Visits when first is created status
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "secID"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    Then I see that "{SavedValue:secID}" has been added in flextable with Id "---sitevisits:-:grantorSiteVisitsTableID---"

  @65239 @deleteCreateSiteVisit @deepika
  Scenario: Validate whether user will be able to delete the created Site Visit
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    Then I softly can see row level action button "Delete" against "Automation Site Visit" in flex table with id "GrantorSiteVisitsAward"
    When I click on "Delete" icon for "Automation Site Visit" inside flex table with id "GrantorSiteVisitsAward"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I collect all the soft asserts

  @65240 @historyOfSiteVisitsendbacktoOwner @deepika
  Scenario: Validate History Field is getting Updated at Award owner End when Site Visit status is Submitted to Grantor.
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Send to Owner" on the approval decision box
    When I navigate to "History" sub tab
    Then I see value "Active" for title "New Value" inside table "History"

  @65241 @corerctiveActionsDueDateSiteVisit @deepika
  Scenario: Validate Site Visit Submit to Grantor and Corrective Actions By Subrecipient
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | -10      | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    Then I softly see the following messages in the page details :
      | Due date must be past date |

  @65242 @foUserCannotDeleteCreatedSiteVisit @deepika
  Scenario: Validate whether other than record owner can Fo user view the created Site Visit by Pm
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    When I perform quick search for "Record Id" in "GrantorSiteVisitsAward" panel
    Then I see that "Automation Site Visit" has been added in flextable with Id "GrantorSiteVisitsAward"