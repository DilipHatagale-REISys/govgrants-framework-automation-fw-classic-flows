@siteVisit @regression
Feature: Validate all scenarios in the Site Visit

  Background: Data setup for Site Visit
    Given I delete the record "Automation Site Visit" from the object "Site Visit"
     Given I login and view the "Active" award "Activated" with name "Automation Permanent Award" as User "EXE"
      | Actions    | Step 1       | Step 2                | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants                | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants          | View                 |                               |
      | Subaward   | Subawards    | flexGridRelatedAwards1| View                 |                               |
    Given I create a post award record from sheet "Creation" in excel "SiteVisit_Field_Values.xlsx"
      | Actions    | Step 1                 | Step 2                 |
      | Navigation | Management             |                        |
      | FlexTable  | Initiate Site Visit    | GrantorSiteVisitsAward |
      | Creation   | Save and Continue      | Cancel                 |
    And I get the "EGMS ID"

  @51081 @siteVisitCreation @smoke
  Scenario: Creation of Site Visit
    Then I see status in Progress-bar is "Created" and is "green"

  @51082 @siteVisitEdition
  Scenario: Edition of Site Visit
    When I click on "Edit" in the page details
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51083 @participantAssociationSiteVisit
  Scenario Outline: Participant Association of Site Visit
    When I navigate to "Overview" sub tab
    Then I see that "<Subrecipient>" has been added in flextable with Id "siteVisits::participantsTableId"
    Examples:
      | Subrecipient   |
      | Automation PM  |

  @51084 @approverSelectionSiteVisit
  Scenario Outline: Approver selection of Site Visit
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    Then I see that "<Program Approver Name>" has been added in flextable with Id "siteVisits::approverSiteVisitTableId"
    Examples:
      | Program Approver Name | Fiscal Approver Name |
      | Automation PM         | Automation FO        |

  @51085 @notifySubrecipientSiteVisit @smoke
  Scenario: Notify Subrecipient about the Site Visit
     Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    Then I see status in Progress-bar is "Notified" and is "green"

  @51086 @notifyPendingTaskForSubrecipientSiteVisit
  Scenario: Subrecipient pending task check for Site Visit
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    Then I see status in Progress-bar is "Notified" and is "green"

  @51087 @conductSiteVisit @smoke
  Scenario Outline: Conduct Site Visit
   Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
     | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Then I see status in Progress-bar is "In Progress" and is "green"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @51088 @addingOutcomeSiteVisit 
  Scenario Outline: Adding outcomes to Site Visit
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
     | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
       Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
     When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
     And I navigate to "Monitoring" tab
     When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
     And I click on "View" icon for "<Site Visit Name>" inside table
     And I navigate to "Reports and Outcomes" sub tab
     When I click on "Edit" icon for "General Review Form" inside flex table with id "siteVisits::reportsTableId"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "siteVisits::reportsTableId"
     When I enter the following values into flex table with id "siteVisits::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
   Then I see that "Automation Finding" has been added in flextable with Id "siteVisits::correctiveTableId"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @51089 @formFillingSiteVisit @smoke @wip
  Scenario Outline: Filling up of form in Site Visit
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
     | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
       Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
     When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
     And I navigate to "Monitoring" tab
     When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
     And I click on "View" icon for "<Site Visit Name>" inside table
     And I navigate to "Reports and Outcomes" sub tab
     When I click on "Edit" icon for "General Review Form" inside flex table with id "siteVisits::reportsTableId"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "siteVisits::reportsTableId"
    Then I see that "100.00%" has been added in flextable with Id "siteVisits::reportsTableId"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @51090 @submittingForApprovalSiteVisit
  Scenario Outline:  Submitting Site Visit for approval
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
     | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
       Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
     When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
     And I navigate to "Monitoring" tab
     When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
     And I click on "View" icon for "<Site Visit Name>" inside table
     And I navigate to "Reports and Outcomes" sub tab
     When I click on "Edit" icon for "General Review Form" inside flex table with id "siteVisits::reportsTableId"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "siteVisits::reportsTableId"
     When I enter the following values into flex table with id "siteVisits::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @51091 @approvalOfSiteVisit
  Scenario Outline: Approval of Site Visit
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
     | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
       Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
     When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
     And I navigate to "Monitoring" tab
     When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
     And I click on "View" icon for "<Site Visit Name>" inside table
     And I navigate to "Reports and Outcomes" sub tab
     When I click on "Edit" icon for "General Review Form" inside flex table with id "siteVisits::reportsTableId"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "siteVisits::reportsTableId"
     When I enter the following values into flex table with id "siteVisits::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "<Site Visit Approval Task>"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Site Visit Approval Task | Type                     | Site Visit Name       |Award Name                  | Award EGMS ID|
      | Approve Site Visit      | Review Site visit report | Automation Site Visit | Automation Permanent Award | AD-AGR-01 |

  @51092 @siteVisitSendToSubrecipient 
  Scenario Outline: Send Site Visit to Subrecipient
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
     | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
       Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
     When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
     And I navigate to "Monitoring" tab
     When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
     And I click on "View" icon for "<Site Visit Name>" inside table
     And I navigate to "Reports and Outcomes" sub tab
     When I click on "Edit" icon for "General Review Form" inside flex table with id "siteVisits::reportsTableId"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "siteVisits::reportsTableId"
     When I enter the following values into flex table with id "siteVisits::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "<Site Visit Approval Task>"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    Given I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
    Examples: 
      | Award Name                 | Site Visit Name       | Site Visit Approval Task  |
      | Automation Permanent Award | Automation Site Visit | Approve Site Visit        |

  @51093 @siteVisitCorrectiveActionsBySubrecipient @smoke
  Scenario Outline: Site Visit Corrective Actions By Subrecipient
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
     | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
     When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
     And I navigate to "Monitoring" tab
     When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
     And I click on "View" icon for "<Site Visit Name>" inside table
     And I navigate to "Reports and Outcomes" sub tab
     When I click on "Edit" icon for "General Review Form" inside flex table with id "siteVisits::reportsTableId"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "siteVisits::reportsTableId"
     When I enter the following values into flex table with id "siteVisits::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "<Site Visit Approval Task>"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Type>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Type>" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "siteVisits::receipientTableId" by clicking "New" :
      | Title                               | Description            | Status      | Due Date   | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30         |Automation SPI|
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "siteVisits::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30         |Automation SPI|
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "siteVisits::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30         |Automation SPI|
    And I collapse nested table containing column value "Automation Finding"
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
    Examples:
      | Award Name                  | Award EGM ID | Site Visit Name       | Site Visit Approval Task | Type                     |
      | Automation Permanent Award | AD-AGR-01    | Automation Site Visit | Approve Site Visit       | Review Site visit report |

  @51094 @siteVisitSubmitToGrantorBySubrecipient
  Scenario Outline:  Site Visit Submit to Grantor by Subrecipient 
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
     | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
       Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
     When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
     And I navigate to "Monitoring" tab
     When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
     And I click on "View" icon for "<Site Visit Name>" inside table
     And I navigate to "Reports and Outcomes" sub tab
     When I click on "Edit" icon for "General Review Form" inside flex table with id "siteVisits::reportsTableId"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "siteVisits::reportsTableId"
     When I enter the following values into flex table with id "siteVisits::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "<Site Visit Approval Task>"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Type>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Type>" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "siteVisits::receipientTableId" by clicking "New" :
      | Title                               | Description            | Status      | Due Date   | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30         |Automation SPI|
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "siteVisits::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30         |Automation SPI|
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "siteVisits::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30         |Automation SPI|
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    Examples:
      | Award Name                  | Award EGMS ID | Site Visit Name       | Site Visit Approval Task | Type                     |
      | Automation Permanent Award | AD-AGR-01     | Automation Site Visit | Approve Site Visit       | Review Site visit report |

  @51095 @siteVisitAcceptAndClose @smoke
  Scenario Outline:  Site Visit Accept and Close 
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
     | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "siteVisits::approverSiteVisitTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
       Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
     When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
     And I navigate to "Monitoring" tab
     When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
     And I click on "View" icon for "<Site Visit Name>" inside table
     And I navigate to "Reports and Outcomes" sub tab
     When I click on "Edit" icon for "General Review Form" inside flex table with id "siteVisits::reportsTableId"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "siteVisits::reportsTableId"
     When I enter the following values into flex table with id "siteVisits::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
   When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "<Site Visit Approval Task>"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Type>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Type>" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "siteVisits::receipientTableId" by clicking "New" :
      | Title                               | Description            | Status      | Due Date   | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30         |Automation SPI  |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "siteVisits::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30         |Automation SPI|
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "siteVisits::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30         |Automation SPI|
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"
    Examples:
      | Award Name                  | Type                    | Award EGMS ID | Site Visit Name       | Site Visit Approval Task |
      | Automation Permanent Award | Review Site visit report | AD-AGR-01     | Automation Site Visit | Approve Site Visit       |
	
	