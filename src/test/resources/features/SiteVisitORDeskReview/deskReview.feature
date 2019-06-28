@deskReview @regression
Feature: Validate all scenarios in Desk Review

  Background: Create Desk Review
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "SubawardS" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"

  @51010 @deskReviewCreation @smoke
  Scenario: Creation of Desk Review
    Then I see status in Progress-bar is "Created" and is "green"

  @51011 @deskReviewEdition
  Scenario: Edition of Desk Review
    When I click on "Edit" in the page details
    And I enter value "Automation Description" into field "fieldDescription__c"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51012 @participantAssociationDeskReview
  Scenario Outline: Participant Association of Desk Review
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    Then I see that "<Subrecipient>" has been added in flextable with Id "---deskreview:-:participants_Table_Id---"
    Examples:
      | Subrecipient   |
      | Automation SPA |

  @51013 @approverSelectionDeskReview
  Scenario Outline: Approver selection of Desk Review
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Then I see that "<Program Approver Name>" has been added in flextable with Id "---deskreview:-:approver_DeskReview_TableId---"
    Examples:
      | Program Approver Name |
      | Automation PM         |

  @51014 @notifySubrecipientDeskReview @smoke
  Scenario: Notify Subrecipient about the Desk Review
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    Then I see that "Automation Desk Review" is in "Notified" status

  @51015 @notifyPendingTaskForSubrecipientDeskReview
  Scenario: Subrecipient pending task check for Desk Review
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    Then I see that "Automation Desk Review" is in "Notified" status

  @51016 @conductDeskReview
  Scenario: Conduct Desk Review
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    When I click on "Conduct" in the page details
    Then I see status in Progress-bar is "In Progress" and is "green"

  @51017 @addingOutcomeDeskReview @smoke
  Scenario: Adding outcomes to Desk Review
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:corrective_Table_Id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I see that "Automation Finding" has been added in flextable with Id "---deskreview:-:corrective_Table_Id---"

  @51018 @formFillingDeskReview
  Scenario: Filling up of form in Desk Review
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:corrective_Table_Id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---deskreview:-:reports_Table_Id---"
    Then I see that "100.00%" has been added in flextable with Id "---deskreview:-:reports_Table_Id---"

  @51019 @submittingForApprovalDeskReview
  Scenario: Submitting Desk Review for approval
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:corrective_Table_Id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---deskreview:-:reports_Table_Id---"
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  @51020 @approvalOfDeskReview @smoke
  Scenario: Approval of Desk Review
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:corrective_Table_Id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---deskreview:-:reports_Table_Id---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"

  @51021 @deskReviewSendToSubrecipient
  Scenario: Send Desk Review to Subrecipient
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:corrective_Table_Id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---deskreview:-:reports_Table_Id---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"

  @51022 @deskReviewCorrectiveActionsBySubrecipient @smoke
  Scenario: Corrective Actions By Subrecipient
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:corrective_Table_Id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---deskreview:-:reports_Table_Id---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    And I pause execution
    When I enter the following values into flex table with id "---deskreview:-:deskReview_corrective_Table_Id---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReview_corrective_Table_Id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReview_corrective_Table_Id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    Then I see that "Automation Desk Review" is in "Sent to Subrecipient" status

  @51023 @deskReviewSubmitToGrantorBySubrecipient
  Scenario: Desk Review Submit to Grantor By Subrecipient
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:corrective_Table_Id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---deskreview:-:reports_Table_Id---"
    And I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReview_corrective_Table_Id---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReview_corrective_Table_Id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReview_corrective_Table_Id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @51024 @deskReviewAcceptAndClose @smoke
  Scenario: Desk Review Accept and Close
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approver_DeskReview_TableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "Automation SPA" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:corrective_Table_Id---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reports_Table_Id---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---deskreview:-:reports_Table_Id---"
    And I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReview_corrective_Table_Id---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReview_corrective_Table_Id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReview_corrective_Table_Id---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "inlineEditGridDeskReviewGridView" panel
    And I click on "View" icon for "Record Id" inside table
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"