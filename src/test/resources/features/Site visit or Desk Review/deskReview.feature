@deskReview @regression
Feature: Validate all scenarios in Desk Review

  Background: Create Desk Review
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    And I login and view the "Active" award "AD-GREG-35" with name "Automation Grant Award for Post Award" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I create a post award record from sheet "Creation" in excel "DeskReview_Field_Values.xlsx"
      | Actions    | Step 1               | Step 2                 |
      | Navigation | Management           |                        |
      | FlexTable  | Initiate Desk Review | GrantorDeskReviewAward |
      | Creation   | Save And Close       | Cancel                 |
    And I get the "EGMS ID"

  @deskReviewCreation
  Scenario: Creation of Desk Review
    Then I see status in Progress-bar is "Created" and is "green"

  @deskReviewEdition
  Scenario: Edition of Desk Review
    When I click on "Edit" in the page details
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @participantAssociationDeskReview
  Scenario Outline: Participant Association of Desk Review
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "deskreview::participantsTableId"
    When I click "Associate" after selection of "<Subrecipient>" in the table "deskreview::deskreviewContactsTableId"
    And I close Modal
    Then I see that "<Subrecipient>" has been added in flextable with Id "deskreview::participantsTableId"
    Examples:
      | Subrecipient   |
      | Automation SPI |

  @approverSelectionDeskReview
  Scenario Outline: Approver selection of Desk Review
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "deskreview::approverDeskReviewTableId"
    When I fill in the "<Program Approver Name>" for the Approver details
    And I close Modal
    When I click on "Edit" icon for "Fiscal Approver" inside flex table with id "deskreview::approverDeskReviewTableId"
    And I fill in the "<Fiscal Approver Name>" for the Approver details
    When I close Modal
    Then I see that "<Program Approver Name>" has been added in flextable with Id "deskreview::approverDeskReviewTableId"
    Examples:
      | Program Approver Name | Fiscal Approver Name |
      | Automation PM         | Automation FO        |

  @notifySubrecipientDeskReview
  Scenario: Notify Subrecipient about the Desk Review
    Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
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

  @notifyPendingTaskForSubrecipientDeskReview
  Scenario: Subrecipient pending task check for Desk Review
    Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
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

  @conductDeskReview
  Scenario Outline: Conduct Desk Review
    Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
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
    And I click on "View" icon for "<Desk Review Name>" inside table
    When I click on "Conduct" in the page details
    Then I see status in Progress-bar is "In Progress" and is "green"
    Examples:
      | Desk Review Name       |
      | Automation Desk Review |

  @addingOutcomeDeskReview
  Scenario Outline: Adding outcomes to Desk Review
    Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
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
    And I click on "View" icon for "<Desk Review Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "deskreview::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I see that "Automation Finding" has been added in flextable with Id "deskreview::correctiveTableId"
    Examples:
      | Desk Review Name       |
      | Automation Desk Review |

  @formFillingDeskReview
  Scenario Outline: Filling up of form in Desk Review
    Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
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
    And I click on "View" icon for "<Desk Review Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "deskreview::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "deskreview::reportsTableId"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "deskreview::reportsTableId"
    Then I see that "100.00%" has been added in flextable with Id "deskreview::reportsTableId"
    Examples:
      | Desk Review Name       |
      | Automation Desk Review |

  @submittingForApprovalDeskReview
  Scenario Outline: Submitting Desk Review for approval
    Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
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
    And I click on "View" icon for "<Desk Review Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "deskreview::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "DeskReview_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | Desk Review Name       |
      | Automation Desk Review |

  @approvalOfDeskReview
  Scenario Outline: Approval of Desk Review
    Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
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
    And I click on "View" icon for "<Desk Review Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "deskreview::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "DeskReview_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
    When I click on "Submit for Approval" in the page details
      Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Desk Review Approval Task>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Desk Review Approval Task>" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "FO" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Desk Review Approval Task>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Desk Review Approval Task>" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Award Name                            | Award EGMS ID | Desk Review Name       | Desk Review Approval Task | Type                      |
      | Automation Grant Award for Post Award | AD-GREG-35    | Automation Desk Review | Approval Desk Review      | Review Desk review report |

  @deskReviewSendToSubrecipient
  Scenario Outline: Send Desk Review to Subrecipient
    Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
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
    And I click on "View" icon for "<Desk Review Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "deskreview::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "DeskReview_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "<Desk Review Approval Task>"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I expand nested table containing column value "<Award Name>"
    When I expand nested table containing column value "<Award Name>"
    And I perform quick search for "<Desk Review Name>" for the parent value "AD-GREG-35" on grid "inlineEditGridSiteVisitsGridView"
    When I click on "Start" icon for "<Desk Review Name>" inside table
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
    Examples:
      | Desk Review Name       | Award Name                            | Desk Review Approval Task |
      | Automation Desk Review | Automation Grant Award for Post Award | Approve Desk Review       |

  @deskReviewCorrectiveActionsBySubrecipient
  Scenario Outline: Send Desk Review to Subrecipient
    Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
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
    And I click on "View" icon for "<Desk Review Name>" inside table
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "deskreview::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "DeskReview_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "<Desk Review Approval Task>"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Desk Review Name>" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Type>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Type>" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "deskreview::receipientTableId" by clicking "New" :
      | Title                               | Description            | Status      | Due Date   | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30 | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "deskreview::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30 | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "deskreview::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30 | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
    Examples:
      | Award Name                     | Award EGMS ID | Desk Review Name       | Desk Review Approval Task | Type                      |
      | Automation Grant Award for Post Award | AD-GREG-35     | Automation Desk Review | Approve Desk Review       | Review Desk review report |

  @deskReviewSubmitToGrantorBySubrecipient
  Scenario Outline: Send Desk Review to Subrecipient
    Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
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
    And I click on "View" icon for "<Desk Review Name>" inside table
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "deskreview::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "DeskReview_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "<Desk Review Approval Task>"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Desk Review Name>" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Type>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Type>" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "deskreview::receipientTableId" by clicking "New" :
      | Title                               | Description            | Status      | Due Date   | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30 | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "deskreview::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30 | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "deskreview::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30 | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    Examples:
      | Award Name                     | Award EGMS ID | Desk Review Name       | Desk Review Approval Task | Type                      |
      | Automation Grant Award for Post Award | AD-GREG-35     | Automation Desk Review | Approve Desk Review       | Review Desk review report |

  @deskReviewAcceptAndClose @smoke
  Scenario Outline: Send Desk Review to Subrecipient
Given I complete the fields from the sheet "Edition" in excel "DeskReview_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
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
    And I click on "View" icon for "<Desk Review Name>" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    And I fill in the form "General Review Form" from sheet "Form Fields" in excel "DeskReview_Field_Values.xlsx"
      | Actions     | Step 1               | Step 2        |
      | Navigation  | Reports and Outcomes |               |
      | FlexTable   | Edit                 | FormComponent |
      | Form Button | Save                 | Back          |
      | Validation  | Validate             | FormComponent |
    When I enter the following values into flex table with id "deskreview::correctiveTableId" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "<Desk Review Approval Task>"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Desk Review Name>" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Type>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Type>" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "deskreview::receipientTableId" by clicking "New" :
      | Title                               | Description            | Status      | Due Date   | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30| Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "deskreview::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30| Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "deskreview::receipientTableId" by clicking "New" :
      | Title                           | Description            | Status      | Due Date   | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30 | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Desk Review Name>" inside table
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"
    Examples:
      | Award Name                     | Type                      | Award EGMS ID | Desk Review Name       | Desk Review Approval Task |
      | Automation Grant Award for Post Award | Review Desk review report | AD-GREG-35     | Automation Desk Review | Approve Desk Review       |
	