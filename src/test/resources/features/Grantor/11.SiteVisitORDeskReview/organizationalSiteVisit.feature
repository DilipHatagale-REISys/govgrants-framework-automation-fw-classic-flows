@organizationalSiteVisit @grantor-regression @grantor-parallel-regression @siteVisit @regression
Feature: Validate all scenarios in Organizational Site Visit

  Background: Creation of Organizational Site Visit
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI  | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table

  @59010 @51079 @orgSiteVisitCreationEdition
  Scenario: Validate the Created and Edition of Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"

  @51080 @participantAssociationOrganizationalSiteVisitExternallUser
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
      | Subrecipient               |
      | {SavedValue:SPI3 Username} |

  @54210 @monitoringTypeSiteVisitFiscal @deepika
  Scenario: Validate the Monitoring type 'Fiscal' for Organizational Site Visit
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Fiscal" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see "Fiscal" text enter in field "MonitoringType__c"

  @54290 @monitoringTypeSiteVisitProgram @deepika
  Scenario: Validate the Monitoring type 'Program' for Organizational Site Visit
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Program" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see "Program" text enter in field "MonitoringType__c"

  @54426 @orgSiteVisitTypeApplication @deepika
  Scenario: Validate the Site Visit type Application
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Application" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see field "Desk Review Type" as "Other"

  @54427 @orgSiteVisitTypeAward @deepika
  Scenario: Validate the Site Visit type Award
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see field "Desk Review Type" as "Award"

  @54428 @addParticipantsT0OrgSiteVisit @deepika
  Scenario: Validate the participants for the Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    Then I see that "{SavedValue:EXE Username}" has been added in flextable with Id "---orgLevelSiteVisits:-:associateContactsId---"

  @54452 @approverSelectionSiteVisitOrglevel @deepika
  Scenario Outline: Approver selection of Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    Then I see that "<Program Approver Name>" has been added in flextable with Id "---orgLevelSiteVisits:-:approverSiteVisitTableId---"
    Examples:
      | Program Approver Name    |
      | {SavedValue:PM Username} |

  @54454 @54456 @75862 @conductAndnotifySubrecipientSiteVisitOrgLevel @smoke @deepika
  Scenario: Conduct Site Visit and Notify Subrecipient about the Site Visit Org Level | Validate the external user will receive an email notification when the org level site visit is in notified status
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    And I save the field labeled "EGMS ID" as "SiteVisitId"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    And I click on "Notify" in the page details
    Then I softly see that "{SavedValue:Automation Runtime Site Visit Org level}" is in "Notified" status
    And I logout
    And I checkout to yopmail with mailid "automationspi30@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Site Visit for {SavedValue:SiteVisitId} has been scheduled
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "{SavedValue:SiteVisitId}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:SiteVisitId}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"

  @54455 @notifyPendingTaskForSubrecipientSiteVisitOrgLevel @deepika
  Scenario: The respective POC from the applicant organization will receive a pending task about the Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    Then I see that "{SavedValue:Automation Runtime Site Visit Org level}" is in "Notified" status

  @54570 @formFillingSiteVisitOrgLevel @deepika
  Scenario: Filling up of form in Site Visit Org Level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    Then I see that "100%" has been added in flextable with Id "---orgLevelSiteVisits:-:reportsTableId---"

  @54569 @54457 @addingOutcomeAndpprovalSiteVisitOrgLevel @deepika
  Scenario: Validate Adding outcomes and Submitting Site Visit for approval Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    Then I softly see that "Automation Finding" has been added in flextable with Id "---orgLevelSiteVisits:-:correctiveTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"

  @54890 @54889 @siteVisitapprovalAndSendToSubrecipientOrgLevel @deepika @smoke
  Scenario: Approval and Send Site Visit to Subrecipient Org Level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I "Approve" in the approval decision
    And I wait for "4" seconds
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Reports and Outcomes" sub tab
    Given I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"

  @56355 @55206 @siteVisitSubmitToGrantorAndCorrectiveActionsBySubrecipient @smoke @deepika
  Scenario: Validate the Site Visit Submit to Grantor and Corrective Actions By Subrecipients
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    Then I softly see that "{SavedValue:Automation Runtime Site Visit Org level}" is in "Sent to Subrecipient" status
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"

  @55462 @61403 @viewnapshotOrgSiteVisitAcceptButtonAfterSRecipientsSubmission @deepika @skipOnJenkins
  Scenario: Validate User will be able to view the SnapshotSite Visit Accept button after review the submission by Recipients
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Accept And Close" in the page details
    Then I softly can see top right button "Accept and Close" in page detail
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Site Visit - Accept And Close"
    When I download the file
    Then I see "Closed" on page "1" of "govgrants" pdf file

  @59011 @56004 @sendBacktoOwnerReceivePendingTaskSVOrgLevel @deepika
  Scenario:  Validate when Site Visit record sent back to Recipients when outcomes are not properly addressed and recipients will be able to receive a pending task
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Site Visit Org level}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    Then I softly see that "{SavedValue:Automation Runtime Site Visit Org level}" has been added in flextable with Id "---sitevisits:-:manageSiteVisitTableId---"

  @55464 @siteVisitsOrgLevelWithOutAddingCorerctiveItems @deepika
  Scenario: User will not be able to submit the Site Visits Org Level to Grantor without adding corrective actions to findings.
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    And I refresh the page
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    And I refresh the page
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I "Reassign" to user "{SavedValue:EXE Username}" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see that "Approve Site Visit Org" has been added in flextable with Id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"

  @internalParticipantAssociationOrganizationalSiteVisit @smoke @deepika
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
      | Internal                  |
      | {SavedValue:EXE Username} |

  @55799 @organizationalsiteVisitPurpose @deepika
  Scenario: Validate the Purpose of Site Visit Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
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
    And I enter "Edition1" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Source is Required to save under Overview. |

  @55802 @55806 @notifyConductButtonSiteVisitOrgLevel @smoke @deepika
  Scenario: User will be able to view the Notify and Conduct button on the Site Visit to complete the action items
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    And I click on "Notify" in the page details
    Then I softly see status in Progress-bar is "Notified" and is "green"
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"

  @55871 @55868 @recipientsCannotCreateOutcomesSeeReportsANdoutcomesInNotified @deepika
  Scenario: Validate Site Visit Applicant is not able to view the report or outcomes while in the Notified status and Recipients will not be able to create / edit the Outcomes.
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    Then I softly cannot see "Reports and Outcomes" sub tab at view detail page

  @56008 @siteVisitWithoutFormFillingOrgLevel @deepika
  Scenario: User will not be able to submit the Site Visit for approval without completed forms
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details :
      | Reports and Outcomes Tab - Complete all data in the form. |

  @56005 @uploadsupportingDocumentChecklistFromWorkSpace @deepika
  Scenario: User will be able to review the supporting document checklist submitted by the subrecipient
    When I navigate to "Files" sub tab
    And I click on "Upload Template" icon for "Automation" inside flex table with id "---orgRiskAssessment:-:orgriskSupportingDocTableId---" with wait for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click in table hyperlink containing value "View"
    Then I softly verify that the file "Attachment.pdf" is downloaded

  @61398 @56044 @submittingForApprovalFieldHistoryUpdatedForSiteVisitIsSendBackToOwnerByProgramApprover @keerti
  Scenario: To Validate User will be able to view the Submit for Approval button  and field history update post Org level Site Visit is send back to owner by program approver
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    Then I softly can see top right button "Submit for Approval" in page detail
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I "Send to Owner" in the approval decision
    When I navigate to "History" sub tab
    When I perform quick search for "Record Id" in "History" panel
    Then I softly see value "Created" for title "Old Value" inside table "History"

  @61399 @FieldHistoryUpdatedForSiteVisitIsSendBackToOwnerByFiscalApprover @keerti
  Scenario: To Validate field history update for Org Level Site Visits  is send back to owner by Fiscal Approver
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I "Send to Owner" in the approval decision
    When I navigate to "History" sub tab
    When I perform quick search for "Record Id" in "History" panel
    Then I see value "In Progress" for title "New Value" inside table "History"

  @61400 @61401 @ViewSnapshotandApproversTableIsNotEditableAfterSiteVisitsIsSubmittedToApproval @keerti @skipOnJenkins
  Scenario: Validate Record Owner user is able to view the Snapshot and Approvers Table is not editable for record owner and award owner end when the status of Org Level Site Visits is Submitted to Approval
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    Then I softly can see row level action button "Edit" against "{SavedValue:FO Username}" in flex table with id "---sitevisits:-:approverSiteVisitTableId---"
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    Then I see snapshot with name containing "Sitevisit_submit_for_approval" as name

  @61402 @SiteVisitsReviewerCanNotEditAfterSubmittingTheReview @keerti
  Scenario: Validate after submitting the review comments for Org Level Site Visits, the Edit button should will be unavailable for the reviewer
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridSiteVisitReviewerRoles" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "flexGridSiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
#    When I close "Site Visit Reviewers" modal by clicking the top right x button
    Then I cannot see top right button "Edit" in page detail

  @56007 @PeerReviewAfterSVIsAcceptedAndClosed @keerti
  Scenario: Validate peer review  process and also system does not allow the peer reviewer to edit/Enter review comments if the Org Level Site Visits marked as complete review by the Record owner
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridSiteVisitReviewerRoles" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "flexGridSiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on "Submit Review" in the page details
#    When I close "Site Visit Reviewers" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see row level action button "Enter Review" against "{SavedValue:PO Username}" in flex table with id "flexGridRiskAssessmentApproverRoles"

  @61406 @61405 @66273 @CreatedDatedisplayedOnOverviewTabAddAttchments @keerti
  Scenario: Validate whether the PM user can add the attachments to Org Level Site Visits and view the Created Date on Overview Tab |Validate whether record owner has access to delete the asoociated Contact and Application- Org Site visits
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Created Date" is getting updated with todays date
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on "Remove" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    Then I softly see "No Records Found" inside flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "GrantorSiteVisitFilesgrid"
    And I upload attachment "Announcement_Field_Values.xlsx" of type "Pre-Site Visit Letter" from computer
    Then I softly see "Pre-Site Visit Letter" has been added in "Site Visit Files" flex table

  @61407 @61994 @CreatedDateCanNotEditSVDatesUnderOverviewTab @keerti
  Scenario: Validate the Created Date of Risk Assessment display on Overview Tab and owner cannot edit the Site Visits Dates under Overview tab
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Overview" sub tab
    Then I softly see field "StartDate__c" is not editable
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given I navigate to "Overview" sub tab
    Then I softly see field "StartDate__c" is not editable

  @61993 @RecordOwnerCanViewSnapshotAfterOSVIsSubmittedForApproval @keerti @skipOnJenkins
  Scenario: Validate Record Owner user is able to view the Snapshot after Site Visit is Submitted for Approval status - Org Site Visits
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
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
    And I click on hyperlink containing value "Sitevisit_submit_for_approval"
    And I click on hyperlink which contains todays date with text "SnapShot on"
    When I download the file
    Then I see "Submitted for Approval" on page "1" of "govgrants" pdf file

  @61988 @RecordOwnerCanViewSnapshotAfterRAIsSubmittedForApproval @keerti
  Scenario: Validate whether user is able to view the Completed task once approved under Monitoring Tab
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    And I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:completedTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---riskassessment:-:completedTaskTableId---"

  @65151 @deleteCreatedOrgSiteVisit @deepika
  Scenario: Validate whether user will be able to delete the created Org Site Visits
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Overview" sub tab
    Then I softly verify that field "Award__c" is not editable by entering "Select" value
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    When I navigate to "Related log" sub tab
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime Site Visit Org level}" in flex table with id "SiteVisit"
    When I click on "Delete" icon for "{SavedValue:Automation Runtime Site Visit Org level}" inside flex table with id "SiteVisit"
    And I perform quick search for "Record Id" in "SiteVisit" panel
    Then I softly see "No Records Found" inside flex table with id "SiteVisit"

  @65152 @historyOfOrgSiteVisitsendbacktoOwner @deepika @smoke
  Scenario: Validate History Field is getting Updated at Award owner End when Org Site Visit status is Submitted to Grantor.
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I "Send to Owner" in the approval decision
    When I navigate to "History" sub tab
    Then I see value "In Progress" for title "New Value" inside table "History"

  @65153 @corerctiveActionsDueDateSV @deepika
  Scenario: Validate Org Level Site Visit Submit to Grantor and Corrective Actions By Subrecipient
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | -10      | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Observation"
    Then I softly see the following messages in the page details contains:
      | Due date must be future date |

  @65154 @foUserCannotDeleteCreatedOrgSiteVisit @deepika
  Scenario: Validate whether other than record owner Fo user can delete the created Org Level Site Visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    When I navigate to "Related log" sub tab
    When I perform quick search for "Record Id" in "SiteVisit" panel
    Then I see "No Records Found" inside flex table with id "SiteVisit"

  @39187 @clickAcceptAndCloseButtonforAward @meenakshi
  Scenario: Verify that when user click on 'Approve and Close' button then status will change to closed for Award level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:homePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:homePendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Accept And Close" in the page details
    Then I softly see field "Status" as "Closed"

  @147976 @Verify1StepApprovalForSiteVisitOrgLevel-RnRFuntionality @monu
  Scenario: Verify user can add step1 approver on organization site visit created
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    Then I softly see "Saved Successfully!" inside flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---"

  @148023 @VerifyErrorMessageAtApproverSectionWhileSkippingForSiteVisitOrgLevel-RnRFunctnality @monu
  Scenario: Verify the validation is displayed when NA is defined for step on organization site visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | NA         |
    And I wait for "10" seconds
    When I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details contains:
      | Responsibilities - At least one approver is required |

  @148043 @VerifyUserShouldNotBeAbleToAddSameStepForMultipleUserAtSiteVisitOrgLevel-RnRFunctionality @monu
  Scenario: Verify validation user cannot add the same step for different approver on Organization site visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    Then I softly see "You cannot specify the same step for multiple users for Site Visit." inside flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---"

  @148045 @VerifyUserShouldNotBeAbleToAddSameUserForMultipleStepAtSiteVisitOrgLevel-RnRFunctionality @monu
  Scenario: Verify validation user cannot add the same approver for different step on Organization site visit
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
#    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    Then I softly see "You cannot specify the same user for multiple steps for Site Visit" inside flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---"

  @147978 @Verify2StepApprovalForSiteVisitOrgLevel-RnRFuntionality @monu
  Scenario: Verify user can add two step approver on organization site visit created
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 2     |
    Then I softly see value "Step 2" for title "Site Visit" inside table "---orgLevelSiteVisits:-:approverSiteVisitTableId---"
    #Then I softly see "Saved Successfully!" inside flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---"