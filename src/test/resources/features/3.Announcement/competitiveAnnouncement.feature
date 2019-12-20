@competitiveAnnouncements @regression
Feature: Validate all scenarios in the Competitive Announcement tab

  Background: Create Announcement
    Given I delete the record "Automation Competitive Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "ActiveFundingOpportunitiesCompitive"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"

  @announcementForPastApplicationDueDateCA @announcementWithBlankBudgetPeriodCA @submittedAnnouncementDeletionCA
  Scenario Outline: Validate that user can not enter application due date as past date || Validate that user should not submit announcement with blank budget period dates
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "SelectAnnFundingAccounts"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateAnnouncementContacts"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "SelectAnnGoals"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside flex table with id "PhasePendingTasks"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "Record Id" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Financial Tab - Correct Budget Periods Start Date and End Dates. Budget Periods should be continuous and together should form a Project Period. |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I enter value "-1" into field "ApplicationDueDate__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Application Due Date cannot be in the past. |
    And I click on "Edit" in the page details
    And I enter value "0" into field "ApplicationDueDate__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    When I perform quick search for "Record id" in "ActiveFundingOpportunitiesCompitive" panel
    Then I softly cannot see row level action button "Delete" against "Record id" in flex table with id "ActiveFundingOpportunitiesCompitive"
    And I collect all the soft asserts
    Examples:
      | Announcement Type |
      | Competitive       |

  @announcementApprovalCA
  Scenario Outline: Validate the approval of an Announcement
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "SelectAnnFundingAccounts"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateAnnouncementContacts"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "SelectAnnGoals"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside flex table with id "PhasePendingTasks"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "Record Id" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "Record id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Approve       |                   |
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Announcement Type |
      | Competitive       |

  @announcementPendingTaskPostApprovalCA @announcementCompletedTaskPostApprovalCA
  Scenario Outline: Validate that after approval of an Announcement task get deleted from pending task table || Validate that after approval of an Announcement task get added to its completed task table ||
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "SelectAnnFundingAccounts"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateAnnouncementContacts"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "SelectAnnGoals"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside flex table with id "PhasePendingTasks"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "Record Id" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Approve       |                   |
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I softly do not see values "Record Id" and "Automation Competitive Announcement" inside table
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I softly do not see values "Record Id" and "Automation Competitive Announcement" inside table
    And I collect all the soft asserts
    Examples:
      | Announcement Type |
      | Competitive       |

  @announcementPostSendBackCheckFieldHistoryCA @announcementSendBackPendingTaskToOwnerCA @announcementSendBackToOwnerCA
  Scenario Outline: Validate the send back functionality of an Announcement || Validate the field history after send back of an announcement || Validate that after send back from approvers owner should not get pending task
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "SelectAnnFundingAccounts"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateAnnouncementContacts"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "SelectAnnGoals"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside flex table with id "PhasePendingTasks"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "Record Id" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Send to Owner | Continue          |
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "History" sub tab
    Then I softly see that "Announcement" is in "Created" status
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I softly do not see values "Record Id" and "Automation Competitive Announcement" inside table
    And I collect all the soft asserts
    Examples:
      | Announcement Type |
      | Competitive       |

  @65080 @VerifyDraftAnnouncementIsNotDisplayedForSRUer @keerti
  Scenario Outline: Verify Draft announcement is not displayed at SR user end.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "SelectAnnFundingAccounts"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateAnnouncementContacts"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "SelectAnnGoals"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside flex table with id "PhasePendingTasks"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "Record Id" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I perform quick search for "Record Id" in "popupflextable" panel
    Then I do not see value "Record Id" for title "Announcement ID" inside table "popupflextable"
    Examples:
      | Announcement Type |
      | Competitive       |

  @announcementRejectPendingTaskForNextApproverCA @announcementPostRejectionCheckInListViewCA @announcementPostRejectCompletedTaskForUserCA @announcementPostRejectPendingTaskForUserCA
  Scenario Outline: Validate that after rejection of an Announcement task get added to it's completed task table. || Validate that after rejection from 1st approver, 2nd user should not get pending task || Validate that after rejection of an Announcement task get deleted from pending task table.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "SelectAnnFundingAccounts"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateAnnouncementContacts"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "SelectAnnGoals"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside flex table with id "PhasePendingTasks"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    Given I am on "INTERNAL" portal
    When I login as "EXE" user
    And I navigate to "Announcements" tab
    And I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    When I perform quick search for "Record Id" in "<Active Funding Opportunities id>" panel
    When I click on "View" icon for "Record Id" inside flex table with id "<Active Funding Opportunities id>"
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Disapprove" in approval decision
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I softly do not see values "Record Id" and "Automation Competitive Announcement" inside table
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I softly do not see value "Record Id" for title "EGMS ID" inside table "PhasePendingTasks"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Rejected Competitive Announcements"
    And I perform quick search for "Record id" in "ActiveFundingOpportunitiesCompitive" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "ActiveFundingOpportunitiesCompitive"
    And I collect all the soft asserts
    Examples:
      | Announcement Type | Active Funding Opportunities id     |
      | Competitive       | ActiveFundingOpportunitiesCompitive |