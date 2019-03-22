@siteVisit
Feature: Validate all scenarios in the Site Visit

  Background: Data setup for Site Visit
    Given I delete the record "Automation Site Visit" from the object "Site Visit"
    And I login and view the "Active" award "AD-EGA-01" with name "Execution Grant for Automation" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I create a post award record from sheet "Creation" in excel "SiteVisit_Field_Values.xlsx"
      | Actions    | Step 1              | Step 2                 |
      | Navigation | Management          |                        |
      | FlexTable  | Initiate Site Visit | GrantorSiteVisitsAward |
      | Creation   | Save And Close      | Cancel                 |
    And I get the "EGMS ID"

  @siteVisitCreation @siteVisit @all
  Scenario: Creation of Site Visit
    Then I see status in Progress-bar is "Created" and is "green"

  @siteVisitEdition @siteVisit @all
  Scenario: Edition of Site Visit
    When I click on "Edit" in the page details
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @participantAssociationSiteVisit @siteVisit @all
  Scenario Outline: Participant Association of Site Visit
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "<Subrecipient>" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    Then I see that "<Subrecipient>" has been added in flextable with Id "GrantorSiteVisitContacts"
    Examples:
      | Subrecipient   |
      | Automation SPI |

  @approverSelectionSiteVisit @siteVisit @all
  Scenario Outline: Approver selection of Site Visit
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "GrantorSiteVisitRolesandResponsibilities"
    When I fill in the "<Program Approver Name>" for the Approver details
    And I close Modal
    When I click on "Edit" icon for "Fiscal Approver" inside flex table with id "GrantorSiteVisitRolesandResponsibilities"
    And I fill in the "<Fiscal Approver Name>" for the Approver details
    When I close Modal
    Then I see that "<Program Approver Name>" has been added in flextable with Id "GrantorSiteVisitRolesandResponsibilities"
    Examples:
      | Program Approver Name | Fiscal Approver Name |
      | Automation PM         | Automation FO        |

  @notifySubrecipientSiteVisit @siteVisit @all
  Scenario: Notify Subrecipient about the Site Visit
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    Then I see status in Progress-bar is "Notified" and is "green"

  @notifyPendingTaskForSubrecipientSiteVisit @siteVisit @all
  Scenario: Subrecipient pending task check for Site Visit
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    Then I see status in Progress-bar is "Notified" and is "green"

  @conductSiteVisit @siteVisit @all
  Scenario Outline: Conduct Site Visit
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    When I click on "Conduct" in the page details
    Then I see status in Progress-bar is "In Progress" and is "green"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @addingOutcomeSiteVisit @siteVisit @all
  Scenario Outline: Adding outcomes to Site Visit
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
      | Title                  | Description            | Type        | Status | Closed Date |
      | Automation Finding     | Automation Description | Finding     | Open   |             |
      | Automation Concern     | Automation Description | Concern     | Open   |             |
      | Automation Observation | Automation Description | Observation | Open   |             |
    Then I see that "Automation Finding" has been added in flextable with Id "inlineEditGridGrantorSiteVisitFindingsGrid"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @formFillingSiteVisit @siteVisit @all
  Scenario Outline: Filling up of form in Site Visit
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "FormComponent"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "FormComponent"
    Then I see that "100.00%" has been added in flextable with Id "FormComponent"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @submittingForApprovalSiteVisit @siteVisit @all
  Scenario Outline:  Submitting Site Visit for approval
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "SiteVisit_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | Site Visit Name       |
      | Automation Site Visit |

  @approvalOfSiteVisit @siteVisit @all
  Scenario Outline: Approval of Site Visit
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "SiteVisit_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
    When I click on "Submit for Approval" in the page details
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Site Visit Approval Task >" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Site Visit Approval Task >" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "FO" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Site Visit Approval Task >" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Site Visit Approval Task >" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Site Visit Approval Task | Type                     | Site Visit Name       |
      | Approval Site Visit      | Review Site visit report | Automation Site Visit |

  @siteVisitSendToSubrecipient @siteVisit @all
  Scenario Outline: Send Site Visit to Subrecipient
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "SiteVisit_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "<Site Visit Approval Task>"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | MyTasks    | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I expand nested table containing column value "<Award Name>"
    When I expand nested table containing column value "<Award Name>"
    And I perform quick search for "<Site Visit Name>" for the parent value "AD-AuGr--01" on grid "inlineEditGridSiteVisitsGridView"
    When I click on "Start" icon for "<Site Visit Name>" inside table
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
    Examples:
      | Award Name                     | Site Visit Name       | Site Visit Approval Task |
      | Execution Grant for Automation | Automation Site Visit | Approve Site Visit       |

  @siteVisitCorrectiveActionsBySubrecipient @siteVisit @all
  Scenario Outline: Send Site Visit to Subrecipient
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "SiteVisit_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
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
    When I enter the following values into flex table with id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance" by clicking "New" :
      | Title                               | Description            | Status      | Due Date   | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 12/25/2018 | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 12/25/2018 | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 12/25/2018 | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
    Examples:
      | Award Name                     | Award EGMS ID | Site Visit Name       | Site Visit Approval Task | Type                     |
      | Execution Grant for Automation | AD-EGA-01     | Automation Site Visit | Approve Site Visit       | Review Site visit report |

  @siteVisitSubmitToGrantorBySubrecipient @siteVisit @all
  Scenario Outline: Send Site Visit to Subrecipient
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "SiteVisit_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
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
    When I enter the following values into flex table with id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance" by clicking "New" :
      | Title                               | Description            | Status      | Due Date   | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 12/25/2018 | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 12/25/2018 | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 12/25/2018 | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    Examples:
      | Award Name                     | Award EGMS ID | Site Visit Name       | Site Visit Approval Task | Type                     |
      | Execution Grant for Automation | AD-EGA-01     | Automation Site Visit | Approve Site Visit       | Review Site visit report |

  @siteVisitAcceptAndClose @siteVisit @all
  Scenario Outline: Send Site Visit to Subrecipient
    Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                   | Step 4    | Step 5                       |
      | Associate 1 | Overview | Associate | GrantorSiteVisitContacts | Associate | SelectSiteDeskReviewContacts |
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                   | Step 2 | Step 3           |
      | Subtab     | Responsibilities                         |        |                  |
      | Approver 1 | GrantorSiteVisitRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorSiteVisitRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Notify" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Monitoring        | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "SiteVisit_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
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
    When I enter the following values into flex table with id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance" by clicking "New" :
      | Title                               | Description            | Status      | Due Date   | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 12/25/2018 | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 12/25/2018 | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 12/25/2018 | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"

    Examples:
      | Award Name                     | Type                     | Award EGMS ID | Site Visit Name       | Site Visit Approval Task |
      | Execution Grant for Automation | Review Site visit report | AD-EGA-01     | Automation Site Visit | Approve Site Visit       |
	
	