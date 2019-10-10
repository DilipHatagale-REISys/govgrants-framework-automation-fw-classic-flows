@organizationalSiteVisit @regression
Feature: Validate all scenarios in Organizational Site Visit

  Background: Creation of Organizational Site Visit
    Given I delete the record "Automation Site Visit Org level" from the object "Site Visit"
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table

  @59010 @orgSiteVisitCreation
  Scenario: Validate the Site Visit is in created status.
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see status in Progress-bar is "Created" and is "green"

  @51079 @organizationalsiteVisitEdition
  Scenario: Edition of Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51080 @participantAssociationOrganizationalSiteVisitExternallUser @smoke
  Scenario Outline: Participant Association of Organizational Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "<Subrecipient>" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    Then I see that "<Subrecipient>" has been added in flextable with Id "---orgLevelSiteVisits:-:associateContactsId---"
    Examples:
      | Subrecipient   |
      | Automation SPI |

  @54210 @monitoringTypeSiteVisitFiscal @deepika
  Scenario: Validate the Monitoring type 'Fiscal' for Organizational Site Visit
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Fiscal" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see field "Monitoring Type" as "Fiscal"

  @54290 @monitoringTypeSiteVisitProgram @deepika
  Scenario: Validate the Monitoring type 'Program' for Organizational Site Visit
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Program" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see field "Monitoring Type" as "Program"

  @54426 @orgSiteVisitTypeApplication @deepika
  Scenario: Validate the Site Visit type Application
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Application" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see field "Desk Review Type" as "Application"

  @54427 @orgSiteVisitTypeAward @deepika
  Scenario: Validate the Site Visit type Award
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see field "Desk Review Type" as "Award"

  @54428  @addParticipantsT0OrgSiteVisit @deepika
  Scenario: Validate the participants for the Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    Then I see that "Automation EXE" has been added in flextable with Id "---orgLevelSiteVisits:-:associateContactsId---"

  @54452 @approverSelectionSiteVisitOrglevel @deepika
  Scenario Outline: Approver selection of Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Then I see that "<Program Approver Name>" has been added in flextable with Id "---orgLevelSiteVisits:-:approverSiteVisitTableId---"
    Examples:
      | Program Approver Name |
      | Automation PM         |

  @54454 @notifySubrecipientSiteVisitOrgLevel @smoke @deepika
  Scenario: Notify Subrecipient about the Site Visit Org Level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    And I click on "Notify" in the page details
    Then I see that "Automation Site Visit Org level" is in "Notified" status

  @54455 @notifyPendingTaskForSubrecipientSiteVisitOrgLevel @deepika
  Scenario: The respective POC from the applicant organization will receive a pending task about the Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    Then I see that "Automation Site Visit Org level" is in "Notified" status

  @54456 @conductSiteVisitOrgLevel @smoke @deepika
  Scenario: Conduct Site Visit Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Then I see status in Progress-bar is "In Progress" and is "green"

  @54457 @addingOutcomeSiteVisitOrgLevel @deepika
  Scenario: Adding outcomes to Site Visit OrgLevel
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I see that "Automation Finding" has been added in flextable with Id "---orgLevelSiteVisits:-:correctiveTableId---"

  @54570 @formFillingSiteVisitOrgLevel @smoke @deepika
  Scenario: Filling up of form in Site Visit Org Level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    Then I see that "100.00%" has been added in flextable with Id "---orgLevelSiteVisits:-:reportsTableId---"

  @54569 @submittingForApprovalSiteVisitOrgLevel @deepika
  Scenario: Submitting Site Visit for approval Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  @54889 @approvalOfSiteVisitOrgLevel @deepika
  Scenario: Approval of Site Visit Org Level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"

  @54890 @siteVisitSendToSubrecipientOrgLevel @deepika
  Scenario: Send Site Visit to Subrecipient	Org Level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    Given I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"

  @56355 @siteVisitCorrectiveActionsBySubrecipientOrgLevel @smoke @deepika
  Scenario: Site Visit Corrective Actions By Subrecipient
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Approve" on the approval decision box
        When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    Then I see that "Automation Site Visit Org level" is in "Sent to Subrecipient" status

  @55206 @siteVisitSubmitToGrantorBySubrecipientOrgLevel @deepika
  Scenario: Site Visit Submit to Grantor By Subrecipient
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @55462 @viewOrgSiteVisitAcceptButtonAfterSRecipientsSubmission @deepika
  Scenario: Validate User will be able to view the Site Visit Accept button after review the submission by Recipients
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details   
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    Then I can see top right button "Accept and Close" in page detail

   @59011 @siteVisitOrgLevelSendBackToOwner @deepika
  Scenario: User will be able to return the Site Visit Org Level record back to Recipients when outcomes are not properly addressed
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Send to Owner" on the approval decision box
    Then I see status in Progress-bar is "Created" and is "green"

  @55464 @siteVisitsOrgLevelWithOutAddingCorerctiveItems @deepika
  Scenario: User will not be able to submit the Site Visits Org Level to Grantor without adding corrective actions to findings.
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details :
      | Reports and Outcomes Tab - Enter corrective actions on all Findings outcomes using the "+" icons. |

  @55465 @approverForwardUserGetPendingTaskSiteVisit @deepika
  Scenario: Validate when the Approver forward Org Level Site Visit to other user, the Pending Task will be created to the User
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Reassign,Automation EXE" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see that "Approve Site Visit Org" has been added in flextable with Id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"

  @55793 @internalParticipantAssociationOrganizationalSiteVisit @smoke @deepika
  Scenario Outline: Internal User participant Association of Organizational Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "<Internal>" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    Then I see that "<Internal>" has been added in flextable with Id "---orgLevelSiteVisits:-:associateContactsId---"
    Examples:
      | Internal       |
      | Automation EXE |

  @55799 @organizationalsiteVisitPurpose @deepika
  Scenario: Validate the Purpose of Site Visit Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Purpose is Required to save under Overview. |

  @55800 @organizationalsiteVisitSource @deepika
  Scenario: Validate the Source of Site Visit Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Source is Required to save under Overview. |

  @55802 @notifyButtonSiteVisitOrgLevel @smoke @deepika
  Scenario: User will be able to view the Notify button on the Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    Then I can see top right button "Notify" in page detail

  @55806 @conductButtonSiteVisitOrgLevel @deepika
  Scenario: User will be able to view the Conduct button on the Site Visit to complete the action items
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    Then I can see top right button "Conduct" in page detail

  @55868 @subrecipientCannotSeeReportAndOutcomesWhenInNotifiedStatusOrgSV @deepika
  Scenario: Site Visit Applicant is not able to view the report or outcomes while in the Notified status.
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    Then I cannot see "Reports and Outcomes" sub tab at view detail page

  @55871 @recipientsCannotCreateOutcomesOrgSV @deepika
  Scenario: Recipients will not be able to create / edit the Outcomes.
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    Then I cannot see "Reports and Outcomes" sub tab at view detail page

  @56008 @siteVisitWithoutFormFillingOrgLevel @deepika
  Scenario: User will not be able to submit the Site Visit for approval without completed forms
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details :
      | Reports and Outcomes Tab - Fill all the required data in the form before submitting. |

  @56007 @peerReviewSiteVisitOrgLevel @deepika
  Scenario: Validate the peer review on their Org Level Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridSiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click modal button "Submit Review"
    When I close "Site Visit Reviewers" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Application Site Visits" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Application Site Visits - All"
    When I click on "View" icon for "Automation Site Visit Org level" inside flex table with id "---orgLevelSiteVisits:-:latestSiteVisitReportsGridTableId---"
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "In Progress" and is "green"

  @56005 @uploadsupportingDocumentChecklistFromWorkSpace @deepika @wip
  Scenario: User will be able to review the supporting document checklist submitted by the subrecipient
    When I navigate to "Attachments" sub tab
    And I upload attachment "InternalOrganization_Field_Values.xlsx" from workspace
    Then I see "InternalOrganization_Field_Values.xlsx" has been added in "Attachment" flex table

  @56004 @sendBacktoOwnerReceivePendingTaskSVOrgLevel @deepika
  Scenario: Validate when Site Visit record sent back to Recipients when outcomes are not properly addressed and recipients will be able to receive a pending task
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Send to Owner" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Application Site Visits" content inside "Application Reviews" subheader on left panel
    Then I see that "Automation Site Visit Org Level" has been added in flextable with Id "ApplicationsSiteVisitReportsGrid"
    
  @56044 @submittingForApprovalButtonOrgLevelSiteVisit @deepika
  Scenario: User will be able to view the Submit for Approval button for Org Level Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I can see top right button "Submit for Approval" in page detail

  @61398 @FieldHistoryUpdatedForSiteVisitIsSendBackToOwnerByProgramApprover @keerti
  Scenario: To Validate field history update post Org level Site Visit is send back to owner by program approver
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "SiteVisit" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Send to Owner" on the approval decision box
    When I navigate to "History" tab
    When I perform quick search for "{SavedValue:Record Id}" in "History" panel
    Then I see value "Created" for title "Old Value" inside table "History"

  @61399 @FieldHistoryUpdatedForSiteVisitIsSendBackToOwnerByFiscalApprover @keerti
  Scenario: To Validate field history update for Org Level Site Visits  is send back to owner by Fiscal Approver
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "SiteVisit" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Send to Owner" on the approval decision box
    When I navigate to "History" tab
    When I perform quick search for "{SavedValue:Record Id}" in "History" panel
    Then I see value "Active" for title "New Value" inside table "History"

  @61400 @RecordOwneruUserCanViewSnapshotAfterSiteVisitIsSubmittedforApprovalStatus @keerti
  Scenario: Validate Record Owner user is able to view the Snapshot after Org Level Site Visit is Submitted for Approval status
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "SiteVisit" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink which contains todays date with text "SnapShot on"
    When I download the file
    Then I see "{SavedValue:Record Id}" on page "1" of "govgrants" pdf file

  @61401 @ApproversTableIsNotEditableAfterSiteVisitsIsSubmittedToApproval @keerti
  Scenario: Validate Approvers Table is not editable for record owner and award owner end when the status of Org Level Site Visits is Submitted to Approval
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "SiteVisit" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I navigate to "Responsibilities" sub tab
    Then I cannot see row level action button "Edit" against "Automation EXE" in flex table with id "---sitevisits:-:correctiveTableId---"

  @61402 @SiteVisitsReviewerCanNotEditAfterSubmittingTheReview @keerti
  Scenario: Validate after submitting the review comments for Org Level Site Visits, the Edit button should will be unavailable for the reviewer
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
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

  @61403 @SVRecordOwnerCanViewSnapshotAfterSVIsAcceptedAndClosed @keerti
  Scenario: Validate whether record Owner is able to view the Snapshot after Org Level Site Visits is Accepted and Closed
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Accept And Close" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink which contains todays date with text "SnapShot on"
    When I download the file
    Then I see "{SavedValue:Record Id}" on page "1" of "govgrants" pdf file

  @61403 @SVRecordOwnerCanViewSnapshotAfterSVIsAcceptedAndClosed @keerti
  Scenario: Validate system does not allow the peer reviewer to edit/Enter review comments if the Org Level Site Visits marked as complete review by the Record owner
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridSiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click modal button "Submit Review"
    When I close "Site Visit Reviewers" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Application Site Visits" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Application Site Visits - All"
    When I click on "View" icon for "Automation Site Visit Org level" inside flex table with id "---orgLevelSiteVisits:-:latestSiteVisitReportsGridTableId---"
    When I click on "Complete Review" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I perform quick search for "Record Id" in "flexGridRiskAssessmentGridViewInternal" panel
    When I click on "View" icon for "Record Id" inside flex table with id "flexGridRiskAssessmentGridViewInternal"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see row level action button "Enter Review" against "Automation FO" in flex table with id "flexGridRiskAssessmentApproverRoles"

  @61405 @PMUserCanAddAttachments @keerti
  Scenario: Validate whether the PM user can add the attachments to Org Level Site Visits
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Overview" sub tab
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" from workspace
    Then I see "Announcement_Field_Values.xlsx" has been added in "Attachments" flex table

  @61406 @CreatedDatedisplayedOnOverviewTab @keerti
  Scenario: Validate the Created Date on Overview Tab for Org Level Site Visits
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I see field "Created Date" is getting updated with todays date

  @61407 @RecordOwnerCanNotEditSVDatesUnderOverviewTab @keerti
  Scenario: Validate Once Sit visits is conducted then Edit Button on page is Hidden and Record Owner cannot edit the Site Visits Dates under Overview tab
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I navigate to "Overview" sub tab
    Then I see field "StartDate__c" is not editable

  @61994 @CreatedDateOfRADisplayedOnOverviewTab @keerti
  Scenario: Validate the Created Date of Risk Assessment display on Overview Tab - Org Site Visits
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Given I navigate to "Overview" sub tab
    Then I see field "StartDate__c" is not editable

  @61993 @RecordOwnerCanViewSnapshotAfterRAIsSubmittedForApproval @keerti
  Scenario: Validate Record Owner user is able to view the Snapshot after Risk Assessment is Submitted for Approval status - Org Site Visits
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    Then I see "{SavedValue:Record Id}" on page "1" of "govgrants" pdf file

  @61988 @RecordOwnerCanViewSnapshotAfterRAIsSubmittedForApproval @keerti
  Scenario: Validate whether user is able to view the Completed task once approved under Monitoring Tab - Org Site visits
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "Automation Announcement for Application" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:correctiveTableId---" by clicking "New" :
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
    And I click on "Approve" on the approval decision box
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:completedTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---riskassessment:-:completedTaskTableId---"
