@siteVisit @regression
Feature: Validate all scenarios in the Site Visit

  Background: Data setup for Site Visit
    Given I delete the record "Automation Site Visit" from the object "Site Visit"
    Given I login and view the "Active" award "Activated" with name "Automation Permanent Award" as User "EXE"
      | Actions    | Step 1       | Step 2                 | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants                 | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants           | View                 |                               |
      | Subaward   | Subawards    | flexGridRelatedAwards1 | View                 |                               |
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"

  @51081 @siteVisitCreation @smoke
  Scenario: Creation of Site Visit
    Then I see status in Progress-bar is "Created" and is "green"

  @51082 @siteVisitEdition @notFunctional
  Scenario: Edition of Site Visit
    When I click on "Edit" in the page details
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51083 @participantAssociationSiteVisit 
  Scenario Outline: Participant Association of Site Visit
    Given I associate "1" records "Automation EXE"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Then I see that "<Participant>" has been added in flextable with Id "---sitevisits:-:participants_table_id---"
    Examples:
      | Participant    |
      | Automation EXE |

  @51084 @approverSelectionSiteVisit
  Scenario Outline: Approver selection of Site Visit
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Then I see that "<Program Approver Name>" has been added in flextable with Id "---sitevisits:-:approver_site_visit_table_id---"
    Examples:
      | Program Approver Name |
      | Automation PM         |

  @51085 @notifySubrecipientSiteVisit @smoke
  Scenario: Notify Subrecipient about the Site Visit
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Notify" in the page details
    Then I see that "Automation Site Visit" is in "Notified" status

  @51086 @notifyPendingTaskForSubrecipientSiteVisit
  Scenario: Subrecipient pending task check for Site Visit
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    Then I see that "Automation Site Visit" is in "Notified" status

  @51087 @conductSiteVisit @smoke
  Scenario: Conduct Site Visit
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Then I see status in Progress-bar is "In Progress" and is "green"

  @51088 @addingOutcomeSiteVisit
  Scenario: Adding outcomes to Site Visit
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---sitevisits:-:reports_Table_Id---"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I see that "Automation Finding" has been added in flextable with Id "---sitevisits:-:corrective_table_id---"

  @51089 @formFillingSiteVisit @smoke
  Scenario: Filling up of form in Site Visit
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---sitevisits:-:reports_Table_Id---"
    Then I see that "100.00%" has been added in flextable with Id "---sitevisits:-:reports_Table_Id---"

  @51090 @submittingForApprovalSiteVisit
  Scenario:  Submitting Site Visit for approval
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---sitevisits:-:reports_Table_Id---"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  @51091 @approvalOfSiteVisit
  Scenario Outline: Approval of Site Visit
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---sitevisits:-:reports_Table_Id---"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Site Visit Approval Task | Type                     | Site Visit Name       |Award Name                 | Award EGMS ID|
      | Approve Site Visit      | Review Site visit report | Automation Site Visit | Automation Permanent Award | AD-Gr19-01   |

  @51092 @siteVisitSendToSubrecipient
  Scenario Outline: Send Site Visit to Subrecipient
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---sitevisits:-:reports_Table_Id---"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Record Id"
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
      | Site Visit Name       |
      | Automation Site Visit |

  @51093 @siteVisitCorrectiveActionsBySubrecipient @smoke
  Scenario Outline: Site Visit Corrective Actions By Subrecipient
     Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---sitevisits:-:reports_Table_Id---"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    Then I see that "Automation Site Visit" is in "Sent to Subrecipient" status
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @51094 @siteVisitSubmitToGrantorBySubrecipient
  Scenario:  Site Visit Submit to Grantor by Subrecipient
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---sitevisits:-:reports_Table_Id---"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @51095 @siteVisitAcceptAndClose @smoke
  Scenario Outline: Site Visit Accept and Close
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---sitevisits:-:reports_Table_Id---"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |
      
  @39180 @siteVisitAddCorrectiveActionsByFOUser @smoke @wip @deepika
  Scenario Outline: Verify that only recipient user can add corrective actions and not by Internal User on status send to subrecipeint for Award level 
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---sitevisits:-:reports_Table_Id---"
    When I enter the following values into flex table with id "---sitevisits:-:corrective_table_id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    Given I click on "Send to Subrecipient" in the page details
    And I navigate to "Reports and Outcomes" tab
     And I expand nested table containing column value "Automation Observation"
     Then I do not see value "New" for title "Automation Observation" inside table "---sitevisits:-:corrective_table_id---"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |
      
@39159 @siteVisitDeleteAccesstoOwner @smoke @deepika
  Scenario Outline: Verify that record owner can delete created state site visit from Award level
    Given I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "Delete" icon for "<Site Visit Name>" inside table
    Then I do not see values "Automation Site Visit" and "Title" inside table
   Examples:
      | Site Visit Name       |
      | Automation Site Visit |
      
@39169 @reportsAndOutcomesEditAccess @deepika
  Scenario: Verify that upon conduct,  Reports And Outcomes tab are editable to the internal user for an award  level site visit
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    Then I can see row level action button "Edit" against "General Review Form" in flex table with id "---sitevisits:-:reports_Table_Id---"

 @35666 @submittedToGrantorOptionallySendBackToSubrecipient @deepika
  Scenario: Verify that PM user (other than record owner) is able to conduct created site visit
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel
    And I click on "View" icon for "Record Id" inside table
    Then I cannot see top right button "Conduct" in page detail
    
@54225 @detailsOnSiteVisitBeforeNotification @deepika 
  Scenario: Verify user is not able to delete site visit record if it is not in Created state (Negative TC) 
	Given I navigate to "Responsibilities" sub tab 
	And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" : 
		| Role             | Name          | Description                 |
		| Program Approver | Automation PM | Automation Test Description |
		| Fiscal Approver  | Automation FO | Automation Test Description |
	When I get the "EGMS ID" 
	And I click on "Notify" in the page details 
	And I navigate to "Monitoring" tab 
	When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel 
	When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel 
	Then I cannot see row level action button "Delete" against "Record id" in flex table with id "---sitevisits:-:manage_site_visit_table_id---"
	
@54221 @siteVisitNotifiedByFOuser @deepika @wip
   Scenario: Verify user (record owner only) is able to plan and notify created site visit to subrecipient and other user cannot notify  - Award Level 
	Given I navigate to "Responsibilities" sub tab
	And I edit the following rows inline in flex table with id "---sitevisits:-:approver_site_visit_table_id---" by clicking "Edit" : 
		| Role             | Name          | Description                 |
		| Program Approver | Automation PM | Automation Test Description |
		| Fiscal Approver  | Automation FO | Automation Test Description |
	When I get the "EGMS ID" 
	When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal 
	And I navigate to "Monitoring" tab 
	When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel 
	When I perform quick search for "Record Id" in "---sitevisits:-:manage_site_visit_table_id---" panel 
	And I click on "View" icon for "Record Id" inside table 
	Then I cannot see top right button "Notify" in page detail
    
  
